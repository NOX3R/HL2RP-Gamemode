ITEM.Name = "Food"
ITEM.Description = "Nom.\n\nNutritional value: %d"
ITEM.Model = "models/props_junk/watermelon01.mdl"
ITEM.Base = "base_darkrp"

function ITEM:GetDescription()
	return string.format( self.Description, self:GetData( "Nutrition" ) )
end

function ITEM:GetModel()
	return self:GetData( "Model" )
end

function ITEM:SaveData( ent )
	self:SetData( "Owner", ent:Getowning_ent() )
	self:SetData( "Nutrition", ent.FoodEnergy )
	self:SetData( "Model", ent:GetModel() )
end

function ITEM:LoadData( ent )
	ent:Setowning_ent( self:GetData( "Owner" ) )
	ent:SetModel( self:GetData( "Model" ) )
	ent.FoodEnergy = self:GetData( "Nutrition" )
end