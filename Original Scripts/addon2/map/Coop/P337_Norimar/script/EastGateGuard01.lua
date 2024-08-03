State
{
	StateName = "INIT",
	OnIdleGoHomeFake
	{
		X = 462,
		Y = 576,
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

