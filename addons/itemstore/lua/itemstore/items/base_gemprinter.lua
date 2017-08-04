ITEM.Name = "Gemstone Money Printer Base"
ITEM.Description = "A powered-up money printer.\n\nStored Money: $%d"
ITEM.Model = "models/props_c17/consolebox01a.mdl"
ITEM.Base = "base_darkrp"

function ITEM:GetDescription()
	return string.format( self.Description, self:GetData( "StoredMoney" ) or 0 )
end

function ITEM:ModifyEntity( ent )
	ent:SetColor( self.Colour or Color( 255, 255, 255 ) )
end

function ITEM:SaveData( ent )
	self:SetData( "StoredMoney", ent:GetNWInt( "PrintA" ) )
	self:SetData( "Price", ent:Getprice() )
	self:SetData( "Owner", ent:Getowning_ent() )
end

function ITEM:LoadData( ent )
	ent:Setprice( self:GetData( "Price" ) )
	ent:Setowning_ent( self:GetData( "Owner" ) )
	
	timer.Simple( 0, function()
		ent:SetNWInt( "PrintA", self:GetData( "StoredMoney" ) )
	end )
end