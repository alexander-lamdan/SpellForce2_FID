State
{
	StateName = "Patrol",
	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
			FigurePathGoto	
			{
				Goto = FigurePatrolWalkToEntity {Tag = "default", TargetTag = "VampireWP02"},
				Tags = 
				{
					"VampireWP02",
					"VampireWP04",
				},
			},
		},
	},
};