local hl
hook.Add( "PreGamemodeLoaded", "darkrp_translation_fr", function()
	hl=GetConVar( "gmod_language" ):GetString()
	
	if hl=="fr" then
		local ListWeapon = list.GetForEdit( "Weapon" )
		local function TranslateWeaponName( class, PrintName )
			local SWEP = weapons.GetStored( class )
			if SWEP then
				SWEP.PrintName = PrintName
				weapons.Register( SWEP, class )
			elseif ListWeapon[class] then
				ListWeapon[class].PrintName = PrintName
			end
		end
		local ListEntity = list.GetForEdit( "SpawnableEntities" )
		local function TranslateEntityName( class, PrintName )
			local ENT = scripted_ents.GetStored( class )
			if ENT then
				ENT = ENT.t
				ENT.PrintName = PrintName
				scripted_ents.Register( ENT, class )
			elseif ListEntity[class] then
				ListEntity[class].PrintName = PrintName
			end
		end
		local ListVehicle = list.GetForEdit( "Vehicles" )
		local function TranslateVehicleName( identifier, PrintName )
			if ListVehicle[identifier] then
				ListVehicle[identifier].Name = PrintName
			end
		end
		-- DarkRP
		TranslateWeaponName( "arrest_stick", "Bâton d'arrestation" )
		TranslateWeaponName( "door_ram", "Bélier" )
		TranslateWeaponName( "keys", "Clés" )
		TranslateWeaponName( "lockpick", "Crochet de serrurier" )
		TranslateWeaponName( "ls_sniper", "Sniper silencieux" )
		TranslateWeaponName( "med_kit", "Équipement médical" )
		TranslateWeaponName( "pocket", "Poche" )
		TranslateWeaponName( "stunstick", "Bâton étourdissant" )
		TranslateWeaponName( "unarrest_stick", "Bâton de libération" )
		TranslateWeaponName( "weapon_keypadchecker", "Contrôleur de Clavier d'Admin" )
		TranslateWeaponName( "weapon_pumpshotgun2", "Fusil à pompe" )
		TranslateWeaponName( "weaponchecker", "Contrôleur d'Armes" )
		-- Sandbox
		TranslateWeaponName( "gmod_tool", "Pistolet d'Outil" )
		TranslateWeaponName( "gmod_camera", "Appareil photo" )
		TranslateWeaponName( "manhack_welder", "Pistolet à Manhacks" )
		TranslateEntityName( "edit_sun", "Éditeur de Soleil" )
		TranslateEntityName( "edit_sky", "Éditeur de Ciel" )
		TranslateEntityName( "edit_fog", "Éditeur de Brouillard" )
		-- Garry's Mod
		TranslateEntityName( "sent_ball", "Boule Rebondissante" )
		TranslateWeaponName( "weapon_physgun", "Pistolet Physique" )
		TranslateWeaponName( "weapon_fists", "Poings" )
		TranslateWeaponName( "weapon_medkit", "Équipement Médical" )
		TranslateWeaponName( "weapon_flechettegun", "Pistolet à Fléchettes" )
		TranslateVehicleName( "Jeep", "Buggy" )
		TranslateVehicleName( "Airboat", "Hydroglisseur" )
		TranslateVehicleName( "Pod", "Capsule" )
		TranslateVehicleName( "Jalopy", "Guimbarde" )
		TranslateVehicleName( "Chair_Wood", "Chaise de Bois" )
		TranslateVehicleName( "Chair_Plastic", "Chaise de Plastique" )
		TranslateVehicleName( "Seat_Jeep", "Siège de Buggy" )
		TranslateVehicleName( "Seat_Airboat", "Siège d'Hydroglisseur" )
		TranslateVehicleName( "Chair_Office1", "Chaise de Bureau" )
		TranslateVehicleName( "Chair_Office2", "Grande Chaise de Bureau" )
		TranslateVehicleName( "Seat_Jalopy", "Siège de Guimbarde" )
		TranslateVehicleName( "phx_seat", "Siège de Voiture" )
		TranslateVehicleName( "phx_seat2", "Siège de Voiture 2" )
		TranslateVehicleName( "phx_seat3", "Siège de Voiture 3" )
		-- Half-Life 2
		TranslateWeaponName( "weapon_357", "Magnum 357" )
		TranslateWeaponName( "weapon_ar2", "Fusil à Impulsion" )
		TranslateWeaponName( "weapon_bugbait", "Phéropode" )
		TranslateWeaponName( "weapon_crossbow", "Arbalète" )
		TranslateWeaponName( "weapon_crowbar", "Pied-de-biche" )
		TranslateWeaponName( "weapon_physcannon", "Pistolet Anti-Gravité" )
		TranslateWeaponName( "weapon_frag", "Grenade à Fragmentation" )
		TranslateWeaponName( "weapon_pistol", "Pistolet 9mm" )
		TranslateWeaponName( "weapon_rpg", "Lance-Roquettes" )
		TranslateWeaponName( "weapon_shotgun", "Fusil à Pompe" )
		TranslateWeaponName( "weapon_slam", "Mine Télécommandée" )
		TranslateWeaponName( "weapon_smg1", "Fusil Mitrailleur" )
		TranslateWeaponName( "weapon_stunstick", "Bâton Étourdissant" )
		TranslateEntityName( "item_ammo_ar2", "Munitions d'Impulsion" )
		TranslateEntityName( "item_ammo_pistol", "Munitions de Pistolet" )
		TranslateEntityName( "item_box_buckshot", "Munitions de Fusil à Pompe" )
		TranslateEntityName( "item_ammo_357", "Munitions 357" )
		TranslateEntityName( "item_ammo_smg1", "Munitions de FM" )
		TranslateEntityName( "item_ammo_ar2_altfire", "Boule de Combine" )
		TranslateEntityName( "item_ammo_crossbow", "Rouleaux d'Arbalète" )
		TranslateEntityName( "item_ammo_smg1_grenade", "Grenade de FM" )
		TranslateEntityName( "item_rpg_round", "Roquette" )
		TranslateEntityName( "item_battery", "Batterie de Combinaison" )
		TranslateEntityName( "item_healthvial", "Fiole de Santé" )
		TranslateEntityName( "item_healthkit", "Équipement de Santé" )
		TranslateEntityName( "item_suitcharger", "Chargeur de Combinaison" )
		TranslateEntityName( "item_healthcharger", "Chargeur de Santé" )
		TranslateEntityName( "item_suit", "Combinaison" )
		TranslateEntityName( "prop_thumper", "Frappeur violent" )
		TranslateEntityName( "combine_mine", "Mine de Combine" )
		TranslateEntityName( "grenade_helicopter", "Grenade d'Hélicoptère" )
		TranslateEntityName( "npc_grenade_frag", "Grenade de Zombine" )
		TranslateEntityName( "weapon_striderbuster", "Magnusson" )
	end
	
	if DarkRP then
		if DarkRP.addLanguage then
			DarkRP.addLanguage( "fr", {
				-- Admin things
				need_admin = "Vous avez besoin des privilèges admin pour pouvoir %s",
				need_sadmin = "Vous avez besoin des privilèges super admin pour pouvoir %s",
				no_privilege = "Vous n'avez pas les bons privilèges pour effectuer cette action",
				no_jail_pos = "Pas de position de prison",
				invalid_x = "%s invalide ! %s",

				-- F1 menu
				f1ChatCommandTitle = "Commandes de chat",
				f1Search = "Recherche...",

				-- Money things:
				price = "Prix : %s%d",
				priceTag = "Prix : %s",
				reset_money = "%s a remis à zéro l'argent de tous les joueurs !",
				has_given = "%s vous a donné %s",
				you_gave = "Vous avez donné %s %s",
				npc_killpay = "%s pour avoir tué un NPC !",
				profit = "bénéfice",
				loss = "perte",

				-- backwards compatibility
				deducted_x = "Déduit %s%d",
				need_x = "Manque %s%d",

				deducted_money = "Déduit %s",
				need_money = "Manque %s",

				payday_message = "Jour de paie ! Vous avez reçu %s !",
				payday_unemployed = "Vous n'avez pas reçu de salaire car vous êtes sans emploi !",
				payday_missed = "Jour de paie manqué ! (Vous êtes arrêté)",

				property_tax = "Taxe de propriété ! %s",
				property_tax_cant_afford = "Vous n'avez pas pu payer les taxes ! Votre propriété a été saisie !",
				taxday = "Jour de taxe ! %s%% de vos revenus ont été prélevés !",

				found_cheque = "Vous avez trouvé %s%s dans un chèque à votre nom signé par %s.",
				cheque_details = "Ce chèque est à l'ordre de %s.",
				cheque_torn = "Vous avez déchiré le chèque.",
				cheque_pay = "Payé : %s",
				signed = "Signé : %s",

				found_cash = "Vous avez trouvé %s%d !", -- backwards compatibility
				found_money = "Vous avez trouvé %s !",

				owner_poor = "Le propriétaire de %s est trop pauvre pour subventionner cette vente !",

				-- Police
				Wanted_text = "Recherché !",
				wanted = "Recherché par la Police !\nMotif : %s",
				youre_arrested = "Vous avez été arrêté pour %d secondes !",
				youre_arrested_by = "Vous avez été arrêté par %s.",
				youre_unarrested_by = "Vous avez été relâché par %s.",
				hes_arrested = "%s a été arrêté pour %d secondes !",
				hes_unarrested = "%s a été libéré de prison !",
				warrant_ordered = "%s a ordonné une perquisition chez %s. Motif : %s",
				warrant_request = "%s a demandé un mandat de perquisition chez %s\nMotif : %s",
				warrant_request2 = "Demande de mandat de perquisition envoyée au Maire %s !",
				warrant_approved = "Mandat de perquisition approuvé pour %s !\nMotif : %s\nOrdonné par : %s",
				warrant_approved2 = "Vous avez maintenant la possibilité de fouiller sa maison.",
				warrant_denied = "Le Maire %s a désapprouvé votre demande de mandat de perquisition.",
				warrant_expired = "Le mandat de perquisition chez %s a expiré !",
				warrant_required = "Vous avez besoin d'un mandat pour avoir le droit d'ouvrir cette porte.",
				warrant_required_unfreeze = "Vous avez besoin d'un mandat pour avoir le droit de dégeler cet objet.",
				warrant_required_unweld = "Vous avez besoin d'un mandat pour avoir le droit de dessouder cet objet.",
				wanted_by_police = "%s est recherché par la police !\nMotif : %s\nOrdonné par : %s",
				wanted_by_police_print = "%s émis un avis de recherche de %s, motif : %s",
				wanted_expired = "%s n'est plus recherché par la Police.",
				wanted_revoked = "%s n'est plus recherché par la Police.\nRévoqué par : %s",
				cant_arrest_other_cp = "Vous ne pouvez pas arrêter d'autres policiers !",
				must_be_wanted_for_arrest = "Le joueur doit être recherché pour que vous puissiez l'arrêter.",
				cant_arrest_fadmin_jailed = "Vous ne pouvez pas arrêter un joueur qui a été emprisonné par un admin.",
				cant_arrest_no_jail_pos = "Vous ne pouvez arrêter personne puisqu'il n'y a pas de positions d'emprisonnement définies !",
				cant_arrest_spawning_players = "Vous ne pouvez pas arrêter des joueurs en train d'apparaître.",
				
				not_warranted = "Il n'y a pas de mandat de perquisition pour cette personne.",
				remove_a_warrant = "retirer un mandat",

				suspect_doesnt_exist = "Suspect n'existe pas.",
				actor_doesnt_exist = "Actor n'existe pas.",
				get_a_warrant = "obtenir un mandat",
				make_someone_wanted = "émettre un avis de recherche",
				remove_wanted_status = "retirer le statut de recherché",
				already_a_warrant = "Il y a déjà un mandat de perquisition chez ce suspect.",
				already_wanted = "Le suspect est déjà recherché.",
				not_wanted = "Le suspect n'est pas recherché.",
				need_to_be_cp = "Vous devez être membre des forces de police.",
				suspect_must_be_alive_to_do_x = "Le suspect doit être vivant pour %s.",
				suspect_already_arrested = "Le suspect est déjà en prison.",

				-- Players
				health = "Santé : %s",
				job = "Métier : %s",
				salary = "Salaire : %s%s",
				wallet = "Portefeuille : %s%s",
				weapon = "Arme : %s",
				kills = "Meurtres : %s",
				deaths = "Décès : %s",
				rpname_changed = "%s a changé son nom RP en : %s",
				disconnected_player = "Joueur déconnecté",

				-- Teams
				need_to_be_before = "Vous devez d'abord être %s pour pouvoir devenir %s",
				need_to_make_vote = "Vous devez faire un vote pour devenir %s !",
				team_limit_reached = "Vous ne pouvez pas devenir %s car la limite est atteinte",
				wants_to_be = "%s\nveut être\n%s",
				has_not_been_made_team = "%s n'est pas devenu %s !",
				job_has_become = "%s est devenu %s !",

				-- Disasters
				meteor_approaching = "AVERTISSEMENT : Tempête de météores en approche !",
				meteor_passing = "Tempête de météores en cours.",
				meteor_enabled = "Les Tempêtes de Météores sont maintenant activées.",
				meteor_disabled = "Les Tempêtes de Météores sont maintenant désactivées",
				earthquake_report = "Tremblement de terre signalé avec une magnitude de %sMw",
				earthtremor_report = "Secousse sismique signalée avec une magnitude de %sMw",

				-- Keys, vehicles and doors
				keys_allowed_to_coown = "Vous êtes autorisé à être codétenteur de ceci\n(Appuyez sur Recharger avec les clés ou appuyez sur F2 pour devenir codétenteur)\n",
				keys_other_allowed = "Autorisés à devenir codétenteurs :",
				keys_allow_ownership = "(Appuyez sur Recharger avec les clés ou appuyez sur F2 pour autoriser la possession)",
				keys_disallow_ownership = "(Appuyez sur Recharger avec les clés ou appuyez sur F2 pour interdire la possession)",
				keys_owned_by = "Détenu par :",
				keys_unowned = "Aucun propriétaire\n(Appuyez sur Recharger avec les clés ou appuyez sur F2 pour acquérir)",
				keys_everyone = "(Appuyez sur Recharger avec les clés ou appuyez sur F2 pour activer pour tout le monde)",
				door_unown_arrested = "Vous ne pouvez pas acquérir ou revendre des choses lorsque vous êtes arrêté !",
				door_unownable = "Cette porte ne peut ni être acquise ni être vendue !",
				door_sold = "Vous avez vendu ceci pour %s",
				door_already_owned = "Cette porte est déjà détenue par quelqu'un !",
				door_cannot_afford = "Vous ne pouvez pas vous payer cette porte !",
				door_hobo_unable = "Vous ne pouvez pas acheter une porte si vous êtes un clochard !",
				vehicle_cannot_afford = "Vous ne pouvez pas vous payer ce véhicule !",
				door_bought = "Vous avez acheté cette porte pour %s%s",
				vehicle_bought = "Vous avez acheté ce véhicule pour %s%s",
				door_need_to_own = "Vous devez détenir cette porte afin de pouvoir %s",
				door_rem_owners_unownable = "Vous ne pouvez pas supprimer des détenteurs si une porte est non-détenable !",
				door_add_owners_unownable = "Vous ne pouvez pas ajouter des détenteurs si une porte est non-détenable !",
				rp_addowner_already_owns_door = "%s possède déjà (ou est autorisé à posséder) cette porte !",
				add_owner = "Ajouter un propriétaire",
				remove_owner = "Supprimer un propriétaire",
				coown_x = "Co-détenir %s",
				allow_ownership = "Autoriser la possession",
				disallow_ownership = "Interdire la possession",
				edit_door_group = "Éditer le groupe de portes",
				door_groups = "Groupe de portes",
				door_group_doesnt_exist = "Le groupe de portes n'existe pas !",
				door_group_set = "Groupe de porte affecté avec succès.",
				sold_x_doors_for_y = "Vous avez vendu %d portes pour %s%d !", -- backwards compatibility
				sold_x_doors = "Vous avez vendu %d portes pour %s !",

				-- Entities
				drugs = "Stupéfiants",
				drug_lab = "Laboratoire de Drogue",
				gun_lab = "Laboratoire de Flingue",
				gun = "pistolet",
				microwave = "Four à micro-ondes",
				food = "Nourriture",
				money_printer = "Imprimante de Billets",

				sign_this_letter = "Signer cette lettre",
				signed_yours = "Cordialement,",

				money_printer_exploded = "Votre imprimante de billets a explosé !",
				money_printer_overheating = "Votre imprimante de billets surchauffe !",

				contents = "Contenu : ",
				amount = "Total : ",

				picking_lock = "Outil de crochetage",

				cannot_pocket_x = "Vous ne pouvez pas mettre ceci dans votre poche !",
				object_too_heavy = "Cet objet est trop gros.",
				pocket_full = "Votre poche est pleine !",
				pocket_no_items = "Votre poche ne contient aucun élément.",
				drop_item = "Laisser tomber l'objet",

				bonus_destroying_entity = "en détruisant cette entité illégale.",

				switched_burst = "Changé en mode rafale.",
				switched_fully_auto = "Changé en mode automatique.",
				switched_semi_auto = "Changé en mode semi-automatique.",

				keypad_checker_shoot_keypad = "Tirez sur un pavé numérique pour voir ce qu'il contrôle.",
				keypad_checker_shoot_entity = "Tirez sur une entité pour voir quels pavés numériques y sont connectés",
				keypad_checker_click_to_clear = "Click droit pour vider.",
				keypad_checker_entering_right_pass = "Entrant le bon mot de passe", -- À REVOIR
				keypad_checker_entering_wrong_pass = "Entrant un mauvais mot de passe", -- À REVOIR
				keypad_checker_after_right_pass = "après avoir entré le bon mot de passe",
				keypad_checker_after_wrong_pass = "après avoir entré un mauvais mot de passe",
				keypad_checker_right_pass_entered = "Bon mot de passe entré",
				keypad_checker_wrong_pass_entered = "Mauvais mot de passe entré",
				keypad_checker_controls_x_entities = "Ce pavé numérique contrôle %d entités",
				keypad_checker_controlled_by_x_keypads = "Cette entité est contrôlée par %d pavés numériques",
				keypad_on = "ON",
				keypad_off = "OFF",
				seconds = "secondes",

				persons_weapons = "Armes illégales de %s :",
				returned_persons_weapons = "Armes confisquées de %s rendues.",
				no_weapons_confiscated = "%s n'avait pas d'armes confisquées !",
				no_illegal_weapons = "%s n'avait pas d'armes illégales.",
				confiscated_these_weapons = "Ces armes ont été confisquées :",
				checking_weapons = "Vérification des armes",

				shipment_antispam_wait = "Attendez SVP avant de faire apparaître une nouvelle cargaison.",
				shipment_cannot_split = "Cette cargaison ne peut pas se scinder.",

				-- Talking
				hear_noone = "Personne ne peut vous entendre %s !",
				hear_everyone = "Tout le monde peut vous entendre !",
				hear_certain_persons = "Joueurs pouvant vous entendre %s : ",

				whisper = "chuchoter",
				yell = "hurler",
				advert = "[Pub]",
				broadcast = "[Diffusion !]",
				radio = "radio",
				request = "(REQUÊTE !)",
				group = "(groupe)",
				demote = "(DEMOTE)", -- NOT TRANSLATED
				ooc = "GLOBAL",
				radio_x = "Radio %d",

				talk = "parler",
				speak = "parler",

				speak_in_ooc = "parler hors RP",
				perform_your_action = "effectuer votre action",
				talk_to_your_group = "parler à votre groupe",

				channel_set_to_x = "Canal réglé sur %s !",

				-- Notifies
				disabled = "%s a été désactivée ! %s",
				gm_spawnvehicle = "L'apparition de véhicules",
				gm_spawnsent = "L'apparition d'entités scriptées (SENT)",
				gm_spawnnpc = "L'apparition de personnages non-joueurs (NPC)",
				see_settings = "Regardez SVP les réglages du DarkRP.",
				limit = "Vous avez atteint la limite de %s !",
				have_to_wait = "Vous devez attendre encore %d secondes avant de pouvoir utiliser %s !",
				must_be_looking_at = "Vous devez regarder un(e) %s !",
				incorrect_job = "Vous n'avez pas le bon métier pour %s",
				unavailable = "Ce %s n'est pas disponible",
				unable = "Vous ne pouvez pas %s. %s",
				cant_afford = "Vous ne pouvez pas vous payer ce/cette %s",
				created_x = "%s a créé un %s",
				cleaned_up = "Vos %s ont été nettoyé(e)s.",
				you_bought_x = "Vous avez acheté %s pour %s%d.", -- backwards compatibility
				you_bought = "Vous avez acheté %s pour %s.",
				you_received_x = "Vous avez reçu %s pour %s.",

				created_first_jailpos = "Vous avez créé le premier emplacement d'emprisonnement !",
				added_jailpos = "Vous avez ajouté un emplacement d'emprisonnement supplémentaire !",
				reset_add_jailpos = "Vous avez supprimé tous les emplacements d'emprisonnement et vous en avez ajouté un ici.",
				created_spawnpos = "Emplacement d'apparition de %s créé.",
				updated_spawnpos = "Emplacement d'apparition de %s mis à jour.",
				do_not_own_ent = "Vous ne possédez pas cette entité !",
				cannot_drop_weapon = "Cette arme ne peut pas être lâchée !",
				job_switch = "Métiers changés avec succès !",
				job_switch_question = "Changer de métier en %s ?",
				job_switch_requested = "Changement de métier demandé.",

				cooks_only = "Cuisiniers seulement.",

				-- Misc
				unknown = "Inconnu",
				arguments = "arguments",
				no_one = "personne",
				door = "porte",
				vehicle = "véhicule",
				door_or_vehicle = "porte/véhicule",
				driver = "Conducteur : %s",
				name = "Nom : %s",
				locked = "Verrouillé.",
				unlocked = "Déverouillé.",
				player_doesnt_exist = "Le joueur n'existe pas.",
				job_doesnt_exist = "Le métier n'existe pas !",
				must_be_alive_to_do_x = "Vous devez être en vie afin de %s.",
				banned_or_demoted = "Banni/rétrogradé",
				wait_with_that = "Attendre avec ça.",
				could_not_find = "N'a pas pu trouver %s",
				f3tovote = "Appuyez sur F3 pour voter",
				listen_up = "Bien écouter :", -- In rp_tell or rp_tellall
				nlr = "Règle de Nouvelle Vie (NLR): Ne Pas Arrêter/Assassiner Par Vengeance.",
				reset_settings = "Vous avez réinitialisé tous les réglages !",
				must_be_x = "Vous devez être %s afin de pouvoir %s.",
				agenda_updated = "L'agenda a été mis à jour",
				job_set = "%s a changé son métier en '%s'",
				demoted = "%s a été rétrogradé",
				demoted_not = "%s n'a pas été rétrogradé",
				demote_vote_started = "%s a lancé un vote pour que %s soit rétrogradé",
				demote_vote_text = "Joueur rétrogradé :\n%s", -- '%s' is the reason here
				cant_demote_self = "Vous ne pouvez pas vous rétrograder vous-même.",
				i_want_to_demote_you = "Je veux te rétrograder. Motif : %s",
				tried_to_avoid_demotion = "Vous avez tenté d'échapper à être rétrogradé. Vous avez échoué et vous avez été rétrogradé.", -- naughty boy!
				lockdown_started = "Le maire a instauré un Couvre-feu, SVP retournez à vos domiciles !",
				lockdown_ended = "Le couvre-feu est terminé",
				gunlicense_requested = "%s a demandé un permis d'armes à feu à %s",
				gunlicense_granted = "%s a accordé un permis d'armes à feu à %s",
				gunlicense_denied = "%s a refusé le permis d'armes à feu à %s",
				gunlicense_question_text = "Accorder à %s un permis d'armes à feu ?",
				gunlicense_remove_vote_text = "%s a lancé un vote pour le retrait du permis d'armes à feu de %s",
				gunlicense_remove_vote_text2 = "Révoquer permis d'armes :\n%s", -- Where %s is the reason
				gunlicense_removed = "Le permis de %s a été supprimé !",
				gunlicense_not_removed = "Le permis de %s n'a pas été supprimé !",
				vote_specify_reason = "Vous devez indiquer un motif !",
				vote_started = "Le vote est créé",
				vote_alone = "Vous avez remporté le vote puisque vous êtes seul sur le serveur.",
				you_cannot_vote = "Vous ne pouvez pas voter !",
				x_cancelled_vote = "%s a annulé le dernier vote.",
				cant_cancel_vote = "Le dernier vote n'a pas pu être annulé puisqu'il n'y avait pas de dernier vote à annuler !",
				jail_punishment = "Sanction pour s'être déconnecté ! Emprisonné pour : %d secondes.",
				admin_only = "Admin seulement !", -- When doing /addjailpos
				chief_or = "Commissaire ou ",-- When doing /addjailpos
				frozen = "Gelé.",

				dead_in_jail = "Vous êtes maintenant mort jusqu'à la fin de votre durée d'emprisonnement !",
				died_in_jail = "%s est mort en prison !",

				credits_for = "CRÉDITS POUR %s\n",
				credits_see_console = "Crédits du DarkRP affichés dans la console.",

				rp_getvehicles = "Véhicules disponibles pour véhicules personnalisés :",

				data_not_loaded_one = "Vos données n'ont pas encore été chargées. Merci de patienter.",
				data_not_loaded_two = "Si cela persiste, essayez de vous reconnecter ou contactez un admin.",

				cant_spawn_weapons = "Vous ne pouvez pas faire apparaître d'armes.",
				drive_disabled = "Conduite désactivée pour le moment.",
				property_disabled = "Propriété désactivée pour le moment.",

				not_allowed_to_purchase = "Vous n'êtes pas autorisé à acheter cet article.",

				rp_teamban_hint = "rp_teamban [nom de joueur/ID] [nom d'équipe/id]. Utilisez ceci pour bannir un joueur d'une certaine équipe.",
				rp_teamunban_hint = "rp_teamunban [nom de joueur/ID] [nom d'équipe/id]. Utilisez ceci pour réadmettre un joueur d'une certaine équipe.",
				x_teambanned_y = "%s a banni %s pour devenir %s.",
				x_teamunbanned_y = "%s a réadmis %s pour devenir %s.",

				-- Backwards compatibility:
				you_set_x_salary_to_y = "Vous avez défini le salaire de %s à %s%d.",
				x_set_your_salary_to_y = "%s a défini votre salaire à %s%d.",
				you_set_x_money_to_y = "Vous avez défini l'argent de %s à %s%d.",
				x_set_your_money_to_y = "%s a défini votre argent à %s%d.",

				you_set_x_salary = "Vous avez défini le salaire de %s à %s.",
				x_set_your_salary = "%s a défini votre salaire à %s.",
				you_set_x_money = "Vous avez défini l'argent de %s à %s.",
				x_set_your_money = "%s a défini votre argent à %s.",
				you_set_x_name = "Vous avez défini le nom de %s à %s",
				x_set_your_name = "%s a défini votre nom à %s",

				someone_stole_steam_name = "Quelqu'un utilise déjà votre nom Steam en tant que nom RP donc nous vous avons donné un \"1\" après votre nom.", -- Uh oh
				already_taken = "Déjà pris.",

				job_doesnt_require_vote_currently = "Ce métier ne requiert pas de vote pour le moment !",

				x_made_you_a_y = "%s vous a changé en %s !",

				cmd_cant_be_run_server_console = "Cette commande ne peut pas être lancée depuis la console du serveur.",

				-- The lottery
				lottery_started = "Il y a une loterie ! Participer pour %s%d ?", -- backwards compatibility
				lottery_has_started = "Il y a une loterie ! Participer pour %s ?",
				lottery_entered = "Vous vous êtes inscrit à la loterie pour %s",
				lottery_not_entered = "%s ne s'est pas inscrit à la loterie",
				lottery_noone_entered = "Personne ne s'est inscrit à la loterie",
				lottery_won = "%s a gagné la loterie ! Il/elle a gagné %s",

				-- Animations
				custom_animation = "Animation personnalisée !",
				bow = "S'incliner",
				dance = "Danser",
				follow_me = "Suivez-moi !",
				laugh = "Rire",
				lion_pose = "Pose du lion",
				nonverbal_no = "Non gestuel",
				thumbs_up = "Signe ok",
				wave = "Faire coucou",

				-- Hungermod
				starving = "Mourant de faim !",

				-- AFK
				afk_mode = "Mode AFK",
				salary_frozen = "Votre salaire a été gelé.",
				salary_restored = "Heureux de vous revoir, votre salaire a été restauré.",
				no_auto_demote = "Vous n'allez pas être auto-rétrogradé.",
				youre_afk_demoted = "Vous allez être rétrogradé pour avoir été AFK trop longtemps. La prochaine fois utilisez /afk.",
				hes_afk_demoted = "%s a été rétrogradé pour avoir été AFK trop longtemps.",
				afk_cmd_to_exit = "Tapez /afk à nouveau pour sortir du mode AFK.",
				player_now_afk = "%s est maintenant AFK.",
				player_no_longer_afk = "%s n'est plus AFK.",

				-- Hitmenu
				hit = "contrat",
				hitman = "Tueur à gages",
				current_hit = "Contrat : %s",
				cannot_request_hit = "Vous ne pouvez pas solliciter un contrat ! %s",
				hitmenu_request = "Requête",
				player_not_hitman = "Ce joueur n'est pas tueur à gages !",
				distance_too_big = "Distance trop grande.",
				hitman_no_suicide = "Le tueur à gages ne va pas se tuer lui-même.",
				hitman_no_self_order = "Un tueur à gages ne peut pas ordonner un contrat pour lui-même.",
				hitman_already_has_hit = "Le tueur à gages a déjà un contrat en cours.",
				price_too_low = "Prix trop bas !",
				hit_target_recently_killed_by_hit = "La cible a été tuée sur contrat récemment,",
				customer_recently_bought_hit = "Le client a récemment demandé un contrat.",
				accept_hit_question = "Accepter le contrat de %s\nà l'encontre de %s pour %s%d ?", -- backwards compatibility
				accept_hit_request = "Accepter le contrat de %s\nà l'encontre de %s pour %s ?",
				hit_requested = "Contrat demandé !",
				hit_aborted = "Contrat abandonné ! %s",
				hit_accepted = "Contrat accepté !",
				hit_declined = "Le tueur à gages a décliné le contrat !",
				hitman_left_server = "Le tueur à gages a quitté le serveur !",
				customer_left_server = "Le client a quitté le serveur !",
				target_left_server = "La cible a quitté le serveur ",
				hit_price_set_to_x = "Prix du contrat fixé à %s%d.", -- backwards compatibility
				hit_price_set = "Prix du contrat fixé à %s.",
				hit_complete = "Contrat par %s accompli !",
				hitman_died = "Le tueur à gages est mort !",
				target_died = "La cible est morte !",
				hitman_arrested = "Le tueur à gages a été arrêté !",
				hitman_changed_team = "Le tueur à gages a changé d'équipe !",
				x_had_hit_ordered_by_y = "%s avait un contrat en cours ordonné par %s",

				-- Vote Restrictions
				hobos_no_rights = "Les clochards n'ont pas le droit de vote !",
				gangsters_cant_vote_for_government = "Les gangsters ne peuvent pas voter pour les choses du gouvernement !",
				government_cant_vote_for_gangsters = "Les officiels du gouvernement ne peuvent pas voter pour les choses des gangsters !",

				-- VGUI and some more doors/vehicles
				vote = "Voter",
				time = "Durée : %d",
				yes = "Oui",
				no = "Non",
				ok = "OK",
				cancel = "Annuler",
				add = "Ajouter",
				remove = "Retirer",
				none = "Aucun",

				x_options = "Options de %s",
				sell_x = "Vendre %s",
				set_x_title = "Définir le titre de %s",
				set_x_title_long = "Définir le titre de la %s que vous regardez.",
				jobs = "Métiers",
				buy_x = "Acheter %s",

				-- F4menu
				no_extra_weapons = "Ce métier n'a pas d'armes additionnelles.",
				become_job = "Opter pour ce métier",
				create_vote_for_job = "Créer un vote",
				shipments = "Cargaisons",
				F4guns = "Armes",
				F4entities = "Divers",
				F4ammo = "Munitions",
				F4vehicles = "Véhicules",

				-- Tab 1
				give_money = "Donner de l'argent au joueur que vous regardez",
				drop_money = "Laisser tomber de l'argent",
				change_name = "Modifier votre nom DarkRP",
				go_to_sleep = "Aller dormir / se réveiller",
				drop_weapon = "Laisser tomber l'arme actuelle",
				buy_health = "Acheter de la santé(%s)",
				request_gunlicense = "Demander un permis d'armes",
				demote_player_menu = "Rétrograder un joueur",


				searchwarrantbutton = "Lancer un avis de recherche d'un joueur",
				unwarrantbutton = "Retirer le statut de recherché d'un joueur",
				noone_available = "Personne disponible",
				request_warrant = "Demander un mandat de perquisition chez un joueur",
				make_wanted = "Lancer un avis de recherche",
				make_unwanted = "Terminer un avis de recherche",
				set_jailpos = "Définir la position d'emprisonnement",
				add_jailpos = "Ajouter une position d'emprisonnement",

				set_custom_job = "Définir un métier personnalisé (appuyez entrée pour activer)",

				set_agenda = "Définir l'agenda (appuyez entrée pour activer)",

				initiate_lockdown = "Démarrer un couvre-feu",
				stop_lockdown = "Arrêter le couvre-feu",
				start_lottery = "Démarrer une loterie",
				give_license_lookingat = "Donner à <lookingat> un permis d'armes",

				laws_of_the_land = "LOIS DU PAYS",
				law_added = "Loi ajoutée.",
				law_removed = "Loi retirée.",
				law_reset = "Lois remises à zéro.",
				law_too_short = "Loi trop courte.",
				laws_full = "Les lois sont pleines.",
				default_law_change_denied = "Vous n'êtes pas autorisé à changer les lois par défaut.",

				-- Second tab
				job_name = "Nom : ",
				job_description = "Description : ",
				job_weapons = "Armes : ",

				-- Entities tab
				buy_a = "Acheter %s : %s",

				-- Licenseweaponstab
				license_tab = [[Armes avec permis

				Cochez les armes que les gens peuvent obtenir SANS permis !
				]],
				license_tab_other_weapons = "Autres armes :",

				zombie_spawn_removed = "Vous avez supprimé ce spawn de zombie.",
				zombie_spawn = "Zombie Spawn",
				zombie_disabled = "Les zombies sont maintenant désactivés.",
				zombie_enabled = "Les zombies sont maintenant activés.",
				zombie_maxset = "Le nombre maximum de zombies est désormais réglé à %s",
				zombie_spawn_added = "Vous avez ajouté un spawn de zombie.",
				zombie_spawn_not_exist = "Le Spawn de Zombie %s n'existe pas.",
				zombie_leaving = "Les zombies partent.",
				zombie_approaching = "AVERTISSEMENT : des Zombies approchent !",
				zombie_toggled = "Zombies activés/désactivés.",
			} )
			
			-- Force reload strings for character animations:
			local loadCustomDarkRPItems = hook.GetTable()["loadCustomDarkRPItems"]
			if loadCustomDarkRPItems then
				local loadAnimations = loadCustomDarkRPItems["loadAnimations"]
				if loadAnimations then
					loadAnimations()
				end
			end
		end
		
		if DarkRP.addChatCommandsLanguage then
			DarkRP.addChatCommandsLanguage( "fr", {
				["/"]                     =	"Discussions globales du serveur.",
				["a"]                     =	"Discussions globales du serveur.",
				["addjailpos"]            =	"Ajouter une position d'emprisonnement là où vous êtes debout.",
				["addlaw"]                =	"Ajouter une loi au tableau des lois.",
				["addowner"]              =	"Inviter quelqu'un à co-détenir la porte que vous regardez.",
				["addspawn"]              =	"Ajouter une position d'apparition pour un certain métier (utiliser le nom de la commande du métier comme argument)",
				["addzombie"]             =	"Ajouter une position d'apparition de zombie.",
				-- ["advert"]             =	"Publier une annonce pour tout le monde sur le serveur.",
				["advert"]                =	"Créer un panneau d'affichage contenant une publicité.",
				["agenda"]                =	"Définir l'agenda.",
				["ao"]                    =	"Inviter quelqu'un à co-détenir la porte que vous regardez.",
				["broadcast"]             =	"Diffuser quelque chose en tant que maire.",
				["buy"]                   =	"Acheter un pistolet",
				["buyammo"]               =	"Acheter des munitions",
				["buydruglab"]            =	"Acheter un laboratoire de drogue",
				["buygunlab"]             =	"Acheter un laboratoire de Flingue",
				["buymoneyprinter"]       =	"Acheter une imprimante de Billets",
				["buyshipment"]           =	"Acheter une fourniture",
				["buyvehicle"]            =	"Acheter un véhicule",
				["channel"]               =	"Régler sur une station de radio.",
				["check"]                 =	"Écrire un chèque pour une personne particulière.",
				["cheque"]                =	"Écrire un chèque pour une personne particulière.",
				["chief"]                 =	"Devenir Commissaire.",
				["citizen"]               =	"Devenir Citoyen.",
				["cp"]                    =	"Devenir Policier et passer le vote.",
				["cr"]                    =	"Pleurer à l'aide, la police viendra (avec un peu de chance) !",
				["credits"]               =	"Envoyer les crédits du DarkRP à quelqu'un.",
				["demote"]                =	"Rétrograder un joueur de son métier",
				["demotelicense"]         =	"Lancer un vote pour que le permis de quelqu'un soit révoqué.",
				["disablestorm"]          =	"Désactiver les tempêtes de météores.",
				["disablezombie"]         =	"Désactiver le zombie mod.",
				["dropmoney"]             =	"Laisser tomber de l'argent au sol.",
				["enablestorm"]           =	"Activer les tempêtes de météores.",
				["enablezombie"]          =	"Activer le zombie mod.",
				["g"]                     =	"Discussions de groupe.",
				["gangster"]              =	"Devenir Gangster.",
				["give"]                  =	"Donner de l'argent au joueur que vous regardez.",
				["givelicense"]           =	"Donner à quelqu'un une licence d'armes",
				["gundealer"]             =	"Devenir Vendeur d'Armes.",
				["hitprice"]              =	"Définir le prix de vos contrats",
				["hobo"]                  =	"Devenir Clochard.",
				["jailpos"]               =	"Réinitialiser les positions d'emprisonnement et en créer une nouvelle à votre position.",
				["job"]                   =	"Modifier le nom de votre métier",
				["jobswitch"]             =	"Échanger les métiers avec le joueur que vous regardez",
				["lockdown"]              =	"Démarrer un couvre-feu. Tout le monde devra rester à l'intérieur",
				["lottery"]               =	"Démarrer une loterie",
				["makeshipment"]          =	"Créer une cargaison à partir d'une arme lâchée.",
				["maxzombie"]             =	"Définir le nombre maximal de zombies qui peuvent être sur un même niveau.",
				["maxzombies"]            =	"Définir le nombre maximal de zombies qui peuvent être sur un même niveau.",
				["mayor"]                 =	"Devenir Maire et passer le vote.",
				["me"]                    =	"Discutez \"jeu de rôle\" en disant que vous faites des choses que vous ne pouvez pas montrer autrement.",
				["medic"]                 =	"Devenir Médecin.",
				["mobboss"]               =	"Devenir chef de la Mafia.",
				["moneydrop"]             =	"Laisser tomber de l'argent au sol.",
				["name"]                  =	"Définir votre nom RP",
				["nick"]                  =	"Définir votre nom RP",
				["ooc"]                   =	"Discussions globales du serveur.",
				["placelaws"]             =	"Placer un tableau des lois.",
				["pm"]                    =	"Envoyer un message privé à quelqu'un.",
				["price"]                 =	"Définir le prix du micro-ondes ou du labo d'armes que vous regardez",
				["radio"]                 =	"Dire quelque chose via la radio.",
				["removelaw"]             =	"Retirer une loi du tableau des lois.",
				["removeletters"]         =	"Retirer toutes vos lettres.",
				["removeowner"]           =	"Retirer un propriétaire de la porte que vous regardez.",
				["removespawn"]           =	"Retirer une position d'apparition pour un certain métier (utiliser le nom de la commande du métier comme argument)",
				["removezombie"]          =	"Retirer une position d'apparition de zombies par id (obtenez l'id avec /showzombie).",
				["requesthit"]            =	"Demander un contrat pour le joueur que vous regardez",
				["requestlicense"]        =	"Demander un permis d'armes à feu.",
				["ro"]                    =	"Retirer un propriétaire de la porte que vous regardez.",
				["rpname"]                =	"Définir votre nom RP",
				["setprice"]              =	"Définir le prix du micro-ondes ou du labo d'armes que vous regardez",
				["setspawn"]              =	"Réinitialiser les positions d'apparition d'un certain métier et en placer une nouvelle à votre position (utiliser le nom de la commande du métier comme argument)",
				["showzombie"]            =	"Montrer les positions d'apparition de zombies.",
				["sleep"]                 =	"Aller dormir ou se réveiller",
				["splitshipment"]         =	"Scinder la cargaison que vous regardez.",
				["switchjob"]             =	"Échanger les métiers avec le joueur que vous regardez",
				["switchjobs"]            =	"Échanger les métiers avec le joueur que vous regardez",
				["teamban"]               =	"Bannir quelqu'un pour opter pour un certain métier",
				["teamunban"]             =	"Défaire un teamban",
				["title"]                 =	"Définir le titre de la porte que vous regardez.",
				["togglegroupownable"]    =	"Définir ce groupe de portes comme achetable.",
				["toggleown"]             =	"Posséder ou ne plus posséder la porte que vous regardez.",
				["toggleownable"]         =	"Activer / désactiver la possibilité de détenir cette porte.",
				["toggleteamownable"]     =	"Activer / désactiver la possibilité de détenir cette porte par une équipe donnée.",
				["type"]                  =	"Taper une lettre.",
				["unlockdown"]            =	"Mettre fin à un couvre-feu",
				["unownalldoors"]         =	"Vendre toutes vos portes.",
				["unwanted"]              =	"Retirer l'avis de recherche d'un joueur.",
				["votecp"]                =	"Voter pour devenir Policier.",
				["votemayor"]             =	"Voter pour devenir Maire.",
				["w"]                     =	"Dire quelque chose en chuchotant.",
				["wake"]                  =	"Aller dormir ou se réveiller",
				["wakeup"]                =	"Aller dormir ou se réveiller",
				["wanted"]                =	"Lancer un avis de recherche d'un joueur. Ceci est nécessaire pour l'arrêter.",
				["warrant"]               =	"Obtenir un mandat de perquisition chez un certain joueur. Avec ce mandat vous pouvez fouiller sa maison",
				["write"]                 =	"Écrire une lettre.",
				["y"]                     =	"Hurler quelque chose tout haut.",
				["zombiemax"]             =	"Définir le nombre maximal de zombies qui peuvent être sur un même niveau.",

				-- Add new chat command translations under this line:
				["000"]                   =	"Pleurer à l'aide, la police viendra (avec un peu de chance) !",
				["112"]                   =	"Pleurer à l'aide, la police viendra (avec un peu de chance) !",
				["911"]                   =	"Pleurer à l'aide, la police viendra (avec un peu de chance) !",
				["999"]                   =	"Pleurer à l'aide, la police viendra (avec un peu de chance) !",
				["addagenda"]             =	"Ajouter une ligne de texte à l'agenda.",
				["addmoney"]              =	"Ajouter de l'argent au portefeuille d'un joueur.",
				["admintell"]             =	"Envoyer un message privé très intimidant à quelqu'un.",
				["admintellall"]          =	"Envoyer un message très intimidant à tout le monde.",
				["arrest"]                =	"Arrêter énergiquement un joueur.",
				["buyfood"]               =	"Acheter de la nourriture.",
				["buymicrowave"]          =	"Acheter un four à micro-ondes",
				["cook"]                  =	"Devenir Cuisinier.",
				["forcecancelvote"]       =	"Annuler énergiquement un vote.",
				["forcelock"]             =	"Forcer la porte que vous regardez à être verrouillée. Ceci est enregistré.",
				["forceown"]              =	"Mettre énergiquement quelqu'un en propriétaire de la porte que vous regardez.",
				["forceremoveowner"]      =	"Retirer énergiquement un propriétaire de la porte que vous regardez.",
				["forcerpname"]           =	"Modifier énergiquement le nom RP d'un joueur",
				["forceunlock"]           =	"Forcer la porte que vous regardez à être déverrouillée. Ceci est enregistré.",
				["forceunown"]            =	"Retirer énergiquement tous les propriétaires de la porte que vous regardez.",
				["forceunownall"]         =	"Forcer un joueur à ne plus être propriétaire des portes et véhicules qu'il a.",
				["freerpname"]            =	"Retirer un nom RP de la base de données de sorte qu'un joueur puisse l'utiliser",
				["resetlaws"]             =	"Remettre à zéro toutes les lois.",
				["sellalldoors"]          =	"Vendre toutes vos portes.",
				["setjailpos"]            =	"Réinitialiser les positions d'emprisonnement et en créer une nouvelle à votre position.",
				["setlicense"]            =	"Donner énergiquement à un jour un permis.",
				["setmoney"]              =	"Définir la valeur du portefeuille d'un joueur.",
				["unarrest"]              =	"Arrêter énergiquement un joueur.",
				["unsetlicense"]          =	"Révoquer énergiquement le permis d'un joueur.",
				["unwarrant"]             =	"Retirer un mandat de perquisition pour un joueur donné. Avec un mandat vous pouvez fouiller sa maison.",
			} )
		end
	end
end )

hook.Add( "InitPostEntity", "darkrp_translation_fr", function()
	if DarkRP then
		if hl=="fr" and DarkRP.getChatCommands and DarkRP.getChatCommandDescription and DarkRP.addChatCommandsLanguage then
			local translated
			local len
			for command,tbl in pairs( DarkRP.getChatCommands() ) do
				translated = DarkRP.getChatCommandDescription( command )
				if tbl.description and ( not translated or tbl.description==translated ) then
					if string.sub( tbl.description, 1, 7 )=="Become " then
						len = string.len( tbl.description )
						if string.sub( tbl.description, len-18, len )~=" and skip the vote." then
							translated = "Devenir "..string.sub( tbl.description, 8 )
						else
							translated = "Devenir "..string.sub( tbl.description, 8, len-19 ).." et passer le vote."
						end
						DarkRP.addChatCommandsLanguage( "fr", {[command]=translated} )
					elseif string.sub( tbl.description, 1, 15 )=="Vote to become " then
						translated = "Voter pour devenir "..string.sub( tbl.description, 16 )
						DarkRP.addChatCommandsLanguage( "fr", {[command]=translated} )
					end
				end
			end
		end
	end
end )