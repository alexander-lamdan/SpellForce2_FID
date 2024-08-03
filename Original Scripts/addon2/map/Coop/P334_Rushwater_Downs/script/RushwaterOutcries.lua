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
			FigureOutcry {Tag = "CitizenMale", TextTag = "TownfreeMale4"},
			FigureOutcry {Tag = "CitizenMale", TextTag = "TownfreeMale5"},
		},
	},
	
	-- Lyraine befreit
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsAlive 		{Tag = "MustSurvive1"},
			MapFlagIsTrue  		{Name = "mf_UndeadCamp1Wiped"},
		},
		Actions =
		{
			FigureOutcry {Tag = "CitizenMale", TextTag = "TownfreeMale1"},
			FigureOutcry {Tag = "CitizenMale", TextTag = "TownfreeMale2"},
		},
	},
	-- Matrikus tot
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead 		{Tag = "MustSurvive1"},
		},
		Actions =
		{
			FigureOutcry {Tag = "CitizenMale", TextTag = "TownfreeMale3"},
		},
	},	
	
	-- Connacht befreit
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsAlive 		{Tag = "MustSurvive2"},
			MapFlagIsTrue  		{Name = "mf_UndeadCamp2Wiped"},
		},
		Actions =
		{
			FigureOutcry {Tag = "CitizenFemale", TextTag = "TownfreeFemale1"},
			FigureOutcry {Tag = "CitizenFemale", TextTag = "TownfreeFemale2"},
		},
	},
	-- Alwin tot
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead 		{Tag = "MustSurvive1"},
		},
		Actions =
		{
			FigureOutcry {Tag = "CitizenFemale", TextTag = "TownfreeFemale3"},
		},
	},	
	
};

