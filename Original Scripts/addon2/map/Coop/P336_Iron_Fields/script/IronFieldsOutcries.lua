State 
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		GotoState  = "HonorMarks",
		Conditions = 
		{
			OR
			{
				QuestIsActive		{Player = "pl_Human1", Quest = "CoopHonorMarks"},
				QuestIsActive		{Player = "pl_Human2", Quest = "CoopHonorMarks"},
				QuestIsActive		{Player = "pl_Human3", Quest = "CoopHonorMarks"},
			},
		},
		Actions = 
		{
			FigureOutcry {Tag = "MustSurvive1", TextTag = "TownfreeFemale1"},
			FigureOutcry {Tag = "MustSurvive1", TextTag = "TownfreeFemale2"},
		},
	},
};	


State
{
	StateName = "HonorMarks",
	
	
	-- Karasch befreit
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsAlive 		{Tag = "MustSurvive1"},
			MapFlagIsTrue	{Name = "mf_ClansCamp01Wiped"},
			MapFlagIsTrue	{Name = "mf_ClansCamp02Wiped"},
		},
		Actions =
		{
			FigureOutcry {Tag = "OutcryBauer", TextTag = "TownfreeMale1"},
			FigureOutcry {Tag = "OutcryBauer", TextTag = "TownfreeMale2"},
		},
	},
	-- Kor tot
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead 		{Tag = "MustSurvive1"},
		},
		Actions =
		{
			FigureOutcry {Tag = "OutcryBauer", TextTag = "TownfreeMale3"},
		},
	},	
	
};
