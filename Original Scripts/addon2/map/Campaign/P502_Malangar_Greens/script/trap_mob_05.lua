State
{
	StateName = "INIT",

	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P502_GargoyleSpawnDelay", Seconds = 8 },
		},
		Actions = 
		{
			EffectStartAtEntityPosition {File = "Effect_Spawn_Unit"},
			MapTimerStop	{Name = "mt_P502_GargoyleSpawnDelay"},
		},
		DelayedActions = 
		{
		},
		NoSpawnEffect = false,
	};
}