State
{
	StateName = "INIT",
	OnEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "MG_IO"},			
			MapFlagIsTrue {Name = "mf_P502_WaveIsReady" },		
			EntityFlagIsTrue	{Name = "ef_P502_Ready"},	
		},
		Actions = 
		{
			EntityFlagSetFalse	{Name = "ef_P502_Ready"},
			EntityTimerStart	{Name = "et_P502_AttackCheck"},
		--	FigureAttackEntity	{ TargetTag = "pl_HumanAvatar"},			
			FigureRunToEntity	{ TargetTag = "pl_HumanAvatar"},
		},
	};
	
	
		OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P502StopIoWave" },			
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
			QuestIsActive	{Quest = "MG_IO"},
			FigureIsAlive{Tag = "Io"},
			MapFlagIsFalse	{Name = "mf_P502StopIoWave"},
			OR{			
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "wave_end_marker", Range = 10},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroSariel", TargetTag = "wave_end_marker", Range = 10},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "wave_end_marker", Range = 10},
		}
		},
		Actions = 
		{
			EntityFlagSetTrue	{Name = "ef_P502_Ready"},
			--EntityTimerStart	{Name = "et_P502_AttackCheck"},	
		},
		DeathActions = 
		{
			EntityFlagSetFalse	{Name = "ef_P502_Ready"},
			MapFlagSetFalse	{Name = "mf_P502_WaveIsReady"},
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