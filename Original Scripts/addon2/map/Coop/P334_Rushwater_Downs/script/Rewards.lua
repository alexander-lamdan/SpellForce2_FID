State
{
	StateName = "RushwaterQuestRewards",
	
	-- Rewards für Honormarks werden im Platform Script vergeben:
	-- af_P334_GotHonorMark1
	-- af_P334_GotHonorMark2
	
	
	-- Boss Exp
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Boss01"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_Boss01Killed"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Boss02"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_Boss02Killed"},
		},		
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Boss03"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_Boss03Killed"},
		},
	},
	
	-- Camp Exp
	OnOneTimeEvent
	{
		EventName = "UndeadPlayer1Wiped",
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Undead1", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Undead1", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_UndeadCamp1Wiped"},
		},
	},
	OnOneTimeEvent
	{
		EventName = "UndeadPlayer2Wiped",
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Undead2", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Undead2", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_UndeadCamp2Wiped"},
		},
	},

};