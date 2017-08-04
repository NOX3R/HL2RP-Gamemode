
-----------------------------------------------------

-----------------------------------------------------
local timecase = 240

local function hasAccess(ply)
	if ulx then
		return ply:query("ulx seeasay")	
	end
	return false
end

local function sendPopup(noob,message)
	for k,v in pairs(player.GetAll()) do
		if hasAccess(v) then
			net.Start("ASayPopup")
				net.WriteEntity(noob)
				net.WriteString(message)
				net.WriteEntity(noob.CaseClaimed)
			net.Send(v)
		end
	end
	if noob:IsValid() and noob:IsPlayer() then
		timer.Destroy("adminpopup-"..noob:SteamID64())
		timer.Create("adminpopup-"..noob:SteamID64(),timecase,1,function() if noob:IsValid() and noob:IsPlayer() then noob.CaseClaimed = nil end end) -- 240 = temps pour la case
	end
end

hook.Add("ULibCommandCalled","CheckForASay",function(ply,cmd,args)
	if cmd == "ulx asay" and ply:query("ulx asay") then
		if #args < 1 then return end
		if ply:query("ulx seeasay") then
			sendPopup(ply,table.concat(args," "))
			return true
		end
	end
end)

if SERVER then
	util.AddNetworkString("ASayPopup")
	util.AddNetworkString("ASayPopupClaim")
	util.AddNetworkString("ASayPopupClose")
	
	net.Receive("ASayPopupClaim",function(len,ply)
		local noob = net.ReadEntity()
		if hasAccess(ply) and not noob.CaseClaimed then
			for k,v in pairs(player.GetAll()) do
				if hasAccess(v) then
					net.Start("ASayPopupClaim")
						net.WriteEntity(ply)
						net.WriteEntity(noob)
					net.Send(v)
				end
			end	
			hook.Call("ASayPopupClaim",GAMEMODE,ply,noob)
			noob.CaseClaimed = ply
		end
	end)
	
	net.Receive("ASayPopupClose",function(len,ply)
		local noob = net.ReadEntity()
		if not noob or not noob:IsValid() then print "lmao" return end
		--if not noob.CaseClaimed == ply then print("should no happen") return end
		if timer.Exists("adminpopup-"..noob:SteamID64()) then
			timer.Destroy("adminpopup-"..noob:SteamID64())
		end
		for k,v in pairs(player.GetAll()) do
			if hasAccess(v) then
				net.Start("ASayPopupClose")
					net.WriteEntity(noob)
				net.Send(v)
			end
		end
		noob.CaseClaimed = nil
	end)	
	
	hook.Add("PlayerDisconnected","PopupsClose",function(noob)
		for k,v in pairs(player.GetAll()) do
			if hasAccess(v) then
				net.Start("ASayPopupClose")
					net.WriteEntity(noob)
				net.Send(v)
			end
		end	
	end)
	
end

if CLIENT then
	
	local aframes = aframes or {}
	
	surface.CreateFont("adminpopup", {
		font = "Lato",
		size = 15,
		weight = 400
	})
	surface.CreateFont("adminpopup_button", {
		font = "Lato",
		size = 14,
		weight = 400
	})
	surface.CreateFont("adminpopup_texte", {
		font = "Lato",
		size = 14,
		weight = 400
	})
	
	local function asayframe(noob,message,claimed)
		if not noob:IsValid() or not noob:IsPlayer() then return end
		for k,v in pairs(aframes) do
			if v.idiot == noob then
				local txt = v:GetChildren()[5]
				txt:AppendText("\n".. message)
				txt:GotoTextEnd()
				timer.Destroy("adminpopup-"..noob:SteamID64())
				timer.Create("adminpopup-"..noob:SteamID64(),timecase,1,function() if v:IsValid() then v:Remove() end end) -- 240 temps de la case
				surface.PlaySound("ui/hint.wav")
				return
			end
		end
	
		local w,h = 300,120
		
		local frm = vgui.Create("DFrame")
		frm:SetSize(w,h)
		frm:SetPos(20,20)
		frm.idiot = noob
		function frm:Paint(w,h)
			draw.RoundedBox( 3, 0, 0, w, h, Color(48,48,48,230) )
		end
		frm.lblTitle:SetColor(Color(255,255,255))
		frm.lblTitle:SetFont("adminpopup")
		frm.lblTitle:SetContentAlignment(7)
		
		if claimed and claimed:IsValid() and claimed:IsPlayer() then
			frm:SetTitle(noob:Nick().." - Pris en charge par "..claimed:Nick())
			if claimed == LocalPlayer() then
				function frm:Paint(w,h)
					draw.RoundedBox( 3, 0, 0, w, h, Color(10, 10, 10,230) )
					draw.RoundedBox( 3, 0, 0, w, h, Color(38, 166, 91) )
				end
			else
				function frm:Paint(w,h)
					draw.RoundedBox( 3, 0, 0, w, h, Color(10, 10, 10,230) )
					draw.RoundedBox( 3, 0, 0, w, h, Color(207, 0, 15) )
				end	
			end
		else
			frm:SetTitle(noob:Nick())
		end

		
		local msg = vgui.Create("RichText",frm)
		msg:SetPos(10,30)
		msg:SetSize(190,h-35)
		msg:SetContentAlignment(7)
		msg:InsertColorChange( 255, 255, 255, 255 )
		msg:SetVerticalScrollbarEnabled(false)
		function msg:PerformLayout()
			self:SetFontInternal( "adminpopup_texte" )
		end
		msg:AppendText(message)
		
		local cbu = vgui.Create("DButton",frm)
		cbu:SetPos(210,23 * 1)
		cbu:SetSize(83,21)
		cbu:SetText("SPECTATE")
		cbu:SetColor(Color(255,255,255))
		cbu:SetContentAlignment(5)
		cbu:SetFont("adminpopup_button")
		cbu.DoClick = function()
			LocalPlayer():ConCommand('fspectate "'..noob:SteamID()..'"')
		end
		cbu.Paint = function(self,w,h)
			if cbu.Depressed or cbu.m_bSelected then 
				draw.RoundedBox( 3, 0, 0, w, h, Color(48,48,48,250) )
			elseif cbu.Hovered then
				draw.RoundedBox( 3, 0, 0, w, h, Color(205,30,30,255) )
			else
				draw.RoundedBox( 3, 0, 0, w, h, Color(48,48,48,255) )
			end	
		end

		local goto = vgui.Create("DButton",frm)
		goto:SetPos(125,23 * 4)
		goto:SetSize(83,21)
		goto:SetText("GO TO")
		goto:SetColor(Color(255,255,255))
		goto:SetContentAlignment(5)
		goto:SetFont("adminpopup_button")
		goto.DoClick = function()
			local toexec = [["ulx goto $]]..noob:SteamID()..[["]]
			LocalPlayer():ConCommand(toexec)		
			LocalPlayer():ConCommand('fadmin goto "'..noob:SteamID()..'"')
		end
		goto.Paint = function(self,w,h)
			if goto.Depressed or goto.m_bSelected then 
				draw.RoundedBox( 3, 0, 0, w, h, Color(48,48,48,250) )
			elseif goto.Hovered then
				draw.RoundedBox( 3, 0, 0, w, h, Color(205,30,30,255) )
			else
				draw.RoundedBox( 3, 0, 0, w, h, Color(48,48,48,255) )
			end	
		end
		
		
		local cbu = vgui.Create("DButton",frm)
		cbu:SetPos(210,23 * 2)
		cbu:SetSize(83,21)
		cbu:SetText("TELEPORTER")
		cbu:SetColor(Color(255,255,255))
		cbu:SetContentAlignment(5)
		cbu:SetFont("adminpopup_button")
		cbu.should_unfreeze = false
		cbu.DoClick = function()
			local toexec = [["ulx bring $]]..noob:SteamID()..[["]]
			LocalPlayer():ConCommand(toexec)		
			cbu.should_unfreeze = not cbu.should_unfreeze
		end
		cbu.Paint = function(self,w,h)
			if cbu.Depressed or cbu.m_bSelected then 
				draw.RoundedBox( 3, 0, 0, w, h, Color(48,48,48,250) )
			elseif cbu.Hovered then
				draw.RoundedBox( 3, 0, 0, w, h, Color(205,30,30,255) )
			else
				draw.RoundedBox( 3, 0, 0, w, h, Color(48,48,48,250) )
			end	
		end

		local cbu = vgui.Create("DButton",frm)
		cbu:SetPos(210,23 * 3)
		cbu:SetSize(83,21)
		cbu:SetText("RETOURNER")
		cbu:SetColor(Color(255,255,255))
		cbu:SetContentAlignment(5)
		cbu:SetFont("adminpopup_button")
		cbu.should_unfreeze = false
		cbu.DoClick = function()
			local toexec = [["ulx return $]]..noob:SteamID()..[["]]
			LocalPlayer():ConCommand(toexec)
			cbu.should_unfreeze = not cbu.should_unfreeze
		end
		cbu.Paint = function(self,w,h)
			if cbu.Depressed or cbu.m_bSelected then 
				draw.RoundedBox( 3, 0, 0, w, h, Color(48,48,48,250) )
			elseif cbu.Hovered then
				draw.RoundedBox( 3, 0, 0, w, h, Color(205,30,30,255) )
			else
				draw.RoundedBox( 3, 0, 0, w, h, Color(48,48,48,250) )
			end	
		end
		
		local cbu = vgui.Create("DButton",frm)
		cbu:SetPos(210,23 * 4)
		cbu:SetSize(83,21)
		cbu:SetText("VALIDER")
		cbu:SetColor(Color(255,255,255))
		cbu:SetContentAlignment(5)
		cbu:SetFont("adminpopup_button")
		cbu.shouldclose = false
		cbu.DoClick = function()
			if not cbu.shouldclose then
				if frm.lblTitle:GetText():lower():find("claimed") then
					chat.AddText(Color(255,150,0),"[ERREUR] Cette demande a déja été validée")
					surface.PlaySound("common/wpn_denyselect.wav")
				else	
					net.Start("ASayPopupClaim")
						net.WriteEntity(noob)
					net.SendToServer()
					cbu.shouldclose = true
					cbu:SetText("FINI")
				end
			else
				net.Start("ASayPopupClose")
					net.WriteEntity(noob or nil)
				net.SendToServer()
			end
		end
		cbu.Paint = function(self,w,h)
			if cbu.Depressed or cbu.m_bSelected then 
				draw.RoundedBox( 3, 0, 0, w, h, Color(48,48,48,250) )
			elseif cbu.Hovered then
				draw.RoundedBox( 3, 0, 0, w, h, Color(205,30,30,255) )
			else
				draw.RoundedBox( 3, 0, 0, w, h, Color(48,48,48,250) )
			end	
		end
		
		local bu = vgui.Create("DButton",frm)
		bu:SetText("×")
		bu:SetTooltip("Fermer")
		bu:SetColor(Color(255,255,255))
		bu:SetPos(w-18,2)
		bu:SetSize(16,16)
		function bu:Paint(w,h)
		end	
		bu.DoClick = function()
			frm:Close()
		end
		
		frm:ShowCloseButton(false)
			
		frm:SetPos(-w-30,20 + (130 * #aframes))
		frm:MoveTo(20,20 + (130 * #aframes),0.2,0,1,function()
			surface.PlaySound("garrysmod/balloon_pop_cute.wav")
		end)
		
		function frm:OnRemove()
			table.RemoveByValue(aframes,frm)
			for k,v in pairs(aframes) do
				v:MoveTo(20,20 + (130 *(k-1)),0.1,0,1,function() end)
			end
			if noob and noob:IsValid() and noob:IsPlayer() and timer.Exists("adminpopup-"..noob:SteamID64()) then
				timer.Destroy("adminpopup-"..noob:SteamID64())
			end
		end
		table.insert(aframes,frm)
		
		timer.Create("adminpopup-"..noob:SteamID64(),timecase,1,function() if frm:IsValid() then frm:Remove() end end)	-- 240 autoclose
	end
	
	net.Receive("ASayPopup",function(len)
		local pl = net.ReadEntity()
		local msg = net.ReadString()
		local claimed = net.ReadEntity()
		asayframe(pl,msg,claimed)
	end)
	
	net.Receive("ASayPopupClose",function(len)
		local noob = net.ReadEntity()
		
		if not noob:IsValid() or not noob:IsPlayer() then return end
		
		for k,v in pairs(aframes) do
			if v.idiot == noob then
				v:Remove()
			end
		end
		if timer.Exists("adminpopup-"..noob:SteamID64()) then
			timer.Destroy("adminpopup-"..noob:SteamID64())
		end
				
	end)
	
	net.Receive("ASayPopupClaim",function(len)
		local pl = net.ReadEntity()
		local noob = net.ReadEntity()
		for k,v in pairs(aframes) do
			if v.idiot == noob then
				local titl = v:GetChildren()[4]
				titl:SetText(titl:GetText() .. " - Pris en charge par "..pl:Nick())
				if pl == LocalPlayer() then
					function v:Paint(w,h)
						draw.RoundedBox( 3, 0, 0, w, h, Color(38, 166, 91) )
					end	
				else
					function v:Paint(w,h)
						draw.RoundedBox( 3, 0, 0, w, h, Color(207, 0, 15) )
					end	
				end
			end
		end
	end)	
end

hook.Add( "PlayerSay", "Killurself", function( ply, text, public )
	text = string.lower( text )
	if string.StartWith( text, "///") then
		text = string.gsub(  text, "///", "")
		ULib.tsayColor(ply,false,Color(70,0,130),"Votre message a été envoyé aux admins: ",Color(0,255,0), text)		
		sendPopup(ply,text)
		return ""
	end
end )