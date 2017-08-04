/*######################################
###     
###     --------------------------------
###     PlainHUD by .delay
###     --------------------------------
###         [PHUD v1.5] for [DarkRP 2.5]
###     --------------------------------
###     
###     --------------------------------
###     Copyright ©2014 .delay  All rights reserved.
###     --------------------------------
###     
########################################

###############################################################################
###         CORE FILE - DONT TOUCH IT OR YOU WILL LOSE ANY SUPPORT!
#############################################################################*/
local Color = Color
local CurTime = CurTime
local draw = draw
local hook = hook
local IsValid = IsValid
local Lerp = Lerp
local math = math
local pairs = pairs
local ScrW, ScrH = ScrW, ScrH
local string = string
local surface = surface
local table = table
local timer = timer
PlainHUD = {}
PlainHUD.Version = "v1.5"
include("phud_config.lua")
local function CutStr(txt,maxlen)
    local len = string.len(txt)
    if len > maxlen then
        return string.sub( txt, 1, maxlen )..".."
    else
        return txt
    end
end
local function HasExpSystem(ply)
    --if ply then
    --    if ply:getDarkRPVar("level") || ply:getDarkRPVar("xp") then return true end
    --else
        if PlainHUD.DrawLevel then return true end -- https://github.com/vrondakis/DarkRP-Leveling-System
    --end
    return false
end
local function HasHungerMod()
    local hmod = DarkRP.disabledDefaults.modules.hungermod
    if hmod==false then
        return true
    else
        return false
    end
end
if SERVER then
    AddCSLuaFile("phud_config.lua")
    print("[Addon] PlainHUD "..PlainHUD.Version.." loaded!")
    util.AddNetworkString("PlainHUD.Sync")
    local function SyncHUDModel(ply,time)
        if PlainHUD.DrawAvatar then
            timer.Simple(time, function()
                if IsValid(ply) then
                    net.Start("PlainHUD.Sync")
                    net.Send(ply)
                end
            end)
        end
    end
    hook.Add("PlayerInitialSpawn", "PlainHUD.PlayerInit", function(ply)
        SyncHUDModel(ply,5)
    end)
    hook.Add("PlayerSpawn", "PlainHUD.PlayerSpawn", function(ply)
        SyncHUDModel(ply,1.5)
    end)
    hook.Add("OnPlayerChangedTeam", "PlainHUD.PlayerSync", function(ply,t1,t2)
        SyncHUDModel(ply,1.5)
    end)
elseif CLIENT then
    local function formatMoney(n) -- If DarkRP table fails... lol
        if n then if DarkRP.formatMoney != nil then return DarkRP.formatMoney(n) else return GAMEMODE.Config.currency..string.Comma(n) end end return 1
    end
    local font = "UiBold"
    local w,h = 250,200
    if HasExpSystem() then h = h + 25 end
    if PlainHUD.Alternative then h = h + 50 end
    local x,y = 5, ScrH()-h-5
    local Health = 0
    local OldXP = 0 -- for exp system
    local agendaText
    PlainHUD.Model = nil
    net.Receive("PlainHUD.Sync", function()
        local ply = LocalPlayer()
        if PlainHUD.Model then
            PlainHUD.Model:SetModel( ply:GetModel() )
            PlainHUD.Model:SetPos(x+7,y+7)
            PlainHUD.Model:MoveToBack()
        else
            timer.Simple(5, function() if IsValid(ply) then print("[Addon] PlainHUD "..PlainHUD.Version.." loaded!") end end)
            PlainHUD.Chat = false
            PlainHUD.Model = vgui.Create("SpawnIcon")
            PlainHUD.Model:SetPos(x+7,y+7)
            PlainHUD.Model:SetSize(60,60)
            PlainHUD.Model:SetToolTip(" ")
            PlainHUD.Model:SetModel( ply:GetModel() )
            PlainHUD.Model:MoveToBack()
            PlainHUD.Model.DoClick = function() end
            PlainHUD.Model.OnCursorEntered = function() end
            PlainHUD.Model.OnCursorExited = function() end  
        end
    end)
    hook.Add("Initialize", "PlainHUD.InitUMsg", function()
        PlainHUD.StartArrested = CurTime()
        PlainHUD.ArrestedUntil = CurTime()
        usermessage.Hook("GotArrested", function(msg)
            PlainHUD.StartArrested = CurTime()
            PlainHUD.ArrestedUntil = msg:ReadFloat()
            if PlainHUD.SoundArrested != "" then surface.PlaySound(PlainHUD.SoundArrested) end
        end)
        PlainHUD.AdminTell = nil
        usermessage.Hook("AdminTell", function(msg)
            PlainHUD.AdminTell = msg:ReadString()
            if PlainHUD.SoundAdminTell != "" then surface.PlaySound(PlainHUD.SoundAdminTell) end
            timer.Create("DarkRP_AdminTell", 10, 1, function()
                PlainHUD.AdminTell = nil
            end)
        end)
    end)
    hook.Add("DarkRPVarChanged", "agendaHUD", function(ply, var, _, new)
        if ply ~= LocalPlayer() then return end
        if var == "agenda" and new then agendaText = DarkRP.textWrap(new:gsub("//", "\n"):gsub("\\n", "\n"), "DarkRPHUD1", 440) else agendaText = nil end
    end)
    local function hasMenu() -- is a menu open?
        if PlainHUD.HideOnMenu then
            local fadminvis = false
            if FAdmin != nil then if FAdmin.ScoreBoard.Visible then fadminvis = true end end
            if PlainHUD.Chat || fadminvis || g_SpawnMenu:IsVisible() then
                if PlainHUD.Model && PlainHUD.Model:IsVisible() then PlainHUD.Model:SetVisible(false) end
                return true
            else
                if PlainHUD.Model && !PlainHUD.Model:IsVisible() then PlainHUD.Model:SetVisible(true) end
                return false
            end
        end
        return false
    end       
	hook.Add("StartChat", "PlainHUD.StartChat", function() PlainHUD.Chat = true end)
	hook.Add("FinishChat", "PlainHUD.FinishChat", function() PlainHUD.Chat = false end)
    local function DrawBar(barx,bary,barw,barh,barborder,value,col1,col2)
        draw.RoundedBox(0, barx, bary, barw-barborder, barh, col2)
        draw.RoundedBox(0, barx+barborder/2, bary+barborder/2, math.Clamp(barw*value-barborder,0,barw-barborder*2), barh-barborder, col1)
    end
    local function MakeBox(bw,bh,text,icon,left,by,col)
        local tx
        local bx
        local align
        local fancybox
        by = by + 50 -- offset
        if left then
            tx = 27
            bx = 5
            align = TEXT_ALIGN_LEFT
            fancybox = PlainHUD.Shape(bx,by,bw,bh)[1]
        else
            by = by + 0 -- offset
            tx = bw/2
            bx = ScrW()-bw-5
            align = TEXT_ALIGN_CENTER
            fancybox = PlainHUD.Shape(bx,by,bw,bh)[2]
        end
        if col then
            surface.SetDrawColor( col.r,col.g,col.b,col.a )
        else
            surface.SetDrawColor( PlainHUD.ColorMain )
        end
        draw.NoTexture()
        surface.DrawPoly( fancybox )
        if icon != "" then
            surface.SetDrawColor( 255, 255, 255, 255 )
            surface.SetMaterial( Material( icon ) )
            surface.DrawTexturedRect( bx+5, by+5, 16, 16 )
        end
        --draw.DrawText(string.sub( text, 1, 25 ), font, bx+tx, by+4, PlainHUD.ColorText,align)
        draw.DrawText(text, font, bx+tx, by+4, PlainHUD.ColorText,align)
    end
    local function addline(h,typ,val)
        if PlainHUD[typ] then return h + val else return h end
    end
    local function CustomHUD()
        local ply = LocalPlayer()
        if !hasMenu() then
            w,h = 250,205
            h = addline(h,"DrawLevel",25)
            if PlainHUD.Alternative then
                h = addline(h,"DrawHPArmor",50)
                h = addline(h,"DrawHunger",25)
                h = addline(h,"DrawPS",25)
            else
                h = addline(h,"DrawPS",15)
            end
            x,y = 5, ScrH()-h-0
            local offset = 28
            local glow = math.sin( CurTime() * 5 )
            -- Calc hp
            local plhealth = ply:Health()
            Health = math.min(100, (Health == plhealth and Health) or Lerp(0.05, Health, plhealth))
            local DrawHealth = math.Min(Health / GAMEMODE.Config.startinghealth, 1)
            local hx = x
            if PlainHUD.DrawAvatar then
                draw.RoundedBox( 4, hx, y, 75, 75, PlainHUD.Bars.avatar[1] or PlainHUD.ColorMain ) -- model box
                hx = hx + 85
            end
            -- Draw & calc main boxes
            local icon = PlainHUD.Bars.name[1]
            local gicon = PlainHUD.UserGroups[ply:GetUserGroup()]
            if gicon then icon = gicon end
            local job = team.GetName(ply:Team()) or ply:getJobTable().name or ply:getJobTable().label
            local jlen = 29
            if ply:getDarkRPVar("HasGunlicense") then jlen = 16 end
            local boxes = {}
            table.insert( boxes, 1, { 280,26,"Nom RP:  "..CutStr(ply:Name(),27),icon,true,y+offset,PlainHUD.Bars.name[2] or PlainHUD.ColorMain } )
            table.insert( boxes, 2, { 280,26,"Bourse:  "..CutStr(formatMoney(ply:getDarkRPVar("money")),25),PlainHUD.Bars.money[1],true,y+offset,PlainHUD.Bars.money[2] or PlainHUD.ColorMain } )
            table.insert( boxes, 3, { 280,26,"Rationnement:  "..CutStr(formatMoney(ply:getDarkRPVar("salary")),25),PlainHUD.Bars.salary[1],true,y+offset,PlainHUD.Bars.salary[2] or PlainHUD.ColorMain } )
            /*table.insert( boxes, 4, { 280,26,"Créé par la Communauté Butterfly",PlainHUD.Bars.job[1],true,y+offset,PlainHUD.Bars.job[2] or PlainHUD.ColorMain } )*/
            if PS && PlainHUD.DrawPS then
                local pts = ply:PS_GetPoints() or 0
                table.insert( boxes, 5, { 280,26,"Pointshop:  "..pts.." "..PS.Config.PointsName,PlainHUD.Bars.pointshop[1],true,y+offset,PlainHUD.Bars.pointshop[2] or PlainHUD.ColorMain } )
            end
            if PlainHUD.Alternative then
                if PlainHUD.DrawHPArmor then
                    table.insert( boxes, 1, { 280,26,"Santé",PlainHUD.Bars.health[1],true,y+offset,PlainHUD.Bars.health[2] or PlainHUD.ColorMain } )
                    table.insert( boxes, 2, { 280,26,"Armure","",true,y+offset,PlainHUD.Bars.armor[2] or PlainHUD.ColorMain } )
                end
                if PlainHUD.DrawHunger then
                    table.insert( boxes, 3, { 280,26,"Faim",PlainHUD.Bars.hunger[1],true,y+offset,PlainHUD.Bars.hunger[2] or PlainHUD.ColorMain } )
                end
            end
            local i = 1
            for k,v in pairs(boxes) do
                if v[7] then
                    MakeBox(v[1],v[2],v[3],v[4],v[5],y+offset*i,v[7])
                else
                    MakeBox(v[1],v[2],v[3],v[4],v[5],y+offset*i)
                end
                i = i + 1            
            end
            -- Draw HP/Armor
            if PlainHUD.DrawHPArmor then
                local hcol = PlainHUD.ColorBarHealth
                if plhealth <= PlainHUD.HPBlink then hcol = Color(hcol.r,hcol.g,hcol.b,hcol.a*glow) end
                local armor = ply:Armor()
                local acol = PlainHUD.ColorBarArmor
                if armor <= PlainHUD.ArmorBlink then acol = Color(acol.r,acol.g,acol.b,acol.a*glow) end
                if PlainHUD.Alternative then
                    local alen = 155
                    local altx, alty = x+76, y+offset*1+53
                    DrawBar(altx,alty+2,alen,15,2,DrawHealth,hcol,PlainHUD.ColorBar)
                    --draw.SimpleText("Health", "DarkRPHUD2", x+125, y+0, PlainHUD.ColorText, TEXT_ALIGN_CENTER)
                    if PlainHUD.DrawHPText then
                        if plhealth > 0 then
                            draw.SimpleText(plhealth, "DarkRPHUD2", altx+alen/2, alty, PlainHUD.ColorBarText, TEXT_ALIGN_CENTER)
                        else
                            draw.SimpleText("-", "DarkRPHUD2", altx+alen/2, alty, PlainHUD.ColorBarText, TEXT_ALIGN_CENTER)
                        end
                    end
                    alty = y+offset*2+53
                    DrawBar(altx,alty+2,alen,15,2,armor/100,acol,PlainHUD.ColorBar)
                    surface.SetDrawColor( 51, 240, 240, 255 )
                    surface.SetMaterial( Material( PlainHUD.Bars.armor[1] ) )
                    surface.DrawTexturedRect( 10, alty+2, 16, 16 )
                    --draw.SimpleText("Armor", "DarkRPHUD2", x+125, y+35, PlainHUD.ColorText, TEXT_ALIGN_CENTER)
                    if PlainHUD.DrawArmorText then
                        if armor > 0 then
                            draw.SimpleText(armor, "DarkRPHUD2", altx+alen/2, alty, PlainHUD.ColorBarText, TEXT_ALIGN_CENTER)
                        else
                            draw.SimpleText("-", "DarkRPHUD2", altx+alen/2, alty, PlainHUD.ColorBarText, TEXT_ALIGN_CENTER)
                        end
                    end
                else
                    draw.RoundedBox( 4, hx, y+0, 75, 75, PlainHUD.ColorMain )
                    draw.RoundedBox(4, hx-5, y+15, 85, 20, PlainHUD.ColorBar)
                    surface.SetDrawColor( 200, 200, 200, 40 )
                    surface.DrawLine( hx-3, y+34, hx+78, y+34 )
                    draw.SimpleText("Santé", "DarkRPHUD1", hx+35, y+0, PlainHUD.ColorText, TEXT_ALIGN_CENTER)
                    if plhealth > 0 then
                        draw.RoundedBox(4, hx-5+1, y+15+1, math.Clamp(85 * DrawHealth-2,7,85), 20-2, hcol)
                        if PlainHUD.DrawHPText then draw.SimpleText(plhealth, "DarkRPHUD1", hx+35, y+16, PlainHUD.ColorBarText, TEXT_ALIGN_CENTER) end
                    else
                        if PlainHUD.DrawHPText then draw.SimpleText("---", "DarkRPHUD1", hx+35, y+16, PlainHUD.ColorBarText, TEXT_ALIGN_CENTER) end
                    end
                    draw.RoundedBox(4, hx-5, y+50, 85, 20, PlainHUD.ColorBar)
                    surface.SetDrawColor( 200, 200, 200, 40 )
                    surface.DrawLine( hx-3, y+69, hx+78, y+69 )
                    draw.SimpleText("Armure", "DarkRPHUD1", hx+35, y+35, PlainHUD.ColorText, TEXT_ALIGN_CENTER)
                    if armor > 0 then
                        draw.RoundedBox(4, hx-5+1, y+50+1, math.Clamp(armor/100 * 85-2,7,85), 20-2, acol)
                        if PlainHUD.DrawArmorText then draw.SimpleText(armor, "DarkRPHUD1", hx+35, y+51, PlainHUD.ColorBarText, TEXT_ALIGN_CENTER) end
                    else
                        if PlainHUD.DrawArmorText then draw.SimpleText("---", "DarkRPHUD1", hx+35, y+51, PlainHUD.ColorBarText, TEXT_ALIGN_CENTER) end
                    end
                    hx = hx + 90
                end
            end
            -- Level system     https://github.com/vrondakis/DarkRP-Leveling-System
            if HasExpSystem() then
                local PlayerLevel = ply:getDarkRPVar("level") or 1
                local PlayerXP = ply:getDarkRPVar("xp") or 1
                --local PlayerXP = 5000
                local XPMult = LevelSystemConfiguration.XPMult or 1
                local percent = ((PlayerXP or 0)/(((10+(((PlayerLevel or 1)*((PlayerLevel or 1)+1)*90))))*XPMult))
                local drawXP = Lerp(8*FrameTime(),OldXP,percent)
                OldXP = drawXP
                local percent2 = percent*100
                percent2 = math.Round(percent2)
                percent2 = math.Clamp(percent2, 0, 99)
                local of,of2 = 5,7
                if PlainHUD.Alternative then
                    if PlainHUD.DrawHPArmor then of,of2 = of+2,of2+2 end
                    if PlainHUD.DrawHunger  then of,of2 = of+1,of2+1 end
                end
                if PlainHUD.DrawPS then of,of2 = of+1,of2+1 end
                MakeBox(280,26,"Level:  "..PlayerLevel,PlainHUD.Bars.level[1],true,y+offset*of,PlainHUD.Bars.level[2] or PlainHUD.ColorMain)           
                local barw,barh = 130,15
                local barx,bary = x+100,y+offset*of2
                local barborder = 2
                DrawBar(barx,bary,barw,barh,barborder,drawXP,PlainHUD.ColorBarXP,PlainHUD.ColorBar)
                draw.SimpleText(percent2.."%", font, barx+barw+20+1, bary-1+1, Color(0,0,0,255), TEXT_ALIGN_CENTER)
                draw.SimpleText(percent2.."%", font, barx+barw+20, bary-1, Color(255,255,255,200), TEXT_ALIGN_CENTER)
                if PlainHUD.DrawExp then
                    draw.SimpleText(PlayerXP.." xp", font, barx+barw/2+1, bary-1+1, Color(0,0,0,255), TEXT_ALIGN_CENTER)
                    draw.SimpleText(PlayerXP.." xp", font, barx+barw/2, bary-1, Color(255,255,255,200), TEXT_ALIGN_CENTER)
                end
            end
            if PlainHUD.DrawStam then
                local stamina = ply:getDarkRPVar("Endurance") or 100
                stamina = math.ceil(stamina)
                local sw,sh,sy = 280,3,75
                if PlainHUD.Alternative then sw,sh,sy = 266,2,104 end
                if stamina <= PlainHUD.StamBlink && ply:Alive() then
                    local scol = PlainHUD.ColorMain
                    draw.RoundedBox(0,x,y+sy,sw,sh, Color(scol.r,scol.g,scol.b,scol.a*glow))
                end
                DrawBar(x,y+sy,sw,sh,0,stamina/100,PlainHUD.Bars.stamina[1],PlainHUD.ColorMain)
            end
            if PlainHUD.DrawHunger && HasHungerMod() then
                local energy = math.ceil(ply:getDarkRPVar("Energy") or 0)
                if PlainHUD.Alternative then
                    local barw,barh = 145,15
                    local barx,bary = x+85,y+offset*5
                    local barborder = 2
                    local hbar = PlainHUD.ColorBarHunger
                    if energy <= PlainHUD.HungerBlink && ply:Alive() then
                        local scol = PlainHUD.ColorBarHunger
                        hbar = Color(scol.r,scol.g,scol.b,scol.a*glow)
                    end
                    DrawBar(barx,bary,barw,barh,barborder,energy/100,hbar,PlainHUD.ColorBar)
                    draw.SimpleText(energy.."%", font, barx+barw+20+1, bary-1+1, Color(0,0,0,255), TEXT_ALIGN_CENTER)
                    draw.SimpleText(energy.."%", font, barx+barw+20, bary-1, Color(255,255,255,200), TEXT_ALIGN_CENTER)
                    if energy <= PlainHUD.HungerWarning && ply:Alive() then
                        local scol = PlainHUD.ColorStarvText
                        draw.DrawNonParsedSimpleText(DarkRP.getPhrase("starving"), font, barx+barw/2, bary-2, Color(scol.r,scol.g,scol.b,scol.a*glow), 1)
                    end
                else
                    draw.RoundedBox(4, hx, y+0, 20, 75, PlainHUD.Bars.hunger[2] or PlainHUD.ColorMain)
                    draw.RoundedBox(0, hx+1, y+0+1, 18, 73, PlainHUD.ColorBarHunger)
                    local ebar = (75 - 9) * (energy / 100)
                    draw.RoundedBox(0, hx+1, y+0+1, 18, math.Clamp(73-ebar,1,73), PlainHUD.ColorMain)
                    --draw.DrawNonParsedSimpleText(energy .. "%", font, x+175+10, y+60, PlainHUD.ColorText, 1)
                    if energy <= PlainHUD.HungerWarning then
                        local scol = PlainHUD.ColorStarvText
                        draw.DrawNonParsedSimpleText(DarkRP.getPhrase("starving"), font, x+240, y+35, Color(scol.r,scol.g,scol.b,scol.a*glow), 1)
                    end
                    if energy <= PlainHUD.HungerBlink then
                        surface.SetDrawColor( 255, 255, 255, 80*glow )
                        surface.SetMaterial( Material( PlainHUD.Bars.hunger[1] ) )
                        surface.DrawTexturedRect( hx+3, y+4, 14, 14 )
                    end
                    surface.SetDrawColor( 200, 200, 200, 40 )
                    surface.DrawLine( hx+2, y+1, hx+18, y+1 )  -- top
                    surface.DrawLine( hx+2, y+73, hx+18, y+73 )  -- bot
                    surface.DrawLine( hx+1, y+2, hx+1, y+73 ) -- left
                    surface.DrawLine( hx+18, y+2, hx+18, y+73 ) -- right
                end
            end
            local ix,iy
            if PlainHUD.DrawWanted && ply:isWanted() then
                if PlainHUD.Alternative then ix,iy = x+245,y+82 else ix,iy = x+55,y+2 end
                if !PlainHUD.DrawAvatar && !PlainHUD.DrawHPArmor then ix,iy = x+250,y+82 end
                surface.SetDrawColor( 255, 40, 40, glow*255 )
                surface.SetMaterial( Material( PlainHUD.Bars.wanted[1] ) )
                surface.DrawTexturedRect( ix, iy, 16, 16 )
            end
            if PlainHUD.DrawArrested && ply:isArrested() then
                if PlainHUD.Alternative then ix,iy = x+234,y+82 else ix,iy = x+2,y+3 end
                if !PlainHUD.DrawAvatar && !PlainHUD.DrawHPArmor then ix,iy = x+229,y+82 end
                --if PlainHUD.DrawArrestTime && ( PlainHUD.ArrestedUntil < CurTime() ) then
                if PlainHUD.DrawArrestTime && ( PlainHUD.ArrestedUntil - (CurTime() - PlainHUD.StartArrested) ) > 0 then
                    local arrtext = DarkRP.getPhrase("youre_arrested", math.ceil(PlainHUD.ArrestedUntil - (CurTime() - PlainHUD.StartArrested)))
                    --draw.DrawNonParsedText(arrtext, "DarkRPHUD1", ScrW()/2, ScrH() - ScrH()/12, PlainHUD.ColorText, 1)
                    surface.SetFont(font)
                    local lw,li = surface.GetTextSize(arrtext)
                    MakeBox(lw+45,26,arrtext,PlainHUD.Bars.arrested[1],true,y-80,PlainHUD.Bars.arrested[2] or PlainHUD.ColorMain)
                    local time = math.ceil(PlainHUD.ArrestedUntil - (CurTime() - PlainHUD.StartArrested))
                    if PlainHUD.Alternative && time < 61 then
                        draw.SimpleText(time, font, ix+10, iy+1, PlainHUD.ColorText, TEXT_ALIGN_LEFT)
                    end
                end
            end
            if PlainHUD.DrawLicense && ply:getDarkRPVar("HasGunlicense") then
                if PlainHUD.Alternative then ix, iy = x+186, y+165 else ix, iy = x+200, y+56 end
                draw.RoundedBox( 0, ix, iy, 80, 20, PlainHUD.Bars.license[2] )
                draw.SimpleText("LICENSE", font, ix+24, iy+1, PlainHUD.ColorText, TEXT_ALIGN_LEFT)
                surface.SetDrawColor( 255, 255, 255, 255 )
                surface.SetMaterial( Material( PlainHUD.Bars.license[1] ) )
                surface.DrawTexturedRect( ix+3, iy+2, 16, 16 )
            end
        end
        local wep = ply:GetActiveWeapon()
        if PlainHUD.DrawAmmo && ply:Alive() && IsValid(wep) then
            local ay = y+h-110
            --local wep_name = wep.PrintName or wep:GetPrintName() or wep:GetClass()
            local ammo1 = ply:GetAmmoCount(wep:GetPrimaryAmmoType())
            local ammo_clip1 = wep:Clip1()
            local ammo_clip1size
            if wep.Primary && wep.Primary.ClipSize then
                ammo_clip1size = wep.Primary.ClipSize or 0
            else
                ammo_clip1size = ammo1
            end            
            local ammo2 = ply:GetAmmoCount(wep:GetSecondaryAmmoType())
            local ammo_clip2 = wep:Clip2()
            if ammo_clip1 > 0 && ammo_clip1size > 0 then
                local atext = "Munitions:  "..ammo_clip1.." / "..ammo1
                if ammo2 > 0 then
                    atext = atext.." | "..ammo2
                end
                MakeBox(250,26,atext,"",false,ay)
                -- ammo bar
                local barw = 237
                local proc = ammo_clip1/ammo_clip1size                
                draw.RoundedBox( 0, ScrW()-242, ay+76, math.Clamp(barw*proc,0,barw), 4, PlainHUD.ColorAmmoBar )
            end
            local wclass = wep:GetClass()
            local wep_name = wep.PrintName or wep:GetClass()
            local WNames = {
                weapon_physcannon = "Physcannon",
                weapon_physgun = "Physgun"
            }
            if WNames[wclass] then
                wep_name = WNames[wclass]
            end
            MakeBox(250,26,wep_name,"",false,ay+30)
        end
        local agenda = ply:getAgendaTable()
        if agenda then
            agendaText = DarkRP.textWrap((ply:getDarkRPVar("agenda") or ""):gsub("//", "\n"):gsub("\\n", "\n"), "DarkRPHUD1", 440)            
            MakeBox(460,110,"","",true,-40,PlainHUD.Bars.agenda[2] or PlainHUD.ColorMain)
            MakeBox(460,30,"","",true,-40,PlainHUD.Bars.agenda[3] or PlainHUD.ColorMain)
            surface.SetDrawColor( 255, 255, 255, 255 )
            surface.SetMaterial( Material( PlainHUD.Bars.agenda[1] ) )
            surface.DrawTexturedRect( 15, 15, 20, 20 )
            draw.DrawNonParsedText(agenda.Title, "DarkRPHUD2", 42, 15, PlainHUD.ColorText, 0)
            draw.DrawNonParsedText(agendaText, "DarkRPHUD1", 15, 45, PlainHUD.ColorAgendaText, 0)
        end
        if GetGlobalBool("DarkRP_LockDown") then
            local locktext = string.sub( DarkRP.getPhrase("lockdown_started"), 1, 80 )
            local lockfont = "ScoreboardPlayerNameBig"
            surface.SetFont( lockfont )
            local lw,lh = surface.GetTextSize(locktext)
            MakeBox(lw+45,30,"","",true,75,PlainHUD.Bars.lockdown[2])
            local cin = (math.sin(CurTime()) + 1) / 2
            glow = math.sin( CurTime() * 2.8 )
            surface.SetDrawColor( 255, 255, 255, 255-255*glow )
            surface.SetMaterial( Material( PlainHUD.Bars.lockdown[1] ) )
            surface.DrawTexturedRect( 10, 131, 18, 18 )
            draw.DrawNonParsedText(string.sub( locktext, 1, 80 ), lockfont, 33,130, Color(cin * 255, 0, 255 - (cin * 255), 255), TEXT_ALIGN_LEFT)
        end
        if PlainHUD.DrawAdminTell && PlainHUD.AdminTell != nil then
            surface.SetFont(font)
            local aw,ah = surface.GetTextSize(PlainHUD.AdminTell)
            MakeBox(math.Clamp(aw+60,250,ScrW()-10),65,"","",true,y-150,PlainHUD.Bars.admintell[2] or PlainHUD.ColorMain)
            surface.SetDrawColor( 255, 255, 255, 255 )
            surface.SetMaterial( Material( PlainHUD.Bars.admintell[1] ) )
            surface.DrawTexturedRect( x+10, y-90, 18, 18 )
            draw.SimpleText(DarkRP.getPhrase("listen_up"), "HUDNumber5", x+35, y-97, PlainHUD.ColorText, TEXT_ALIGN_LEFT)
            draw.SimpleText(PlainHUD.AdminTell, font, x+10, y-60, PlainHUD.ColorText, TEXT_ALIGN_LEFT)
        end
        if PlainHUD.DrawTalking && ply.DRPIsTalking then
            local chbxX, chboxY = chat.GetChatBoxPos()
            local Rotating = math.sin(CurTime()*3)
            local backwards = 0
            if Rotating < 0 then
                Rotating = 1-(1+Rotating)
                backwards = 180
            end
            surface.SetTexture(surface.GetTextureID("voice/icntlk_pl"))
            surface.SetDrawColor(140,0,0,180)
            surface.DrawTexturedRectRotated(ScrW() - 100, chboxY, Rotating*96, 96, backwards)
        end
    end
    hook.Add("HUDPaint", "PlainHUD.Paint", CustomHUD)
    local HideHUD = {
        DarkRP_HUD = true,
        DarkRP_Agenda = true,
        DarkRP_Hungermod = true,
        CHudAmmo = true,
        CHudSecondaryAmmo = true,
        DarkRP_EntityDisplay = false,
        DarkRP_ZombieInfo = false
    }
    hook.Add("HUDShouldDraw", "PlainHUD.HideDefault", function(name)
        if HideHUD[name] then return false end
    end)
end