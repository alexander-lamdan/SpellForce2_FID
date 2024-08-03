State
{
	StateName = "TraderSpawn",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			OR
			{
				QuestIsActive {Quest = "CoopProtectMerchants", Player = "pl_Human1"},
				QuestIsActive {Quest = "CoopProtectMerchants", Player = "pl_Human2"},
				QuestIsActive {Quest = "CoopProtectMerchants", Player = "pl_Human3"},
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

