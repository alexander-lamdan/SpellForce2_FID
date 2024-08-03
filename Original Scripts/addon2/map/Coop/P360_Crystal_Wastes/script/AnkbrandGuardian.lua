State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		X = 110,
		Y = 140,
		Conditions = 
		{
			OR
			{
				AND
				{
					QuestIsActive 		{Player = "pl_Human1", Quest = "CoopAnkbrandLight"},
					FigureIsInRange		{Tag    = "pl_Human1Avatar", X = 110, Y = 140, Range = 20},
				},
				AND
				{
					QuestIsActive 		{Player = "pl_Human2", Quest = "CoopAnkbrandLight"},
					FigureIsInRange		{Tag    = "pl_Human2Avatar", X = 110, Y = 140, Range = 20},
				},
				AND
				{
					QuestIsActive 		{Player = "pl_Human3", Quest = "CoopAnkbrandLight"},
					FigureIsInRange		{Tag    = "pl_Human3Avatar", X = 110, Y = 140, Range = 20},
				},
			},

		},
		Actions = 
		{
			ObjectVanish	{Tag = "AnkbrandMarker"},
			MapFlagSetTrue	{Name = "mf_TitanSpawned"},
		},
		DelayedActions = 
		{
		},
	},
};