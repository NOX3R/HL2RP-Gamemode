ENT.Type = "anim"
ENT.Base = "itemstore_box_small"

ENT.PrintName = "Large Container"
ENT.Category = "ItemStore"

ENT.Spawnable = true
ENT.AdminSpawnable = true

if SERVER then
	AddCSLuaFile()
	
	CreateConVar( "itemstore_box_large_w", 4, FCVAR_ARCHIVE )
	CreateConVar( "itemstore_box_large_h", 4, FCVAR_ARCHIVE )
	
	ENT.Model = "models/props/cs_office/Cardboard_box01.mdl" 
	ENT.ContainerDimensions = { w = GetConVarNumber( "itemstore_box_large_w" ), h = GetConVarNumber( "itemstore_box_large_h" ) }
end