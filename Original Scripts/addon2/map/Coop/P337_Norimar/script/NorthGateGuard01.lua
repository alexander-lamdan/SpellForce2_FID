State
{
	StateName = "INIT",
	OnIdleGoHomeFake
	{
		X = 368,
		Y = 583,
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

