State
{
	StateName = "INIT",
	
	-- 
	
	OnOneTimeEvent
	{
		EventName = "UndeadPlayer1Wiped",
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Beasts", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Beasts", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_BeastsDefeated"},
		},
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "Giant1"},
			FigureIsDead {Tag = "Giant2"},
			FigureIsDead {Tag = "Giant3"},
			FigureIsDead {Tag = "Giant4"},
			FigureIsDead {Tag = "Giant5"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_GiantsDefeated"},	
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "Spider1"},
			FigureIsDead {Tag = "Spider2"},
			FigureIsDead {Tag = "Spider3"},
			FigureIsDead {Tag = "Spider4"},
			FigureIsDead {Tag = "Spider5"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_SpidersKilled"},	
		},
	},
	
};

