State
{
	StateName = "INIT",
	
	-- 
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "Room1"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_Room1Cleared"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "Room2"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_Room2Cleared"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "Room3"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_Room3Cleared"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "Room4"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_Room4Cleared"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "Room5"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_Room5Cleared"},
		},
	},


	
};
