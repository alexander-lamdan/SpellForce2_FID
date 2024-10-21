State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{ Name = "mf_P502_IODialogOver" },			
		},
		Actions = 
		{
		},
		DelayedActions = 
		{
		},
		NoSpawnEffect = true,
	};
}