State
{
	StateName = "INIT",
	OnIdleGoHomeFake
	{
		X = 442,
		Y = 595,
		Range = 3,
		UpdateInterval = 1,
		StopFigureWhenConditionsAreFalse = true,
		Conditions = 
		{
			FigureIsNotInCombat {Tag = "default"},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
		},
		OneTimeHomeActions = 
		{
		},
	},
};

