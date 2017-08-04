/*---------------------------------------------------------------------------
Functions
---------------------------------------------------------------------------*/
local meta = FindMetaTable("Player")
function meta:changeTeam(t, force)
	local prevTeam = self:Team()

	if self:isArrested() and not force then
		DarkRP.notify(self, 1, 4, DarkRP.getPhrase("unable", team.GetName(t), ""))
		return false
	end

	if t ~= GAMEMODE.DefaultTeam and not self:changeAllowed(t) and not force then
		DarkRP.notify(self, 1, 4, DarkRP.getPhrase("unable", team.GetName(t), "banned/demoted"))
		return false
	end

	if self.LastJob and GAMEMODE.Config.changejobtime - (CurTime() - self.LastJob) >= 0 and not force then
		DarkRP.notify(self, 1, 4, DarkRP.getPhrase("have_to_wait",  math.ceil(GAMEMODE.Config.changejobtime - (CurTime() - self.LastJob)), "/job"))
		return false
	end

	if self.IsBeingDemoted then
		self:teamBan()
		self.IsBeingDemoted = false
		self:changeTeam(GAMEMODE.DefaultTeam, true)
		DarkRP.destroyVotesWithEnt(self)
		DarkRP.notify(self, 1, 4, DarkRP.getPhrase("tried_to_avoid_demotion"))

		return false
	end


	if prevTeam == t then
		DarkRP.notify(self, 1, 4, DarkRP.getPhrase("unable", team.GetName(t), ""))
		return false
	end

	local TEAM = RPExtraTeams[t]
	if not TEAM then return false end

	if TEAM.customCheck and not TEAM.customCheck(self) and (not force or force and not GAMEMODE.Config.adminBypassJobRestrictions) then
		local message = isfunction(TEAM.CustomCheckFailMsg) and TEAM.CustomCheckFailMsg(self, TEAM) or
			TEAM.CustomCheckFailMsg or
			DarkRP.getPhrase("unable", team.GetName(t), "")
		DarkRP.notify(self, 1, 4, message)
		return false
	end

	if not force then
		if type(TEAM.NeedToChangeFrom) == "number" and prevTeam ~= TEAM.NeedToChangeFrom then
			DarkRP.notify(self, 1,4, DarkRP.getPhrase("need_to_be_before", team.GetName(TEAM.NeedToChangeFrom), TEAM.name))
			return false
		elseif type(TEAM.NeedToChangeFrom) == "table" and not table.HasValue(TEAM.NeedToChangeFrom, prevTeam) then
			local teamnames = ""
			for a,b in pairs(TEAM.NeedToChangeFrom) do teamnames = teamnames.." or "..team.GetName(b) end
			DarkRP.notify(self, 1,4, string.format(string.sub(teamnames, 5), team.GetName(TEAM.NeedToChangeFrom), TEAM.name))
			return false
		end
		local max = TEAM.max
		if max ~= 0 and -- No limit
		(max >= 1 and team.NumPlayers(t) >= max or -- absolute maximum
		max < 1 and (team.NumPlayers(t) + 1) / #player.GetAll() > max) then -- fractional limit (in percentages)
			DarkRP.notify(self, 1, 4,  DarkRP.getPhrase("team_limit_reached", TEAM.name))
			return false
		end
	end

	if TEAM.PlayerChangeTeam then
		local val = TEAM.PlayerChangeTeam(self, prevTeam, t)
		if val ~= nil then
			return val
		end
	end

	local hookValue = hook.Call("playerCanChangeTeam", nil, self, t, force)
	if hookValue == false then return false end

	local isMayor = RPExtraTeams[prevTeam] and RPExtraTeams[prevTeam].mayor
	if isMayor and GetGlobalBool("DarkRP_LockDown") then
		DarkRP.unLockdown(self)
	end
	self:updateJob(TEAM.name)
	self:setSelfDarkRPVar("salary", TEAM.salary)
	DarkRP.notifyAll(0, 4, DarkRP.getPhrase("job_has_become", self:Nick(), TEAM.name))


	if self:getDarkRPVar("HasGunlicense") and GAMEMODE.Config.revokeLicenseOnJobChange then
		self:setDarkRPVar("HasGunlicense", nil)
	end
	if TEAM.hasLicense then
		self:setDarkRPVar("HasGunlicense", true)
	end

	self.LastJob = CurTime()

	if GAMEMODE.Config.removeclassitems then
		for k, v in pairs(DarkRPEntities) do
			if GAMEMODE.Config.preventClassItemRemoval[v.ent] then continue end
			if not v.allowed then continue end
			if type(v.allowed) == "table" and (table.HasValue(v.allowed, t) or not table.HasValue(v.allowed, prevTeam)) then continue end
			for _, e in pairs(ents.FindByClass(v.ent)) do
				if e.SID == self.SID then e:Remove() end
			end
		end

		if not GAMEMODE.Config.preventClassItemRemoval["spawned_shipment"] then
			for k,v in pairs(ents.FindByClass("spawned_shipment")) do
				if v.allowed and type(v.allowed) == "table" and table.HasValue(v.allowed, t) then continue end
				if v.SID == self.SID then v:Remove() end
			end
		end
	end

	if isMayor then
		for _, ent in pairs(self.lawboards or {}) do
			if IsValid(ent) then
				ent:Remove()
			end
		end
	end

	if isMayor and GAMEMODE.Config.shouldResetLaws then
		DarkRP.resetLaws()
	end

	self:SetTeam(t)
	hook.Call("OnPlayerChangedTeam", GAMEMODE, self, prevTeam, t)
	DarkRP.log(self:Nick().." ("..self:SteamID()..") changed to "..team.GetName(t), nil, Color(100, 0, 255))
	if self:InVehicle() then self:ExitVehicle() end
	if GAMEMODE.Config.norespawn and self:Alive() then
		self:StripWeapons()
		local vPoint = self:GetShootPos() + Vector(0,0,50)
		local effectdata = EffectData()
		effectdata:SetEntity(self)
		effectdata:SetStart( vPoint ) -- Not sure if we need a start and origin (endpoint) for this effect, but whatever
		effectdata:SetOrigin( vPoint )
		effectdata:SetScale(1)
		util.Effect("entity_remove", effectdata)
		hook.Call("UpdatePlayerSpeed", GAMEMODE, self)
		gamemode.Call("PlayerSetModel", self)
		gamemode.Call("PlayerLoadout", self)
	end
	if prevTeam == TEAM_HOBO or prevTeam == TEAM_HOBOF or prevTeam == TEAM_HOBOH or prevTeam == TEAM_HOBOZ or prevTeam == TEAM_VORT_ESCLAVE or prevTeam == TEAM_VORT_SCIEN or prevTeam == TEAM_VORT or prevTeam == TEAM_STALKER or prevTeam == TEAM_SCN_MINE or prevTeam == TEAM_SCN or prevTeam == TEAM_ANTLION or prevTeam == TEAM_ANTLION_WORK then 
		self:Kill()
	else
		 self:KillSilent()
	end

	umsg.Start("OnChangedTeam", self)
		umsg.Short(prevTeam)
		umsg.Short(t)
	umsg.End()
	return true
end