
State
{
	StateName = "INIT",
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopMarketplaceGoldenFieldsReached"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopMarketplaceGoldenFieldsReached"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopMarketplaceGoldenFieldsReached"},
			FigureIsDead	{Tag = "LowLevelExp1"},
			MapFlagIsTrue	{Name = "mf_LowLevelRewards"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_LowLevelGroup1Defeated"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopMarketplaceGoldenFieldsReached"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopMarketplaceGoldenFieldsReached"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopMarketplaceGoldenFieldsReached"},
			FigureIsDead	{Tag = "LowLevelExp2"},
			MapFlagIsTrue	{Name = "mf_LowLevelRewards"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_LowLevelGroup2Defeated"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopGoldenFieldsCurse"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopGoldenFieldsCurse"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopGoldenFieldsCurse"},
			FigureIsDead	{Tag = "HighLevelMobs"},
			MapFlagIsTrue	{Name = "mf_HighLevelRewards"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_HighLevelEnemiesDefeated"},
		},
	},		
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopGoldenFieldsCurse"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopGoldenFieldsCurse"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopGoldenFieldsCurse"},
			BuildingIsDead	{Tag =  "HighLevelTowers"},
			MapFlagIsTrue	{Name = "mf_HighLevelRewards"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_HighLevelTowersDefeated"},
		},
	},				
};                                       
		                                                                   