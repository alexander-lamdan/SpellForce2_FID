State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
		},
		GotoState = "MainState"
	},
};
State
{
	StateName = "MainState",
	OnFigureSpawnOnlyWhenEvent
	{
	   	Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_RitualTimer", Seconds = 12},
		},
		Actions = 
		{
		},
		DelayedActions = 
		{
		},
	},
};