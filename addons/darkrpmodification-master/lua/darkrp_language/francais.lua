--[[---------------------------------------------------------------------------
English (example) language file
---------------------------------------------------------------------------

This is the english language file. The things on the left side of the equals sign are the things you should leave alone
The parts between the quotes are the parts you should translate. You can also copy this file and create a new language.

= Warning =
Sometimes when DarkRP is updated, new phrases are added.
If you don't translate these phrases to your language, it will use the English sentence.
To fix this, join your server, open your console and enter darkp_getphrases yourlanguage
For English the command would be:
	darkrp_getphrases "en"
because "en" is the language code for English.

You can copy the missing phrases to this file and translate them.

= Note =
Make sure the language code is right at the bottom of this file

= Using a language =
Make sure the convar gmod_language is set to your language code. You can do that in a server CFG file.
---------------------------------------------------------------------------]]

local my_language = {
	-- Admin things
	need_admin = "Vous avez besoin de droits admins pour faire cela : %s",
	need_sadmin = "Vous avez besoin de droits super-admins pour faire cela : %s",
	no_privilege = "Vous n'avez pas les drois pour faire cela.",
	no_jail_pos = "Aucune prison mis en place",
	invalid_x = "Invalide %s! %s",

	-- F1 menu
	f1ChatCommandTitle = "Commandesu chat d",
	f1Search = "Rechercher...",

	-- Money things:
	price = "Prix: %s%d",
	priceTag = "Prix: %s",
	reset_money = "%s a réinitialisé l'argent de tous le monde!",
	has_given = "%s vous a donné %s",
	you_gave = "Vous avez donné %s %s",
	npc_killpay = "%s pour avoir tué un PNJ!",
	profit = "Gain",
	loss = "Perte",

	-- backwards compatibility
	deducted_x = "Réduit de %s%d",
	need_x = "Besoin de %s%d",

	deducted_money = "Réduit de %s",
	need_money = "Besoin de %s", 

	payday_message = "Jour de paye! Vous recevez %s!",
	payday_unemployed = "Vous ne recevez aucun salaire!",
	payday_missed = "Jour de paye manqué! (Vous êtes en prison)",

	property_tax = "Taxe de propriété! %s",
	property_tax_cant_afford = "Vous n'avez pas pu payé la taxe! Votre propriété vous a été retiré!",
	taxday = "Jour de taxe! %s%% de vos revenus ont été prélevés!",

	found_cheque = "VOus avez trouvé %s%s provenant d'un chèque à votre nom de la part de %s.",
	cheque_details = "Ce chèque a été fait pour %s.",
	cheque_torn = "Vous avez déchiré le chèque.",
	cheque_pay = "Paie: %s",
	signed = "Signé: %s",

	found_cash = "Vous avez trouvé %s%d!", -- backwards compatibility
	found_money = "Vous avez trouvé %s!",

	owner_poor = "Le propriétaire de %s est trop pauvre pour diviser la vente!",

	-- Police
	Wanted_text = "Recherché!",
	wanted = "Recherché par la police!\nRaison: %s",
	youre_arrested = "Vous avez été arrêté pour %d secondes!",
	youre_arrested_by = "Vous avez été arrêté par %s.",
	youre_unarrested_by = "Vous avez été libéré par %s.",
	hes_arrested = "%s a été arrêté %d secondes!",
	hes_unarrested = "%s a été libéré de prison!",
	warrant_ordered = "%s a ordonné un avis de recherche sur %s. Raison: %s",
	warrant_request = "%s a demandé un avis de recherche sur %s\nRaison: %s",
	warrant_request2 = "Avis de recherche envoyé à l'Administrateur %s!",
	warrant_approved = "Avis de recherche approuvé %s!\nRaison: %s\nDemandé par: %s",
	warrant_approved2 = "Vous pouvez désormais fouiller son logement.",
	warrant_denied = "L'Administrateur %s a réfusé votre avis de recherche.",
	warrant_expired = "L'avis de recherche de %s a expiré!",
	warrant_required = "Vous avez besoin d'un avis de recherche pour ouvrir cette porte.",
	warrant_required_unfreeze = "Vous avez besoin d'un avis de recherche pour dé-freeze le prop.",
	warrant_required_unweld = "Vous avez besoin d'un avis de recherche pour désouder ce prop.",
	wanted_by_police = "%s est recherché par la milice!\nRaison: %s\nDemandé par: %s",
	wanted_by_police_print = "%s a rendu %s recherché, Raison: %s",
	wanted_expired = "%s n'est plus recherché pa la milice.",
	wanted_revoked = "%s n'est plus recherché pa la milice.\nRetiré par: %s",
	cant_arrest_other_cp = "Vous ne pouvez pas arrêter d'autres MPF!",
	must_be_wanted_for_arrest = "Le joueur doit être recherché pour pouvoir l'arrêter.",
	cant_arrest_fadmin_jailed = "Vous ne pouvez pas arrêter un joueur jail par un admin.",
	cant_arrest_no_jail_pos = "Vous ne pouvez pas arrêter ce joueur car les prisons n'ont pas été mis en place!",
	cant_arrest_spawning_players = "Vous ne pouvez pas arrêter un joueur en train de spawn.",

	suspect_doesnt_exist = "Suspect n'existe pas.",
	actor_doesnt_exist = "Acteur n'existe pas.",
	get_a_warrant = "avoir un avis de recherche",
	make_someone_wanted = "a rendu quelqu'un recherché",
	remove_wanted_status = "a retiré le status de recherché",
	already_a_warrant = "Il y'a déjà un avis de recherche.",
	already_wanted = "Le suspect est déjà recherché.",
	not_wanted = "Le suspect n'est pas recherché.",
	need_to_be_cp = "Vous devez être un membre de la milice.",
	suspect_must_be_alive_to_do_x = "Le suspect doit être en vie pour pouvoir %s.",
	suspect_already_arrested = "Le suspect est déjà en prison.",

	-- Players
	health = "Santé: %s",
	job = "Faction: %s",
	salary = "Salaire: %s%s",
	wallet = "Argent: %s%s",
	weapon = "Arme: %s",
	kills = "Tués: %s",
	deaths = "Mort: %s",
	rpname_changed = "%s a changé son nom RP en: %s",
	disconnected_player = "Joueur déconnecté",

	-- Teams
	need_to_be_before = "Vous devez d'abord être %s pour pouvoir devenir %s",
	need_to_make_vote = "Vous devez lancer un vote pour devenir %s!",
	team_limit_reached = "Vous ne pouvez pas devenir %s car la limite a été atteinte",
	wants_to_be = "%s\nvoudrais être\n%s",
	has_not_been_made_team = "%s n'est pas devenu %s!",
	job_has_become = "%s est devenu %s!",

	-- Disasters
	meteor_approaching = "WARNING: Meteor storm approaching!",
	meteor_passing = "Meteor storm passing.",
	meteor_enabled = "Meteor Storms are now enabled.",
	meteor_disabled = "Meteor Storms are now disabled.",
	earthquake_report = "Earthquake reported of magnitude %sMw",
	earthtremor_report = "Earth tremor reported of magnitude %sMw",

	-- Keys, vehicles and doors
	keys_allowed_to_coown = "Vous êtes autorisé à avoir un co-propriétaire.(Appuyez sur 'Recharger' ou F2 pour mettre un co-propriétaire)\n",
	keys_other_allowed = "Autorisé co-propriétaire:",
	keys_allow_ownership = "",
	keys_disallow_ownership = "",
	keys_owned_by = "Assigné à:",
	keys_unowned = "Disponible, demandé au QG CWU",
	keys_everyone = "",
	door_unown_arrested = "You can not own or unown things while arrested!",
	door_unownable = "This door cannot be owned or unowned!",
	door_sold = "You have sold this for %s",
	door_already_owned = "This door is already owned by someone!",
	door_cannot_afford = "You can not afford this door!",
	door_hobo_unable = "You can not buy a door if you are a hobo!",
	vehicle_cannot_afford = "You can not afford this vehicle!",
	door_bought = "You've bought this door for %s%s",
	vehicle_bought = "You've bought this vehicle for %s%s",
	door_need_to_own = "You need to own this door in order to be able to %s",
	door_rem_owners_unownable = "You can not remove owners if a door is non-ownable!",
	door_add_owners_unownable = "You can not add owners if a door is non-ownable!",
	rp_addowner_already_owns_door = "%s already owns (or is already allowed to own) this door!",
	add_owner = "Add owner",
	remove_owner = "Remove owner",
	coown_x = "Co-own %s",
	allow_ownership = "Allow ownership",
	disallow_ownership = "Disallow ownership",
	edit_door_group = "Edit door group",
	door_groups = "Door groups",
	door_group_doesnt_exist = "Door group does not exist!",
	door_group_set = "Door group set successfully.",
	sold_x_doors_for_y = "You have sold %d doors for %s%d!", -- backwards compatibility
	sold_x_doors = "You have sold %d doors for %s!",

	-- Entities
	drugs = "Drugs",
	drug_lab = "Drug Lab",
	gun_lab = "Gun Lab",
	gun = "gun",
	microwave = "Micro-onde",
	food = "Food",
	money_printer = "Money Printer",

	sign_this_letter = "Sign this letter",
	signed_yours = "Yours,",

	money_printer_exploded = "Your money printer has exploded!",
	money_printer_overheating = "Your money printer is overheating!",

	contents = "Contient: ",
	amount = "Montant: ",

	picking_lock = "Picking lock",

	cannot_pocket_x = "You cannot put this in your pocket!",
	object_too_heavy = "This object is too heavy.",
	pocket_full = "Your pocket is full!",
	pocket_no_items = "Your pocket contains no items.",
	drop_item = "Drop item",

	bonus_destroying_entity = "destroying this illegal entity.",

	switched_burst = "Switched to burst-fire mode.",
	switched_fully_auto = "Switched to fully automatic fire mode.",
	switched_semi_auto = "Switched to semi-automatic fire mode.",

	keypad_checker_shoot_keypad = "Shoot a keypad to see what it controls.",
	keypad_checker_shoot_entity = "Shoot an entity to see which keypads are connected to it",
	keypad_checker_click_to_clear = "Right click to clear.",
	keypad_checker_entering_right_pass = "Entering the right password",
	keypad_checker_entering_wrong_pass = "Entering the wrong password",
	keypad_checker_after_right_pass = "after having entered the right password",
	keypad_checker_after_wrong_pass = "after having entered the wrong password",
	keypad_checker_right_pass_entered = "Right password entered",
	keypad_checker_wrong_pass_entered = "Wrong password entered",
	keypad_checker_controls_x_entities = "This keypad controls %d entities",
	keypad_checker_controlled_by_x_keypads = "This entity is controlled by %d keypads",
	keypad_on = "ON",
	keypad_off = "OFF",
	seconds = "seconds",

	persons_weapons = "%s's illegal weapons:",
	returned_persons_weapons = "Returned %s's confiscated weapons.",
	no_weapons_confiscated = "%s had no weapons confiscated!",
	no_illegal_weapons = "%s had no illegal weapons.",
	confiscated_these_weapons = "Confiscated these weapons:",
	checking_weapons = "Checking weapons",

	shipment_antispam_wait = "Please wait before spawning another shipment.",
	shipment_cannot_split = "Cannot split this shipment.",

	-- Talking
	hear_noone = "Personne ne peut vous entendre %s!",
	hear_everyone = "Tous le monde peut vous entendre!",
	hear_certain_persons = "Joueurs qui peuvent vous entendre %s: ",

	whisper = "murmurer",
	yell = "crier",
	advert = "[Advert]",
	broadcast = "[Broadcast!]",
	radio = "radio",
	request = "(REQUEST!)",
	group = "(group)",
	demote = "(DEMOTE)",
	ooc = "OOC",
	radio_x = "Radio %d",

	talk = "talk",
	speak = "speak",

	speak_in_ooc = "parler en OOC",
	perform_your_action = "faire votre action",
	talk_to_your_group = "parler en groupe",

	channel_set_to_x = "Canal réglé sur %s!",

	-- Notifies
	disabled = "%s has been disabled! %s",
	gm_spawnvehicle = "The spawning of vehicles",
	gm_spawnsent = "The spawning of scripted entities (SENTs)",
	gm_spawnnpc = "The spawning of Non-Player Characters (NPCs)",
	see_settings = "Please see the DarkRP settings.",
	limit = "You have reached the %s limit!",
	have_to_wait = "You need to wait another %d seconds before using %s!",
	must_be_looking_at = "You need to be looking at a %s!",
	incorrect_job = "You do not have the right job to %s",
	unavailable = "This %s is unavailable",
	unable = "You are unable to %s. %s",
	cant_afford = "You cannot afford this %s",
	created_x = "%s created a %s",
	cleaned_up = "Your %s were cleaned up.",
	you_bought_x = "You have bought %s for %s%d.", -- backwards compatibility
	you_bought = "You have bought %s for %s.",
	you_received_x = "You have received %s for %s.",

	created_first_jailpos = "You have created the first jail position!",
	added_jailpos = "You have added one extra jail position!",
	reset_add_jailpos = "You have removed all jail positions and you have added a new one here.",
	created_spawnpos = "%s's spawn position created.",
	updated_spawnpos = "%s's spawn position updated.",
	do_not_own_ent = "You do not own this entity!",
	cannot_drop_weapon = "Can't drop this weapon!",
	job_switch = "Jobs switched successfully!",
	job_switch_question = "Switch jobs with %s?",
	job_switch_requested = "Job switch requested.",

	cooks_only = "Cooks only.",

	-- Misc
	unknown = "inconnu",
	arguments = "arguments",
	no_one = "no one",
	door = "porte",
	vehicle = "vehicle",
	door_or_vehicle = "door/vehicle",
	driver = "Driver: %s",
	name = "Name: %s",
	locked = "Locked.",
	unlocked = "Unlocked.",
	player_doesnt_exist = "Player does not exist.",
	job_doesnt_exist = "Job does not exist!",
	must_be_alive_to_do_x = "You must be alive in order to %s.",
	banned_or_demoted = "Banned/demoted",
	wait_with_that = "Wait with that.",
	could_not_find = "Could not find %s",
	f3tovote = "Hit F3 to vote",
	listen_up = "Listen up:", -- In rp_tell or rp_tellall
	nlr = "New Life Rule: Do Not Revenge Arrest/Kill.",
	reset_settings = "You have reset all settings!",
	must_be_x = "You must be a %s in order to be able to %s.",
	agenda_updated = "The agenda has been updated",
	job_set = "%s has set his/her job to '%s'",
	demoted = "%s has been demoted",
	demoted_not = "%s has not been demoted",
	demote_vote_started = "%s has started a vote for the demotion of %s",
	demote_vote_text = "Demotion nominee:\n%s", -- '%s' is the Raison here
	cant_demote_self = "You cannot demote yourself.",
	i_want_to_demote_you = "I want to demote you. Raison: %s",
	tried_to_avoid_demotion = "You tried to escape demotion. You failed and have been demoted.", -- naughty boy!
	lockdown_started = "The mayor has initiated a Lockdown, please return to your homes!",
	lockdown_ended = "The lockdown has ended",
	gunlicense_requested = "%s has requested %s a gun license",
	gunlicense_granted = "%s has granted %s a gun license",
	gunlicense_denied = "%s has denied %s a gun license",
	gunlicense_question_text = "Grant %s a gun license?",
	gunlicense_remove_vote_text = "%s has started a vote for the gun license removal of %s",
	gunlicense_remove_vote_text2 = "Revoke gunlicense:\n%s", -- Where %s is the Raison
	gunlicense_removed = "%s's license has been removed!",
	gunlicense_not_removed = "%s's license has not been removed!",
	vote_specify_reason = "You need to specify a Raison!",
	vote_started = "The vote is created",
	vote_alone = "You have won the vote since you are alone in the server.",
	you_cannot_vote = "You cannot vote!",
	x_cancelled_vote = "%s cancelled the last vote.",
	cant_cancel_vote = "Could not cancel the last vote as there was no last vote to cancel!",
	jail_punishment = "Punishment for disconnecting! Jailed for: %d seconds.",
	admin_only = "Admin only!", -- When doing /addjailpos
	chief_or = "Chief or ",-- When doing /addjailpos
	frozen = "Frozen.",

	dead_in_jail = "You now are dead until your jail time is up!",
	died_in_jail = "%s has died in jail!",

	credits_for = "CREDITS FOR %s\n",
	credits_see_console = "DarkRP credits printed to console.",

	rp_getvehicles = "Available vehicles for custom vehicles:",

	data_not_loaded_one = "Your data has not been loaded yet. Please wait.",
	data_not_loaded_two = "If this persists, try rejoining or contacting an admin.",

	cant_spawn_weapons = "You cannot spawn weapons.",
	drive_disabled = "Drive disabled for now.",
	property_disabled = "Property disabled for now.",

	not_allowed_to_purchase = "You are not allowed to purchase this item.",

	rp_teamban_hint = "rp_teamban [player name/ID] [team name/id]. Use this to ban a player from a certain team.",
	rp_teamunban_hint = "rp_teamunban [player name/ID] [team name/id]. Use this to unban a player from a certain team.",
	x_teambanned_y = "%s has banned %s from being a %s.",
	x_teamunbanned_y = "%s has unbanned %s from being a %s.",

	-- Backwards compatibility:
	you_set_x_salary_to_y = "You set %s's salary to %s%d.",
	x_set_your_salary_to_y = "%s set your salary to %s%d.",
	you_set_x_money_to_y = "You set %s's money to %s%d.",
	x_set_your_money_to_y = "%s set your money to %s%d.",

	you_set_x_salary = "You set %s's salary to %s.",
	x_set_your_salary = "%s set your salary to %s.",
	you_set_x_money = "You set %s's money to %s.",
	x_set_your_money = "%s set your money to %s.",
	you_set_x_name = "You set %s's name to %s",
	x_set_your_name = "%s set your name to %s",

	someone_stole_steam_name = "Someone is already using your Steam name as their RP name so we gave you a '1' after your name.", -- Uh oh
	already_taken = "Already taken.",

	job_doesnt_require_vote_currently = "This job does not require a vote at the moment!",

	x_made_you_a_y = "%s has made you a %s!",

	cmd_cant_be_run_server_console = "This command cannot be run from the server console.",

	-- The lottery
	lottery_started = "There is a lottery! Participate for %s%d?", -- backwards compatibility
	lottery_has_started = "There is a lottery! Participate for %s?",
	lottery_entered = "You entered the lottery for %s",
	lottery_not_entered = "%s did not enter the lottery",
	lottery_noone_entered = "No-one has entered the lottery",
	lottery_won = "%s has won the lottery! He has won %s",

	-- Animations
	custom_animation = "Custom animation!",
	bow = "Bow",
	dance = "Dance",
	follow_me = "Follow me!",
	laugh = "Laugh",
	lion_pose = "Lion pose",
	nonverbal_no = "Non-verbal no",
	thumbs_up = "Thumbs up",
	wave = "Wave",

	-- Hungermod
	starving = "Affamé!",

	-- AFK
	afk_mode = "AFK Mode",
	salary_frozen = "Your salary has been frozen.",
	salary_restored = "Welcome back, your salary has now been restored.",
	no_auto_demote = "You will not be auto-demoted.",
	youre_afk_demoted = "You were demoted for being AFK for too long. Next time use /afk.",
	hes_afk_demoted = "%s has been demoted for being AFK for too long.",
	afk_cmd_to_exit = "Type /afk again to exit AFK mode.",
	player_now_afk = "%s is now AFK.",
	player_no_longer_afk = "%s is no longer AFK.",

	-- Hitmenu
	hit = "hit",
	hitman = "Hitman",
	current_hit = "Hit: %s",
	cannot_request_hit = "Cannot request hit! %s",
	hitmenu_request = "Request",
	player_not_hitman = "This player is not a hitman!",
	distance_too_big = "Distance too big.",
	hitman_no_suicide = "The hitman won't kill himself.",
	hitman_no_self_order = "A hitman cannot order a hit for himself.",
	hitman_already_has_hit = "The hitman already has a hit ongoing.",
	price_too_low = "Price too low!",
	hit_target_recently_killed_by_hit = "The target was recently killed by a hit,",
	customer_recently_bought_hit = "The customer has recently requested a hit.",
	accept_hit_question = "Accept hit from %s\nregarding %s for %s%d?", -- backwards compatibility
	accept_hit_request = "Accept hit from %s\nregarding %s for %s?",
	hit_requested = "Hit requested!",
	hit_aborted = "Hit aborted! %s",
	hit_accepted = "Hit accepted!",
	hit_declined = "The hitman declined the hit!",
	hitman_left_server = "The hitman has left the server!",
	customer_left_server = "The customer has left the server!",
	target_left_server = "The target has left the server!",
	hit_price_set_to_x = "Hit price set to %s%d.", -- backwards compatibility
	hit_price_set = "Hit price set to %s.",
	hit_complete = "Hit by %s complete!",
	hitman_died = "The hitman died!",
	target_died = "The target has died!",
	hitman_arrested = "The hitman was arrested!",
	hitman_changed_team = "The hitman changed team!",
	x_had_hit_ordered_by_y = "%s had an active hit ordered by %s",

	-- Vote Restrictions
	hobos_no_rights = "Hobos have no voting rights!",
	gangsters_cant_vote_for_government = "Gangsters cannot vote for government things!",
	government_cant_vote_for_gangsters = "Government officials cannot vote for gangster things!",

	-- VGUI and some more doors/vehicles
	vote = "Vote",
	time = "Time: %d",
	yes = "Oui",
	no = "Non",
	ok = "Okay",
	cancel = "Annuler",
	add = "Ajouter",
	remove = "Retirer",
	none = "Aucun",

	x_options = "%s options",
	sell_x = "Sell %s",
	set_x_title = "Set %s title",
	set_x_title_long = "Set the title of the %s you are looking at.",
	jobs = "Jobs",
	buy_x = "Buy %s",

	-- F4menu
	no_extra_weapons = "This job has no extra weapons.",
	become_job = "Devenir faction",
	create_vote_for_job = "Create vote",
	shipments = "Livraison",
	F4guns = "Weapons",
	F4entities = "Miscellaneous",
	F4ammo = "Ammo",
	F4vehicles = "Vehicles",

	-- Tab 1
	give_money = "Give money to the player you're looking at",
	drop_money = "Drop money",
	change_name = "Change your DarkRP name",
	go_to_sleep = "Go to sleep/wake up",
	drop_weapon = "Drop current weapon",
	buy_health = "Buy health(%s)",
	request_gunlicense = "Request gunlicense",
	demote_player_menu = "Demote a player",


	searchwarrantbutton = "Make a player wanted",
	unwarrantbutton = "Remove the wanted status from a player",
	noone_available = "No one available",
	request_warrant = "Request a search warrant for a player",
	make_wanted = "Make someone wanted",
	make_unwanted = "Make someone unwanted",
	set_jailpos = "Set the jail position",
	add_jailpos = "Add a jail position",

	set_custom_job = "Set a custom job (press enter to activate)",

	set_agenda = "Set the agenda (press enter to activate)",

	initiate_lockdown = "Initiate a lockdown",
	stop_lockdown = "Stop the lockdown",
	start_lottery = "Start a lottery",
	give_license_lookingat = "Give <lookingat> a gun license",

	laws_of_the_land = "LAWS OF THE LAND",
	law_added = "Law added.",
	law_removed = "Law removed.",
	law_reset = "Laws reset.",
	law_too_short = "Law too short.",
	laws_full = "The laws are full.",
	default_law_change_denied = "You are not allowed to change the default laws.",

	-- Second tab
	job_name = "Nom: ",
	job_description = "Description: ",
	job_weapons = "Armes: ",

	-- Entities tab
	buy_a = "Buy %s: %s",

	-- Licenseweaponstab
	license_tab = [[License weapons

	Tick the weapons people should be able to get WITHOUT a license!
	]],
	license_tab_other_weapons = "Autres armes:",

	zombie_spawn_removed = "You have removed this zombie spawn.",
	zombie_spawn = "Zombie Spawn",
	zombie_disabled = "Zombies are now disabled.",
	zombie_enabled = "Zombies are now enabled.",
	zombie_maxset = "Maximum amount of zombies is now set to %s",
	zombie_spawn_added = "You have added a zombie spawn.",
	zombie_spawn_not_exist = "Zombie Spawn %s does not exist.",
	zombie_leaving = "Zombies are leaving.",
	zombie_approaching = "WARNING: Zombies are approaching!",
	zombie_toggled = "Zombies toggled.",
}

-- The language code is usually (but not always) a two-letter code. The default language is "en".
-- Other examples are "nl" (Dutch), "de" (German)
-- If you want to know what your language code is, open GMod, select a language at the bottom right
-- then enter gmod_language in console. It will show you the code.
-- Make sure language code is a valid entry for the convar gmod_language.
DarkRP.addLanguage("fr", my_language)
