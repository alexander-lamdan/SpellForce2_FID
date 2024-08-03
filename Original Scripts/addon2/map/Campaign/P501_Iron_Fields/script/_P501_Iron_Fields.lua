State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			
			MapFlagSetTrue {Name = "mf_P501_StartIntroCS"},
			MapFlagSetTrue {Name = "mf_P501_StartWithTeflis"},
			MapFlagSetFalse {Name = "mf_MapChangeDetected"},
			MapFlagSetFalse {Name = "mf_P501_WolvesDead"},
			
			FigureAbilityAdd	{Tag = "Iron_Field_Warrior_8", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "Iron_Field_Warrior_9", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "Iron_Field_Warrior_10", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "Iron_Field_Warrior_11", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "Iron_Field_Warrior_12", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "Iron_Field_Warrior_13", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "Iron_Field_Warrior_15", AbilityId = Ability.Immortal },
			
			FigureAbilityAdd	{Tag = "Commander_Garret", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_Garret_Soldiers_01", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_Garret_Soldiers_02", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_Garret_Soldiers_03", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_Garret_Soldiers_04", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_Garret_Soldiers_05", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_Garret_Soldiers_06", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_Garret_Soldiers_07", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_Garret_Soldiers_08", AbilityId = Ability.Immortal },
			
			FigureAbilityAdd	{Tag = "IF_SQ_Bandit_01", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_SQ_Bandit_02", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_SQ_Bandit_03", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_SQ_Bandit_04", AbilityId = Ability.Immortal },
			
			BuildingAbilityAdd	{Tag = "Barrier_Tower_05_Level_06", AbilityId = Ability.Immortal},
			BuildingAbilityAdd	{Tag = "Barrier_Tower_04_Level_05", AbilityId = Ability.Immortal},
			BuildingAbilityAdd	{Tag = "Barrier_Tower_03_Level_05", AbilityId = Ability.Immortal},
			BuildingAbilityAdd	{Tag = "Barrier_Tower_02_Level_05", AbilityId = Ability.Immortal},
			BuildingAbilityAdd	{Tag = "Barrier_Tower_01_Level_05", AbilityId = Ability.Immortal},
	
			DialogSetEnabled {Tag = "EllacruVilde"},
		},
	},

	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions =
		{
			FigureVanish { Tag = "CS_03_IF_Antaris"},						
			FigureVanish { Tag = "CS_03_IF_Avatar"},						
			FigureVanish { Tag = "CS_04_IF_Avatar"},						
			FigureVanish { Tag = "CS_04_IF_Antaris"},						
			FigureVanish { Tag = "CS_06_IF_Avatar"},						
			FigureVanish { Tag = "CS_06_IF_Antaris"},						
			FigureVanish { Tag = "CS_05_IF_Antaris"},
			FigureVanish { Tag = "CS_05_IF_Avatar"},
			FigureVanish { Tag = "CS_07_IF_Noradim"},
			FigureVanish { Tag = "IF_CutScene_Twiddle"},
			FigureVanish { Tag = "CS_07_IF_Noradim_spawn"},
			FigureVanish { Tag = "CS_07_IF_Soul_Carrier_spawn"},
			FigureVanish { Tag = "Former_Conqueress_spawn"},
			FigureVanish { Tag = "Former_Conqueress_dialog"},
			FigureVanish { Tag = "CS_07_IF_Noradim_dialog"},
			FigureVanish { Tag = "CS_07_IF_Soul_Carrier_dialog"},
			FigureVanish { Tag = "cs_twiddle_invisible"},
			FigureVanish { Tag = "Antara_Dia"},
			FigureVanish { Tag = "Twiddle_Dia"},
			FigureVanish { Tag = "Surian_Dia"},
			
			FigureVanish {Tag = "CS_01_IF_Avatar"},
			FigureVanish {Tag = "CS_01_IF_Antaris"},
			FigureVanish {Tag = "IF_CutScene_Twiddle"},
			FigureVanish {Tag = "CS_XX_IF_Noradim"},
			FigureVanish {Tag = "CS_XX_IF_Soul_Carrier"},
			FigureVanish {Tag = "CS_XX_IF_Surian"},
			FigureVanish {Tag = "Former_Conqueress"},
			FigureVanish {Tag = "CS_Surian_Avatar"},			
			
			ObjectVanish {Tag = "IF_Lever_01_TwidlePortal"},
			ObjectVanish {Tag = "IF_Lever_02_TwidlePortal"},
			ObjectVanish {Tag = "IF_Lever_03_TwidlePortal"},
			ObjectVanish {Tag = "IF_Lever_04_TwidlePortal"},
			ObjectVanish {Tag = "IF_Lever_05_TwidlePortal"},
			ObjectVanish {Tag = "IF_Lever_06_TwidlePortal"},
			ObjectVanish {Tag = "IF_Lever_07_TwidlePortal"},
			ObjectVanish {Tag = "IF_Lever_08_TwidlePortal"},
			
			
		},
	},
		

OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_EndIntroCS"},
		},
		Actions =
		{
			PlayerHeroAdd	{ HeroId = 189},						
			NoSpawnEffect { Spawn = FigureHeroSpawnToEntity	{Tag = "HeroAntara", TargetTag = "pl_HumanAvatar", Direction = 0},},
			FigureTeleport {Tag = "pl_HumanHeroAntara", X = 73, Y = 617.048},
			FigureTeleport {Tag = "pl_HumanAvatar", X = 69, Y = 616.895},
			MapFlagSetTrue {Name  = "mf_P501_AntaraNightmare"},
			DialogSetDisabled {Tag = "pl_HumanHeroAntara" },
			AvatarGoldGive	{Player = "default", Amount = 500},
		
						
			--DialogSetEnabled {Tag = "Commander_Garret"},
			
			
			--PlayerMapTravelAddon2	{Map = "Campaign/P504_The_Wasteland_Of_Sorrows", TargetTag = "start"},		
			--MapFlagSetTrue {Name = "mf_P501_MapTravelledOnce"},
			--PlayerMapTravelAddon2	{Map = "Campaign/P502_Malangar_Greens", TargetTag = "start"},		
			--PlayerMapTravelAddon2	{Map = "Campaign/P503_The_Dugout", TargetTag = "start"},		
			--QuestSetActive{Quest = "IF_SALVATION"},
			--MapFlagSetTrue {Name  = "mf_P501_StartSalvationCS"},
			
			
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_AntaraNightmare"},	
			GameIsUnBlocked{},
			
		},
		Actions =
		{
			DialogSetEnabled {Tag = "pl_HumanHeroAntara" },
			DialogBegin	{Player = "default", Tag = "pl_HumanHeroAntara"},
		},
	},

	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_TalkCompleteAntaraNightmare"},	
			
		},
		Actions =
		{
			--FigureTeleport	{Tag = "pl_HumanAvatar", X = 65, Y = 544},
			--FigureTeleport	{Tag = "pl_HumanHeroAntara", X = 66, Y = 544},
			--QuestSetActive	{Player = "default", Quest = "IF_SALVATION"},
		},
	},

	

	OnOneTimeEvent
	{
		Conditions = 
		{
				MapFlagIsTrue {Name = "mf_P501_AntaraOnMap"},
		},
		Actions =
		{
			DialogSetEnabled {Tag = "pl_HumanHeroAntara" },
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_EndNadiraCS"},
		},
		Actions =
		{
			FigureForcedWalk {Tag = "Nadira",X = 206.673, Y = 572.48},
			FigureOutcry	{TextTag = "Flink1", Tag = "Flink"},
			MapTimerStart {Name = "mt_P501_FlinkTimer"},
		},
	},
	
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_P501_FlinkTimer", Seconds = 10},
			MapFlagIsFalse {Name = "mf_P501_TalkStarted"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "Flink1", Tag = "Flink"},
			MapTimerStop {Name = "mt_P501_FlinkTimer"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "IF_FLINK"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "Flink2", Tag = "Flink"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				MapFlagIsTrue {Name = "mf_P501_FlinkToGuard"},
				QuestIsActive {Quest = "IF_FLINK"},
			},
		},
		Actions =
		{
			FigureForcedRunToEntity {Tag = "Flink", TargetTag = "sq_Aunt_Ella"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_FlinkToGuard"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 3333},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRangeToEntity {Tag = "Flink", TargetTag = "sq_Aunt_Ella", Range = 7},
		},
		Actions =
		{
			FigureVanish {Tag = "Flink"},
		},
	},


	OnOneTimeEvent
	{
		Conditions = 
		{
			--OR
			--{
			--	FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = "IF_SQ_marker_The_Lost_Heir_Symon", Range = 5},
			--	FigureIsInRangeToEntity {Tag = "pl_HumanHeroAntara", TargetTag = "IF_SQ_marker_The_Lost_Heir_Symon", Range = 5},
			--},
			
			FigureTeamIsInRange	{Team = "tm_Team1", Range = 6, X = 254, Y = 407},
		},
		Actions =
		{
			FigureHealthAdd	{Tag = "IF_SQ_Bandit_01", Percent = 70},
			FigureHealthAdd	{Tag = "IF_SQ_Bandit_02", Percent = 70},
			FigureHealthAdd	{Tag = "IF_SQ_Bandit_03", Percent = 70},
			FigureHealthAdd	{Tag = "IF_SQ_Bandit_04", Percent = 70},
			FigureAbilityRemove	{Tag = "IF_SQ_Bandit_01", AbilityId = Ability.Immortal },
			FigureAbilityRemove {Tag = "IF_SQ_Bandit_02", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "IF_SQ_Bandit_03", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "IF_SQ_Bandit_04", AbilityId = Ability.Immortal },
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "IF_SQ_Bandit_01"},
			FigureIsDead {Tag = "IF_SQ_Bandit_02"},
			FigureIsDead {Tag = "IF_SQ_Bandit_03"},
			FigureIsAlive {Tag = "IF_SQ_Bandit_04"},
		},
		Actions =
		{
			FigureKill {Tag = "IF_SQ_Bandit_04"}
		},
	},
		
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "IF_SQ_Bandit_01"},
			FigureIsDead {Tag = "IF_SQ_Bandit_02"},
			FigureIsDead {Tag = "IF_SQ_Bandit_04"},
			FigureIsAlive {Tag = "IF_SQ_Bandit_03"},
		},
		Actions =
		{
			FigureKill {Tag = "IF_SQ_Bandit_03"}
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "IF_SQ_Bandit_01"},
			FigureIsDead {Tag = "IF_SQ_Bandit_04"},
			FigureIsDead {Tag = "IF_SQ_Bandit_03"},
			FigureIsAlive {Tag = "IF_SQ_Bandit_02"},
		},
		Actions =
		{
			FigureKill {Tag = "IF_SQ_Bandit_02"}
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "IF_SQ_Bandit_04"},
			FigureIsDead {Tag = "IF_SQ_Bandit_02"},
			FigureIsDead {Tag = "IF_SQ_Bandit_03"},
			FigureIsAlive {Tag = "IF_SQ_Bandit_01"},
		},
		Actions =
		{
			FigureKill {Tag = "IF_SQ_Bandit_01"}
		},
	},
	

	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				FigureIsInRange {Tag = "pl_HumanAvatar", Range = 10, X = 190.659, Y = 633.814},
				FigureIsInRange {Tag = "pl_HumanHeroAntara", Range = 10, X = 190.659, Y = 633.814},
			},			
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P501_StartNadiraCS"},
			--MapFlagSetTrue {Name = "mf_P501_StartSalvationCS"},
		},
	},

	-- Attack avatar at the city
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = "marker_avatar_attack_01", Range = 10},
				FigureIsInRangeToEntity {Tag = "pl_HumanHeroAntara", TargetTag = "marker_avatar_attack_01", Range = 10},
			},
		},
		Actions =
		{
			
			FigureRunToEntity {Tag = "IF_avatar_attack_01", TargetTag = "pl_HumanAvatar"},
			FigureRunToEntity {Tag = "IF_avatar_attack_02", TargetTag = "pl_HumanAvatar"},
			MapTimerStart	{Name = "mt_P501_FirstAttackRepeat"},
			
		}
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_P501_FirstAttackRepeat", Seconds = 4},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P501_FirstAttackRepeat"},
			FigureRunToEntity {Tag = "IF_avatar_attack_01", TargetTag = "pl_HumanAvatar"},
			FigureRunToEntity {Tag = "IF_avatar_attack_02", TargetTag = "pl_HumanAvatar"},
		}
	},
	
	-- deja vu outcry
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "IF_avatar_attack_01"},
			FigureIsDead	{Tag = "IF_avatar_attack_02"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "Firstkill1", Tag = "pl_HumanHeroAntara"},
			FigureOutcry	{TextTag = "Firstkill2", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "Firstkill3", Tag = "pl_HumanHeroAntara"},
			FigureOutcry	{TextTag = "Firstkill4", Tag = "pl_HumanAvatar"},
			
		}
	},
	
	
	-- if the player reahced the burning village  -> some warrior lost their immortal abilities, fight started
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = "IF_BurningVillage_GarretFightStarter", Range = 12},
				FigureIsInRangeToEntity {Tag = "pl_HumanHeroAntara", TargetTag = "IF_BurningVillage_GarretFightStarter", Range = 12},
			},			
		},
		Actions =
		{
			MapFlagSetTrue {Name  = "mf_P501_VillageReached"},
			
			FigureAbilityRemove	{Tag = "Iron_Field_Warrior_12", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "Iron_Field_Warrior_13", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "Iron_Field_Warrior_15", AbilityId = Ability.Immortal },
			
			FigureAbilityRemove	{Tag = "IF_Garret_Soldiers_01", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "IF_Garret_Soldiers_02", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "IF_Garret_Soldiers_03", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "IF_Garret_Soldiers_04", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "IF_Garret_Soldiers_05", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "IF_Garret_Soldiers_06", AbilityId = Ability.Immortal },
		},
	},
	
	-- player joins the Fight in the village
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_VillageReached"},
			OR
			{
				FigureIsInCombat	{Tag = "pl_HumanAvatar"},
				FigureIsInCombat	{Tag = "pl_HumanHeroAntara"},
			},
		},
		Actions =
		{
			NoSpawnEffect { Spawn = FigureNpcSpawn	{Tag = "IF_Garret_CrossBowMan_01", Level = 11 , UnitId = 304 , X = 330 , Y = 659 , Team = "tm_Team1"},},
			NoSpawnEffect { Spawn = FigureNpcSpawn	{Tag = "IF_Garret_CrossBowMan_02", Level = 11 , UnitId = 304 , X = 329 , Y = 660 , Team = "tm_Team1"},},
			NoSpawnEffect { Spawn = FigureNpcSpawn	{Tag = "IF_Garret_CrossBowMan_03", Level = 11 , UnitId = 304 , X = 328 , Y = 661 , Team = "tm_Team1"},},
	  	NoSpawnEffect { Spawn = FigureNpcSpawn	{Tag = "IF_Garret_CrossBowMan_04", Level = 11 , UnitId = 304 , X = 327 , Y = 662 , Team = "tm_Team1"},},
			
			FigureAbilityAdd	{Tag = "IF_Garret_CrossBowMan_01", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_Garret_CrossBowMan_02", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_Garret_CrossBowMan_03", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_Garret_CrossBowMan_04", AbilityId = Ability.Immortal },
			
			FigureForcedRun	{Tag = "IF_Garret_CrossBowMan_01", X = 334 , Y = 645 },
			FigureForcedRun	{Tag = "IF_Garret_CrossBowMan_02", X = 336 , Y = 644 },
			FigureForcedRun	{Tag = "IF_Garret_CrossBowMan_03", X = 338 , Y = 644 },
			FigureForcedRun	{Tag = "IF_Garret_CrossBowMan_04", X = 340 , Y = 644 },
			
			FigureAbilityRemove	{Tag = "Iron_Field_Warrior_8", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "Iron_Field_Warrior_9", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "Iron_Field_Warrior_10", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "Iron_Field_Warrior_11", AbilityId = Ability.Immortal },
			
			FigureAbilityRemove	{Tag = "IF_Garret_Soldiers_07", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "IF_Garret_Soldiers_08", AbilityId = Ability.Immortal },	
		},
	},
	
	-- fight ends in the village, all enemy dead
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "Iron_Field_Warrior_8"},
			FigureIsDead {Tag = "Iron_Field_Warrior_9"},
			FigureIsDead {Tag = "Iron_Field_Warrior_10"},
			FigureIsDead {Tag = "Iron_Field_Warrior_11"},
			FigureIsDead {Tag = "Iron_Field_Warrior_12"},
			FigureIsDead {Tag = "Iron_Field_Warrior_13"},
			FigureIsDead {Tag = "Iron_Field_Warrior_15"},
		},
		Actions =
		{
			MapFlagSetTrue {Name ="mf_P501_AreaSecured"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse {Name = "mf_P501_FirstTalk1CompleteGarret"},
			MapFlagIsTrue {Name ="mf_P501_AreaSecured"},
			FigureIsNotInCombat	{Tag = "Commander_Garret"},
			FigureIsNotInCombat	{Tag = "pl_HumanAvatar"},
			FigureIsNotInCombat	{Tag = "pl_HumanHeroAntara"},
		},
		Actions =
		{
			FigureTeleport {Tag = "Commander_Garret", X = 347, Y = 636},
			FigureTeleport {Tag = "pl_HumanAvatar", X = 350, Y = 634},
			DialogSetEnabled {Tag = "Commander_Garret"},
			DialogBegin	{Player = "default", Tag = "Commander_Garret"},
			
		},
	},
	 
	-- when the first Garrett dialog ends, 	reinforment is arriving
	
	 OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_FirstTalk1CompleteGarret"},
		},
		Actions =
		{
			NoSpawnEffect { Spawn = FigureNpcSpawn	{Tag = "IF_Garret_Reinf_01", Level = 6 , UnitId = 311 , X = 303 , Y = 644 , Team = "tm_Team1"},},
			NoSpawnEffect { Spawn = FigureNpcSpawn	{Tag = "IF_Garret_Reinf_02", Level = 6 , UnitId = 311 , X = 302 , Y = 641 , Team = "tm_Team1"},},
			NoSpawnEffect { Spawn = FigureNpcSpawn	{Tag = "IF_Garret_Reinf_03", Level = 6 , UnitId = 311 , X = 301 , Y = 639 , Team = "tm_Team1"},},
	  	NoSpawnEffect { Spawn = FigureNpcSpawn	{Tag = "IF_Garret_Reinf_04", Level = 6 , UnitId = 311 , X = 300 , Y = 637 , Team = "tm_Team1"},},
	  	NoSpawnEffect { Spawn = FigureNpcSpawn	{Tag = "IF_Garret_Reinf_05", Level = 6 , UnitId = 311 , X = 297 , Y = 642 , Team = "tm_Team1"},},
			NoSpawnEffect { Spawn = FigureNpcSpawn	{Tag = "IF_Garret_Reinf_06", Level = 6 , UnitId = 311 , X = 297 , Y = 640 , Team = "tm_Team1"},},
	  	NoSpawnEffect { Spawn = FigureNpcSpawn	{Tag = "IF_Garret_Reinf_07", Level = 6 , UnitId = 311 , X = 297 , Y = 638 , Team = "tm_Team1"},},
			
			FigureAbilityAdd	{Tag = "IF_Garret_Reinf_01", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_Garret_Reinf_02", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_Garret_Reinf_03", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_Garret_Reinf_04", AbilityId = Ability.Immortal },
			
			FigureForcedRunToEntity	{Tag = "IF_Garret_Reinf_01", TargetTag = "IF_Garret_CrossBowMan_02"},
			FigureForcedRunToEntity	{Tag = "IF_Garret_Reinf_02", TargetTag = "IF_Garret_CrossBowMan_04"},
			FigureForcedRun	{Tag = "IF_Garret_Reinf_03", X = 343 , Y = 644 },
			FigureForcedRun	{Tag = "IF_Garret_Reinf_04", X = 344 , Y = 645 },
			FigureForcedRunToEntity	{Tag = "IF_Garret_Reinf_05", TargetTag = "pl_HumanAvatar"},
			FigureForcedRunToEntity	{Tag = "IF_Garret_Reinf_06", TargetTag = "pl_HumanAvatar"},
			FigureForcedRunToEntity	{Tag = "IF_Garret_Reinf_07", TargetTag = "pl_HumanAvatar"},
			
			-- FigurePlayerTransfer	{Tag = "IF_Garret_Reinf_05", Player = "default"},
			-- FigurePlayerTransfer	{Tag = "IF_Garret_Reinf_06", Player = "default"},
			-- FigurePlayerTransfer	{Tag = "IF_Garret_Reinf_07", Player = "default"},
			
			FigureFollowEntity	{Tag = "IF_Garret_Reinf_05", TargetTag = "pl_HumanAvatar"},
			FigureFollowEntity	{Tag = "IF_Garret_Reinf_06", TargetTag = "pl_HumanAvatar"},
			FigureFollowEntity	{Tag = "IF_Garret_Reinf_07", TargetTag = "pl_HumanAvatar"},
			
			FigureOutcry	{TextTag = "Garrett1", Tag = "Commander_Garret"},
			
			
		},
	},
		 	 
-- If the player reached burning village journey stone -> road attackers start
		 	 
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = "IF_JourneyStone_BurningVillage", Range = 13},
				FigureIsInRangeToEntity {Tag = "pl_HumanHeroAntara", TargetTag = "IF_JourneyStone_BurningVillage", Range = 13},
			},			
		},
		Actions =
		{
			FigureRun	{Tag = "IF_NamelessRoadAttacker_01", X = 389, Y = 624},
			FigureRun	{Tag = "IF_NamelessRoadAttacker_02", X = 387, Y = 628},
			FigureRun	{Tag = "IF_NamelessRoadAttacker_03", X = 392, Y = 624},
			
			FigureRun	{Tag = "IF_NamelessRoadAttacker_06", X = 387, Y = 627},
			
			FigureAttackEntity	{Tag = "IF_Garret_Reinf_05", TargetTag = "IF_NamelessRoadAttacker_06"},
			FigureAttackEntity	{Tag = "IF_Garret_Reinf_06", TargetTag = "IF_NamelessRoadAttacker_01"},
			FigureAttackEntity	{Tag = "IF_Garret_Reinf_07", TargetTag = "IF_NamelessRoadAttacker_04"},
			
			MapTimerStart	{Name = "mt_P501_RoadAttackers"},
		},
	},	 	 
		 	 
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P501_RoadAttackers", Seconds = 5},
		},
		Actions =
		{
			FigureHealthSubtract	{Tag = "IF_Garret_Reinf_05", Percent = 15},	
			FigureHealthSubtract	{Tag = "IF_Garret_Reinf_06", Percent = 15},	
			FigureHealthSubtract	{Tag = "IF_Garret_Reinf_07", Percent = 15},	
			MapTimerStop	{Name = "mt_P501_RoadAttackers"},
		},
	},	 	 	 	 
		 	 	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "IF_NamelessRoadAttacker_01"},
			FigureIsDead	{Tag = "IF_NamelessRoadAttacker_02"},
			FigureIsDead	{Tag = "IF_NamelessRoadAttacker_03"},
			
			FigureIsDead	{Tag = "IF_NamelessRoadAttacker_06"},
		},
		Actions =
		{
			FigureFollowEntity	{Tag = "IF_Garret_Reinf_05", TargetTag = "pl_HumanAvatar"},
			FigureFollowEntity	{Tag = "IF_Garret_Reinf_06", TargetTag = "pl_HumanAvatar"},
			FigureFollowEntity	{Tag = "IF_Garret_Reinf_07", TargetTag = "pl_HumanAvatar"},
		},
	},	 	 	 	 	 	
		 		
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_EndFastCS"},
			OR	
			{
				MapFlagIsTrue {Name ="mf_P501_BridgeCrossed"},
				AvatarIsCastingSpell	{Player = "default", Spell = 450},
			},
		},
		Actions = 
		{
			FigureForcedRun	{Tag = "IF_Garret_Reinf_05", X = 344, Y = 646},
			FigureForcedRun	{Tag = "IF_Garret_Reinf_06", X = 337, Y = 646},
			FigureForcedRun	{Tag = "IF_Garret_Reinf_07", X = 350, Y = 644},	 	
		},
		GotoState = self,
	};
	
	--  test script
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = "IF_JourneyStone_UrMountain", Range = 5},
				FigureIsInRangeToEntity {Tag = "pl_HumanHeroAntara", TargetTag = "IF_JourneyStone_UrMountain", Range = 5},
			},			
		},
		Actions =
		{
			-- tower intro test
			
			--FigureKill	{Tag = "IF_NamelessRoadAttacker_01"},
			--FigureKill	{Tag = "IF_NamelessRoadAttacker_02"},
			--FigureKill	{Tag = "IF_NamelessRoadAttacker_03"},
			--FigureKill	{Tag = "IF_NamelessRoadAttacker_04"},
			--FigureKill	{Tag = "IF_NamelessRoadAttacker_06"},
			--MapFlagSetTrue {Name = "mf_P501_StartFastCS"},
			
			-- invasion dialog test
			
			--BuildingDestroy {Tag = "Iron_Field_SoulFarm_1"},
			--BuildingDestroy {Tag = "Iron_Fields_HQ"},
			--BuildingDestroy {Tag = "Iron_Field_Alchemist_1"},
			--BuildingDestroy {Tag = "Iron_Field_Smeltery_1"},
			--BuildingDestroy {Tag = "Iron_Field_Tower_1"},
			--BuildingDestroy {Tag = "Iron_Field_Tower_2"},
			--BuildingDestroy {Tag = "Iron_Field_Tower_3"},
			--FigureKill{Tag = "IF_Soul_Screamer"},
			--MapFlagSetTrue {Name  = "mf_P501_AntaraTowerBlockade"},
			--DialogSetEnabled {Tag = "pl_HumanHeroAntara"},
			--FigureTeleport	{Tag = "pl_HumanAvatar", X = 467, Y = 229},
			--FigureTeleport	{Tag = "pl_HumanHeroAntara", X = 467, Y = 225},
			--DialogBegin	{Player = "default", Tag = "pl_HumanHeroAntara"},
			
			--salvation cutscene test
			
			--QuestSetSolved {Quest = "IF_ATTACK"},
			--QuestSetActive {Quest = "IF_SALVATION"},
			
		},
	},
		
	
	-- If the player reached towers -> Fast intro start
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			
			FigureIsDead	{Tag = "IF_NamelessRoadAttacker_01"},
			FigureIsDead	{Tag = "IF_NamelessRoadAttacker_02"},
			FigureIsDead	{Tag = "IF_NamelessRoadAttacker_03"},
			FigureIsDead	{Tag = "IF_NamelessRoadAttacker_06"},
			FigureIsNotInCombat	{Tag = "pl_HumanAvatar"},
			FigureIsNotInCombat	{Tag = "pl_HumanHeroAntara"},
			OR
			{
				FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = "CS_05_IF_Anim_Start", Range = 10},
				FigureIsInRangeToEntity {Tag = "pl_HumanHeroAntara", TargetTag = "CS_05_IF_Anim_Start", Range = 10},
			},			
		},
		Actions =
		{
			
			FigureForcedRun	{Tag = "IF_Garret_Reinf_05", X = 420, Y = 624},
			FigureForcedRun	{Tag = "IF_Garret_Reinf_06", X = 417, Y = 621},
			FigureForcedRun	{Tag = "IF_Garret_Reinf_07", X = 420, Y = 621},	
			
			MapFlagSetTrue {Name = "mf_P501_StartFastCS"},
		},
	},
	
	-- End of the Fast custcene -> spawn 2 invisible wall to protect Antara from the towers
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_EndFastCS"},
		},
		Actions =
		{
			ObjectSpawn	{ObjectId = 2067, X = 420 , Y = 603 , Direction = 45, Tag = "IF_InvisibleWall1"},
			ObjectSpawn	{ObjectId = 2067, X = 428 , Y = 611 , Direction = 45, Tag = "IF_InvisibleWall2"},
		},
	},
	
	-- Fast cutscene end
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_EndFastCS"},
		},
		Actions = 
		{
			AvatarSpellGive {Player = "default", Spell = 450},			 
			-- AvatarXPGive {Player = "default", Amount = 2000},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_EndFastCS"},
			FigureIsAlive {Tag = "pl_HumanHeroAntara"},
			FigureIsAlive {Tag = "pl_HumanAvatar"},
		},
		Actions = 
		{
			MapTimerStart {Name = "mt_P501_Outcry"},
		
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_P501_Outcry", Seconds = 2},
			AvatarFlagIsFalse	{Player = "default", Name = "af_P500_TutorialRequested"},
		},
		Actions = 
		{
			FigureOutcry {TextTag = "FastAntara1", Tag = "pl_HumanHeroAntara"},
			FigureOutcry {TextTag = "FastAvatar1", Tag = "pl_HumanAvatar"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
			MapTimerIsElapsed {Name = "mt_P501_Outcry", Seconds = 6},
			AND
				{
					MapTimerIsElapsed {Name = "mt_P501_Outcry", Seconds = 2},
					AvatarFlagIsTrue	{Player = "default", Name = "af_P500_TutorialRequested"},
				},
			},
		},
		Actions = 
		{
			MapTimerStop {Name = "mt_P501_Outcry"},
			MapFlagSetTrue {Name  = "mf_P501_StartSummonTut"},
		},
	},
	
	-- Destroy the wall, if the Avatar summonden Antara, or the towers are destroyed
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_EndFastCS"},
			OR
			{
				MapFlagIsTrue {Name = "mf_P501_BlockadeDestroyed"},
				AvatarIsCastingSpell	{Player = "default", Spell = 450},
			},
		},
		Actions =
		{
			ObjectVanish	{Tag = "IF_InvisibleWall1"},
			ObjectVanish	{Tag = "IF_InvisibleWall2"},
		},
	},
	
	-- when the player attacks the enemy at the bridge, the bears will go there
	
	OnOneTimeEvent 
	{
		Conditions = 
		{
			OR
			{
			
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 15, X = 495, Y = 484},
			FigureIsInRange	{Tag = "pl_HumanHeroAntara", Range = 15, X = 495, Y = 484},
			
			}
		},
		Actions =
		{
		--FigureForcedRunToEntity {Tag = "IF_Bare_01", TargetTag = "Encounter_03"},
		--FigureForcedRunToEntity {Tag = "IF_Bare_02", TargetTag = "Encounter_03"},
		FigureAttackEntity	{Tag = "IF_Bare_01", TargetTag = "pl_HumanAvatar"},
		FigureAttackEntity	{Tag = "IF_Bare_02", TargetTag = "pl_HumanAvatar"},
		MapFlagSetTrue {Name ="mf_P501_BridgeCrossed"},
		},
	},
	
	-- Player reached outpost with one character -> flag set
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				--FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = "BabaHouse", Range = 40},
				--FigureIsInRangeToEntity {Tag = "pl_HumanHeroAntara", TargetTag = "BabaHouse", Range = 40},
				FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = "Encounter_03", Range = 12},
				FigureIsInRangeToEntity {Tag = "pl_HumanHeroAntara", TargetTag = "Encounter_03", Range = 12},
			},			
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_P501_OutpostDelayTimer"},
		},
	},
	-- far but delay
	OnOneTimeEvent
	{
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P501_OutpostDelayTimer", Seconds = 3},	
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P501_OutpostFightStart"},
			MapTimerStop	{Name = "mt_P501_OutpostDelayTimer"},
		},
	},
	
	----------------------------------------------------
	-- Nameless fight for OutPost
	----------------------------------------------------
	
	-- event init
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_AreaSecured"},
		},
		Actions =
		{
			BuildingHealthSet	{Tag = "Outpost_Tower_01", Percent = 5},
			BuildingHealthSet	{Tag = "Outpost_Tower_02", Percent = 5},
			BuildingHealthSet	{Tag = "Outpost_Farm_01", Percent = 5},
			BuildingHealthSet	{Tag = "Outpost_Farm_02", Percent = 5},
			BuildingHealthSet	{Tag = "Outpost_BlackSmith_01", Percent = 5},
			
			BuildingAbilityAdd	{Tag = "Outpost_Tower_01", AbilityId = Ability.Immortal },
			BuildingAbilityAdd	{Tag = "Outpost_Tower_02", AbilityId = Ability.Immortal },
			BuildingAbilityAdd	{Tag = "Outpost_Farm_01", AbilityId = Ability.Immortal },
			BuildingAbilityAdd	{Tag = "Outpost_Farm_02", AbilityId = Ability.Immortal },
			BuildingAbilityAdd	{Tag = "Outpost_BlackSmith_01", AbilityId = Ability.Immortal },
			
			FigureAbilityAdd	{Tag = "IF_Outpost_Attacker_01", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_Outpost_Attacker_02", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_Outpost_Attacker_03", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_Outpost_Attacker_04", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_Outpost_Attacker_07", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_Outpost_Attacker_08", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_Outpost_Attacker_09", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_Outpost_Attacker_10", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_Outpost_Attacker_11", AbilityId = Ability.Immortal },
		
			FigureAbilityAdd	{Tag = "IF_Outpost_Defender_01", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_Outpost_Defender_02", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_Outpost_Defender_03", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "IF_Outpost_Defender_04", AbilityId = Ability.Immortal },
						
			FigureTeamTransfer {Tag = "IF_Outpost_Defender_04", Team = "tm_Team1"},
			FigureTeamTransfer {Tag = "IF_Outpost_Defender_03", Team = "tm_Team1"},
			FigureTeamTransfer {Tag = "IF_Outpost_Defender_02", Team = "tm_Team1"},
			FigureTeamTransfer {Tag = "IF_Outpost_Defender_01", Team = "tm_Team1"},
			
			BuildingTeamTransfer	{Tag = "Outpost_Farm_01", Team = "tm_Team1"},
			BuildingTeamTransfer	{Tag = "Outpost_Farm_01", Team = "tm_Team1"},
			BuildingTeamTransfer	{Tag = "Outpost_Tower_01", Team = "tm_Team1"},
			BuildingTeamTransfer	{Tag = "Outpost_Tower_02", Team = "tm_Team1"},
			BuildingTeamTransfer	{Tag = "Outpost_BlackSmith_01", Team = "tm_Team1"},
			
			FigureAttackEntity	{Tag = "IF_Outpost_Attacker_01", TargetTag = "IF_Outpost_Defender_01"},
			FigureAttackEntity	{Tag = "IF_Outpost_Attacker_02", TargetTag = "IF_Outpost_Defender_02"},
			FigureAttackEntity	{Tag = "IF_Outpost_Attacker_03", TargetTag = "IF_Outpost_Defender_03"},
			FigureAttackEntity	{Tag = "IF_Outpost_Attacker_04", TargetTag = "IF_Outpost_Defender_04"},
			FigureAttackEntity	{Tag = "IF_Outpost_Attacker_07", TargetTag = "Outpost_Tower_02"},
			FigureAttackEntity	{Tag = "IF_Outpost_Attacker_08", TargetTag = "Outpost_Tower_01"},
			FigureAttackEntity	{Tag = "IF_Outpost_Attacker_09", TargetTag = "Outpost_Farm_02"},
			FigureAttackEntity	{Tag = "IF_Outpost_Attacker_10", TargetTag = "Outpost_Farm_01"},
			FigureAttackEntity	{Tag = "IF_Outpost_Attacker_11", TargetTag = "Outpost_BlackSmith_01"},
			
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_BridgeCrossed"},
		},
		Actions =
		{
			-- DebugMessage	{Caption = "default", Message = "Brdige Crossed"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_OutpostFightStart"},
		},
		Actions =
		{
			FigureAbilityRemove	{Tag = "IF_Outpost_Defender_01", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "IF_Outpost_Defender_02", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "IF_Outpost_Defender_03", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "IF_Outpost_Defender_04", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "IF_Outpost_Attacker_01", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "IF_Outpost_Attacker_03", AbilityId = Ability.Immortal },
			
			BuildingAbilityRemove	{Tag = "Outpost_Farm_01", AbilityId = Ability.Immortal },
			BuildingAbilityRemove	{Tag = "Outpost_Farm_02", AbilityId = Ability.Immortal },
			BuildingAbilityRemove	{Tag = "Outpost_BlackSmith_01", AbilityId = Ability.Immortal },
			
			MapTimerStart {Name = "mt_BuildingDestroyTimer"},
		},
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_BuildingDestroyTimer", Seconds = 2},
			
		},
		Actions =
		{
			BuildingDestroy	{Tag = "Outpost_Farm_02"},
			
			FigureAbilityRemove	{Tag = "IF_Outpost_Attacker_08", AbilityId = Ability.Immortal },
			
			FigureKill	{Tag = "IF_Outpost_Attacker_03"},
			FigureKill	{Tag = "IF_Outpost_Attacker_01"},
			FigureKill	{Tag = "IF_Outpost_Defender_03"},
			
		},
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_BuildingDestroyTimer", Seconds = 4},
		},
		Actions =
		{
			BuildingDestroy	{Tag = "Outpost_Farm_01"},
			FigureAbilityRemove	{Tag = "IF_Outpost_Attacker_02", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "IF_Outpost_Attacker_04", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "IF_Outpost_Attacker_07", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "IF_Outpost_Attacker_10", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "IF_Outpost_Attacker_11", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "IF_Outpost_Attacker_09", AbilityId = Ability.Immortal },
			BuildingAbilityRemove	{Tag = "Outpost_Tower_01", AbilityId = Ability.Immortal },
			BuildingAbilityRemove	{Tag = "Outpost_Tower_02", AbilityId = Ability.Immortal },
			FigureKill	{Tag = "IF_Outpost_Defender_01"},
			FigureKill	{Tag = "IF_Outpost_Defender_04"},
			FigureKill	{Tag = "IF_Outpost_Attacker_08"},
			FigureKill	{Tag = "IF_Outpost_Attacker_07"},
		},
	},

OnOneTimeEvent	
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_BuildingDestroyTimer", Seconds = 6},
		},
		Actions =
		{
			BuildingDestroy	{Tag = "Outpost_BlackSmith_01"},
			FigureKill	{Tag = "IF_Outpost_Defender_02"},
		},
	},

	OnOneTimeEvent	
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_BuildingDestroyTimer", Seconds = 8},
		},
		Actions =
		{
			BuildingDestroy	{Tag = "Outpost_Tower_01"},
		},
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_BuildingDestroyTimer", Seconds = 10},
		},
		Actions =
		{
			BuildingDestroy	{Tag = "Outpost_Tower_02"},
			FigureKill	{Tag = "IF_Outpost_Attacker_02"},
			FigureKill	{Tag = "IF_Outpost_Attacker_11"},
			
			FigureHealthSet	{Tag = "IF_Outpost_Attacker_04", Percent = 10 },
			FigureHealthSet	{Tag = "IF_Outpost_Attacker_09", Percent = 10 },
			FigureHealthSet	{Tag = "IF_Outpost_Attacker_10", Percent = 10 },
			
			FigureRunToEntity	{Tag = "IF_Outpost_Attacker_04", TargetTag = "Iron_Field_Tower_3"},
			FigureRunToEntity	{Tag = "IF_Outpost_Attacker_09", TargetTag = "Iron_Field_Tower_3"},
			FigureRunToEntity	{Tag = "IF_Outpost_Attacker_10", TargetTag = "Iron_Field_Tower_3"},
		},
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_BuildingDestroyTimer", Seconds = 15},
			
		},
		Actions =
		{
			MapTimerStop {Name = "mt_BuildingDestroyTimer"},
			MapFlagSetTrue {Name = "mf_P501_ReachedOutpost"},
		},
	},
	
	----------------------------------------------------
	-- End of Nameless fight for OutPost
	----------------------------------------------------
	
	-- resource mining opens the road
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			OR	
			{
			EntityIsNotExisting	{Tag = "IF_Resource_01"},
		
			},
			
		},
		Actions =
		{
			ObjectVanish	{Tag = "IF_Resource_Wall"},
			ObjectVanish	{Tag = "IF_Road_Blocker_Rock"},
		},
	},
	
	
	-- if the player reached the outpost and opened the skill tree, or equipment, or inventory, the dead bodies, flies effects and blood decals will be removed
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_ReachedOutpost"},
			OR
			{
			DialogSkillTreeIsVisible	{},
			DialogInventoryIsVisible	{},
			DialogSpellBookIsVisible	{}, 
			},
		},
		Actions =
		{
				ObjectVanish	{Tag = "Dead_Guard_01"},
				ObjectVanish	{Tag = "Dead_Guard_02"},
				ObjectVanish	{Tag = "Dead_Guard_03"},
				ObjectVanish	{Tag = "Dead_Guard_04"},
				ObjectVanish	{Tag = "Dead_Guard_05"},
				ObjectVanish	{Tag = "Dead_Guard_06"},
				ObjectVanish	{Tag = "Dead_Guard_07"},
				ObjectVanish	{Tag = "Dead_Guard_08"},
				ObjectVanish	{Tag = "Dead_Guard_09"},
				ObjectVanish	{Tag = "Dead_Guard_10"},
				ObjectVanish	{Tag = "Dead_Guard_11"},
				ObjectVanish	{Tag = "Dead_Guard_12"},
				ObjectVanish	{Tag = "Dead_Guard_13"},
				ObjectVanish  {Tag = "IF_Outpost_flies_effect_01"},
				ObjectVanish  {Tag = "IF_Outpost_flies_effect_02"},
				ObjectVanish  {Tag = "IF_Outpost_flies_effect_03"},
				ObjectVanish  {Tag = "IF_Outpost_flies_effect_04"},
				ObjectVanish  {Tag = "IF_Outpost_flies_effect_05"},
				ObjectVanish  {Tag = "IF_Outpost_flies_effect_06"},
				ObjectVanish  {Tag = "IF_Outpost_flies_effect_07"},
				ObjectVanish  {Tag = "IF_Outpost_flies_effect_08"},
				ObjectVanish  {Tag = "IF_Decal_Blood_01"},
				ObjectVanish  {Tag = "IF_Decal_Blood_02"},
				ObjectVanish  {Tag = "IF_Decal_Blood_03"},
				ObjectVanish  {Tag = "IF_Decal_Blood_04"},
				ObjectVanish  {Tag = "IF_Decal_Blood_05"},
				ObjectVanish  {Tag = "IF_Decal_Blood_06"},
				ObjectVanish  {Tag = "IF_Decal_Blood_07"},
				ObjectVanish  {Tag = "IF_Decal_Blood_08"},
				ObjectVanish  {Tag = "IF_Decal_Blood_09"},
				ObjectVanish  {Tag = "IF_Decal_Blood_10"},
				ObjectVanish  {Tag = "IF_Decal_Blood_11"},
				ObjectVanish  {Tag = "IF_Decal_Blood_12"},
				ObjectVanish  {Tag = "IF_Decal_Blood_13"},
				ObjectVanish  {Tag = "IF_Decal_Blood_14"},
				ObjectVanish  {Tag = "IF_Decal_Blood_15"},
				ObjectVanish  {Tag = "IF_Decal_Blood_16"},
				ObjectVanish  {Tag = "IF_Decal_Blood_17"},
				ObjectVanish  {Tag = "IF_Decal_Blood_18"},
				ObjectVanish  {Tag = "IF_Decal_Dirt_01"},
				ObjectVanish  {Tag = "IF_Decal_Dirt_02"},
				ObjectVanish  {Tag = "IF_Decal_Dirt_03"},
				ObjectVanish  {Tag = "IF_Decal_Dirt_04"},
				ObjectVanish  {Tag = "IF_Outpost_OldSword"},
				ObjectVanish  {Tag = "IF_Outpost_RealmSword"},
				
		},
	},
	
	-- if the Outpost quest actived -> resource added
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "IF_SUPPLY_POST"},
		},
		Actions =
		{
			PlayerResourceLenyaGive {Amount = 300},
			PlayerResourceSilverGive {Amount = 300},
			PlayerResourceStoneGive {Amount = 300},		
			PlayerKitTransfer	{PlayerKit = "pk_GiveTutorialHQ"},	
			FigureTeleport	{Tag = "merchant_outpost_1", X = 491 , Y = 564},
			FigureWalk	{Tag = "merchant_outpost_1", X = 518 , Y = 424},
			MapFlagSetTrue	{Name = "mf_P501_MerchantStarted"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			
			MapFlagIsTrue	{Name = "mf_P501_MerchantStarted"},
			FigureIsIdle	{Tag = "merchant_outpost_1"},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "merchant_outpost_1", Team = "tm_Team1"},
			FigureDirectionSet	{Tag = "merchant_outpost_1", Direction = 230},
			MapFlagSetTrue	{Name = "mf_P501_MerchantShopOpenOutCry"},
			
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P501_MerchantShopOpenOutCry"},
			OR
			{
			FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = "merchant_outpost_1", Range = 10},
			FigureIsInRangeToEntity {Tag = "pl_HumanHeroAntara", TargetTag = "merchant_outpost_1", Range = 10},
			},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "Outpost_Merchant1", Tag = "merchant_outpost_1"},
			MapFlagSetFalse	{Name = "mf_P501_MerchantShopOpenOutCry"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureHasNotHealth	{Tag = "merchant_outpost_1", Percent = 40 },
		},
		Actions =
		{
			FigureRun	{Tag = "merchant_outpost_1", X = 630, Y = 413},
			MapFlagSetTrue	{Name = "mf_P501_MerchantIsFlee"},
			MapFlagSetFalse	{Name = "mf_P501_MerchantShopOpenOutCry"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P501_MerchantIsFlee"},
			FigureIsInRange	{Tag = "merchant_outpost_1", Range = 10, X = 630, Y = 413},
		},
		Actions =
		{
			FigureVanish	{Tag = "merchant_outpost_1"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			BuildingIsDead {Tag = "Iron_Field_SoulFarm_1"},
			BuildingIsDead {Tag = "Iron_Fields_HQ"},
			BuildingIsDead {Tag = "Iron_Field_Alchemist_1"},
			BuildingIsDead {Tag = "Iron_Field_Smeltery_1"},
			BuildingIsDead {Tag = "Iron_Field_Tower_1"},
			BuildingIsDead {Tag = "Iron_Field_Tower_2"},
			BuildingIsDead {Tag = "Iron_Field_Tower_3"},
			FigureIsDead{Tag = "IF_Soul_Screamer"},
			FigureIsNotInCombat {Tag = "pl_HumanAvatar"},
			FigureIsNotInCombat {Tag = "pl_HumanHeroAntara"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P501_BaseDestroyed"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				FigureIsDead	{Tag = "IF_FireElementals_01"},
				FigureIsDead	{Tag = "IF_FireElementals_02"},
			},
			
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P501_JourneystoneReinf_Start"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved {Quest = "IF_SUPPLY_POST"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P501_InvasionDialogTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_P501_InvasionDialogTimer", Seconds = 8},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P501_InvasionDialogTimer"},
			MapFlagSetTrue {Name = "mf_P501_InvasionDialogStarting"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_InvasionDialogStarting"},
			FigureIsAlive {Tag = "pl_HumanHeroAntara"},
			FigureIsAlive {Tag = "pl_HumanAvatar"},
			FigureIsNotInCombat	{Tag = "pl_HumanHeroAntara"},
			FigureIsNotInCombat	{Tag = "pl_HumanAvatar"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P501_AntaraInvasion"},
			DialogSetEnabled {Tag = "pl_HumanHeroAntara"},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 534, Y = 425},
			FigureTeleport	{Tag = "pl_HumanHeroAntara", X = 534, Y = 421},
			DialogBegin	{Player = "default", Tag = "pl_HumanHeroAntara"},
			
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_TalkCompleteAntaraInvasion"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P501_WaveStarter2"},
			MapTimerStart	{Name = "mt_P501_FirstWaveStartDelay"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P501_FirstWaveStartDelay", Seconds = 30},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P501_WaveStarter1"},
			MapTimerStop	{Name = "mt_P501_FirstWaveStartDelay"},
		},
	},
			
	OnOneTimeEvent
	{
		Conditions = 
		{
			BuildingIsDead {Tag = "Iron_Field_Tower_3"},
			FigureIsDead {Tag = "outpost_npc_01"},
			FigureIsDead {Tag = "outpost_npc_02"},
			FigureIsDead {Tag = "outpost_npc_03"},
			FigureIsDead {Tag = "outpost_npc_04"},
			FigureIsDead {Tag = "outpost_npc_05"},
			FigureIsDead {Tag = "outpost_npc_06"},
			FigureIsDead {Tag = "outpost_npc_07"},
			FigureIsDead {Tag = "outpost_npc_08"},
			FigureIsAlive {Tag = "pl_HumanHeroAntara"},
			FigureIsAlive {Tag = "pl_HumanAvatar"},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "default", Amount = 2000},
			MapFlagSetTrue {Name = "mf_P501_NewMarker"},
			MapFlagSetTrue {Name = "mf_P501_GateTowerDestroyed"},
			
			FigureOutcry {TextTag = "ComeAntara1", Tag = "pl_HumanHeroAntara"},
			FigureOutcry {TextTag = "ComeAvatar1", Tag = "pl_HumanAvatar"},
			
			AITroupSizeSet	{Player = "pl_Demon", Size = 15},
  	  AIConstructionOffensiveSet	{Player = "pl_Demon", Percent = 30},
  	  AIAttackFrequencySet	{Player = "pl_Demon", Minutes = 3},
  	  AIEnemyAdd	{Player = "pl_Demon", Tag = "tm_Team1"},
  	  AIEnemyAdd	{Player = "pl_Demon", Tag = "pl_Human"},
			
		},
	},
	
	-- enemy attack after gate tower destroy
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_GateTowerDestroyed"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "IF_Retaliator_01", Level = 3 , UnitId = 1664 , X = 460 , Y = 220 , Team = "tm_Team2"},
			FigureNpcSpawn	{Tag = "IF_Retaliator_02", Level = 2 , UnitId = 1681 , X = 458 , Y = 218 , Team = "tm_Team2"},
			FigureNpcSpawn	{Tag = "IF_Retaliator_03", Level = 2 , UnitId = 1681 , X = 456 , Y = 216 , Team = "tm_Team2"},
			FigureNpcSpawn	{Tag = "IF_Retaliator_04", Level = 2 , UnitId = 1681 , X = 454 , Y = 214 , Team = "tm_Team2"},
			FigureNpcSpawn	{Tag = "IF_Retaliator_05", Level = 2 , UnitId = 1681 , X = 452 , Y = 212 , Team = "tm_Team2"},
			
			--FigureForcedRunToEntity	{Tag = "IF_Retialiator_01", TargetTag = "InvasionMarker1"},
			FigureRun	{Tag = "IF_Retaliator_01", X = 345 , Y = 303},
			FigureFollowEntity	{Tag = "IF_Retaliator_02", TargetTag = "IF_Retaliator_01"},
			FigureFollowEntity	{Tag = "IF_Retaliator_03", TargetTag = "IF_Retaliator_01"},
			FigureFollowEntity	{Tag = "IF_Retaliator_04", TargetTag = "IF_Retaliator_01"},
			FigureFollowEntity	{Tag = "IF_Retaliator_05", TargetTag = "IF_Retaliator_01"},
		},
	},
	
	-- invasion stopped, antara dialog enabled
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved {Quest = "IF_STOP_INVASION"},
			-- FigureIsAlive {Tag = "pl_HumanHeroAntara"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_P501_InvasionEndDialogTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_P501_InvasionEndDialogTimer", Seconds = 8},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P501_InvasionEndDialogTimer"},
			MapFlagSetTrue {Name = "mf_P501_InvasionEndDialogStarting"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_InvasionEndDialogStarting"},
			FigureIsAlive {Tag = "pl_HumanHeroAntara"},
			FigureIsAlive {Tag = "pl_HumanAvatar"},
			FigureIsNotInCombat	{Tag = "pl_HumanHeroAntara"},
			FigureIsNotInCombat	{Tag = "pl_HumanAvatar"},
		},
		Actions = 
		{
			BuildingAbilityRemove	{Tag = "Barrier_Tower_05_Level_06", AbilityId = Ability.Immortal},
			BuildingAbilityRemove	{Tag = "Barrier_Tower_04_Level_05", AbilityId = Ability.Immortal},
			BuildingAbilityRemove	{Tag = "Barrier_Tower_03_Level_05", AbilityId = Ability.Immortal},
			BuildingAbilityRemove	{Tag = "Barrier_Tower_02_Level_05", AbilityId = Ability.Immortal},
			BuildingAbilityRemove	{Tag = "Barrier_Tower_01_Level_05", AbilityId = Ability.Immortal},
			MapFlagSetTrue {Name  = "mf_P501_AntaraTowerBlockade"},
			
			DialogSetEnabled {Tag = "pl_HumanHeroAntara"},
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 467, Y = 229},
			FigureTeleport	{Tag = "pl_HumanHeroAntara", X = 467, Y = 225},
			DialogBegin	{Player = "default", Tag = "pl_HumanHeroAntara"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "IF_Soul_Screamer"},
			--FigureIsAlive	{Tag = "pl_HumanAvatar"},
		},
		Actions = 
		{
			NoSpawnEffect{Spawn = FigureNpcSpawnToEntity {Tag = "Nameless", Level = 30, UnitId = 1742, TargetTag = "pl_HumanAvatar", Team = "tm_Neutral"}},
			FigureOutcry {TextTag = "VoiceNameless1", Tag = "Nameless"},
			FigureVanish {Tag = "Nameless"},
			ObjectSpawnToEntity	{ObjectId = 1433, TargetTag = "IF_Soul_Screamer_DEAD", Direction = 0, Tag = "grandmaster_death_bag_new"},
			ObjectLootItemMiscAdd	{Tag = "grandmaster_death_bag_new", DropChance = 100, ItemId = 437},
			FigureVanish {Tag = "IF_Soul_Screamer_DEAD"},
		},
	},
	
	-- monument mage summon kraulers
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureHasNotHealth	{Tag = "IF_Monument_Mage", Percent = 80},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "IF_Krauler_1", Level = 4, UnitId = 1677, X = 159, Y = 302, Team = "tm_Team2"},
			FigureNpcSpawn	{Tag = "IF_Krauler_2", Level = 5, UnitId = 1677, X = 165, Y = 301, Team = "tm_Team2"},
			FigureNpcSpawn	{Tag = "IF_Krauler_3", Level = 4, UnitId = 1677, X = 161, Y = 305, Team = "tm_Team2"},
			FigureNpcSpawn	{Tag = "IF_Krauler_4", Level = 5, UnitId = 1677, X = 166, Y = 305, Team = "tm_Team2"},
			FigureNpcSpawn	{Tag = "IF_Krauler_5", Level = 4, UnitId = 1677, X = 163, Y = 303, Team = "tm_Team2"},
			MapFlagSetTrue {Name = "mf_P501_MageIsAttacked"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P501_MageIsAttacked"},
			OR	
			{
				FigureIsNotInCombat	{Tag = "IF_LionPatrol_01_1"},
				FigureIsNotInCombat	{Tag = "IF_LionPatrol_01_2"},
			},		
		},
		Actions =
		{
			FigureRunToEntity	{Tag = "IF_LionPatrol_01_1", TargetTag = "IF_Monument_Mage"},
			FigureRunToEntity	{Tag = "IF_LionPatrol_01_2", TargetTag = "IF_Monument_Mage"},
		},
	},
	
	-- trolls killed, give catapults to player
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "IF_Troll_01"},
			FigureIsDead {Tag = "IF_Troll_02"},
			FigureIsDead {Tag = "IF_Troll_03"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P501_TrollsDead"},
			PlayerKitTransfer	{PlayerKit = "pk_GiveCatapult"},	
			
			MapTimerStart	{Name = "P501_CaptureInfoTimer"},
			TutorialTaskTextShow	{TextTag = "Tutorial35"},
						
			--PlayerResourceLenyaGive {Amount = 200},
			--PlayerResourceSilverGive {Amount = 600},
			
			
			--FigureTeamTransfer	{Tag = "IF_Catapult_1", Team = "tm_Team1"},
			--FigureTeamTransfer	{Tag = "IF_Catapult_2", Team = "tm_Team1"},
			--FigurePlayerTransfer	{Tag = "IF_Catapult_1" },
			--FigurePlayerTransfer	{Tag = "IF_Catapult_2" },
		},
	},
	
	
OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "P501_CaptureInfoTimer", Seconds = 3},
			
		},
		Actions =
		{
				TutorialTaskSetSolved	{Take = 35},
				MapTimerStop	{Name = "P501_CaptureInfoTimer"},
		},
	},
		
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			BuildingIsDead {Tag = "Barrier_Tower_05_Level_06"},
			BuildingIsDead {Tag = "Barrier_Tower_04_Level_05"},
			BuildingIsDead {Tag = "Barrier_Tower_03_Level_05"},
			BuildingIsDead {Tag = "Barrier_Tower_02_Level_05"},
			BuildingIsDead {Tag = "Barrier_Tower_01_Level_05"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P501_BlockadeDestroyed"},
			MapTimerStart {Name = "mt_P501_Outcry"},
		}
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_P501_Outcry", Seconds = 5},
			MapTimerIsNotElapsed {Name = "mt_P501_Outcry", Seconds = 7},
			MapFlagIsTrue {Name = "mf_P501_BlockadeDestroyed"},
			FigureIsAlive {Tag = "pl_HumanHeroAntara"},
			FigureIsAlive {Tag = "pl_HumanAvatar"},
		},
		Actions =
		{
			FigureOutcry {TextTag = "BlockadeAntara1", Tag = "pl_HumanHeroAntara"},
			FigureOutcry {TextTag = "BlockadeAvatar1", Tag = "pl_HumanAvatar"},			
		}
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_P501_Outcry", Seconds = 16},
			MapFlagIsTrue {Name = "mf_P501_BlockadeDestroyed"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P501_TalkToGarrett"},
			MapTimerStop {Name = "mt_P501_Outcry"},
		},
	},
	
	-- civilians welcomes the player after blockade destroying
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_BlockadeDestroyed"},
			OR
			{
				FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = "Commander_Garret", Range = 50},
				FigureIsInRangeToEntity {Tag = "pl_HumanHeroAntara", TargetTag = "Commander_Garret", Range = 50},
			},			
		},
		Actions = 
		{
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "villager01", Level = 1, UnitId = 1652, X = 324, Y = 652, Team = "tm_Neutral"}, },
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "villager02", Level = 1, UnitId = 1649, X = 404, Y = 607, Team = "tm_Neutral"}, },
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "villager03", Level = 1, UnitId = 1652, X = 375, Y = 593, Team = "tm_Neutral"}, },
			
			FigureRun	{Tag = "villager01", X = 345, Y = 630},
			FigureRun	{Tag = "villager03", X = 348, Y = 628},
			FigureRun	{Tag = "villager02", X = 351, Y = 627},
			
			MapFlagSetTrue {Name = "mf_P501_VillagersSpawned"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			 MapFlagIsTrue {Name = "mf_P501_VillagersSpawned"},
			 FigureIsIdle	{Tag = "villager01"},
		},
		Actions = 
		{
			FigureDirectionSetToEntity	{Tag = "villager01", TargetTag = "Commander_Garret"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			 MapFlagIsTrue {Name = "mf_P501_VillagersSpawned"},
			 FigureIsIdle	{Tag = "villager02"},
		},
		Actions = 
		{
			FigureDirectionSetToEntity	{Tag = "villager02", TargetTag = "Commander_Garret"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			 MapFlagIsTrue {Name = "mf_P501_VillagersSpawned"},
			 FigureIsIdle	{Tag = "villager03"},
		},
		Actions = 
		{
			FigureDirectionSetToEntity	{Tag = "villager03", TargetTag = "Commander_Garret"},
		},
	},
	
	-- when civilian and hero reached Garrett, and other outcry played
	OnOneTimeEvent
	{
		Conditions = 
		{
			 MapFlagIsTrue {Name = "mf_P501_TalkToGarrett"},
				OR
			{
				FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = "Commander_Garret", Range = 15},
				FigureIsInRangeToEntity {Tag = "pl_HumanHeroAntara", TargetTag = "Commander_Garret", Range = 15},
			},	
				OR
			{
				FigureIsInRangeToEntity {Tag = "villager03", TargetTag = "Commander_Garret", Range = 15},
				FigureIsInRangeToEntity {Tag = "villager02", TargetTag = "Commander_Garret", Range = 15},
			},
		},
		Actions = 
		{
			FigureOutcry {TextTag = "Avatar_Welcome1", Tag = "villager01"},
			FigureOutcry {TextTag = "Avatar_Welcome3", Tag = "villager02"},
			FigureOutcry {TextTag = "Avatar_Welcome4", Tag = "villager03"},
			MapTimerStart {Name = "mt_P501_WelcomeOutcries"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_P501_WelcomeOutcries", Seconds = 13},
		},
		Actions = 
		{
			MapTimerStop {Name = "mt_P501_WelcomeOutcries"},
			DialogSetEnabled {Tag = "Commander_Garret"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "IF_SALVATION"},
			OR 
			{
				FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = "Map_Start_Point", Range = 15},
				FigureIsInRangeToEntity {Tag = "pl_HumanHeroAntara", TargetTag = "Map_Start_Point", Range = 15},
			},
		},
		Actions = 
		{
			MapTimerStart {Name = "mt_P501_SalvationCSTimer"},
			--MapFlagSetTrue {Name = "mf_P501_StartSalvationCS"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P501_SalvationCSTimer", Seconds = 4},
		},
		Actions = 
		{
			MapTimerStop {Name = "mt_P501_SalvationCSTimer"},
			MapFlagSetTrue {Name = "mf_P501_StartSalvationCS"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P501_EndSalvationCS"},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "default", Amount = 4000},
		},
	},
	
		
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P501_SurianOnMap"},
		},
		Actions = 
		{
			DialogSetEnabled {Tag = "Surian"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "IF_ASCHOLAR"},
			MapFlagIsTrue {Name = "mf_P501_TwiddleOnMap"},
			MapTimerIsElapsed {Name = "mt_P501_TwiddleOnMapTimer", Seconds = 3},
		},
		Actions =
		{
			DialogSetEnabled {Tag = "Twiddle"},
		},
	},

	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 438, Amount = 1},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Useful_Thing1", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 439, Amount = 1},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Useful_Thing1", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 440, Amount = 1},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Useful_Thing1", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 441, Amount = 1},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Useful_Thing1", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "IF_FLINK"},
			AvatarHasItemMisc	{Player = "default", ItemId = 438, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 439, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 440, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 441, Amount = 1},			
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P501_FlinkDealDone"},		
			DialogSetEnabled {Tag = "Grunt"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "IF_LOSTHEIR"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P501_StartWithSymon"},		
			DialogSetEnabled {Tag = "Symon"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_StartFightWithSymon"},		

		},
		Actions =
		{			
			FigureTeamTransfer {Tag = "Symon", Team = "tm_Team2"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_StartFightWithSymon"},		
			FigureHasNotHealth	{Tag = "Symon", Percent = 30},
		},
		Actions =
		{	
			FigureStop {Tag = "pl_HumanAvatar"},
			FigureStop {Tag = "pl_HumanHeroAntara"},
			FigureAbilityAdd {Tag = "Symon", AbilityId = Ability.Immortal },
			FigureTeamTransfer {Tag = "Symon", Team = "tm_Neutral"},		
			MapFlagSetTrue {Name = "mf_P501_SymonDefeated"},		
			DialogSetEnabled {Tag = "Symon"},
		},
	},		
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_StartFightWithSymon"},
			MapFlagIsTrue {Name = "mf_P501_KillSymon"},
		},
		Actions =
		{	
			FigureAbilityRemove {Tag = "Symon", AbilityId = Ability.Immortal },
			FigureTeamTransfer {Tag = "Symon", Team = "tm_Team2"},
		},
	},	
		
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved {Quest = "IF_LOSTHEIR"},
		},
		Actions =
		{	
			MapFlagSetTrue {Name = "mf_P501_BackToElle"},
			DialogSetEnabled {Tag = "EllacruVilde" },
		},
	},	
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_BackToElleKillHer"},
		},
		Actions =
		{	
			AvatarItemMiscTake	{Player = "default", ItemId = 442, Amount = 1},
			AvatarGoldGive	{Player = "default", Amount = 100},
			FigureTeamTransfer {Tag = "EllacruVilde", Team = "tm_Team2"},		
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "IF_AUNTELLE"},
			FigureIsDead {Tag = "EllacruVilde"},
			FigureIsDead {Tag = "Spawn1"},
			FigureIsDead {Tag = "Spawn2"},
		},
		Actions =
		{	
			FigureTeleport {Tag = "Symon", X = 179.925, Y = 632.155},
			FigureForcedRunToEntity {Tag = "Symon", TargetTag = "sq_Aunt_Ella"},
			MapFlagSetTrue {Name = "mf_P501_BackToElleKilledElle"},
			DialogSetEnabled {Tag = "Symon"},
		},
	},		
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "IF_AUNTELLE"},
		},
		Actions =
		{	
			FigureForcedWalkToEntity {Tag = "EllacruVilde", TargetTag = "sq_Aunt_Ella"},
		},
	},		
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "IF_DEMIRA"},
		},
		Actions =
		{	
			DialogSetEnabled {Tag = "Demira"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "IF_TEFLIS"},
		},
		Actions =
		{	
			DialogSetEnabled {Tag = "Teflis"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_RefuseDemira"},
		},
		Actions =
		{	
			FigureTeamTransfer {Tag = "Demira", Team = "tm_Team2"},		
			FigureTeamTransfer {Tag = "Jorgan", Team = "tm_Team2"},		
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "Demira"},
			FigureIsDead {Tag = "Jorgan"},
		},
		Actions =
		{	
			AvatarXPGive	{Player = "default", Amount = 2900},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_ChestDealWithSymon"},
		},
		Actions =
		{	
			DialogSetEnabled {Tag = "Symons_Chest"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			--QuestIsSolved {Quest = "IF_DEMIRA"},
			MapFlagIsTrue {Name = "mf_P501_SympathiseDemira"},
		},
		Actions =
		{	
			AvatarXPGive	{Player = "default", Amount = 3500},
			AvatarItemMiscGive	{Player = "default", ItemId = 443, Amount = 1},
			AvatarItemEquipmentGive	{Player = "default", ItemId = 1266, Amount = 1},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			--QuestIsSolved {Quest = "IF_DEMIRA"},
			MapFlagIsTrue {Name = "mf_P501_BribeDemira"},
		},
		Actions =
		{	
			AvatarXPGive	{Player = "default", Amount = 3000},
			AvatarGoldGive	{Player = "default", Amount = 50},
			AvatarItemMiscGive	{Player = "default", ItemId = 443, Amount = 1},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "IF_SALVATION"},
		},
		Actions = 
		{
			--ObjectSpawn	{ObjectId = 1930, X = 87.5608, Y = 632.357, Direction = 0, Tag = "Twiddle_Machine"},
			--ObjectSpawn	{ObjectId = 1451, X = 94.4306, Y = 632.98, Direction = 0, Tag = "Twiddle_Machine_01"},
			--ObjectSpawn	{ObjectId = 1452, X = 89.5886, Y = 639.056, Direction = 639.056, Tag = "Twiddle_Machine_02"},
			--ObjectSpawn	{ObjectId = 1449, X = 80.6554, Y = 640.839 Direction = 90, Tag = "Twiddle_Machine_03"},
			--ObjectSpawn	{ObjectId = 1504, X = 94.5231, Y = 634.383, Direction = 270, Tag = "Pipe_01"},
			--ObjectSpawn	{ObjectId = 1504, X = 94.5368, Y = 635.749, Direction = 270, Tag = "Pipe_02"},
			--ObjectSpawn	{ObjectId = 1505, X = 94.6005, Y = 637.278, Direction = 270, Tag = "Pipe_03"},
			--ObjectSpawn	{ObjectId = 1506, X = 93.2322, Y = 638.7, Direction = 0, Tag = "Pipe_04"},
			--ObjectSpawn	{ObjectId = 1504, X = 90.1832, Y = 638.736, Direction = 270, Tag = "Pipe_05"},
			--ObjectSpawn	{ObjectId = 1505, X = 90.17, Y = 640.132, Direction = 270, Tag = "Pipe_06"},
			--ObjectSpawn	{ObjectId = 1506, X = 86.1333, Y = 641.793, Direction = 174.27, Tag = "Pipe_07"},
			--ObjectSpawn	{ObjectId = 1505, X = 86.4512, Y = 641.761, Direction = 0, Tag = "Pipe_08"},
			--ObjectSpawn	{ObjectId = 1504, X = 81.6876, Y = 637.405, Direction = 90, Tag = "Pipe_09"},
			--ObjectSpawn	{ObjectId = 1505, X = 81.6818, Y = 635.999, Direction = 270, Tag = "Pipe_10"},
			--ObjectSpawn	{ObjectId = 1504, X = 94.5368, Y = 635.749, Direction = 270, Tag = "Pipe_02"},
			--ObjectSpawn	{ObjectId = 1504, X = 94.5368, Y = 635.749, Direction = 270, Tag = "Pipe_02"},
			
		},		
	},
		
	
	--Surian Start	

	OnEvent
	{
		EventName = "PostMapTravelSurianDisable",
		Conditions = 
		{
			SurianIsNotWithAvatar{},
			MapFlagIsTrue {Name = "mf_MapChangeDetected"},
		},
		Actions = 
		{
			AvatarValueSet	{Player = "pl_Human", Name = "av_P501_OnDragon", Value = 0 },
			MapFlagSetFalse {Name = "mf_MapChangeDetected"},
			FigureVanish	{Tag = "Surian"},
			MapFlagSetTrue	{Name = "mf_P501_Surian"},
			DragonCallDisable {},
			--DragonCallEnable {},
		},
		GotoState = self,
	};
	
	OnEvent
	{
		EventName = "PostMapTravelSurianEnable",
		Conditions = 
		{
			SurianIsWithAvatar{},
			MapFlagIsTrue {Name = "mf_MapChangeDetected"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_MapChangeDetected"},
			AvatarValueSet	{Player = "pl_Human", Name = "av_P501_OnDragon", Value = 0 },
			MapFlagSetTrue	{Name = "mf_P501_Surian"},
			FigureVanish	{Tag = "Surian"},
			NoSpawnEffect	{Spawn = FigureNpcSpawnToEntity	{Tag = "Surian", Level = 18 , UnitId = 1689 , TargetTag = "pl_HumanAvatar", Team = "tm_Team1"}, },
			FigurePlayerTransfer	{Tag = "Surian" },
			DragonCallEnable {},
		},
		GotoState = self,
	};
	

	OnEvent
	{
		EventName = "One",
		Conditions = 
		{
			SurianIsWithAvatar{},
			AvatarValueIsEqual	{Player = "pl_Human", Name = "av_P501_OnDragon", Value = 1 },
			MapFlagIsTrue	{Name = "mf_P501_Surian"},
		--	AvatarValueIsEqual	{ Name = "av_P501_OnDragon", Value = 1 },
		},
		Actions = 
		{
			FigureVanish	{Tag = "Surian"},
			MapFlagSetFalse	{Name = "mf_P501_Surian"},
		},
		GotoState = self,
	};


OnEvent
	{
		EventName = "Second",
		Conditions = 
		{
			SurianIsWithAvatar{},
			AvatarValueIsEqual	{Player = "pl_Human", Name = "av_P501_OnDragon", Value = 0 },
			FigureIsDead	{Tag = "Surian"},
			MapFlagIsFalse	{Name = "mf_P501_Surian"},			
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P501_Surian"},
			NoSpawnEffect	{Spawn = FigureNpcSpawnToEntity	{Tag = "Surian", Level = 18 , UnitId = 1689 , TargetTag = "pl_HumanAvatar", Team = "tm_Team1"}, },
			FigurePlayerTransfer	{Tag = "Surian" },
		},
		GotoState = self,
	};
	
OnOneTimeEvent
	{		
		Conditions = 
		{
			SurianIsWithAvatar{},
			FigureIsDead	{Tag = "Surian"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarValueIsEqual	{Name = "av_P501_OnDragon", Value = 0 },
			MapFlagIsTrue	{Name = "mf_P501_Surian"},
		},
		Actions = 
		{			
			PlayerGameOver	{Tag = "default", LocaTag = "default"},		
		},
	};
	
	--Surian End	

	--Map end, scholar quest unsolvable
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P501_MapExitTimer", Seconds = 0.1},
			QuestIsActive {Quest = "IF_ASCHOLAR"},
		},
		Actions = 
		{
			QuestSetUnsolvable	{Player = "default", Quest = "IF_ASCHOLAR"},
			
		},
	},
	
	
	--Map end, video an travel
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P501_MapExitTimer", Seconds = 0.2},
		},
		Actions = 
		{
			
			FigureVanish {Tag = "Twiddle"},
			FigureVanish {Tag = "Surian"},
			MapFlagSetTrue {Name = "mf_P501_MapTravelledOnce"},
			CutscenePlayBinkVideo {File = "addon2/Video/middle_1.bik"},	
			MapFlagSetTrue	{Name = "mf_P501_EndVideoPlayed"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P501_MapExitTimer", Seconds = 0.5},	
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P501_MapExitTimer"},
			PlayerMapTravelAddon2	{Map = "Campaign/P502_Malangar_Greens", TargetTag = "start"},	
		},
	},
	
};







