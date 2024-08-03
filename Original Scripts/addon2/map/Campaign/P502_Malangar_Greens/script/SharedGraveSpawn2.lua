State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_p502_Wave2"},			
		},
		Actions = 
		{
			
		},
		NoSpawnEffect = true,
	};
	
}