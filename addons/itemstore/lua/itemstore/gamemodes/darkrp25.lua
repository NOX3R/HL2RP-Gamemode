function GAMEMODE_DEF:GetMoney( pl )
	return pl:getDarkRPVar( "money" )
end

local commands = {}

if SERVER then
	function GAMEMODE_DEF:SetMoney( pl, money )
		return pl:setDarkRPVar( "money", money )
	end

	function GAMEMODE_DEF:AddCommand( command, info, func )
		table.insert( commands, { Name = command, Function = func } )
	end

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

hook.Add( "PostGamemodeLoaded", "ItemStoreDarkRP25Commands", function()
	if ( itemstore.config.Gamemode == "darkrp25" ) then
		DarkRP.declareChatCommand( { command = "pickup", description = "Picks up the item in front of you.", delay = 2 } )
		DarkRP.declareChatCommand( { command = "trade", description = "Trade with a player.", delay = 2 } )
		DarkRP.declareChatCommand( { command = "inv", description = "Shows the inventory.", delay = 2 } )
		DarkRP.declareChatCommand( { command = "invholster", description = "Holsters your current weapon to the inventory.", delay = 2 } )

		if SERVER then
			for k, v in ipairs( commands ) do
				DarkRP.defineChatCommand( v.Name, function( ... ) v.Function( ... ) return "" end )
			end
		end
	end
end )
