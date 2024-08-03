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
			FigureOutcry {Tag = "Ortbrandt", TextTag = "TownfreeMale1"},
			FigureOutcry {Tag = "Ortbrandt", TextTag = "TownfreeMale2"},
			MapFlagSetTrue	{Name = "mf_OutcryFirst"},
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
			FigureIsAlive 		{Tag = "Ortbrandt"},
			MapFlagIsTrue 	{Name = "mf_BeastCamp01Wiped"},
			MapFlagIsTrue 	{Name = "mf_BeastCamp02Wiped"},
			MapFlagIsTrue 	{Name = "mf_BeastCamp03Wiped"},
		},
		Actions =
		{
			FigureOutcry {Tag = "OutcryHedwig", TextTag = "TownfreeFemale1"},
			FigureOutcry {Tag = "OutcryHedwig", TextTag = "TownfreeFemale2"},
		},
	},
	-- Kor tot
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead 		{Tag = "Ortbrandt"},
		},
		Actions =
		{
			FigureOutcry {Tag = "OutcryHedwig", TextTag = "TownfreeFemale3"},
		},
	},	
	
};
