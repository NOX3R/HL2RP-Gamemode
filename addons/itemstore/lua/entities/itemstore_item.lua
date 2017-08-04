ENT.Type = "anim"
ENT.PrintName = "Item"

if SERVER then
	AddCSLuaFile()
	
	AccessorFunc( ENT, "Item", "Item" )
	
	function ENT:Initialize()
		if ( self.Item ) then
			self:SetModel( self.Item:GetModel() )
			
			self:PhysicsInit( SOLID_VPHYSICS )
			self:SetMoveType( MOVETYPE_VPHYSICS )
			self:SetSolid( SOLID_VPHYSICS )
			self:SetUseType( SIMPLE_USE )
			
			self:GetPhysicsObject():Wake()
			
			local item = self:GetItem()
			if ( item ) then
				item:Run( "ModifyEntity", self )
			end
		else
			self:Remove()
		end
	end
	
	function ENT:Use( pl )
		pl:PickupItem( self )
	end
end