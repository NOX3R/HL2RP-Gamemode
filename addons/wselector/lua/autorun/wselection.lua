
-----------------------------------------------------
if SERVER then return end

WeaponSelection = {}
local Time = 0
local Weapon_ID = 0
local WeaponsCount = 0
local Weapons = {}
local TitleOffset = 0


// Customize Your Button Color

/*
-- Black/Purple Skin:
local ButtonColor = Color(130,130,130,150)
local AmmoButton = Color(100,0,200,150)
*/

-- Blue/Pink Skin:
local ButtonColor = Color( 0, 130, 200, 150 )
local AmmoButton = Color( 200, 0, 200, 150 )


surface.CreateFont("WEP_HUD",{font = "Aero Matics Display",size = 15,weight = 400,antialias = true,additive = false, outline = 0, blursize = 0})

local function GetWeaponType(class)
	if (string.find(class,"fas2_") or class == "fists_weapon" or class == "weapon_fists" or class == "ultra_fists" or class == "stungun") then
		return "weapon"
	elseif (string.find(class,"weapon_") or string.find(class,"gmod_")) then
		return "job"
	else
		return "normal"
	end
end

local function GetWeaponCaching(weps)
	local tmp = {}
	for k,v in pairs(weps) do
		table.insert(tmp,v)
	end
	return tmp
end

function WeaponSelection:Draw()
	local Counter = 0
	local offset = (table.Count(Weapons)*18)
	TitleOffset = offset

	for k, v in pairs(Weapons) do
		if (v and IsValid(v)) then
			Counter = Counter + 1
			local type = GetWeaponType(v:GetClass())
			if (Counter == Weapon_ID) then
				if (type == "weapon" and v:GetClass() != "fists_weapon" and v:GetClass() != "weapon_fists" and v:GetClass() != "ultra_fists" and v:GetClass() != "stungun") then
					WeaponSelection:DrawAmmo(v,ScrW()-155,(ScrH()/2)-(TitleOffset)-30)
				end
				WeaponSelection:DrawWeaponItem(v:GetPrintName(),ScrW()-175,(ScrH()/2)-offset,type)
			else
				WeaponSelection:DrawWeaponItem(v:GetPrintName(),ScrW()-155,(ScrH()/2)-offset,type)
			end

			offset = offset - 30
		end
	end
end

function WeaponSelection:DrawAmmo(weapon,posx,posy)
	local BoxSize_W = 150
	local BoxSize_H = 25
	local BoxColor = AmmoButton
	draw.RoundedBox( 6, posx, posy, BoxSize_W, BoxSize_H, BoxColor )
	draw.SimpleText("Ammo : " ..weapon:Clip1() .. "/" ..LocalPlayer():GetAmmoCount(weapon:GetPrimaryAmmoType()), "WEP_HUD", posx + (BoxSize_W*0.5), posy + (BoxSize_H*0.5), TextColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function WeaponSelection:DrawWeaponItem(name,posx,posy,type)
	local BoxSize_W = 150
	local BoxSize_H = 30
	local BoxColor = Color( 20, 0, 0, 200 )
	--local BoxColor = ButtonColor
	local TextColor = Color(200,200,200,255)
	local LineColor = Color(100,100,100)
	local LineDecal = 7
	if (type == "weapon") then
		LineColor = Color(255,0,0)
	elseif (type == "job") then
		LineColor = Color(255,130,0)
	else
		LineColor = Color(0,255,0)
	end

	draw.RoundedBox( 0, posx, posy, BoxSize_W, BoxSize_H, BoxColor )

	draw.TexturedQuad
	{
		texture = surface.GetTextureID "gui/gradient",
		color = Color(225, 0, 0, 10),
		x = posx + 7,
		y = posy,
		w = BoxSize_W - 7,
		h = BoxSize_H
	}

	draw.SimpleText(name, "WEP_HUD", posx + (BoxSize_W*0.5) + 7, posy + (BoxSize_H*0.5), TextColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	surface.SetDrawColor(LineColor)
	surface.DrawRect(posx + 7, posy, 5, BoxSize_H )



end

function WeaponSelection:ShouldDraw()
	if (Time and Time + 1.5 > CurTime()) then
		return true
	end
	return false
end

function WeaponSelection:InitialCall()
	Weapons = GetWeaponCaching(LocalPlayer():GetWeapons())
	local Current_Weapon = LocalPlayer():GetActiveWeapon()
	WeaponsCount = table.Count(Weapons)
	Weapon_ID = table.KeyFromValue(Weapons,Current_Weapon)
    timer.Create( "refresh_weapons", 0.5, 0, function()
		Weapons = GetWeaponCaching(LocalPlayer():GetWeapons())
		WeaponsCount = table.Count(Weapons)
	end)
end

function WeaponSelection:SetSelection(id)
	if (LocalPlayer():InVehicle()) then return false end
	Time = CurTime()
	WeaponSelection:InitialCall()
	Weapon_ID = id
end

-- We Force it to Draw!
function WeaponSelection:Call()
	if (WeaponSelection:ShouldDraw()) then
		Time = CurTime()
	else
		Time = CurTime()
		WeaponSelection:InitialCall()
	end
end

function WeaponSelection:NextWeapon()
	if (WeaponsCount > 0) then

	end
	if (!Weapon_ID) then Weapon_ID = 1 end
	if (WeaponsCount == Weapon_ID) then
		Weapon_ID = 1
	else
		Weapon_ID = Weapon_ID + 1
	end
end

function WeaponSelection:PrevWeapon()
	if (WeaponsCount > 0) then

	end
	if (!Weapon_ID) then Weapon_ID = 1 end
	if (Weapon_ID == 1) then
		Weapon_ID = WeaponsCount
	else
		Weapon_ID = Weapon_ID - 1
	end
end

function WeaponSelection:SelectWeapon()
	if (Weapon_ID and Weapons[Weapon_ID] and IsValid(Weapons[Weapon_ID])) then
		RunConsoleCommand("use",Weapons[Weapon_ID]:GetClass())
		surface.PlaySound("UI/buttonclick.wav")
		timer.Destroy("refresh_weapons")
		Time = 0
	end
end

function WeaponSelection:Think()

end
