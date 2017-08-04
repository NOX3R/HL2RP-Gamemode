ENT.Type = "anim"

ENT.PrintName = "Small Container"
ENT.Category = "ItemStore"

ENT.Spawnable = true
ENT.AdminSpawnable = true

function ENT:SetupDataTables()
	self:NetworkVar( "Entity", 0, "owning_ent" ) -- i feel really stupid.
end

if SERVER then
	AddCSLuaFile()
	
	CreateConVar( "itemstore_box_breakable", 0, FCVAR_ARCHIVE )
	CreateConVar( "itemstore_box_small_w", 4, FCVAR_ARCHIVE )
	CreateConVar( "itemstore_box_small_h", 2, FCVAR_ARCHIVE )
	
	ENT.Model = "models/props/cs_office/Cardboard_box02.mdl" 
	ENT.ContainerDimensions = { w = GetConVarNumber( "itemstore_box_small_w" ), h = GetConVarNumber( "itemstore_box_small_h" ) }
	
	function ENT:Initialize()
		self:SetModel( self.Model )
		
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetUseType( SIMPLE_USE )
		
		self:GetPhysicsObject():Wake()
		
		self.Container = itemstore.containers.New( self.ContainerDimensions.w * self.ContainerDimensions.h )
		self.Container:SetOwner( self )
		
		if ( self.Items ) then
			for _, item in ipairs( self.Items ) do
				self.Container:AddItem( table.Copy( item ) )
			end
		end
		
		local function PermissionsCallback( con, pl )
			if ( pl:GetPos():Distance( self:GetPos() ) < 250 ) then
				return true
			end
			
			return false
		end
		
		self.Container:SetCallback( "canread", PermissionsCallback )
		self.Container:SetCallback( "canwrite", PermissionsCallback )
		
		self:SetHealth( 100 )
	end
	
	function ENT:SpawnFunction( pl, trace, class )
		local ent = ents.Create( class )
		ent:SetPos( trace.HitPos + trace.HitNormal * 16 )
		ent:Spawn()
		
		return ent
	end
	
	function ENT:Use( pl )
		--self.Container:SetPlayerPermissions( pl, true, true )
		self.Container:Sync()
		itemstore.containers.Open( pl, self.Container, "Box", self.ContainerDimensions.w, self.ContainerDimensions.h )
	end
	
	--[[
	function ENT:Think()
		for pl in pairs( self.Container.Permissions ) do
			if ( IsValid( pl ) and pl:GetPos():Distance( self:GetPos() ) > 250 ) then
				self.Container:SetPlayerPermissions( pl, false, false )
			end
		end
		
		self:NextThink( CurTime() + 1 )
	end]]
	
	function ENT:Break()
		local effect = EffectData()
		effect:SetOrigin( self:GetPos() )
		util.Effect( "Explosion", effect, true, true )
		
		for _, item in pairs( self.Container.Items ) do
			itemstore.items.CreateEntity( item, self:GetPos() ):Spawn()
		end
		
		self:Remove()
	end
	
	function ENT:OnTakeDamage( dmg )
		if ( GetConVarNumber( "itemstore_box_breakable" ) == 1 ) then
			self:SetHealth( self:Health() - dmg:GetDamage() )
			
			if ( self:Health() <= 0 ) then
				self:Break()
			end
		end
	end
	
	function ENT:OnRemove()
		itemstore.containers.Remove( self.Container:GetID() )
	end
end