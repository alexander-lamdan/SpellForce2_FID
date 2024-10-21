
State
{
	StateName = "Main",
		
	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
			FigurePlayerTransfer	{Tag = "default", Player = "pl_Human1"},
			FigureOutcry		{Tag = "default", TextTag = "Seer01"},
			
			--FigurePlayerTransfer	{Tag = "OrcCamp02Seeker01", Player = "pl_Human1"},
		},
	},
	
};
