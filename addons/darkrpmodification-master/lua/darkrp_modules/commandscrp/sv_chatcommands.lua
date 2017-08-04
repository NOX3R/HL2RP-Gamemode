/*---------------------------------------------------------
Talking
 ---------------------------------------------------------*/
local function PM(ply, args)
DarkRP.notify(ply, 1, 4, "Commande supprimée pour éviter le Méta")
return ""
end
DarkRP.defineChatCommand("pm", PM, 1.5)

local function Apply(ply, args)
	local DoSay = function(text)

		if GAMEMODE.Config.alltalk then
			for _, target in pairs(player.GetAll()) do
				DarkRP.talkToPerson(target, team.GetColor(ply:Team()), ply:Nick() .. " " .. text)
			end
		else
				DarkRP.talkToRange(ply, ply:Nick().. " montre son pass citoyen :"..ply:Nick(), text,300)
		end
	end
	return args, DoSay
		

end
DarkRP.defineChatCommand("apply", Apply, 1.5)

local function SayThroughRadio(ply,args)
	if not ply.RadioChannel then ply.RadioChannel = 1 end
	if not args or args == "" then
		DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "argument", ""))
		return ""
	end
	local DoSay = function(text)
		if text == "" then
			DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "argument", ""))
			return
		end
		for k,v in pairs(player.GetAll()) do
			if v.RadioChannel == ply.RadioChannel then
				DarkRP.talkToPerson(v, Color(180,180,180,255), DarkRP.getPhrase("radio_x", ply.RadioChannel), Color(180,180,180,255), text, ply)
			end
		end
	end
	return args, DoSay
end
DarkRP.defineChatCommand("radio", SayThroughRadio, 1.5)

local function SayThroughRequest(ply,args)

	if not args or args == "" then
		DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "argument", ""))
		return ""
	end
	local DoSay = function(text)
		if text == "" then
			DarkRP.notify(ply, 1, 4, ply:Nick()..DarkRP.getPhrase("invalid_x", "argument", ""))
			return
		end
		for k,v in pairs(player.GetAll()) do
			if (v:Team()==TEAM_CHIEF or v:Team()==TEAM_REB_PC  or v:Team()==TEAM_POLICEC or v:Team()==TEAM_POLICE_RCT or v:Team()==TEAM_POLICE_05 or v:Team()==TEAM_POLICE_04 or v:Team()==TEAM_POLICE_03 or v:Team()==TEAM_POLICE_02 or v:Team()==TEAM_POLICE_01 or v:Team()==TEAM_OTA or v:Team()==TEAM_GUNPC or v:Team()==TEAM_OTA_KING or v:Team()==TEAM_REB_PC or v:Team()==TEAM_OTA_PRISON)  then
				DarkRP.talkToPerson(v, Color(255, 255, 255,255), "[Requête]" , Color(18, 149, 241, 255), ply:Nick().." - "..text, ply)
			end
		end
	end
	return args, DoSay
end
DarkRP.defineChatCommand("request", SayThroughRequest, 1.5)

local function KickDoor(ply, args)
            local door = ply:GetEyeTraceNoCursor().Entity;
            local trace = ply:GetEyeTraceNoCursor();
            local target = trace.Entity;
           
            if ( IsValid(door) and trace.Entity:isDoor() ) then
				if(ply:Team()==TEAM_CHIEF or ply:Team()==TEAM_REB_PC or ply:Team()==TEAM_POLICE_GHOST or ply:Team()==TEAM_POLICEC or ply:Team()==TEAM_POLICE_RCT or ply:Team()==TEAM_POLICE_05 or ply:Team()==TEAM_POLICE_04 or ply:Team()==TEAM_POLICE_03 or ply:Team()==TEAM_POLICE_02 or ply:Team()==TEAM_POLICE_01 or ply:Team()==TEAM_OTA or ply:Team()==TEAM_GUNPC or ply:Team()==TEAM_OTA_KING or ply:Team()==TEAM_REB_PC) then
                                    if (target:GetPos():Distance( ply:GetShootPos() ) <= 64) then
                                            if door:GetClass()=="prop_door_rotating" then
												umsg.Start("anim_sayhi", RP)
												umsg.Entity(ply)
												umsg.End()
												ply:EmitSound("physics/wood/wood_box_impact_hard3.wav")
												trace.Entity:Fire("open", "", 2)
												trace.Entity:Fire("setanimation", "open", 0)
                                               		DarkRP.talkToRange(ply, ply:Nick() .. " défonce la porte à coup de pied!", "", 250)
                                            else
												DarkRP.notify(ply, 1, 8, "Vous ne pouvez pas défoncer cette porte!")
                                            end;
                                    else
											DarkRP.notify(ply, 1, 8, "La porte est trop loin!")
                                    end;
				end;
            else
				DarkRP.notify(ply, 1, 8, "Vous devez regarder une porte!")
            end;
end
DarkRP.defineChatCommand("doorkick", KickDoor, 1.5)



local function Me(ply, args)
	if args == "" then
		DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "argument", ""))
		return ""
	end

	local DoSay = function(text)
		if text == "" then
			DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "argument", ""))
			return ""
		end
		if GAMEMODE.Config.alltalk then
			for _, target in pairs(player.GetAll()) do
				DarkRP.talkToPerson(target, team.GetColor(ply:Team()), ply:Nick() .. " " .. text)
			end
		else
			DarkRP.talkToRange(ply, ply:Nick() .. " " .. text, "", 250)
		end
	end
	return args, DoSay
end
DarkRP.defineChatCommand("me", Me, 1.5)

local function PlayerRoll(ply, args)
	
	local gain=0
	if(ply:Team()==TEAM_POLICE_05) then gain=15 end
	if(ply:Team()==TEAM_POLICE_04) then gain=20 end
	if(ply:Team()==TEAM_POLICE_03) then gain=30 end
	if(ply:Team()==TEAM_POLICE_02) then gain=40 end
	if(ply:Team()==TEAM_POLICE_01) then gain=50 end
	if(ply:Team()==TEAM_CHIEF) then gain=60 end
	if(ply:Team()==TEAM_GUNPC) then gain=20 end
	if(ply:Team()==TEAM_POLICEC) then gain=15 end
	if(ply:Team()==TEAM_OTA) then gain=70 end
	if(ply:Team()==TEAM_OTA_KING) then gain=80 end
	if(ply:Team()==TEAM_CWUM) then gain=10 end
	if(ply:Team()==TEAM_CWU) then gain=10 end
	if(ply:Team()==TEAM_CWUF) then gain=10 end
	if(ply:Team()==TEAM_COOK) then gain=10 end
	if(ply:Team()==TEAM_POLICE_GHOST) then gain=25 end	
	if(ply:Team()==TEAM_REB) then gain=15 end	
	if(ply:Team()==TEAM_REBF) then gain=15 end	
	if(ply:Team()==TEAM_REB_MED) then gain=15 end	
	if(ply:Team()==TEAM_REB_MEDF) then gain=15 end
	if(ply:Team()==TEAM_REB_ELITE) then gain=30 end
	if(ply:Team()==TEAM_REB_ELITEF) then gain=30 end
	if(ply:Team()==TEAM_CHIEF_REBELLE) then gain=50 end	
	if(ply:Team()==TEAM_VORT) then gain=40 end
	if(ply:Team()==TEAM_VORT_SCIEN) then gain=40 end

	if(ply:Health()<50) then gain=gain/2 end
	local roll=math.random(1, 100)+gain
	if(roll>100) then roll=100 end
	local DoSay = function(text)
		if GAMEMODE.Config.alltalk then
			for _, target in pairs(player.GetAll()) do
				DarkRP.talkToPerson(target, team.GetColor(ply:Team()), ply:Nick() .. " " .. text)
			end
		elseif(ply:Health()<50) then 
			DarkRP.talkToRange(ply, "**"..ply:Nick() .. " a fait un roll de " .. roll.." avec un gain inclus malus ".. gain ..".", "", 250)
		
		else
			DarkRP.talkToRange(ply, "**"..ply:Nick() .. " a fait un roll de " .. roll.." avec un gain inclus de "..gain..".", "", 250)
		end
	end
	return args, DoSay
end
DarkRP.defineChatCommand("roll", PlayerRoll, 1.5)

local function PlayerIt(ply, args)

	local DoSay = function(text)
		if GAMEMODE.Config.alltalk then
			for _, target in pairs(player.GetAll()) do
				DarkRP.talkToPerson(target, team.GetColor(ply:Team()), ply:Nick() .. " " .. text)
			end
		else
			DarkRP.talkToRange(ply, "**"..text, "", 250)
		end
	end
	return args, DoSay
end
DarkRP.defineChatCommand("it", PlayerIt, 1.5)



local function LOOC(ply, args)
	if args == "" then
		DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "argument", ""))
		return ""
	end

	local DoSay = function(text)
		if text == "" then
			DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "argument", ""))
			return ""
		end
		if GAMEMODE.Config.alltalk then
			for _, target in pairs(player.GetAll()) do
				DarkRP.talkToPerson(target, team.GetColor(ply:Team()), ply:Nick() .. " " .. text)
			end
		else
			DarkRP.talkToRange(ply, "[LOOC]" .. ply:Nick(), text, 200)
		end
	end
	return args, DoSay
end
DarkRP.defineChatCommand("looc", LOOC, true, 1.5)

local function PlayerAdvertise(ply, args)
	if args == "" then
		DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "argument", ""))
		return ""
	end
	local DoSay = function(text)
		if text == "" then
			DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "argument", ""))
			return
		end
		for k,v in pairs(player.GetAll()) do
			local col = team.GetColor(ply:Team())
			DarkRP.talkToPerson(v, col, DarkRP.getPhrase("advert") .." "..ply:Nick(), Color(255,255,0,255), text, ply)
		end
	end
	return args, DoSay
end
DarkRP.defineChatCommand("advert", PlayerAdvertise, 1.5)

