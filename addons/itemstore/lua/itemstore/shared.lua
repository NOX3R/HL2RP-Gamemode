include( "config.lua" )

-- I'm getting really sick of false bug reports. Stop fucking up your config.luas for fucks sake.
if ( not itemstore.config ) then
	print( "WARNING WARNING WARNING" )
	print( "ItemStore is NOT SET UP CORRECTLY" )
	print( "The configuration file is CORRUPT!" )
	print( "Please reset the configuration file and try agian. Be careful!" )
	
	if SERVER then
		hook.Add( "PlayerInitialSpawn", "ItemStoreWarning", function( pl )
			pl:PrintMessage( HUD_PRINTTALK, "WARNING: ITEMSTORE CONFIG IS BROKEN! RESET YOUR CONFIG AND TRY AGAIN." )
		end )
	end
end

include( "containers.lua" )
include( "items.lua" )
include( "player.lua" )
include( "trading.lua" )
--include( "darkrp.lua" )
include( "properties.lua" )
include( "admin.lua" )
include( "gamemodes.lua" )

for _, filename in ipairs( file.Find( "itemstore/vgui/*.lua", "LUA" ) ) do
	if SERVER then
		AddCSLuaFile( "itemstore/vgui/" .. filename )
	else
		include( "itemstore/vgui/" .. filename )
	end
end

local _, dirs = file.Find( "itemstore/modules/*", "LUA" )
for _, dir in ipairs( dirs ) do
	if SERVER then
		include( "itemstore/modules/" .. dir .. "/sv_init.lua" )
	else
		include( "itemstore/modules/" .. dir .. "/cl_init.lua" )
	end
end

concommand.Add( "itemstore_credits", function()
	print( "=============================================" )
	print( "                  ITEMSTORE                  " )
	print( "=============================================" )
	print( " Authored solely by UselessGhost aka Olivia" )
	print( " http://steamcommunity.com/id/uselessghost" )
	print()
	print( " Any distribution of this addon in any form" )
	print( " is to be done solely via CoderHire or with" )
	print( " express permission given only by me." )
	print()
	print( " If you have received this addon freely" )
	print( " without my permission or through any site" )
	print( " outside of CoderHire, I urge you to consider" )
	print( " purchasing it legitimately." )
end )
	