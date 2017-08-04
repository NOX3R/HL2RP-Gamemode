ITEM.Name = "Entity Item Base"
ITEM.Description = "Yep!"
ITEM.Model = "models/error.mdl"

function ITEM:Load()
	self:RegisterPickup( self.UniqueName )
end

function ITEM:SpawnEntity( pos )
	local ent = ents.Create( self.UniqueName )
	ent:SetPos( pos )
	
	return ent
end