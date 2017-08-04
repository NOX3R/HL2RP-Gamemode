ITEM.Name = "Food"
ITEM.Description = "Nom."
ITEM.Model = "models/props_junk/garbage_takeoutcarton001a.mdl"
ITEM.Base = "base_darkrp"
ITEM.Stackable = true

function ITEM:SaveData( ent )
	self:SetData( "Owner", ent:Getowning_ent() )
end

function ITEM:LoadData( ent )
	ent:Setowning_ent( self:GetData( "Owner" ) )
end