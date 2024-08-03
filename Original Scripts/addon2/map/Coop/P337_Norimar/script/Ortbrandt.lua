State
{
	StateName = "INIT",
	OnIdleGoHomeFake
	{
		X = 444,
		Y = 594,
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

