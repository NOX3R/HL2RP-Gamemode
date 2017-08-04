local function ccArrest(ply, cmd, args)


	if not args or not args[1] then
		if ply:EntIndex() == 0 then
			print(DarkRP.getPhrase("invalid_x", DarkRP.getPhrase("arguments"), ""))
		else
			ply:PrintMessage(2, DarkRP.getPhrase("invalid_x", DarkRP.getPhrase("arguments"), ""))
		end
		return
	end

	if DarkRP.jailPosCount() == 0 then
		if ply:EntIndex() == 0 then
			print(DarkRP.getPhrase("no_jail_pos"))
		else
			ply:PrintMessage(2, DarkRP.getPhrase("no_jail_pos"))
		end
		return
	end

	local targets = DarkRP.findPlayers(args[1])

	if not targets then
		if ply:EntIndex() == 0 then
			print(DarkRP.getPhrase("could_not_find", tostring(args[1])))
		else
			ply:PrintMessage(2, DarkRP.getPhrase("could_not_find", tostring(args[1])))
		end

		return
	end

	for k, target in pairs(targets) do
	
		local length = tonumber(args[2])
		if length then
			target:arrest(length, ply)
		else
			target:arrest(nil, ply)
		end

		if ply:EntIndex() == 0 then
		    
			DarkRP.log("Console force-arrested "..target:SteamName(), Color(0, 255, 255))
		else
			DarkRP.log(ply:Nick().." ("..ply:SteamID()..") force-arrested "..target:SteamName(), Color(0, 255, 255))
		end
	end
end
concommand.Add("rp_arresttation", ccArrest)