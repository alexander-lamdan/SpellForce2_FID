State
{
	StateName = "INIT",

	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "treasure_trap", Range = 7 },
		},
		Actions = 
		{
			EffectStartAtEntityPosition {File = "Effect_Spawn_Unit"},
			MapTimerStart	{Name = "mt_P502_GargoyleSpawnDelay"},	
		},
		DelayedActions = 
		{
		},
		NoSpawnEffect = false,
	};
}