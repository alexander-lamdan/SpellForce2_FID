State
{
	StateName = "Flee",
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange  {Tag = "default", TargetTag = "DraghLurPortal", Range = 2},
		},
		Actions =
		{
			FigureVanish 	{Tag = "default"},
		},
	},
	
};

