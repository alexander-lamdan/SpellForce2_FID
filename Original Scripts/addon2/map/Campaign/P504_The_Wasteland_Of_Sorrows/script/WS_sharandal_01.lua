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
			EntityTimerStart	{Name = "et_P504_StrugglingTimer"},
		},
	};

	OnEvent
	{
		EventName = "StruggleEvent",
		Conditions = 
		{
			EntityTimerIsElapsed{Name = "et_P504_StrugglingTimer", Seconds = 15},
			MapFlagIsFalse{Name = "mf_P504_WizardsDead"},
		},
		Actions = 
		{
			FigureAnimPlayOnce	{File = "addon2/gfx/figures/npc/figure_boss_dragon_sharandal_struggle.ska"},
			EntityTimerStart	{Name = "et_P504_StrugglingTimer"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P504_WizardsDead"},
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_P504_StrugglingTimer"},
			MapFlagSetTrue {Name = "mf_P504_Start_SharandalBreak_Cut"},
		},
	};
	
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P504_End_SharandalBreak_Cut"},
		},
		Actions = 
		{
			--DialogSetEnabled	{Tag = "WS_sharandal_01"},
			FigureAnimPlayOnce	{File = "addon2/gfx/figures/npc/figure_boss_dragon_sharandal_idle.ska"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_p504_SharandalDemise"},
		},
		Actions = 
		{
			FigureTeamTransfer	{Team = "tm_Team2"},
		},
	};

	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P504_SharandalSacrifice"},
		},
		Actions = 
		{
			FigurePlayerTransfer {Player = "pl_Human"},
		},
	};

}
