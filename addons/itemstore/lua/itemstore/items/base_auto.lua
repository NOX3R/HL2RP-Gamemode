ITEM.Name = "Auto Item Base"
ITEM.Description = "Yep!"
ITEM.Model = "models/error.mdl"
ITEM.Base = "base_entity"

function ITEM:GetModel()
	return self:GetData( "Model" )
end

-- Hey I managed to get this stupid shit to work right.

function ITEM:SaveData( ent )
	self:SetData( "Model", ent:GetModel() )
	self:SetData( "EntityData", duplicator.CopyEntTable( ent ) )
end

function ITEM:LoadData( ent )
	local data = self:GetData( "EntityData" )
	data.Pos = nil
	data.Angle = nil
	
	duplicator.DoGeneric( ent, data )
	
	if ( data.DT ) then
		timer.Simple( 0, function()
			for k, v in pairs( data.DT ) do
				ent.dt[ k ] = v
			end
		end )
	end
end