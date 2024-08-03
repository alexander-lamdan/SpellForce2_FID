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
				Goto = FigurePatrolWalkToEntity {Tag = "default", TargetTag = "RaptorWP01"},
				Tags = 
				{
					"RaptorWP01",
					"RaptorWP02",
				},
			},
		},
	},
};