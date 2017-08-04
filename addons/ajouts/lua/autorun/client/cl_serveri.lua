include("autorun/sh_serveri.lua")

surface.CreateFont("DarkRPrulesArial", {
font = "Impact",
size = 20,
})

surface.CreateFont("DarkRPrulesArial2", {
font = "Impact",
size = 30,
})

surface.CreateFont("DarkRPrulesArial3", {
font = "Impact",
size = 25,
})

// Merci à addon suggestions pour ces fonctions
local function charWrap(text, pxWidth)
	local total = 0
	text = text:gsub(".", function(char)
		total = total + surface.GetTextSize(char)
		if total >= pxWidth then
			total = 0
			return "\n" .. char
		end
		return char
	end)

	return text, total
end

local function CutText(text, pxWidth, Font)
	local total = 0

	surface.SetFont(Font)

	local spaceSize = surface.GetTextSize(" ")
	text = text:gsub("(%s?[%S]+)", function(word)
		local char = string.sub(word, 1, 1)
		if char == "\n" or char == "\t" then
			total = 0
		end

		local wordlen = surface.GetTextSize(word)
		total = total + wordlen

		if wordlen >= pxWidth then
			local splitWord, splitPoint = charWrap(word, pxWidth)
			total = splitPoint
			return splitWord
		elseif total < pxWidth then
			return word
		end

		if char == " " then
			total = wordlen - spaceSize
			return "\n" .. string.sub(word, 2)
		end

		total = wordlen
		return "\n" .. word
	end)

	return text
end

//Maintenant cest moi qui ai fait ça

local function DrawDarkrpRules()
	DRFrame = vgui.Create("DFrame")
	DRFrame:SetSize(1000	,700)
	DRFrame:ShowCloseButton(false)
	DRFrame:Center()
	DRFrame:SetTitle("")
	DRFrame:MakePopup()

	local DRButton = vgui.Create("DButton",DRFrame)
	DRButton:SetSize(20,20)
	DRButton:SetPos(DRFrame:GetWide()-25,1)
	DRButton:SetText("")
	DRButton.DoClick = function()
		DRFrame:Close()
	end

	local DRScroll = vgui.Create("DScrollPanel",DRFrame)
	DRScroll:SetSize(DRFrame:GetWide(),DRFrame:GetTall()-25)
	DRScroll:SetPos(0,25)


	local DRLabel = vgui.Create("DLabel", DRScroll)
	DRLabel:SetText("")
	DRLabel:SetSize(DRFrame:GetWide()-50,30)
	DRLabel:SetPos(25,35)

	local DRLabel2 = vgui.Create("DLabel", DRScroll)
	DRLabel2:SetText("")
	surface.SetFont("DarkRPrulesArial3")
	local width, height = surface.GetTextSize(ajoutshl2.Rules)
	DRLabel2:SetSize(DRFrame:GetWide()-50,height+30)
	DRLabel2:SetPos(10,100)

	function DRScroll:Paint(w,h)
		surface.SetDrawColor(255,255,255)
		surface.DrawRect(0,0,w,h)
	end

	function DRLabel:Paint(w,h) 
		draw.DrawText(ajoutshl2.TitleRules, "DarkRPrulesArial2",w/2,0,ajoutshl2.TitleRulesColor,TEXT_ALIGN_CENTER)
	end

	function DRLabel2:Paint(w,h)
		draw.DrawText(CutText(ajoutshl2.Rules,DRScroll:GetWide()-60,"DarkRPrulesArial3"), "DarkRPrulesArial3",15,0,ajoutshl2.RulesColor)
	end

	function DRButton:Paint(w,h)
		draw.DrawText("x","DarkRPrulesArial", 12,0,Color(255,255,255))
	end

	function DRFrame:Paint(w,h)
		surface.SetDrawColor(ajoutshl2.PanelColor)
		surface.SetMaterial(Material("ajoutshl2/font.png"))
		surface.DrawTexturedRect(0,0,w,25)
		draw.DrawText(ajoutshl2.PanelTitle,"DarkRPrulesArial",7,2,ajoutshl2.PanelTitleColor)
		surface.DrawRect(1,25,w-2,h-25)
	end

end

concommand.Add(ajoutshl2.consolecmd,DrawDarkrpRules)

hook.Add("Think", "DarkrprulesOpenKey", function()
	if input.IsKeyDown(ajoutshl2.key) and not AlreadyPressed then
		AlreadyPressed = true
			if not IsValid(DRFrame) then
				DrawDarkrpRules()
			else
				DRFrame:Close()
			end
	elseif AlreadyPressed and not input.IsKeyDown(ajoutshl2.key) then
		AlreadyPressed = false
	end
end)