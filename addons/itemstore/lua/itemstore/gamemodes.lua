itemstore.gamemodes = {}
itemstore.gamemodes.Registered = {}

function itemstore.gamemodes.Load()
	for _, filename in ipairs( file.Find( "itemstore/gamemodes/*.lua", "LUA" ) ) do
		local name = string.match( filename, "^(.+).lua$" )

		if ( name ) then
			GAMEMODE_DEF = {}
			GAMEMODE_DEF.GamemodeName = name

			if SERVER then AddCSLuaFile( "itemstore/gamemodes/" .. filename ) end
			include( "itemstore/gamemodes/" .. filename )

			itemstore.gamemodes.Registered[ name ] = GAMEMODE_DEF

			GAMEMODE_DEF = nil
		end
	end
end
itemstore.gamemodes.Load()

function itemstore.gamemodes.Run( funcname, ... )
	local gamemode = itemstore.gamemodes.Registered[ itemstore.config.Gamemode ]
	
	if ( gamemode ) then
		local func = gamemode[ funcname ]
		
		if ( func ) then
			return func( gamemode, ... )
		end
	end
end

-- some convenience functions
function itemstore.gamemodes.GetMoney( pl )
	return itemstore.gamemodes.Run( "GetMoney", pl )
end

if SERVER then
	function itemstore.gamemodes.SetMoney( pl, money )
		return itemstore.gamemodes.Run( "SetMoney", pl, money )
	end

	function itemstore.gamemodes.GiveMoney( pl, money )
		return itemstore.gamemodes.SetMoney( pl, itemstore.gamemodes.GetMoney( pl ) + money )
	end

	function itemstore.gamemodes.AddCommand( command, info, func )
		return itemstore.gamemodes.Run( "AddCommand", command, info, func )
	end

	itemstore.gamemodes.AddCommand( "trade", "Initiates a trade with another player.", function( pl, args )
		local target = pl:GetEyeTrace().Entity
		
		if ( args ~= "" ) then
			for _, findpl in ipairs( player.GetAll() ) do
				if ( IsValid( findpl ) and findpl ~= pl and string.find( string.lower( findpl:Name() ), string.lower( args ) ) ) then
					target = findpl
					break
				end
			end
		end
		
		if ( IsValid( target ) and target:IsPlayer() ) then
			itemstore.trading.Start( pl, target )
		else
			pl:ChatPrint( "Couldn't initialize trade: no player with that name." )
		end
	end )

	itemstore.gamemodes.AddCommand( "inv", "Opens your inventory.", function( pl )
		local w, h = unpack( pl:GetInventoryDimensions() )
		itemstore.containers.Open( pl, pl:GetInventory(), "Inventory", w, h, true ) 
		
		return ""
	end )
	
	itemstore.gamemodes.AddCommand( "pickup", "Picks an item up.", function( pl )
		pl:PickupItem()
		return ""
	end )
end