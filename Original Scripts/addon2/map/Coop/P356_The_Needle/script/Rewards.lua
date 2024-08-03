State
{
	StateName = "INIT",
	
	-- Demon Camps
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_ClansMainCamp", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_ClansMainCamp", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_ClanMainCampDefeated"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_ClansCamp01", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_ClansCamp01", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_ClanCamp1Defeated"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_ClansCamp02", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_ClansCamp02", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_ClanCamp2Defeated"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "boss"},
			FigureIsDead	{Tag = "BossGuard1"},
			FigureIsDead	{Tag = "BossGuard2"},
			FigureIsDead	{Tag = "BossGuard3"},
			FigureIsDead	{Tag = "BossGuard4"},
			
			MapFlagIsTrue {Name = "mf_BossSpawned"},		
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_BossDefeated"},
		},
	},
	
	
};
