State
{
	StateName = "INIT",

	OnFigureSpawnOnlyWhenEvent
	{
				Conditions = 
		{
				FigureHasNotHealth	{Tag = "xp_boss_iceelemental", Percent = 50},
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