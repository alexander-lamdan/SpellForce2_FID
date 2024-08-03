State
{
	StateName = "INIT",
	
	-- Demon Camps
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Demon01", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Demon01", Amount = 1},
			QuestIsNotSolved	{Quest = "CoopProtectMerchantsSolved", Player = "pl_Human1"},
			QuestIsNotSolved	{Quest = "CoopProtectMerchantsSolved", Player = "pl_Human2"},
			QuestIsNotSolved	{Quest = "CoopProtectMerchantsSolved", Player = "pl_Human3"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_Demons01Defeated"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Demon03", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Demon03", Amount = 1},
			QuestIsNotSolved	{Quest = "CoopProtectMerchantsSolved", Player = "pl_Human1"},
			QuestIsNotSolved	{Quest = "CoopProtectMerchantsSolved", Player = "pl_Human2"},
			QuestIsNotSolved	{Quest = "CoopProtectMerchantsSolved", Player = "pl_Human3"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_Demons03Defeated"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Demon04", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Demon04", Amount = 1},
			QuestIsNotSolved	{Quest = "CoopProtectMerchantsSolved", Player = "pl_Human1"},
			QuestIsNotSolved	{Quest = "CoopProtectMerchantsSolved", Player = "pl_Human2"},
			QuestIsNotSolved	{Quest = "CoopProtectMerchantsSolved", Player = "pl_Human3"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_Demons04Defeated"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Demon05", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Demon05", Amount = 1},
			QuestIsNotSolved	{Quest = "CoopProtectMerchantsSolved", Player = "pl_Human1"},
			QuestIsNotSolved	{Quest = "CoopProtectMerchantsSolved", Player = "pl_Human2"},
			QuestIsNotSolved	{Quest = "CoopProtectMerchantsSolved", Player = "pl_Human3"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_Demons05Defeated"},
		},
	},
	
	-- Raptoren
		OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "Raptor1"},
			FigureIsDead {Tag = "Raptor2"},
			QuestIsNotSolved	{Quest = "CoopProtectMerchantsSolved", Player = "pl_Human1"},
			QuestIsNotSolved	{Quest = "CoopProtectMerchantsSolved", Player = "pl_Human2"},
			QuestIsNotSolved	{Quest = "CoopProtectMerchantsSolved", Player = "pl_Human3"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_GiantRaptorsKilled"},
		},
	},
	
};

