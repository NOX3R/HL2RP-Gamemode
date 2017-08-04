ITEM.Name = "Meth Stove"
ITEM.Description = "We have to COOK."
ITEM.Model = "models/props_c17/furnitureStove001a.mdl"
ITEM.Base = "base_darkrp"

function ITEM:SaveData( ent )
	self:SetData( "Owner", ent:Getowning_ent() )
	self:SetData( "Damage", ent.damage )
end

function ITEM:LoadSave( ent )
	ent:Setowning_ent( self:GetData( "Owner" ) )
	
	timer.Simple( 0, function()
		ent.damage = self:GetData( "Damage" )
	end )
end