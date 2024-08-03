
State
{
	StateName = "INIT",
	
	-- Cult Camps
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Cultcamp1"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_CultCamp1Defeated"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Cultcamp2"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_CultCamp2Defeated"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Cultcamp3"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_CultCamp3Defeated"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Cultcamp4"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_CultCamp4Defeated"},
		},
	},	
	
	-- Final Camp
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "FinalCamp"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_FinalCampDefeated"},
		},
	},	
};