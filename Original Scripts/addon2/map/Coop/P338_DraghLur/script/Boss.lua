State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = 424,
		Y = 631,
		Conditions = 
		{
	    	OR
			{
				QuestIsActive	{Player = "pl_Human1", Quest = "CoopProphet"},
				QuestIsActive	{Player = "pl_Human2", Quest = "CoopProphet"},
				QuestIsActive	{Player = "pl_Human3", Quest = "CoopProphet"},
			},
		},
		Actions = 
		{
			FigureLootItemEquipmentAdd	{Tag = "boss", DropChance = 100, ItemId = 450},
		},
		DelayedActions = 
		{
		},
	};


	
};