State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			OR
			{
				QuestIsActive {Player = "pl_Human1", Quest = "CoopShalagath"},
				QuestIsActive {Player = "pl_Human2", Quest = "CoopShalagath"},
				QuestIsActive {Player = "pl_Human3", Quest = "CoopShalagath"},
			},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_Devourer01Spawned"},
		},
		DelayedActions = 
		{
		},
	},
};


