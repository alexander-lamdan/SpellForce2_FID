State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Pact1", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Pact1", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_PactCamp1Defeated"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Pact2", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Pact2", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_PactCamp2Defeated"},
		},
	},	
};