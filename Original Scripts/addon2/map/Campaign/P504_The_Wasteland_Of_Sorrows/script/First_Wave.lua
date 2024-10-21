State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P504_First_Wave_Start"},

		},
		Actions = 
		{
			FigureRunToEntity	{ TargetTag = "WS_Pact_hq"},			
			--FigureRunToEntity	{ TargetTag = "bridge_marker"},			
		},
		--NoSpawnEffect = true,
	};
	
	OnFigureRespawnEvent	
	{
		WaitTime = 100,
		Conditions =
		{
			--MapFlagIsTrue {Name = "mf_P504_Second_Wave_Start"},
			MapFlagIsFalse {Name = "mf_P504_First_Wave_Done"},
			MapFlagIsFalse	{Name = "mf_P504_WizardsDead"},
			BuildingIsAlive	{Tag = "spawn_base"},
		},
		Actions = 
		{
			--FigureRunToEntity	{ TargetTag = "WS_Pact_hq"},			
			MapFlagSetTrue { Name = "mf_P504_First_Wave_Ready"},
			--FigureRunToEntity	{ TargetTag = "WS_Pact_hq"},			
			--AIEnemyAdd	{Player = "pl_HumanAvatar", Tag = "default"},
		},
		NoSpawnEffect = true, 
		IsSpawnOnlyWhen = true,
	};

}