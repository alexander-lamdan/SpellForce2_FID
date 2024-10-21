State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = 423.979,
		Y = 663.416,
		Conditions = 
		{
			OR
	    	{
	    		MapFlagIsTrue {Name = "mf_Prophet_Spawn"},
				QuestIsActive	{Player = "pl_Human1", Quest = "CoopProphet"},
				QuestIsActive	{Player = "pl_Human2", Quest = "CoopProphet"},
	    		QuestIsActive	{Player = "pl_Human3", Quest = "CoopProphet"},
			},
		},
		Actions = 
		{
			FigureHoldPosition {},
		},
		DelayedActions = 
		{
		},
	},


	
};