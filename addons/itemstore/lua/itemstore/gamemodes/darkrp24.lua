function GAMEMODE_DEF:GetMoney( pl )
	return pl:getDarkRPVar( "money" )
end

if SERVER then
	function GAMEMODE_DEF:SetMoney( pl, money )
		return pl:SetDarkRPVar( "money", money )
	end

	local commands = {}
	function GAMEMODE_DEF:AddCommand( command, info, func )
		table.insert( commands, { Name = command, Function = func } )
	end

	hook.Add( "PostGamemodeLoaded", "ItemStoreDarkRP24Commands", function()
		if ( itemstore.config.Gamemode == "darkrp24" ) then
			for k, v in ipairs( commands ) do
				AddChatCommand( "/" .. v.Name, function( ... ) v.Function( ... ) return "" end )
			end
		end
	end )

	GAMEMODE_DEF:AddCommand( "invholster", nil, function( pl, args )
		local wep = pl:GetActiveWeapon()

		-- This code is not mine, I'm simply copypasting DarkRP stuff right here.
		-- Please see 3rdparty.txt for the licensing terms for this portion of code.
		if not IsValid(wep) or not wep:GetModel() or wep:GetModel() == "" then
			DarkRP.notify(pl, 1, 4, DarkRP.getPhrase("cannot_drop_weapon"))
			return ""
		end

		if GAMEMODE.Config.restrictdrop then
			local found = false
			for k,v in pairs(CustomShipments) do
				if v.entity == wep:GetClass() then
					found = true
					break
				end
			end

			if not found then return end
		end

		local canDrop = hook.Call("canDropWeapon", GAMEMODE, pl, wep)
		if not canDrop then
			DarkRP.notify(pl, 1, 4, DarkRP.getPhrase("cannot_drop_weapon"))
			return ""
		end
		-- and back to our regularly scheduled coding

		local item = itemstore.items.New( "spawned_weapon" )

		item:SetData( "Class", wep:GetClass() )
		item:SetData( "Amount", 1 )
		item:SetData( "Model", wep:GetModel() )
		item:SetData( "Clip1", wep:Clip1() )
		item:SetData( "Clip2", wep:Clip2() )

		if ( itemstore.config.InvholsterTakesAmmo ) then
			local ammotype = wep:GetPrimaryAmmoType()

			if ( ammotype and ammotype ~= "none" ) then -- to be entirely honest I'm not sure if it returns nil or "none"
				local ammo = pl:GetAmmoCount( ammotype )

				item:SetData( "Ammo", ammo )
				pl:RemoveAmmo( ammo, ammotype )
			end
		end

		pl:StripWeapon( wep:GetClass() )
		pl:AddItem( item )
	end )
end
