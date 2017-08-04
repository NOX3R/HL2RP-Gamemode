ENT.Type = "anim"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

ENT.PrintName = "Bank"
ENT.Category = "ItemStore"

ENT.Spawnable = true
ENT.AdminOnly = true

if SERVER then
	AddCSLuaFile()

	ENT.Inventories = {}

	function ENT:Initialize()
		self:SetModel( "models/props_lab/reciever_cart.mdl" )

		self:PhysicsInit( SOLID_VPHYSICS )
		self:SetMoveType( MOVETYPE_VPHYSICS )
		self:SetSolid( SOLID_VPHYSICS )
		self:SetUseType( SIMPLE_USE )

		self:GetPhysicsObject():EnableMotion( false )
	end

	function ENT:SpawnFunction( pl, trace, class )
		local ent = ents.Create( class )
		ent:SetPos( trace.HitPos + trace.HitNormal * 16 )
		ent:Spawn()

		return ent
	end

	local function PermissionsCallback( con, pl )
		for _, bank in ipairs( ents.FindByClass( "itemstore_bank" ) ) do
			if ( bank:GetPos():Distance( pl:GetPos() ) < 250 ) then
				return true
			end
		end

		return false
	end

	function ENT:GetBankSize( pl )
		local w, h = unpack( itemstore.config.BankSize )

		if ( itemstore.config.BankSizes[ pl:GetUserGroup() ] ) then
			w, h = unpack( itemstore.config.BankSizes[ pl:GetUserGroup() ] )
		end

		return w, h
	end

	function ENT:CreateAccount( pl )
		local w, h = self:GetBankSize( pl )

		local acc = itemstore.containers.New( w * h )
		--acc:SetPlayerPermissions( pl, true, true )

		acc:SetCallback( "canread", PermissionsCallback )
		acc:SetCallback( "canwrite", PermissionsCallback )

		self.Inventories[ pl ] = acc

		return self.Inventories[ pl ]
	end

	function ENT:Use( pl )
		if ( IsValid( pl ) and pl:IsPlayer() ) then
			if not ( self.Inventories[ pl ] ) then
				self:CreateAccount( pl )
				itemstore.data.LoadPlayerBank( pl, self )
			end

			--self.Inventories[ pl ]:SetPlayerPermissions( pl, true, true )
			self.Inventories[ pl ]:Sync()

			local w, h = self:GetBankSize( pl )
			itemstore.containers.Open( pl, self.Inventories[ pl ], "Bank", w, h )
		end
	end

	concommand.Add( "itemstore_savebanks", function( pl )
		if ( pl:IsSuperAdmin() ) then
			itemstore.data.SaveBanks()
			pl:PrintMessage( HUD_PRINTCONSOLE, "Bank save OK!" )
		end
	end )

	hook.Add( "InitPostEntity", "ItemStoreLoadBanks", function()
		local banks = itemstore.data.LoadBanks()

		if ( banks ) then
			for _, data in ipairs( banks ) do
				local bank = ents.Create( "itemstore_bank" )
				bank:SetPos( data.Position )
				bank:SetAngles( data.Angles )
				bank:Spawn()
			end
		end
	end )

	-- this hacked together mess brought to you by your friendly neighborhood spiderme
	--[[
	local NextThink = 0
	hook.Add( "Tick", "ItemStoreBankPermissions", function()
		if ( NextThink < CurTime() ) then
			local banks = ents.FindByClass( "itemstore_bank" )

			if ( IsValid( banks[ 1 ] ) ) then
				for pl, acc in pairs( banks[ 1 ].Inventories ) do
					if ( IsValid( pl ) ) then
						local withinrange = false
						for _, bank in ipairs( banks ) do
							if ( pl:GetPos():Distance( bank:GetPos() ) < 250 ) then
								withinrange = true
							end
						end

						if not ( withinrange ) then
							acc:SetPlayerPermissions( pl, false, false )
						end
					end
				end
			end

			NextThink = CurTime() + 1
		end
	end )]]
else
	function ENT:DrawTranslucent()
		self:DrawModel()

		local text = "Bank"
		local font = "DermaLarge"

		surface.SetFont( font )
		local textw, texth = surface.GetTextSize( text )
		local w = 5 + textw + 5
		local h = 2 + texth + 2
		local x, y = -w / 2, -h / 2

		cam.Start3D2D( self:GetPos() + self:GetAngles():Up() * 50, Angle( 0, CurTime() * 45, 90 ), 0.35 )
			surface.SetDrawColor( Color( 0, 0, 0, 200 ) )
			surface.DrawRect( x, y, w, h )

			draw.SimpleTextOutlined( text, font, 0, 0, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
		cam.End3D2D()
	end
end
