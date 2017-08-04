-- Arizard's bodyGroupr
-- How to edit jobs.lua

--Simple Example
TEAM_CITIZEN = DarkRP.createJob("Citizen", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/zelpa/male_04.mdl",
	},
	description = [[The Citizen is the most basic level of society you can hold besides being a hobo. You have no specific role in city life.]],
	weapons = {},
	command = "citizen",
	max = 0,
	salary = GAMEMODE.Config.normalsalary,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,

	-- !!! LOOK HERE !!! --

	skins = {4,5,6}, -- example configuration
	bodygroups = {
		["torso"] = {0,2,3},
		["legs"] = {0,1,2,3,4,5},
		["beanies"] = {0,1,2},
		["glasses"] = {0,1}, -- these are all examples, please don't actually copy-paste them because they might not work.
	} -- check below for playermodels that support this addon, and use the sandbox playermodel selector to check bodygroups.

})

-- some supported playermodels:

	-- http://steamcommunity.com/sharedfiles/filedetails/?id=280384240 -- Enhanced Citizens Playermodels [Zelpa]
	-- http://steamcommunity.com/sharedfiles/filedetails/?id=283815805 -- Halo 3 Spartan Playermodels [Vipes]
	-- http://steamcommunity.com/sharedfiles/filedetails/?id=104491619 -- Metropolice Pack [DPotatoMan]