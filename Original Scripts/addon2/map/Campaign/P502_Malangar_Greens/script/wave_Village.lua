State
{
	StateName = "INIT",
	OnEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "MG_FREESLAVES"},			
			MapFlagIsTrue {Name = "mf_P502_VillageWaveIsReady" },	
			EntityFlagIsTrue	{Name = "ef_P502_Ready"},			
		},
		Actions = 
		{

			EntityTimerStart	{Name = "et_P502_AttackCheck"},
			EntityFlagSetFalse	{Name = "ef_P502_Ready"},
		--	FigureAttackEntity	{ TargetTag = "pl_HumanAvatar"},			
			FigureRunToEntity	{ TargetTag = "pl_HumanAvatar"},
		},
	};
	
	
		OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P502StopVillageWave" },			
		},
		Actions = 
		{

			EntityTimerStart	{Name = "et_P502_AttackCheck"},
		--	FigureAttackEntity	{ TargetTag = "pl_HumanAvatar"},			
			FigureRunToEntity	{ TargetTag = "pl_HumanAvatar"},
		},
	};




		OnFigureRespawnEvent	
	{
		WaitTime = 90,
		Conditions =
		{
			QuestIsActive	{Quest = "MG_FREESLAVES"},			
			MapFlagIsFalse	{Name = "mf_P502StopVillageWave"},
		--	FigureIsNotInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "StopVillageWave", Range = 30},
		--	FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroSariel", TargetTag = "StopVillageWave", Range = 30},
		--	FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "Io", Range = 30},
		},
		Actions = 
		{
			EntityFlagSetTrue	{Name = "ef_P502_Ready"},
			--EntityTimerStart	{Name = "et_P502_AttackCheck"},	
		},
		DeathActions = 
		{
			EntityFlagSetFalse	{Name = "ef_P502_Ready"},
			MapFlagSetFalse	{Name = "mf_P502_VillageWaveIsReady"},
			EntityTimerStop	{Name = "et_P502_AttackCheck"},		
		}, 
		DelayedActions = 
		{
		}, 
		NoSpawnEffect = true, 
		IsSpawnOnlyWhen = true,
	};
	
	OnEvent
	{
			Conditions = 
		{
			
			EntityTimerIsElapsed	{Name = "et_P502_AttackCheck", Seconds = 10 },
			FigureIsNotInCombat	{},			
		},
		Actions = 
		{		
			FigureRunToEntity	{ TargetTag = "pl_HumanAvatar"},
			EntityTimerStart	{Name = "et_P502_AttackCheck"},	
		},	
	};


	
};