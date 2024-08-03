State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_LenyaOver"},
		},
		Actions = 
		{
			EffectStartAtEntityPosition {File = "Effect_Spawn_Unit"},
		},
		DelayedActions = 
		{
			DialogSetEnabled	{Tag = "Treant"},
		},
		NoSpawnEffect = false,
	};


--	
--			OnOneTimeEvent
--	{		
--		Conditions = 
--		{
--					
--		},
--		Actions = 
--		{	
--			FigureRespawn	{Tag = "Treant"},
--			EntityTimerStart	{Name = "et_P502_TreantSpawn"},
--		},
--	};
--	
--	OnOneTimeEvent
--	{		
--		Conditions = 
--		{
--			EntityTimerIsElapsed	{Name = "et_P502_TreantSpawn", Seconds = 3  },
--		},
--		Actions = 
--		{				
--			EntityTimerStop	{Name = "et_P502_TreantSpawn"},
--			DialogSetEnabled	{Tag = "Treant"},
--		},
--	};
	
}