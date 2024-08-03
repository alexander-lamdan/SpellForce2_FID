State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		GotoState = "CerthisGo",
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_CerthisGo"},
		},
		Actions =
		{
			FigureTeamTransfer {Tag = "Certhis", Team = "tm_Coop"},
			FigureTeamTransfer {Tag = "CerthisGuard01", Team = "tm_Coop"},
			FigureTeamTransfer {Tag = "CerthisGuard02", Team = "tm_Coop"},
		},
	},
	
};

PathStates
{
	StateName = "CerthisGo",
	GotoState = "CerthisAtPortal",
	Conditions = 
	{
	},
	Actions = 
	{
	},
	StopConditions = 
	{
		MapFlagIsTrue {Name = "mf_CerthisReachedPortal"},
	},
	StopActions = 
	{
	},
	Points = 
	{
		
		{
			Point 	 = "Certhis",
			Range 	 = 1.5,
			GotoMode = "Walk",
		},
		{
			Point 	 = "WPCerthes01",
			Range 	 = 1.5,
			GotoMode = "Walk",
		},
		{
			Point 	 = "WPCerthes02",
			Range 	 = 1.5,
			GotoMode = "Walk",
		},
		{
			Point 	 = "WPCerthes03",
			Range 	 = 1.5,
			GotoMode = "Walk",
		},
		{
			Point 	 = "WPCerthes04",
			Range 	 = 1.5,
			GotoMode = "Walk",
			HomeActions =
			{
				FigureRun {Tag = "Ambush01Skeleton01", X = 415,Y = 340},
				FigureRun {Tag = "Ambush01Skeleton02", X = 415,Y = 340},
				FigureRun {Tag = "Ambush01Skeleton03", X = 415,Y = 340},
				FigureRun {Tag = "Ambush01Skeleton04", X = 415,Y = 340},
				FigureRun {Tag = "Ambush01Skeleton05", X = 415,Y = 340},
				FigureRun {Tag = "Ambush01Skeleton06", X = 415,Y = 340},
				FigureRun {Tag = "Ambush01Skeleton07", X = 415,Y = 340},
			},
		},
		{
			Point 	 = "WPCerthes05",
			Range 	 = 1.5,
			GotoMode = "Walk",
		},
		{
			Point 	 = "WPCerthes06",
			Range 	 = 1.5,
			GotoMode = "Walk",
		},
		{
			Point 	 = "WPCerthes07",
			Range 	 = 1.5,
			GotoMode = "Walk",
		},
		{
			Point 	 = "WPCerthes08",
			Range 	 = 1.5,
			GotoMode = "Walk",
		},
		{
			Point 	 = "WPCerthes09",
			Range 	 = 1.5,
			GotoMode = "Walk",
		},
		{
			Point 	 = "WPCerthes10",
			Range 	 = 1.5,
			GotoMode = "Walk",
		},
		{
			Point 	 = "WPCerthes11",
			Range 	 = 1.5,
			GotoMode = "Walk",
		},
		{
			Point 	 = "WPCerthes12",
			Range 	 = 1.5,
			GotoMode = "Walk",
		},
		{
			Point 	 = "WPCerthes13",
			Range 	 = 1.5,
			GotoMode = "Walk",
		},
		{
			Point 	 = "WPCerthes14",
			Range 	 = 1.5,
			GotoMode = "Walk",
		},
		{
			Point 	 = "WPCerthes15",
			Range 	 = 1.5,
			GotoMode = "Walk",
		},
		{
			Point 	 = "WPCerthes16",
			Range 	 = 1.5,
			GotoMode = "Walk",
		},
		{
			Point 	 = "WPCerthes17",
			Range 	 = 1.5,
			GotoMode = "Walk",
		},
		{
			Point 	 = "WPCerthesAtPortal",
			Range 	 = 1.5,
			GotoMode = "Walk",
			HomeActions = 
			{
				MapFlagSetTrue {Name = "mf_CerthisReachedPortal"},				
			},
		},
	},
};
State 
{
	StateName = "CerthisAtPortal",
	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			EntityTimerStart   {Name = "et_CerthisGetsKilled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed   {Name = "et_CerthisGetsKilled", Seconds = 0.2},
		},
		Actions =
		{
			FigureCastSpell	{Tag = "Certhis", Spell = 50, Power = 1, X = 628.737, Y = 438.559},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed   {Name = "et_CerthisGetsKilled", Seconds = 1},
		},
		Actions =
		{
			EffectStart					{Tag = "Certhis", File = "Effect_Flash_Hit"},
			EffectStartAtEntityPosition	{Tag = "Certhis", File = "Effect_Misc_CoopHero_Hit"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed   {Name = "et_CerthisGetsKilled", Seconds = 1.3},
		},
		Actions =
		{
			MapFlagSetTrue			{Name = "mf_CerthisGetsKilled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed   {Name = "et_CerthisGetsKilled", Seconds = 2},
		},
		Actions =
		{
			FigureKill {Tag = "Certhis"},
		},
	},
			
	
};
