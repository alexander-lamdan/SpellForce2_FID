State
{
	StateName = "INIT",

	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P504_Second_Wave_Start"},
			MapFlagIsFalse	{Name = "mf_P504_WizardsDead"},
		},
		Actions = 
		{
			FigureRunToEntity	{ TargetTag = "WS_Pact_hq"},
			MapFlagSetTrue	{Name = "mf_P504_Second_Wave_Phase"},
		},
		NoSpawnEffect = true,
	};
	

	OnFigureRespawnEvent	
	{
		WaitTime = 100,
		Conditions =
		{
			--MapFlagIsFalse {Name = "mf_P504_Second_Wave_Again"},
			MapFlagIsFalse {Name = "mf_P504_Second_SpawnStop"},
			MapFlagIsTrue	{Name = "mf_P504_Second_Wave_Phase"},
			MapFlagIsFalse	{Name = "mf_P504_WizardsDead"},
			BuildingIsAlive	{Tag = "spawn_base"},
			--MapFlagIsFalse {Name = "mf_P504_Second_Wave_Done"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P504_Second_Wave_Again"},
			--MapFlagSetTrue { Name = "mf_P504_First_Wave_Ready"},
		},
		NoSpawnEffect = true, 
		IsSpawnOnlyWhen = true,
	};
}