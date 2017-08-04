--REWARDS Data Server Dist
REWARDS.Database = {}

function REWARDS.Database.Setup()
	sql.Query("CREATE TABLE IF NOT EXISTS steam_rewards(steam char(20) NOT NULL, value INTEGER NOT NULL, PRIMARY KEY(steam));")
end
hook.Add("InitPostEntity","REWARDS_InitSetupDatabase",REWARDS.Database.Setup)

function REWARDS.Database.GroupJoin(ply)
	if not IsValid(ply) then return end
	sql.Query("INSERT INTO steam_rewards VALUES(" .. sql.SQLStr(ply:SteamID64()) .. ", " .. 1 .. ");")
end

function REWARDS.Database.GroupLeave(steamid)
    sql.Query("DELETE FROM steam_rewards WHERE steam = " .. sql.SQLStr(steamid) .. ";")
end

function REWARDS.Database.IsInGroup(ply)
	if not IsValid(ply) then return end
    local r = sql.QueryValue("SELECT value FROM steam_rewards WHERE steam = " .. sql.SQLStr(ply:SteamID64()) .. ";")
	if r and (tonumber(r) == 1) then return true
	else return false end
end

function REWARDS.Database.ClearAllRecords()
    sql.Query("DELETE FROM steam_rewards ;")
end