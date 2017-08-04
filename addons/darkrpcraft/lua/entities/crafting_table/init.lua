AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*_________________________________________________
Configs!
_________________________________________________*/
CONFIGCraftingTableHealth = 1000 -- The health of the table.

function ENT:Initialize()
	self:SetModel("models/props_wasteland/controlroom_desk001b.mdl")
	self:SetMaterial("phoenix_storms/gear")
	self:SetColor(Color(100,100,100))
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	local phys = self:GetPhysicsObject()
	phys:Wake()
	self.damage = CONFIGCraftingTableHealth
	selfEnt = self

	self:SetNWFloat("Wood",0) 
	self:SetNWFloat("Wrench",0)
	self:SetNWFloat("Iron",0) 
	self:SetNWFloat("Spring",0)

	self.woodProp = nil
	self.wrenchProp = nil
	self.ironbarProp = nil
	self.springProp = nil
	self.ingPlaced = false
end
function ENT:Think()
	self.wood = self:GetNWFloat("Wood")
	self.ironbar = self:GetNWFloat("Iron")
	self.spring = self:GetNWFloat("Spring")
	self.wrench = self:GetNWFloat("Wrench")
end

function ENT:Use(ply)
	umsg.Start( "craftingmenu", ply )
	umsg.Entity( self )
	umsg.End()
	
end

function ENT:Touch(ent)

	if self.ingPlaced then return end
	
	self.ingPlaced = true
	
	if ent:IsValid() and ent:GetClass() == "wrench" or ent:GetClass() == "spring" or ent:GetClass() == "wood" or ent:GetClass() == "ironbar" then
// Wrench
	if ent:GetClass() == "wrench" then
		
		if not self.wrenchProp then
		
		local newEnt = ents.Create("prop_physics")
		newEnt:SetModel(ent:GetModel())
		newEnt:SetPos(self:GetPos() + self:GetAngles():Forward() * 11.5 + self:GetAngles():Up() * 17 + self:GetAngles():Right() * 2.3)
		newEnt:SetAngles(self:GetAngles())
		newEnt:SetParent(self)
		
		self.wrenchProp = newEnt
		
		end
		
		ent:Remove()
		self:SetNWFloat("Wrench",self:GetNWFloat("Wrench") + 1)
		
	end
	// Spring
	if ent:GetClass() == "spring" then
	
	if not self.springProp then
	
		local newEnt = ents.Create("prop_physics")
	
		newEnt:SetModel(ent:GetModel())
		newEnt:SetPos(self:GetPos() + self:GetAngles():Forward() * 0 + self:GetAngles():Up() * 17 + self:GetAngles():Right() * -30.3)
		newEnt:SetAngles(self:GetAngles() - Angle(0, 45, 0))
		newEnt:SetParent(self)
	
		self.springProp = newEnt
	end
	
	ent:Remove()
	self:SetNWFloat("Spring",self:GetNWFloat("Spring") + 1)
	end
	// Wood
	if ent:GetClass() == "wood" then
	
	if not self.woodProp then
	
		local newEnt = ents.Create("prop_physics")
	
		newEnt:SetModel(ent:GetModel())
		newEnt:SetPos(self:GetPos() + self:GetAngles():Forward() * 0 + self:GetAngles():Up() * 17 + self:GetAngles():Right() * 35.3)
		newEnt:SetAngles(self:GetAngles() - Angle(0, 210, 0))
		newEnt:SetParent(self)
		
		self.woodProp = newEnt
	end
		
		self:SetNWFloat("Wood",self:GetNWFloat("Wood") + 1)
		ent:Remove()
	end
	
	// Iron bar
	if ent:GetClass() == "ironbar" then
	
	if not self.ironbarProp then
	
		local newEnt = ents.Create("prop_physics")
	
		newEnt:SetModel(ent:GetModel())
		newEnt:SetPos(self:GetPos() + self:GetAngles():Forward() * 1.5 + self:GetAngles():Up() * 18.5 + self:GetAngles():Right() * 2.3)
		newEnt:SetAngles(self:GetAngles() - Angle(0,90,0))
		newEnt:SetParent(self)
		
		self.ironbarProp = newEnt
	end
		
	self:SetNWFloat("Iron",self:GetNWFloat("Iron") + 1)
	ent:Remove()
	end

	end
	
	timer.Simple(1, function()
		self.ingPlaced = false
	end)
	
end


util.AddNetworkString("TheID")
net.Receive("TheID", function(len, player)
  ID = net.ReadString() 
end)

util.AddNetworkString("StartCrafting")
net.Receive("StartCrafting", function(len, ply)
local tself = net:ReadEntity()
  	if (Crafting_Recipes[ID].Materials) then
		for k,v in pairs( Crafting_Recipes[ID].Materials ) do
			if (tself[k] < v) then 
		ply:SendLua(
		[[
		chat.AddText( Color(0,100,255), "[TABLE CRAFT]", Color(255,255,255), " Placer les bonnes ressources!")]])
			return end
		end
		tself:SetNWFloat("Wood",0) 
		tself:SetNWFloat("Wrench",0)
		tself:SetNWFloat("Iron",0) 
		tself:SetNWFloat("Spring",0)
		
		if tself.woodProp then tself.woodProp:Remove() end
		if tself.wrenchProp then tself.wrenchProp:Remove() end
		if tself.ironbarProp then tself.ironbarProp:Remove() end
		if tself.springProp then tself.springProp:Remove() end
		
		tself.woodProp = nil
		tself.wrenchProp = nil
		tself.ironbarProp = nil
		tself.springProp = nil
		
		ply:SendLua(
		[[
		chat.AddText( Color(0,100,255), "[TABLE CRAFT]", Color(255,255,255), " Craft en cours. Merci de patientez..")]])
		tself:EmitSound("ambient/machines/pneumatic_drill_4.wav", 100, 100)
		timer.Simple(math.random(2,3), function()
			local craftit = ents.Create(Crafting_Recipes[ID].Create)
			craftit:SetPos(tself:GetPos() + tself:GetAngles():Up() * 40)
			craftit:Spawn()
		end)
	end
end)

util.AddNetworkString("Minus1Wood")
net.Receive("Minus1Wood", function(len, player)
local cTable = net:ReadEntity()
	if cTable:GetNWFloat("Wood") <= 0 then return end
	
cTable:SetNWFloat("Wood", cTable:GetNWFloat("Wood") -1) 
	if cTable:GetNWFloat("Wood") == 0 then
		if cTable.woodProp then cTable.woodProp:Remove() end
		cTable.woodProp = nil
	end
end)

util.AddNetworkString("Minus1Wrench")
net.Receive("Minus1Wrench", function(len, player)
local cTable = net:ReadEntity()
	if cTable:GetNWFloat("Wrench") <= 0 then return end
	
cTable:SetNWFloat("Wrench", cTable:GetNWFloat("Wrench") -1) 
	if cTable:GetNWFloat("Wrench") == 0 then
		if cTable.wrenchProp then cTable.wrenchProp:Remove() end
		cTable.wrenchProp = nil
	end
end)

util.AddNetworkString("Minus1Iron")
net.Receive("Minus1Iron", function(len, player)
local cTable = net:ReadEntity()
	if cTable:GetNWFloat("Iron") <= 0 then return end
	
cTable:SetNWFloat("Iron", cTable:GetNWFloat("Iron") -1) 
	if cTable:GetNWFloat("Iron") == 0 then
		if cTable.ironbarProp then cTable.ironbarProp:Remove() end
		cTable.ironbarProp = nil
	end
end)

util.AddNetworkString("Minus1Spring")
net.Receive("Minus1Spring", function(len, player)
local cTable = net:ReadEntity()
	if cTable:GetNWFloat("Spring") <= 0 then return end
	
cTable:SetNWFloat("Spring", cTable:GetNWFloat("Spring") -1) 
	if cTable:GetNWFloat("Spring") == 0 then
		if cTable.springProp then cTable.springProp:Remove() end
		cTable.springProp = nil
	end
end)

util.AddNetworkString("KillMats")
net.Receive("KillMats", function(len, player)
local cTable = net:ReadEntity()

	cTable:SetNWFloat("Wood",0) 
	cTable:SetNWFloat("Wrench",0)
	cTable:SetNWFloat("Iron",0) 
	cTable:SetNWFloat("Spring",0)
	
	if cTable.woodProp then cTable.woodProp:Remove() end
	if cTable.wrenchProp then cTable.wrenchProp:Remove() end
	if cTable.ironbarProp then cTable.ironbarProp:Remove() end
	if cTable.springProp then cTable.springProp:Remove() end
	
	cTable.woodProp = nil
	cTable.wrenchProp = nil
	cTable.ironbarProp = nil
	cTable.springProp = nil
end)

util.AddNetworkString("DestroyTable")
net.Receive("DestroyTable", function(len, player)
local cTable = net:ReadEntity()
cTable:Remove()
end)

function ENT:Craft(ply)	

end

local function PickupEnt (ply, ent)
	if(ent:GetClass() == "crafting_table") then
		if ply == ent.dt.owning_ent then return true
		else return false
		end
	end
end
hook.Add("PhysgunPickup", "PickUpRegister", PickupEnt)

function ENT:OnTakeDamage(dmg)

	self.damage = (self.damage or 1000) - dmg:GetDamage()
	if self.damage > 1 then
	else
	self:Ignite(12,0)
	timer.Create("RemoveTime"..self:EntIndex(). math.random(5,12), 1, function()
	self:Remove()
	end)
	end
end

function ENT:OnRemove()
timer.Stop("CraftSome"..self:EntIndex())
timer.Stop("RemoveTime"..self:EntIndex())
end





