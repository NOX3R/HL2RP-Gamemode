ITEM.Name = "Uncooked Meth"
ITEM.Description = "Durgz.\n\nTime left: %ds"
ITEM.Model = "models/props_c17/oildrum001.mdl"
ITEM.Base = "base_entity"

function ITEM:ModifyEntity( ent )
	ent:SetColor( Color( 150, 150, 150 ) )
	ent:SetMaterial( "models/debug/debugwhite" )
end

function ITEM:GetDescription()
	return string.format( self.Description, self:GetData( "Timer" ) )
end

function ITEM:SaveData( ent )
	self:SetData( "Damage", ent.damage )
	self:SetData( "Timer", ent:GetMethTimer() )
end

function ITEM:LoadData( ent )
	-- what the fuck is with you and defaulting values jfc
	timer.Simple( 0, function()
		ent:SetMethTimer( self:GetData( "Timer" ) )
		ent.damage = self:GetData( "Damage" )
	end )
end