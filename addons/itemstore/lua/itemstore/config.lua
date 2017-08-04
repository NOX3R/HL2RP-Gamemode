itemstore.config = {}

-- Restricted items
-- Change any of the falses to true to restrict picking up that item
itemstore.config.RestrictedItems = {
	drug = false,
	drug_lab = false,
	food = false,
	gunlab = false,
	microwave = false,
	money_printer = false,
	spawned_food = false,
	spawned_shipment = false,
	spawned_weapon = false,

	durgz_alcohol = false,
	durgz_aspirin = false,
	durgz_cigarette = false,
	durgz_cocaine = false,
	durgz_heroine = false,
	durgz_lsd = false,
	durgz_mushroom = false,
	durgz_pcp = false,
	durgz_weed = false
}

-- Set this to whatever you want items to stack to, -1 for infinite
-- SOME ITEMS DO NOT OBEY THIS CONFIG OPTION!! Ammo and money are exempt for obvious reasons.
itemstore.config.MaxStack = 16

-- Sets where ItemStore saves it's data. Options are text, mysqloo and tmysql4.
itemstore.config.DataProvider = "text"

-- Sets the gamemode. Options are darkrp25 or darkrp24.
itemstore.config.Gamemode = "darkrp25"

-- Sets the inventory's position to be at the left side of the screen
itemstore.config.InventoryAtLeft = false

-- The player's inventory size, width and height respectively
itemstore.config.InventorySize = { 8, 2 }

-- The bank's size, same parameters as the player's inventory.
itemstore.config.BankSize = { 8, 4 }

-- The time in seconds that the player has to wait before being able to pick up another item
itemstore.config.PickupCooldown = 0.2

-- Holding the context menu key will open the inventory (HERE YOU FUCKING GO, STOP ASKING PLEASE)
itemstore.config.ContextOpensInventory = true

-- Give every player the pickup SWEP on spawn.
itemstore.config.GivePickupSWEP = true

-- Set this to true to make /invholster take all ammo from the player
itemstore.config.InvholsterTakesAmmo = false

-- Setting this to true will cause the player to not receive the default
-- DarkRP pocket SWEP on spawn.
itemstore.config.DontUsePocket = false

-- Set this to true to have all items picked up go to the bank first. Players must retrieve them.
itemstore.config.PicksupGotoBank = false

-- Disables the anti-dupe entity.Remove override. Set this to true if you're having conflicts.
itemstore.config.DisableAntidupe = false

-- These are per-rank inventory sizes. Some examples are below. Format is rank = { width, height }
-- You MUST put in the inventories for ALL ranks you want. Ranks will not be inherited.
-- For example, superadmin AND admin must both be defined, even if they are the same size.
itemstore.config.RankSizes = {
	--superadmin = { 10, 5 },
	--admin = { 10, 3 },
}

-- Same deal as the last one, except for banks.
itemstore.config.BankSizes = {
	admin = { 12, 4 }
}

-- How far the player's pickup "reach" is in hammer units
itemstore.config.PickupDistance = 150

-- The various colours of the VGUI in R, G, B, A 0-255 format.
itemstore.config.Colours = {
	Slot = Color( 0, 0, 0, 200 ),
	HoveredSlot = Color( 255, 255, 255, 200 ),
	Title = Color( 255, 255, 255 ),

	TitleBackground = Color( 0, 0, 0, 200 ),
	Upper = Color( 100, 100, 100, 200 ),
	Lower = Color( 30, 30, 30, 200 ),
	InnerBorder = Color( 100, 100, 100, 150 ),
	OuterBorder = Color( 0, 0, 0, 150 )
}

itemstore.config.SlotSize = { 45, 45 }
itemstore.config.CustomItems = {}
