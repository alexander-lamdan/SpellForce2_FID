State
{
	StateName = "INIT",
	
	-- 
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "CultCamp1"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_Camp1Cleared"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "CultCamp2"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_Camp2Cleared"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "CultCamp3"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_Camp3Cleared"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "CultCamp4"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_Camp4Cleared"},
		},
	},
};