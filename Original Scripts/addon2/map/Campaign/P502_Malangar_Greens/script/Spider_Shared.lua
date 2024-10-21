State
{
	StateName = "INIT",
OnFigureRespawnEvent
	{
		WaitTime = 2,
		Conditions = 
		{
				FigureIsAlive	{Tag = "Spider_01"},
				FigureIsAlive	{Tag = "Spider_02"},
		},
		Actions = 
		{
		},
		DeathActions = 
		{
		},
		DelayedActions = 
		{
		},
		NoSpawnEffect = false,
		IsSpawnOnlyWhen = true,
	};
}