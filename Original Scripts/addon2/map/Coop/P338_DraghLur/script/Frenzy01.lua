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
				Goto = FigurePatrolWalkToEntity {Tag = "default", TargetTag = "VampireWP01"},
				Tags = 
				{
					"VampireWP01",
					"VampireWP03",
				},
			},
		},
	},
};