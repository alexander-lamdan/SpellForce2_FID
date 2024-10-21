State
{
	StateName = "INIT",
	
	-- 
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Clans", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Clans", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_ClansDefeated"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Undead", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Undead", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_UndeadDefeated"},
		},
	},	
};

