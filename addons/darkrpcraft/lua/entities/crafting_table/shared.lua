ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Table de craft"
ENT.Author = "Fat Jesus / Trickster"

function ENT:Initialize()
end

function ENT:SetupDataTables()
	self:NetworkVar("Entity",1,"owning_ent")
end

-- MATERIAL OPTIONS!
-- bois
-- spring
-- ironbar
-- clé
-- MATERIAL OPTIONS!

Crafting_Recipes = {} 
/*
I'm gonna explain how to add new items, et it's actualy really easy, that is what i spent most time on doing, SO IT'S EASY TO ADD NEW ITEMS! :D

Crafting_Recipes["AK-47"] = { -- The name inside the [" "] HAS TO BE THE SAME AS TheName, else this wil NOT work!
	TheName = "AK-47", The name that will be displayed.
	HowTo = "To create a AK-47 Tu as besoin de bois x 1 et spring x 2", The information that wil be shown in the chatbox when you press on it.
	Materials = { This is where you write the materials needed to craft your entity!
		wood = 1, Do remember there has to be a comma after every material
		spring = 2,
	},
	Create = "weapon_ak47custom", -- The entity it creates, this is the folder name of the entity, just copy the name et place it inside the " "
} -- Remember no comma after this!

*/







Crafting_Recipes["Pied de biche"] = {
	TheName = "Pied de biche",
	HowTo = "Tu as besoin de 10 barre de fer.",
	Materials = {
		ironbar = 10,
	},
	Create = "weapon_crowbar",
}


Crafting_Recipes["9mm"] = {
	TheName = "9mm",
	HowTo = "Tu as besoin de 12 ressorts | 13 barre de fer.",
	Materials = {
		spring = 12,
		ironbar = 13,
	},
	Create = "weapon_pistol",
}

Crafting_Recipes["Fusil à pompe"] = {
	TheName = "Fusil à pompe",
	HowTo = "Tu as besoin de 50 barre de fer | 20 clés | 30 ressorts.",
	Materials = {
		ironbar = 50,
		wrench = 20,
		spring = 30
		
	},
	Create = "weapon_shotgun",
}

Crafting_Recipes["SMG"] = {
	TheName = "SMG",
	HowTo = "Tu as besoin de 40 barre de fer | 10 Planche de bois | 35 ressorts.",
	Materials = {
		ironbar = 40,
		wood = 10,
		spring = 35
		
	},
	Create = "weapon_smg1",
}

Crafting_Recipes["Grenade"] = {
	TheName = "Grenade",
	HowTo = "Tu as besoin de 20 barre de fer | 25 ressorts.",
	Materials = {
		ironbar = 20,
		spring = 20
		
	},
	Create = "weapon_frag",
}

Crafting_Recipes["Lampe torche"] = {
	TheName = "Lampe torche",
	HowTo = "Tu as besoin de 8 barre de fer | 4 ressorts.",
	Materials = {
		ironbar = 8,
		spring = 4
		
	},
	Create = "weapon_flashlight",
}


Crafting_Recipes["Arbalète"] = {
	TheName = "Arbalète",
	HowTo = "Tu as besoin de 75 clés, 55 ressorts et 80 barres de fer",
	Materials = {
		wrench = 75,
		ironbar = 80,
		spring = 55,
	},
	Create = "weapon_crossbow",
}

