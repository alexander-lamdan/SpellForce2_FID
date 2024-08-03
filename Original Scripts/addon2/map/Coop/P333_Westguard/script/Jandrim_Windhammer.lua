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
}
