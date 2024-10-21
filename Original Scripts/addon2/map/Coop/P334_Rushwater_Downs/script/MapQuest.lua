local ConvoyDelaySeconds = 300

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
			EntityTimerStart {Name = "et_StartTimer"},
		},
	},

	OnOneTimeEvent
	{
		GotoState = "SpawnCourier",
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_StartTimer", Seconds = 300},
		},
		Actions =
		{
		},
	},
};
State
{
	StateName = "SpawnCourier",
	
	OnOneTimeEvent
	{
		GotoState = "CourierGo",
		Conditions = 
		{
			CoopPlayerIsPlaying {Player = "pl_Human1"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag  = "Courier", Level = 1, UnitId = 861, X = 351, Y = 314, Team = "tm_Neutral"},
			EntityValueSet	{Name = "ev_CourierGoesToPlayer", Value = 1},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "CourierGo",
		Conditions = 
		{
			CoopPlayerIsNotPlaying 	{Player = "pl_Human1"},
			CoopPlayerIsPlaying 	{Player = "pl_Human2"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag  = "Courier", Level = 1, UnitId = 861, X = 533, Y = 283, Team = "tm_Neutral"},
			EntityValueSet	{Name = "ev_CourierGoesToPlayer", Value = 2},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "CourierGo",
		Conditions = 
		{
			CoopPlayerIsNotPlaying 	{Player = "pl_Human1"},
			CoopPlayerIsNotPlaying 	{Player = "pl_Human2"},
			CoopPlayerIsPlaying 	{Player = "pl_Human3"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag  = "Courier", Level = 1, UnitId = 861, X = 303, Y = 272, Team = "tm_Neutral"},
			EntityValueSet	{Name = "ev_CourierGoesToPlayer", Value = 3},
		},
	},
};
State
{
	StateName = "CourierGo",
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityValueIsEqual {Name = "ev_CourierGoesToPlayer", Value = 1},
		},
		Actions =
		{
			FigureRun {Tag = "Courier", X = 376, Y = 284},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityValueIsEqual {Name = "ev_CourierGoesToPlayer", Value = 2},
		},
		Actions =
		{
			FigureRun {Tag = "Courier", X = 541, Y = 260},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityValueIsEqual {Name = "ev_CourierGoesToPlayer", Value = 3},
		},
		Actions =
		{
			FigureRun {Tag = "Courier", X = 254, Y = 225},
		},
	},
	
	OnOneTimeEvent
	{
		GotoState = "StartQuest",
		Conditions = 
		{
			OR
			{
				AND
				{
					EntityValueIsEqual {Name = "ev_CourierGoesToPlayer", Value = 1},
					FigureIsInRange {Tag = "Courier", X = 376, Y = 284, Range = 7},
				},
				AND
				{
					EntityValueIsEqual {Name = "ev_CourierGoesToPlayer", Value = 2},
					FigureIsInRange {Tag = "Courier", X = 541, Y = 260, Range = 7},
				},
				AND
				{
					EntityValueIsEqual {Name = "ev_CourierGoesToPlayer", Value = 3},
					FigureIsInRange {Tag = "Courier", X = 254, Y = 225, Range = 7},
				},
			},
		},
		Actions =
		{
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
		},
		Actions =
		{
			FigureOutcry {Tag = "Courier", TextTag = "Portal1"},
			FigureOutcry {Tag = "Courier", TextTag = "Portal2"},
			FigureOutcry {Tag = "Courier", TextTag = "Portal3"},
			FigureOutcry {Tag = "Courier", TextTag = "Portal4"},
			
			QuestSetActive {Player = "pl_Human1", Quest = "CoopMapQuestRushwater"},
			QuestSetActive {Player = "pl_Human2", Quest = "CoopMapQuestRushwater"},
			QuestSetActive {Player = "pl_Human3", Quest = "CoopMapQuestRushwater"},
			
			EntityTimerStart {Name = "et_ConvoyDelay"},
			VisualTimerStart	{Seconds = ConvoyDelaySeconds},
			
			FogOfWarReveal	{X = 275, Y = 335, Range = 15, Height = default},
			FogOfWarReveal	{X = 630, Y = 438, Range = 15, Height = default},
			
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_ConvoyDelay", Seconds = 30},
		},
		Actions = 
		{
			FigureRunToEntity {Tag = "Courier", TargetTag = "CourierHome"},
		},
	}, 
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInEntityRange {Tag = "Courier", TargetTag = "CourierHome", Range = 3},
		},
		Actions = 
		{
			FigureVanish {Tag = "Courier"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_ConvoyDelay", Seconds = ConvoyDelaySeconds},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_CerthisGo"},
		},
	}, 
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue			{Name = "mf_CerthisGetsKilled"},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Certhis", TextTag = "Portal5"},
			QuestSetSolved  {Player = "pl_Human1", Quest = "CoopMapQuestRushwater"},
			QuestSetSolved  {Player = "pl_Human2", Quest = "CoopMapQuestRushwater"},
			QuestSetSolved  {Player = "pl_Human3", Quest = "CoopMapQuestRushwater"},
		},
	}, 
		
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsFalse	{Name = "mf_CerthisGetsKilled"},
			FigureIsDead	{Tag = "Certhis"},
		},
		Actions = 
		{
			QuestSetUnsolvable {Player = "pl_Human1", Quest = "CoopMapQuestRushwater"},
			QuestSetUnsolvable {Player = "pl_Human2", Quest = "CoopMapQuestRushwater"},
			QuestSetUnsolvable {Player = "pl_Human3", Quest = "CoopMapQuestRushwater"},
		},
	}, 
		
	
};