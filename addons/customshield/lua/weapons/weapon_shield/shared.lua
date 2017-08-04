AddEntity("Ballistic Shield", {
	ent = "ent_giveshield",
	model = "models/custom/ballisticshield.mdl",
	price = 6000,
	max = 1,
	cmd = "buyshield",
	allowed = {TEAM_POLICE}
})


if SERVER then
  AddCSLuaFile( "shared.lua" )
  resource.AddWorkshop("339246128")
end



if CLIENT then
   SWEP.PrintName = "Ballistic Shield"			
   SWEP.Author = "CustomHQ"
   SWEP.Slot      = 2
   SWEP.SlotPos		= 1

end

function SWEP:Initialize()
	self:SetHoldType("physgun")
end

SWEP.Base = "weapon_cs_base2"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.AnimPrefix	 = "rpg"
SWEP.Primary.Damage         = 0
SWEP.Primary.ClipSize       = -1
SWEP.Primary.DefaultClip    = -1
SWEP.Primary.Automatic      = true
SWEP.Primary.Delay = 1.1
SWEP.Primary.Ammo       = "none"

SWEP.Primary.ClipSize  = -1
SWEP.Primary.DefaultClip = 1
SWEP.Primary.Automatic  = true
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = 1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"



SWEP.WorldModel = "" 
SWEP.ViewModel = Model("models/weapons/v_hands.mdl")


function SWEP:Recalc(bool)
	if CLIENT then return end
	if  IsValid(self.ent) then self.ent:Remove()  end 
			self.ent = ents.Create("prop_physics")
			self.ent:SetModel("models/custom/ballisticshield.mdl")
			self.ent:Spawn()
			self.ent:Activate()
			
			self.ent:SetPos(self.Owner:GetPos() + Vector(0,0,38) + self.Owner:GetRight()*1+(self.Owner:GetForward()*23))
			self.ent:SetAngles(Angle(0,self.Owner:EyeAngles().y,0))

		--	self.ent:SetModelScale(0.5,0)
		--	self.ent:SetColor(Color(0,0,0))
			self.ent:SetCollisionGroup( COLLISION_GROUP_WORLD ) 
			self.ent:SetParent(self.Owner)
		--self.ent:Fire("SetParentAttachmentMaintainOffset", "Anim_Attachment_LH", 0.01)
			self.ent:Fire("SetParentAttachmentMaintainOffset", "chest", 0.01)
			self.Owner:Freeze(false)
end

function SWEP:Deploy()
	if SERVER then
		if IsValid(self.ent) then return end
		self.Owner:SetEyeAngles(Angle(0,self.Owner:GetAngles().y,self.Owner:GetAngles().r))
		self.Owner:Freeze(true)
		self:SetHoldType("physgun")
		self:SetNoDraw(true)
		self:Recalc(false)
	end
	return true
end


function SWEP:Holster()
	if SERVER then
		if not IsValid(self.ent) then return end
		self.ent:Remove()
	end
	return true
end

function SWEP:OnDrop()
	if SERVER then
		if not IsValid(self.ent) then return end
		self.ent:Remove()
	end
end

function SWEP:OnRemove()
	if SERVER then
		if not IsValid(self.ent) then return end
		self.ent:Remove()
	end
end


function SWEP:SecondaryAttack()
	return 
end


