local vgui = vgui
local table = table


local PlayerActions = {}
local ServerActions = {}
local BansActions = {}

function LoadAdminTable()

	BansActions = {
		{ Reason = "Freepunch", Time = 100},
		{ Reason = "Freekill", Time = 300},
		{ Reason = "Anglais", Time = 0},
		{ Reason = "Insulte", Time = 60},
		{ Reason = "Freearrest", Time = 160},
		{ Reason = "Props Kill", Time = 200},
		{ Reason = "Prop Surf", Time = 200},
		{ Reason = "Spam vocal", Time = 60},
		{ Reason = "Trolleur", Time = 700},
		{ Reason = "Cheater", Time = 0},
		{ Reason = "Spam chat", Time = 60},
		{ Reason = "Joueur perturbateur pendant un event", Time = 60}
	}

end


function GetPlayerOrder()
	local PlayerTable = PlayerTable or {}
	table.Empty(PlayerTable)
	for k,v in pairs(player.GetAll()) do
		table.insert(PlayerTable,{SteamID = v:SteamID(), Name = v:Name()})
	end
	table.SortByMember(PlayerTable,"Name",function(a, b) return a > b end)
	return PlayerTable
end

-- don't call this function


local BanTimeValue
function UpdateBanValue(reasontime,banscount,gravity)
	banscount = banscount + 1
	print("ReasonTime : "..reasontime.. " Gravity : "..gravity)
	local TotalBanTime = (reasontime * (gravity*banscount))
	BanTimeValue:SetValue(TotalBanTime)
end


local function TakeReason(name,cb,o,c, len)


		LoadAdminTable()
		local BanTime = 1440
		local ImpactMultiplier = 1
	
		local BanCount = 1
			
		if o == "ban" and not c then
		
		local Steam = net.ReadString()
		
		for k,v in pairs(player.GetAll()) do
			if (v:SteamID() == Steam) then
				name = v:GetNWString("Name")
			end
		end
		
		local function gp(name) for _,_p in pairs(player.GetAll()) do if _p:Nick()==name then return _p end end return nil end
		
		local PlayerFrame = vgui.Create("DFrame") 
		PlayerFrame:SetSize(350, 320)
		PlayerFrame:Center()
		PlayerFrame:SetTitle("Panneau de Ban")
		PlayerFrame:SetSkin("Black")
		PlayerFrame:SetDraggable(true)
		PlayerFrame:SetSizable(false)
		PlayerFrame:ShowCloseButton(true)
		PlayerFrame:MakePopup()
		
		local TargetName = vgui.Create("DLabel", PlayerFrame)
		TargetName:SetPos(37,50)
		TargetName:SetText("Joueur : ")
		TargetName:SizeToContents()
		local TargetValue = vgui.Create("DTextEntry", PlayerFrame)
		TargetValue:SetPos(80,47)
		TargetValue:SetWide(250)
		TargetValue:SetText(name)
		
		TargetValue:SetEditable(false)
		
		local TargetSteamID = vgui.Create("DLabel", PlayerFrame)
		TargetSteamID:SetPos(30,80)
		TargetSteamID:SetText("SteamID : ")
		TargetSteamID:SizeToContents()

		
		local TargetSteamIDValue = vgui.Create("DTextEntry", PlayerFrame)
		TargetSteamIDValue:SetPos(80,77)
		TargetSteamIDValue:SetWide(250)
		--TargetSteamIDValue:SetText(Steam)
		TargetSteamIDValue:SetText(gp(name):SteamID())
		--TargetSteamIDValue:SetText( Steam )
		--TargetSteamIDValue:SetText(Steam.. " - 0 ban(s) found !")
		
		
		TargetSteamIDValue:SetEditable(false)
		
		
		local BanTimeLabel = vgui.Create("DLabel", PlayerFrame)
		BanTimeLabel:SetPos(40,110)
		BanTimeLabel:SetText("Temps : ")
		BanTimeLabel:SizeToContents()

		BanTimeValue = vgui.Create("DTextEntry", PlayerFrame)
		BanTimeValue:SetPos(80,107)
		BanTimeValue:SetWide(100)
		BanTimeValue:SetNumeric(true)
		BanTimeValue:SetEditable(true)

		local BanTimeHint = vgui.Create("DLabel", PlayerFrame)
		BanTimeHint:SetPos(185,110)
		BanTimeHint:SetText("minute(s) (0 pour permanent)")
		BanTimeHint:SizeToContents()
		
		
		local ReasonBox = vgui.Create( "DComboBox", PlayerFrame )
		ReasonBox:SetPos( 80, 137 )
		ReasonBox:SetSize( 250, 20 )
		ReasonBox:SetValue( "" )
		for k,v in pairs(BansActions) do
			ReasonBox:AddChoice(v.Reason)
		end
		local RaisonValue = vgui.Create("DTextEntry", PlayerFrame)
		RaisonValue:SetPos(80,167)
		RaisonValue:SetWide(250)
		RaisonValue:SetText("")
		
		ReasonBox.OnSelect = function( panel, index, value, data )
			print( value.." was selected!" )
			for k,v in pairs(BansActions) do
				if (v.Reason == value) then
					BanTime = v.Time
					UpdateBanValue(BanTime,BanCount,ImpactMultiplier)
					RaisonValue:SetText(value)
				end
			end
		end

		

		local ReasonLabel = vgui.Create("DLabel", PlayerFrame)
		ReasonLabel:SetPos(40,140)
		ReasonLabel:SetText("Raison : ")
		ReasonLabel:SizeToContents()

		local OtherReasonLabel = vgui.Create("DLabel", PlayerFrame)
		OtherReasonLabel:SetPos(12,170)
		OtherReasonLabel:SetText("Autre raison : ")
		OtherReasonLabel:SizeToContents()

		

		local ImpactLabel = vgui.Create("DLabel", PlayerFrame)
		ImpactLabel:SetPos(36,196)
		ImpactLabel:SetText("Gravité :")
		ImpactLabel:SizeToContents()

		local Impact = vgui.Create( "DComboBox", PlayerFrame )
		Impact:SetPos( 80, 195 )
		Impact:SetSize( 250, 20 )
		Impact:SetColor(color_red)
		Impact:SetValue( "Modéré" )
		Impact:AddChoice("Non grave")
		Impact:AddChoice("Modéré")
		Impact:AddChoice("Grave")
		Impact:AddChoice("Extreme")
		Impact.OnSelect = function( panel, index, value, data )
			if (value == "Modéré") then
				ImpactMultiplier = 1
			elseif (value == "Non grave") then
				ImpactMultiplier = 0.5
			elseif (value == "Grave") then
				ImpactMultiplier = 2
			elseif (value == "Extreme") then
				ImpactMultiplier = 4
			end
			print(value)
			UpdateBanValue(BanTime,BanCount,ImpactMultiplier)
		end


		local CommentLabel = vgui.Create("DLabel", PlayerFrame)
		CommentLabel:SetPos(8,223)
		CommentLabel:SetText("Commentaire :")
		CommentLabel:SizeToContents()

		local CommentValue = vgui.Create("DTextEntry", PlayerFrame)
		CommentValue:SetPos(80,223)
		CommentValue:SetWide(250)
		CommentValue:SetText("")
		CommentValue:SetTall(50)
		CommentValue:SetText("")
		CommentValue:SetMultiline(true)
		
		local BanButton = vgui.Create( "DButton", PlayerFrame )
		BanButton:SetSize( 320, 30 )
		BanButton:SetPos( 10, 280 )
		BanButton:SetText( "Bannir" )
		BanButton.DoClick = function( button )
						
			RunConsoleCommand("ulx", "ban", name, BanTimeValue:GetText(), RaisonValue:GetText())
			PlayerFrame:Close()
			
		end
		
	else


	local f = vgui.Create("DFrame")
	f:SetTitle("Pourquoi vous voulez "..o.." "..name)
	f:SetSize(400,130)
	f:SetSkin("Black")
	f:Center()
	f:MakePopup()
	
	
	local TargetName = vgui.Create("DLabel", f)
	TargetName:SetPos(37,50)
	TargetName:SetText("Raison : ")
	TargetName:SizeToContents()
	
	local tb = vgui.Create("DTextEntry",f)
	tb:SetPos(80,47)
	tb:SetWide(250)
	
	local b = vgui.Create("DButton",f)
	b:SetSize( 100, 30 )
	--b:SetPos( 80, 80 )
	b:SetPos( 150, 80 )
	
	b:SetText("Valider")
	
	
	--[[
	local tb = vgui.Create("DTextEntry",f)
	tb:SetSize(240,20)
	tb:SetPos(5,25)
	local b = vgui.Create("DButton",f)
	b:SetSize(50,20)
	b:SetText("Valider")
	b:SetPos(245,25)
	
	]]
	
	
	function b:DoClick()
		f:Close()
		cb(name,tb:GetText(),c)
	end
	
	end
	
	
	
end
-- Opens action menu
-- First argument is a function
-- that takes player's name and
-- reason passed after clicking a name
local function OpenPlayerActionMenu(callback,o,nr)
	local pl = GetPlayerOrder()
	local m = DermaMenu()
	
	for _,p in pairs(pl) do
		print(p.Name)
		if not nr then
			m:AddOption(p.Name,function() TakeReason(p.Name,callback,o) end)
		else
			m:AddOption(p.Name,function() callback(p.Name) end)
		end
	end

	m:AddOption("Fermer",function() end)

	m:Open()
end

hook.Add('OnContextMenuOpen', 'MenuAdmin2', function()

	
		
		-- CODED BY LORD SAWWW
		
		if ( LocalPlayer():IsAdmin() or LocalPlayer():IsSuperAdmin() ) then
		
		/*
		
		local PlayerFrame = vgui.Create("DFrame")
		PlayerFrame:SetSize(400, 330)
		PlayerFrame:Center()
		PlayerFrame:SetTitle("Panneau D'administration")
		PlayerFrame:SetDraggable(true)
		PlayerFrame:SetSizable(false)
		PlayerFrame:ShowCloseButton(true)
		PlayerFrame:MakePopup()
		
		PlayerFrame.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(70,70,70))
		--draw.RoundedBox(0,7,33,w-14,h-40,Color(239,244,255))
		--draw.RoundedBox(0,7,33,w-14,h-40,Color(239,244,255))
		
		--draw.SimpleText("AB QuickMenu", 'Trebuchet22', w/2, 3, Color(39,39,39), TEXT_ALIGN_CENTER)
		end
		*/
		
		
	PlayerFrame = vgui.Create('DFrame')
	--PlayerFrame:SetTitle("Panneau D'administration")
	--PlayerFrame:SetSize(ScreenScale(160), ScreenScale(130))
	PlayerFrame:SetSize(400, 330)
	--PlayerFrame:SetSize(400, 330)
	--PlayerFrame:SetPos(PlayerFrame:GetWide() / 2, ScrH() /2 - PlayerFrame:GetTall() /2)
	
	PlayerFrame:Center()

	
	
	PlayerFrame:SetTitle('Panneau D\'administration')
	PlayerFrame:MakePopup()
	PlayerFrame:SetSkin("Black")
	PlayerFrame:SetDraggable(true)
	PlayerFrame:ShowCloseButton(true)
	
		
		
		
		
		
		local PropertySheet = vgui.Create( "DPropertySheet" )
		PropertySheet:SetParent( PlayerFrame )
		PropertySheet:SetPos( 5, 30 )
		PropertySheet:SetSize( 385, 285 )
		/*
		PropertySheet.Paint = function(self,w,h)
		
		--draw.RoundedBox(255,0,0)
		
		end
		*/
		
		local ActionList = vgui.Create("DPanelList")
		ActionList:EnableVerticalScrollbar( true )
		ActionList:SetPos(300,100)
		ActionList:SetSize(260,240)
		ActionList:SetSkin("Black")
		ActionList:EnableHorizontal( false )
		ActionList:SetPadding( 9 )

		-- local ActionList = vgui.Create("DScrollPanel",PlayerFrame)
		-- ActionList:SetSize(400,300)
		-- ActionList:SetPos(0,0)

	
		local commands = {}
		commands[0] = "Kicker le Joueur"
		commands[1] = "Warn le Joueur"
		commands[2] = "Bannir le Joueur"
		commands[3] = "Slay le Joueur"
		commands[4] = "Demote le Joueur"
		commands[5] = "Arrest le Joueur"
		commands[6] = "Téléporter le joueur vers vous"
		commands[7] = "Se téléporter vers le joueur"
		commands[8] = "Retourner le Joueur à sa position"
					
		for i = 0, 2 do
		local classroom = vgui.Create("DButton")
		--classroom:SetSize( 90, 25 )
		--classroom:SetPos(300,100)
		classroom:SetSize(PlayerFrame:GetWide() / 2 + 150, 25)
		classroom:SetPos(PlayerFrame:GetWide() / 2 - 80  - (PlayerFrame:GetWide() / 4) , 25 * i  + 70)
		classroom:SetSkin("Black")
		
		classroom:SetText(commands[i])
		classroom.number = i
		
		cmd = {}
		cmd[0] = "kick"
		cmd[1] = "warn"
		cmd[2] = "ban"
		cmd[3] = "slay"
		cmd[4] = "demote"
		cmd[5] = "arrest"
		cmd[6] = "bring"
		cmd[7] = "goto"
		cmd[8] = "return"

		function classroom:DoClick()
			
			--print("Lolz")
		
			OpenPlayerActionMenu(function(name,r1,r2)
				RunConsoleCommand("ulx", cmd[i], name, r1)
				print("[DEBUG MOI] Ran command: ","ulx", cmd[i], name, r1)
			end,cmd[i])
		
		end
		ActionList:AddItem(classroom)
		end
		
		
		for i = 3, 8 do
		local classroom2 = vgui.Create("DButton")
		
		cmd = {}
		cmd[0] = "kick"
		cmd[1] = "warn"
		cmd[2] = "ban"
		cmd[3] = "slay"
		cmd[4] = "demote"
		cmd[5] = "arrest"
		cmd[6] = "bring"
		cmd[7] = "goto"
		cmd[8] = "return"

		classroom2:SetSize(PlayerFrame:GetWide() / 2 + 150, 25)
		classroom2:SetPos(PlayerFrame:GetWide() / 2 - 80  - (PlayerFrame:GetWide() / 4) , 25 * i  + 70)
		classroom2:SetSkin("Black")
		
		classroom2:SetText(commands[i])
		classroom2.number = i
						
						
		function classroom2:DoClick()
			OpenPlayerActionMenu(function(name)
				RunConsoleCommand("ulx", cmd[i], name)
				print("[DEBUG MOI LOL 123] Ran command: ","ulx", cmd[i], name)
			end,"",true)
		end
		ActionList:AddItem(classroom2)
		
		end
		
		
		local Noclip = vgui.Create("DButton")

		Noclip:SetText("Activer/Désactiver le Noclip")
		Noclip:SetSkin("Black")
		--Noclip:SetTextColor(color_black)
		
		Noclip.DoClick = function()
		RunConsoleCommand("ulx", "noclip")
		PlayerFrame:Remove()
		end
		ActionList:AddItem(Noclip)


		local ServerActionList = vgui.Create("DPanelList")
		ServerActionList:EnableVerticalScrollbar( true )
		ServerActionList:SetPos(300,100)
		ServerActionList:SetSize(260,240)
		ServerActionList:SetSkin("Black")
		ServerActionList:EnableHorizontal( false )
		ServerActionList:SetPadding( 9 )
		
		
		local Cleanup = vgui.Create("DButton")

		Cleanup:SetText("Clean up la map")
		Cleanup:SetSkin("Black")
		--Noclip:SetTextColor(color_black)
		
		Cleanup.DoClick = function()
		--RunConsoleCommand("gmod_admin_cleanup")
		RunConsoleCommand("gmod_cleanup")
		--PlayerFrame:Remove()
		end
		ServerActionList:AddItem(Cleanup)
		
		
		
		local RebootMap = vgui.Create("DButton")

		RebootMap:SetText("Redémarrer la Map")
		RebootMap:SetSkin("Black")
		--Noclip:SetTextColor(color_black)
		
		RebootMap.DoClick = function()
		RunConsoleCommand("retry")
		
		--net.Start( "BanManager" )
		--net.Send(ply)
		--net.Send( LocalPlayer() )
		--LocalPlayer()
		
		end
		ServerActionList:AddItem(RebootMap)
		
		
		
	
		
		PropertySheet:AddSheet( "Administration des Joueurs", ActionList, "gui/silkicons/group", false, false )
		PropertySheet:AddSheet( "Administration du Serveur", ServerActionList, "gui/silkicons/wrench", false, false )
		
		else
		--RunConsoleCommand("say", "/// J'UTILISE LE PANNEAU D'ADMINS!!!")
		end
	

end)


hook.Add('OnContextMenuClose', 'MenuAdmin2Closer', function()
	if PlayerFrame then
		--PlayerFrame:Remove()
		--QMthePly = nil
		PlayerFrame:Remove()
	end	
end)