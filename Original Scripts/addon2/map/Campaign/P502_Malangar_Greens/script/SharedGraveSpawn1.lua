State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_p502_Wave1"},			
		},
		Actions = 
		{
			
		},
		NoSpawnEffect = true,
	};
	
}