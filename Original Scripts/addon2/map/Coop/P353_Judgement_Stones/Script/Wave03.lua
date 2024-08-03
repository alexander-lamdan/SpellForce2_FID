State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions = 
		{
	   		 MapFlagIsTrue	{Name = "mf_QuestNotActive"},
	   	},
		Actions = 
		{
			FigureVanish {Tag = "default"},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "MAIN",
		Conditions = 
		{
	   	},
		Actions = 
		{
		},
	},



};
State
{
	StateName = "MAIN",
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_RitualTimer", Seconds = 22},
		},
		Actions = 
		{
			FigureRunToEntity	{Tag = "default", TargetTag = "Jandrim"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_RitualTimer", Seconds = 22},
		},
		Actions = 
		{
			FigureRunToEntity	{Tag = "default", TargetTag = "Jandrim"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_RitualTimer", Seconds = 22},
		},
		Actions = 
		{
			FigureRunToEntity	{Tag = "default", TargetTag = "Jandrim"},
		},
	},
};
