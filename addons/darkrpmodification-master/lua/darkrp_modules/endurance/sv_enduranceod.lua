local function EndurancePlayerSpawn(ply)
	ply:setSelfDarkRPVar("Endurance", 100)
end
hook.Add("PlayerSpawn", "EndurancePlayerSpawn", EndurancePlayerSpawn)



local function EnduranceThink()

	for k, v in pairs(player.GetAll()) do
		if v:Alive() and (not v.LastEnduranceUpdate or CurTime() - v.LastEnduranceUpdate > 0.4) then
			v:EnduranceUpdate()
		end
	end
end
hook.Add("Think", "EnduranceThink", EnduranceThink)



local function EndurancePlayerInitialSpawn(ply)
	ply:newEnduranceData()
end
hook.Add("PlayerInitialSpawn", "EndurancePlayerInitialSpawn", EndurancePlayerInitialSpawn)

for k, v in pairs(player.GetAll()) do
	v:newEnduranceData()
end


