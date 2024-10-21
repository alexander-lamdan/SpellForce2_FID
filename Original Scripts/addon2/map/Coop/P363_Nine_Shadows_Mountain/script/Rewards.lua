State
{
	StateName = "INIT",
	
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

	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "CultCamp1"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_CultCamp1Defeated"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
				FigureIsDead	{Tag = "CultCamp2"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_CultCamp2Defeated"},
		},
	},		
};