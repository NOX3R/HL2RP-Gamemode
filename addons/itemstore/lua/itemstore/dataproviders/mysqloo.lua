local PROVIDER = PROVIDER

local auth = {
	Host = "127.0.0.1",
	Port = 3306,
	Username = "root",
	Password = "",
	Database = "itemstore"
}

PROVIDER.Connected = false
PROVIDER.Queries = {}

function PROVIDER:Log( text )
	print( "[ItemStore MySQL] " .. text )
	file.Append( "itemstore/mysql.txt", os.date( "[%c]" ) .. " " .. text .. "\r\n" )
end

function PROVIDER:Initialize()
	require( "mysqloo" )

	PROVIDER.Database = mysqloo.connect( auth.Host, auth.Username, auth.Password, auth.Database, auth.Port )

	PROVIDER.Database.onConnected = function( db )
		self.Connected = true

		--for _, v in ipairs( PROVIDER.Queries ) do
		while ( #PROVIDER.Queries > 0 ) do
			local query = table.remove( PROVIDER.Queries, 1 )
			self:Query( query[ 1 ], query[ 2 ], unpack( query[ 3 ] ) )
		end

		self:Query( "CREATE TABLE IF NOT EXISTS Items ( Slot INT, Player VARCHAR( 255 ) NOT NULL, Class VARCHAR( 255 ) NOT NULL, Data TEXT, PRIMARY KEY ( Slot, Player ) )" )
		self:Query( "CREATE TABLE IF NOT EXISTS BankItems ( Slot INT, Player VARCHAR( 255 ) NOT NULL, Class VARCHAR( 255 ) NOT NULL, Data TEXT, PRIMARY KEY ( Slot, Player ) )" )

		self:Log( "Connection succesful!" )
	end

	PROVIDER.Database.onConnectionFailed = function( db, err )
		PROVIDER:Log( "Connection failed: " .. err )

		self.Connected = false

		timer.Simple( 10, function()
			db:connect()
		end )
	end

	self:Log( "Connecting to database..." )

	PROVIDER.Database:connect()
end

function PROVIDER:Query( sql, callback, ... )
	if ( self.Database and self.Connected ) then
		local args = {}
		for _, val in ipairs( { ... } ) do
			val = tostring( val )
			val = self.Database:escape( val )

			table.insert( args, val )
		end

		local formatted = string.format( sql, unpack( args ) )
		local query = self.Database:query( formatted )
		query.onSuccess = function( query, data )
			if ( callback ) then
				callback( data )
			end
		end

		query.onError = function( query, err )
			if ( self.Database:status() == mysqloo.DATABASE_NOT_CONNECTED ) then
				table.insert( self.Queries, { formatted, callback, {} } )
				self.Database:connect()

				self.Connected = false

				self:Log( "Lost connection to server, reconnecting..." )
			else
				self:Log( "Query failed: " .. err )
			end
		end

		query:start()
	else
		self:Log( "Query attempted while disconnected." )
		table.insert( self.Queries, { sql, callback, { ... } } )
	end
end

function PROVIDER:LoadPlayerInventory( pl )
	self:Query( "SELECT * FROM Items WHERE Player = '%s'", function( items )
		if ( IsValid( pl ) ) then
			for _, itemdat in ipairs( items ) do
				local item = itemstore.items.New( itemdat.Class, util.JSONToTable( itemdat.Data ) )

				pl:SetItem( item, itemdat.Slot )
			end

			pl:GetInventory():Sync()
			pl.InventoryLoaded = true
		end
	end, pl:SteamID() )
end

function PROVIDER:SavePlayerInventory( pl )
	-- Clear out the tables entirely first
	if ( pl.InventoryLoaded ) then
		self:Query( "DELETE FROM Items WHERE Player = '%s'", nil, pl:SteamID() )

		for slot, item in pairs( pl:GetInventory().Items ) do
			local data = util.TableToJSON( item.Data )
			self:Query( "INSERT INTO Items( Slot, Player, Class, Data ) VALUES( %s, '%s', '%s', '%s' ) ON DUPLICATE KEY UPDATE Class = '%s', Data = '%s'", nil, slot, pl:SteamID(), item.UniqueName, data, item.UniqueName, data )
		end
	end
end

function PROVIDER:LoadPlayerBank( pl, bank )
	self:Query( "SELECT * FROM BankItems WHERE Player = '%s'", function( items )
		if ( IsValid( pl ) and IsValid( bank ) ) then
			local acc = bank.Inventories[ pl ]

			for _, itemdat in ipairs( items ) do
				local item = itemstore.items.New( itemdat.Class, util.JSONToTable( itemdat.Data ) )

				acc:SetItem( item, item.Slot )
			end

			acc:Sync()
			pl.BankLoaded = true
		end
	end, pl:SteamID() )
end

function PROVIDER:SavePlayerBank( pl, bank )
	local acc = bank.Inventories[ pl ]

	if ( acc and pl.BankLoaded ) then
		self:Query( "DELETE FROM BankItems WHERE Player = '%s'", nil, pl:SteamID() )

		for slot, item in pairs( acc.Items ) do
			local data = util.TableToJSON( item.Data )
			self:Query( "INSERT INTO BankItems( Slot, Player, Class, Data ) VALUES( %s, '%s', '%s', '%s' ) ON DUPLICATE KEY UPDATE Class = '%s', Data = '%s'", nil, slot, pl:SteamID(), item.UniqueName, data, item.UniqueName, data )
		end
	end
end

function PROVIDER:FullSave()
	self:Query( "START TRANSACTION" )

	for _, pl in ipairs( player.GetAll() ) do
		itemstore.data.SavePlayerInventory( pl )

		local bank = ents.FindByClass( "itemstore_bank" )[ 1 ]
		if ( IsValid( bank ) ) then
			itemstore.data.SavePlayerBank( pl, bank )
		end
	end

	self:Query( "COMMIT" )
end

CreateConVar( "itemstore_mysqloo_migrate", 0, FCVAR_ARCHIVE )
hook.Add( "PlayerAuthed", "ItemStoreMySQLOOMigration", function( pl, steamid, uniqueid )
	if ( itemstore.config.DataProvider == "mysqloo" and GetConVarNumber( "itemstore_mysqloo_migrate" ) ~= 0 ) then
		local data = file.Read( "itemstore/" .. uniqueid .. ".txt", "DATA" )

		PROVIDER:Query( "START TRANSACTION" )

		if ( data ) then
			local json = util.JSONToTable( data )

			if ( json ) then
				PROVIDER:Query( "DELETE FROM Items WHERE Player = '%s'", nil, pl:SteamID() )

				for slot, item in pairs( json ) do
					local class = item.UniqueName
					local data = util.TableToJSON( item.Data )

					pl:GetInventory():SetItem( itemstore.items.New( class, item.Data ), slot )

					PROVIDER:Query( "INSERT INTO Items( Slot, Player, Class, Data ) VALUES( %s, '%s', '%s', '%s' ) ON DUPLICATE KEY UPDATE Class = '%s', Data = '%s'", nil, slot, pl:SteamID(), class, data, class, data )
				end
			end
		end

		file.Delete( "itemstore/" .. uniqueid .. ".txt" )

		local data = file.Read( "itemstore/banks/" .. uniqueid .. ".txt", "DATA" )

		if ( data ) then
			local json = util.JSONToTable( data )

			if ( json ) then
				PROVIDER:Query( "DELETE FROM BankItems WHERE Player = '%s'", nil, pl:SteamID() )

				for slot, item in pairs( json ) do
					local class = item.UniqueName
					local data = util.TableToJSON( item.Data )

					PROVIDER:Query( "INSERT INTO BankItems( Slot, Player, Class, Data ) VALUES( %s, '%s', '%s', '%s' ) ON DUPLICATE KEY UPDATE Class = '%s', Data = '%s'", nil, slot, pl:SteamID(), class, data, class, data )
				end
			end
		end

		PROVIDER:Query( "COMMIT" )

		file.Delete( "itemstore/banks/" .. uniqueid .. ".txt" )
	end
end )
