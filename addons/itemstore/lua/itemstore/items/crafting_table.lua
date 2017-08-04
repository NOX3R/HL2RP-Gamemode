ITEM.Name = "Crafting Table"
ITEM.Description = "A table for crafting stuff."
ITEM.Model = "models/props_wasteland/controlroom_desk001b.mdl"
ITEM.Base = "base_darkrp"

function ITEM:SaveData( ent )
	self:SetData( "Damage", ent.damage )
	
	self:SetData( "Wood", ent:GetNWFloat( "Wood" ) )
	self:SetData( "Iron", ent:GetNWFloat( "Iron" ) )
	self:SetData( "Spring", ent:GetNWFloat( "Spring" ) )
	self:SetData( "Wrench", ent:GetNWFloat( "Wrench" ) )
end

function ITEM:LoadData( ent )
	ent.damage = self:GetData( "Damage" )
	
	timer.Simple( 0, function()
		ent:SetNWFloat( "Wood", self:GetData( "Wood" ) )
		ent:SetNWFloat( "Iron", self:GetData( "Iron" ) )
		ent:SetNWFloat( "Spring", self:GetData( "Spring" ) )
		ent:SetNWFloat( "Wrench", self:GetData( "Wrench" ) )
	end )
end