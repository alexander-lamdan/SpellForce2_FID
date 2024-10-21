State
{
	StateName = "INIT",

	OnFigureSpawnOnlyWhenEvent
	{
				Conditions = 
		{
				FigureHasNotHealth{Tag = "xp_boss_fireelemental", Percent = 75},
		},
		Actions = 
		{
		EffectStartAtEntityPosition {File = "Effect_Spawn_Unit"},
		},
		DelayedActions = 
		{
		},
		NoSpawnEffect = false,
	};
}