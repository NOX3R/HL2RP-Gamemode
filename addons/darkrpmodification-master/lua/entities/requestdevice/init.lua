AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/gibs/shield_scanner_gib1.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()

	phys:Wake()

	self.damage = 10
end

function ENT:OnTakeDamage(dmg)
	self.damage = self.damage - dmg:GetDamage()

	if (self.damage <= 0) then
		local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos())
		effectdata:SetMagnitude(2)
		effectdata:SetScale(2)
		effectdata:SetRadius(3)
		util.Effect("Sparks", effectdata)
		self:Remove()
	end
end


local NextPrintTime = 0
function ENT:Use(activator,caller)


    if (CurTime() >= NextPrintTime) then
	umsg.Start("Openpls",activator)
	umsg.End()
    NextPrintTime = CurTime() + 5
	end

    
end

function ENT:OnRemove()
	local ply = self:Getowning_ent()

end
