State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Quest = "MG_TOTHEELVES"},
		},
		Actions = 
		{
				
		},
		DelayedActions = 
		{
			DialogSetDisabled	{},
		},
		NoSpawnEffect = true,
	};
	
		
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_P502_FirstTimeDialog"},
		},
		Actions = 
		{
			DialogSetEnabled	{},
		},
		GotoState = self,
	};


}