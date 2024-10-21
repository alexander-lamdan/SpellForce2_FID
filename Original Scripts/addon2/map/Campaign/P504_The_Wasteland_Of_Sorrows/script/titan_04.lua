State
{
	StateName = "INIT",

	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			-- NOT WORKING AT THE MOMENT 
			MapFlagIsTrue	{Name = "mf_P504_SpawnTitan04"},
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