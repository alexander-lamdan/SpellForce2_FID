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
		},
		GotoState = "MAIN",
	},
};

for i = 1, 3 do
	local sPlayer = "pl_Human" .. i
	local sAvatar = sPlayer .. "Avatar"

	OnOneTimeEvent
	{
		EventName = sPlayer .. "FoundGoodPriest1",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayer, Quest = "CoopEvokePriests"},
			FigureIsInEntityRange	{Tag = "GoodGrave1", TargetTag = sAvatar, Range = 6},
			MapFlagIsFalse	{Name = "mf_GoodPriest1Evoked"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_GoodPriest1Evoked"},
			FigureOutcry	{TextTag = "Avatar01", Tag = sAvatar},
			MapTimerStart	{Name = "mt_EvokeGOODPRIEST1"},
			AvatarValueAdd	{Player = sPlayer, Name = "av_P333_EvokedPriests", Value = 1},
			EffectStart	{Tag = "GoodGrave1", File = "Effect_Misc_Oracle"},
			MapFlagSetTrue	{Name = "mf_FoundGoodPriest1"},
		},
	}
	OnOneTimeEvent
	{
		EventName = sPlayer .. "FoundGoodPriest2",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayer, Quest = "CoopEvokePriests"},
			FigureIsInEntityRange	{Tag = "GoodGrave2", TargetTag = sAvatar, Range = 6},
			MapFlagIsFalse	{Name = "mf_GoodPriest2Evoked"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_GoodPriest2Evoked"},
			FigureOutcry	{TextTag = "Avatar01", Tag = sAvatar},
			MapTimerStart	{Name = "mt_EvokeGOODPRIEST2"},
			AvatarValueAdd	{Player = sPlayer, Name = "av_P333_EvokedPriests", Value = 1},
			EffectStart	{Tag = "GoodGrave2", File = "Effect_Misc_Oracle"},
			MapFlagSetTrue	{Name = "mf_FoundGoodPriest2"},
		},
	}
	OnOneTimeEvent
	{
		EventName = sPlayer .. "FoundGoodPriest3",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayer, Quest = "CoopEvokePriests"},
			FigureIsInEntityRange	{Tag = "GoodGrave3", TargetTag = sAvatar, Range = 6},
			MapFlagIsFalse	{Name = "mf_GoodPriest3Evoked"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_GoodPriest3Evoked"},
			FigureOutcry	{TextTag = "Avatar01", Tag = sAvatar},
			MapTimerStart	{Name = "mt_EvokeGOODPRIEST3"},
			AvatarValueAdd	{Player = sPlayer, Name = "av_P333_EvokedPriests", Value = 1},
			EffectStart	{Tag = "GoodGrave3", File = "Effect_Misc_Oracle"},
			MapFlagSetTrue	{Name = "mf_FoundGoodPriest3"},
		},
	}
	OnOneTimeEvent
	{
		EventName = sPlayer .. "FoundEvilPriest1",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayer, Quest = "CoopEvokePriests"},
			FigureIsInEntityRange	{Tag = "EvilGrave1", TargetTag = sAvatar, Range = 6},
			MapFlagIsFalse	{Name = "mf_EvilPriest1Evoked"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_EvilPriest1Evoked"},
			FigureOutcry	{TextTag = "Avatar01", Tag = sAvatar},
			MapTimerStart	{Name = "mt_EvokeEVILPRIEST1"},
			EffectStart	{Tag = "EvilGrave1", File = "Effect_Misc_Oracle"},
			MapFlagSetTrue	{Name = "mf_FoundEvilPriest1"},
		},
	}
	OnOneTimeEvent
	{
		EventName = sPlayer .. "FoundEvilPriest2",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayer, Quest = "CoopEvokePriests"},
			FigureIsInEntityRange	{Tag = "EvilGrave2", TargetTag = sAvatar, Range = 6},
			MapFlagIsFalse	{Name = "mf_EvilPriest2Evoked"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_EvilPriest2Evoked"},
			FigureOutcry	{TextTag = "Avatar01", Tag = sAvatar},
			MapTimerStart	{Name = "mt_EvokeEVILPRIEST2"},
			EffectStart	{Tag = "EvilGrave2", File = "Effect_Misc_Oracle"},
			MapFlagSetTrue	{Name = "mf_FoundEvilPriest2"},
		},
	}
	OnOneTimeEvent
	{
		EventName = sPlayer .. "FoundEvilPriest3",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayer, Quest = "CoopEvokePriests"},
			FigureIsInEntityRange	{Tag = "EvilGrave3", TargetTag = sAvatar, Range = 6},
			MapFlagIsFalse	{Name = "mf_EvilPriest3Evoked"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_EvilPriest3Evoked"},
			FigureOutcry	{TextTag = "Avatar01", Tag = sAvatar},
			MapTimerStart	{Name = "mt_EvokeEVILPRIEST3"},
			EffectStart	{Tag = "EvilGrave3", File = "Effect_Misc_Oracle"},
			MapFlagSetTrue	{Name = "mf_FoundEvilPriest3"},
		},
	}
	OnOneTimeEvent
	{
		EventName = sPlayer .. "SolvedPriestQuest",
		Conditions = 
		{
			AvatarValueIsEqual	{Player = sPlayer, Name = "av_P333_EvokedPriests", Value = 10},
		},
		Actions = 
		{
			QuestSetSolved	{Player = sPlayer, Quest = "CoopEvokePriests"},
			QuestSetActive	{Player = sPlayer, Quest = "CoopEvokePriestsSolved"},
		},
	}
end

State
{
	StateName = "MAIN",
};