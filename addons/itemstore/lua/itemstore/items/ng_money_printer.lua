ITEM.Name = "Money Printer" 
ITEM.Description = "An upgradable money printer."
ITEM.Model = "models/props_c17/consolebox01a.mdl"
ITEM.Base = "base_darkrp" 

function ITEM:SaveData( ent )
	self:SetData( "Experience", ent.Experience )
	self:SetData( "Level", ent.Level )
	self:SetData( "StoredMoney", ent.StoredMoney )
	self:SetData( "Multiplier", ent.Multiplier )
	self:SetData( "Temperature", ent.Temperature )

	self:SetData( "HasCooler", ent.HasCooler )
	self:SetData( "HasTuner", ent.HasTuner )
	self:SetData( "HasOverclocker", ent.HasOverclocker )
	self:SetData( "IsTurnedOn", ent.IsTurnedOn )
end

local function attach( ent, model, offset )
	local pos, ang = LocalToWorld( offset, Angle( 0, 0, 0 ), ent:GetPos(), ent:GetAngles() )

	local attach = ents.Create( "prop_physics" )
	attach:SetModel( model )
	attach:SetPos( pos )
	attach:SetAngles( ang )
	attach:Spawn()
	attach:SetParent( ent )
	attach:SetCollisionGroup( COLLISION_GROUP_WORLD )
	
	return attach
end

function ITEM:LoadData( ent )
	timer.Simple( 0, function()
		ent.Experience = self:GetData( "Experience" )
		ent.Level = self:GetData( "Level" )
		ent.StoredMoney = self:GetData( "StoredMoney" )
		ent.Multiplier = self:GetData( "Multiplier" )
		ent.Temperature = self:GetData( "Temperature" )

		ent.HasCooler = self:GetData( "HasCooler" )
		
		if ( ent.HasCooler ) then
			ent.Cooler = attach( ent, "models/props_lab/reciever01a.mdl", Vector( 10, -3.5, 7 ) )
		end
		
		ent.HasTuner = self:GetData( "HasTuner" )
		
		if ( ent.HasTuner ) then
			ent.Tuner = attach( ent, "models/props_lab/reciever01d.mdl", Vector( 10.5, -9, 3 ) )
		end
		
		ent.HasOverclocker = self:GetData( "HasOverclocker" )
		
		if ( ent.HasOverclocker ) then
			ent.Overclocker = attach( ent, "models/props_lab/reciever01d.mdl", Vector( 10.5, 2, 3 ) )
		end
		
		ent.IsTurnedOn = self:GetData( "IsTurnedOn" )
		
		timer.Simple( 0.25, function()
			ent:UpdateMods()
		end )
	end )
end