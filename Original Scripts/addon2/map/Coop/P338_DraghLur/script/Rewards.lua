State
{
	StateName = "DraghLurRewards",
	OnOneTimeEvent
	{

		Conditions = 
		{
			FigureIsDead {Tag = "PrisonGuard01"},
			FigureIsDead {Tag = "PrisonGuard02"},
			FigureIsDead {Tag = "PrisonGuard03"},
			FigureIsDead {Tag = "PrisonGuard04"},
			FigureIsDead {Tag = "PrisonGuard05"},
			
			FigureIsDead {Tag = "PrisonGuard06"},
			FigureIsDead {Tag = "PrisonGuard07"},
			FigureIsDead {Tag = "PrisonGuard08"},
			FigureIsDead {Tag = "PrisonGuard09"},
			FigureIsDead {Tag = "PrisonGuard10"},
			
			FigureIsDead {Tag = "PrisonGuard11"},
			FigureIsDead {Tag = "PrisonGuard12"},
			FigureIsDead {Tag = "PrisonGuard13"},
			FigureIsDead {Tag = "PrisonGuard14"},
			FigureIsDead {Tag = "PrisonGuard15"},
        
			BuildingIsDead	{Tag = "PrisonGuardTower01"},
			BuildingIsDead	{Tag = "PrisonGuardTower02"},			
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_PrisonGuardsDefeated"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Pact01", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Pact01", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_PactMainBaseDestroyed"},
		},
		
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Pact02", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Pact02", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_PactForwardBaseDestroyed"},
		},
		
	},

		
		

};



