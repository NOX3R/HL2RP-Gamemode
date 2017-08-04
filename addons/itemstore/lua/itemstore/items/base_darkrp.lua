ITEM.Name = "DarkRP Item Base"
ITEM.Description = "Yep!"
ITEM.Model = "models/error.mdl"
ITEM.Base = "base_entity"

function ITEM:Initialize()
	if not ( DarkRP ) then
		function self:GetName()
			return "DarkRP Item"
		end
		
		function self:GetDescription()
			return "This item will not function correctly because you are not in the proper gamemode."
		end
		
		function self:GetModel()
			return "models/error.mdl"
		end
		
		self.Use = nil
	end
end

if SERVER then
	CreateConVar( "itemstore_darkrp_ignoreowner", 1, FCVAR_ARCHIVE )
	
	function ITEM:CanPickup( pl, ent )
		if ( ent.dt and ent.dt.owning_ent ) then
			if ( GetConVarNumber( "itemstore_darkrp_ignoreowner" ) == 1 or ent:Getowning_ent() == pl ) then
				return true
			else
				pl:PrintMessage( HUD_PRINTTALK, "That entity doesn't belong to you!" )
				return false
			end
		end
		
		return true
	end
end