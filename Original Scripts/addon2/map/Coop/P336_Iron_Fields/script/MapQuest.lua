State
{
	StateName = "WaitForQuest",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions =
		{
			MapTimerStart {Name = "mt_MapQuestDelay"},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "GiveQuest",
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_MapQuestDelay", Seconds = 240},
		},
		Actions =
		{
			MapTimerStop  {Name = "mt_MapQuestDelay"},
		},
	},
};
State
{
	StateName = "GiveQuest",
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsAlive {Tag = "MustSurvive1"},
		},
		Actions =
		{
			FigureOutcry {Tag = "MustSurvive1", TextTag = "Elf01"},
			FigureOutcry {Tag = "MustSurvive1", TextTag = "Elf02"},
			FigureOutcry {Tag = "MustSurvive1", TextTag = "Elf03"},
			
			MapTimerStart 		{Name = "mt_StartQuest"},
			VisualTimerStart	{Seconds = 480},
			
			QuestSetActive     {Player = "pl_Human1", Quest = "CoopMapQuestIronFields"},
			QuestSetActive     {Player = "pl_Human2", Quest = "CoopMapQuestIronFields"},
			QuestSetActive     {Player = "pl_Human3", Quest = "CoopMapQuestIronFields"},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "StartQuest",
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_StartQuest", Seconds = 480},
		},
		Actions =
		{
			MapFlagSetTrue     {Name = "mf_StartMapQuest"},
		},
	},
};
State 
{
	StateName = "StartQuest",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				AND 
				{
					FigureIsDead {Tag = "ConvoyHorse01"},
					FigureIsDead {Tag = "ConvoyHorse02"},
				},
				AND 
				{
					FigureIsDead {Tag = "ConvoyHorse01"},
					FigureIsDead {Tag = "ConvoyHorse03"},
				},
				AND 
				{
					FigureIsDead {Tag = "ConvoyHorse02"},
					FigureIsDead {Tag = "ConvoyHorse03"},
				},
				FigureIsDead {Tag = "MustSurvive1"},
			},	
		},
		Actions =
		{
			QuestSetUnsolvable {Player = "pl_Human1", Quest = "CoopMapQuestIronFields"},
			QuestSetUnsolvable {Player = "pl_Human2", Quest = "CoopMapQuestIronFields"},
			QuestSetUnsolvable {Player = "pl_Human3", Quest = "CoopMapQuestIronFields"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsGreaterOrEqual {Name = "mv_HorsesSaved", Value = 2},
			FigureIsAlive			 {Tag = "MustSurvive1"},
		},
		Actions =
		{
			QuestSetSolved {Player = "pl_Human1", Quest = "CoopMapQuestIronFields"},
			QuestSetSolved {Player = "pl_Human2", Quest = "CoopMapQuestIronFields"},
			QuestSetSolved {Player = "pl_Human3", Quest = "CoopMapQuestIronFields"},
			
			FigureOutcry {Tag = "MustSurvive1", TextTag = "Elf04"},
			FigureOutcry {Tag = "MustSurvive1", TextTag = "Elf05"},
		},
	},
	
};