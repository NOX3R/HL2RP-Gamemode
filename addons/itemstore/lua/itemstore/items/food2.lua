ITEM.Name = "Ration"
ITEM.Description = "Un petit paquet avec de la nourriture, de l'eau et une petite liasse de tokens à l'intérieur."
ITEM.Model = "models/weapons/w_package.mdl"
ITEM.Base = "base_darkrp"
ITEM.Stackable = true

function ITEM:SaveData( ent )
	self:SetData( "Owner", ent:Getowning_ent() )
end

function ITEM:LoadData( ent )
	ent:Setowning_ent( self:GetData( "Owner" ) )
end