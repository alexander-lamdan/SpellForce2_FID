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
				Goto = FigurePatrolWalkToEntity {Tag = "default", TargetTag = "VampireWP03"},
				Tags = 
				{
					"VampireWP03",
					"VampireWP01",
				},
			},

		},
	},
};