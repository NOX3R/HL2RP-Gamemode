--[[---------------------------------------------------------------------------
DarkRP custom shipments and guns
---------------------------------------------------------------------------

This file contains your custom shipments and guns.
This file should also contain shipments and guns from DarkRP that you edited.

Note: If you want to edit a default DarkRP shipment, first disable it in darkrp_config/disabled_defaults.lua
	Once you've done that, copy and paste the shipment to this file and edit it.

The default shipments and guns can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/addentities.lua

For examples and explanation please visit this wiki page:
http://wiki.darkrp.com/index.php/DarkRP:CustomShipmentFields


Add shipments and guns under the following line:
---------------------------------------------------------------------------]]


DarkRP.createShipment("Munitions 9mm", {
	model = "models/Items/BoxSRounds.mdl",
	entity = "item_ammo_pistol",
	price = 100,
	amount = 3,
	seperate = false,
	pricesep = nil,
	noship = false,
	allowed = {TEAM_GUN, TEAM_GUNPC}
})

DarkRP.createShipment("Munitions SMG", {
	model = "models/Items/BoxMRounds.mdl",
	entity = "item_ammo_smg1",
	price = 200,
	amount = 3,
	seperate = false,
	pricesep = nil,
	noship = false,
	allowed = {TEAM_GUN, TEAM_GUNPC}
})


DarkRP.createShipment("Cartouches fusil à pompe", {
	model = "models/Items/BoxBuckshot.mdl",
	entity = "item_box_buckshot",
	price = 150,
	amount = 3,
	seperate = false,
	pricesep = nil,
	noship = false,
	allowed = {TEAM_GUN, TEAM_GUNPC}
})

DarkRP.createShipment("Carreaux arbalètes", {
	model = "models/Items/CrossbowRounds.mdl",
	entity = "item_ammo_crossbow",
	price = 500,
	amount = 3,
	seperate = false,
	pricesep = nil,
	noship = false,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("Caisse de lockpick", {
	model = "models/weapons/w_crowbar.mdl",
	entity = "lockpick",
	price = 500,
	amount = 3,
	seperate = false,
	pricesep = nil,
	noship = false,
	allowed = {TEAM_GUN}
})

DarkRP.createShipment("Caisse de nourritures", {
	model = "models/props_junk/garbage_takeoutcarton001a.mdl",
	entity = "food",
	price = 350,
	amount = 5,
	seperate = false,
	pricesep = nil,
	noship = false,
	allowed = {TEAM_REBC}
})
DarkRP.createShipment("Valise vêtements", {
	model = "models/props_c17/SuitCase_Passenger_Physics.mdl",
	entity = "valise_vetement",
	price = 500,
	amount = 1,
	seperate = false,
	pricesep = nil,
	noship = false,
	allowed = {TEAM_GUN}
})

