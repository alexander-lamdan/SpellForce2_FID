State
{
	StateName = "INIT",
	-- Starten der MapQuesten
	

	
	OnOneTimeEvent
	{
		Conditions =
		{
			--MapFlagIsTrue {Name = "mf_P501_StartTutorialQuest"},			
		},
		Actions =		
		{		
		
			AvatarValueSet	{Player = "pl_Human", Name = "av_P502_OnDragon", Value = 0 },
			AvatarValueSet	{ Name = "av_P502_PrismWave", Value = 0 },
			MapFlagSetTrue	{Name = "mf_P502_Surian"},
			MapFlagSetFalse	{Name = "mf_P502_SurianAdded"},			
			MapValueSet	{Name = "mv_p502_GraveOpen", Value = 0  },
			MapValueSet	{Name = "mv_p502_MirrorPhase", Value = 0  },
			MapValueRandomize	{Name = "mv_p502_GraveWithTD2", MinValue = 1, MaxValue = 5},
			MapValueRandomize	{Name = "mv_p502_GraveWithTD2", MinValue = 1, MaxValue = 5},
			MapValueRandomize	{Name = "mv_p502_GraveWithTD2", MinValue = 1, MaxValue = 5},
			FigureTeamTransfer { Tag = "MG_human_prisoner_01", Team = "tm_Neutral"},
			FigureTeamTransfer { Tag = "MG_human_prisoner_02", Team = "tm_Neutral"},
			FigureTeamTransfer { Tag = "MG_human_prisoner_03", Team = "tm_Neutral"},
			FigureTeamTransfer { Tag = "MG_human_prisoner_04", Team = "tm_Neutral"},
			FigureTeamTransfer { Tag = "MG_human_prisoner_05", Team = "tm_Neutral"},
			FigureAbilityAdd	{Tag = "MG_human_prisoner_01", AbilityId =Ability.Immortal },
			FigureAbilityAdd	{Tag = "MG_human_prisoner_02", AbilityId =Ability.Immortal },
			FigureAbilityAdd	{Tag = "MG_human_prisoner_03", AbilityId =Ability.Immortal },
			FigureAbilityAdd	{Tag = "MG_human_prisoner_04", AbilityId =Ability.Immortal },
			FigureAbilityAdd	{Tag = "MG_human_prisoner_05", AbilityId =Ability.Immortal },
			
			MapFlagSetFalse	{Name = "mf_P502_AttackOnElfStarted"},
			MapFlagSetFalse	{Name = "mf_P502_TD3complete"},
			MapFlagSetFalse	{Name = "mf_P502_AttackElfCamp"},
			MapFlagSetFalse	{Name = "mf_P502_TD2complete"},
			MapFlagSetFalse	{Name = "mf_P502_TD1complete"},
			MapFlagSetTrue	{Name = "mf_P502_WaveIsReady"},
			MapFlagSetTrue	{Name = "mf_P502_VillageWaveIsReady"},
			
			FigureAbilityAdd	{Tag = "MG_Sariel", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "MG_Caine", AbilityId = Ability.Immortal },
			DialogSetDisabled	{Tag = "HeroPTwiddle"},
			DialogSetDisabled	{Tag = "pk_start"},
			DialogSetDisabled	{Tag = "pl_HumanHeroPTwiddle"},
			
		
			
			FigureAbilityAdd	{Tag = "Druid", AbilityId = Ability.Immortal },			
			
			FigureNpcSpawn	{Tag = "a1", Level =10 , UnitId =1758 , X = 453 , Y = 673 , Team = "tm_Team1"},			
			FigureNpcSpawn	{Tag = "a2", Level =10 , UnitId =1758 , X = 453 , Y = 673 , Team = "tm_Team1"},
			FigureNpcSpawn	{Tag = "a3", Level =10 , UnitId =1758 , X = 453 , Y = 673 , Team = "tm_Team1"},
			FigureNpcSpawn	{Tag = "a4", Level =10 , UnitId =1758 , X = 453 , Y = 673 , Team = "tm_Team1"},
			FigureNpcSpawn	{Tag = "a5", Level =10 , UnitId =1758 , X = 453 , Y = 673 , Team = "tm_Team1"},
			FigureNpcSpawn	{Tag = "a6", Level =10 , UnitId =1758 , X = 453 , Y = 673 , Team = "tm_Team1"},
			
			FigureNpcSpawn	{Tag = "a7", Level =10 , UnitId =1758 , X = 454 , Y = 658 , Team = "tm_Team1"},
			FigureNpcSpawn	{Tag = "a8", Level =10 , UnitId =1758 , X = 454 , Y = 658 , Team = "tm_Team1"},
			FigureNpcSpawn	{Tag = "a9", Level =10 , UnitId =1758 , X = 454 , Y = 658 , Team = "tm_Team1"},
			FigureNpcSpawn	{Tag = "a10", Level =10 , UnitId =1758 , X = 454 , Y = 658 , Team = "tm_Team1"},
			FigureNpcSpawn	{Tag = "a11", Level =10 , UnitId =1758 , X = 454 , Y = 658 , Team = "tm_Team1"},
			FigureNpcSpawn	{Tag = "a12", Level =10 , UnitId =1758 , X = 454 , Y = 658 , Team = "tm_Team1"},
			
			FigureNpcSpawn	{Tag = "a13", Level =10 , UnitId =1758 , X = 460 , Y = 647 , Team = "tm_Team1"},
			FigureNpcSpawn	{Tag = "a14", Level =10 , UnitId =1758 , X = 460 , Y = 647 , Team = "tm_Team1"},			
			FigureNpcSpawn	{Tag = "a15", Level =10 , UnitId =1758 , X = 460 , Y = 647 , Team = "tm_Team1"},
			FigureNpcSpawn	{Tag = "a16", Level =10 , UnitId =1758 , X = 460 , Y = 647 , Team = "tm_Team1"},
			FigureNpcSpawn	{Tag = "a17", Level =10 , UnitId =1758 , X = 460 , Y = 647 , Team = "tm_Team1"},
			FigureNpcSpawn	{Tag = "a18", Level =10 , UnitId =1758 , X = 460 , Y = 647 , Team = "tm_Team1"},
			
			FigureNpcSpawn	{Tag = "a19", Level =10 , UnitId =1758 , X = 462 , Y = 639 , Team = "tm_Team1"},
			FigureNpcSpawn	{Tag = "a20", Level =10 , UnitId =1758 , X = 462 , Y = 639 , Team = "tm_Team1"},			
			FigureNpcSpawn	{Tag = "a21", Level =10 , UnitId =1758 , X = 462 , Y = 639 , Team = "tm_Team1"},			
			FigureNpcSpawn	{Tag = "a22", Level =10 , UnitId =1758 , X = 462 , Y = 639 , Team = "tm_Team1"},
			FigureNpcSpawn	{Tag = "a23", Level =10 , UnitId =1758 , X = 462 , Y = 639 , Team = "tm_Team1"},
			FigureNpcSpawn	{Tag = "a24", Level =10 , UnitId =1758 , X = 462 , Y = 639 , Team = "tm_Team1"},
			
			FigureNpcSpawn	{Tag = "a25", Level =10 , UnitId =1758 , X = 467 , Y = 663 , Team = "tm_Team1"},
			FigureNpcSpawn	{Tag = "a26", Level =10 , UnitId =1758 , X = 467 , Y = 663 , Team = "tm_Team1"},
			FigureNpcSpawn	{Tag = "a27", Level =10 , UnitId =1758 , X = 467 , Y = 663 , Team = "tm_Team1"},
			FigureNpcSpawn	{Tag = "a28", Level =10 , UnitId =1758 , X = 467 , Y = 663 , Team = "tm_Team1"},
			FigureNpcSpawn	{Tag = "a29", Level =10 , UnitId =1758 , X = 467 , Y = 663 , Team = "tm_Team1"},
			FigureNpcSpawn	{Tag = "a30", Level =10 , UnitId =1758 , X = 467 , Y = 663 , Team = "tm_Team1"},
			
			
		--	FigureRoamingEnable	{Tag = "a1"},
		--	FigureRoamingEnable	{Tag = "a2"},
		--	FigureRoamingEnable	{Tag = "a3"},
		--	FigureRoamingEnable	{Tag = "a4"},
		--	FigureRoamingEnable	{Tag = "a5"},
		--	FigureRoamingEnable	{Tag = "a6"},
		--	FigureRoamingEnable	{Tag = "a7"},
		--	FigureRoamingEnable	{Tag = "a8"},
		--	FigureRoamingEnable	{Tag = "a9"},
		--	FigureRoamingEnable	{Tag = "a10"},
		--	FigureRoamingEnable	{Tag = "a11"},
		--	FigureRoamingEnable	{Tag = "a12"},
		--	FigureRoamingEnable	{Tag = "a13"},
		--	FigureRoamingEnable	{Tag = "a14"},
			
		--	FigureRoamingEnable	{Tag = "a15"},
		--	FigureRoamingEnable	{Tag = "a16"},
		--	FigureRoamingEnable	{Tag = "a17"},
		--	FigureRoamingEnable	{Tag = "a18"},
		--	FigureRoamingEnable	{Tag = "a19"},
		--	FigureRoamingEnable	{Tag = "a20"},
		--	FigureRoamingEnable	{Tag = "a21"},
		--	FigureRoamingEnable	{Tag = "a22"},
		--	FigureRoamingEnable	{Tag = "a23"},
		--	FigureRoamingEnable	{Tag = "a24"},
		--	FigureRoamingEnable	{Tag = "a25"},
		--	FigureRoamingEnable	{Tag = "a26"},
		--	FigureRoamingEnable	{Tag = "a27"},
		--	FigureRoamingEnable	{Tag = "a28"},
		--	FigureRoamingEnable	{Tag = "a29"},
		--	FigureRoamingEnable	{Tag = "a30"},
			
			
			
			DialogSetDisabled	{Tag = "grave_Dialogue_02"},			
			DialogSetDisabled	{Tag = "grave_Dialogue_03"},			
			DialogSetDisabled	{Tag = "grave_Dialogue_04"},			
			DialogSetDisabled	{Tag = "grave_Dialogue_05"},
			
			--MapFlagSetTrue	{Name = "mf_P502_StartInvisibleCutscene"},
			MapFlagSetTrue	{Name = "mf_P502_FirstTimeDialog"},
			--FigureTeleportToEntity	{Tag = "Twiddle", TargetTag = "Io"},
			
			FigureVanish	{Tag = "Io_AttackWave01"},
			FigureVanish	{Tag = "Io_AttackWave02"},
			FigureVanish	{Tag = "Io_AttackWave03"},
			FigureVanish	{Tag = "Io_AttackWave04"},
			FigureVanish	{Tag = "Io_AttackWave05"},
			
			FigureVanish	{Tag = "Io_AttackWave06"},
			FigureVanish	{Tag = "Io_AttackWave07"},
			FigureVanish	{Tag = "Io_AttackWave08"},
			FigureVanish	{Tag = "Io_AttackWave09"},
			FigureVanish	{Tag = "Io_AttackWave10"},
			
			FigureVanish	{Tag = "Villager_AttackWave01"},
			FigureVanish	{Tag = "Villager_AttackWave02"},
			FigureVanish	{Tag = "Villager_AttackWave03"},
			FigureVanish	{Tag = "Villager_AttackWave04"},
			FigureVanish	{Tag = "Villager_AttackWave05"},
			
			FigureVanish	{Tag = "Villager_AttackWave06"},
			FigureVanish	{Tag = "Villager_AttackWave07"},
			FigureVanish	{Tag = "Villager_AttackWave08"},
			FigureVanish	{Tag = "Villager_AttackWave09"},
			FigureVanish	{Tag = "Villager_AttackWave10"},
			MapFlagSetTrue	{Name = "mf_P502_FirstTimeHirin"},
			GateSetClosed	{Tag = "Necropolis_Gate"},
			
			FigureVanish	{Tag = "Hirin"},
			
			MapFigureLevelSet {},
			
			MapFlagSetFalse {Name = "mf_P502_Guardian"},
			FigureVanish	{Tag = "Necropolis_Gardian_01"},
			FigureVanish	{Tag = "Necropolis_Gardian_02"},
			FigureVanish	{Tag = "Necropolis_Gardian_03"},
			FigureVanish	{Tag = "Necropolis_Gardian_04"},
			FigureVanish	{Tag = "Necropolis_Gardian_05"},
			FigureVanish	{Tag = "Necropolis_Gardian_06"},
			FigureVanish	{Tag = "Necropolis_Gardian_07"},

			AvatarValueSet	{Name = "av_P502_MosaicOfDeath", Value = 6},

		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			GameIsUnBlocked{},
		},
		Actions =		
		{				
			MapFlagSetTrue	{Name = "mf_P502_StartMapEntryCS"},	
			PlayerHeroAdd	{ HeroId = 189 },
			FigureHeroSpawnToEntity	{ Tag = "HeroAntara", TargetTag = "pl_HumanAvatar", Direction = 0},
			PlayerHeroAdd	{ HeroId = 183},
			FigureHeroSpawnToEntity	{ Tag = "HeroPTwiddle", TargetTag = "pl_HumanAvatar", Direction = 0},
			MapFlagSetTrue	{Name = "mf_P502_StartCaineSarielCS"},
		},
	},

	--After caine and sariel cutscene 
	OnOneTimeEvent
	{		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_EndCaineSarielCS"},
		},
		Actions = 
		{			
			PlayerHeroAdd	{ HeroId = 182},
			FigureHeroSpawnToEntity	{ Tag = "HeroCaine", TargetTag = "pl_HumanAvatar", Direction = 0},
			PlayerHeroAdd	{ HeroId = 188},
			FigureHeroSpawnToEntity	{ Tag = "HeroSariel", TargetTag = "pl_HumanAvatar", Direction = 0},
			MapTimerStart	{Name = "mt_P502_Outcry"},	
		},
	};	
		
	--For Cutscene of necropolis
	OnOneTimeEvent
	{		
		Conditions = 
		{		
			MapFlagIsTrue {Name = "mf_P502_FinalGraveOpened"},
			FigureIsDead	{Tag = "grave5_01"},
			FigureIsDead	{Tag = "grave5_02"},
		},
		Actions = 
		{
			AvatarItemMiscGive	{ ItemId = 419 , Amount = 1 },
		},
	};
	OnOneTimeEvent
	{		
		Conditions = 
		{		
			MapFlagIsTrue	{Name = "mf_P502_RitesofCleansingComplete"},			
			QuestIsSolved	{ Quest = "MG_COMPENSATOR"},
		},
		Actions = 
		{
			MapTimerStart {Name = "mf_P502_NamelessArmyDelay"},			
		},
	};
	OnOneTimeEvent
	{		
		Conditions = 
		{		
			MapTimerIsElapsed {Name = "mf_P502_NamelessArmyDelay", Seconds = 8},			
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P502_StartNamelessArmyCS"},
			MapTimerStop {Name = "mf_P502_NamelessArmyDelay"},			
		},
	};
	
--Necropolis Grave Dialog
	
OnOneTimeEvent
	{
		Conditions =
		{			
			MapValueIsEqual	{Name = "mv_p502_GraveOpen", Value = 1 },
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_p502_Wave1"},
			DialogSetEnabled	{Tag = "grave_Dialogue_02"},
		},
	};		
	
	OnOneTimeEvent
	{
		Conditions =
		{			
			MapValueIsEqual	{Name = "mv_p502_GraveOpen", Value = 2 },
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_p502_Wave2"},
			DialogSetEnabled	{Tag = "grave_Dialogue_03"},
		},
	};		
	
	OnOneTimeEvent
	{
		Conditions =
		{			
			MapValueIsEqual	{Name = "mv_p502_GraveOpen", Value = 3 },
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_p502_Wave3"},
			DialogSetEnabled	{Tag = "grave_Dialogue_04"},
		},
	};		
	
	OnOneTimeEvent
	{
		Conditions =
		{			
			MapValueIsEqual	{Name = "mv_p502_GraveOpen", Value = 4 },
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_p502_Wave4"},
			DialogSetEnabled	{Tag = "grave_Dialogue_05"},
		},
	};		
	OnOneTimeEvent
	{
		Conditions =
		{			
			MapValueIsEqual	{Name = "mv_p502_GraveOpen", Value = 5 },
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_p502_Wave5"},
		},
	};
	

--Surian Start	
	OnEvent
	{
		EventName = "One",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_SurianAdded"},	
			AvatarValueIsEqual	{Player = "pl_Human", Name = "av_P502_OnDragon", Value = 1 },
			MapFlagIsTrue	{Name = "mf_P502_Surian"},
		--	AvatarValueIsEqual	{ Name = "av_p501_OnDragon", Value = 1 },
		},
		Actions = 
		{
			
			FigureVanish	{Tag = "Surian"},
			MapFlagSetFalse	{Name = "mf_P502_Surian"},
		},
		GotoState = self,
	};


OnEvent
	{
		EventName = "Second",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_SurianAdded"},			
			AvatarValueIsEqual	{Player = "pl_Human", Name = "av_P502_OnDragon", Value = 0 },
			FigureIsDead	{Tag = "Surian"},
			MapFlagIsFalse	{Name = "mf_P502_Surian"},			
		},
		Actions = 
		{
			
			MapFlagSetTrue	{Name = "mf_P502_Surian"},
			NoSpawnEffect	{Spawn = FigureNpcSpawnToEntity	{Tag = "Surian", Level = 18 , UnitId = 1689 , TargetTag = "pl_HumanAvatar", Team = "tm_Team1"}, },
			FigurePlayerTransfer	{Tag = "Surian" },
		},
		GotoState = self,
	};
	
--Peasant Leaves Hay in village 	
OnOneTimeEvent
	{		
		Conditions = 
		{
			--FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "MG_peasant_trigger", Range = 7},
			QuestIsSolved {Quest = "MG_KNOWYOURENEMY"},
		},
		Actions = 
		{			
			FigureForcedRunToEntity {Tag = "MG_village_Survivor",TargetTag = "MG_marker_peasant_pos" },
		},
	};
	
OnOneTimeEvent
	{		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_SurianAdded"},			
			FigureIsDead	{Tag = "Surian"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			AvatarValueIsEqual	{Name = "av_P502_OnDragon", Value = 0 },
			MapFlagIsTrue	{Name = "mf_P502_Surian"},
		},
		Actions = 
		{			
			PlayerGameOver	{Tag = "default", LocaTag = "IGMenuGameOver_Title"},
		},
	};
	
	--Surian End
	
	
	-- Nameless from village are dead 
	OnOneTimeEvent
	{		
		Conditions = 
		{
		        -- Kubi MapFlagIsTrue {Name = "mf_p502_QuestCompleteKnowYourEnemy"},
			MapFlagIsTrue {Name = "mf_P502_FigureRespawnForEnemyQuest"},
			FigureIsDead	{Tag = "MG_Village_Demonic_Warrior_01"},
			FigureIsDead	{Tag = "MG_Village_Demonic_Warrior_02"},
			FigureIsDead	{Tag = "MG_Village_Demonic_Warrior_03"},
			FigureIsDead	{Tag = "MG_Village_Demonic_Warrior_04"},			
			FigureIsDead	{Tag = "MG_Village_Demonic_Warrior_05"},
			FigureIsDead	{Tag = "MG_Village_Demonic_Warrior_06"},
			FigureIsDead	{Tag = "MG_Village_Demonic_Warrior_07"},
			FigureIsDead	{Tag = "MG_Village_Demonic_Warrior_08"},
			FigureIsDead	{Tag = "MG_Village_Chosen_01"},
			FigureIsDead	{Tag = "MG_Village_Chosen_02"},
			FigureIsDead	{Tag = "MG_Village_Chosen_03"},
			FigureIsDead	{Tag = "MG_Village_Chosen_04"},
			FigureIsDead	{Tag = "MG_Village_Chosen_05"},
			FigureIsDead	{Tag = "MG_Village_Chosen_06"},
			FigureIsDead	{Tag = "MG_Village_Chosen_07"},
			FigureIsDead	{Tag = "MG_Village_Chosen_08"},
			FigureIsDead	{Tag = "MG_Village_Spike_01"},
			FigureIsDead	{Tag = "MG_Village_Spike_02"},
			FigureIsDead	{Tag = "MG_Village_Spike_03"},
			FigureIsDead	{Tag = "MG_Village_Mage"},			
		},
		Actions = 
		{			
			MapFlagSetTrue	{Name = "mf_p502_QuestCompleteKnowYourEnemy"},
		},
	};
	
-- Cutscene for IO elven village	
--		OnOneTimeEvent
--	{		
	--	Conditions = 
	--	{
		--	FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "ElvenVillage", Range = 10},
		--	FigureIsInEntityRange	{Tag = "pl_HumanHeroIO", TargetTag = "ElvenVillage", Range = 10},			
		--},
		--Actions = 
		--{			
			--MapFlagSetTrue	{Name = "mf_p502_StartSomethingToFightForCS"},
		--},
--	};
	

--		OnOneTimeEvent
--	{		
--		Conditions = 
--		{
--			MapFlagIsTrue	{Name = "mf_p502_DragonRidingTutFinished"},			
--		},
--		Actions = 
--		{			
--			MapFlagSetTrue	{Name = "mf_p502_QuestReportToTwiddle"},
--		},
--	};
	
	OnOneTimeEvent	
	{		
		Conditions = 
		{
			
			MapFlagIsTrue	{Name = "mf_P502_AttackOnElfStarted"},
			FigureIsDead{Tag = "MG_wave_elf_01"},
			FigureIsDead{Tag = "MG_wave_elf_02"},
			FigureIsDead{Tag = "MG_wave_elf_03"},
			FigureIsDead{Tag = "MG_wave_elf_04"},
			FigureIsDead{Tag = "MG_wave_elf_05"},
			FigureIsDead{Tag = "MG_wave_elf_06"},
			FigureIsDead{Tag = "MG_wave_elf_07"},
			FigureIsDead{Tag = "MG_wave_elf_08"},
			FigureIsDead{Tag = "MG_wave_elf_09"},
			FigureIsDead{Tag = "MG_wave_elf_10"},
			FigureIsDead{Tag = "MG_wave_elf_11"},
			FigureIsDead{Tag = "MG_wave_elf_12"},
			FigureIsDead{Tag = "MG_wave_elf_13"},
			
		},
		Actions = 
		{			
			MapTimerStart	{Name = "mt_P502_ElvesSavedCutsceneDelay"},
			--MapFlagSetTrue	{Name = "mf_P502_EndToTheElvesCS"},
			DialogSetEnabled	{Tag = "Druid"},
		},
	};
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
		MapTimerIsElapsed	{Name = "mt_P502_ElvesSavedCutsceneDelay", Seconds = 4 },
		},
		Actions = 
		{			
			MapFlagSetTrue	{Name = "mf_P502_StartToTheElvesCS"},
			MapTimerStop	{Name = "mt_P502_ElvesSavedCutsceneDelay"},			
		},
	};
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			OR{
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "MG_wave_elv_trigger_01", Range = 10},			
			FigureIsInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "MG_wave_elv_trigger_01", Range = 10},			
			FigureIsInEntityRange	{Tag = "pl_HumanHeroSariel", TargetTag = "MG_wave_elv_trigger_01", Range = 10},			
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "MG_wave_elv_trigger_02", Range = 10},			
			FigureIsInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "MG_wave_elv_trigger_02", Range = 10},			
			FigureIsInEntityRange	{Tag = "pl_HumanHeroSariel", TargetTag = "MG_wave_elv_trigger_02", Range = 10},			
			}
		},
		Actions = 
		{			
			MapFlagSetTrue	{Name = "mf_P502_AttackElfCamp"},
		},
	};
	
--KUBI	
	--OnOneTimeEvent
	--{		
		--Conditions = 
		--{
			--MapFlagIsTrue	{Name = "mf_P502_VillageNamelessSpawned"},
			--FigureIsDead{Tag = "MG_Village_Demonic_Warrior_01"},
			--FigureIsDead{Tag = "MG_Village_Demonic_Warrior_02"},
			--FigureIsDead{Tag = "MG_Village_Demonic_Warrior_03"},
			--FigureIsDead{Tag = "MG_Village_Demonic_Warrior_04"},
			--FigureIsDead{Tag = "MG_Village_Demonic_Warrior_05"},
			--FigureIsDead{Tag = "MG_Village_Demonic_Warrior_06"},
			--FigureIsDead{Tag = "MG_Village_Demonic_Warrior_07"},
			--FigureIsDead{Tag = "MG_Village_Demonic_Warrior_08"},
--			
			--FigureIsDead{Tag = "MG_Village_Chosen_01"},
			--FigureIsDead{Tag = "MG_Village_Chosen_02"},
			--FigureIsDead{Tag = "MG_Village_Chosen_03"},
			--FigureIsDead{Tag = "MG_Village_Chosen_04"},
			--FigureIsDead{Tag = "MG_Village_Chosen_05"},
			--FigureIsDead{Tag = "MG_Village_Chosen_06"},
			--FigureIsDead{Tag = "MG_Village_Chosen_07"},
			--FigureIsDead{Tag = "MG_Village_Chosen_08"},
--			
			--FigureIsDead{Tag = "MG_Village_Spike_01"},
			--FigureIsDead{Tag = "MG_Village_Spike_02"},
			--FigureIsDead{Tag = "MG_Village_Spike_03"},
--						
			--FigureIsDead{Tag = "MG_Village_Mage"},
		--},
		--Actions = 
		--{			
			--MapFlagSetTrue	{Name = "mf_p502_QuestCompleteKnowYourEnemy"},			
		--},
	--};
	
	-- Human HQ
	OnOneTimeEvent
	{		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_FactionChosen"},
			AvatarValueIsEqual	{Name = "av_P502_FactionChosen", Value = 1 },
		},
		Actions = 
		{	
			
			--PlayerChangeFraction {Player = "pl_Human" , Faction = 1 },
			
			--PlayerKitCreate	{PlayerKit = "pk_hq"},
			PlayerBuildingAdd	{BuildingId = 115 },
			PlayerBuildingAdd	{BuildingId = 116 },
			PlayerBuildingAdd	{BuildingId = 118 },
			PlayerBuildingAdd	{BuildingId = 119 },
			PlayerBuildingAdd	{BuildingId = 120 },
			PlayerBuildingAdd	{BuildingId = 121 },
			PlayerBuildingAdd	{BuildingId = 122 },
			PlayerBuildingAdd	{BuildingId = 123 },
			PlayerBuildingAdd	{BuildingId = 124 },
			PlayerBuildingAdd	{BuildingId = 125 },
			PlayerBuildingAdd	{BuildingId = 126 },
			PlayerBuildingAdd	{BuildingId = 128 },
			PlayerBuildingAdd	{BuildingId = 130 },
			PlayerBuildingAdd	{BuildingId = 131 },


			
			PlayerBuildingUpgradeAdd	{UpgradeId = 6 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 7 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 8 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 9 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 10 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 11 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 12 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 13 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 14 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 15 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 16 },

			SpawnRTSHQ{Level = 10 , X = 632.58 ,Y = 177.579 , Team = "tm_Team1" , PlayerKit = "pk_hq" , Player = "pl_Human" , Faction = 1 },			
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_hq"},	
			PlayerTravelStoneAdd	{Tag = "JOURNEYSTONE_MG5"},
			
		},
	};
	
	
	-- Shaikan HQ
			OnOneTimeEvent
	{		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_FactionChosen"},
			AvatarValueIsEqual	{Player = "default", Name = "av_P502_FactionChosen", Value = 2 },
		},
		Actions = 
		{	
			
			PlayerChangeFraction {Player = "pl_Human" , Faction = 8 },
			
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 191 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 192 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 193 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 194 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 195 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 196 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 197 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 198 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 199 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 200 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 201 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 203 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 204 },
			
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 45 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 46 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 47 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 48 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 49 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 50 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 51 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 52 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 53 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 54 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 55 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 56 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 57 },
			
			PlayerUnitUpgradeAdd	{UpgradeId = 9 },
			PlayerUnitUpgradeAdd	{UpgradeId = 10 },
			PlayerUnitUpgradeAdd	{UpgradeId = 11 },
			PlayerUnitUpgradeAdd	{UpgradeId = 12 },
			PlayerUnitUpgradeAdd	{UpgradeId = 13 },
			PlayerUnitUpgradeAdd	{UpgradeId = 14 },
			PlayerUnitUpgradeAdd	{UpgradeId = 15 },
			PlayerUnitUpgradeAdd	{UpgradeId = 16 },
			PlayerUnitUpgradeAdd	{UpgradeId = 17 },
			PlayerUnitUpgradeAdd	{UpgradeId = 18 },
						
			--PlayerKitCreate	{PlayerKit = "pk_hq"},
			SpawnRTSHQ{Level = 10 , X = 632.58 ,Y = 177.579 , Team = "tm_Team1" , PlayerKit = "pk_hq" , Player = "pl_Human" , Faction = 8 }, 
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_hq"},		
			PlayerTravelStoneAdd	{Tag = "JOURNEYSTONE_MG5"},
		},
	};
	
	-- Orc HQ
			OnOneTimeEvent
	{		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_FactionChosen"},
			AvatarValueIsEqual	{Player = "default", Name = "av_P502_FactionChosen", Value = 3 },
		},
		Actions = 
		{			
		--	PlayerKitCreate	{PlayerKit = "pk_hq"},	
			PlayerChangeFraction {Player = "pl_Human" , Faction = 2 },
			
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 149 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 150 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 152 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 153 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 154 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 155 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 156 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 157 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 158 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 159 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 160 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 161 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 162 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 163 },
			
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 19 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 21 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 23 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 25 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 27 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 29 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 31 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 33 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 35 },			
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 37 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 39},			
						
			SpawnRTSHQ{Level = 10 , X = 632.58 ,Y = 177.579 , Team = "tm_Team1" , PlayerKit = "pk_hq" , Player = "pl_Human" , Faction = 2 },			
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_hq"},
			PlayerTravelStoneAdd	{Tag = "JOURNEYSTONE_MG5"},
		},
	};
	
	
	-- Pact HQ
			OnOneTimeEvent
	{		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_FactionChosen"},
			AvatarValueIsEqual	{Player = "default", Name = "av_P502_FactionChosen", Value = 4 },
		},
		Actions = 
		{			
		--	PlayerKitCreate	{PlayerKit = "pk_hq"},
		
			PlayerChangeFraction {Player = "pl_Human" , Faction = 3 },
		
			PlayerBuildingAdd	{BuildingId = 133 },
			PlayerBuildingAdd	{BuildingId = 134 },
			PlayerBuildingAdd	{BuildingId = 136 },
			PlayerBuildingAdd	{BuildingId = 137 },
			PlayerBuildingAdd	{BuildingId = 138 },
			PlayerBuildingAdd	{BuildingId = 139 },
			PlayerBuildingAdd	{BuildingId = 140 },
			PlayerBuildingAdd	{BuildingId = 141 },
			PlayerBuildingAdd	{BuildingId = 142 },
			PlayerBuildingAdd	{BuildingId = 143 },
			PlayerBuildingAdd	{BuildingId = 144 },
			PlayerBuildingAdd	{BuildingId = 145 },
			PlayerBuildingAdd	{BuildingId = 146 },
			PlayerBuildingAdd	{BuildingId = 147},
			PlayerBuildingUpgradeAdd	{UpgradeId = 18 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 20 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 22 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 24 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 26 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 28 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 30 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 32 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 34 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 36 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 38 },			
				
			SpawnRTSHQ{Level = 10 , X = 632.58 ,Y = 177.579 , Team = "tm_Team1" , PlayerKit = "pk_hq" , Player = "pl_Human" , Faction = 3 },			
			PlayerKitTransfer	{Player = "pl_Human", PlayerKit = "pk_hq"},		
			PlayerTravelStoneAdd	{Tag = "JOURNEYSTONE_MG5"},
		},
	};
	
		OnOneTimeEvent
	{		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_FactionChosen"},			
		},
		Actions = 
		{	
			DialogSetDisabled	{Tag = "MG_human_prisoner_01"},
			DialogSetDisabled	{Tag = "MG_Ork_prisoner"},
			DialogSetDisabled	{Tag = "MG_Pact_prisoner"},
			DialogSetDisabled	{Tag = "MG_Shaikan_prisoner"},
			MapTimerStart	{Name = "mt_P502_PlayerHQActivated"},
			
		},
	};
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_FactionChosen"},			
		OR	{
				MapTimerIsElapsed	{Name = "mt_P502_PlayerHQActivated", Seconds = 5 },
				PlayerHasFigureAmountEx	{Player = "pl_Human", Amount = 20 , CountWorkers = false, CountAvatarAndHeroes = false},
				},
			
		},
		Actions = 
		{	
			DialogSetEnabled	{Tag = "MG_Pact_prisoner"},
			FigureTeleport	{Tag = "MG_Pact_prisoner", X = 336, Y = 240},			
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 338, Y =218 },
			FigureLookAtDirection	{Tag = "MG_Pact_prisoner", Direction = 85.9 },			
			MapTimerStop	{Name = "mt_P502_TwiddleDialog"},			
			DialogBegin	{ Tag = "MG_Pact_prisoner"},		
		},
	};

	
		OnOneTimeEvent
	{		
		Conditions = 
		{
			--PlayerHasBuildingAmount	{ Amount = 2 , OnlyCompleted = true },
			OR
			{
				MapTimerIsElapsed	{Name = "mt_P502_PlayerHQActivated", Seconds = 900 },
				PlayerHasFigureAmountEx	{Player = "pl_Human", Amount = 20 , CountWorkers = false, CountAvatarAndHeroes = false},
			}
			
		},
		Actions = 
		{	
			PlayerActivate	{Player = "pl_DemonBase"},
			MapFlagSetTrue	{Name = "mf_p502_DemonSpawn"},
			MapTimerStart	{Name = "mt_p502_DemonSpawn1"},				
			MapTimerStart	{Name = "mt_p502_WaveonElfBase"},
		},
	};
	
	
		OnOneTimeEvent
	{		
		Conditions = 
		{
				
			MapFlagIsTrue	{Name = "mf_P502_PactForceDialogOver"},			
			--MapFlagIsTrue	{Name = "mf_P502_EndPrisonerCS"},			
		},
		Actions = 
		{	
			--MapFlagSetTrue {Name = "mf_p502_StartSomethingToFightForCS"},
	--		MapTimerStart	{Name = "mt_P502_StartFightCutscene"},
				MapTimerStart	{Name = "mt_P502_SurianOutcry"},
			
		},
	};
	
			OnOneTimeEvent
	{		
		Conditions = 
		{			
			MapTimerIsElapsed	{Name = "mt_P502_SurianOutcry", Seconds = 13},		
			},
		Actions = 
		{
	        MapFlagSetTrue {Name = "mf_p502_StartSomethingToFightForCS"},	
		MapTimerStop	{Name = "mt_P502_SurianOutcry"},		
		},
	};
	
		OnOneTimeEvent
	{		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_FactionChosen"},
		--	PlayerHasNotFigureAmountEx	{Player = "pl_Demon", Amount =0 , CountWorkers = true, CountAvatarAndHeroes = false},
		--	PlayerHasNotBuildingAmount	{Player = "pl_Demon", Amount = 1 , OnlyCompleted = false},
			--PlayerHasFigureAmount	{Player = "pl_Demon", Amount = 2 },
			--PlayerHasNotFigureAmount	{Player = "pl_Demon", Amount =2 },
			
			BuildingIsDead	{Tag = "MG_tower_03"},
			BuildingIsDead	{Tag = "MG_tower_04"},
			BuildingIsDead	{Tag = "MG_tower_05"},
			BuildingIsDead	{Tag = "MG_tower_06"},
			BuildingIsDead	{Tag = "MG_tower_07"},
			BuildingIsDead	{Tag = "MG_tower_08"},
			BuildingIsDead	{Tag = "MG_tower_09"},
			BuildingIsDead	{Tag = "MG_tower_10"},
			BuildingIsDead	{Tag = "MG_demonic_hq"},
			BuildingIsDead	{Tag = "MG_demonic_smeltery_01"},
			BuildingIsDead	{Tag = "MG_demonic_apothecary_01"},		
		},
		Actions = 
		{	
			MapFlagSetTrue	{Name = "mf_P502_NamelessBaseDestroyed"},	
		},
	};

-- Titan Spawn
	OnOneTimeEvent
	{		
		Conditions = 
		{
			BuildingIsDead	{Tag = "MG_tower_06"},
		},
		Actions = 
		{			
		--	FigureRtsKitSpawn	{UnitId = 1664 , Level = 25, X = 236.544 , Y = 181.675 , PlayerKit = "pk_Demonic"},		
				FigureRtsPlayerSpawn	{UnitId = 194 , Player = "pl_DemonBase", X =  236.544, Y = 181.675 , Amount =  1 },
		},
	};


	OnOneTimeEvent
	{		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_SacrificeAvatar"},
		},
		Actions = 
		{	
			FigureKill	{Tag = "pl_HumanAvatar"},
			--FigureHealthSet	{Tag = "pl_HumanAvatar", Percent = 0 },
		},
	};
	
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_SacrificeIO"},
		},
		Actions = 
		{	
			FigureKill	{Tag = "pl_HumanHeroIO"},
			--FigureHealthSet	{Tag = "pl_HumanHeroIO", Percent = 0 },
		},
	};
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			FigureIsAlive	{Tag = "pl_HumanHeroIO"},
			OR	{
				MapFlagIsTrue	{Name = "mf_P502_SacrificeAvatar"},
				MapFlagIsTrue	{Name = "mf_P502_SacrificeIO"},
				},
		},
		Actions = 
		{	
			MapFlagSetTrue	{Name = "mf_P502_RitesofCleansingComplete"},	
		},
	};
	
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P502_VillageSurvivorDialogOver"},
			FigureIsDead	{Tag = "Prison_Demon_01"},
			FigureIsDead	{Tag = "Prison_Demon_02"},
			FigureIsDead	{Tag = "Prison_Demon_03"},
			FigureIsDead	{Tag = "Prison_Demon_04"},
			FigureIsDead	{Tag = "Prison_Demon_05"},
			FigureIsDead	{Tag = "Prison_Demon_06"},
			FigureIsDead	{Tag = "Prison_Demon_07"},
			FigureIsDead	{Tag = "Prison_Demon_08"},
		},
		Actions = 
		{	
			DialogSetEnabled	{Tag = "MG_human_prisoner_01"},	
			DialogSetEnabled	{Tag = "MG_Shaikan_prisoner"},	
			DialogSetEnabled	{Tag = "MG_Pact_prisoner"},
			DialogSetEnabled	{Tag = "MG_Ork_prisoner"},	
		},
	};
	
	
		OnOneTimeEvent
	{		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502OpenNecropolisGate"},			
		},
		Actions = 
		{	
			GateSetOpen	{Tag = "Necropolis_Gate"},
			MapTimerStart	{Name = "mt_P502_NecropolisGate"},			
		},
	};
	
			OnOneTimeEvent
	{		
		Conditions = 
		{
			OR{
			FigureIsInEntityRange	{Tag = "pl_HumanAvtar", TargetTag = "Marker_backattack3", Range = 10},
			FigureIsInEntityRange	{Tag = "pl_HumanHeroIO", TargetTag = "Marker_backattack3", Range = 10},			
			FigureIsInEntityRange	{Tag = "pl_HumanHeroSariel", TargetTag = "Marker_backattack3", Range = 10},			
			FigureIsInEntityRange	{Tag = "pl_HumanHeroCaine", TargetTag = "Marker_backattack3", Range = 10},			
		}
		},
		Actions = 
		{			
			MapFlagSetTrue	{Name = "mf_P502_StartAttackFromVillage"},
		},
	};
	

			OnOneTimeEvent
	{		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_TreantOver"},			
		},
		Actions = 
		{	
			DialogSetEnabled	{Tag = "Druid"},
			AvatarItemEquipmentGive	{ItemId = 1268 , Amount = 1 },
		},
	};
	
		OnEvent
	{
		Conditions = 
		{
			MapFlagIsFalse {Name = "mf_P502_WaveIsReady" },	
			
			FigureIsAlive	{Tag = "Io_AttackWave01"},
			FigureIsAlive	{Tag = "Io_AttackWave02"},
			FigureIsAlive	{Tag = "Io_AttackWave03"},
			FigureIsAlive	{Tag = "Io_AttackWave04"},			
			FigureIsAlive	{Tag = "Io_AttackWave05"},
			FigureIsAlive	{Tag = "Io_AttackWave06"},
			FigureIsAlive	{Tag = "Io_AttackWave07"},
			FigureIsAlive	{Tag = "Io_AttackWave08"},
			FigureIsAlive	{Tag = "Io_AttackWave09"},
			FigureIsAlive	{Tag = "Io_AttackWave10"},
			
			FigureIsInRangeToEntity	{Tag = "Io_AttackWave02", TargetTag = "Io_AttackWave01", Range = 20},
			FigureIsInRangeToEntity	{Tag = "Io_AttackWave03", TargetTag = "Io_AttackWave01", Range = 20},
			FigureIsInRangeToEntity	{Tag = "Io_AttackWave04", TargetTag = "Io_AttackWave01", Range = 20},			
			FigureIsInRangeToEntity	{Tag = "Io_AttackWave05", TargetTag = "Io_AttackWave01", Range = 20},
			FigureIsInRangeToEntity	{Tag = "Io_AttackWave06", TargetTag = "Io_AttackWave01", Range = 20},
			FigureIsInRangeToEntity	{Tag = "Io_AttackWave07", TargetTag = "Io_AttackWave01", Range = 20},			
			FigureIsInRangeToEntity	{Tag = "Io_AttackWave08", TargetTag = "Io_AttackWave01", Range = 20},
			FigureIsInRangeToEntity	{Tag = "Io_AttackWave09", TargetTag = "Io_AttackWave01", Range = 20},
			FigureIsInRangeToEntity	{Tag = "Io_AttackWave10", TargetTag = "Io_AttackWave01", Range = 20},			
								
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P502_WaveIsReady" },			
		},	
	};
	
	
			OnEvent
	{
		Conditions = 
		{
			MapFlagIsFalse {Name = "mf_P502_VillageWaveIsReady" },	
			
			FigureIsAlive	{Tag = "Villager_AttackWave01"},
			FigureIsAlive	{Tag = "Villager_AttackWave02"},
			FigureIsAlive	{Tag = "Villager_AttackWave03"},
			FigureIsAlive	{Tag = "Villager_AttackWave04"},			
			FigureIsAlive	{Tag = "Villager_AttackWave05"},
			FigureIsAlive	{Tag = "Villager_AttackWave06"},
			FigureIsAlive	{Tag = "Villager_AttackWave07"},
			FigureIsAlive	{Tag = "Villager_AttackWave08"},
			FigureIsAlive	{Tag = "Villager_AttackWave09"},
			FigureIsAlive	{Tag = "Villager_AttackWave10"},
			
			FigureIsInRangeToEntity	{Tag = "Villager_AttackWave02", TargetTag = "Villager_AttackWave01", Range = 10},
			FigureIsInRangeToEntity	{Tag = "Villager_AttackWave03", TargetTag = "Villager_AttackWave01", Range = 10},
			FigureIsInRangeToEntity	{Tag = "Villager_AttackWave04", TargetTag = "Villager_AttackWave01", Range = 10},			
			FigureIsInRangeToEntity	{Tag = "Villager_AttackWave05", TargetTag = "Villager_AttackWave01", Range = 10},
			FigureIsInRangeToEntity	{Tag = "Villager_AttackWave06", TargetTag = "Villager_AttackWave01", Range = 10},
			FigureIsInRangeToEntity	{Tag = "Villager_AttackWave07", TargetTag = "Villager_AttackWave01", Range = 10},			
			FigureIsInRangeToEntity	{Tag = "Villager_AttackWave08", TargetTag = "Villager_AttackWave01", Range = 10},
			FigureIsInRangeToEntity	{Tag = "Villager_AttackWave09", TargetTag = "Villager_AttackWave01", Range = 10},
			FigureIsInRangeToEntity	{Tag = "Villager_AttackWave10", TargetTag = "Villager_AttackWave01", Range = 10},			
								
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P502_VillageWaveIsReady" },			
		},	
	};
	
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			OR{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "wave_end_marker", Range = 10},
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroSariel", TargetTag = "wave_end_marker", Range = 10},
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "wave_end_marker", Range = 10},	
			}
		},
		Actions = 
		{	
			MapFlagSetTrue	{Name = "mf_P502StopIoWave"},
		},
	};

OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "MG_INTOTHEDEPTHS"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Teleport_Dugout", Range = 3 },
		
		},
		Actions = 
		{					
		  PlayerMapTravelAddon2	{Map = "Campaign/P503_The_Dugout", TargetTag = "Start"},						
		},
	};

	OnOneTimeEvent
	{		
		Conditions = 
		{
			OR{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "StopVillageWave", Range = 30},
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroSariel", TargetTag = "StopVillageWave", Range = 30},
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "StopVillageWave", Range = 30},	
			}
		},
		Actions = 
		{	
			MapFlagSetTrue	{Name = "mf_P502StopVillageWave"},
		},
	};

	OnOneTimeEvent
	{		
		Conditions = 
		{
				MapFlagIsTrue	{Name = "mf_P502_IODialogOver"},
		},
		Actions = 
		{	
				FigureVanish	{Tag = "a1"},
				FigureVanish	{Tag = "a2"},
				FigureVanish	{Tag = "a3"},
				FigureVanish	{Tag = "a4"},
				FigureVanish	{Tag = "a5"},
				FigureVanish	{Tag = "a6"},
				FigureVanish	{Tag = "a7"},
				FigureVanish	{Tag = "a8"},
				FigureVanish	{Tag = "a9"},
				FigureVanish	{Tag = "a10"},
				FigureVanish	{Tag = "a11"},
				FigureVanish	{Tag = "a12"},
				FigureVanish	{Tag = "a13"},
				FigureVanish	{Tag = "a14"},
				
				FigureVanish	{Tag = "a15"},
				FigureVanish	{Tag = "a16"},
				FigureVanish	{Tag = "a17"},
				FigureVanish	{Tag = "a18"},
				FigureVanish	{Tag = "a19"},
				FigureVanish	{Tag = "a20"},
				FigureVanish	{Tag = "a21"},
				FigureVanish	{Tag = "a22"},
				FigureVanish	{Tag = "a23"},
				FigureVanish	{Tag = "a24"},
				FigureVanish	{Tag = "a25"},
				FigureVanish	{Tag = "a26"},
				FigureVanish	{Tag = "a27"},
				FigureVanish	{Tag = "a28"},
				FigureVanish	{Tag = "a29"},
				FigureVanish	{Tag = "a30"},		
		},
	};	
	
	
	-- OUTCRY
	OnOneTimeEvent
	{		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P502_Outcry", Seconds = 10 },
		},
		Actions = 
		{	
			FigureOutcryImmediate	{TextTag = "ROADAVATAR1", Tag = "pl_HumanAvatar"},
		},
	};	
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P502_Outcry", Seconds = 15 },
		},
		Actions = 
		{	
			FigureOutcryImmediate	{TextTag = "ROADANTARA1", Tag = "pl_HumanHeroAntara"},
		},
	};	
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P502_Outcry", Seconds = 20 },
		},
		Actions = 
		{	
			FigureOutcryImmediate	{TextTag = "ROADTWIDDLE1", Tag = "pl_HumanHeroPTwiddle"},
		},
	};	
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P502_Outcry", Seconds = 25 },
		},
		Actions = 
		{	
			FigureOutcryImmediate	{TextTag = "ROADAVATAR2", Tag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P502_Outcry", Seconds = 40 },
		},
		Actions = 
		{	
			TutorialInfoTextShow {TextTag = "Tutorial88"},
			MapTimerStop	{Name = "mt_P502_Outcry"},
		},
	};	
	
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P502_SadIOOutcry", Seconds = 5 },
		},
		Actions = 
		{	
			FigureOutcryImmediate	{TextTag = "SADIO1", Tag = "pl_HumanHeroIO"},
			MapTimerStop	{Name = "mt_P502_SadIOOutcry"},
		},
	};
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P502_SurianOutcry", Seconds = 4 },
		},
		Actions = 
		{	
			FigureOutcryImmediate	{TextTag = "DRAGONAVATAR1", Tag = "pl_HumanAvatar"},
			FigureNpcSpawn	{Tag = "Surian", Level = 18 , UnitId = 1689 , X = 397, Y = 239, Team = "tm_Team1"},
			FigureFollowEntity	{Tag = "Surian", TargetTag = "pl_HumanAvatar"},
		},
	};	
	
		OnOneTimeEvent
	{		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P502_SurianOutcry", Seconds = 10 },
		},
		Actions = 
		{	
			--NoSpawnEffect	{Spawn = FigureNpcSpawnToEntity	{Tag = "Surian", Level = 18 , UnitId = 1689 , TargetTag = "pl_HumanAvatar", Team = "tm_Team1"}, },
			FigurePlayerTransfer	{Tag = "Surian" },		
			--FigureOutcryImmediate	{TextTag = "DRAGONSURIAN1", Tag = "Surian"},
		},
	};	
	
	
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P502_ArmyDialogOver"},
			MapFlagIsTrue {Name = "mf_P502_CompensatorDialogOver"},
--			MapTimerIsElapsed	{Name = "mt_P502_SurianOutcry", Seconds = 30 },
		},
		Actions = 
		{	
			MapTimerStart	{Name = "mt_P502_SurianTutorial"},
		},
	};	
	
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P502_ArmyDialogOver"},
			MapFlagIsTrue {Name = "mf_P502_CompensatorDialogOver"},
			MapTimerIsElapsed	{Name = "mt_P502_SurianTutorial", Seconds = 10 },
		},
		Actions = 
		{	
			MapFlagSetTrue {Name = "mf_p502_StartTutorial"},			
			MapFlagSetTrue	{Name = "mf_P502_SurianAdded"},			
			SetSurianWithAvatar{},
			DragonCallEnable { } ,			
			MapTimerStop	{Name = "mt_P502_SurianTutorial"},
		},
	};
	
	
--		OnOneTimeEvent
--	{
--		Conditions =
--		{
--			MapFlagIsTrue {Name = "mf_P502_IODialogOver"},
--		},
--		Actions =
--		{
--			FigureVanish	{Tag = "a1"},
--			FigureVanish	{Tag = "a2"},
--			FigureVanish	{Tag = "a3"},
--			FigureVanish	{Tag = "a4"},
--			FigureVanish	{Tag = "a5"},
--			FigureVanish	{Tag = "a6"},
--			FigureVanish	{Tag = "a7"},
--			FigureVanish	{Tag = "a8"},
--			FigureVanish	{Tag = "a9"},
--			FigureVanish	{Tag = "a10"},
--			FigureVanish	{Tag = "a11"},
--			FigureVanish	{Tag = "a12"},
--			FigureVanish	{Tag = "a13"},
--			FigureVanish	{Tag = "a14"},
--			
--			FigureVanish	{Tag = "a15"},
--			FigureVanish	{Tag = "a16"},
--			FigureVanish	{Tag = "a17"},
--			FigureVanish	{Tag = "a18"},
--			FigureVanish	{Tag = "a19"},
--			FigureVanish	{Tag = "a20"},
--			FigureVanish	{Tag = "a21"},
--			FigureVanish	{Tag = "a22"},
--			FigureVanish	{Tag = "a23"},
--			FigureVanish	{Tag = "a24"},
--			FigureVanish	{Tag = "a25"},
--			FigureVanish	{Tag = "a26"},
--			FigureVanish	{Tag = "a27"},
--			FigureVanish	{Tag = "a28"},
--			FigureVanish	{Tag = "a29"},
--			FigureVanish	{Tag = "a30"},
--		}
--	};
	
	

OnOneTimeEvent
	{		
		Conditions = 
		{
				MapFlagIsTrue	{Name = "mf_P502_LoadWS"},				
		},
		Actions = 
		{
				PlayerMapTravelAddon2	{Map = "Campaign/P504_The_Wasteland_Of_Sorrows", TargetTag = "Start"},
		},
  };

OnOneTimeEvent
	{		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_SpawnHirin"},				
		},
		Actions = 
		{
				--FigureRespawnToEntity	{Tag = "Hirin", TargetTag = "pl_HumanAvatar"},
				FigureRespawn	{Tag = "Hirin", X = 462, Y = 664},
				EffectStartAtEntityPosition {Tag = "Hirin",File = "Effect_Spawn_Unit"},
				--FigureForcedRunToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Hirin"},
				FigureForcedRun	{Tag = "pl_HumanAvatar", X = 460, Y = 661},
				--AvatarSpawn	{Player = "pl_HumanAvatar", X = 213, Y = 481, Direction = 0},
				FigureTeamTransfer	{Tag = "Hirin", Team = "tm_Neutral"},	
				FigureHateClear	{Tag = "Hirin"},	
				MapFlagSetFalse	{Name = "mf_P502_SpawnHirin"},		
				MapTimerStart	{Name = "mt_P502_HirinSpawned"},		
				--FigureLevelSet	{Tag = "Hirin", Level = 1},		
		},
  };
  
OnOneTimeEvent
	{		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P502_HirinSpawned", Seconds = 3 },
			AvatarIsNotTalking	{},
		},
		Actions = 
		{
			--	DialogSetEnabled	{Tag = "Hirin"},
				DialogBegin	{Tag = "Hirin"},
				MapTimerStop	{Name = "mt_P502_HirinSpawned"},				
		},
  };

  OnOneTimeEvent
	{		
		Conditions = 
		{
			--MapFlagIsTrue {Name = "mf_P502_EndACuaseToFightFor"},
			MapFlagIsTrue {Name = "mf_p502_EndSomethingToFightForCS"},
			FigureTeamIsInRangeToEntity	{Team = "tm_Team1", Range = 15 , TargetTag = "Help_Elf_Army"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P502_ElfArmySupport"},
		},
  };
  
 OnOneTimeEvent
	{
		Conditions =
		{				
			MapFlagIsTrue {Name = "mf_p502_EndSomethingToFightForCS"},
		},
		Actions =
		{		
			MapTimerStart	{Name = "mt_P502_ForceDialog"},
			DialogSetDisabled	{Tag = "Twiddle"},
		},
	},
  
  
--[[  
  OnOneTimeEvent
	{
		Conditions =
	{		
			MapFlagIsTrue {Name = "mf_P502_ArmyDialogOver"},
			MapFlagIsTrue {Name = "mf_P502_CompensatorDialogOver"},
		},
		Actions =
		{		
			MapTimerStop	{Name = "mt_P502_ForceDialog"},

		},
	},
 
 ]]
OnOneTimeEvent
	{
		Conditions =
		{				
			MapFlagIsTrue {Name = "mf_p502_EndSomethingToFightForCS"},
			MapTimerIsElapsed	{Name = "mt_P502_ForceDialog", Seconds = 10 },			
			AvatarIsNotTalking	{},
			--MapFlagIsFalse {Name = "mf_P502_CompensatorDialogOver"},
			--MapFlagIsFalse {Name = "mf_P502_ArmyDialogOver"},
		},
		Actions =
		{			
			FigureTeleport	{Tag = "Twiddle", X = 461.966, Y = 656.813},			
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 461.514, Y = 653.602 },
			FigureLookAtDirection	{Tag = "Twiddle", Direction = 17.1887 },						
			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 154.699 },						
			DialogBegin	{ Tag = "Twiddle"},
			MapTimerStop {Name = "mt_P502_ForceDialog"},
			MapTimerStart	{Name = "mt_P502_ForceDialog_2"},
		},
	},
OnOneTimeEvent
	{
		Conditions =
		{				
			MapFlagIsTrue {Name = "mf_p502_EndSomethingToFightForCS"},
			MapTimerIsElapsed	{Name = "mt_P502_ForceDialog_2", Seconds = 10 },			
			AvatarIsNotTalking	{},
			OR
			{
				MapFlagIsFalse {Name = "mf_P502_ArmyDialogOver"},
				MapFlagIsFalse {Name = "mf_P502_CompensatorDialogOver"},
			},
		},
		Actions =
		{			
			FigureTeleport	{Tag = "Twiddle", X = 461.966, Y = 656.813},			
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 461.514, Y = 653.602 },
			FigureLookAtDirection	{Tag = "Twiddle", Direction = 17.1887 },
			FigureLookAtDirection	{Tag = "pl_HumanAvatar", Direction = 154.699 },						
			DialogBegin	{ Tag = "Twiddle"},
		},
	},
	
-- End of Invisibility cutscene
 
 	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_EndInvisibleCutscene"},		
			OR{
			FigureIsInEntityRange	{Tag = "prisone_Soldier_01", TargetTag = "pl_HumanAvatar", Range = 7 },
			FigureIsInEntityRange	{Tag = "prisone_Soldier_02", TargetTag = "pl_HumanAvatar", Range = 7 },
			FigureIsInEntityRange	{Tag = "prisone_Soldier_03", TargetTag = "pl_HumanAvatar", Range = 7 },
			FigureIsInEntityRange	{Tag = "prisone_Soldier_04", TargetTag = "pl_HumanAvatar", Range = 7 },
			FigureIsInEntityRange	{Tag = "prisone_Soldier_05", TargetTag = "pl_HumanAvatar", Range = 7 },
			},
			QuestIsActive	{ Quest = "MG_FREESLAVES" },
		},
		Actions =
		{
			FigurePlayerTransfer	{ Tag = "prisone_Soldier_01" },
			FigurePlayerTransfer	{ Tag = "prisone_Soldier_02" },
			FigurePlayerTransfer	{ Tag = "prisone_Soldier_03" },
			FigurePlayerTransfer	{ Tag = "prisone_Soldier_04" },
			FigurePlayerTransfer	{ Tag = "prisone_Soldier_05" },		
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_EndInvisibleCutscene"},		
			--EntityTimerIsElapsed {Name = "mt_P502_InvisibilityOutcry", Seconds = 3},
		},
		Actions =
		{
			--FigureOutcry	{TextTag = "Invisibility", Tag = "tutorialspeaker"},
			TutorialInfoTextShow	{TextTag = "Invisibility"},
			EffectStartAtEntityPosition {Tag = "pl_HumanAvatar",File = "Effect_Spawn_Unit"},
			--MapTimerStop	{Name = "mt_P502_InvisibilityOutcry"},
		},
	},
	
	
	
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
				MapFlagIsTrue	{Name = "mf_P502_RitesofCleansingComplete"},
		},
		Actions = 
		{	
			PlayerHeroRemove	{ Tag = "HeroIO"},
			PlayerHeroAdd	{ HeroId = 192 },
			FigureHeroSpawnToEntity	{ Tag = "HeroIO", TargetTag = "pl_HumanAvatar", Direction = 0},
		},
	};
 
 	OnOneTimeEvent
	{		
		Conditions = 
		{
				MapFlagIsTrue	{Name = "mf_p502_DemonSpawn"},
				MapTimerIsElapsed	{Name = "mt_p502_WaveonElfBase", Seconds = 900 },
		},
		Actions = 
		{	
				MapFlagSetTrue	{Name = "mf_P502_AttackElfBase"},
				MapTimerStop	{Name = "mt_p502_WaveonElfBase"},
				FogOfWarRevealAtEntity	{FogOfWarId = default, Tag = "MG_marker_demongate_elfbase", Range = 10 , Height = 5 },
				
				
		},
	};
 
 
 OnOneTimeEvent
	{		
		Conditions = 
		{
				MapFlagIsTrue	{Name = "mf_P502_DenyPrism"},
		},
		Actions = 
		{	
			AvatarFlagSetTrue	{Name = "af_P502_PrismOfMagicStarted"},
			--AvatarTimerStart	{Name = "at_P502_PrismOfMagicTimer"}, --comm by sourab
		},
	};
	
	-- Auto Twiddle Dialog 
 OnOneTimeEvent
	{		
		Conditions = 
		{
				MapTimerIsElapsed	{Name = "mt_P502_TwiddleDialog", Seconds = 10 },
				AvatarIsNotTalking	{},
		},
		Actions = 
		{	
			
			FigureTeleport	{Tag = "Twiddle", X = 458, Y = 342},			
			FigureTeleport	{Tag = "pl_HumanAvatar", X = 456, Y =659 },
			FigureLookAtDirection	{Tag = "Twiddle", Direction = 342 },			
			MapTimerStop	{Name = "mt_P502_TwiddleDialog"},			
			--DialogSetEnabled	{Tag = "Druid"},
			DialogBegin	{ Tag = "Twiddle"},					
		},
	};

--[[	
	--Added By Sourabh to disable druid dialogs until avatar has spoken with Hirin
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse {Name = "mf_P502_FirstTimeHirin"},
		}, 
		Actions = 
		{
			DialogSetEnabled	{Tag = "Druid"},
		}
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "Druid", TargetTag = "Hirin", Range = 10},
		}, 
		Actions = 
		{
			DialogSetDisabled	{Tag = "Druid"},
		}
	};
	
]]

	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P502_GivePrism"},
		}, 
		Actions = 
		{
			AvatarItemEquipmentGive	{ItemId = 1267, Amount = 1},
		}
	};	
	
	
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
			AvatarValueSet	{Player = "pl_Human", Name = "av_P502_OnDragon", Value = 0 },
			MapFlagSetFalse {Name = "mf_MapChangeDetected"},
			FigureVanish	{Tag = "Surian"},
			MapFlagSetTrue	{Name = "mf_P502_Surian"},
			DragonCallDisable {},
			--DragonCallEnable {},
			MapFlagSetTrue {Name = "mf_P502_MapChangeDetectedForFaction"},
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
			AvatarValueSet	{Player = "pl_Human", Name = "av_P502_OnDragon", Value = 0 },
			MapFlagSetTrue	{Name = "mf_P502_Surian"},
			FigureVanish	{Tag = "Surian"},
			NoSpawnEffect	{Spawn = FigureNpcSpawnToEntity	{Tag = "Surian", Level = 18 , UnitId = 1689 , TargetTag = "pl_HumanAvatar", Team = "tm_Team1"}, },
			FigurePlayerTransfer	{Tag = "Surian" },
			DragonCallEnable {},
			MapFlagSetTrue {Name = "mf_P502_MapChangeDetectedForFaction"},
		},
		GotoState = self,
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "MG_IO"},
			MapFlagIsTrue	{Name = "mf_P502_PrismPieceDelivery"},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "Twiddle"},
		},
	};

OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{ Name = "mf_p502_EndSomethingToFightForCS" },
		},
		Actions = 
		{
			FigurePlayerTransfer	{Tag = "Surian" },		
		},
	};
	
	
	OnEvent
	{
		EventName = "PostMapTravelFractionSet1",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P502_MapChangeDetectedForFaction"},
			AvatarValueIsEqual	{Name = "av_P502_FactionChosen", Value = 1 },			
		},
		Actions = 
		{
			PlayerChangeFraction {Player = "pl_Human" , Faction = 1 },
			MapFlagSetFalse {Name = "mf_P502_MapChangeDetectedForFaction"},
			PlayerBuildingAdd	{BuildingId = 115 },
			PlayerBuildingAdd	{BuildingId = 116 },
			PlayerBuildingAdd	{BuildingId = 118 },
			PlayerBuildingAdd	{BuildingId = 119 },
			PlayerBuildingAdd	{BuildingId = 120 },
			PlayerBuildingAdd	{BuildingId = 121 },
			PlayerBuildingAdd	{BuildingId = 122 },
			PlayerBuildingAdd	{BuildingId = 123 },
			PlayerBuildingAdd	{BuildingId = 124 },
			PlayerBuildingAdd	{BuildingId = 125 },
			PlayerBuildingAdd	{BuildingId = 126 },
			PlayerBuildingAdd	{BuildingId = 128 },
			PlayerBuildingAdd	{BuildingId = 130 },
			PlayerBuildingAdd	{BuildingId = 131 },


			
			PlayerBuildingUpgradeAdd	{UpgradeId = 6 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 7 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 8 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 9 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 10 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 11 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 12 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 13 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 14 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 15 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 16 },

		},
		GotoState = self,
	};
	
	OnEvent
	{
		EventName = "PostMapTravelFractionSet2",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P502_MapChangeDetectedForFaction"},
			AvatarValueIsEqual	{Name = "av_P502_FactionChosen", Value = 2 },			
		},
		Actions = 
		{
			PlayerChangeFraction {Player = "pl_Human" , Faction = 8 },
			MapFlagSetFalse {Name = "mf_P502_MapChangeDetectedForFaction"},
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 191 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 192 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 193 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 194 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 195 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 196 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 197 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 198 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 199 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 200 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 201 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 203 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 204 },
			
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 45 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 46 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 47 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 48 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 49 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 50 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 51 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 52 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 53 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 54 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 55 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 56 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 57 },
			
			PlayerUnitUpgradeAdd	{UpgradeId = 9 },
			PlayerUnitUpgradeAdd	{UpgradeId = 10 },
			PlayerUnitUpgradeAdd	{UpgradeId = 11 },
			PlayerUnitUpgradeAdd	{UpgradeId = 12 },
			PlayerUnitUpgradeAdd	{UpgradeId = 13 },
			PlayerUnitUpgradeAdd	{UpgradeId = 14 },
			PlayerUnitUpgradeAdd	{UpgradeId = 15 },
			PlayerUnitUpgradeAdd	{UpgradeId = 16 },
			PlayerUnitUpgradeAdd	{UpgradeId = 17 },
			PlayerUnitUpgradeAdd	{UpgradeId = 18 },
		},
		GotoState = self,
	};
	
	OnEvent
	{
		EventName = "PostMapTravelFractionSet3",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P502_MapChangeDetectedForFaction"},
			AvatarValueIsEqual	{Name = "av_P502_FactionChosen", Value = 3 },			
		},
		Actions = 
		{
			PlayerChangeFraction {Player = "pl_Human" , Faction = 2 },
			MapFlagSetFalse {Name = "mf_P502_MapChangeDetectedForFaction"},
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 149 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 150 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 152 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 153 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 154 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 155 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 156 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 157 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 158 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 159 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 160 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 161 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 162 },
			PlayerBuildingAdd	{Player = "pl_Human", BuildingId = 163 },
			
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 19 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 21 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 23 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 25 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 27 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 29 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 31 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 33 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 35 },			
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 37 },
			PlayerBuildingUpgradeAdd	{Player = "pl_Human", UpgradeId = 39},		
		},
		GotoState = self,
	};
	
	OnEvent
	{
		EventName = "PostMapTravelFractionSet4",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P502_MapChangeDetectedForFaction"},
			AvatarValueIsEqual	{Name = "av_P502_FactionChosen", Value = 4 },			
		},
		Actions = 
		{
			PlayerChangeFraction {Player = "pl_Human" , Faction = 3 },
			
			PlayerBuildingAdd	{BuildingId = 133 },
			PlayerBuildingAdd	{BuildingId = 134 },
			PlayerBuildingAdd	{BuildingId = 136 },
			PlayerBuildingAdd	{BuildingId = 137 },
			PlayerBuildingAdd	{BuildingId = 138 },
			PlayerBuildingAdd	{BuildingId = 139 },
			PlayerBuildingAdd	{BuildingId = 140 },
			PlayerBuildingAdd	{BuildingId = 141 },
			PlayerBuildingAdd	{BuildingId = 142 },
			PlayerBuildingAdd	{BuildingId = 143 },
			PlayerBuildingAdd	{BuildingId = 144 },
			PlayerBuildingAdd	{BuildingId = 145 },
			PlayerBuildingAdd	{BuildingId = 146 },
			PlayerBuildingAdd	{BuildingId = 147},
			PlayerBuildingUpgradeAdd	{UpgradeId = 18 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 20 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 22 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 24 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 26 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 28 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 30 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 32 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 34 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 36 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 38 },		
			MapFlagSetFalse {Name = "mf_P502_MapChangeDetectedForFaction"},
		},
		GotoState = self,
	};
	
	
	OnOneTimeEvent
	{
		Conditions =
		{},
		Actions = 
		{
			FigureVanish {Tag = "MG_out_Village_Chosen_01"},
			FigureVanish {Tag = "MG_out_Village_Chosen_02"},
			FigureVanish {Tag = "MG_out_Village_Chosen_03"},
			
			FigureVanish {Tag = "MG_out_Village_Spike_01"},
			FigureVanish {Tag = "MG_Village_Chosen_04"},
			FigureVanish {Tag = "MG_Village_Demonic_Warrior_06"},
			FigureVanish {Tag = "MG_Village_Demonic_Warrior_07"},
			FigureVanish {Tag = "MG_Village_Chosen_01"},
			FigureVanish {Tag = "MG_Village_Chosen_02"},
			FigureVanish {Tag = "MG_Village_Chosen_03"},
			
			FigureVanish {Tag = "MG_Village_Chosen_05"},
			FigureVanish {Tag = "MG_Village_Chosen_06"},
			FigureVanish {Tag = "MG_Village_Chosen_07"},
			FigureVanish {Tag = "MG_Village_Chosen_08"},
			
			FigureVanish {Tag = "MG_Village_Demonic_Warrior_01"},
			FigureVanish {Tag = "MG_Village_Demonic_Warrior_02"},
			FigureVanish {Tag = "MG_Village_Demonic_Warrior_03"},
			FigureVanish {Tag = "MG_Village_Demonic_Warrior_04"},
			FigureVanish {Tag = "MG_Village_Demonic_Warrior_05"},
			
			FigureVanish {Tag = "MG_Village_Demonic_Warrior_08"},
			FigureVanish {Tag = "MG_Village_Mage"},
			FigureVanish {Tag = "MG_Village_Spike_01"},
			FigureVanish {Tag = "MG_Village_Spike_02"},
			FigureVanish {Tag = "MG_Village_Spike_03"},		
		},
	};
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "MG_KNOWYOURENEMY"},			
		},
		Actions = 
		{
			FigureRespawn {Tag = "MG_out_Village_Chosen_01",X = 447.177, Y = 481.295},
			--FigureRespawn {Tag = "MG_out_Village_Chosen_02",X = 439.128, Y = 482.562},
			--FigureRespawn {Tag = "MG_out_Village_Chosen_03",X = 432.904, Y = 475.881},
			
			FigureRespawn {Tag = "MG_out_Village_Spike_01",X = 441.687, Y = 485.578},
			FigureRespawn {Tag = "MG_Village_Chosen_04", X = 442.135, Y = 490.322},
			FigureRespawn {Tag = "MG_Village_Demonic_Warrior_06", X = 437.622, Y = 487.849},
			FigureRespawn {Tag = "MG_Village_Demonic_Warrior_07", X = 433.026, Y = 483.518},
			FigureRespawn {Tag = "MG_Village_Chosen_01", X = 528.028, Y = 537.932},
			FigureRespawn {Tag = "MG_Village_Chosen_02", X = 530.731, Y = 530.831},
			FigureRespawn {Tag = "MG_Village_Chosen_03", X = 541.963, Y = 530.036},
			
			FigureRespawn {Tag = "MG_Village_Chosen_05", X = 537.902, Y = 526.624},
			FigureRespawn {Tag = "MG_Village_Chosen_06", X = 551.83, Y = 562.393},
			FigureRespawn {Tag = "MG_Village_Chosen_07", X = 536.193, Y = 536.368},
			FigureRespawn {Tag = "MG_Village_Chosen_08", X = 542.786, Y = 563.345},
			
			FigureRespawn {Tag = "MG_Village_Demonic_Warrior_01", X = 532.677, Y = 523.393},
			FigureRespawn {Tag = "MG_Village_Demonic_Warrior_02", X = 540.326, Y = 553.824},
			FigureRespawn {Tag = "MG_Village_Demonic_Warrior_03", X = 559.493, Y = 543.537},
			FigureRespawn {Tag = "MG_Village_Demonic_Warrior_04", X = 562.26, Y = 536.964},
			FigureRespawn {Tag = "MG_Village_Demonic_Warrior_05", X = 557.091, Y = 549.804},
			
			FigureRespawn {Tag = "MG_Village_Demonic_Warrior_08", X = 545.867, Y = 533.618},
			FigureRespawn {Tag = "MG_Village_Mage", X = 546.796, Y = 562.097},
			FigureRespawn {Tag = "MG_Village_Spike_01", X = 547.373, Y = 551.461},
			FigureRespawn {Tag = "MG_Village_Spike_02", X = 552.909, Y = 552.84},
			FigureRespawn {Tag = "MG_Village_Spike_03", X = 520.13, Y = 537.593},		
			
			MapFlagSetTrue {Name = "mf_P502_FigureRespawnForEnemyQuest"},
			MapFlagSetTrue {Name = "mf_P502_StartPatrols_nameless_village2"},
		}
	};
	--Beast ambush trigger 1
	OnOneTimeEvent
	{		
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "beast_detect_marker", Range = 15 },
		},
		Actions = 
		{
			FigureForcedRunToEntity	{Tag = "beast_guard_01", TargetTag = "beast_ambush_marker"},
			FigureForcedRunToEntity	{Tag = "beast_guard_02", TargetTag = "beast_ambush_marker"},
		},
	};	
	--Beast ambush trigger 2
	OnOneTimeEvent
	{		
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "beast_ambush_marker", Range = 15 },
		},
		Actions = 
		{
			FigureForcedRunToEntity	{Tag = "beast_ambush_01", TargetTag = "beast_ambush_marker"},
			FigureForcedRunToEntity	{Tag = "beast_ambush_02", TargetTag = "beast_ambush_marker"},
			FigureForcedRunToEntity	{Tag = "beast_ambush_03", TargetTag = "beast_ambush_marker"},
			FigureForcedRunToEntity	{Tag = "beast_ambush_04", TargetTag = "beast_ambush_marker"},
			FigureForcedRunToEntity	{Tag = "beast_ambush_05", TargetTag = "beast_ambush_marker"},
			FigureForcedRunToEntity	{Tag = "beast_ambush_06", TargetTag = "beast_ambush_marker"},
			
		},
	};
	-- TOWER AMBUSH
	OnOneTimeEvent
	{		
		Conditions = 
		{
		OR{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "MG_marker_towers", Range = 15 },
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "MG_marker_towers", Range = 15 },
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroSariel", TargetTag = "MG_marker_towers", Range = 15 },
			},
		},
		Actions = 
		{
			FigureForcedRunToEntity	{Tag = "beast_01", TargetTag = "MG_marker_towers"},
			FigureForcedRunToEntity	{Tag = "beast_02", TargetTag = "MG_marker_towers"},
			FigureForcedRunToEntity	{Tag = "beast_03", TargetTag = "MG_marker_towers"},
			FigureForcedRunToEntity	{Tag = "beast_04", TargetTag = "MG_marker_towers"},
			
			
		},
	};	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			BuildingIsDead	{Tag = "beast_tower"},
		},
		Actions = 
		{
			FigureForceAttackEntity	{Tag = "skyclaw_01", TargetTag = "pl_HumanAvatar"},		
		},
	};
}