local function HMThink()
	if not GAMEMODE.Config.hungerspeed then return end
	if team.NumPlayers(TEAM_COOK) == 0  then return end
	for k, v in pairs(player.GetAll()) do
		if v:Alive() and (not v.LastHungerUpdate or CurTime() - v.LastHungerUpdate > 10) then
			v:hungerUpdate()
		end
	end
end
hook.Add("Think", "HMThink", HMThink)