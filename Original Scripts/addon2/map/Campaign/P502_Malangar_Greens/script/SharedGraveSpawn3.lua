State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_p502_Wave3"},			
		},
		Actions = 
		{
			
		},
		NoSpawnEffect = true,
	};
	
}