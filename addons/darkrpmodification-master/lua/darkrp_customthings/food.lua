--[[---------------------------------------------------------------------------
DarkRP custom food
---------------------------------------------------------------------------

This file contains your custom food.
This file should also contain food from DarkRP that you edited.

THIS WILL ONLY LOAD IF HUNGERMOD IS ENABLED IN darkrp_config/disabled_defaults.lua.
IT IS DISABLED BY DEFAULT.

Note: If you want to edit a default DarkRP food, first disable it in darkrp_config/disabled_defaults.lua
	Once you've done that, copy and paste the food item to this file and edit it.

The default food can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/modules/hungermod/sh_init.lua#L33

Add food under the following line:
---------------------------------------------------------------------------]]

DarkRP.createFood("Banane", {
	model = "models/props/cs_italy/bananna.mdl",
	energy = 10,
	price = 10
})
DarkRP.createFood("Grappe de bananes", {
	model = "models/props/cs_italy/bananna_bunch.mdl",
	energy = 20,
	price = 20
})
DarkRP.createFood("Pastèque", {
	model = "models/props_junk/watermelon01.mdl",
	energy = 20,
	price = 20
})
DarkRP.createFood("Bière", {
	model = "models/props_junk/GlassBottle01a.mdl",
	energy = 20,
	price = 20
})
DarkRP.createFood("Canette de Breen", {
	model = "models/props_junk/PopCan01a.mdl",
	energy = 5,
	price = 0
})
DarkRP.createFood("Bouteille de soda", {
	model = "models/props_junk/garbage_plasticbottle003a.mdl",
	energy = 15,
	price = 15
})
DarkRP.createFood("Lait", {
	model = "models/props_junk/garbage_milkcarton002a.mdl",
	energy = 20,
	price = 20
})
DarkRP.createFood("Whisky", {
	model = "models/props_junk/garbage_glassbottle001a.mdl",
	energy = 10,
	price = 10
})
DarkRP.createFood("Vodka", {
	model = "models/props_junk/garbage_glassbottle002a.mdl",
	energy = 10,
	price = 10
})
DarkRP.createFood("Saké", {
	model = "models/props_junk/garbage_glassbottle003a.mdl",
	energy = 10,
	price = 10
})
DarkRP.createFood("Orange", {
	model = "models/props/cs_italy/orange.mdl",
	energy = 20,
	price = 20
})