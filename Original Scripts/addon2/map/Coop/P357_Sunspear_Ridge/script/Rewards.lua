
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
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_DemonAI1Defeated"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Demon02", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Demon02", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_DemonAI2Defeated"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "CultCamp"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_CultCampDefeated"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "BossGroup"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_BossDefeated"},
		},
	},
	
};