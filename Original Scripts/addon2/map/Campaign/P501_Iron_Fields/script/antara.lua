State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_AntaraNightmare"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P501_AntaraOnMap"},			
		},
		NoSpawnEffect = true,
	};

}