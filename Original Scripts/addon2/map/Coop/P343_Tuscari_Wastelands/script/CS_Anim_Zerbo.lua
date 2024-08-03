
State
{	
	StateName = "Zerbo_Anim",
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_01_Kneel_Hold_Zerbo"},
		},
		Actions = 
		{
			FigureAnimPlayLooped {Tag = "Zerbo", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_hold.ska"}, -- 3.29s
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
		},
		GotoState = "EndScript"
	},
};
	
State
{	
	StateName = "EndScript",
};