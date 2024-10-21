State
{
	StateName = "INIT",
	OnIdleGoHomeFake
	{
		X = 463,
		Y = 571,
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

