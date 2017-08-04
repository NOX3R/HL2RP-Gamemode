itemstore.data = {}
itemstore.data.Providers = {}

for _, filename in ipairs( file.Find( "itemstore/dataproviders/*.lua", "LUA" ) ) do
	local name = string.match( filename, "^(.+).lua$" )

	if ( name ) then
		PROVIDER = {}
		PROVIDER.UniqueName = name

		include( "itemstore/dataproviders/" .. filename )

		itemstore.data.Providers[ name ] = PROVIDER

		PROVIDER = nil
	end
end

--CreateConVar( "itemstore_data_provider", "text", FCVAR_ARCHIVE )
CreateConVar( "itemstore_inventory_persist", 1, FCVAR_ARCHIVE )
CreateConVar( "itemstore_bank_persist", 1, FCVAR_ARCHIVE )

for _, dir in ipairs( { "itemstore/", "itemstore/banks/", "itemstore/banks/maps/" } ) do
	if not ( file.IsDir( dir, "DATA" ) ) then
		file.CreateDir( dir )
	end
end

function itemstore.data.GetProvider()
	return itemstore.data.Providers[ itemstore.config.DataProvider ]
end

function itemstore.data.Get( key )
	local provider = itemstore.data.GetProvider()

	if ( provider ) then
		return provider[ key ]
	end
end

function itemstore.data.Run( funcname, ... )
	local func = itemstore.data.Get( funcname )

	if ( func ) then
		return func( itemstore.data.GetProvider(), ... )
	end
end

function itemstore.data.Initialize()
	itemstore.data.Run( "Initialize" )
end

function itemstore.data.LoadPlayerInventory( pl )
	itemstore.data.Run( "LoadPlayerInventory", pl )
end

function itemstore.data.SavePlayerInventory( pl )
	if ( GetConVarNumber( "itemstore_inventory_persist" ) ~= 0 ) then
		itemstore.data.Run( "SavePlayerInventory", pl )
	end
end

function itemstore.data.LoadPlayerBank( pl, bank )
	itemstore.data.Run( "LoadPlayerBank", pl, bank )
end

function itemstore.data.SavePlayerBank( pl, bank )
	if ( GetConVarNumber( "itemstore_bank_persist" ) ~= 0 ) then
		itemstore.data.Run( "SavePlayerBank", pl, bank )
	end
end

function itemstore.data.FullSave()
	itemstore.data.Run( "FullSave" )
end

function itemstore.data.LoadBanks()
	local path = "itemstore/banks/maps/" .. game.GetMap() .. ".txt"
	local data = file.Read( path, "DATA" )

	if ( data ) then
		local banks = util.JSONToTable( data )

		if ( banks ) then
			return banks
		end
	end
end

function itemstore.data.SaveBanks()
	local path = "itemstore/banks/maps/" .. game.GetMap() .. ".txt"

	local data = {}
	for _, ent in ipairs( ents.FindByClass( "itemstore_bank" ) ) do
		local bank = {}
		bank.Position = ent:GetPos()
		bank.Angles = ent:GetAngles()

		table.insert( data, bank )
	end

	file.Write( path, util.TableToJSON( data ) )
end

hook.Add( "PlayerDisconnected", "ItemStoreSaveItems", function( pl )
	itemstore.data.FullSave()
end )

hook.Add( "ShutDown", "ItemStoreSaveItems", function()
	itemstore.data.FullSave()
end )

timer.Create( "ItemStoreSaveInventories", 60, 0, function()
	itemstore.data.FullSave()
end )

concommand.Add( "itemstore_data_initialize", function()
	itemstore.data.Initialize()
end )

itemstore.data.Initialize()
