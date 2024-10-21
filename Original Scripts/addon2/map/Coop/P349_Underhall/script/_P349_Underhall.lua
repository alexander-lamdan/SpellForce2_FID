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
	
	-- ********************************************************************
	-- priester finden
	-- ********************************************************************
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
			MapFlagSetTrue		{Name = "mf_FoundGoodPriest1"},
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
			MapFlagSetTrue		{Name = "mf_FoundEvilPriest1"},
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
			MapFlagSetTrue		{Name = "mf_FoundEvilPriest2"},
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
			MapFlagSetTrue		{Name = "mf_FoundEvilPriest3"},
		},
	}

	-- ********************************************************************
	-- priester quest solver
	-- ********************************************************************
	OnOneTimeEvent
	{
		EventName = sPlayer .. "SolvedPriestQuest",
		Conditions = 
		{
			AvatarValueIsGreaterOrEqual	{Player = sPlayer, Name = "av_P333_EvokedPriests", Value = 8},
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
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopMapQuestUnderHall"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopMapQuestUnderHall"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopMapQuestUnderHall"},
		},
		Actions =
		{
			GateSetClosed	{Tag  = "DwarfMineDoor02"},
			FigureNpcSpawn	{Tag = "Dwarf", Level = 10, UnitId = 660, X = 399, Y = 41, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "Dwarf2", Level = 10, UnitId = 660, X = 399, Y = 41, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "Dwarf3", Level = 10, UnitId = 660, X = 399, Y = 41, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "Dwarf4", Level = 10, UnitId = 660, X = 399, Y = 41, Team = "tm_Neutral"},
			MapFlagSetTrue	{Name = "mf_SubquestStart"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			CoopPlayerIsPlaying {Player = "pl_Human1"},
			FigureIsInEntityRange	{Tag = "Dwarf", TargetTag = "pl_Human1Avatar", Range = 12},
			FigureIsNotInCombat {Tag  = "pl_Human1Avatar"},
			MapFlagIsTrue	{Name = "mf_SubquestStart"},
		},
		Actions =
		{
			FigureRunToEntity	{Tag = "Dwarf", TargetTag = "pl_Human1Avatar"},
			FigureOutcry	{Tag = "Dwarf", TextTag = "Dwarf01"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			CoopPlayerIsNotPlaying 	{Player = "pl_Human1"},
			CoopPlayerIsPlaying 	{Player = "pl_Human2"},
			FigureIsInEntityRange	{Tag = "Dwarf", TargetTag = "pl_Human2Avatar", Range = 12},
			FigureIsNotInCombat {Tag  = "pl_Human2Avatar"},
			MapFlagIsTrue	{Name = "mf_SubquestStart"},
		},
		Actions =
		{
			FigureRunToEntity	{Tag = "Dwarf", TargetTag = "pl_Human2Avatar"},
			FigureOutcry	{Tag = "Dwarf", TextTag = "Dwarf01"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			CoopPlayerIsNotPlaying 	{Player = "pl_Human1"},
			CoopPlayerIsNotPlaying 	{Player = "pl_Human2"},
			CoopPlayerIsPlaying 	{Player = "pl_Human3"},
			FigureIsInEntityRange	{Tag = "Dwarf", TargetTag = "pl_Human3Avatar", Range = 12},
			FigureIsNotInCombat {Tag  = "pl_Human3Avatar"},
			MapFlagIsTrue	{Name = "mf_SubquestStart"},
		},
		Actions =
		{
			FigureRunToEntity	{Tag = "Dwarf", TargetTag = "pl_Human3Avatar"},
			FigureOutcry	{Tag = "Dwarf", TextTag = "Dwarf01"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				FigureIsInEntityRange	{Tag = "Dwarf", TargetTag = "pl_Human1Avatar", Range = 5},
				FigureIsInEntityRange	{Tag = "Dwarf", TargetTag = "pl_Human2Avatar", Range = 5},
				FigureIsInEntityRange	{Tag = "Dwarf", TargetTag = "pl_Human3Avatar", Range = 5},
			},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Dwarf", TextTag = "Dwarf02"},
			FigureOutcry	{Tag = "Dwarf", TextTag = "Dwarf03"},
			FigureOutcry	{Tag = "Dwarf", TextTag = "Dwarf04"},
			FigureOutcry	{Tag = "Dwarf", TextTag = "Dwarf05"},
			FogOfWarReveal	{FogOfWarId = default, X = 363, Y = 44, Range = 8, Height = default},
			QuestSetActive	{Player = "pl_Human1", Quest = "CoopMapQuestUnderHall"},
			QuestSetActive	{Player = "pl_Human2", Quest = "CoopMapQuestUnderHall"},
			QuestSetActive	{Player = "pl_Human3", Quest = "CoopMapQuestUnderHall"},
			FigureTeamTransfer	{Tag  = "Dwarf", Team = "tm_Human"},
		},
	},
	OnFollowEvent
	{
		Tag = "Dwarf",
		TargetTag = "pl_Human1Avatar",
		OnConditions = 
		{
			QuestIsActive	{Player = "pl_Human1", Quest = "CoopMapQuestUnderHall"},
			FigureIsNotInCombat {Tag  = "pl_Human1Avatar"},
			MapFlagIsFalse	{Name = "mf_FollowPlayer2"},
			MapFlagIsFalse	{Name = "mf_FollowPlayer3"},
			MapFlagIsFalse	{Name = "mf_LeverDone"},
		},
		Actions = 
		{
			MapFlagSetTrue   {Name = "mf_FollowPlayer1"},
		},
	},
	OnFollowEvent
	{
		Tag = "Dwarf",
		TargetTag = "pl_Human2Avatar",
		OnConditions = 
		{
			QuestIsActive	{Player = "pl_Human2", Quest = "CoopMapQuestUnderHall"},
			FigureIsNotInCombat {Tag  = "pl_Human2Avatar"},
			MapFlagIsFalse	{Name = "mf_FollowPlayer1"},
			MapFlagIsFalse	{Name = "mf_FollowPlayer3"},
			MapFlagIsFalse	{Name = "mf_LeverDone"},
		},
		Actions = 
		{
			MapFlagSetTrue   {Name = "mf_FollowPlayer2"},
		},
	},
	OnFollowEvent
	{
		Tag = "Dwarf",
		TargetTag = "pl_Human3Avatar",
		OnConditions = 
		{
			QuestIsActive	{Player = "pl_Human3", Quest = "CoopMapQuestUnderHall"},
			FigureIsNotInCombat {Tag  = "pl_Human3Avatar"},
			MapFlagIsFalse	{Name = "mf_FollowPlayer1"},
			MapFlagIsFalse	{Name = "mf_FollowPlayer2"},
			MapFlagIsFalse	{Name = "mf_LeverDone"},
		},
		Actions = 
		{
			MapFlagSetTrue   {Name = "mf_FollowPlayer3"},
		},
	},
	OnFollowEvent
	{
		Tag = "Dwarf2",
		TargetTag = "pl_Human1Avatar",
		OnConditions = 
		{
			QuestIsActive	{Player = "pl_Human1", Quest = "CoopMapQuestUnderHall"},
			FigureIsNotInCombat {Tag  = "pl_Human1Avatar"},
			MapFlagIsFalse	{Name = "mf_Dwarf2FollowPlayer2"},
			MapFlagIsFalse	{Name = "mf_Dwarf2FollowPlayer3"},
			MapFlagIsFalse	{Name = "mf_LeverDone"},
		},
		Actions = 
		{
			MapFlagSetTrue   {Name = "mf_Dwarf2FollowPlayer1"},
		},
	},
	OnFollowEvent
	{
		Tag = "Dwarf2",
		TargetTag = "pl_Human2Avatar",
		OnConditions = 
		{
			QuestIsActive	{Player = "pl_Human2", Quest = "CoopMapQuestUnderHall"},
			FigureIsNotInCombat {Tag  = "pl_Human2Avatar"},
			MapFlagIsFalse	{Name = "mf_Dwarf2FollowPlayer1"},
			MapFlagIsFalse	{Name = "mf_Dwarf2FollowPlayer3"},
			MapFlagIsFalse	{Name = "mf_LeverDone"},
		},
		Actions = 
		{
			MapFlagSetTrue   {Name = "mf_Dwarf2FollowPlayer2"},
		},
	},
	OnFollowEvent
	{
		Tag = "Dwarf2",
		TargetTag = "pl_Human3Avatar",
		OnConditions = 
		{
			QuestIsActive	{Player = "pl_Human3", Quest = "CoopMapQuestUnderHall"},
			FigureIsNotInCombat {Tag  = "pl_Human3Avatar"},
			MapFlagIsFalse	{Name = "mf_Dwarf2FollowPlayer1"},
			MapFlagIsFalse	{Name = "mf_Dwarf2FollowPlayer2"},
			MapFlagIsFalse	{Name = "mf_LeverDone"},
		},
		Actions = 
		{
			MapFlagSetTrue   {Name = "mf_Dwarf2FollowPlayer3"},
		},
	},
	OnFollowEvent
	{
		Tag = "Dwarf3",
		TargetTag = "pl_Human1Avatar",
		OnConditions = 
		{
			QuestIsActive	{Player = "pl_Human1", Quest = "CoopMapQuestUnderHall"},
			FigureIsNotInCombat {Tag  = "pl_Human1Avatar"},
			MapFlagIsFalse	{Name = "mf_Dwarf3FollowPlayer2"},
			MapFlagIsFalse	{Name = "mf_Dwarf3FollowPlayer3"},
			MapFlagIsFalse	{Name = "mf_LeverDone"},
		},
		Actions = 
		{
			MapFlagSetTrue   {Name = "mf_Dwarf3FollowPlayer1"},
		},
	},
	OnFollowEvent
	{
		Tag = "Dwarf3",
		TargetTag = "pl_Human2Avatar",
		OnConditions = 
		{
			QuestIsActive	{Player = "pl_Human2", Quest = "CoopMapQuestUnderHall"},
			FigureIsNotInCombat {Tag  = "pl_Human2Avatar"},
			MapFlagIsFalse	{Name = "mf_Dwarf3FollowPlayer1"},
			MapFlagIsFalse	{Name = "mf_Dwarf3FollowPlayer3"},
			MapFlagIsFalse	{Name = "mf_LeverDone"},
		},
		Actions = 
		{
			MapFlagSetTrue   {Name = "mf_Dwarf3FollowPlayer2"},
		},
	},
	OnFollowEvent
	{
		Tag = "Dwarf3",
		TargetTag = "pl_Human3Avatar",
		OnConditions = 
		{
			QuestIsActive	{Player = "pl_Human3", Quest = "CoopMapQuestUnderHall"},
			FigureIsNotInCombat {Tag  = "pl_Human3Avatar"},
			MapFlagIsFalse	{Name = "mf_Dwarf3FollowPlayer1"},
			MapFlagIsFalse	{Name = "mf_Dwarf3FollowPlayer2"},
			MapFlagIsFalse	{Name = "mf_LeverDone"},
		},
		Actions = 
		{
			MapFlagSetTrue   {Name = "mf_Dwarf3FollowPlayer3"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "Dwarf", TargetTag = "DwarfMineDoor02", Range = 14},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Dwarf", TextTag = "Dwarf06"},
			ObjectSpawn	{ObjectId = 1089, X = 312, Y = 182, Direction = 0, Tag = "LeverGate"},
			MapFlagSetTrue	{Name = "mf_LeverDone"},
			FogOfWarReveal	{FogOfWarId = default, X = 312, Y = 182, Range = 6, Height = default},
		},
	},
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverGate",
		OnConditions = 
		{
		},
		Actions = 
		{
			EntityFlagSetTrue	{Name = "ef_ClickedOnLeverGate"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_ClickedOnLeverGate"},
		},
		Actions = 
		{
			GateSetOpen	{Tag  = "DwarfMineDoor02"},
			MapTimerStart	{Name = "mt_DwarfTimer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_DwarfTimer", Seconds = 3},
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "DwarfFoe01", Level = 16, UnitId = 1241, TargetTag = "DwarfMineDoor02", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "DwarfFoe02", Level = 15, UnitId = 1241, TargetTag = "DwarfMineDoor02", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "DwarfFoe03", Level = 15, UnitId = 1241, TargetTag = "DwarfMineDoor02", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "DwarfFoe04", Level = 16, UnitId = 1241, TargetTag = "DwarfMineDoor02", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "DwarfFoe05", Level = 14, UnitId = 1241, TargetTag = "DwarfMineDoor02", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "DwarfFoe06", Level = 14, UnitId = 1241, TargetTag = "DwarfMineDoor02", Team = "tm_Enemy"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_DwarfTimer", Seconds = 15},
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "DwarfFoeA1", Level = 16, UnitId = 1241, TargetTag = "DwarfMineDoor02", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "DwarfFoeA2", Level = 15, UnitId = 1241, TargetTag = "DwarfMineDoor02", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "DwarfFoeA3", Level = 15, UnitId = 1241, TargetTag = "DwarfMineDoor02", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "DwarfFoeA4", Level = 16, UnitId = 1241, TargetTag = "DwarfMineDoor02", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "DwarfFoeA5", Level = 14, UnitId = 1241, TargetTag = "DwarfMineDoor02", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "DwarfFoeA6", Level = 14, UnitId = 1241, TargetTag = "DwarfMineDoor02", Team = "tm_Enemy"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_DwarfTimer", Seconds = 25},
		},
		Actions =
		{
			MapFlagSetTrue   {Name = "mf_Group3Revealed"},
			MapTimerStop {Name = "mt_DwarfTimer"},
			FigureNpcSpawnToEntity	{Tag = "DwarfFoeB1", Level = 15, UnitId = 1241, TargetTag = "DwarfMineDoor02", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "DwarfFoeB2", Level = 15, UnitId = 1241, TargetTag = "DwarfMineDoor02", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "DwarfFoeB3", Level = 16, UnitId = 1241, TargetTag = "DwarfMineDoor02", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "DwarfFoeB4", Level = 16, UnitId = 1241, TargetTag = "DwarfMineDoor02", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "DwarfFoeB5", Level = 14, UnitId = 1241, TargetTag = "DwarfMineDoor02", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "DwarfFoeB6", Level = 14, UnitId = 1241, TargetTag = "DwarfMineDoor02", Team = "tm_Enemy"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue   {Name = "mf_Group3Revealed"},
			FigureIsAlive	{Tag = "Dwarf"},
			FigureIsDead	{Tag = "DwarfFoe01"},
			FigureIsDead	{Tag = "DwarfFoe02"},
			FigureIsDead	{Tag = "DwarfFoe03"},
			FigureIsDead	{Tag = "DwarfFoe04"},
			FigureIsDead	{Tag = "DwarfFoe05"},
			FigureIsDead	{Tag = "DwarfFoe06"},
			FigureIsDead	{Tag = "DwarfFoeA1"},
			FigureIsDead	{Tag = "DwarfFoeA2"},
			FigureIsDead	{Tag = "DwarfFoeA3"},
			FigureIsDead	{Tag = "DwarfFoeA4"},
			FigureIsDead	{Tag = "DwarfFoeA5"},
			FigureIsDead	{Tag = "DwarfFoeA6"},
			FigureIsDead	{Tag = "DwarfFoeB1"},
			FigureIsDead	{Tag = "DwarfFoeB2"},
			FigureIsDead	{Tag = "DwarfFoeB3"},
			FigureIsDead	{Tag = "DwarfFoeB4"},
			FigureIsDead	{Tag = "DwarfFoeB5"},
			FigureIsDead	{Tag = "DwarfFoeB6"},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Dwarf", TextTag = "Dwarf07"},
			FigureOutcry	{Tag = "Dwarf", TextTag = "Dwarf08"},
			FigureTeamTransfer	{Tag  = "Dwarf", Team = "tm_Neutral"},
			AvatarXPGive	{Player = "pl_Human1", Amount = 100},
			AvatarXPGive	{Player = "pl_Human2", Amount = 100},
			AvatarXPGive	{Player = "pl_Human3", Amount = 100},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1155, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1155, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1155, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1156, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1156, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1156, Amount = 1},
			QuestSetSolved 	{Player = "pl_Human1", Quest = "CoopMapQuestUnderHall"},
			QuestSetSolved 	{Player = "pl_Human2", Quest = "CoopMapQuestUnderHall"},
			QuestSetSolved 	{Player = "pl_Human3", Quest = "CoopMapQuestUnderHall"},
		},
	},
};
