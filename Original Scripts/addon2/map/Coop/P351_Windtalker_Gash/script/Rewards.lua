State
{
	StateName = "INIT",

	-- 
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_FoundEvilPriest1"},
			FigureIsDead  {Tag  = "EvilPriest1"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_KilledEvilPriest1" },
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_FoundEvilPriest2"},
			FigureIsDead  {Tag  = "EvilPriest2"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_KilledEvilPriest2" },
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_FoundEvilPriest3"},
			FigureIsDead  {Tag  = "EvilPriest3"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_KilledEvilPriest3" },
		},
	},


	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Clans01", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Clans01", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_ClanAI1Defeated"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Clans02", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Clans02", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_ClanAI2Defeated"},
		},
	},

	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "RuneGuardian01"},
			FigureIsDead	{Tag = "RuneGuardian02"},
			FigureIsDead	{Tag = "RuneGuardian03"},
			FigureIsDead	{Tag = "RuneGuardian04"},
			FigureIsDead	{Tag = "RuneGuardian05"},
			FigureIsDead	{Tag = "RuneGuardian06"},
			FigureIsDead	{Tag = "RuneGuardian07"},  
			FigureIsDead	{Tag = "RuneGuardian08"},
			FigureIsDead	{Tag = "RuneGuardian09"},
			FigureIsDead	{Tag = "RuneGuardian10"},
			FigureIsDead	{Tag = "RuneGuardian11"},
			FigureIsDead	{Tag = "RuneGuardian12"},
			FigureIsDead	{Tag = "RuneGuardian13"},
			FigureIsDead	{Tag = "RuneGuardian14"},
			FigureIsDead	{Tag = "RuneGuardian15"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_DefeatedRuneGuardians"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "GraveGuard"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_GraveGuardDefeated"},
		},
	},	
};


