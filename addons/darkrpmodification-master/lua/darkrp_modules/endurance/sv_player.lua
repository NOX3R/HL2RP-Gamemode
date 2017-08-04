local meta = FindMetaTable("Player")

function meta:newEnduranceData()
	if not IsValid(self) then return end
	self:setSelfDarkRPVar("Endurance", 100)
	self:GetTable().LastEnduranceUpdate = 0
end
local NextPrintTime = 0
function meta:EnduranceUpdate()
 local value=10
	if self:Team()==TEAM_POLICE_05 then value=8 end
	if self:Team()==TEAM_POLICE_04 then value=6 end
	if self:Team()==TEAM_POLICE_03 then value=4 end
	if self:Team()==TEAM_POLICE_02 then value=2 end
	if self:Team()==TEAM_POLICE_01 then value=1 end
	if self:Team()==TEAM_OTA then value=0 end
	if self:Team()==TEAM_OTA_KING then value=0 end
	if self:Team()==TEAM_OTA_PRISON then value=4 end
	if self:Team()==TEAM_CHIEF then value=0 end
	if self:Team()==TEAM_HOBO or self:Team()==TEAM_HOBOH or self:Team()==TEAM_HOBOZ or self:Team()==TEAM_HOBOF or self:Team()==TEAM_GHOST or self:Team()==TEAM_ANTLION or self:Team()==TEAM_ANTLION_WORK then return end
	if not IsValid(self) then return end

	if self:GetVelocity():Length()>110 then
		if(self:Team()==TEAM_CHIEF or self:Team()==TEAM_REB_PC  or self:Team()==TEAM_POLICEC or self:Team()==TEAM_POLICE_RCT or self:Team()==TEAM_POLICE_05 or self:Team()==TEAM_POLICE_04 or self:Team()==TEAM_POLICE_03 or self:Team()==TEAM_POLICE_02 or self:Team()==TEAM_POLICE_01 or self:Team()==TEAM_OTA or self:Team()==TEAM_GUNPC or self:Team()==TEAM_OTA_KING or self:Team()==TEAM_REB_PC or self:Team()==TEAM_OTA_PRISON) then
			self:EmitSound("npc/metropolice/gear"..math.random(5,6)..".wav", 90, 75)
		end
		self:setSelfDarkRPVar("Endurance", math.Clamp(self:getDarkRPVar("Endurance") - value , 0, 100))
		self:GetTable().LastEnduranceUpdate = CurTime()
	else
		self:setSelfDarkRPVar("Endurance", math.Clamp(self:getDarkRPVar("Endurance") + 5, 0, 100))
		self:GetTable().LastEnduranceUpdate = CurTime()
	end


	if self:getDarkRPVar("Endurance") >50 and (self:Team()==TEAM_CHIEF or self:Team()==TEAM_REB_PC or self:Team()==TEAM_POLICE_GHOST or self:Team()==TEAM_POLICEC or self:Team()==TEAM_POLICE_RCT or self:Team()==TEAM_POLICE_05 or self:Team()==TEAM_POLICE_04 or self:Team()==TEAM_POLICE_03 or self:Team()==TEAM_POLICE_02 or self:Team()==TEAM_POLICE_01 or self:Team()==TEAM_OTA or self:Team()==TEAM_GUNPC or self:Team()==TEAM_OTA_KING or self:Team()==TEAM_REB_PC) then
		self:SetRunSpeed( 220)
	elseif self:getDarkRPVar("Endurance") >50 then
		self:SetRunSpeed( 180)
	elseif self:getDarkRPVar("Endurance") <10 then		
		self:SetRunSpeed( 100)
    if (CurTime() < NextPrintTime) then self:SetRunSpeed( 100) end   
	NextPrintTime = CurTime() + 7
	end
	
	
end

