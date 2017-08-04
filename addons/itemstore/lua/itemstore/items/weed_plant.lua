ITEM.Name = "Weed Plant"
ITEM.Description = "A plant that grows weed!"
ITEM.Model = "models/props/cs_office/plant01.mdl"
ITEM.Base = "base_darkrp"

function ITEM:SaveData( ent )
	self:SetData( "Owner", ent:Getowning_ent() )
	self:SetData( "BadLevel", ent:GetBadLevel() )
	self:SetData( "PlantLevel", ent:GetPlantLevel() )
	self:SetData( "Price", ent:GetPrice() )
end

function ITEM:LoadData( ent )
	ent:Setowning_ent( self:GetData( "Owner" ) )
	ent:SetPrice( self:GetData( "Price" ) )
	
	-- all of my hate towards the people who default their values in init
	timer.Simple( 0, function()
		ent:SetBadLevel( self:GetData( "BadLevel" ) )
		ent:SetPlantLevel( self:GetData( "PlantLevel" ) )
		
		if ( self:GetData( "PlantLevel" ) <= 5 ) then
			timer.Destroy( "LevelUp" .. tostring( ent:EntIndex() ) )
		end
	end )
end