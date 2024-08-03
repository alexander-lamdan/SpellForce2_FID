State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_p502_Wave4"},			
		},
		Actions = 
		{
			
		},
		NoSpawnEffect = true,
	};
	
}