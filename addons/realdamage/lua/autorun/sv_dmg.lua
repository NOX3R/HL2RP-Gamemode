include("config.lua")
	
if SERVER then
	MsgC(Color(52, 152, 219), "Loaded Realistic Player Damage, an addon by Kalamitous.\n")
	
	function EmitHurtSound(ent, hitgroup)
		local rSound
		
		if ent:GetNWBool("SoundPlaying") == false then
			if hitgroup == HITGROUP_HEAD then
				if table.HasValue(MaleModels, ent:GetModel()) then
					rSound = table.Random(MaleHeadShotSounds)
				elseif table.HasValue(FemaleModels, ent:GetModel()) then
					rSound = table.Random(FemaleHeadShotSounds)
				elseif table.HasValue(CombineModels, ent:GetModel()) then
					rSound = table.Random(CombineHeadShotSounds)
				elseif table.HasValue(AlyxModels, ent:GetModel()) then
					rSound = table.Random(AlyxHeadShotSounds)
				elseif table.HasValue(ZombieModels, ent:GetModel()) then
					rSound = table.Random(ZombieHeadShotSounds)
				end
			elseif hitgroup == HITGROUP_LEFTARM then
				if table.HasValue(MaleModels, ent:GetModel()) then
					rSound = table.Random(MaleLeftArmSounds)
				elseif table.HasValue(FemaleModels, ent:GetModel()) then
					rSound = table.Random(FemaleLeftArmSounds)
				elseif table.HasValue(CombineModels, ent:GetModel()) then
					rSound = table.Random(CombineLeftArmSounds)
				elseif table.HasValue(AlyxModels, ent:GetModel()) then
					rSound = table.Random(AlyxLeftArmSounds)
				elseif table.HasValue(ZombieModels, ent:GetModel()) then
					rSound = table.Random(ZombieLeftArmSounds)
				end
			elseif hitgroup == HITGROUP_RIGHTARM then
				if table.HasValue(MaleModels, ent:GetModel()) then
					rSound = table.Random(MaleRightArmSounds)
				elseif table.HasValue(FemaleModels, ent:GetModel()) then
					rSound = table.Random(FemaleRightArmSounds)
				elseif table.HasValue(CombineModels, ent:GetModel()) then
					rSound = table.Random(CombineRightArmSounds)
				elseif table.HasValue(AlyxModels, ent:GetModel()) then
					rSound = table.Random(AlyxRightArmSounds)
				elseif table.HasValue(ZombieModels, ent:GetModel()) then
					rSound = table.Random(ZombieRightArmSounds)
				end
			elseif hitgroup == HITGROUP_LEFTLEG then
				if table.HasValue(MaleModels, ent:GetModel()) then
					rSound = table.Random(MaleLeftLegSounds)
				elseif table.HasValue(FemaleModels, ent:GetModel()) then
					rSound = table.Random(FemaleLeftLegSounds)
				elseif table.HasValue(CombineModels, ent:GetModel()) then
					rSound = table.Random(CombineLeftLegSounds)
				elseif table.HasValue(AlyxModels, ent:GetModel()) then
					rSound = table.Random(AlyxLeftLegSounds)
				elseif table.HasValue(ZombieModels, ent:GetModel()) then
					rSound = table.Random(ZombieLeftLegSounds)
				end
			elseif hitgroup == HITGROUP_RIGHTLEG then
				if table.HasValue(MaleModels, ent:GetModel()) then
					rSound = table.Random(MaleRightLegSounds)
				elseif table.HasValue(FemaleModels, ent:GetModel()) then
					rSound = table.Random(FemaleRightLegSounds)
				elseif table.HasValue(CombineModels, ent:GetModel()) then
					rSound = table.Random(CombineRightLegSounds)
				elseif table.HasValue(AlyxModels, ent:GetModel()) then
					rSound = table.Random(AlyxRightLegSounds)
				elseif table.HasValue(ZombieModels, ent:GetModel()) then
					rSound = table.Random(ZombieRightLegSounds)
				end
			elseif hitgroup == HITGROUP_CHEST then
				if table.HasValue(MaleModels, ent:GetModel()) then
					rSound = table.Random(MaleChestSounds)
				elseif table.HasValue(FemaleModels, ent:GetModel()) then
					rSound = table.Random(FemaleChestSounds)
				elseif table.HasValue(CombineModels, ent:GetModel()) then
					rSound = table.Random(CombineChestSounds)
				elseif table.HasValue(AlyxModels, ent:GetModel()) then
					rSound = table.Random(AlyxChestSounds)
				elseif table.HasValue(ZombieModels, ent:GetModel()) then
					rSound = table.Random(ZombieChestSounds)
				end
			elseif hitgroup == HITGROUP_STOMACH then
				if table.HasValue(MaleModels, ent:GetModel()) then
					rSound = table.Random(MaleStomachSounds)
				elseif table.HasValue(FemaleModels, ent:GetModel()) then
					rSound = table.Random(FemaleStomachSounds)
				elseif table.HasValue(CombineModels, ent:GetModel()) then
					rSound = table.Random(CombineStomachSounds)
				elseif table.HasValue(AlyxModels, ent:GetModel()) then
					rSound = table.Random(AlyxStomachSounds)
				elseif table.HasValue(ZombieModels, ent:GetModel()) then
					rSound = table.Random(ZombieStomachSounds)
				end
			elseif hitgroup == HITGROUP_GEAR then
				if table.HasValue(MaleModels, ent:GetModel()) then
					rSound = table.Random(MaleThighSounds)
				elseif table.HasValue(FemaleModels, ent:GetModel()) then
					rSound = table.Random(FemaleThighSounds)
				elseif table.HasValue(CombineModels, ent:GetModel()) then
					rSound = table.Random(CombineThighSounds)
				elseif table.HasValue(AlyxModels, ent:GetModel()) then
					rSound = table.Random(AlyxThighSounds)
				elseif table.HasValue(ZombieModels, ent:GetModel()) then
					rSound = table.Random(ZombieThighSounds)
				end
			end
				
			if rSound != nil then
				ent:SetNWBool("SoundPlaying", true)
						
				timer.Simple(SoundDuration(rSound), function()
					ent:SetNWBool("SoundPlaying", false)
				end)
				
				ent:EmitSound(rSound, HurtSoundVolume, 100, 1, CHAN_AUTO)
			end
		end
	end
	
	function Limp(ent, hitgroup, percent)
		if AllowLimping == true and percent != 0 then									
			local chance = math.Round(math.Rand(0, 100))
								
			if chance <= percent then
				ent:SetNWBool("Limp", true)
				local switch = 1
				
				ent:SetJumpPower(ent:GetJumpPower() * LimpJumpHeightMultiplier)
				
				timer.Simple(0.1, function()
					timer.Create(hitgroup.."Limp"..ent:Nick(), 0.5, 0, function()				
						if switch == 1 and ent:GetNWBool("Limp") == true and ent:IsOnGround() then
							if ent:GetVelocity():Length() >= 75 then
								if hitgroup == HITGROUP_LEFTLEG then
									ent:ViewPunch(Angle(1, 1, 0))
								else
									ent:ViewPunch(Angle(1, -1, 0))
								end
							end	
							
							ent:SetWalkSpeed(ent:GetWalkSpeed() * LimpWalkSpeedMultiplier)
							ent:SetRunSpeed(ent:GetRunSpeed() * LimpRunSpeedMultiplier)
							
							switch = 0
						elseif switch == 0 and ent:GetNWBool("Limp") == true and ent:IsOnGround() then							
							ent:SetWalkSpeed(DefaultWalkSpeed)			
							ent:SetRunSpeed(DefaultRunSpeed)
							
							switch = 1
						end
					end)	
				end)
			end
		end
	end
	
	function DropWep(ent, percent)	
		if percent != 0 and AllowWeaponDrop == true then
			local chance = math.Round(math.Rand(0, 100))
					
			if chance <= percent then	
				if ent:GetActiveWeapon():IsValid() and !table.HasValue(RestrictedWeapons, ent:GetActiveWeapon():GetClass()) then
					ent:DropWeapon(ent:GetActiveWeapon())
				end
			end	
		end
	end

	hook.Add("ScalePlayerDamage", "DynaDmg", function(ply, hitgroup, dmginfo)	
		if hitgroup == HITGROUP_HEAD then
			if ply:GetActiveWeapon().HeadshotMultiplier == nil then
				dmginfo:ScaleDamage(HeadShotDamageMultiplier)	
			end
			
			EmitHurtSound(ply, HITGROUP_HEAD)
		elseif hitgroup == HITGROUP_LEFTARM then			
			dmginfo:ScaleDamage(LeftArmDamageMultiplier)
			
			DropWep(ply, LeftArmWeaponDropChance)
			
			EmitHurtSound(ply, HITGROUP_LEFTARM)
		elseif hitgroup == HITGROUP_RIGHTARM then			
			dmginfo:ScaleDamage(RightArmDamageMultiplier)
			
			DropWep(ply, RightArmWeaponDropChance)
			
			EmitHurtSound(ply, HITGROUP_RIGHTARM)
		elseif hitgroup == HITGROUP_LEFTLEG then
			dmginfo:ScaleDamage(LeftLegDamageMultiplier)
			
			EmitHurtSound(ply, HITGROUP_LEFTLEG)		

			Limp(ply, HITGROUP_LEFTLEG, LeftLegLimpingChance)			
		elseif hitgroup == HITGROUP_RIGHTLEG then
			dmginfo:ScaleDamage(RightLegDamageMultiplier)
						
			EmitHurtSound(ply, HITGROUP_RIGHTLEG)
			
			Limp(ply, HITGROUP_LEFTLEG, RightLegLimpingChance)			
		elseif hitgroup == HITGROUP_CHEST then
			dmginfo:ScaleDamage(ChestDamageMultiplier)
			
			EmitHurtSound(ply, HITGROUP_CHEST)
		elseif hitgroup == HITGROUP_STOMACH then
			dmginfo:ScaleDamage(StomachDamageMultiplier)
			
			EmitHurtSound(ply, HITGROUP_STOMACH)
		elseif hitgroup == HITGROUP_GEAR then
			dmginfo:ScaleDamage(ThighDamageMultiplier)
			
			EmitHurtSound(ply, HITGROUP_GEAR)
		end
	end)	

	hook.Add("PlayerHurt", "HealthUpdate", function(victim, attacker)
		victim:SetNWInt("curHealth", victim:Health())
	end)

	hook.Add("PlayerDeath", "Reset", function(victim, inflictor, attacker)
		victim:SetNWInt("curHealth", 0)						
		victim:SetNWBool("Limp", false)					
					
		victim:SetWalkSpeed(DefaultWalkSpeed)			
		victim:SetRunSpeed(DefaultRunSpeed)
		victim:SetJumpPower(DefaultJumpHeight)	

		victim.Rolling = false			
	end)	
	
	hook.Add("PlayerSpawn", "SpawnRemove", function(ply)
		ply.Rolling = false	
	end)

	hook.Add("GetFallDamage", "DynaFallDmg", function(ply, speed)	
		if ply:KeyDown(IN_DUCK) and AllowRolling == true then
			if ply:GetActiveWeapon():IsValid() then
				if ply:GetActiveWeapon().Primary == nil then
					ply:GetActiveWeapon():SendWeaponAnim(ACT_VM_HOLSTER)
					
					local AnimDuration = ply:GetActiveWeapon():SequenceDuration()
					if ply:GetActiveWeapon():SequenceDuration() != nil then
						timer.Simple(ply:GetActiveWeapon():SequenceDuration(), function()
							ply:DrawViewModel(false)
						end, ply)
					end
				else
					ply:DrawViewModel(false)
				end
			end
			
			ply.Rolling = true
			
			umsg.Start("RollTime", ply) 
			umsg.End()   
			
			timer.Simple(0.6, function()
				if ply:Alive() then	
					Limp(ply, HITGROUP_LEFTLEG, RollingLimpingChance)	
					
					if ply:GetActiveWeapon():IsValid() then
						if ply:GetActiveWeapon().Primary == nil then
							ply:GetActiveWeapon():SendWeaponAnim(ACT_VM_DRAW)
							
							AnimDuration = ply:GetActiveWeapon():SequenceDuration()
	
							ply:DrawViewModel(true)
						else
							ply:DrawViewModel(true)
							
							ply:GetActiveWeapon():Deploy()
						end
					end	
					
					ply.Rolling = false	
				end
			end, ply)
			
			return speed / RollingDamageDivisor
		else
			EmitHurtSound(ply, HITGROUP_LEFTLEG)
			
			Limp(ply, HITGROUP_LEFTLEG, FallLimpingChance)	
		
			return speed / FallDamageDivisor
		end
	end)
	
	local NextRollSound = CurTime()

	hook.Add("Think", "OtherHealth", function()
		for k, v in pairs(player.GetAll()) do
			if v:GetNWInt("curHealth") != 0 and v:GetNWInt("curHealth") < v:Health() then	
				v:SetWalkSpeed(DefaultWalkSpeed)			
				v:SetRunSpeed(DefaultRunSpeed)
				v:SetJumpPower(DefaultJumpHeight)	
				
				timer.Simple(0.1, function()
					v:SetNWBool("Limp", false)
				end)
			end
			
			if v:WaterLevel() == 3 then
				if v:IsOnFire() then
					v:Extinguish()
				end
				
				if v.Drown then
					if v.Drown < CurTime() then
						local dmginfo = DamageInfo()
						
						dmginfo:SetDamage(DrownDamage)
						dmginfo:SetDamageType(DMG_DROWN)
						dmginfo:SetAttacker(game.GetWorld())
						dmginfo:SetInflictor(game.GetWorld())
						v:TakeDamageInfo(dmginfo)
						
						v.Drown = CurTime() + DrownInterval
					end
				else
					v.Drown = CurTime() + BreathTime
				end
			else
				v.Drown = nil
			end
			
			local trF = util.QuickTrace(v:GetPos() + Vector(0, 0, 15) , (v:GetForward() * 50), v)
			
			if v.Rolling and v:OnGround() then
				v:SetLocalVelocity(v:GetForward() * 450)
				
				if NextRollSound and NextRollSound <= CurTime() and v:GetVelocity():Length() > 0 then
					NextRollSound = CurTime() + 0.2
					
					v:EmitSound(table.Random(RollingSounds), RollSoundVolume, 100, 1, CHAN_AUTO)			
				end	
			end	
			
			if v.Rolling and trF.Hit then
				v.Rolling = false
				
				v:SetVelocity(v:GetAimVector(), 0)
				
				v:EmitSound(table.Random(RollingImpactSounds), RollSoundVolume, 100, 1, CHAN_AUTO)
				
				local shake = ents.Create("env_shake")
				shake:SetOwner(v)
				shake:SetPos(trF.HitPos)
				shake:SetKeyValue("amplitude", "2500")
				shake:SetKeyValue("radius", "100")
				shake:SetKeyValue("duration", "0.5")
				shake:SetKeyValue("frequency", "255")
				shake:SetKeyValue("spawnflags", "4")	
				shake:Spawn()
				shake:Activate()
				shake:Fire("StartShake", "", 0)
			end		
		end
	end)
end

if CLIENT then
	function RollTime(um)
		LocalPlayer().Rolling = true
		LocalPlayer().RollTimer = CurTime() + 0.6
	end
	usermessage.Hook("RollTime", RollTime)
	
	local addRollPitch = 0
	local rollValue = 0
	
	hook.Add("CalcView", "RollView", function (ply, pos, angles, fov)
		if ply:Alive() then
			local dist = 0
			
			if ply.Rolling then
				dist = addRollPitch - 20
				addRollPitch = math.Approach(addRollPitch, 20, FrameTime() * (dist * 7))
			else
				addRollPitch = math.Approach(addRollPitch, 0, FrameTime() * 80)
			end
			
			if ply.RollTimer and ply.RollTimer < CurTime() and rollValue != 0 then 
				ply.Rolling = false
				rollValue = 0
			elseif ply.RollTimer and ply.RollTimer > CurTime() and ply.Rolling == true then
				rollValue = rollValue + FrameTime() * 600
			end	
			
			angles.r = angles.r + addRollPitch
			
			angles.p = angles.p + rollValue
		end
	end)
end