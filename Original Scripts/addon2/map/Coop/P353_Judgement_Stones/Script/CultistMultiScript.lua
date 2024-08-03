State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_RitualTimer", Seconds = attacktimer},		
		},
		Actions = 
		{
			FigureRun {Tag = "default", X = 355, Y = 354},
		},
		DelayedActions = 
		{
		},
	},
	
	
	
};