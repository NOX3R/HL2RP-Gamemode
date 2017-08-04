--[[---------------------------------------------------------------------------
DarkRP custom jobs
---------------------------------------------------------------------------

This file contains your custom jobs.
This file should also contain jobs from DarkRP that you edited.

Note: If you want to edit a default DarkRP job, first disable it in darkrp_config/disabled_defaults.lua
	Once you've done that, copy and paste the job to this file and edit it.

The default jobs can be found here:
https://github.com/FPtje/DarkRP/blob/master/gamemode/config/jobrelated.lua

For examples and explanation please visit this wiki page:
http://wiki.darkrp.com/index.php/DarkRP:CustomJobFields


Add jobs under the following line:
---------------------------------------------------------------------------]]

TEAM_CITIZEN = DarkRP.createJob("Citoyen", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/group01/male_01.mdl",
		"models/player/Group01/Male_02.mdl",
		"models/player/Group01/male_03.mdl",
		"models/player/Group01/Male_04.mdl",
		"models/player/Group01/Male_05.mdl",
		"models/player/Group01/Male_06.mdl",
		"models/player/Group01/Male_07.mdl",
		"models/player/Group01/Male_08.mdl",
		"models/player/Group01/Male_09.mdl"
	},
	description = [[Les citoyens composent la faction la plus basique du HL2RP. Leur  but est de vivre au jour le jour et découvrir ce que peut leur offrir cité 17. A vous de choisir l'orientation de votre quotidien: pour l'Union ou contre l'Union.]],
weapons = {"itemstore_pickup"},
	command = "citizen",
	max = 0,
	timer=0,
	salary = 0,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	PlayerSpawn = function(ply) 
		ply:SetHealth(30) 
		ply:SetMaxHealth(30)
		ply:AllowFlashlight( false)
	end,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.3))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.3).." tokens.")
	end
})

TEAM_CITIZENF = DarkRP.createJob("Citoyenne", {
	color = Color(20, 150, 20, 255),
	model = {
		"models/player/Group01/Female_01.mdl",
		"models/player/Group01/Female_02.mdl",
		"models/player/Group01/Female_03.mdl",
		"models/player/Group01/Female_04.mdl",
		"models/player/Group01/Female_06.mdl",
	},
	description = [[Les citoyens composent la faction la plus basique du HL2RP. Leur seul but est de vivre au jour le jour et découvrir ce que peut leur offrir cité 17. A vous de choisir l'orientation de votre quotidien: pour l'Union ou contre l'Union.]],
weapons = {"itemstore_pickup"},
	command = "citizenF",
	max = 0,
	timer=0,
	salary = 0,
	admin = 0,
	vote = false,
	PlayerSpawn = function(ply) 
		ply:SetHealth(30) 
		ply:SetMaxHealth(30)
		ply:AllowFlashlight( false)
	end,
	hasLicense = false,
	candemote = false,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.3))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.3).." tokens.")
	end
})

TEAM_LOYAL = DarkRP.createJob("Loyaliste", {
	color = Color(0, 254, 126, 255),
	model = {
		"models/player/Group02/Male_02.mdl",		
		"models/player/Group02/Male_04.mdl",		
		"models/player/Group02/Male_06.mdl",		
		"models/player/Group02/Male_08.mdl"
	},
	description = [[Les citoyens loyalistes ont leur propres appartements et recoivent un meilleur traitement de la milice]],
weapons = {"itemstore_pickup"},
	command = "loyal",
	max = 5,
	timer=0,
	salary = 10,
	admin = 0,
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "Loyaliste") or string.find(ply:GetUserGroup() , "CWU") or string.find(ply:GetUserGroup() , "Administrateur") or string.find(ply:GetUserGroup() , "Superviseur")or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être loyaliste pour ça!",
	vote = false,
	hasLicense = false,
	candemote = false,
	PlayerSpawn = function(ply) 
		ply:SetHealth(60) 
		ply:SetMaxHealth(60)
	end,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.3))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.3).." tokens.")
	end
})

TEAM_LOYALF = DarkRP.createJob("Loyaliste F.", {
	color = Color(0, 254, 126, 255),
	model = {
		"models/player/Group01/Female_01.mdl",	
		"models/player/Group01/Female_02.mdl",	
		"models/player/Group01/Female_03.mdl",	
		"models/player/Group01/Female_04.mdl",	
		"models/player/Group01/Female_06.mdl"
	},
	description = [[Les citoyens loyalistes ont leur propres appartements et recoivent un meilleur traitement de la milice]],
weapons = {"itemstore_pickup"},
	command = "loyalF",
	max = 3,
	timer=0,
	PlayerSpawn = function(ply) 
		ply:SetHealth(60) 
		ply:SetMaxHealth(60)
		ply:AllowFlashlight( false)
	end,
	salary = 10,
	admin = 0,
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "Loyaliste") or string.find(ply:GetUserGroup() , "CWU") or string.find(ply:GetUserGroup() , "Administrateur") or string.find(ply:GetUserGroup() , "Superviseur")or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être loyaliste pour ça!",
	vote = false,
	hasLicense = false,
	candemote = false,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.3))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.3).." tokens.")
	end
})

TEAM_ANTIC = DarkRP.createJob("Réfugié", {
	color = Color(86,130,3, 255),
	model = {
		"models/half-dead/metroll/a1b1.mdl",	
		"models/half-dead/metroll/a2b1.mdl",	
		"models/half-dead/metroll/a3b1.mdl",	
		"models/half-dead/metroll/a4b1.mdl",	
		"models/half-dead/metroll/a5b1.mdl",	
		"models/half-dead/metroll/a6b1.mdl",	
		"models/half-dead/metroll/m1b1.mdl",	
		"models/half-dead/metroll/m2b1.mdl",	
		"models/half-dead/metroll/m3b1.mdl",
		"models/half-dead/metroll/m4b1.mdl",
		"models/half-dead/metroll/m5b1.mdl",
		"models/half-dead/metroll/m6b1.mdl",
		"models/half-dead/metroll/m7b1.mdl",
		"models/half-dead/metroll/m8b1.mdl",
		"models/half-dead/metroll/m9b1.mdl"
		
	},
	description = [[Les réfugiés refusent le régime de l'Union et sont des citoyens à problèmes. Ils refusent de travailler ou obéir aux CWU collabo. Ils peuvent porter un pistolet ou arme de CAC en zone sécurisée et des SMG en zone interdite seulement]],
weapons = {"itemstore_pickup"},
	command = "anti",
	max = 5,
	timer=0,
	salary = 5,
	admin = 0,
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "anticitoyen") or string.find(ply:GetUserGroup() , "résistant") or string.find(ply:GetUserGroup() , "crésistant")  or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être loyaliste pour ça!",
	vote = false,
	hasLicense = false,
	candemote = false,
	PlayerSpawn = function(ply) 
		ply:SetHealth(50) 
		ply:SetMaxHealth(50)
	end,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.3))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.3).." tokens.")
	end
})

TEAM_ANTICF = DarkRP.createJob("Réfugiée", {
	color = Color(86,130,3, 255),
	model = {
		"models/half-dead/metroll/f1b1.mdl",	
		"models/half-dead/metroll/f2b1.mdl",	
		"models/half-dead/metroll/f3b1.mdl",	
		"models/half-dead/metroll/f4b1.mdl",	
		"models/half-dead/metroll/f6b1.mdl",
		"models/half-dead/metroll/f7b1.mdl"		
	},
	description = [[Les réfugiés refusent le régime de l'Union et sont des citoyens à problèmes. Ils refusent de travailler ou obéir aux CWU collabo. Ils peuvent porter un pistolet ou arme de CAC en zone sécurisée et des SMG en zone interdite seulement]],weapons = {"itemstore_pickup"},
	command = "antiF",
	max = 2,
	timer=0,
	salary = 5,
	admin = 0,
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "anticitoyen") or string.find(ply:GetUserGroup() , "résistant")  or string.find(ply:GetUserGroup() , "crésistant") or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être loyaliste pour ça!",
	vote = false,
	hasLicense = false,
	candemote = false,
	PlayerSpawn = function(ply) 
		ply:SetHealth(50) 
		ply:SetMaxHealth(50)
	end,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.3))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.3).." tokens.")
	end
})

TEAM_CWU = DarkRP.createJob("C.W.U DCP", {
	color = Color(18, 149, 241, 255),
	timer=30,
	model = {
		"models/jessev92/player/hl2b_cits/m01.mdl",		
		"models/jessev92/player/hl2b_cits/m02.mdl",
		"models/jessev92/player/hl2b_cits/m03.mdl",
		"models/jessev92/player/hl2b_cits/m04.mdl",
		"models/jessev92/player/hl2b_cits/m05.mdl",
		"models/jessev92/player/hl2b_cits/m06.mdl",
		"models/jessev92/player/hl2b_cits/m07.mdl",
		"models/jessev92/player/hl2b_cits/m08.mdl",
		"models/jessev92/player/hl2b_cits/m09.mdl"
	},
	description = [[Le Civil Worker Union Département Confort et Propretéest composé de citoyens qui ont prouvé leur foi et loyauté envers l'Union. Des responsabilités et métiers leur sont assignés. Il est possible de s'orienter par la suite vers la cuisine ou la médecine.]],
weapons = {"itemstore_pickup"},
	command = "cwu",
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "VIP") or string.find(ply:GetUserGroup() , "CWU") or string.find(ply:GetUserGroup() , "Superviseur") or string.find(ply:GetUserGroup() , "Administrateur") or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être VIP pour ça!",
	max = 5,
	salary = 160,
	admin = 0,
	hasRadio = true,
	vote = false,
	hasLicense = false,
	candemote = false,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.3))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.3).." tokens.")
	end
})

TEAM_CWUF = DarkRP.createJob("C.W.U DCP F.", {
	color = Color(18, 149, 241, 255),
	timer = 30,
	model = {
		"models/jessev92/player/hl2b_cits/f01.mdl",		
		"models/jessev92/player/hl2b_cits/f02.mdl",
		"models/jessev92/player/hl2b_cits/f04.mdl",
		"models/jessev92/player/hl2b_cits/f06.mdl"
	},
	description = [[Le Civil Worker Union Département Confort et Propreté est composé de citoyens qui ont prouvé leur foi et loyauté envers l'Union. Des responsabilités et métiers leur sont assignés. Il est possible de s'orienter par la suite vers la cuisine ou la médecine.]],
weapons = {"itemstore_pickup"},
	command = "cwuF",
	max = 3,
	salary = 160,
		hasRadio = true,
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "VIP") or string.find(ply:GetUserGroup() , "CWU") or string.find(ply:GetUserGroup() , "Superviseur") or string.find(ply:GetUserGroup() , "Administrateur") or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être VIP pour ça!",
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.3))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.3).." tokens.")
	end
})
	TEAM_COOK = DarkRP.createJob("C.W.U DCL", {
	color = Color(18, 149, 241, 255),
	model = "models/player/mossman.mdl",	timer=60,
	description = [[Le C.W.U Département Commerce Limité est en charge de tous les établissement de restauration de cité 17 et des boutiques, son devoir est de nourrir tous les citoyens qui en ont besoin et de leur vendre des fournitures. A vous de gérer votre business. Il est possible de prendre quelques citoyens pour vous assister dans votre job.]],
	weapons = {"itemstore_pickup"},
	command = "cwuC",
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "VIP") or string.find(ply:GetUserGroup() , "CWU") or string.find(ply:GetUserGroup() , "Superviseur") or string.find(ply:GetUserGroup() , "Administrateur") or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être VIP pour ça!",
	max = 2,
	salary = 50,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	hasRadio = true,
	cook = true,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.3))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.3).." tokens.")
	end
	})

TEAM_CWUM = DarkRP.createJob("C.W.U DSM", {
	color = Color(18, 149, 241, 255),
 	model = "models/player/kleiner.mdl",	timer=90,
	description = [[Le C.W.U Département Service Médicaux se dévoue totalement à soigner les compatriotes de sa cité. Il doit gérer l'hôpital de la plaza de cité 17 et prodiguer des soins à tous les citoyens dans le besoin.]],
weapons = {"itemstore_pickup","med_kit"},
	command = "cwuM",
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "VIP") or string.find(ply:GetUserGroup() , "CWU") or string.find(ply:GetUserGroup() , "Superviseur") or string.find(ply:GetUserGroup() , "Administrateur") or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être VIP pour ça!",
	max = 2,
	salary = 55,

	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
		hasRadio = true,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.3))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.3).." tokens.")
	end
})

TEAM_CWUS = DarkRP.createJob("C.W.U Superviseur", {
	color = Color(18, 149, 241, 255),
	timer=30,
	model = {	
		"models/jessev92/player/hl2b_cits/m01.mdl",		
		"models/jessev92/player/hl2b_cits/m02.mdl",
		"models/jessev92/player/hl2b_cits/m03.mdl",
		"models/jessev92/player/hl2b_cits/m04.mdl",
		"models/jessev92/player/hl2b_cits/m05.mdl",
		"models/jessev92/player/hl2b_cits/m06.mdl",
		"models/jessev92/player/hl2b_cits/m07.mdl",
		"models/jessev92/player/hl2b_cits/m08.mdl",
		"models/jessev92/player/hl2b_cits/m09.mdl"
	},
	description = [[Le Civil Worker Union Superviseur est en charge de tous les départements CWU et doit aider les nouveaux CWU dans leur fonctions.]],
weapons = {"itemstore_pickup"},
	command = "cwuS",
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "Superviseur") or string.find(ply:GetUserGroup() , "Administrateur") or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être superviseur pour ça!",
	max = 1,
	salary = 200,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
		hasRadio = true,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.3))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.3).." tokens.")
	end
})

TEAM_OTA_PRISON = DarkRP.createJob("Overwatch TransHumanArms Prison Guard", {
	color = Color(132, 0, 255, 255),
	model = "models/player/combine_soldier_prisonguard.mdl",	 
 	description = [[Un O.T.A est une unité d'élite de la milice. Spécialisé dans les interventions lourdes, ses modifications génétiques la rendent presque insensible à la douleur de plus il porte un lourd arsenal faisant de lui une machine à tuer.
	L'O.T.A ne ressent aucune émotions(tristesse, colère, peur, etc).
		Toute résistance face à un O.T.A se résultera par la stérilisation.
		L'O.T.A n'intervient que dans les Lockdown.
		L'O.T.A ne parle qu'en code. Soyez le plus bref possible dans vos communications orales ou écrites.
		Un O.T.A peut revenir sur les lieux de fusillade même après avoir été tué (Vous êtes une autre unité envoyé) durant le lockdown.]],
weapons = {"itemstore_pickup","weapon_cuff_elastic","weapon_shotgun","keypad_cracker","weapon_pistol","weapon_frag", "stunstick","alyx_emptool", "arrest_stick", "unarrest_stick"},
	command = "otap",
	max = 1,
	salary = 50,
	admin = 0,
	timer=60,
	vote = false,
	hasRadio = true,
	hasLicense = false,
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "04") or string.find(ply:GetUserGroup() , "03")  or string.find(ply:GetUserGroup() , "02")  or string.find(ply:GetUserGroup() , "01")  or string.find(ply:GetUserGroup() , "OfC") or  ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être VIP pour ça!",
	help = {
		"L'O.T.A ne ressent aucune émotions(tristesse, colère, peur, etc).",
		"Toute résistance face à un O.T.A se résultera par la stérilisation.",
		"L'O.T.A n'intervient que dans les Lockdown.",
		"L'O.T.A ne parle qu'en code. Soyez le plus bref possible dans vos communications orales ou écrites.",
		"Un O.T.A peut revenir sur les lieux de fusillade durant un lockdown même après avoir été tué (Vous êtes une autre unité envoyé)"
	},
	PlayerSpawn = function(ply) 
		ply:SetArmor(100) ply:SetHealth(300) ply:SetMaxHealth(300)
	end,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.3))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.3).." tokens.")
	end
})


TEAM_OTA = DarkRP.createJob("Overwatch TransHumanArms", {
	color = Color(132, 0, 255, 255),
	VIPOnly = true,
	model = {"models/player/city8_overwatch.mdl",	 
		 "models/player/city8_ow_elite.mdl" },
 	description = [[Un O.T.A est une unité d'élite de la milice. Spécialisé dans les interventions lourdes, ses modifications génétiques la rendent presque insensible à la douleur de plus il porte un lourd arsenal faisant de lui une machine à tuer.
	L'O.T.A ne ressent aucune émotions(tristesse, colère, peur, etc).
		Toute résistance face à un O.T.A se résultera par la stérilisation.
		L'O.T.A n'intervient que dans les Lockdown.
		L'O.T.A ne parle qu'en code. Soyez le plus bref possible dans vos communications orales ou écrites.
		Un O.T.A peut revenir sur les lieux de fusillade même après avoir été tué (Vous êtes une autre unité envoyé) durant le lockdown.]],
weapons = {"itemstore_pickup","weapon_cuff_elastic" ,"itemstore_pickup","weapon_ar2","keypad_cracker","weapon_pistol","weapon_frag", "stunstick","alyx_emptool", "arrest_stick", "unarrest_stick"},
	command = "ota",
	max = 2,
	salary = 90,
	admin = 0,
	timer=0,
	customCheck= function(ply) return team.NumPlayers(TEAM_MAYOR) ==1 and (string.find(ply:GetUserGroup() , "VIP") )or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être VIP pour ça et avoir un administrateur!",
	vote = false,
	hasLicense = false,
	hasRadio = true,
	help = {
		"L'O.T.A ne ressent aucune émotions(tristesse, colère, peur, etc).",
		"Toute résistance face à un O.T.A se résultera par la stérilisation.",
		"L'O.T.A n'intervient que dans les Lockdown.",
		"L'O.T.A ne parle qu'en code. Soyez le plus bref possible dans vos communications orales ou écrites.",
		"Un O.T.A peut revenir sur les lieux de fusillade durant un lockdown même après avoir été tué (Vous êtes une autre unité envoyé)"
	},
	PlayerSpawn = function(ply) 
		ply:SetArmor(100) ply:SetHealth(300) ply:SetMaxHealth(300)
	end
})


TEAM_OTA_KING = DarkRP.createJob("O.T.A King", {
	color = Color(132, 0, 255, 255),
		VIPOnly = true,
 	model = "models/player/city8_overwatch_elite.mdl",	
	description = [[L'O.T.A King est responsable d'une patrouille d'O.T.A. C'est lui qui donne les directives lors des interventions.
			Soyez réactifs durant vos interventions.
		N'ayez pas peur des pertes d'O.T.A. Foncez.]],
weapons = {"itemstore_pickup","weapon_cuff_elastic" , "itemstore_pickup","keypad_cracker","weapon_ar2","weapon_357","weapon_frag", "stunstick","alyx_emptool", "arrest_stick", "unarrest_stick"},
	command = "otaking",
	customCheck= function(ply) return team.NumPlayers(TEAM_MAYOR) ==1 and (string.find(ply:GetUserGroup() , "VIP") and string.find(ply:GetUserGroup() , "King")) or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être VIP pour ça et avoir un administrateur!",
	max = 1,
	salary = 140,
	admin = 0,
	timer=0,
	vote = false,
	hasRadio = true,
	hasLicense = false,
	help = {
		"Soyez réactifs durant vos interventions.",
		"N'ayez pas peur des pertes d'O.T.A. Foncez."
	},
	PlayerSpawn = function(ply) 
		ply:SetArmor(150) ply:SetHealth(400) ply:SetMaxHealth(400)
	end
})

TEAM_STALKER = DarkRP.createJob("Stalker", {
	color = Color(20, 20, 255, 255),
	VIPOnly = true,
	model = "models/stalker.mdl",	timer=0,
	description = [[Un Stalker est un ancien rebelle mutilé et transformé en ouvrier.
		Ne sortez jamais du Nexus.
		Faites vos travaux sans dire un mot.
		Défendez le Nexus.
		]],
	weapons = {"itemstore_pickup"},
	command = "stalker",
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "VIP") or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être VIP pour ça!",
	max = 2,
	salary = 100,
	admin = 0,
	modelScale = 0.1,
	help = {
			"Vous devez fournir la milice en arme."
	},
	vote = false,
	hasLicense = false
})

TEAM_SCN = DarkRP.createJob("Scanner", {
	color = Color(25, 25, 170, 255),
	model = {"models/player/inv2.mdl"},
	description = [[Unité volante qui surveille les rues de la cité et enregistre tous ce qu'elle voit.
	Pensez à régler votre fréquence radio pour communiquer avec la milice.]],
weapons = {"itemstore_pickup", },
	command = "cps",
	max = 1,
	timer=120,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	hasRadio = true,
	help = {
	},
	modelScale = 0.1,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.3))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.3).." tokens.")
	end
})

/*TEAM_VORT_ESCLAVE = DarkRP.createJob("Vortigaunt esclave", {
	color = Color(75, 75, 75, 255),
	model = "models/vortigaunt_slave.mdl",	timer=200,
	description = [[Un vortigaunt esclave a été capturé par l'Union. Son équipement l'affaiblit et l'empeche d'utiliser son pouvoir, la vortessence.
	Un /me et /roll supérieur à 50 est nécessaire pour utiliser la vortessence.]],
weapons = {"itemstore_pickup"},
	command = "vorte",
	max = 1,
	salary = 20,
	admin = 0,
	vote = false,
	hasLicense = false,
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "Loyaliste") or string.find(ply:GetUserGroup() , "CWU") or string.find(ply:GetUserGroup() , "Superviseur") or string.find(ply:GetUserGroup() , "Administrateur") or  ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être VIP pour ça!",
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.15))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.15).." tokens.")
	end
})*/




TEAM_POLICE_RCT = DarkRP.createJob("Protection Civile - Recrue", {
	color = Color(25, 25, 170, 255),
	model = "models/dpfilms/metropolice/playermodels/pm_hdpolice.mdl",
	description = [[ Unité classique de la protection milice. Vous avez été formé pour appliquer les lois de l'Union de manière impartiale. Vous devez montrer l'exemple d'un comportement exemplaire.
		Merci d'être le plus sérieux possible.
		Vous restez un être humain avec des émotions.
		Vous pouvez parler aux citoyens ou non selon votre personnalité.
		Vous devez montrer l'exemple (No bunny, flood ou troll).
		Ne vous aventurer pas seul dans des secteurs isolés!
		Vous devez obéir à tout ordre de votre officier en charge.
		Respectez vos supérieurs!
		Vous ne pouvez aider de quelconque manière la résistance, sauf si vous êtes RCT ou 05 (Lavage de cerveau à 04).
		Vous pouvez arrêter tous citoyens qui enfreint une des règles suivante:
		 -Insultes envers un C.W.U ou Unité Milice.
		 -Agression physique envers toute personne.
		 -Propos anti-Union ou qui éloge la résistance.
		 -Franchissement d'une zone Milice (Nexus ou tout lieu comportant des équipements Union).
		 -Relations sexuels.
		 -Handicapé mental ou physique. (Considéré comme inapte à servir l'Union).]],
weapons = {"itemstore_pickup", "stunstick","arrest_stick","unarrest_stick","alyx_emptool",  "weaponchecker","weapon_cuff_plastic"},
	command = "cp",
	customCheck= function(ply) return team.NumPlayers(TEAM_POLICE_05) > 1 or ply:IsAdmin() end,
	customCheckFailMsg= "Il doit y avoir un 05 pour s'occuper de toi !",
	max = 4,
	timer=120,
	salary = 30,
	hasRadio = true,
	admin = 0,
	vote = false,
	hasLicense = false,
	help = {
	},
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.1))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.1).." tokens.")
	end
})

TEAM_POLICE_05 = DarkRP.createJob("Protection Civile - 05", {
	color = Color(25, 25, 170, 255),
	model = "models/dpfilms/metropolice/playermodels/pm_retrocop.mdl",	
	description = [[Unité classique de la protection milice. Vous avez été formé pour appliquer les lois de l'Union de manière impartiale. Vous devez montrer l'exemple d'un comportement exemplaire.
		Merci d'être le plus sérieux possible.
		Vous restez un être humain avec des émotions.
		Vous pouvez parler aux citoyens ou non selon votre personnalité.
		Vous devez montrer l'exemple (No bunny, flood ou troll).
		Ne vous aventurer pas seul dans des secteurs isolés!
		Vous devez obéir à tout ordre de votre officier en charge.
		Respectez vos supérieurs!
		Vous ne pouvez aider de quelconque manière la résistance, sauf si vous êtes RCT ou 05 (Lavage de cerveau à 04).
		Vous pouvez arrêter tous citoyens qui enfreint une des règles suivante:
		 -Insultes envers un C.W.U ou Unité Milice.
		 -Agression physique envers toute personne.
		 -Propos anti-Union ou qui éloge la résistance.
		 -Franchissement d'une zone Milice (Nexus ou tout lieu comportant des équipements Union).
		 -Relations sexuels.
		 -Handicapé mental ou physique. (Considéré comme inapte à servir l'Union).]],
weapons = {"itemstore_pickup","weapon_cuff_police","arrest_stick","unarrest_stick", "weapon_pistol", "stunstick","alyx_emptool",  "weaponchecker"},
	command = "cp05",
	timer=180,
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "05")  or string.find(ply:GetUserGroup() , "04")  or string.find(ply:GetUserGroup() , "03")  or string.find(ply:GetUserGroup() , "02")  or string.find(ply:GetUserGroup() , "01")  or string.find(ply:GetUserGroup() , "OfC")  or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois passer le test de promotion avec un officier!",
	max = 6,
	salary = 40,
	admin = 0,
	vote = false,
	hasRadio = true,
	hasLicense = false,
	help = {
	},	
	PlayerSpawn = function(ply) 
		ply:SetArmor(15)
    end,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.15))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.15).." tokens.")
	end
})

TEAM_POLICEC = DarkRP.createJob("Protection Civile - HELIX", {
	color = Color(25, 25, 170, 255),
	model = "models/dpfilms/metropolice/playermodels/pm_civil_medic.mdl",	
	description = [[Les médecins de la protection civile sont des unités spécialisés dans l'application de soins sur le terrain ou au Nexus. Elément primordiale pour les patrouilles.]],
weapons = {"itemstore_pickup","weapon_cuff_police","arrest_stick","unarrest_stick","alyx_emptool","weapon_pistol", "stunstick","med_kit",  "weaponchecker"},
	command = "cpm",
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "05")  or string.find(ply:GetUserGroup() , "04")  or string.find(ply:GetUserGroup() , "03")  or string.find(ply:GetUserGroup() , "02")  or string.find(ply:GetUserGroup() , "01")  or string.find(ply:GetUserGroup() , "OfC")  or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois passer le test de promotion avec un officier!",
	max = 1,
	salary = 70,
	timer=200,
	admin = 0,
	vote = false,
	hasRadio = true,
	hasLicense = false,
	help = {
		"Mettez vous à l'abri pour soigner"
	},
	PlayerSpawn = function(ply) 
		ply:SetArmor(50)
    end,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.15))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.15).." tokens.")
	end
})

TEAM_POLICE_GHOST = DarkRP.createJob("Protection Civile - G.H.O.S.T", {
	color = Color(25, 25, 170, 255),
	VIPOnly = true,
 	model = {"models/7 hour player/ar_combine_soldier_old.mdl",	
			 "models/7 hour player/combine_soldier_old.mdl",
				"models/7 hour player/combine_soldier_old_b.mdl"
			 },
	description = [[Unité d'infiltration et neutralisation furtive. Cette section de la milice n'est utilisée que lors d'interventions silencieuses afin de nettoyer et contrôler la zone ou comme simple surveillance passerelle.
			Un G.H.O.S.T reste le plus discret possible.
			Il s'occupe uniquement des suspects armés et ne gère pas des simples citoyens.
		Rester hors de vue en hauteur ou dans l'ombre.,
		Attention au laser du sniper très visible.]],
	weapons = {"itemstore_pickup","alyx_emptool","sbs_stealthboy_infiniteuse","grub_combine_sniper","climb_swep2","weapon_slam", "weapon_bfg_mp7", "weaponchecker", "weapon_smg1", "weapon_pistol"},
	command = "ghost",
	timer=0, 
	max = 1,
	salary = 70,
	admin = 0,
	vote = false,
	hasLicense = false,
	hasRadio = true,
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "VIP") or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être VIP pour ça!",
	help = {

	},
	PlayerSpawn = function(ply) 

		ply:AllowFlashlight( true) 
		ply:SetArmor(80)
	end,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.15))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.15).." tokens.")
	end
})

TEAM_POLICE_04 = DarkRP.createJob("Protection Civile - 04", {
	color = Color(25, 25, 170, 255),
	model = "models/dpfilms/metropolice/playermodels/pm_skull_police.mdl",	timer=240,
	description = [[Unité classique de la protection milice. Vous avez été formé pour appliquer les lois de l'Union de manière impartiale. Vous devez montrer l'exemple d'un comportement exemplaire.
		Merci d'être le plus sérieux possible.
		Vous restez un être humain avec des émotions.
		Vous pouvez parler aux citoyens ou non selon votre personnalité.
		Vous devez montrer l'exemple (No bunny, flood ou troll).
		Ne vous aventurer pas seul dans des secteurs isolés!
		Vous devez obéir à tout ordre de votre officier en charge.
		Respectez vos supérieurs!
		Vous ne pouvez aider de quelconque manière la résistance, sauf si vous êtes RCT ou 05 (Lavage de cerveau à 04).
		Vous pouvez arrêter tous citoyens qui enfreint une des règles suivante:
		 -Insultes envers un C.W.U ou Unité Milice.
		 -Agression physique envers toute personne.
		 -Propos anti-Union ou qui éloge la résistance.
		 -Franchissement d'une zone Milice (Nexus ou tout lieu comportant des équipements Union).
		 -Relations sexuels.
		 -Handicapé mental ou physique. (Considéré comme inapte à servir l'Union).]],
weapons = {"itemstore_pickup","weapon_shotgun","arrest_stick","unarrest_stick","weapon_cuff_police", "weapon_pistol", "stunstick","alyx_emptool",  "weaponchecker","weapon_shield"},
	command = "cp04",
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "04")  or string.find(ply:GetUserGroup() , "03")  or string.find(ply:GetUserGroup() , "02")  or string.find(ply:GetUserGroup() , "01")  or string.find(ply:GetUserGroup() , "OfC")  or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois passer le test de promotion avec un officier!",
	max = 4,
	salary = 50,
	admin = 0,
	vote = false,
	hasRadio = true,
	hasLicense = false,
	help = {
	},	
	PlayerSpawn = function(ply) 
		ply:SetArmor(35)
		ply:SetHealth(120) 
		ply:SetMaxHealth(120)
    end,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.15))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.15).." tokens.")
	end
})

TEAM_POLICE_03 = DarkRP.createJob("Protection Civile - 03", {
	color = Color(25, 25, 170, 255),
	model = "models/dpfilms/metropolice/playermodels/pm_rogue_police.mdl",	timer=300,
	description = [[Unité classique de la protection milice. Vous avez été formé pour appliquer les lois de l'Union de manière impartiale. Vous devez montrer l'exemple d'un comportement exemplaire.
		Merci d'être le plus sérieux possible.
		Vous restez un être humain avec des émotions.
		Vous pouvez parler aux citoyens ou non selon votre personnalité.
		Vous devez montrer l'exemple (No bunny, flood ou troll).
		Ne vous aventurer pas seul dans des secteurs isolés!
		Vous devez obéir à tout ordre de votre officier en charge.
		Respectez vos supérieurs!
		Vous ne pouvez aider de quelconque manière la résistance, sauf si vous êtes RCT ou 05 (Lavage de cerveau à 04).
		Vous pouvez arrêter tous citoyens qui enfreint une des règles suivante:
		 -Insultes envers un C.W.U ou Unité Milice.
		 -Agression physique envers toute personne.
		 -Propos anti-Union ou qui éloge la résistance.
		 -Franchissement d'une zone Milice (Nexus ou tout lieu comportant des équipements Union).
		 -Relations sexuels.
		 -Handicapé mental ou physique. (Considéré comme inapte à servir l'Union).]],
weapons = {"itemstore_pickup","weapon_shotgun","arrest_stick","unarrest_stick","weapon_frag","weapon_cuff_police", "weapon_pistol", "stunstick","alyx_emptool",  "weaponchecker","weapon_shield"},
	command = "cp03",
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "03")  or string.find(ply:GetUserGroup() , "02")  or string.find(ply:GetUserGroup() , "01")  or string.find(ply:GetUserGroup() , "OfC")  or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois passer le test de promotion avec un officier!",
	max = 3,
	salary = 60,
	admin = 0,
	vote = false,
	hasRadio = true,
	hasLicense = false,
	help = {
	},	
	PlayerSpawn = function(ply) 
		ply:SetArmor(55) 
		ply:SetHealth(140) 
		ply:SetMaxHealth(140)
    end,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.2))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.2).." tokens.")
	end
})

TEAM_POLICE_02 = DarkRP.createJob("Protection Civile - 02", {
	color = Color(25, 25, 170, 255),
	model = "models/dpfilms/metropolice/playermodels/pm_phoenix_police.mdl",	timer=360,
	description = [[Unité classique de la protection milice. Vous avez été formé pour appliquer les lois de l'Union de manière impartiale. Vous devez montrer l'exemple d'un comportement exemplaire.
		Merci d'être le plus sérieux possible.
		Vous restez un être humain avec des émotions.
		Vous pouvez parler aux citoyens ou non selon votre personnalité.
		Vous devez montrer l'exemple (No bunny, flood ou troll).
		Ne vous aventurer pas seul dans des secteurs isolés!
		Vous devez obéir à tout ordre de votre officier en charge.
		Respectez vos supérieurs!
		Vous ne pouvez aider de quelconque manière la résistance, sauf si vous êtes RCT ou 05 (Lavage de cerveau à 04).
		Vous pouvez arrêter tous citoyens qui enfreint une des règles suivante:
		 -Insultes envers un C.W.U ou Unité Milice.
		 -Agression physique envers toute personne.
		 -Propos anti-Union ou qui éloge la résistance.
		 -Franchissement d'une zone Milice (Nexus ou tout lieu comportant des équipements Union).
		 -Relations sexuels.
		 -Handicapé mental ou physique. (Considéré comme inapte à servir l'Union).]],
weapons = {"itemstore_pickup","weapon_smg1","arrest_stick","unarrest_stick","weapon_frag","weapon_cuff_police", "weapon_pistol", "stunstick","alyx_emptool",  "weaponchecker", "weapon_357"},
	command = "cp02",
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "02")  or string.find(ply:GetUserGroup() , "01")  or string.find(ply:GetUserGroup() , "OfC")  or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois passer le test de promotion avec un officier!",
	max = 2,
	salary = 80,
	admin = 0,
	hasRadio = true,
	vote = false,
	hasLicense = false,
	help = {
	},	
	PlayerSpawn = function(ply) 
		ply:SetArmor(75) 
		ply:SetHealth(160) 
		ply:SetMaxHealth(160)
    end,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.2))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.2).." tokens.")
	end
})
TEAM_POLICE_01 = DarkRP.createJob("Protection Civile - 01", {
	color = Color(25, 25, 170, 255),
	model = "models/dpfilms/metropolice/playermodels/pm_elite_police.mdl",	timer=420,
	description = [[Unité classique de la protection milice. Vous avez été formé pour appliquer les lois de l'Union de manière impartiale. Vous devez montrer l'exemple d'un comportement exemplaire.
		Merci d'être le plus sérieux possible.
		Vous restez un être humain avec des émotions.
		Vous pouvez parler aux citoyens ou non selon votre personnalité.
		Vous devez montrer l'exemple (No bunny, flood ou troll).
		Ne vous aventurer pas seul dans des secteurs isolés!
		Vous devez obéir à tout ordre de votre officier en charge.
		Respectez vos supérieurs!
		Vous ne pouvez aider de quelconque manière la résistance, sauf si vous êtes RCT ou 05 (Lavage de cerveau à 04).
		Vous pouvez arrêter tous citoyens qui enfreint une des règles suivante:
		 -Insultes envers un C.W.U ou Unité Milice.
		 -Agression physique envers toute personne.
		 -Propos anti-Union ou qui éloge la résistance.
		 -Franchissement d'une zone Milice (Nexus ou tout lieu comportant des équipements Union).
		 -Relations sexuels.
		 -Handicapé mental ou physique. (Considéré comme inapte à servir l'Union).]],
weapons = {"itemstore_pickup","weapon_cuff_elastic","arrest_stick","unarrest_stick","weapon_smg1","weapon_frag","weapon_cuff_police", "weapon_pistol", "stunstick","alyx_emptool",  "weaponchecker", "weapon_crossbow", "weapon_shotgun", "weapon_stunstick", "weapon_357", "weapon_bp_oicw"},
	command = "cp01",
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "01")  or string.find(ply:GetUserGroup() , "OfC")  or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois passer le test de promotion avec un officier!",
	max = 2,
	salary = 100,
	admin = 0,
	vote = false,
	hasRadio = true,
	hasLicense = false,
	help = {
	},	
	PlayerSpawn = function(ply) 
		ply:SetArmor(90) 
		ply:SetHealth(180) 
		ply:SetMaxHealth(180)
    end,
    modelScale = 0.1,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.2))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.3).." tokens.")
	end
})
TEAM_GUNPC = DarkRP.createJob("Protection Civile - Armurier", {
	color = Color(20, 20, 255, 255),
	model = "models/dpfilms/metropolice/playermodels/pm_rtb_police.mdl",	timer=240,
	description = [[Un armurerier MPF reste dans le Nexus et n'en sort sous aucun prétexte.
			Vous devez fournir en arme toutes unité milice, OTA ou administrateur.
		Ne sortez jamais du Nexus.
		Ne vendez aucunes armes au civils.
		Respectez les grades d'armes! (Pas de SMG pour une simple unité PC).
		]],
weapons = {"itemstore_pickup","weapon_cuff_elastic","arrest_stick","unarrest_stick","alyx_emptool","weapon_shotgun","weapon_pistol","weapon_cuff_police", "stunstick",  "weaponchecker"},
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "04")  or string.find(ply:GetUserGroup() , "03")  or string.find(ply:GetUserGroup() , "02")  or string.find(ply:GetUserGroup() , "01")  or string.find(ply:GetUserGroup() , "OfC")  or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois passer le test de promotion avec un officier!",
	command = "gundealerpc",
	max = 1,
	salary = 70,
	admin = 0,
	help = {
			"Vous devez fournir la milice en arme."
	},
	vote = false,
	hasLicense = false,
	hasRadio = true,	
	PlayerSpawn = function(ply) 
		ply:SetArmor(35) 
		ply:SetHealth(110) 
		ply:SetMaxHealth(110)
    end,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.15))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.3).." tokens.")
	end
})

TEAM_CHIEF = DarkRP.createJob("Protection Civile - Officier", {
	color = Color(20, 20, 255, 255),
	model = "models/dpfilms/metropolice/playermodels/pm_policetrench.mdl",	timer=720,
	description = [[Un officier a les pleins pouvoir sur les unités de sa milice. Il organise les patrouilles des unités et est responsable de la sécurité des grandes places de la cité.
	Vous êtes responsable des unités PC.]],
weapons = {"itemstore_pickup","weapon_cuff_elastic","arrest_stick","unarrest_stick","alyx_emptool","weapon_cuff_police", "weapon_smg1","weapon_pistol" ,"stunstick","alyx_emptool",  "weaponchecker","weapon_shield", "weapon_stunstick", "weapon_bp_oicw", "weapon_shotgun", "m9k_spas12", "weapon_357", "weapon_bp_smg3"},
	command = "chief",
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "OfC")  or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois passer le test de promotion avec un officier!",
	max = 1,
	salary = 120,
	hasRadio = true,
	admin = 0,
	vote = false,
	hasLicense = false,
	chief = true,
	help = {
		"Vous êtes responsable des unités PC."
	},	
	PlayerSpawn = function(ply) 
		ply:SetArmor(125) 
		ply:SetHealth(220) 
		ply:SetMaxHealth(220)
    end,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.3))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.3).." tokens.")
	end
})


TEAM_REB = DarkRP.createJob("Résistant", {
	color = Color(75, 75, 75, 255),
	model = {"models/player/group03/male_01.mdl",	
		"models/player/Group03/Male_02.mdl",	
		"models/player/Group03/male_03.mdl",	
		"models/player/Group03/Male_04.mdl",	
		"models/player/Group03/Male_05.mdl",	
		"models/player/Group03/Male_06.mdl",	
		"models/player/Group03/Male_07.mdl",	
		"models/player/Group03/Male_08.mdl",	
		"models/player/Group03/Male_09.mdl"},
	description = [[Vous êtes désormais un membre de la rebellion mais attention, ne tombez pas dans le cliché de la rebellion qui veut tuer tout les MPF!! La rebellion n'a aucune chance face à l'Union et en est très consciente, surtout face aux vagues infinies d'O.T.A, elle doit rester discrète. La rebellion existe pour aider les citoyens à survivre hors de portée de la dictature de l'Union et apporte leur aide en confort et nourritures. Les scènes de fusillades resteront rares et pour des cas spéciaux (embuscades, self-défense).]],
weapons = {"itemstore_pickup", "weapon_pistol", "m9k_ak47"},
	command = "gangster",
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "résistant") or string.find(ply:GetUserGroup() , "crésistant") or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être VIP pour ça!",
	max = 3,
	timer=180,
	salary = 0,
	admin = 0,
	hasRadio = true,
	vote = false,
	hasLicense = false,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.15))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.15).." tokens.")
	end
})

TEAM_REBC= DarkRP.createJob("Résistant Cuistot", {
	color = Color(75, 75, 75, 255),
	model = {"models/player/group03/male_01.mdl",	
		"models/player/Group03/Male_02.mdl",	
		"models/player/Group03/male_03.mdl",	
		"models/player/Group03/Male_04.mdl",	
		"models/player/Group03/Male_05.mdl",	
		"models/player/Group03/Male_06.mdl",	
		"models/player/Group03/Male_07.mdl",	
		"models/player/Group03/Male_08.mdl",	
		"models/player/Group03/Male_09.mdl"},
	description = [[Vous êtes désormais un membre de la rebellion mais attention, ne tombez pas dans le cliché de la rebellion qui veut tuer tout les MPF!! La rebellion n'a aucune chance face à l'Union et en est très consciente, surtout face aux vagues infinies d'O.T.A, elle doit rester discrète. La rebellion existe pour aider les citoyens à survivre hors de portée de la dictature de l'Union et apporte leur aide en confort et nourritures. Les scènes de fusillades resteront rares et pour des cas spéciaux (embuscades, self-défense).]],
weapons = {"itemstore_pickup", "weapon_pistol"},
	command = "gangsterC",
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "résistant") or string.find(ply:GetUserGroup() , "crésistant") and team.NumPlayers(TEAM_COOK) == 1 or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être VIP pour ça!",
	max = 1,
	timer=180,
	salary = 0,
	admin = 0,
	vote = false,
	hasRadio = true,
	hasLicense = false,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.15))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.15).." tokens.")
	end
})

TEAM_REBF = DarkRP.createJob("Résistante", {
	color = Color(75, 75, 75, 255),
	model = {
		"models/player/Group03/Female_01.mdl",	
		"models/player/Group03/Female_02.mdl",
		"models/player/Group03/Female_03.mdl",	
		"models/player/Group03/Female_04.mdl",	
		"models/player/Group03/Female_06.mdl"},
	description = [[Vous êtes désormais un membre de la rebellion mais attention, ne tombez pas dans le cliché de la rebellion qui veut tuer tout les MPF!! La rebellion n'a aucune chance face à l'Union et en est très consciente, surtout face aux vagues infinies d'O.T.A, elle doit rester discrète. La rebellion existe pour aider les citoyens à survivre hors de portée de la dictature de l'Union et apporte leur aide en confort et nourritures. Les scènes de fusillades resteront rares et pour des cas spéciaux (embuscades, self-défense).]],
weapons = {"itemstore_pickup", "weapon_pistol", "m9k_ak47"},
	command = "gangsterF",
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "résistant") or string.find(ply:GetUserGroup() , "crésistant") or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être VIP pour ça!",
	max = 2,
	timer=180,
	hasRadio = true,
	salary = 0,
	admin = 0,
	vote = false,
	hasLicense = false,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.15))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.15).." tokens.")
	end
})

TEAM_REB_MED = DarkRP.createJob("Résistant Médecin", {
	color = Color(75, 75, 75, 255),
	model = {"models/player/group03m/male_01.mdl",
		"models/player/Group03m/Male_02.mdl",	
		"models/player/Group03m/male_03.mdl",	
		"models/player/Group03m/Male_04.mdl",
		"models/player/Group03m/Male_05.mdl",	
		"models/player/Group03m/Male_06.mdl",	
		"models/player/Group03m/Male_07.mdl",	
		"models/player/Group03m/Male_08.mdl",
		"models/player/Group03m/Male_09.mdl"},
	description = [[Vous êtes désormais un membre de la rebellion mais attention, ne tombez pas dans le cliché de la rebellion qui veut tuer tout les MPF!! La rebellion n'a aucune chance face à l'Union et en est très conscient, surtout face aux vagues infinies d'O.T.A, elle doit rester discrète. La rebellion existe pour aider les citoyens à survivre hors de portée de la dictature de l'Union et apporte leur aide en confort et nourritures. Les scènes de fusillades resteront rares et pour des cas spéciaux (embuscades, self-défense).]],
weapons = {"itemstore_pickup","med_kit", "weapon_pistol"},
	command = "gangstermed",
	customCheck= function(ply) return team.NumPlayers(TEAM_REB_MEDF) ==0 or ply:IsAdmin() end,
	customCheckFailMsg= "Il ne peut y avoir que un médecin.",
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "résistantmed") or string.find(ply:GetUserGroup() , "crésistant") or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être VIP pour ça!",
	max = 1,
	timer=240,
	salary = 0,
	admin = 0,
	hasRadio = true,
	vote = false,
	hasLicense = false,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.15))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.15).." tokens.")
	end
})

TEAM_REB_MEDF = DarkRP.createJob("Résistant Médecin F.", {
	color = Color(75, 75, 75, 255),
	model = {
		"models/player/Group03m/Female_01.mdl",	
		"models/player/Group03m/Female_02.mdl",
		"models/player/Group03m/Female_03.mdl",	
		"models/player/Group03m/Female_04.mdl",
		"models/player/Group03m/Female_06.mdl"},
	description = [[Vous êtes désormais un membre de la rebellion mais attention, ne tombez pas dans le cliché de la rebellion qui veut tuer tout les MPF!! La rebellion n'a aucune chance face à l'Union et en est très conscient, surtout face aux vagues infinies d'O.T.A, elle doit rester discrète. La rebellion existe pour aider les citoyens à survivre hors de portée de la dictature de l'Union et apporte leur aide en confort et nourritures. Les scènes de fusillades resteront rares et pour des cas spéciaux (embuscades, self-défense).]],
weapons = {"itemstore_pickup","med_kit", "weapon_pistol"},
	command = "gangstermedF",
	customCheck= function(ply) return team.NumPlayers(TEAM_REB_MED) ==0 or ply:IsAdmin() end,
	customCheckFailMsg= "Il ne peut y avoir que un médecin.",
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "résistantmed") or string.find(ply:GetUserGroup() , "crésistant") or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être VIP pour ça!",
	max = 1,
	timer=240,
	salary = 0,
	admin = 0,
	hasRadio = true,
	vote = false,
	hasLicense = false,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.15))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.15).." tokens.")
	end
})


TEAM_VORT = DarkRP.createJob("Vortigaunt", {
	color = Color(75, 75, 75, 255),
	VIPOnly = true,
	model = "models/player/inv2.mdl",	timer=0,
	description = [[Vous êtes désormais un membre de la rebellion mais attention, ne tombez pas dans le cliché de la rebellion qui veut tuer tout les MPF!! La rebellion n'a aucune chance face à l'Union et en est très conscient, surtout face aux vagues infinies d'O.T.A, elle doit rester discrète. La rebellion existe pour aider les citoyens à survivre hors de portée de la dictature de l'Union et apporte leur aide en confort et nourritures. Les scènes de fusillades resteront rares et pour des cas spéciaux (embuscades, self-défense).]],
weapons = {"itemstore_pickup"},
	command = "vort",
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "VIP") or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être VIP pour ça!",
	max = 1,
	salary = 30,
	admin = 0,
	vote = false,
	hasLicense = false,
	modelScale = 0.1,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.15))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.15).." tokens.")
	end
})

TEAM_VORT_SCIEN = DarkRP.createJob("Vortigaunt Scientifique", {
	color = Color(75, 75, 75, 255),
	VIPOnly = true,
	model = "models/player/inv2.mdl",	timer=120,
	description = [[Vous êtes désormais un membre de la rebellion mais attention, ne tombez pas dans le cliché de la rebellion qui veut tuer tout les MPF!! La rebellion n'a aucune chance face à l'Union et en est très conscient, surtout face aux vagues infinies d'O.T.A, elle doit rester discrète. La rebellion existe pour aider les citoyens à survivre hors de portée de la dictature de l'Union et apporte leur aide en confort et nourritures. Les scènes de fusillades resteront rares et pour des cas spéciaux (embuscades, self-défense).]],
weapons = {"itemstore_pickup"},
	command = "vorts",
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "VIP") or  ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être VIP pour ça!",
	max = 1,
	salary = 40,
	admin = 0,
	vote = false,
	hasLicense = false,
	modelScale = 0.1,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.15))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.15).." tokens.")
	end
})

TEAM_REB_ELITE = DarkRP.createJob("Apprenti résistant", {
	color = Color(75, 75, 75, 255),
	
 	model = {"models/player/lambdamovement.mdl",	
			 "models/player/lambdamovement_coat.mdl"
			 },
	description = [[Vous avez rejoint la résistance mais malgré votre équipement, vous avez encore beaucoup à apprendre.]],
weapons = {"itemstore_pickup", "weapon_pistol"},
	command = "mobboss",
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "VIP") or  ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être VIP pour ça!",
	max = 1,
	timer=0,
	salary = 20,
	hasRadio = true,
	admin = 0,
	vote = false,
	hasLicense = false,
	help = {
		"Vous devez accomplir vos missions."
	},
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.15))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.15).." tokens.")
	end
})

TEAM_REB_ELITEF = DarkRP.createJob("Apprentie résistante", {
	color = Color(75, 75, 75, 255),
	
 	model = {"models/player/lambdamovement_female.mdl"},
	description = [[Vous avez rejoint la résistance mais malgré votre équipement, vous avez encore beaucoup à apprendre.]],

weapons = {"itemstore_pickup", "weapon_pistol"},
	command = "mobbossf",
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "VIP") or  ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être VIP pour ça!",
	max = 1,
	timer=0,
	hasRadio = true,
	salary = 20,
	admin = 0,
	vote = false,
	hasLicense = false,
	help = {
		"Vous devez accomplir vos missions."
	},
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.15))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.15).." tokens.")
	end
})


TEAM_REB_PC = DarkRP.createJob("Protection Civile - Infiltré", {
	color = Color(75, 75, 75, 255),
	
 	model = "models/dpfilms/metropolice/playermodels/pm_resistance_police.mdl",
	description = [[Vous êtes un rebelle qui a infiltré les rangs de la milice. Cela vous permet d'entrer ou sortir du Nexus.]],
	weapons = {"itemstore_pickup","alyx_emptool","stunstick", "weaponchecker", "weapon_pistol", "weapon_smg1"},
	command = "gangsterpc",
	customCheck= function(ply) return  (string.find(ply:GetUserGroup() , "VIP") and string.find(ply:GetUserGroup() , "Infiltre")) or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être VIP pour ça!",
	max = 1,
	hasRadio = true,

	salary = 45,
	timer=0,
	admin = 0,
	vote = false,
	hasLicense = false,
	help = {
		"Vous devez accomplir vos missions."
	},
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.15))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.15).." tokens.")
	end
})
TEAM_CHIEF_REBELLE = DarkRP.createJob("Chef de la Résistance", {
	color = Color(75, 75, 75, 255),
	model = "models/player/eli.mdl",	timer=600,
	description = [[Le crésistant de la rebellion ne doit jamais se montrer au grand jour et ne révelera son apparence à très peu de rebelles élites. Cachez au fin fond de la cité, il donne les objectifs et mission de la rebellion.
		Vous devez gérer l'organisation de la milice.
		Restez le plus discret possible.
		]],
weapons = {"itemstore_pickup", "weapon_smg1", "weapon_crossbow", "weapon_pistol", "m9k_ak47"},
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "crésistant") or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être crésistant pour ça!",
	command = "chiefrebelle",
	max = 1,
	salary = 110,
	admin = 0,
	hasRadio = true,
	vote = false,
	hasLicense = false,
	help = {
		"Vous devez gérer l'organisation de la milice.",
		"Restez le plus discret possible.",
		"/agenda <Message> pour donnez les directives aux rebelles."
	},
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.3))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.3).." tokens.")
	end
})

TEAM_GUN = DarkRP.createJob("Contrebandier", {
	color = Color(255, 140, 0, 255),
	model = "models/player/odessa.mdl",	
	timer=180,
	description = [[Un contrebandier vit dans le slum et n'en sort sous aucun prétexte car il est généralement recherché par la milice. Il connait les moindres recoins de la cité et ses connaissances lui donnent accès à des équipements particuliers.
			Vous avez libre arbitre pour accepter de vendre ou non.
		Ne sortez jamais du Slum.
		Soyez actifs et changez régulièrement de planque.
		Ce n'est pas un membre de la rébellion.]],
weapons = {"itemstore_pickup"},
	command = "gundealer",
	max = 1,
	customCheck = function(ply) return string.find(ply:GetUserGroup() , "VIP") or string.find(ply:GetUserGroup() , "crésistant") end,
	salary = 20,
	admin = 0,
	help = {
		"Vous avez libre arbitre pour accepter de vendre ou non.",
		"Ne sortez jamais du Slum.",
		"Soyez actifs et changez régulièrement de planque."
	},
	vote = false,
	hasLicense = false,
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.3))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.3).." tokens.")
	end
})



TEAM_MAYOR = DarkRP.createJob("Administrateur", {
	color = Color(150, 20, 20, 255),
	model = "models/player/breen.mdl",	timer=840,
 	description = [[L'Administrateur est responsable du bon fonctionnement de la cité. Il gère la milice, le C.W.U et donne des directives au O.T.A. Il peut faire des discours et organiser tout type d'évenement. Seul l'administrateur peut déclencher un Lockdown et l'annuler. Enfin, il peut rédiger des lois que les citoyens devront respecter et la milice à faire appliquer.
			L'Administrateur est le représentant de l'humanité envers les supérieurs de l'Union.
		Vous pouvez activer un lockdown en cas de:
		 -Chaos dans les rues principales de la cité (Plaza et ruelles autour).
		 -Coups de feu non identifiés
		/lockdown pour déclencher un lockdown
		/unlockdown pour mettre fin au lockdown
		/placelaws pour placer un écran affichant les lois.
		/addlaw et /removelaw pour ajouter ou supprimer une loi.]],
weapons = {"itemstore_pickup","alyx_emptool", "weapon_357"},
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "Administrateur") or ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être administrateur pour ça!",
	command = "mayor",
	max = 1,
	salary = 150,
	hasRadio = true,
	admin = 0,
	vote = false,
	hasLicense = false,
	mayor = true,
	help = {
		"L'Administrateur est le représentant de l'humanité envers les supérieurs de l'Union.",
		"Vous pouvez activer un lockdown en cas de:",
		"-Chaos dans les rues principales de la cité (Plaza et ruelles autour).",
		"-Coups de feu non identifié",
		"/lockdown pour déclencher un lockdown",
		"/unlockdown pour mettre fin au lockdown",
		"/placelaws pour placer un écran affichant les lois.",
		"/addlaw et /removelaw pour ajouter ou supprimer une loi."
	},
	PlayerDeath = function(ply, weapon, killer)
		if(killer == ply or weapon:GetClass()=="prop_physics" or weapon:GetClass()=="unknown") then return end
		amount=ply:getDarkRPVar("money")
		ply:addMoney(-math.ceil(amount*0.3))
		DarkRP.notify(ply, 0, 4,  "Votre mort vous a coûté "..math.ceil(amount*0.3).." tokens.")
	end
})

TEAM_HOBO = DarkRP.createJob("Zombie Classique", {
	color = Color(80, 45, 0, 255),
	model = "models/player/inv2.mdl",	timer=100,
			
	description = [[Nécrotique, ou également appellé Zombie. Un humain malchanceux qui a fait face à un headcrab qui a pris possesion de son corps. Ils 'vivent' dans les égouts et le chantier et n'en sortent jamais.
		Interdit d'aller se ballader dans les grandes rues de la cité.
		Vous êtes autorisé à tuer tout ce qui bouge et vivant.
		Rester généreux sur la quantité de kill par contre. Interdit de chain-kill.]],
weapons = {"itemstore_pickup"},
	command = "hobo",
	max = 3,
	salary = 0,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	hobo = true,
	PlayerSpawn = function(ply) 
		pk_pills.apply(ply,"zombie") 
		ply:SetNoDraw(true)
    end,
	help = {
		"Interdit d'aller se ballader dans les grandes rues de la cité.",
		"Vous êtes autorisé à tuer tout ce qui bouge et vivant.",
		"Rester généreux sur la quantité de kill par contre. Interdit de chain-kill."
	},
	modelScale = 0.1,
	PlayerDeath = function(ply, weapon, killer)
		RunConsoleCommand("rp_teamban", ply:UserID(), "Zombie Classique", 600)
		RunConsoleCommand("rp_teamban", ply:UserID(), "Rôdeur aveugle", 600)
		RunConsoleCommand("rp_teamban", ply:UserID(), "Zombie mère", 600)
		RunConsoleCommand("rp_teamban", ply:UserID(), "Zombine", 600)
		ply:changeTeam(GAMEMODE.DefaultTeam, true)
	end
})
TEAM_HOBOF = DarkRP.createJob("Rôdeur aveugle", {
	color = Color(80, 45, 0, 255),
	VIPOnly = true,
	model = "models/player/inv2.mdl",	timer=0,
	description = [[Nécrotique, ou également appellé Zombie. Un humain malchanceux qui a fait face à un headcrab qui a pris possesion de son corps. Ils 'vivent' dans les égouts et le chantier et n'en sortent jamais.
		Interdit d'aller se ballader dans les grandes rues de la cité.
		Vous êtes autorisé à tuer tout ce qui fait du bruit, vous êtes aveugle et jouer au son.
		Rester généreux sur la quantité de kill par contre. Interdit de chain-kill.]],
weapons = {"itemstore_pickup"},
	command = "hobof",
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "VIP") or  ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être VIP pour ça!",
	max = 2,
	salary = 0,
	admin = 0,
	vote = false,
	PlayerSpawn = function(ply) 
		pk_pills.apply(ply,"zombie") ply:SetNoDraw(true)
    end,
	hasLicense = false,
	candemote = false,
	hobo = true,
	help = {
		"Interdit d'aller se ballader dans les grandes rues de la cité.",
		"Vous êtes autorisé à tuer tout ce qui bouge et vivant.",
		"Rester généreux sur la quantité de kill par contre. Interdit de chain-kill."
	},
	modelScale = 0.1,
	PlayerDeath = function(ply, weapon, killer)
		RunConsoleCommand("rp_teamban", ply:UserID(), "Zombie Classique", 600)
		RunConsoleCommand("rp_teamban", ply:UserID(), "Rôdeur aveugle", 600)
		RunConsoleCommand("rp_teamban", ply:UserID(), "Zombie mère", 600)
		RunConsoleCommand("rp_teamban", ply:UserID(), "Zombine", 600)
		ply:changeTeam(GAMEMODE.DefaultTeam, true)
	end
})

TEAM_HOBOZ = DarkRP.createJob("Zombie mère", {
	color = Color(80, 45, 0, 255),
	VIPOnly = true,
	model = "models/player/inv2.mdl",	timer=0,
			
	description = [[Nécrotique, ou également appellé Zombie. Un humain malchanceux qui a fait face à un headcrab qui a pris possesion de son corps. Ils 'vivent' dans les égouts et le chantier et n'en sortent jamais.
		Interdit d'aller se ballader dans les grandes rues de la cité.
		"Vous êtes autorisé à tuer tout ce qui bouge et vivant.",
		Rester généreux sur la quantité de kill par contre. Interdit de chain-kill.]],
weapons = {"itemstore_pickup"},
	command = "hoboz",
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "VIP") or  ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être VIP pour ça!",
	max = 1,
	salary = 0,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	hobo = true,
	PlayerSpawn = function(ply) 
		pk_pills.apply(ply,"zombie") ply:SetNoDraw(true)
    end,
    modelScale = 0.1,
	help = {
		"Interdit d'aller se ballader dans les grandes rues de la cité.",
		"Vous êtes autorisé à tuer tout ce qui bouge et vivant.",
		"Rester généreux sur la quantité de kill par contre. Interdit de chain-kill."
	},
	PlayerDeath = function(ply, weapon, killer)
		RunConsoleCommand("rp_teamban", ply:UserID(), "Zombie Classique", 600)
		RunConsoleCommand("rp_teamban", ply:UserID(), "Rôdeur aveugle", 600)
		RunConsoleCommand("rp_teamban", ply:UserID(), "Zombie mère", 600)
		RunConsoleCommand("rp_teamban", ply:UserID(), "Zombine", 600)
		ply:changeTeam(GAMEMODE.DefaultTeam, true)
	end
})

TEAM_HOBOH = DarkRP.createJob("Zombine", {
	color = Color(80, 45, 0, 255),
	VIPOnly = true,
	model = "models/player/inv2.mdl",	timer=0,
			
	description = [[Nécrotique, ou également appellé Zombie. Un humain malchanceux qui a fait face à un headcrab qui a pris possesion de son corps. Ils 'vivent' dans les égouts et le chantier et n'en sortent jamais.
		Interdit d'aller se ballader dans les grandes rues de la cité.
		"Vous êtes autorisé à tuer tout ce qui bouge et vivant.",
		Rester généreux sur la quantité de kill par contre. Interdit de chain-kill.]],
weapons = {"itemstore_pickup"},
	command = "hoboh",
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "VIP") or  ply:IsAdmin() end,
	customCheckFailMsg= "Tu dois être VIP pour ça!",
	max = 1,
	salary = 0,
	admin = 0,
	vote = false,
	hasLicense = false,
	candemote = false,
	hobo = true,
	modelScale = 0.1,
	PlayerSpawn = function(ply) 
		pk_pills.apply(ply,"zombie") ply:SetNoDraw(true)
    end,
	help = {
		"Interdit d'aller se ballader dans les grandes rues de la cité.",
		"Vous êtes autorisé à tuer tout ce qui bouge et vivant.",
		"Rester généreux sur la quantité de kill par contre. Interdit de chain-kill."
	},
	PlayerDeath = function(ply, weapon, killer)
		RunConsoleCommand("rp_teamban", ply:UserID(), "Zombie Classique", 600)
		RunConsoleCommand("rp_teamban", ply:UserID(), "Rôdeur aveugle", 600)
		RunConsoleCommand("rp_teamban", ply:UserID(), "Zombie mère", 600)
		RunConsoleCommand("rp_teamban", ply:UserID(), "Zombine", 600)
		ply:changeTeam(GAMEMODE.DefaultTeam, true)
	end
})


TEAM_ANTLION = DarkRP.createJob("Antlion", {
	color = Color(0, 255, 0, 255),
	VIPOnly = true,
	model = "models/player/inv2.mdl",	timer=0,
	description = [[Créature venant d'un autre monde. Très hostile envers les humains.]],
weapons = {"itemstore_pickup"},
	command = "antlion",
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "VIP") or  ply:IsAdmin() end,
	max = 1,
	salary = 0,
	admin = 1,
	vote = false,
	hasLicense = false,
	modelScale = 0.1,
	PlayerSpawn = function(ply) 
		pk_pills.apply(ply,"zombie") ply:SetNoDraw(true)
    end,
	help = {
	},
	PlayerDeath = function(ply, weapon, killer)
		RunConsoleCommand("rp_teamban", ply:UserID(), "Antlion", 600)
		RunConsoleCommand("rp_teamban", ply:UserID(), "Antlion Ouvrier", 600)
		ply:changeTeam(GAMEMODE.DefaultTeam, true)
	end
})

TEAM_ANTLION_WORK = DarkRP.createJob("Antlion Ouvrier", {
	color = Color(0, 255, 0, 255),
	VIPOnly = true,
	model = "models/player/inv2.mdl",	timer=0,
	description = [[Créature venant d'un autre monde. Très hostile envers les humains.]],
weapons = {"itemstore_pickup"},
	command = "antlionw",
	customCheck= function(ply) return string.find(ply:GetUserGroup() , "VIP") or  ply:IsAdmin() end,
	max = 1,
	salary = 0,
	admin = 1,
	vote = false,
	hasLicense = false,
	modelScale = 0.1,
	PlayerSpawn = function(ply) 
		pk_pills.apply(ply,"zombie") ply:SetNoDraw(true)
    end,
	help = {
	},
	PlayerDeath = function(ply, weapon, killer)
		RunConsoleCommand("rp_teamban", ply:UserID(), "Antlion", 600)
		RunConsoleCommand("rp_teamban", ply:UserID(), "Antlion Ouvrier", 600)
		ply:changeTeam(GAMEMODE.DefaultTeam, true)
	end
})


TEAM_ADMIN = DarkRP.createJob("Maître de jeu", {
	color = Color(255, 0, 0, 255),
	model = "models/dpfilms/metropolice/playermodels/pm_badass_police.mdl",	timer=0,
	description = [[Soyez juste dans vos jugements et écouter les 2 camps.]],
weapons = {"itemstore_pickup","weapon_physgun"},
	command = "admin",
	max = 0,
	salary = 99999,
	admin = 1,
	vote = false,
	hasLicense = false,
	candemote = false,
	help = {

	}
})


--[[---------------------------------------------------------------------------
Define which team joining players spawn into and what team you change to if demoted
---------------------------------------------------------------------------]]
GAMEMODE.DefaultTeam = TEAM_CITIZEN


--[[---------------------------------------------------------------------------
Define which teams belong to civil protection
Civil protection can set warrants, make people wanted and do some other police related things
---------------------------------------------------------------------------]]
GAMEMODE.CivilProtection = {
	[TEAM_CHIEF] = true,
	[TEAM_POLICE_GHOST] = true,
	[TEAM_REB_PC] = true,
	[TEAM_POLICEC] = true,
	[TEAM_POLICE_RCT] = true,
	[TEAM_POLICE_05] = true,
	[TEAM_POLICE_04] = true,
	[TEAM_POLICE_03] = true,
	[TEAM_POLICE_02] = true,
	[TEAM_POLICE_01] = true,
	[TEAM_GUNPC] = true,
}

--[[---------------------------------------------------------------------------
Jobs that are hitmen (enables the hitman menu)
---------------------------------------------------------------------------]]
DarkRP.addHitmanTeam(TEAM_MOB)
