include( "shared.lua" )

include( "sv_resources.lua" )
include( "sv_data.lua" )

-- Really hilariously hacky bugfix to a Source engine quirk.
if not ( itemstore.config.DisableAntidupe ) then
	local meta = FindMetaTable( "Entity" )
	local oldRemove = meta.Remove
	
	function meta:Remove()
		self.__Deleted = true
		oldRemove( self )
	end
	
	hook.Add( "PlayerUse", "ItemStoreDupeFix", function( pl, ent )
		if ( IsValid( ent ) and ent.__Deleted ) then
			return false
		end
	end )
end