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
					Goto = FigurePatrolWalk{X = 170, Y = 175}, 
					Points = 
					{
						"190, 170", 
						"169, 180",
					},
				},
		},
		DelayedActions = 
		{
		},
		NoSpawnEffect = false,
	};
}