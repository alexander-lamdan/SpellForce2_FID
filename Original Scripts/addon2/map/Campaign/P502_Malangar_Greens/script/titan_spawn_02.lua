State
{
	StateName = "INIT",

	OnFigureSpawnOnlyWhenEvent
	{
				Conditions = 
		{
				BuildingHasNotHealth{Tag = "MG_demonic_hq", Percent = 60},
		},
		Actions = 
		{
			EffectStartAtEntityPosition {File = "Effect_Spawn_Unit"},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{X = 169, Y = 201}, 
					Points = 
					{
						"186, 198", 
						"200, 186",
						"194, 182",
						"170, 197",
					},
				},
		},
		DelayedActions = 
		{
		},
		NoSpawnEffect = false,
	};
}