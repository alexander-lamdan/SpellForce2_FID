State
{
	StateName = "Spawn",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name   = "mf_BeastWiped"},
		},
		Actions = 
		{
		},
		DelayedActions = 
		{
		},
	},
};