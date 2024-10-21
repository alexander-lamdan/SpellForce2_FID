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

	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopMapQuestIronHeartFootHills"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopMapQuestIronHeartFootHills"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopMapQuestIronHeartFootHills"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "Soldier", Level = 11, UnitId = 383, X = 56, Y = 203, Team = "tm_Coop"},
			FigureNpcSpawn	{Tag = "Soldier2", Level = 11, UnitId = 311, X = 56, Y = 200, Team = "tm_Coop"},
			FigureNpcSpawn	{Tag = "Merchant", Level = 12, UnitId = 1452, X = 80, Y = 102, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "MerchantGuard1", Level = 11, UnitId = 311, X = 80, Y = 102, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "MerchantGuard2", Level = 11, UnitId = 311, X = 80, Y = 102, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "Horse01", Level = 10, UnitId = 262, X = 79, Y = 105, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "Horse02", Level = 10, UnitId = 262, X = 72, Y = 100, Team = "tm_Neutral"},
			MapFlagSetTrue	{Name = "mf_SubquestStart"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SubquestStart"},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Soldier", TextTag = "Soldier01"},
			FigureOutcry	{Tag = "Soldier", TextTag = "Soldier02"},
			QuestSetActive	{Player = "pl_Human1", Quest = "CoopMapQuestIronHeartFootHills"},
			QuestSetActive	{Player = "pl_Human2", Quest = "CoopMapQuestIronHeartFootHills"},
			QuestSetActive	{Player = "pl_Human3", Quest = "CoopMapQuestIronHeartFootHills"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "Soldier", TargetTag = "Merchant", Range = 80},
		},
		Actions =
		{
			FogOfWarReveal	{FogOfWarId = default, X = 80, Y = 102, Range = 10, Height = default},
			FigureTeamTransfer	{Tag = "Merchant", Team = "tm_Coop"},
			FigureTeamTransfer	{Tag = "MerchantGuard1", Team = "tm_Coop"},
			FigureTeamTransfer	{Tag = "MerchantGuard2", Team = "tm_Coop"},
			FigureHealthAdd	{Tag = "Merchant", Percent = 100},
			FigureForcedRunToEntity	{Tag = "Merchant", TargetTag = "Soldier"},
		},
	},
	OnFollowEvent
	{
		Tag = "Soldier",
		TargetTag = "pl_Human1Avatar",
		OnConditions = 
		{
			QuestIsActive	{Player = "pl_Human1", Quest = "CoopMapQuestIronHeartFootHills"},
			FigureIsAlive	{Tag = "Merchant"},
			MapFlagIsFalse	{Name = "mf_FollowPlayer2"},
			MapFlagIsFalse	{Name = "mf_FollowPlayer3"},
			MapFlagIsFalse	{Name = "mf_QuestDone"},
		},
		Actions = 
		{
			MapFlagSetTrue   {Name = "mf_FollowPlayer1"},
		},
	},
	OnFollowEvent
	{
		Tag = "Soldier",
		TargetTag = "pl_Human2Avatar",
		OnConditions = 
		{
			QuestIsActive	{Player = "pl_Human2", Quest = "CoopMapQuestIronHeartFootHills"},
			FigureIsAlive	{Tag = "Merchant"},
			MapFlagIsFalse	{Name = "mf_FollowPlayer1"},
			MapFlagIsFalse	{Name = "mf_FollowPlayer3"},
			MapFlagIsFalse	{Name = "mf_QuestDone"},
		},
		Actions = 
		{
			MapFlagSetTrue   {Name = "mf_FollowPlayer2"},
		},
	},
	OnFollowEvent
	{
		Tag = "Soldier",
		TargetTag = "pl_Human3Avatar",
		OnConditions = 
		{
			QuestIsActive	{Player = "pl_Human3", Quest = "CoopMapQuestIronHeartFootHills"},
			FigureIsAlive	{Tag = "Merchant"},
			MapFlagIsFalse	{Name = "mf_FollowPlayer1"},
			MapFlagIsFalse	{Name = "mf_FollowPlayer2"},
			MapFlagIsFalse	{Name = "mf_QuestDone"},
		},
		Actions = 
		{
			MapFlagSetTrue   {Name = "mf_FollowPlayer3"},
		},
	},
	OnFollowEvent
	{
		Tag = "Soldier2",
		TargetTag = "pl_Human1Avatar",
		OnConditions = 
		{
			QuestIsActive	{Player = "pl_Human1", Quest = "CoopMapQuestIronHeartFootHills"},
			FigureIsAlive	{Tag = "Merchant"},
			MapFlagIsFalse	{Name = "mf_Soldier2FollowPlayer2"},
			MapFlagIsFalse	{Name = "mf_Soldier2FollowPlayer3"},
			MapFlagIsFalse	{Name = "mf_QuestDone"},
		},
		Actions = 
		{
			MapFlagSetTrue   {Name = "mf_Soldier2FollowPlayer1"},
		},
	},
	OnFollowEvent
	{
		Tag = "Soldier2",
		TargetTag = "pl_Human2Avatar",
		OnConditions = 
		{
			QuestIsActive	{Player = "pl_Human2", Quest = "CoopMapQuestIronHeartFootHills"},
			FigureIsAlive	{Tag = "Merchant"},
			MapFlagIsFalse	{Name = "mf_Soldier2FollowPlayer1"},
			MapFlagIsFalse	{Name = "mf_Soldier2FollowPlayer3"},
			MapFlagIsFalse	{Name = "mf_QuestDone"},
		},
		Actions = 
		{
			MapFlagSetTrue   {Name = "mf_Soldier2FollowPlayer2"},
		},
	},
	OnFollowEvent
	{
		Tag = "Soldier2",
		TargetTag = "pl_Human3Avatar",
		OnConditions = 
		{
			QuestIsActive	{Player = "pl_Human3", Quest = "CoopMapQuestIronHeartFootHills"},
			FigureIsAlive	{Tag = "Merchant"},
			MapFlagIsFalse	{Name = "mf_Soldier2FollowPlayer1"},
			MapFlagIsFalse	{Name = "mf_Soldier2FollowPlayer2"},
			MapFlagIsFalse	{Name = "mf_QuestDone"},
		},
		Actions = 
		{
			MapFlagSetTrue   {Name = "mf_Soldier2FollowPlayer3"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsAlive	{Tag = "Merchant"},
			FigureIsNotInCombat {Tag = "pl_Human1Avatar"},
			FigureIsNotInCombat {Tag = "pl_Human2Avatar"},
			FigureIsNotInCombat {Tag = "pl_Human3Avatar"},
			FigureIsDead	{Tag = "BanditCamp01Bandit01"},
			FigureIsDead	{Tag = "BanditCamp01Bandit02"},
			FigureIsDead	{Tag = "BanditCamp01Bandit03"},
			FigureIsDead	{Tag = "BanditCamp01Bandit04"},
			FigureIsDead	{Tag = "BanditCamp01Bandit05"},
			FigureIsDead	{Tag = "BanditCamp01Bandit06"},
			FigureIsDead	{Tag = "BanditCamp01Bandit07"},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Merchant", TextTag = "Merchant01"},
			FigureForcedWalk	{Tag = "Merchant", X = 80, Y = 102},
			MapFlagSetTrue	{Name = "mf_QuestDone"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_QuestDone"},
			FigureIsInRange	{Tag = "Merchant", Range = 5, X = 80, Y = 102},
			AND
			{
				OR
				{
					FigureIsInEntityRange	{Tag = "pl_Human1Avatar", TargetTag = "Merchant", Range = 6},
					FigureIsInEntityRange	{Tag = "pl_Human2Avatar", TargetTag = "Merchant", Range = 6},
					FigureIsInEntityRange	{Tag = "pl_Human3Avatar", TargetTag = "Merchant", Range = 6},
				},
			},

		},
		Actions = 
		{
			FigureOutcry	{Tag = "Merchant", TextTag = "Merchant02"},
			FigureTeamTransfer	{Tag = "Soldier", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "Soldier2", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "MerchantGuard1", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "MerchantGuard2", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "Merchant", Team = "tm_Neutral"},
			AvatarXPGive	{Player = "pl_Human1", Amount = 150},
			AvatarXPGive	{Player = "pl_Human2", Amount = 150},
			AvatarXPGive	{Player = "pl_Human3", Amount = 150},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1210, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1210, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1210, Amount = 1},
			QuestSetSolved	{Player = "pl_Human1", Quest = "CoopMapQuestIronHeartFootHills"},
			QuestSetSolved	{Player = "pl_Human2", Quest = "CoopMapQuestIronHeartFootHills"},
			QuestSetSolved	{Player = "pl_Human3", Quest = "CoopMapQuestIronHeartFootHills"},
		},
	},
};
