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
			PlayerHasNotBuildingAmount	{Player = "pl_Enemy", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Enemy", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_ClansAIDefeated"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_ClansCamp01", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_ClansCamp01", Amount = 1},

			FigureIsDead	{Tag = "ClanCamp01Magister"},
			FigureIsDead	{Tag = "ClanCamp01Bodyguard01"},
			FigureIsDead	{Tag = "ClanCamp01Bodyguard02"},
			FigureIsDead	{Tag = "ClanCamp01Bodyguard03"},
			FigureIsDead	{Tag = "ClanCamp01Bodyguard04"},
			
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_ClansCamp01Defeated"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_ClansCamp02", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_ClansCamp02", Amount = 1},

			FigureIsDead	{Tag = "ClanCamp02Magister"},
			FigureIsDead	{Tag = "ClanCamp02Bodyguard01"},
			FigureIsDead	{Tag = "ClanCamp02Bodyguard02"},
			FigureIsDead	{Tag = "ClanCamp02Bodyguard03"},
			FigureIsDead	{Tag = "ClanCamp02Bodyguard04"},
			
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_ClansCamp02Defeated"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_ClansCamp03", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_ClansCamp03", Amount = 1},

			FigureIsDead	{Tag = "ClanCamp03Magister"},
			FigureIsDead	{Tag = "ClanCamp03Bodyguard01"},
			FigureIsDead	{Tag = "ClanCamp03Bodyguard02"},
			FigureIsDead	{Tag = "ClanCamp03Bodyguard03"},
			FigureIsDead	{Tag = "ClanCamp03Bodyguard04"},
			
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_ClansCamp03Defeated"},
		},
	},	
};