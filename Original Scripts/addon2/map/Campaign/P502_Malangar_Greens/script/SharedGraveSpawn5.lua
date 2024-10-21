State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_p502_Wave5"},			
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P502_FinalGraveOpened"},
		},
		NoSpawnEffect = true,
	};
	
}