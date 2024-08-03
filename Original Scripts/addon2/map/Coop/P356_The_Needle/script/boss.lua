State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		GotoState = "Main",
		Conditions = 
		{
		},
		Actions = 
		{
		},
	};


};
State
{
	StateName = "Main",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			OR
			{
				QuestIsActive	{Player = "pl_Human1", Quest = "CoopMagicBarrierCrystals"},
				QuestIsActive	{Player = "pl_Human2", Quest = "CoopMagicBarrierCrystals"},
				QuestIsActive	{Player = "pl_Human3", Quest = "CoopMagicBarrierCrystals"},
			},
		},
		Actions = 
		{
		},
		DelayedActions = 
		{
		},
	};

};


