State
{
	StateName = "INIT",

OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_GivePrism"},
		},
		Actions = 
		{
			AvatarItemEquipmentTake	{ ItemId = 1265 , Amount = 1},
			MapTimerStart	{Name = "mt_P502_HirinTakeitem"},
		},
	};
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_GivePrism"},
			MapTimerIsElapsed	{Name = "mt_P502_HirinTakeitem", Seconds = 5 },
		},
		Actions = 
		{			
			MapTimerStop	{Name = "mt_P502_HirinTakeitem"},
			FigureVanish	{Tag = "Hirin"},	
		},
	};

	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_TakePrism"},			
		},
		Actions = 
		{			
			AvatarItemEquipmentTake	{ ItemId = 1265 , Amount = 1},
			MapTimerStart	{Name = "mt_P502_HirinTakeitem2"},
		},
	};

	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_TakePrism"},
			MapTimerIsElapsed	{Name = "mt_P502_HirinTakeitem2", Seconds = 5 },
		},
		Actions = 
		{			
			MapTimerStop	{Name = "mt_P502_HirinTakeitem2"},
			FigureVanish	{Tag = "Hirin"},	
		},
	};
			
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_HirinFight"},
			FigureIsDead	{Tag = "pl_HumanAvatar"},
		},
		Actions = 
		{			
			FigureTeamTransfer	{Tag = "Hirin", Team = "tm_TeamNeutral"},
			MapFlagSetTrue	{Name = "mf_P502_HirinDefeatedPlayer"},
			MapFlagSetTrue	{Name = "mf_P502_TakePrism"},			
		},
	};
	
		OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_HirinFight"},
			MapFlagIsTrue	{Name = "mf_P502_HirinDefeatedPlayer"},
			AvatarHasNotItemMisc	{ItemId = 1265 , Amount = 1 },
		},
		Actions = 
		{			
					FigureVanish	{Tag = "Hirin"},	
		},
	};

		OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_SpiritsDialogOver"},
		},
		Actions = 
		{			
					FigureVanish	{Tag = "Hirin"},	
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_HirinOver"},
		},
		Actions = 
		{			
					FigureVanish	{Tag = "Hirin"},	
		},
	};
	
	OnEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P502_PrismOfMagicStarted"},
			--MapTimerIsElapsed	{Name = "mt_P502_PrismOfMagicTimer", Seconds = 600 },
			AvatarValueIsEqual	{Name = "av_P502_PrismWave", Value = 0 },
			MapFlagIsFalse	{Name = "mf_P502_PrismofMagicWaveSpawned"},
			AvatarIsNotTalking	{},
			AvatarHasItemEquipment	{ ItemId = 1265 , Amount = 1 , SearchEquipment = true, SearchHeroEquipment = true},
		},
		Actions = 
		{
			FigureNpcSpawnToEntity	{Tag = "Prism_01", Level = 2 , UnitId = 490, TargetTag = "pl_HumanAvatar", Team = "tm_Team2"},
			FigureNpcSpawnToEntity	{Tag = "Prism_02", Level = 2 , UnitId = 38, TargetTag = "pl_HumanAvatar", Team = "tm_Team2"},
			FigureNpcSpawnToEntity	{Tag = "Prism_03", Level = 2 , UnitId = 1142, TargetTag = "pl_HumanAvatar", Team = "tm_Team2"},
			FigureNpcSpawnToEntity	{Tag = "Prism_04", Level = 2 , UnitId = 799, TargetTag = "pl_HumanAvatar", Team = "tm_Team2"},
			FigureNpcSpawnToEntity	{Tag = "Prism_05", Level = 2 , UnitId = 1198, TargetTag = "pl_HumanAvatar", Team = "tm_Team2"},
			MapFlagSetTrue	{Name = "mf_P502_PrismofMagicWaveSpawned"},
			MapFlagSetFalse	{Name = "mf_P502_AllHirinWavesDefeated"},
			MapTimerStart	{Name = "mt_P502_PrismOfMagicTimer"},
			AvatarValueAdd	{ Name = "av_P502_PrismWave", Value = 1 },
		},
	};
	
	OnEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P502_PrismOfMagicStarted"},
			MapTimerIsElapsed	{Name = "mt_P502_PrismOfMagicTimer", Seconds = 900 },
			MapFlagIsFalse	{Name = "mf_P502_PrismofMagicWaveSpawned"},
--			AvatarHasItemEquipment	{ ItemId = 1265 , Amount = 1 , SearchEquipment = true, SearchHeroEquipment = true},
			AvatarValueIsLess	{Name = "av_P502_PrismWave", Value = 8},
			MapFlagIsTrue	{Name = "mf_P502_SpiritsDialogOver"},
			AvatarIsNotTalking	{},
			AvatarHasItemEquipment	{ ItemId = 1265 , Amount = 1 , SearchEquipment = true, SearchHeroEquipment = true},
		},
		Actions = 
		{
			FigureNpcSpawnToEntity	{Tag = "Prism_01", Level = 5 , UnitId = 490, TargetTag = "pl_HumanAvatar", Team = "tm_Team2"},
			FigureNpcSpawnToEntity	{Tag = "Prism_02", Level = 5 , UnitId = 38, TargetTag = "pl_HumanAvatar", Team = "tm_Team2"},
			FigureNpcSpawnToEntity	{Tag = "Prism_03", Level = 5 , UnitId = 1142, TargetTag = "pl_HumanAvatar", Team = "tm_Team2"},
			FigureNpcSpawnToEntity	{Tag = "Prism_04", Level = 5 , UnitId = 799, TargetTag = "pl_HumanAvatar", Team = "tm_Team2"},
			FigureNpcSpawnToEntity	{Tag = "Prism_05", Level = 5 , UnitId = 1198, TargetTag = "pl_HumanAvatar", Team = "tm_Team2"},
			MapFlagSetTrue	{Name = "mf_P502_PrismofMagicWaveSpawned"},
			MapTimerStop	{Name = "mt_P502_PrismOfMagicTimer"},
			MapTimerStart	{Name = "mt_P502_PrismOfMagicTimer"},
			AvatarValueAdd	{ Name = "av_P502_PrismWave", Value = 1 },
		},
	};
		
	
	
OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_PrismofMagicWaveKilled"},
			AvatarValueIsEqual	{ Name = "av_P502_PrismWave", Value = 1 },
			FigureIsDead {Tag = "Hirin"},			
		},
		Actions = 
		{
			FigureRespawnToEntity	{Tag = "Hirin", TargetTag = "pl_HumanAvatar"},
			FigureTeamTransfer	{Tag = "Hirin", Team = "tm_Team1"},			
			FigureHateClear	{Tag = "Hirin"},			
			MapTimerStart	{Name = "mt_P502_PrismOfMagicHirin"},
		},
	};
OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarValueIsEqual	{ Name = "av_P502_PrismWave", Value = 1 },
			MapTimerIsElapsed	{Name = "mt_P502_PrismOfMagicHirin", Seconds = 3},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Hirin"},
		--	DialogBegin	{Tag = "Hirin"},			
			MapTimerStop	{Name = "mt_P502_PrismOfMagicHirin"},
		},
	};


OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_PrismofMagicWaveSpawned"},
			FigureIsDead	{Tag = "Prism_01"},
			FigureIsDead	{Tag = "Prism_02"},
			FigureIsDead	{Tag = "Prism_03"},
			FigureIsDead	{Tag = "Prism_04"},
			FigureIsDead	{Tag = "Prism_05"},
			--MapTimerIsElapsed	{Name = "", Seconds = },
		},
		Actions = 
		{
		
			MapFlagSetFalse	{Name = "mf_P502_PrismofMagicWaveSpawned"},
			MapFlagSetTrue	{Name = "mf_P502_PrismofMagicWaveKilled"},

		},		
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarValueIsEqual	{Name = "av_P502_PrismWave", Value = 8},
			FigureIsDead	{Tag = "Prism_01"},
			FigureIsDead	{Tag = "Prism_02"},
			FigureIsDead	{Tag = "Prism_03"},
			FigureIsDead	{Tag = "Prism_04"},
			FigureIsDead	{Tag = "Prism_05"},
			--MapTimerIsElapsed	{Name = "", Seconds = },
		},
		Actions = 
		{			
					
			MapFlagSetTrue	{Name = "mf_P502_AllHirinWavesDefeated"},
			MapTimerStop	{Name = "mt_P502_PrismOfMagicTimer"},
			
		},		
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_AllHirinWavesDefeated"},
		},
		Actions = 
		{
			FigureRespawnToEntity	{Tag = "Hirin", TargetTag = "pl_HumanAvatar"},
			FigureTeamTransfer	{Tag = "Hirin", Team = "tm_Team1"},			
			FigureHateClear	{Tag = "Hirin"},
			DialogSetEnabled	{Tag = "Hirin"},
		},
	};
	
	


	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_PrismofMagicWaveSpawned"},
			FigureIsDead	{Tag = "pl_HumanHeroCaine"},
			FigureIsDead	{Tag = "pl_HumanHeroSariel"},
			FigureIsDead	{Tag = "pl_HumanHeroIO"},
			FigureIsDead	{Tag = "pl_HumanAvatar"},
			FigureIsDead	{Tag = "pl_HumanAntara"},
		},
		Actions = 
		{
			AvatarFlagSetFalse	{Name = "af_P502_PrismOfMagicStarted"},
			MapTimerStop	{Name = "mt_P502_PrismOfMagicTimer"},
			MapFlagSetTrue	{Name = "mf_P502_PlayerDefeated"},	
			MapFlagSetFalse	{Name = "mf_P502_PrismofMagicWaveSpawned"},

		},		
	};
	
		OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_PlayerDefeated"},	
			MapFlagIsFalse	{Name = "mf_P502_PlayerDefeatedRespawned"},	
			FigureIsAlive	{Tag = "Prism_01"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P502_PlayerDefeatedRespawned"},	
			
			AvatarSpawnToEntity	{TargetTag = "Prism_01", Direction = 0},
			FigureHeroSpawnToEntity	{ Tag = "HeroCaine", TargetTag = "Prism_01", Direction = 0},
			FigureHeroSpawnToEntity	{ Tag = "HeroHeroIO", TargetTag = "Prism_01", Direction = 0},
			FigureHeroSpawnToEntity	{ Tag = "HeroSariel", TargetTag = "Prism_01", Direction = 0},
			FigureHeroSpawnToEntity	{ Tag = "HeroAntara", TargetTag = "Prism_01", Direction = 0},
					
			FigureVanish	{Tag = "Prism_01"},
			FigureVanish	{Tag = "Prism_02"},
			FigureVanish	{Tag = "Prism_03"},
			FigureVanish	{Tag = "Prism_04"},
			FigureVanish	{Tag = "Prism_05"},
			FigureVanish	{Tag = "Hirin"},			
			FigureRespawnToEntity	{Tag = "Hirin", TargetTag = "pl_HumanAvatar"},
			
			MapFlagSetTrue	{Name = "mf_P502_PlayerResurrected"},		
		},		
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_PlayerResurrected"},
		},
		Actions = 
		{					
			DialogSetEnabled	{Tag = "Hirin"},						
		},		
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_PlayerDefeated"},
			MapFlagIsFalse	{Name = "mf_P502_PlayerDefeatedRespawned"},	
			FigureIsAlive	{Tag = "Hirin"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P502_PlayerDefeatedRespawned"},	
		
			AvatarSpawnToEntity	{TargetTag = "Hirin", Direction = 0},
			FigureHeroSpawnToEntity	{ Tag = "HeroCaine", TargetTag = "Hirin", Direction = 0},
			FigureHeroSpawnToEntity	{ Tag = "HeroHeroIO", TargetTag = "Hirin", Direction = 0},
			FigureHeroSpawnToEntity	{ Tag = "HeroSariel", TargetTag = "Hirin", Direction = 0},
			FigureHeroSpawnToEntity	{ Tag = "HeroAntara", TargetTag = "Hirin", Direction = 0},	
			
			FigureVanish	{Tag = "Prism_01"},
			FigureVanish	{Tag = "Prism_02"},
			FigureVanish	{Tag = "Prism_03"},
			FigureVanish	{Tag = "Prism_04"},
			FigureVanish	{Tag = "Prism_05"},
			
			FigureVanish	{Tag = "Hirin"},				
			FigureRespawnToEntity	{Tag = "Hirin", TargetTag = "pl_HumanAvatar"},
			
			MapFlagSetTrue	{Name = "mf_P502_PlayerResurrected"},		
		},		
	};
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_PlayerDefeated"},
			MapFlagIsFalse	{Name = "mf_P502_PlayerDefeatedRespawned"},	
			FigureIsAlive	{Tag = "Prism_02"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P502_PlayerDefeatedRespawned"},	
		
			AvatarSpawnToEntity	{TargetTag = "Prism_02", Direction = 0},
			FigureHeroSpawnToEntity	{ Tag = "HeroCaine", TargetTag = "Prism_02", Direction = 0},
			FigureHeroSpawnToEntity	{ Tag = "HeroHeroIO", TargetTag = "Prism_02", Direction = 0},
			FigureHeroSpawnToEntity	{ Tag = "HeroSariel", TargetTag = "Prism_02", Direction = 0},
			FigureHeroSpawnToEntity	{ Tag = "HeroAntara", TargetTag = "Prism_02", Direction = 0},	
			
			FigureVanish	{Tag = "Prism_01"},
			FigureVanish	{Tag = "Prism_02"},
			FigureVanish	{Tag = "Prism_03"},
			FigureVanish	{Tag = "Prism_04"},
			FigureVanish	{Tag = "Prism_05"},
			
			FigureVanish	{Tag = "Hirin"},				
			FigureRespawnToEntity	{Tag = "Hirin", TargetTag = "pl_HumanAvatar"},
			
			MapFlagSetTrue	{Name = "mf_P502_PlayerResurrected"},		
		},		
	};
	
		OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_PlayerDefeated"},
			MapFlagIsFalse	{Name = "mf_P502_PlayerDefeatedRespawned"},	
			FigureIsAlive	{Tag = "Prism_03"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P502_PlayerDefeatedRespawned"},		
			
			AvatarSpawnToEntity	{TargetTag = "Prism_03", Direction = 0},
			FigureHeroSpawnToEntity	{ Tag = "HeroCaine", TargetTag = "Prism_03", Direction = 0},
			FigureHeroSpawnToEntity	{ Tag = "HeroHeroIO", TargetTag = "Prism_03", Direction = 0},
			FigureHeroSpawnToEntity	{ Tag = "HeroSariel", TargetTag = "Prism_03", Direction = 0},
			FigureHeroSpawnToEntity	{ Tag = "HeroAntara", TargetTag = "Prism_03", Direction = 0},
			
			FigureVanish	{Tag = "Prism_01"},
			FigureVanish	{Tag = "Prism_02"},
			FigureVanish	{Tag = "Prism_03"},
			FigureVanish	{Tag = "Prism_04"},
			FigureVanish	{Tag = "Prism_05"},
						
			FigureVanish	{Tag = "Hirin"},				
			FigureRespawnToEntity	{Tag = "Hirin", TargetTag = "pl_HumanAvatar"},
			
			MapFlagSetTrue	{Name = "mf_P502_PlayerResurrected"},		
		},		
	};
	
	
			OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_PlayerDefeated"},
			MapFlagIsFalse	{Name = "mf_P502_PlayerDefeatedRespawned"},	
			FigureIsAlive	{Tag = "Prism_04"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P502_PlayerDefeatedRespawned"},		
			
			AvatarSpawnToEntity	{TargetTag = "Prism_04", Direction = 0},
			FigureHeroSpawnToEntity	{ Tag = "HeroCaine", TargetTag = "Prism_04", Direction = 0},
			FigureHeroSpawnToEntity	{ Tag = "HeroHeroIO", TargetTag = "Prism_04", Direction = 0},
			FigureHeroSpawnToEntity	{ Tag = "HeroSariel", TargetTag = "Prism_04", Direction = 0},
			FigureHeroSpawnToEntity	{ Tag = "HeroAntara", TargetTag = "Prism_04", Direction = 0},
			
			FigureVanish	{Tag = "Prism_01"},
			FigureVanish	{Tag = "Prism_02"},
			FigureVanish	{Tag = "Prism_03"},
			FigureVanish	{Tag = "Prism_04"},
			FigureVanish	{Tag = "Prism_05"},
			
			FigureVanish	{Tag = "Hirin"},				
			FigureRespawnToEntity	{Tag = "Hirin", TargetTag = "pl_HumanAvatar"},
			
			MapFlagSetTrue	{Name = "mf_P502_PlayerResurrected"},		
		},		
	};
	
	
			OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_PlayerDefeated"},
			MapFlagIsFalse	{Name = "mf_P502_PlayerDefeatedRespawned"},	
			FigureIsAlive	{Tag = "Prism_05"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P502_PlayerDefeatedRespawned"},		
			
			AvatarSpawnToEntity	{TargetTag = "Prism_05", Direction = 0},
			FigureHeroSpawnToEntity	{ Tag = "HeroCaine", TargetTag = "Prism_05", Direction = 0},
			FigureHeroSpawnToEntity	{ Tag = "HeroHeroIO", TargetTag = "Prism_05", Direction = 0},
			FigureHeroSpawnToEntity	{ Tag = "HeroSariel", TargetTag = "Prism_05", Direction = 0},
			FigureHeroSpawnToEntity	{ Tag = "HeroAntara", TargetTag = "Prism_05", Direction = 0},
			
			FigureVanish	{Tag = "Prism_01"},
			FigureVanish	{Tag = "Prism_02"},
			FigureVanish	{Tag = "Prism_03"},
			FigureVanish	{Tag = "Prism_04"},
			FigureVanish	{Tag = "Prism_05"},
			
			FigureVanish	{Tag = "Hirin"},				
			FigureRespawnToEntity	{Tag = "Hirin", TargetTag = "pl_HumanAvatar"},
			
			MapFlagSetTrue	{Name = "mf_P502_PlayerResurrected"},		
			
		},		
	};

};