ITEM.Name = "Microwave"
ITEM.Description = "Why is it always burning hot on the outside but freezing in the middle!?"
ITEM.Model = "models/props/cs_office/microwave.mdl"
ITEM.Base = "base_darkrp"

function ITEM:SaveData( ent )
	self:SetData( "Price", ent:Getprice() )
	self:SetData( "Owner", ent:Getowning_ent() )
end

function ITEM:LoadData( ent )
	ent:Setprice( self:GetData( "Price" ) )

	local owner = self:GetData( "Owner" )
	if not IsValid( owner ) then
		owner = player.GetAll()[ 1 ]
	end

	ent:Setowning_ent( owner )
end