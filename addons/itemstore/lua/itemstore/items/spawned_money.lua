ITEM.Name = "Money"
ITEM.Description = "Lods of emone.\n\nAmount: $%d"
ITEM.Model = "models/props/cs_assault/money.mdl"
ITEM.Base = "base_darkrp"

function ITEM:GetDescription()
	return string.format( self.Description, self:GetData( "Amount" ) )
end

function ITEM:CanMerge( item )
	return item.UniqueName == "spawned_money"
end

function ITEM:Merge( item )
	item:SetData( "Amount", item:GetData( "Amount" ) + self:GetData( "Amount" ) )
end

function ITEM:CanSplit( amount )
	return ( ( self:GetData( "Amount" ) or 1 ) > amount )
end

function ITEM:Use( pl )
	itemstore.gamemodes.GiveMoney( pl, self:GetData( "Amount" ) )
	return true
end

function ITEM:SaveData( ent )
	self:SetData( "Amount", ent:Getamount() )
end

function ITEM:LoadData( ent )
	ent:Setamount( self:GetData( "Amount" ) )
end