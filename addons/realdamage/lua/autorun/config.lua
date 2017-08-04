if SERVER then
	//Damage Scaling
	HeadShotDamageMultiplier = 1.5		//Damage multplied when shot in the head.

	LeftArmDamageMultiplier = 0.5 		//Damage multplied when shot in the left arm.
	RightArmDamageMultiplier = 0.5 		//Damage multplied when shot in the right arm.
	
	LeftLegDamageMultiplier = 0.5		//Damage multplied when shot in the left leg.
	RightLegDamageMultiplier = 0.5		//Damage multplied when shot in the right leg.
	
	ChestDamageMultiplier = 1			//Damage multplied when shot in the chest.
	StomachDamageMultiplier = 1			//Damage multplied when shot in the stomach.
	ThighDamageMultiplier = 1			//Damage multplied when shot in the chest.
	
	FallDamageDivisor = 25				//Fall damage is the player's velocity divided by this. The higher the number, the less fall damage the player takes.
	RollingDamageDivisor = 50			//Fall damage when rolling is the player's velocity divided by this. The higher the number, the less fall damage the player takes.
	
	AllowRolling = true					//true to enable rolling. false to disable rolling.

	AllowLimping = true					//true to enable limping. false to disable limping.
	
	DefaultWalkSpeed = 100				//Leave this alone unless the gamemode has a custom walk speed.
	DefaultRunSpeed = 180				//Leave this alone unless the gamemode has a custom run speed.
	DefaultJumpHeight = 200				//Leave this alone unless the gamemode has a custom jump height.
	
	LeftLegLimpingChance = 10			//Chance out of 100 that the player will limp when shot in the left leg.
	RightLegLimpingChance = 10			//Chance out of 100 that the player will limp when shot in the right leg.
	FallLimpingChance = 10				//Chance out of 100 that the player will limp when they take fall damage.
	RollingLimpingChance = 0			//Chance out of 100 that the player will limp when they roll.
	
	LimpWalkSpeedMultiplier = 0.5		//How much the player will slow down while walking when limping. 1 means they won't slow down.
	LimpRunSpeedMultiplier = 0.5		//How much the player will slow down while running when limping. 1 means they won't slow down.
	LimpJumpHeightMultiplier = 0.75		//How high the player will jump when limping. 1 means they will jump at normal height.
	
	AllowWeaponDrop = true				//true to enable weapon dropping. false to disable weapon dropping.
	
	LeftArmWeaponDropChance = 10		//Chance out of 100 that the player will drop the weapon they are holding when shot in the left arm.
	RightArmWeaponDropChance = 10		//Chance out of 100 that the player will drop the weapon they are holding when shot in the right arm.
	
	RestrictedWeapons = {				//These weapons won't drop.
		"weapon_physgun",
		"weapon_physcannon",
		"weapon_fists",
		"gmod_camera",
		"gmod_tool",
		
		"pocket",
		"keys",
		
		"weapon_zm_carry",
		"weapon_ttt_unarmed",
		"arrest_stick",
		"unarrest_stick",
		"stunstick",
		"weaponchecker",
		"alyx_emptool",
		"itemstore_pickup",
		"hands",
	}
	
	//Drowning
	
	BreathTime = 10 					//How long in seconds until the player will start taking damage.
	DrownInterval = 1						//Seconds between each time the player is damaged.
	DrownDamage = 10					//Damage done by drowning.
	
	//Sounds
	HurtSoundVolume = 100					//Volume of the hurt sounds. 0 to disable sounds.
	RollSoundVolume = 100					//Volume of the hurt sounds. 0 to disable sounds.
	
	--Male
	MaleHeadShotSounds = {
		"npc/male/moan01.wav",
		"npc/male/moan02.wav",	
		"npc/male/moan03.wav",
		"npc/male/moan04.wav",
		"npc/male/moan05.wav",
		"npc/male/moan02.wav",
		
		"npc/male/pain01.wav",
		"npc/male/pain02.wav",
		"npc/male/pain03.wav",
		"npc/male/pain04.wav",
		"npc/male/pain05.wav",
		"npc/male/pain06.wav",
		"npc/male/pain07.wav",
		"npc/male/pain08.wav",
		"npc/male/pain09.wav",
	}
	
	MaleLeftArmSounds = {
		"npc/male/myarm01.wav",
		"npc/male/myarm02.wav",
	}
	
	MaleRightArmSounds = {
		"npc/male/myarm01.wav",
		"npc/male/myarm02.wav",
	}
	
	MaleLeftLegSounds = {
		"npc/male/myleg01.wav",
		"npc/male/myleg02.wav",
	}
	
	MaleRightLegSounds = {
		"npc/male/myleg01.wav",
		"npc/male/myleg02.wav",
	}
	
	MaleChestSounds = {
		"npc/male/moan01.wav",
		"npc/male/moan02.wav",	
		"npc/male/moan03.wav",
		"npc/male/moan04.wav",
		"npc/male/moan05.wav",
		"npc/male/moan02.wav",
		
		"npc/male/pain01.wav",
		"npc/male/pain02.wav",
		"npc/male/pain03.wav",
		"npc/male/pain04.wav",
		"npc/male/pain05.wav",
		"npc/male/pain06.wav",
		"npc/male/pain07.wav",
		"npc/male/pain08.wav",
		"npc/male/pain09.wav",
		
		"npc/male/hitingut01.wav",
		"npc/male/hitingut02.wav",
		
		"npc/male/imhurt01.wav",
		"npc/male/imhurt02.wav",
		
		"npc/male/mygut02.wav",
	}
	
	MaleStomachSounds = {
		"npc/male/hitingut01.wav",
		"npc/male/hitingut02.wav",
		
		"npc/male/imhurt01.wav",
		"npc/male/imhurt02.wav",
		
		"npc/male/mygut02.wav",
	}
	
	MaleThighSounds = {
		"npc/male/moan01.wav",
		"npc/male/moan02.wav",	
		"npc/male/moan03.wav",
		"npc/male/moan04.wav",
		"npc/male/moan05.wav",
		"npc/male/moan02.wav",
		
		"npc/male/pain01.wav",
		"npc/male/pain02.wav",
		"npc/male/pain03.wav",
		"npc/male/pain04.wav",
		"npc/male/pain05.wav",
		"npc/male/pain06.wav",
		"npc/male/pain07.wav",
		"npc/male/pain08.wav",
		"npc/male/pain09.wav",
		
		"npc/male/hitingut01.wav",
		"npc/male/hitingut02.wav",
		
		"npc/male/imhurt01.wav",
		"npc/male/imhurt02.wav",
		
		"npc/male/mygut02.wav",
	}
	
	--Female
	FemaleHeadShotSounds = {
		"npc/female/moan01.wav",
		"npc/female/moan02.wav",	
		"npc/female/moan03.wav",
		"npc/female/moan04.wav",
		"npc/female/moan05.wav",
		"npc/female/moan02.wav",
		
		"npc/female/pain01.wav",
		"npc/female/pain02.wav",
		"npc/female/pain03.wav",
		"npc/female/pain04.wav",
		"npc/female/pain05.wav",
		"npc/female/pain06.wav",
		"npc/female/pain07.wav",
		"npc/female/pain08.wav",
		"npc/female/pain09.wav",
	}
	
	FemaleLeftArmSounds = {
		"npc/female/myarm01.wav",
		"npc/female/myarm02.wav",
	}
	
	FemaleRightArmSounds = {
		"npc/female/myarm01.wav",
		"npc/female/myarm02.wav",
	}
	
	FemaleLeftLegSounds = {
		"npc/female/myleg01.wav",
		"npc/female/myleg02.wav",
	}
	
	FemaleRightLegSounds = {
		"npc/female/myleg01.wav",
		"npc/female/myleg02.wav",
	}
	
	FemaleChestSounds = {
		"npc/female/moan01.wav",
		"npc/female/moan02.wav",	
		"npc/female/moan03.wav",
		"npc/female/moan04.wav",
		"npc/female/moan05.wav",
		"npc/female/moan02.wav",
		
		"npc/female/pain01.wav",
		"npc/female/pain02.wav",
		"npc/female/pain03.wav",
		"npc/female/pain04.wav",
		"npc/female/pain05.wav",
		"npc/female/pain06.wav",
		"npc/female/pain07.wav",
		"npc/female/pain08.wav",
		"npc/female/pain09.wav",
		
		"npc/female/hitingut01.wav",
		"npc/female/hitingut02.wav",
		
		"npc/female/imhurt01.wav",
		"npc/female/imhurt02.wav",
		
		"npc/female/mygut02.wav",
	}
	
	FemaleStomachSounds = {
		"npc/female/hitingut01.wav",
		"npc/female/hitingut02.wav",
		
		"npc/female/imhurt01.wav",
		"npc/female/imhurt02.wav",
		
		"npc/female/mygut02.wav",
	}
	
	FemaleThighSounds = {
		"npc/female/moan01.wav",
		"npc/female/moan02.wav",	
		"npc/female/moan03.wav",
		"npc/female/moan04.wav",
		"npc/female/moan05.wav",
		"npc/female/moan02.wav",
		
		"npc/female/pain01.wav",
		"npc/female/pain02.wav",
		"npc/female/pain03.wav",
		"npc/female/pain04.wav",
		"npc/female/pain05.wav",
		"npc/female/pain06.wav",
		"npc/female/pain07.wav",
		"npc/female/pain08.wav",
		"npc/female/pain09.wav",
		
		"npc/female/hitingut01.wav",
		"npc/female/hitingut02.wav",
		
		"npc/female/imhurt01.wav",
		"npc/female/imhurt02.wav",
		
		"npc/female/mygut02.wav",
	}
	
	--Combine
	CombineHeadShotSounds = {

		"npc/combine_soldier/pain1.wav",
		"npc/combine_soldier/pain2.wav",
		"npc/combine_soldier/pain3.wav",
		

		
		"npc/metropolice/knockout2.wav",
		
		"npc/metropolice/pain1.wav",
		"npc/metropolice/pain2.wav",
		"npc/metropolice/pain3.wav",
		"npc/metropolice/pain4.wav",
	}
	
	CombineLeftArmSounds = {
		"npc/combine_soldier/die1.wav",
		"npc/combine_soldier/die2.wav",	
		"npc/combine_soldier/die3.wav",
		
		"npc/combine_soldier/pain1.wav",
		"npc/combine_soldier/pain2.wav",
		"npc/combine_soldier/pain3.wav",
		
		"npc/metropolice/knockout2.wav",
		
		"npc/metropolice/pain1.wav",
		"npc/metropolice/pain2.wav",
		"npc/metropolice/pain3.wav",
		"npc/metropolice/pain4.wav",
	}
	
	CombineRightArmSounds = {
		"npc/combine_soldier/die1.wav",
		"npc/combine_soldier/die2.wav",	
		"npc/combine_soldier/die3.wav",
		
		"npc/combine_soldier/pain1.wav",
		"npc/combine_soldier/pain2.wav",
		"npc/combine_soldier/pain3.wav",
		
		"npc/metropolice/knockout2.wav",
		
		"npc/metropolice/pain1.wav",
		"npc/metropolice/pain2.wav",
		"npc/metropolice/pain3.wav",
		"npc/metropolice/pain4.wav",
	}
	
	CombineLeftLegSounds = {
		"npc/combine_soldier/die1.wav",
		"npc/combine_soldier/die2.wav",	
		"npc/combine_soldier/die3.wav",
		
		"npc/combine_soldier/pain1.wav",
		"npc/combine_soldier/pain2.wav",
		"npc/combine_soldier/pain3.wav",
		
		"npc/metropolice/knockout2.wav",
		
		"npc/metropolice/pain1.wav",
		"npc/metropolice/pain2.wav",
		"npc/metropolice/pain3.wav",
		"npc/metropolice/pain4.wav",
	}
	
	CombineRightLegSounds = {
		"npc/combine_soldier/die1.wav",
		"npc/combine_soldier/die2.wav",	
		"npc/combine_soldier/die3.wav",
		
		"npc/combine_soldier/pain1.wav",
		"npc/combine_soldier/pain2.wav",
		"npc/combine_soldier/pain3.wav",
		
		"npc/metropolice/knockout2.wav",
		
		"npc/metropolice/pain1.wav",
		"npc/metropolice/pain2.wav",
		"npc/metropolice/pain3.wav",
		"npc/metropolice/pain4.wav",
	}
	
	CombineChestSounds = {
		"npc/combine_soldier/die1.wav",
		"npc/combine_soldier/die2.wav",	
		"npc/combine_soldier/die3.wav",
		
		"npc/combine_soldier/pain1.wav",
		"npc/combine_soldier/pain2.wav",
		"npc/combine_soldier/pain3.wav",
		
		"npc/metropolice/knockout2.wav",
		
		"npc/metropolice/pain1.wav",
		"npc/metropolice/pain2.wav",
		"npc/metropolice/pain3.wav",
		"npc/metropolice/pain4.wav",
	}
	
	CombineStomachSounds = {
		"npc/combine_soldier/die1.wav",
		"npc/combine_soldier/die2.wav",	
		"npc/combine_soldier/die3.wav",
		
		"npc/combine_soldier/pain1.wav",
		"npc/combine_soldier/pain2.wav",
		"npc/combine_soldier/pain3.wav",
		
		"npc/metropolice/knockout2.wav",
		
		"npc/metropolice/pain1.wav",
		"npc/metropolice/pain2.wav",
		"npc/metropolice/pain3.wav",
		"npc/metropolice/pain4.wav",
	}
	
	CombineThighSounds = {
		"npc/combine_soldier/die1.wav",
		"npc/combine_soldier/die2.wav",	
		"npc/combine_soldier/die3.wav",
		
		"npc/combine_soldier/pain1.wav",
		"npc/combine_soldier/pain2.wav",
		"npc/combine_soldier/pain3.wav",
		
		"npc/metropolice/knockout2.wav",
		
		"npc/metropolice/pain1.wav",
		"npc/metropolice/pain2.wav",
		"npc/metropolice/pain3.wav",
		"npc/metropolice/pain4.wav",
	}
	
	--Alyx
	AlyxHeadShotSounds = {
		"npc/Alyx/gasp02.wav",
		"npc/Alyx/gasp03.wav",
		
		"npc/Alyx/hurt04.wav",
		"npc/Alyx/hurt05.wav",
		"npc/Alyx/hurt06.wav",
		"npc/Alyx/hurt08.wav",
		
		"npc/Alyx/uggh01.wav",
		"npc/Alyx/uggh02.wav",
	}
	
	AlyxLeftArmSounds = {
		"npc/Alyx/ohno_startle01.wav",
		"npc/Alyx/ohno_startle03.wav",
	}
	
	AlyxRightArmSounds = {
		"npc/Alyx/ohno_startle01.wav",
		"npc/Alyx/ohno_startle03.wav",
	}
	
	AlyxLeftLegSounds = {
		"npc/Alyx/ohno_startle01.wav",
		"npc/Alyx/ohno_startle03.wav",
	}
	
	AlyxRightLegSounds = {
		"npc/Alyx/ohno_startle01.wav",
		"npc/Alyx/ohno_startle03.wav",
	}
	
	AlyxChestSounds = {
		"npc/Alyx/gasp02.wav",
		"npc/Alyx/gasp03.wav",
		
		"npc/Alyx/hurt04.wav",
		"npc/Alyx/hurt05.wav",
		"npc/Alyx/hurt06.wav",
		"npc/Alyx/hurt08.wav",
		
		"npc/Alyx/uggh01.wav",
		"npc/Alyx/uggh02.wav",
	}
	
	AlyxStomachSounds = {
		"npc/Alyx/gasp02.wav",
		"npc/Alyx/gasp03.wav",
		
		"npc/Alyx/hurt04.wav",
		"npc/Alyx/hurt05.wav",
		"npc/Alyx/hurt06.wav",
		"npc/Alyx/hurt08.wav",
		
		"npc/Alyx/uggh01.wav",
		"npc/Alyx/uggh02.wav",
	}
	
	AlyxThighSounds = {
		"npc/Alyx/gasp02.wav",
		"npc/Alyx/gasp03.wav",
		
		"npc/Alyx/hurt04.wav",
		"npc/Alyx/hurt05.wav",
		"npc/Alyx/hurt06.wav",
		"npc/Alyx/hurt08.wav",
		
		"npc/Alyx/uggh01.wav",
		"npc/Alyx/uggh02.wav",
	}
	
	--Zombie
	ZombieHeadShotSounds = {
		"npc/fast_zombie/fz_alert_close1.wav",
		"npc/fast_zombie/fz_alert_far1.wav",
		"npc/fast_zombie/fz_frenzy1.wav",
		"npc/fast_zombie/fz_scream1.wav",

		"npc/fast_zombie/leap1.wav",
		
		"npc/fast_zombie/wake1.wav",
		
		"npc/zombie/zombie_alert1.wav",
		"npc/zombie/zombie_alert2.wav",
		"npc/zombie/zombie_alert3.wav",
		
		"npc/zombie/zombie_die1.wav",
		"npc/zombie/zombie_die2.wav",
		"npc/zombie/zombie_die3.wav",
		
		"npc/zombie/zombie_pain1.wav",
		"npc/zombie/zombie_pain2.wav",
		"npc/zombie/zombie_pain3.wav",
		"npc/zombie/zombie_pain4.wav",
		"npc/zombie/zombie_pain5.wav",
		"npc/zombie/zombie_pain6.wav",
		
		"npc/zombie_poison/pz_alert1.wav",
		"npc/zombie_poison/pz_alert2.wav",
		
		"npc/zombie_poison/pz_call1.wav",
		
		"npc/zombie_poison/pz_die1.wav",
		"npc/zombie_poison/pz_die2.wav",
		
		"npc/zombie_poison/pz_pain1.wav",
		"npc/zombie_poison/pz_pain2.wav",
		"npc/zombie_poison/pz_pain3.wav",
		
		"npc/zombie_poison/pz_warn1.wav",
		"npc/zombie_poison/pz_warn2.wav",
	}
	
	ZombieLeftArmSounds = {
		"npc/fast_zombie/fz_alert_close1.wav",
		"npc/fast_zombie/fz_alert_far1.wav",
		"npc/fast_zombie/fz_frenzy1.wav",
		"npc/fast_zombie/fz_scream1.wav",

		"npc/fast_zombie/leap1.wav",
		
		"npc/fast_zombie/wake1.wav",
		
		"npc/zombie/zombie_alert1.wav",
		"npc/zombie/zombie_alert2.wav",
		"npc/zombie/zombie_alert3.wav",
		
		"npc/zombie/zombie_die1.wav",
		"npc/zombie/zombie_die2.wav",
		"npc/zombie/zombie_die3.wav",
		
		"npc/zombie/zombie_pain1.wav",
		"npc/zombie/zombie_pain2.wav",
		"npc/zombie/zombie_pain3.wav",
		"npc/zombie/zombie_pain4.wav",
		"npc/zombie/zombie_pain5.wav",
		"npc/zombie/zombie_pain6.wav",
		
		"npc/zombie_poison/pz_alert1.wav",
		"npc/zombie_poison/pz_alert2.wav",
		
		"npc/zombie_poison/pz_call1.wav",
		
		"npc/zombie_poison/pz_die1.wav",
		"npc/zombie_poison/pz_die2.wav",
		
		"npc/zombie_poison/pz_pain1.wav",
		"npc/zombie_poison/pz_pain2.wav",
		"npc/zombie_poison/pz_pain3.wav",
		
		"npc/zombie_poison/pz_warn1.wav",
		"npc/zombie_poison/pz_warn2.wav",
	}
	
	ZombieRightArmSounds = {
		"npc/fast_zombie/fz_alert_close1.wav",
		"npc/fast_zombie/fz_alert_far1.wav",
		"npc/fast_zombie/fz_frenzy1.wav",
		"npc/fast_zombie/fz_scream1.wav",

		"npc/fast_zombie/leap1.wav",
		
		"npc/fast_zombie/wake1.wav",
		
		"npc/zombie/zombie_alert1.wav",
		"npc/zombie/zombie_alert2.wav",
		"npc/zombie/zombie_alert3.wav",
		
		"npc/zombie/zombie_die1.wav",
		"npc/zombie/zombie_die2.wav",
		"npc/zombie/zombie_die3.wav",
		
		"npc/zombie/zombie_pain1.wav",
		"npc/zombie/zombie_pain2.wav",
		"npc/zombie/zombie_pain3.wav",
		"npc/zombie/zombie_pain4.wav",
		"npc/zombie/zombie_pain5.wav",
		"npc/zombie/zombie_pain6.wav",
		
		"npc/zombie_poison/pz_alert1.wav",
		"npc/zombie_poison/pz_alert2.wav",
		
		"npc/zombie_poison/pz_call1.wav",
		
		"npc/zombie_poison/pz_die1.wav",
		"npc/zombie_poison/pz_die2.wav",
		
		"npc/zombie_poison/pz_pain1.wav",
		"npc/zombie_poison/pz_pain2.wav",
		"npc/zombie_poison/pz_pain3.wav",
		
		"npc/zombie_poison/pz_warn1.wav",
		"npc/zombie_poison/pz_warn2.wav",
	}
	
	ZombieLeftLegSounds = {
		"npc/fast_zombie/fz_alert_close1.wav",
		"npc/fast_zombie/fz_alert_far1.wav",
		"npc/fast_zombie/fz_frenzy1.wav",
		"npc/fast_zombie/fz_scream1.wav",

		"npc/fast_zombie/leap1.wav",
		
		"npc/fast_zombie/wake1.wav",
		
		"npc/zombie/zombie_alert1.wav",
		"npc/zombie/zombie_alert2.wav",
		"npc/zombie/zombie_alert3.wav",
		
		"npc/zombie/zombie_die1.wav",
		"npc/zombie/zombie_die2.wav",
		"npc/zombie/zombie_die3.wav",
		
		"npc/zombie/zombie_pain1.wav",
		"npc/zombie/zombie_pain2.wav",
		"npc/zombie/zombie_pain3.wav",
		"npc/zombie/zombie_pain4.wav",
		"npc/zombie/zombie_pain5.wav",
		"npc/zombie/zombie_pain6.wav",
		
		"npc/zombie_poison/pz_alert1.wav",
		"npc/zombie_poison/pz_alert2.wav",
		
		"npc/zombie_poison/pz_call1.wav",
		
		"npc/zombie_poison/pz_die1.wav",
		"npc/zombie_poison/pz_die2.wav",
		
		"npc/zombie_poison/pz_pain1.wav",
		"npc/zombie_poison/pz_pain2.wav",
		"npc/zombie_poison/pz_pain3.wav",
		
		"npc/zombie_poison/pz_warn1.wav",
		"npc/zombie_poison/pz_warn2.wav",
	}
	
	ZombieRightLegSounds = {
		"npc/fast_zombie/fz_alert_close1.wav",
		"npc/fast_zombie/fz_alert_far1.wav",
		"npc/fast_zombie/fz_frenzy1.wav",
		"npc/fast_zombie/fz_scream1.wav",

		"npc/fast_zombie/leap1.wav",
		
		"npc/fast_zombie/wake1.wav",
		
		"npc/zombie/zombie_alert1.wav",
		"npc/zombie/zombie_alert2.wav",
		"npc/zombie/zombie_alert3.wav",
		
		"npc/zombie/zombie_die1.wav",
		"npc/zombie/zombie_die2.wav",
		"npc/zombie/zombie_die3.wav",
		
		"npc/zombie/zombie_pain1.wav",
		"npc/zombie/zombie_pain2.wav",
		"npc/zombie/zombie_pain3.wav",
		"npc/zombie/zombie_pain4.wav",
		"npc/zombie/zombie_pain5.wav",
		"npc/zombie/zombie_pain6.wav",
		
		"npc/zombie_poison/pz_alert1.wav",
		"npc/zombie_poison/pz_alert2.wav",
		
		"npc/zombie_poison/pz_call1.wav",
		
		"npc/zombie_poison/pz_die1.wav",
		"npc/zombie_poison/pz_die2.wav",
		
		"npc/zombie_poison/pz_pain1.wav",
		"npc/zombie_poison/pz_pain2.wav",
		"npc/zombie_poison/pz_pain3.wav",
		
		"npc/zombie_poison/pz_warn1.wav",
		"npc/zombie_poison/pz_warn2.wav",
	}
	
	ZombieChestSounds = {
		"npc/fast_zombie/fz_alert_close1.wav",
		"npc/fast_zombie/fz_alert_far1.wav",
		"npc/fast_zombie/fz_frenzy1.wav",
		"npc/fast_zombie/fz_scream1.wav",

		"npc/fast_zombie/leap1.wav",
		
		"npc/fast_zombie/wake1.wav",
		
		"npc/zombie/zombie_alert1.wav",
		"npc/zombie/zombie_alert2.wav",
		"npc/zombie/zombie_alert3.wav",
		
		"npc/zombie/zombie_die1.wav",
		"npc/zombie/zombie_die2.wav",
		"npc/zombie/zombie_die3.wav",
		
		"npc/zombie/zombie_pain1.wav",
		"npc/zombie/zombie_pain2.wav",
		"npc/zombie/zombie_pain3.wav",
		"npc/zombie/zombie_pain4.wav",
		"npc/zombie/zombie_pain5.wav",
		"npc/zombie/zombie_pain6.wav",
		
		"npc/zombie_poison/pz_alert1.wav",
		"npc/zombie_poison/pz_alert2.wav",
		
		"npc/zombie_poison/pz_call1.wav",
		
		"npc/zombie_poison/pz_die1.wav",
		"npc/zombie_poison/pz_die2.wav",
		
		"npc/zombie_poison/pz_pain1.wav",
		"npc/zombie_poison/pz_pain2.wav",
		"npc/zombie_poison/pz_pain3.wav",
		
		"npc/zombie_poison/pz_warn1.wav",
		"npc/zombie_poison/pz_warn2.wav",
	}
	
	ZombieStomachSounds = {
		"npc/fast_zombie/fz_alert_close1.wav",
		"npc/fast_zombie/fz_alert_far1.wav",
		"npc/fast_zombie/fz_frenzy1.wav",
		"npc/fast_zombie/fz_scream1.wav",

		"npc/fast_zombie/leap1.wav",
		
		"npc/fast_zombie/wake1.wav",
		
		"npc/zombie/zombie_alert1.wav",
		"npc/zombie/zombie_alert2.wav",
		"npc/zombie/zombie_alert3.wav",
		
		"npc/zombie/zombie_die1.wav",
		"npc/zombie/zombie_die2.wav",
		"npc/zombie/zombie_die3.wav",
		
		"npc/zombie/zombie_pain1.wav",
		"npc/zombie/zombie_pain2.wav",
		"npc/zombie/zombie_pain3.wav",
		"npc/zombie/zombie_pain4.wav",
		"npc/zombie/zombie_pain5.wav",
		"npc/zombie/zombie_pain6.wav",
		
		"npc/zombie_poison/pz_alert1.wav",
		"npc/zombie_poison/pz_alert2.wav",
		
		"npc/zombie_poison/pz_call1.wav",
		
		"npc/zombie_poison/pz_die1.wav",
		"npc/zombie_poison/pz_die2.wav",
		
		"npc/zombie_poison/pz_pain1.wav",
		"npc/zombie_poison/pz_pain2.wav",
		"npc/zombie_poison/pz_pain3.wav",
		
		"npc/zombie_poison/pz_warn1.wav",
		"npc/zombie_poison/pz_warn2.wav",
	}
	
	ZombieThighSounds = {
		"npc/fast_zombie/fz_alert_close1.wav",
		"npc/fast_zombie/fz_alert_far1.wav",
		"npc/fast_zombie/fz_frenzy1.wav",
		"npc/fast_zombie/fz_scream1.wav",

		"npc/fast_zombie/leap1.wav",
		
		"npc/fast_zombie/wake1.wav",
		
		"npc/zombie/zombie_alert1.wav",
		"npc/zombie/zombie_alert2.wav",
		"npc/zombie/zombie_alert3.wav",
		
		"npc/zombie/zombie_die1.wav",
		"npc/zombie/zombie_die2.wav",
		"npc/zombie/zombie_die3.wav",
		
		"npc/zombie/zombie_pain1.wav",
		"npc/zombie/zombie_pain2.wav",
		"npc/zombie/zombie_pain3.wav",
		"npc/zombie/zombie_pain4.wav",
		"npc/zombie/zombie_pain5.wav",
		"npc/zombie/zombie_pain6.wav",
		
		"npc/zombie_poison/pz_alert1.wav",
		"npc/zombie_poison/pz_alert2.wav",
		
		"npc/zombie_poison/pz_call1.wav",
		
		"npc/zombie_poison/pz_die1.wav",
		"npc/zombie_poison/pz_die2.wav",
		
		"npc/zombie_poison/pz_pain1.wav",
		"npc/zombie_poison/pz_pain2.wav",
		"npc/zombie_poison/pz_pain3.wav",
		
		"npc/zombie_poison/pz_warn1.wav",
		"npc/zombie_poison/pz_warn2.wav",
	}
	
	RollingSounds = {
		"npc/combine_soldier/gear1.wav",
		"npc/combine_soldier/gear2.wav",
		"npc/combine_soldier/gear3.wav",
		"npc/combine_soldier/gear4.wav",
		"npc/combine_soldier/gear5.wav",
		"npc/combine_soldier/gear6.wav",
	}
	
	RollingImpactSounds = {
		"physics/body/body_medium_impact_hard1.wav",
		"physics/body/body_medium_impact_hard2.wav",
		"physics/body/body_medium_impact_hard3.wav",
		"physics/body/body_medium_impact_hard4.wav",
		"physics/body/body_medium_impact_hard5.wav",
		"physics/body/body_medium_impact_hard6.wav",
	}
	
	//Models
	
	--Male
	MaleModels = {
		"models/player/breen.mdl",
		"models/player/eli.mdl",
		"models/player/gman_high.mdl",
		"models/player/kleiner.mdl",
		"models/player/odessa.mdl",
		"models/player/magnusson.mdl",
		"models/player/soldier_stripped.mdl",
		
		"models/player/group01/male_01.mdl",
		"models/player/group01/male_02.mdl",
		"models/player/group01/male_03.mdl",
		"models/player/group01/male_04.mdl",
		"models/player/group01/male_05.mdl",
		"models/player/group01/male_06.mdl",
		"models/player/group01/male_07.mdl",
		"models/player/group01/male_08.mdl",
		"models/player/group01/male_09.mdl",
		
		"models/player/group03/male_01.mdl",
		"models/player/group03/male_02.mdl",
		"models/player/group03/male_03.mdl",
		"models/player/group03/male_04.mdl",
		"models/player/group03/male_05.mdl",
		"models/player/group03/male_06.mdl",
		"models/player/group03/male_07.mdl",
		"models/player/group03/male_08.mdl",
		"models/player/group03/male_09.mdl",
				
		"models/player/group03m/male_01.mdl",
		"models/player/group03m/male_02.mdl",
		"models/player/group03m/male_03.mdl",
		"models/player/group03m/male_04.mdl",
		"models/player/group03m/male_05.mdl",
		"models/player/group03m/male_06.mdl",
		"models/player/group03m/male_07.mdl",
		"models/player/group03m/male_08.mdl",
		"models/player/group03m/male_09.mdl",
		
		"models/player/group02/male_02.mdl",
		"models/player/group02/male_04.mdl",
		"models/player/group02/male_06.mdl",
		"models/player/group02/male_08.mdl",
		
		"models/player/hostage/hostage_01.mdl",
		"models/player/hostage/hostage_02.mdl",
		"models/player/hostage/hostage_03.mdl",
		"models/player/hostage/hostage_04.mdl",
		
		"models/player/arctic.mdl",
		"models/player/guerilla.mdl",
		"models/player/leet.mdl",
		"models/player/phoenix.mdl",
		
		"models/player/dod_american.mdl",
		"models/player/dod_german.mdl",
	}
	
	--Female
	FemaleModels = {
		"models/captainbigbutt/vocaloid/miku_append.mdl",
		"models/player/p2_chell.mdl",
		"models/player/mossman.mdl",
		"models/player/mossman_arctic.mdl",

		"models/player/group01/female_01.mdl",
		"models/player/group01/female_02.mdl",
		"models/player/group01/female_03.mdl",
		"models/player/group01/female_04.mdl",
		"models/player/group01/female_05.mdl",
		"models/player/group01/female_06.mdl",
		
		"models/player/group03/female_01.mdl",
		"models/player/group03/female_02.mdl",
		"models/player/group03/female_03.mdl",
		"models/player/group03/female_04.mdl",
		"models/player/group03/female_05.mdl",
		"models/player/group03/female_06.mdl",
				
		"models/player/group03m/female_01.mdl",
		"models/player/group03m/female_02.mdl",
		"models/player/group03m/female_03.mdl",
		"models/player/group03m/female_04.mdl",
		"models/player/group03m/female_05.mdl",
		"models/player/group03m/female_06.mdl",
	}
	
	--Combine
	CombineModels = {
		"models/player/combine_soldier.mdl",
		"models/player/combine_soldier_prisonguard.mdl",
		"models/player/combine_super_soldier.mdl",
		"models/player/police.mdl",
		"models/player/police_fem.mdl",
		
		"models/player/gasmask.mdl",
		"models/player/riot.mdl",
		"models/player/swat.mdl",
		"models/player/urban.mdl",
	"models/player/police.mdl",
	"models/player/police_fem.mdl",
	"models/dpfilms/metropolice/playermodels/pm_artic_police.mdl",
	"models/dpfilms/metropolice/playermodels/pm_badass_police.mdl",
	"models/dpfilms/metropolice/playermodels/pm_biopolice.mdl",
	"models/dpfilms/metropolice/playermodels/pm_black_police.mdl",
	"models/dpfilms/metropolice/playermodels/pm_c08cop.mdl",
	"models/dpfilms/metropolice/playermodels/pm_civil_medic.mdl",
	"models/dpfilms/metropolice/playermodels/pm_elite_police.mdl",
	"models/dpfilms/metropolice/playermodels/pm_female_police.mdl",
	"models/dpfilms/metropolice/playermodels/pm_hdpolice.mdl",
	"models/dpfilms/metropolice/playermodels/pm_hl2concept.mdl",
	"models/dpfilms/metropolice/playermodels/pm_hunter_police.mdl",
	"models/dpfilms/metropolice/playermodels/pm_phoenix_police.mdl",
	"models/dpfilms/metropolice/playermodels/pm_police_bt.mdl",
	"models/dpfilms/metropolice/playermodels/pm_policetrench.mdl",
	"models/dpfilms/metropolice/playermodels/pm_resistance_police.mdl",
	"models/dpfilms/metropolice/playermodels/pm_rogue_police.mdl",
	"models/dpfilms/metropolice/playermodels/pm_rtb_police.mdl",
	"models/dpfilms/metropolice/playermodels/pm_skull_police.mdl",
	"models/dpfilms/metropolice/playermodels/pm_steampunk_police.mdl",
	"models/dpfilms/metropolice/playermodels/pm_retrocop.mdl",
	"models/7 hour player/ar_combine_soldier_old.mdl", 
	"models/7 hour player/combine_soldier_old.mdl",
	"models/7 hour player/combine_soldier_old_b.mdl",
	"models/player/combine_soldier.mdl",
	"models/player/combine_soldier_prisonguard.mdl",
	"models/player/combine_super_soldier.mdl",
	"models/player/gasmask.mdl",
	"models/player/riot.mdl",
	"models/player/swat.mdl",
	"models/player/urban.mdl",
	"models/player/city8_overwatch_elite.mdl",
	"models/player/city8_ow_elite.mdl",
	"models/player/city8_overwatch.mdl",
	"models/jessev92/player/hl2/mi-elite.mdl",
	"models/jessev92/player/hl2/mi-prisonguard.mdl",
	"models/jessev92/player/hl2/mi-soldier.mdl",
	"models/jessev92/player/hl2/conceptbine.mdl",
	}
	
	--Alyx
	AlyxModels = {
		"models/player/alyx.mdl",
	}
	
	--Zombie
	ZombieModels = {
		"models/player/charple.mdl",
		"models/player/corpse1.mdl",
		"models/player/zombie_classic.mdl",
		"models/player/zombie_fast.mdl",
		"models/player/skeleton.mdl",
		"models/player/zombie_soldier.mdl",
	}
end