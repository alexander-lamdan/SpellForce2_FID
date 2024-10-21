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
		},
	},
};	


State
{
	StateName = "HonorMarks",
	
	-- Kartenstart
	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions =
		{
			FigureOutcry {Tag = "OutcryOrc", TextTag = "TownfreeOrc4"},
			FigureOutcry {Tag = "OutcryOrc", TextTag = "TownfreeOrc5"},
		},
	},
	
	-- Karasch befreit
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsAlive 		{Tag = "MustSurvive1"},
			MapFlagIsTrue	{Name = "mf_UndeadWiped"},
			MapFlagIsTrue	{Name = "mf_PactWiped"},
		},
		Actions =
		{
			FigureOutcry {Tag = "OutcryOrc", TextTag = "TownfreeOrc1"},
			FigureOutcry {Tag = "OutcryOrc", TextTag = "TownfreeOrc2"},
			MapFlagSetTrue	{Name = "mf_OutcryFirst"},
		},
	},
	-- Kor tot
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				QuestIsNotSolved 	{Player = "pl_Human1", Quest = "CoopHonorMarksCollectedEnough"},
				QuestIsNotSolved 	{Player = "pl_Human2", Quest = "CoopHonorMarksCollectedEnough"},
				QuestIsNotSolved 	{Player = "pl_Human3", Quest = "CoopHonorMarksCollectedEnough"},
			},
			FigureIsDead 		{Tag = "MustSurvive1"},
		},
		Actions =
		{
			FigureOutcry {Tag = "OutcryOrc", TextTag = "TownfreeOrc3"},
		},
	},	
	
};
