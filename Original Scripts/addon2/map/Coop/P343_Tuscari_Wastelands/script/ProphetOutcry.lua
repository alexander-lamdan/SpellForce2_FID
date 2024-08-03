State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
				MapFlagIsTrue	{Name = "mf_DemonsDefeated"},
		},
		Actions = 
		{
			FigureAbilityAdd	{Tag = "default", AbilityId = 95},
			FigureOutcry		{Tag = "default", TextTag = "Prophet01"},
			EntityTimerStart	{Name = "et_Vanish"},
		},
		DelayedActions = 
		{
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_Vanish", Seconds = 7},
		},
		Actions = 
		{
			FigureVanish	{Tag = "default"},
		},
	},
	
};