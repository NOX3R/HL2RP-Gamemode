ITEM.Name = "Money Printer"
ITEM.Description = "Dealing out that cash money"
ITEM.Model = "models/props_c17/consolebox01a.mdl"
ITEM.Base = "base_darkrp"

function ITEM:SaveData( ent )
	self:SetData( "Price", ent:Getprice() )
	self:SetData( "Owner", ent:Getowning_ent() )
end

function ITEM:LoadData( ent )
	ent:Setprice( self:GetData( "Price" ) )
	ent:Setowning_ent( self:GetData( "Owner" ) )
end