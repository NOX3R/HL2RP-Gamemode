ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Ration"
ENT.Author = "Pcwizdan"
ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Entity",1,"owning_ent")
end