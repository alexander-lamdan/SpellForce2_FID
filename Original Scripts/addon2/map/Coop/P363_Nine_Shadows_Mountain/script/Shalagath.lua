State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_Devourer01Spawned"},
			MapFlagIsTrue {Name = "mf_Devourer02Spawned"},
			FigureIsDead  {Tag  = "Devourer01"},
			FigureIsDead  {Tag  = "Devourer01"},
			OR
			{
				QuestIsActive {Player = "pl_Human1", Quest = "CoopShalagath"},
				QuestIsActive {Player = "pl_Human2", Quest = "CoopShalagath"},
				QuestIsActive {Player = "pl_Human3", Quest = "CoopShalagath"},
			},
		},
		Actions = 
		{
			MapFlagSetTrue  {Name = "mf_ShalagathSpawned"},
		},
		DelayedActions = 
		{
		},
	},
};