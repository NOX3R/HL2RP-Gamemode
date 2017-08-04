
-----------------------------------------------------
Chat_History = {}
ShouldDrawChat = false
ChatLine  = ""
ChatGrad = surface.GetTextureID("gui/gradient")

local TextColor = Color(255,255,255,255)
local OutLine = Color(20,20,20,255)
local CommandColor = Color(255,255,255)
local x 	   = 20
local y 	   = ScrH() - 200
local HUDPrefix = ""
local HUDSub = 0
local pairs = pairs
local type = type
local surface = surface
local math = math
local draw = draw

local function StartChat()
	net.Start("DarkRP_ToggleChat")
	net.SendToServer()
end


hook.Add("StartChat","RealChat_Start",function(text) ShouldDrawChat = true StartChat() return true end)
hook.Add("FinishChat","RealChat_Finish",function(text) ShouldDrawChat = false end)
hook.Add("ChatTextChanged","RealChat_Receive",function(text) ChatLine = text .. "|" end)

surface.CreateFont("SWRP_ChatText",{font = "Sansation",size =  18,weight = 400,antialias = true})

function CleanTables(in_table)
	if (table.Count(in_table) >= 20) then
		table.remove(in_table,1)
	end
end


-- BEGIN EDIT



-- END EDIT



local ChatPrefix = {
	{"(OOC)", Color(91,91,91)},
	{"(PLAYER REPORT)", Color(255,0,0)},
	{"(Annonce)", Color(255,255,0)},
	{"(Radio)",Color(0,50,250)},
	{"(Org)", Color(205,0,255)},
	{"(Urgence)", Color(10,10,200)},
	{"(Taxi)", Color(255,166,0)},
	{"(SMS)", Color(194,0,211)},
	{"(DROPMONEY)", Color(0,50,200)}
}

function GetPrefixColor(prefix)
	for k,v in pairs(ChatPrefix) do
		if v[1] == prefix then
			return v[2]
		end
	end
	return Color(0,0,0)
end

local CommandPrefix = {
	{"// ","OOC: ",GetPrefixColor("(OOC)")},
	{"/// ","Report: ",GetPrefixColor("(PLAYER REPORT)")},
	{"/ooc ","OOC: ",GetPrefixColor("(OOC)")},
	{"/radio ", "Radio: ", GetPrefixColor("(Radio)")},
	{"/dropmoney ", "Montant: ", GetPrefixColor("(DROPMONEY)")},
	{"/advert ","Annonce: ",GetPrefixColor("(Annonce)")},
	{"/broadcast ","Cité: ",GetPrefixColor("(Annonce)")},
	{"/me ","Personnage: ",GetPrefixColor("(PLAYER REPORT)")},
	{"/it ","Narration: ",GetPrefixColor("(PLAYER REPORT)")},
	{"/looc ","LOOC: ",GetPrefixColor("(OOC)")},
}

function GetCommandInfo(Input)
	Input = string.sub(Input, 0, -2)
	for k,v in pairs(CommandPrefix) do
		if string.find(Input,v[1]) == 1 then
			return string.len(v[1]) + 1,v[2],v[3]
		end
	end
	return 0,"Parler: ",Color(255,255,255)
end

-- BEGIN EDIT
local emoticons = { }
local insert = table.insert

local function escape(s)
	return (s:gsub('[%-%.%+%[%]%(%)%$%^%%%?%*]','%%%1'):gsub('%z','%%z'))
end

local facesClockwise = {")", "(", "D", "P", "C", "X", "B", "3", "S", "]", "[", "}", "{", ">", "<", "o", "O", "0", "8", "|", "V", "L", "&"}
-- Lower parts.
local facesCounterClockwise = {")", "(", "D", "C", "X", "S", "]", "[", "}", "{", ">", "<", "o", "O", "0", "8", "|", "V", "L", "&"}
-- Lower parts.


insert(emoticons, { "<3", true })	--	Special.


for abc = 1, #facesClockwise do
	insert(emoticons, { ":" .. facesClockwise[abc] })
	insert(emoticons, { ":-" .. facesClockwise[abc] })
	insert(emoticons, { ":'" .. facesClockwise[abc] })
	insert(emoticons, { ">:" .. facesClockwise[abc] })
	insert(emoticons, { "<:" .. facesClockwise[abc] })
	insert(emoticons, { ";" .. facesClockwise[abc] })
	insert(emoticons, { ";-" .. facesClockwise[abc] })
	insert(emoticons, { ";'" .. facesClockwise[abc] })
	insert(emoticons, { ">;" .. facesClockwise[abc] })
	insert(emoticons, { "<;" .. facesClockwise[abc] })
	insert(emoticons, { "=" .. facesClockwise[abc] })
	insert(emoticons, { "x" .. facesClockwise[abc] })
end

for abc = 1, #facesCounterClockwise do
	insert(emoticons, { facesCounterClockwise[abc] .. ":", true })
	insert(emoticons, { facesCounterClockwise[abc] .. "-:", true })
	insert(emoticons, { facesCounterClockwise[abc] .. "':", true })
	insert(emoticons, { facesCounterClockwise[abc] .. ":<", true })
	insert(emoticons, { facesCounterClockwise[abc] .. ":>", true })
	insert(emoticons, { facesCounterClockwise[abc] .. ";", true })
	insert(emoticons, { facesCounterClockwise[abc] .. "-;", true })
	insert(emoticons, { facesCounterClockwise[abc] .. "';", true })
	insert(emoticons, { facesCounterClockwise[abc] .. ";<", true })
	insert(emoticons, { facesCounterClockwise[abc] .. ";>", true })
	insert(emoticons, { facesCounterClockwise[abc] .. "=", true })
end

local DrawText = surface.DrawText
local SetTextPos = surface.SetTextPos
local PopModelMatrix = cam.PopModelMatrix
local PushModelMatrix = cam.PushModelMatrix


local matrix = Matrix()
local matrixAngle = Angle(0, 0, 0)
local matrixScale = Vector(0, 0, 0)
local matrixTranslation = Vector(0, 0, 0)


function draw.TextRotated(text, x, y, color, outline, angle)
	matrixAngle.y = angle
	matrix:SetAngles(matrixAngle)
	
	local w, h = surface.GetTextSize(text)

	matrixTranslation.x = x + (angle > 0 and h or -2) 
	matrixTranslation.y = y + (angle > 0 and 6 or 20)
	matrix:SetTranslation(matrixTranslation)
	
	matrixScale.x = 1
	matrixScale.y = 1
	matrix:Scale(matrixScale)
	
	SetTextPos(0, 0)
	
	PushModelMatrix(matrix)
		draw.SimpleTextOutlined(text, "SWRP_ChatText", 0, 0, color, 0, 0, 1, outline)
	PopModelMatrix()
end

local function GetEmote(split)
	for j = 1, #emoticons do
		local em = emoticons[j]

		if split == em[1] then
			return {em[1], em[2] or false}
		end
	end
end

local function IsEmote(split)
	return GetEmote(split) != nil
end

local function DrawEmote(emote, startpos, y, color, outline)
	draw.TextRotated(emote[1], startpos, y, color, outline, emote[2] and -90 or 90)

	local w, h = surface.GetTextSize("__")
	return w
end

local function DrawSplit(split, startpos, y, color, outline)
	if IsEmote(split) then
		return DrawEmote(GetEmote(split), startpos, y, color, outline)
	end

	draw.SimpleTextOutlined(split, "SWRP_ChatText", startpos, y, color, 0, 0, 1, outline)
	local w, h = surface.GetTextSize(split)
	return w
end

local function DrawSplits(splits, startpos, y, color, outline)
	local spc,_ = surface.GetTextSize(" ")
	local pos = startpos
	for i = 1, #splits do
		local split = splits[i]

		pos = pos + DrawSplit(split, pos, y, color, outline) + spc
	end
	return pos
end

-- END EDIT

local function DrawChat(alpha)
	surface.SetFont( "SWRP_ChatText" )
	
	local t = #Chat_History+1


	for k,v in pairs( Chat_History ) do
		if type(v.Prefix) == "table" then return end
		surface.SetFont("SWRP_ChatText")

		local tw,th = surface.GetTextSize(v.Name)
		local prefixtw,prefixth = surface.GetTextSize(v.Prefix)
		local rw,rh = surface.GetTextSize(v.Rank)
		if alpha then
			local a 	= 255*math.Clamp(v.Time-CurTime(),0,1)
			
			OutLine.a = a
			v.PrefixColor.a = a
			v.RankColor.a = a
			v.SenderColor.a = a

			TextColor.a = a
		else
			OutLine.a = 255
			v.PrefixColor.a = 255
			v.RankColor.a = a
			v.SenderColor.a = 255

			TextColor.a = 255
		end
		

		draw.SimpleTextOutlined(v.Prefix, "SWRP_ChatText", x+rw +5, y-20*(t-k), v.PrefixColor, 0, 0, 1, OutLine) 
		draw.SimpleTextOutlined(v.Rank, "SWRP_ChatText", x, y-20*(t-k), v.RankColor, 0, 0, 1, OutLine) 
		draw.SimpleTextOutlined(v.Name, "SWRP_ChatText", x+prefixtw+rw, y-20*(t-k), v.SenderColor, 0, 0, 1, OutLine)


		-- START EDIT

		local splits = string.Explode(" ", v.Text)

		
		local clr = v.SenderColor
		DrawSplits(splits, x+tw+rw+prefixtw + 10, y-20*(t-k), clr, OutLine)


		-- if (!v.Me) then
		-- 	draw.SimpleTextOutlined(v.Text, "SWRP_ChatText", x+tw+rw+prefixtw + 10, y-20*(t-k), TextColor, 0, 0, 1, OutLine) 
		-- else
		-- 	draw.SimpleTextOutlined(v.Text, "SWRP_ChatText", x+tw+rw+prefixtw + 10, y-20*(t-k), v.SenderColor, 0, 0, 1, OutLine) 
		-- end

		-- END EDIT

		
		OutLine.a = 255
		TextColor.a = 255
	
		if (CurTime() > v.Time) then end
	end
end

hook.Add("HUDPaint","RealChat_HUDPaint",function()		
	if (LocalPlayer().HideHud) then return false end
	if (ShouldDrawChat) then
		surface.SetFont("SWRP_ChatText")
		HUDSub, HUDPrefix, CommandColor = GetCommandInfo(ChatLine)

		surface.SetDrawColor( 0, 0, 0, 120)
		draw.RoundedBox( 6, x, y, surface.GetTextSize(HUDPrefix) + surface.GetTextSize(string.sub(ChatLine,HUDSub)) + 10, 20, Color( 0, 0, 0, 150 ) )
		draw.SimpleText(HUDPrefix, "SWRP_ChatText", x+2, y, CommandColor)


		-- BEGIN EDIT
		
		local spc,_ = surface.GetTextSize(" ")
		local pos = DrawSplits(string.Explode(" ", string.sub(ChatLine,HUDSub,-2)), x+surface.GetTextSize(HUDPrefix)+2, y, Color(255,255,255), Color(0,0,0,0))
		draw.SimpleText("|", "SWRP_ChatText", pos - spc, y, Color(255,255,255))

		-- draw.SimpleText(string.sub(ChatLine,HUDSub), "SWRP_ChatText", x+surface.GetTextSize(HUDPrefix)+2, y, Color(255,255,255))
		
		-- END EDIT


		DrawChat(false)
	else
		DrawChat(true)
	end
end)

function chat.AddMe(PrefixColor,Prefix,Sender,PlayerColor,Message)
	CreateChatLine(Message,Sender,Prefix,Color(255,0,0),Color(255,0,0),true)
end

-- BEGIN EDIT

function chat.AddText(...)

	local a = {...}
	local msg = ""
	local clr = nil

	for _,c in pairs(a) do

		if type(c) == "string" then
			msg = msg .. c
		elseif c.r and c.g and c.b then
			clr = c
		end

	end

	CreateChatLine(msg, "", "", Color(0,255,255), clr or Color(0,255,0), false, "", Color(0,255,255))

end

-- END EDIT


net.Receive("Action", function(len)

local ulxcmd = net.ReadString()
CreateChatLine(ulxcmd,"","[Administration]",Color(232, 37, 24),Color(255,255,255),false)

end)

net.Receive("PlayerReport", function(len)

    if not LocalPlayer():IsAdmin() then return end
    local report = net.ReadString()
    CreateChatLine(report,"","[Admin Report]",Color(232, 37, 24),Color(255,255,255),false)

end)


net.Receive("ReportSent", function(len)


    CreateChatLine("Vous avez envoyer un Report aux Admins!","","[Report]",Color(232, 37, 24),Color(255,255,255),false)



end)


hook.Add("OnPlayerChat", "FRchat", function(ply, msg, team, dead, prefixText, col1, col2)

    if ( IsValid( ply ) ) then
    
        if ply:IsUserGroup("superadmin") then
            CreateChatLine(msg, "", prefixText,col1,col2, true, " [Fondateur]", Color(232, 37, 24))	
        elseif ply:IsUserGroup("Super Admin") then
            CreateChatLine(msg, "", prefixText,col1,col2, true, " [Super Admin]", Color(255, 69, 0))
        elseif ply:IsUserGroup("admin+") then
            CreateChatLine(msg, "", prefixText,col1,col2, true, " [Administrateur+]", Color(232, 37, 24))
        elseif ply:IsUserGroup("admin") then
            CreateChatLine(msg, "", prefixText,col1,col2, true, " [Admin]", Color(232, 37, 24))	
        elseif ply:IsUserGroup("modo+") then
            CreateChatLine(msg, "", prefixText,col1,col2, true, " [Modérateur+]", Color(0, 255, 0))
        elseif ply:IsUserGroup("modo") then
            CreateChatLine(msg, "", prefixText,col1,col2, true, " [Modérateur]", Color(0, 255, 0))
        elseif ply:IsUserGroup("modotest") then
            CreateChatLine(msg, "", prefixText,col1,col2, true, " [Modérateur Test]", Color(0, 255, 0))
        else
            CreateChatLine(msg, "", prefixText,col1,col2, true, "", Color(255, 0, 0))
        end
    
    end
    
    
	return true
end)

hook.Add("ChatText","MChat_ChatText",function( int , name , text )
	if (int == 0) then CreateChatLine(text,"","[Half Reborn]",Color(50, 150, 255),Color(255,255,255),false) chat.PlaySound() end
end)