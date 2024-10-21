State
{
	StateName = "INIT",

	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P502_GargoyleSpawnDelay", Seconds = 6 },
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