ITEM.Name = "Drugs"
ITEM.Description = "Duuuuuuuude"
ITEM.Model = "models/props_lab/jar01a.mdl"
ITEM.Base = "base_darkrp"
ITEM.Stackable = true

function ITEM:SaveData( ent )
	self:SetData( "Price", ent:Getprice() )
	self:SetData( "Owner", ent:Getowning_ent() )
end

function ITEM:LoadData( ent )
	ent:Setprice( self:GetData( "Price" ) )
	ent:Setowning_ent( self:GetData( "Owner" ) )
end