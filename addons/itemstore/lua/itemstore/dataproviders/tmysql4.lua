local PROVIDER = PROVIDER

local auth = {
	Host = "127.0.0.1",
	Port = 3306,
	Username = "root",
	Password = "",
	Database = "ItemStore"
}

PROVIDER.Connected = false
PROVIDER.Queries = {}

function PROVIDER:Log( text )
	print( "[ItemStore MySQL] " .. text )
	file.Append( "itemstore/mysql.txt", os.date( "[%c]" ) .. " " .. text .. "\r\n" )
end

function PROVIDER:Connect()
	local db, error = tmysql.initialize( auth.Host, auth.Username, auth.Password, auth.Database, auth.Port )
	
	if ( error ) then
		PROVIDER:ConnectionError( error )
	else
		PROVIDER.Database = db
		PROVIDER:Connected()
	end
end

function PROVIDER:Connected()
	self.Connected = true
	
	self:Log( "Connection succesful!" )
	
	--for _, v in ipairs( PROVIDER.Queries ) do
	while ( #PROVIDER.Queries > 0 ) do
		local query = table.remove( PROVIDER.Queries, 1 )
		self:Query( query[ 1 ], query[ 2 ], unpack( query[ 3 ] ) )
	end

	self:Query( "CREATE TABLE IF NOT EXISTS Items ( Slot INT, Player VARCHAR( 255 ) NOT NULL, Class VARCHAR( 255 ) NOT NULL, Data TEXT, PRIMARY KEY ( Slot, Player ) )" )
	self:Query( "CREATE TABLE IF NOT EXISTS BankItems ( Slot INT, Player VARCHAR( 255 ) NOT NULL, Class VARCHAR( 255 ) NOT NULL, Data TEXT, PRIMARY KEY ( Slot, Player ) )" )
end

function PROVIDER:ConnectionError( error )
	PROVIDER:Log( "Connection failed: " .. error )

	self.Connected = false

	timer.Simple( 10, function()
		self:Connect()
	end )
end

function PROVIDER:Initialize()
	require( "tmysql4" )
	self:Log( "Connecting to database..." )
	
	self:Connect()
end

function PROVIDER:Query( sql, callback, ... )
	if ( self.Database and self.Connected ) then
		local args = {}
		for _, val in ipairs( { ... } ) do
			val = tostring( val )
			val = tmysql.escape( val )

			table.insert( args, val )
		end

		local formatted = string.format( sql, unpack( args ) )
		local query = self.Database:Query( formatted, function( result, status, error )
			if ( status ) then
				if ( callback ) then
					callback( result )
				end
			else
				-- tmysql might handle this shit on it's own..?
				--[[if ( self.Database:status() == mysqloo.DATABASE_NOT_CONNECTED ) then
					table.insert( self.Queries, { formatted, callback, {} } )
					self.Database:connect()

					self.Connected = false

					self:Log( "Lost connection to server, reconnecting..." )
				else]]
					self:Log( "Query failed: " .. error )
				--end
			end
		end, QUERY_FLAG_ASSOC )

		--query:start()
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

				pl:SetItem( item, tonumber( itemdat.Slot ) )
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
		print( pl )
		itemstore.data.SavePlayerInventory( pl )

		local bank = ents.FindByClass( "itemstore_bank" )[ 1 ]
		if ( IsValid( bank ) ) then
			itemstore.data.SavePlayerBank( pl, bank )
		end
	end

	self:Query( "COMMIT" )
end

CreateConVar( "itemstore_tmysql4_migrate", 0, FCVAR_ARCHIVE )
hook.Add( "PlayerAuthed", "ItemStoreTMySQL4Migration", function( pl, steamid, uniqueid )
	if ( itemstore.config.DataProvider == "tmysql4" and GetConVarNumber( "itemstore_tmysql4_migrate" ) ~= 0 ) then
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
