
State
{
	StateName = "INIT",
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Village1"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_Village1Cleared"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Village2"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_Village2Cleared"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Village3"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_Village3Cleared"},
		},
	},		
	-- Undead Camps
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Undead1", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Undead1", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_UndeadCamp1Cleared"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Undead2", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Undead2", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_UndeadCamp2Cleared"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Undead3", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Undead3", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_UndeadCamp3Cleared"},
		},
	},		
	
};      







--		mf_Village1Cleared			=	{XP = 2000},
--	    mf_Village2Cleared			=	{XP = 2000},
--	    mf_Village3Cleared			=	{XP = 2000},
--	                                                
--	    mf_UndeadCamp1Cleared		=	{XP = 1000},
--	    mf_UndeadCamp2Cleared		=	{XP = 1000},
--		mf_UndeadCamp3Cleared		=	{XP = 1000},