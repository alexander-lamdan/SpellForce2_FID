State
{
	StateName = "IdleGoHome",
	
	OnIdleGoHomeFake
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Range = 1,
		UpdateInterval = 0,
		Conditions = 
		{
		},
		Actions = 
		{
		},
		HomeActions = 
		{
			FigureDirectionSet	{Tag = "default", Direction = GetEntityDirection()},
		},
		OneTimeHomeActions = 
		{
		},
	};
	
	OnEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "CoopAnkbrandLightFound"},
		},
		Actions = 
		{
			FigureWalk {Tag = "default", X = 394, Y = 384},
		},
		GotoState = "QuestsDone",
	};
}

State
{
	StateName = "QuestsDone",
	
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "default"},
			FigureIsInRange	{Tag = "default", Range = 3, X = 394, Y = 384},
		},
		Actions = 
		{
			FigurePathGoto
			{
				Goto = FigureWalk {Tag = "default", X = 394, Y = 392}, 
				Points = 
				{
					"406, 392",
					"406, 381",
					"401, 377",
					"394, 384",
				},
			},
		},
	};
}
