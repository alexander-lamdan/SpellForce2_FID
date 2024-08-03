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
				Goto = FigurePatrolWalkToEntity {Tag = "default", TargetTag = "VampireWP04"},
				Tags = 
				{
					"VampireWP04",
					"VampireWP02",
				},
			},		
		},
	},
};