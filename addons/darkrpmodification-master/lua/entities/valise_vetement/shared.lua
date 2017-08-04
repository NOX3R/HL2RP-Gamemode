ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Valise vetement"
ENT.Author = "Discretoss"
ENT.Spawnable = false
ENT.AdminSpawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Entity",1,"owning_ent")
end