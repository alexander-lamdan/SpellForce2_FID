
State
{
	StateName = "INIT",
	
	-- Cult Camps
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead				{Tag = "CultBarbarianGuardians"},
			PlayerHasNotBuildingAmount	{Player = "pl_BarbarianCamp", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_BarbarianCamp", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_BarbariansDefeated"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead				{Tag = "CultTrollGuardians"},
			PlayerHasNotBuildingAmount	{Player = "pl_TrollCamp", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_TrollCamp", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_TrollsDefeated"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_ClanMainCamp", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_ClanMainCamp", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_ClansMainCampDefeated"},
		},
	},	
};
