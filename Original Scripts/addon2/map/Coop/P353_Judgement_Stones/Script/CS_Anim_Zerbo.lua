State
{	
	StateName = "Zerbo_Anim",
	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
			FigureAnimPlayLooped {Tag = "Zerbo", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_hold.ska"}, -- 3.29s
			EntityTimerStart {Name = "et_AnimTimer"},
		},
	},
	OnEvent
	{
		Conditions = 
		{
			EntityFlagIsFalse {Name = "ef_AnimStop"},
			EntityTimerIsElapsed {Name = "et_AnimTimer", Seconds = 3},
		},
		Actions = 
		{
			FigureAnimPlayLooped {Tag = "Zerbo", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_hold.ska"}, -- 3.29s
			EntityTimerStart {Name = "et_AnimTimer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_01_Kneel_Up_Zerbo"},
		},
		Actions = 
		{
			FigureAnimPlayOnce	{Tag = "Zerbo", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_up.ska"}, -- 1.83s
			EntityFlagSetTrue {Name = "ef_AnimStop"},
		},
		GotoState = "EndScript"
	},
};
	
State
{	
	StateName = "EndScript",
};