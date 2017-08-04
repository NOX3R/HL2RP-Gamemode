
AddCSLuaFile("")

ENT.Type = "anim"
ENT.Base = "base_gmodentity"

function ENT:Initialize()
	if SERVER then
	self.dt.owning_ent:Give('weapon_shield')
	self:Remove() 
	end
end


