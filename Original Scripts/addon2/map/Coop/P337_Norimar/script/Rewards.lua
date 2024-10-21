State
{
	StateName = "RushwaterQuestRewards",
	
	-- Rewards für Honormarks werden im Platform Script vergeben:
	-- af_P337_GotHonorMark
	
	
	-- Boss Exp
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "BeastChief1"},
			MapFlagIsTrue		{Name   = "mf_BeastWiped"},
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
			FigureIsDead	{Tag = "BeastChief2"},
			MapFlagIsTrue	{Name   = "mf_BeastWiped"},
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
			FigureIsDead	{Tag = "BeastChief3"},
			MapFlagIsTrue	{Name   = "mf_BeastWiped"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_Boss03Killed"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "BeastChief4"},
			MapFlagIsTrue	{Name   = "mf_BeastWiped"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_Boss04Killed"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "BeastChief5"},
			MapFlagIsTrue	{Name   = "mf_BeastWiped"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_Boss05Killed"},
		},
	},
	-- Camp Exp
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Beast01", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Beast01", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_BeastCamp01Wiped"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Beast02", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Beast02", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_BeastCamp02Wiped"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Beast03", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Beast03", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_BeastCamp03Wiped"},
		},
	},


};