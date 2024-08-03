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
			MapTimerStart {Name = "mt_P503_TimerVO"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_P503_TimerVO", Seconds = 10},
			FigureIsAlive {Tag = "pl_HumanCaine"},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Idle1", Tag = "pl_HumanHeroCaine"},
			MapTimerStop {Name = "mt_P503_TimerVO"},
		},
	};
}
