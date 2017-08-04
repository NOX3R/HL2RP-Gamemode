ITEM.Name = "Weapon"
ITEM.Description = "Pew pew.\n\nAmount: %d"
ITEM.Model = "models/Items/item_item_crate.mdl"
ITEM.Base = "base_darkrp"

local HL2Weapons = {
	{ Class = "weapon_physgun", Name = "Physgun" },
	{ Class = "weapon_physcannon", Name = "Gravity Gun" },
	{ Class = "weapon_crowbar", Name = "Crowbar" },
	{ Class = "weapon_stunstick", Name = "Stunstick" },
	{ Class = "weapon_pistol", Name = "Pistol" },
	{ Class = "weapon_357", Name = "357" },
	{ Class = "weapon_smg1", Name = "SMG1" },
	{ Class = "weapon_ar2", Name = "AR2" },
	{ Class = "weapon_annabelle", Name = "Annabelle" },
	{ Class = "weapon_shotgun", Name = "Shotgun" },
	{ Class = "weapon_crossbow", Name = "Crossbow" },
	{ Class = "weapon_frag", Name = "Frag Grenade" },
	{ Class = "weapon_rpg", Name = "RPG" },
	{ Class = "weapon_slam", Name = "SLAM" },
	{ Class = "weapon_bugbait", Name = "Bug Bait" }
}

local function GetHL2WeaponData( class )
	for _, hl2wep in ipairs( HL2Weapons ) do
		if ( hl2wep.Class == class ) then
			return hl2wep
		end
	end
end

local function GetWeaponClass( ent )
	if ( ent.GetWeaponClass ) then
		return ent:GetWeaponClass()
	else
		return ent.weaponclass
	end
end

function ITEM:GetName()
	local wep = weapons.Get( self:GetData( "Class" ) )
	return ( wep and wep.PrintName ) or ( GetHL2WeaponData( self:GetData( "Class" ) ) and GetHL2WeaponData( self:GetData( "Class" ) ).Name ) or self:GetData( "Class" )
end

function ITEM:CanPickup( pl, ent )
	return not ent.PlyerUse and ( weapons.Get( GetWeaponClass( ent ) ) or GetHL2WeaponData( GetWeaponClass( ent ) ) )
end

function ITEM:GetDescription()
	return string.format( self.Description, self:GetData( "Amount" ) )
end

function ITEM:GetModel()
	return self:GetData( "Model" )
end

function ITEM:CanMerge( item )
	return item.UniqueName == self.UniqueName and item:GetData( "Class" ) == self:GetData( "Class" ) and ( itemstore.config.MaxStack == -1 or ( ( self:GetData( "Amount" ) or 1 ) + ( item:GetData( "Amount" ) or 1 ) ) <= itemstore.config.MaxStack )
end

function ITEM:Merge( item )
	item:SetData( "Amount", item:GetData( "Amount" ) + self:GetData( "Amount" ) )

	item:SetData( "Clip2", ( item:GetData( "Clip2" ) or 0 ) + ( self:GetData( "Clip2" ) or 0 ) )
	item:SetData( "Ammo", ( item:GetData( "Ammo" ) or 0 ) + ( self:GetData( "Ammo" ) or 0 ) + ( self:GetData( "Clip1" ) or 0 ) )
end

function ITEM:CanSplit( amount )
	return ( ( self:GetData( "Amount" ) or 1 ) > amount )
end

function ITEM:Split( amount )
	self:SetData( "Amount", self:GetData( "Amount" ) - amount )

	local item = itemstore.items.New( self.UniqueName, table.Copy( self.Data ) )
	item:SetData( "Amount", amount )

	self:SetData( "Clip1", 0 )
	self:SetData( "Clip2", 0 )
	self:SetData( "Ammo", 0 )

	return item
end

function ITEM:SaveData( ent )
	self:SetData( "Class", GetWeaponClass( ent ) )
	self:SetData( "Amount", ent:Getamount() )
	self:SetData( "Model", ent:GetModel() )

	self:SetData( "Clip1", ent.clip1 )
	self:SetData( "Clip2", ent.clip2 )
	self:SetData( "Ammo", ent.ammoadd )
end

function ITEM:LoadData( ent )
	ent:SetModel( self:GetData( "Model" ) )
	ent:Setamount( self:GetData( "Amount" ) )

	if ( ent.GetWeaponClass ) then
		ent:SetWeaponClass( self:GetData( "Class" ) )
	else
		ent.weaponclass = self:GetData( "Class" )
	end

	ent.clip1 = self:GetData( "Clip1" )
	ent.clip2 = self:GetData( "Clip2" )
	ent.ammoadd = self:GetData( "Ammo" )

	self:SetData( "Clip1", 0 )
	self:SetData( "Clip2", 0 )
	self:SetData( "Ammo", 0 )

	-- The dumbest hack: FPtje sets the amount to 1 in Initialize() instead of, oh, I dunno, doing something
	-- that doesn't fuck everything up. Go suck on a bag of dicks. We override initialize so we can set the amount
	-- properly without anything interfering.
	ent.Initialize = function( self )
		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetUseType( SIMPLE_USE )
		self:GetPhysicsObject():Wake()

		self:SetCollisionGroup( COLLISION_GROUP_INTERACTIVE_DEBRIS )
	end
end

function ITEM:Use( pl )
	if pl:isArrested() then return false end
	if pl:HasWeapon( self:GetData( "Class" ) ) then return false end

	pl:Give( self:GetData( "Class" ) )
	local wep = pl:GetWeapon( self:GetData( "Class" ) )

	self:SetData( "Amount", self:GetData( "Amount" ) - 1 )

	-- If something went horribly wrong and for some reason we didn't receive the weapon coughdarkrpcough
	-- then don't decrease the amount we have and don't try to give ammo.
	if IsValid( wep ) then
		if ( self:GetData( "Clip1" ) ) then
			wep:SetClip1( self:GetData( "Clip1" ) )
		end

		if ( self:GetData( "Clip2" ) ) then
			wep:SetClip2( self:GetData( "Clip2" ) )
		end

		pl:GiveAmmo( self:GetData( "Ammo" ) or 0, wep:GetPrimaryAmmoType() )

		self:SetData( "Clip1", 0 )
		self:SetData( "Clip2", 0 )
		self:SetData( "Ammo", 0 )
	end

	if ( self:GetData( "Amount" ) < 1 ) then
		return true
	end
end
