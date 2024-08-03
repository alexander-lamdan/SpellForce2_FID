State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_ElfArmySupport"},			
		},
		Actions = 
		{
		},
		DelayedActions = 
		{
			FigureRunToEntity	{ TargetTag = "MG_demonic_hq"},
		},
		NoSpawnEffect = true,
	};


}