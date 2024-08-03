State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_EndSalvationCS"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P501_SurianOnMap"},
		},
		NoSpawnEffect = true,
	};

}