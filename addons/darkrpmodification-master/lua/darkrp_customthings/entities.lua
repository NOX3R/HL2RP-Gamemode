--[[---------------------------------------------------------------------------
DarkRP custom entities
---------------------------------------------------------------------------

This file contains your custom entities.
This file should also contain entities from DarkRP that you edited.

Note: If you want to edit a default DarkRP entity, first disable it in darkrp_config/disabled_defaults.lua
	Once you've done that, copy and paste the entity to this file and edit it.

The default entities can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/addentities.lua#L111

For examples and explanation please visit this wiki page:
http://wiki.darkrp.com/index.php/DarkRP:CustomEntityFields

Add entities under the following line:
---------------------------------------------------------------------------]]


DarkRP.createEntity("Lampe torche", {
	ent = "weapon_flashlight",
	model = "models/flsh/flashlight.mdl",
	price = 80,
	max = 6,
	cmd = "buyflashlight",
	allowed = {TEAM_CWU,TEAM_CWUF,TEAM_CWUC,TEAM_CWUM,TEAM_CWUS}
})

DarkRP.createEntity("Livre", {
	ent = "rp_book",
	model = "models/props_lab/binderblue.mdl",
	price = 0,
	max = 100,
	cmd = "buybook",
	allowed = {TEAM_CWUS}
})

DarkRP.createEntity("Bloc-note", {
	ent = "rp_sign",
	model = "models/props_lab/clipboard.mdl",
	price = 0,
	max = 100,
	cmd = "buynote",
	allowed = {TEAM_CWU,TEAM_CWUF,TEAM_CWUC,TEAM_CWUM,TEAM_CWUS,TEAM_LOYALF,TEAM_LOYAL}
})

DarkRP.createEntity("Distributeur de rations", {
	ent = "distribrations",
	model = "models/props/cs_office/microwave.mdl",
	price = 0,
	max = 1,
	cmd = "distribrations",
	allowed = {TEAM_CHIEF,TEAM_POLICE_04,TEAM_POLICE_03,TEAM_POLICE_02,TEAM_POLICE_01}
})



DarkRP.createEntity("Request device", {
	ent = "requestdevice",
	model = "models/gibs/shield_scanner_gib1.mdl",
	price = 0,
	max = 100,
	cmd = "requestdevice",
	allowed = {TEAM_CHIEF, TEAM_POLICEC,TEAM_POLICE_RCT,TEAM_POLICE_05,TEAM_POLICE_04,TEAM_POLICE_03,TEAM_POLICE_02,
TEAM_POLICE_01, TEAM_CWU, TEAM_CWUF,TEAM_COOK,TEAM_CWUM,TEAM_CWUS}
})

DarkRP.createEntity("Vieille radio", {
	ent = "radio",
	model = "models/clutter/radio.mdl",
	price = 100,
	max = 1,
	cmd = "radior",
	allowed = {TEAM_REB,TEAM_REBF,TEAM_REBC}
})

DarkRP.createEntity("Micro-onde", {

		ent = "microwave",
		model = "models/props/cs_office/microwave.mdl",
		price = 50,
		max = 1,
		cmd = "buymicroonde",
		allowed = TEAM_COOK
})