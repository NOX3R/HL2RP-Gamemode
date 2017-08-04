local function SetDescription (ply,args)
	umsg.Start("Opendesc",ply)
	umsg.End()
	return ""
end
DarkRP.defineChatCommand("setdescription", SetDescription)

local function Description (ply,args)
	if args == "" then
		DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "argument", ""))
		return ""
	end

	
	ply:setDarkRPVar("Description", args)
	DarkRP.notify(ply, 1, 4, "Votre description physique a été mis à jour: "..ply:getDarkRPVar("Description"))
	return ""
end
DarkRP.defineChatCommand("description", Description)
