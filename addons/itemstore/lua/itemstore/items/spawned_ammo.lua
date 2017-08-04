ITEM.Name = "Ammo"
ITEM.Description = "Things that you shoot out of a gun.\n\nAmmo Type: %s\nAmount: %d"
ITEM.Base = "base_darkrp"
ITEM.DropAll = true

function ITEM:GetDescription()
	return string.format( self.Description, self:GetData( "AmmoType" ), self:GetData( "Amount" ) )
end

function ITEM:GetModel()
	return self:GetData( "Model" )
end

function ITEM:Use( pl )
	pl:GiveAmmo( self:GetData( "Amount" ), self:GetData( "AmmoType" ) )

	return true
end

function ITEM:CanMerge( item )
	return self.UniqueName == item.UniqueName and self:GetData( "AmmoType" ) == item:GetData( "AmmoType" )
end

function ITEM:Merge( item )
	item:SetData( "Amount", item:GetData( "Amount" ) + self:GetData( "Amount" ) )
end

function ITEM:CanSplit( amount )
	return ( ( self:GetData( "Amount" ) or 1 ) > amount )
end

function ITEM:SaveData( ent )
	self:SetData( "Model", ent:GetModel() )
	self:SetData( "AmmoType", ent.ammoType )
	self:SetData( "Amount", ent.amountGiven )
end

function ITEM:LoadData( ent )
	ent:SetModel( self:GetData( "Model" ) )
	ent.ammoType = self:GetData( "AmmoType" )
	ent.amountGiven = self:GetData( "Amount" )
end
