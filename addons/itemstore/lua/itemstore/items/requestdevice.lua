ITEM.Name = "Requête Civile"
ITEM.Description = "Un dispositif utilisé pour communiquer avec la Protection Civile."
ITEM.Model = "models/gibs/shield_scanner_gib1.mdl"
ITEM.Base = "base_darkrp"
ITEM.Stackable = false

function ITEM:SaveData( ent )
	self:SetData( "Owner", ent:Getowning_ent() )
end

function ITEM:LoadData( ent )
	ent:Setowning_ent( self:GetData( "Owner" ) )
end