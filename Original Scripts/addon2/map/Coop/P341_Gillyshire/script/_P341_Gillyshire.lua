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
	
		-- ********************************************************************
	-- Flag zur XP Vergabe für die einzelnen Merchants
	-- ********************************************************************
	OnOneTimeEvent
	{
		EventName = "MerchantQuestSolved",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayer, Quest = "CoopFreeMerchants"},
			AvatarHasItemMisc	{Player = sPlayer, ItemId = 75, Amount = 25},
		},
		Actions = 
		{
			QuestSetSolved	{Player = sPlayer, Quest = "CoopFreeMerchants"},
			QuestSetActive	{Player = sPlayer, Quest = "CoopFreeMerchantsLiberatedEnough"},
			AvatarItemMiscTake	{Player = sPlayer, ItemId = 75, Amount = 999},
		},
	}
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasNotLevel	{Player = sPlayer, Level = 15},
			MapFlagIsTrue	{Name = "mf_SubquestSReward"},
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = sPlayer, ItemId = 70, Amount = 1},
		},
	}
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Player = sPlayer, Quest = "CoopFreeMerchants"},
			AvatarHasItemMisc	{Player = sPlayer, ItemId = 75, Amount = 8},
			AvatarHasItemMisc	{Player = sPlayer, ItemId = 103, Amount = 1},
			AvatarHasNotItemEquipment	{Player = sPlayer, ItemId = 1125, Amount = 1},
		},
		Actions = 
		{
			AvatarItemEquipmentGive	{Player = sPlayer, ItemId = 1125, Amount = 1},
		},
	}
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Player = sPlayer, Quest = "CoopFreeMerchants"},
			AvatarHasItemMisc	{Player = sPlayer, ItemId = 75, Amount = 16},
			AvatarHasItemMisc	{Player = sPlayer, ItemId = 103, Amount = 1},
			AvatarHasNotItemEquipment	{Player = sPlayer, ItemId = 1126, Amount = 1},
		},
		Actions = 
		{
			AvatarItemEquipmentGive	{Player = sPlayer, ItemId = 1126, Amount = 1},
		},
	}
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Player = sPlayer, Quest = "CoopFreeMerchants"},
			AvatarHasItemMisc	{Player = sPlayer, ItemId = 75, Amount = 24},
			AvatarHasItemMisc	{Player = sPlayer, ItemId = 103, Amount = 1},
			AvatarHasNotItemEquipment	{Player = sPlayer, ItemId = 1127, Amount = 1},
		},
		Actions = 
		{
			AvatarItemEquipmentGive	{Player = sPlayer, ItemId = 1127, Amount = 1},
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
			CoopPlayerIsPlaying {Player = "pl_Human1"},
			QuestIsNotSolved {Player = "pl_Human1", Quest = "CoopMapQuestGillyshire"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "Observer", Level = 8, UnitId = 1391, X = 478, Y = 91, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag  = "Necromancer", Level = 14, UnitId = 556, X = 609, Y = 128, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyALeader", Level = 9, UnitId = 272, X = 129, Y = 142, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "GuardA_1", Level = 10, UnitId = 311, X = 131, Y = 142, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "GuardA_2", Level = 10, UnitId = 311, X = 131, Y = 142, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "GuardA_3", Level = 10, UnitId = 311, X = 131, Y = 142, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "GuardA_4", Level = 10, UnitId = 311, X = 131, Y = 142, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyBLeader", Level = 9, UnitId = 272, X = 171, Y = 299, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "GuardB_1", Level = 10, UnitId = 311, X = 171, Y = 301, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "GuardB_2", Level = 10, UnitId = 311, X = 171, Y = 301, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "GuardB_3", Level = 10, UnitId = 311, X = 171, Y = 301, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "GuardB_4", Level = 10, UnitId = 311, X = 171, Y = 301, Team = "tm_Enemy"},
			MapTimerStart {Name = "mt_StartTimer"},
			FogOfWarReveal	{FogOfWarId = default, X = 478, Y = 91, Range = 12, Height = default},
			EntityValueSet	{Name = "ev_SpyRevealed", Value = 1},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_StartTimer", Seconds = 2},
			EntityValueIsEqual {Name = "ev_SpyRevealed", Value = 1},
		},
		Actions =
		{
			MapTimerStop {Name = "mt_StartTimer"},

			FigureOutcry	{Tag = "Observer", TextTag = "Spy01"},
			FigureOutcry	{Tag = "Observer", TextTag = "Spy02"},

			FogOfWarReveal	{FogOfWarId = default, X = 248, Y = 238, Range = 12, Height = default},
			FogOfWarReveal	{FogOfWarId = default, X = 455, Y = 378, Range = 12, Height = default},

			FogOfWarReveal	{FogOfWarId = default, X = 129, Y = 142, Range = 10, Height = default},
			FogOfWarReveal	{FogOfWarId = default, X = 171, Y = 299, Range = 10, Height = default},

			QuestSetActive {Player = "pl_Human1", Quest = "CoopMapQuestGillyshire"},
			MapFlagSetTrue	{Name = "mf_SpyDone"},
			MapFlagSetTrue	{Name = "mf_Necromancer"},
			MapFlagSetTrue	{Name = "mf_NecromancerPlayer1"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			CoopPlayerIsNotPlaying 	{Player = "pl_Human1"},
			CoopPlayerIsPlaying 	{Player = "pl_Human2"},
			QuestIsNotSolved {Player = "pl_Human2", Quest = "CoopMapQuestGillyshire"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag  = "Observer", Level = 8, UnitId = 1391, X = 478, Y = 91, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag  = "Necromancer", Level = 14, UnitId = 556, X = 609, Y = 128, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyALeader", Level = 9, UnitId = 272, X = 129, Y = 142, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "GuardA_1", Level = 10, UnitId = 311, X = 131, Y = 142, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "GuardA_2", Level = 10, UnitId = 311, X = 131, Y = 142, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "GuardA_3", Level = 10, UnitId = 311, X = 131, Y = 142, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "GuardA_4", Level = 10, UnitId = 311, X = 131, Y = 142, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyBLeader", Level = 9, UnitId = 272, X = 171, Y = 299, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "GuardB_1", Level = 10, UnitId = 311, X = 171, Y = 301, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "GuardB_2", Level = 10, UnitId = 311, X = 171, Y = 301, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "GuardB_3", Level = 10, UnitId = 311, X = 171, Y = 301, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "GuardB_4", Level = 10, UnitId = 311, X = 171, Y = 301, Team = "tm_Enemy"},
			MapTimerStart {Name = "mt_StartTimer"},
			FogOfWarReveal	{FogOfWarId = default, X = 478, Y = 91, Range = 12, Height = default},
			EntityValueSet	{Name = "ev_SpyRevealed", Value = 2},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_StartTimer", Seconds = 2},
			EntityValueIsEqual {Name = "ev_SpyRevealed", Value = 2},
		},
		Actions =
		{
			MapTimerStop {Name = "mt_StartTimer"},

			FigureOutcry	{Tag = "Observer", TextTag = "Spy01"},
			FigureOutcry	{Tag = "Observer", TextTag = "Spy02"},

			FogOfWarReveal	{FogOfWarId = default, X = 248, Y = 238, Range = 12, Height = default},
			FogOfWarReveal	{FogOfWarId = default, X = 455, Y = 378, Range = 12, Height = default},

			FogOfWarReveal	{FogOfWarId = default, X = 129, Y = 142, Range = 10, Height = default},
			FogOfWarReveal	{FogOfWarId = default, X = 171, Y = 299, Range = 10, Height = default},

			QuestSetActive {Player = "pl_Human2", Quest = "CoopMapQuestGillyshire"},
			MapFlagSetTrue	{Name = "mf_SpyDone"},
			MapFlagSetTrue	{Name = "mf_Necromancer"},
			MapFlagSetTrue	{Name = "mf_NecromancerPlayer2"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			CoopPlayerIsNotPlaying 	{Player = "pl_Human1"},
			CoopPlayerIsNotPlaying 	{Player = "pl_Human2"},
			CoopPlayerIsPlaying 	{Player = "pl_Human3"},
			QuestIsNotSolved {Player = "pl_Human3", Quest = "CoopMapQuestGillyshire"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag  = "Observer", Level = 8, UnitId = 1391, X = 478, Y = 91, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag  = "Necromancer", Level = 14, UnitId = 556, X = 609, Y = 128, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyALeader", Level = 9, UnitId = 272, X = 129, Y = 142, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "GuardA_1", Level = 10, UnitId = 311, X = 131, Y = 142, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "GuardA_2", Level = 10, UnitId = 311, X = 131, Y = 142, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "GuardA_3", Level = 10, UnitId = 311, X = 131, Y = 142, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "GuardA_4", Level = 10, UnitId = 311, X = 131, Y = 142, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyBLeader", Level = 9, UnitId = 272, X = 171, Y = 299, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "GuardB_1", Level = 10, UnitId = 311, X = 171, Y = 301, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "GuardB_2", Level = 10, UnitId = 311, X = 171, Y = 301, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "GuardB_3", Level = 10, UnitId = 311, X = 171, Y = 301, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "GuardB_4", Level = 10, UnitId = 311, X = 171, Y = 301, Team = "tm_Enemy"},
			MapTimerStart {Name = "mt_StartTimer"},
			FogOfWarReveal	{FogOfWarId = default, X = 478, Y = 91, Range = 12, Height = default},
			EntityValueSet	{Name = "ev_SpyRevealed", Value = 3},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_StartTimer", Seconds = 2},
			EntityValueIsEqual {Name = "ev_SpyRevealed", Value = 3},
		},
		Actions =
		{
			MapTimerStop {Name = "mt_StartTimer"},

			FigureOutcry	{Tag = "Observer", TextTag = "Spy01"},
			FigureOutcry	{Tag = "Observer", TextTag = "Spy02"},

			FogOfWarReveal	{FogOfWarId = default, X = 248, Y = 238, Range = 12, Height = default},
			FogOfWarReveal	{FogOfWarId = default, X = 455, Y = 378, Range = 12, Height = default},

			FogOfWarReveal	{FogOfWarId = default, X = 129, Y = 142, Range = 10, Height = default},
			FogOfWarReveal	{FogOfWarId = default, X = 171, Y = 299, Range = 10, Height = default},

			QuestSetActive {Player = "pl_Human3", Quest = "CoopMapQuestGillyshire"},
			MapFlagSetTrue	{Name = "mf_SpyDone"},
			MapFlagSetTrue	{Name = "mf_Necromancer"},
			MapFlagSetTrue	{Name = "mf_NecromancerPlayer3"},
		},
	},
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_NecromancerPlayer1"},
			MapFlagIsTrue	{Name = "mf_Necromancer"},
			MapFlagIsFalse	{Name = "mf_NecromantDead"},
			FigureIsDead	{Tag = "NecroSkeleton01"},
			FigureIsDead	{Tag = "NecroSkeleton02"},
			FigureIsDead	{Tag = "NecroSkeleton03"},
			FigureIsDead	{Tag = "NecroSkeleton04"},
			FigureIsDead	{Tag = "NecroSkeleton05"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "NecroSkeleton01", Level = 7, UnitId = 81, X = 135, Y = 558, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "NecroSkeleton02", Level = 7, UnitId = 81, X = 135, Y = 558, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "NecroSkeleton03", Level = 7, UnitId = 81, X = 135, Y = 558, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "NecroSkeleton04", Level = 7, UnitId = 81, X = 135, Y = 558, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "NecroSkeleton05", Level = 7, UnitId = 81, X = 135, Y = 558, Team = "tm_Creep"},
		},
	},
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "NecroSkeleton01"},
			FigureIsInRange	{Tag = "NecroSkeleton01", Range = 5, X = 135, Y = 558},
			MapFlagIsTrue	{Name = "mf_NecromancerPlayer1"},
		},
		Actions = 
		{
			FigurePathGoto
			{
				Goto = FigureWalk {Tag = "NecroSkeleton01", X = 185, Y = 560}, 
				Points = 
				{
					"185, 520",
					"129, 142",
				},
			},
		},
	},
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "NecroSkeleton02"},
			FigureIsInRange	{Tag = "NecroSkeleton02", Range = 5, X = 135, Y = 558},
			MapFlagIsTrue	{Name = "mf_NecromancerPlayer1"},
		},
		Actions = 
		{
			FigurePathGoto
			{
				Goto = FigureWalk {Tag = "NecroSkeleton02", X = 185, Y = 560}, 
				Points = 
				{
					"185, 520",
					"129, 142",
				},
			},
		},
	},
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "NecroSkeleton03"},
			FigureIsInRange	{Tag = "NecroSkeleton03", Range = 5, X = 135, Y = 558},
			MapFlagIsTrue	{Name = "mf_NecromancerPlayer1"},
		},
		Actions = 
		{
			FigurePathGoto
			{
				Goto = FigureWalk {Tag = "NecroSkeleton03", X = 185, Y = 560}, 
				Points = 
				{
					"185, 520",
					"171, 299",
				},
			},
		},
	},
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "NecroSkeleton04"},
			FigureIsInRange	{Tag = "NecroSkeleton04", Range = 5, X = 135, Y = 558},
			MapFlagIsTrue	{Name = "mf_NecromancerPlayer1"},
		},
		Actions = 
		{
			FigurePathGoto
			{
				Goto = FigureWalk {Tag = "NecroSkeleton04", X = 185, Y = 560}, 
				Points = 
				{
					"185, 520",
					"171, 299",
				},
			},
		},
	},
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "NecroSkeleton05"},
			FigureIsInRange	{Tag = "NecroSkeleton05", Range = 5, X = 135, Y = 558},
			MapFlagIsTrue	{Name = "mf_NecromancerPlayer1"},
		},
		Actions = 
		{
			FigurePathGoto
			{
				Goto = FigureWalk {Tag = "NecroSkeleton05", X = 185, Y = 560}, 
				Points = 
				{
					"185, 520",
					"171, 299",
				},
			},
		},
	},
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_NecromancerPlayer2"},
			MapFlagIsTrue	{Name = "mf_Necromancer"},
			MapFlagIsFalse	{Name = "mf_NecromantDead"},
			FigureIsDead	{Tag = "NecroSkeleton01"},
			FigureIsDead	{Tag = "NecroSkeleton02"},
			FigureIsDead	{Tag = "NecroSkeleton03"},
			FigureIsDead	{Tag = "NecroSkeleton04"},
			FigureIsDead	{Tag = "NecroSkeleton05"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "NecroSkeleton01", Level = 7, UnitId = 81, X = 91, Y = 378, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "NecroSkeleton02", Level = 7, UnitId = 81, X = 91, Y = 378, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "NecroSkeleton03", Level = 7, UnitId = 81, X = 91, Y = 378, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "NecroSkeleton04", Level = 7, UnitId = 81, X = 91, Y = 378, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "NecroSkeleton05", Level = 7, UnitId = 81, X = 91, Y = 378, Team = "tm_Creep"},
		},
	},
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "NecroSkeleton01"},
			FigureIsInRange	{Tag = "NecroSkeleton01", Range = 5, X = 91, Y = 378},
			MapFlagIsTrue	{Name = "mf_NecromancerPlayer2"},
		},
		Actions = 
		{
			FigurePathGoto
			{
				Goto = FigureWalk {Tag = "NecroSkeleton01", X = 120, Y = 410}, 
				Points = 
				{
					"125, 350",
					"129, 142",
				},
			},
		},
	},
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "NecroSkeleton02"},
			FigureIsInRange	{Tag = "NecroSkeleton02", Range = 5, X = 91, Y = 378},
			MapFlagIsTrue	{Name = "mf_NecromancerPlayer2"},
		},
		Actions = 
		{
			FigurePathGoto
			{
				Goto = FigureWalk {Tag = "NecroSkeleton02", X = 120, Y = 410}, 
				Points = 
				{
					"125, 350",
					"129, 142",
				},
			},
		},
	},
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "NecroSkeleton03"},
			FigureIsInRange	{Tag = "NecroSkeleton03", Range = 5, X = 91, Y = 378},
			MapFlagIsTrue	{Name = "mf_NecromancerPlayer2"},
		},
		Actions = 
		{
			FigurePathGoto
			{
				Goto = FigureWalk {Tag = "NecroSkeleton03", X = 120, Y = 410}, 
				Points = 
				{
					"125, 350",
					"171, 299",
				},
			},
		},
	},
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "NecroSkeleton04"},
			FigureIsInRange	{Tag = "NecroSkeleton04", Range = 5, X = 91, Y = 378},
			MapFlagIsTrue	{Name = "mf_NecromancerPlayer2"},
		},
		Actions = 
		{
			FigurePathGoto
			{
				Goto = FigureWalk {Tag = "NecroSkeleton04", X = 120, Y = 410}, 
				Points = 
				{
					"125, 350",
					"171, 299",
				},
			},
		},
	},
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "NecroSkeleton05"},
			FigureIsInRange	{Tag = "NecroSkeleton05", Range = 5, X = 91, Y = 378},
			MapFlagIsTrue	{Name = "mf_NecromancerPlayer2"},
		},
		Actions = 
		{
			FigurePathGoto
			{
				Goto = FigureWalk {Tag = "NecroSkeleton05", X = 120, Y = 410}, 
				Points = 
				{
					"125, 350",
					"171, 299",
				},
			},
		},
	},
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_NecromancerPlayer3"},
			MapFlagIsTrue	{Name = "mf_Necromancer"},
			MapFlagIsFalse	{Name = "mf_NecromantDead"},
			FigureIsDead	{Tag = "NecroSkeleton01"},
			FigureIsDead	{Tag = "NecroSkeleton02"},
			FigureIsDead	{Tag = "NecroSkeleton03"},
			FigureIsDead	{Tag = "NecroSkeleton04"},
			FigureIsDead	{Tag = "NecroSkeleton05"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "NecroSkeleton01", Level = 7, UnitId = 81, X = 434, Y = 131, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "NecroSkeleton02", Level = 7, UnitId = 81, X = 434, Y = 131, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "NecroSkeleton03", Level = 7, UnitId = 81, X = 434, Y = 131, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "NecroSkeleton04", Level = 7, UnitId = 81, X = 434, Y = 131, Team = "tm_Creep"},
			FigureNpcSpawn	{Tag = "NecroSkeleton05", Level = 7, UnitId = 81, X = 434, Y = 131, Team = "tm_Creep"},
		},
	},
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "NecroSkeleton01"},
			FigureIsInRange	{Tag = "NecroSkeleton01", Range = 5, X = 434, Y = 131},
			MapFlagIsTrue	{Name = "mf_NecromancerPlayer3"},
		},
		Actions = 
		{
			FigurePathGoto
			{
				Goto = FigureWalk {Tag = "NecroSkeleton01", X = 390, Y = 120}, 
				Points = 
				{
					"400, 150",
					"129, 142",
				},
			},
		},
	},
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "NecroSkeleton02"},
			FigureIsInRange	{Tag = "NecroSkeleton02", Range = 5, X = 434, Y = 131},
			MapFlagIsTrue	{Name = "mf_NecromancerPlayer3"},
		},
		Actions = 
		{
			FigurePathGoto
			{
				Goto = FigureWalk {Tag = "NecroSkeleton02", X = 390, Y = 140}, 
				Points = 
				{
					"400, 150",
					"129, 142",
				},
			},
		},
	},
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "NecroSkeleton03"},
			FigureIsInRange	{Tag = "NecroSkeleton03", Range = 5, X = 434, Y = 131},
			MapFlagIsTrue	{Name = "mf_NecromancerPlayer3"},
		},
		Actions = 
		{
			FigurePathGoto
			{
				Goto = FigureWalk {Tag = "NecroSkeleton03", X = 390, Y = 140}, 
				Points = 
				{
					"400, 150",
					"171, 299",
				},
			},
		},
	},
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "NecroSkeleton04"},
			FigureIsInRange	{Tag = "NecroSkeleton04", Range = 5, X = 434, Y = 131},
			MapFlagIsTrue	{Name = "mf_NecromancerPlayer3"},
		},
		Actions = 
		{
			FigurePathGoto
			{
				Goto = FigureWalk {Tag = "NecroSkeleton04", X = 390, Y = 140}, 
				Points = 
				{
					"400, 150",
					"171, 299",
				},
			},
		},
	},
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "NecroSkeleton05"},
			FigureIsInRange	{Tag = "NecroSkeleton05", Range = 5, X = 434, Y = 131},
			MapFlagIsTrue	{Name = "mf_NecromancerPlayer3"},
		},
		Actions = 
		{
			FigurePathGoto
			{
				Goto = FigureWalk {Tag = "NecroSkeleton05", X = 390, Y = 140}, 
				Points = 
				{
					"400, 150",
					"171, 299",
				},
			},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_Necromancer"},
			FigureIsDead	{Tag = "Necromancer"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_NecromantDead"},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 959, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 959, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 959, Amount = 1},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "CleanerGuard01", Level = 11, UnitId = 311, X = 432, Y = 378, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "CleanerGuard02", Level = 8, UnitId = 304, X = 432, Y = 378, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "CleanerGuard03", Level = 8, UnitId = 304, X = 432, Y = 378, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "CleanerGuard04", Level = 10, UnitId = 311, X = 432, Y = 378, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "CleanerGuard05", Level = 10, UnitId = 311, X = 432, Y = 378, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "CleanerGuard06", Level = 8, UnitId = 304, X = 432, Y = 378, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "CleanerGuard07", Level = 8, UnitId = 304, X = 432, Y = 378, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "CleanerGuard08", Level = 10, UnitId = 311, X = 432, Y = 378, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "CleanerGuard09", Level = 10, UnitId = 311, X = 432, Y = 378, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "CleanerGuard10", Level = 8, UnitId = 304, X = 432, Y = 378, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "CleanerGuard11", Level = 8, UnitId = 304, X = 432, Y = 378, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "CleanerGuard12", Level = 10, UnitId = 311, X = 432, Y = 378, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "CleanerGuard13", Level = 8, UnitId = 304, X = 432, Y = 378, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "CleanerGuard14", Level = 10, UnitId = 311, X = 432, Y = 378, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "CleanerGuard15", Level = 10, UnitId = 311, X = 432, Y = 378, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "CleanerGuard16", Level = 8, UnitId = 304, X = 432, Y = 378, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "CleanerGuard17", Level = 8, UnitId = 304, X = 432, Y = 378, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "CleanerGuard18", Level = 10, UnitId = 311, X = 432, Y = 378, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "CleanerGuard19", Level = 10, UnitId = 311, X = 432, Y = 378, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "CleanerGuard20", Level = 8, UnitId = 304, X = 432, Y = 378, Team = "tm_Enemy"},
			MapFlagSetTrue	{Name = "mf_Cleaners_Move"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_Cleaners_Move"},
		},
		Actions = 
		{
			FigureRun	{Tag = "CleanerGuard01", X = 325, Y = 240},
			FigureRun	{Tag = "CleanerGuard02", X = 325, Y = 240},
			FigureRun	{Tag = "CleanerGuard03", X = 325, Y = 240},
			FigureRun	{Tag = "CleanerGuard04", X = 325, Y = 240},
			FigureRun	{Tag = "CleanerGuard05", X = 325, Y = 240},
			FigureRun	{Tag = "CleanerGuard06", X = 325, Y = 240},
			FigureRun	{Tag = "CleanerGuard07", X = 325, Y = 240},
			FigureRun	{Tag = "CleanerGuard08", X = 325, Y = 240},
			FigureRun	{Tag = "CleanerGuard09", X = 325, Y = 240},
			FigureRun	{Tag = "CleanerGuard10", X = 325, Y = 240},
			FigureRun	{Tag = "CleanerGuard11", X = 325, Y = 240},
			FigureRun	{Tag = "CleanerGuard12", X = 325, Y = 240},
			FigureRun	{Tag = "CleanerGuard13", X = 325, Y = 240},
			FigureRun	{Tag = "CleanerGuard14", X = 325, Y = 240},
			FigureRun	{Tag = "CleanerGuard15", X = 325, Y = 240},
			FigureRun	{Tag = "CleanerGuard16", X = 325, Y = 240},
			FigureRun	{Tag = "CleanerGuard17", X = 325, Y = 240},
			FigureRun	{Tag = "CleanerGuard18", X = 325, Y = 240},
			FigureRun	{Tag = "CleanerGuard19", X = 325, Y = 240},
			FigureRun	{Tag = "CleanerGuard20", X = 325, Y = 240},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA1_Moves"},
			AND
			{
				OR
				{
				FigureIsInRange	{Tag = "ConvoyGuardA1_4", Range = 5, X = 292, Y = 240},
				FigureIsDead	{Tag = "ConvoyGuardA1_4"},
				FigureIsInRange	{Tag = "ConvoyHorseA1_1", Range = 5, X = 292, Y = 240},	  
				FigureIsDead	{Tag = "ConvoyHorseA1_1"}, 
				FigureIsInRange	{Tag = "ConvoyHorseA1_2", Range = 5, X = 292, Y = 240},	  
				FigureIsDead	{Tag = "ConvoyHorseA1_2"}, 
				FigureIsInRange	{Tag = "ConvoyHorseA1_3", Range = 5, X = 292, Y = 240},	  
				FigureIsDead	{Tag = "ConvoyHorseA1_3"}, 
				FigureIsInRange	{Tag = "ConvoyGuardA1_1", Range = 5, X = 292, Y = 240},	  
				FigureIsDead	{Tag = "ConvoyGuardA1_1"}, 
				FigureIsInRange	{Tag = "ConvoyGuardA1_2", Range = 5, X = 292, Y = 240},	  
				FigureIsDead	{Tag = "ConvoyGuardA1_2"}, 
				FigureIsInRange	{Tag = "ConvoyGuardA1_3", Range = 5, X = 292, Y = 240},	  
				FigureIsDead	{Tag = "ConvoyGuardA1_3"}, 
				},
			},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_Cleaners_StepBack"},

			FigureRun	{Tag = "CleanerGuard01", X = 410, Y = 275},
			FigureRun	{Tag = "CleanerGuard02", X = 410, Y = 275},
			FigureRun	{Tag = "CleanerGuard03", X = 410, Y = 275},
			FigureRun	{Tag = "CleanerGuard04", X = 410, Y = 275},
			FigureRun	{Tag = "CleanerGuard05", X = 410, Y = 275},
			FigureRun	{Tag = "CleanerGuard06", X = 410, Y = 275},
			FigureRun	{Tag = "CleanerGuard07", X = 410, Y = 275},
			FigureRun	{Tag = "CleanerGuard08", X = 410, Y = 275},
			FigureRun	{Tag = "CleanerGuard09", X = 410, Y = 275},
			FigureRun	{Tag = "CleanerGuard10", X = 410, Y = 275},
			FigureRun	{Tag = "CleanerGuard11", X = 410, Y = 275},
			FigureRun	{Tag = "CleanerGuard12", X = 410, Y = 275},
			FigureRun	{Tag = "CleanerGuard13", X = 410, Y = 275},
			FigureRun	{Tag = "CleanerGuard14", X = 410, Y = 275},
			FigureRun	{Tag = "CleanerGuard15", X = 410, Y = 275},
			FigureRun	{Tag = "CleanerGuard16", X = 410, Y = 275},
			FigureRun	{Tag = "CleanerGuard17", X = 410, Y = 275},
			FigureRun	{Tag = "CleanerGuard18", X = 410, Y = 275},
			FigureRun	{Tag = "CleanerGuard19", X = 410, Y = 275},
			FigureRun	{Tag = "CleanerGuard20", X = 410, Y = 275},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SpyDone"},
			MapFlagIsFalse	{Name = "mf_BaseADefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "ConvoyGuardA1_1", Level = 10, UnitId = 311, X = 138, Y = 155, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardA1_2", Level = 8, UnitId = 304, X = 138, Y = 155, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardA1_3", Level = 8, UnitId = 304, X = 138, Y = 155, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardA1_4", Level = 11, UnitId = 311, X = 138, Y = 155, Team = "tm_Enemy"},

			FigureNpcSpawn	{Tag = "ConvoyHorseA1_1", Level = 5, UnitId = 262, X = 138, Y = 155, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyHorseA1_2", Level = 5, UnitId = 262, X = 138, Y = 155, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyHorseA1_3", Level = 5, UnitId = 262, X = 138, Y = 155, Team = "tm_Enemy"},

			MapFlagSetTrue	{Name = "mf_ConvoyA1_Moves"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA1_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardA1_1", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA1_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardA1_2", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA1_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardA1_3", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA1_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardA1_4", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA1_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseA1_1", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA1_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseA1_2", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA1_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseA1_3", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA1_Moves"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			AND
			{
				OR
				{
				FigureIsInRange	{Tag = "ConvoyHorseA1_1", Range = 12, X = 530, Y = 462},	  
				FigureIsInRange	{Tag = "ConvoyHorseA1_2", Range = 12, X = 530, Y = 462},	  
				FigureIsInRange	{Tag = "ConvoyHorseA1_3", Range = 12, X = 530, Y = 462},	  	  
				},
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "ConvoyHorseA1_1"},
			FigureVanish	{Tag = "ConvoyHorseA1_2"},
			FigureVanish	{Tag = "ConvoyHorseA1_3"},
			MapFlagSetTrue	{Name = "mf_ConvoyA1_Disabled"},
			MapFlagSetTrue	{Name = "mf_ConvoyB1_Enabled"},
			PlayerResourceLenyaGive	{Player = "pl_Realm", Amount = 250},
			PlayerResourceSilverGive {Player = "pl_Realm", Amount = 300},
			PlayerResourceStoneGive	{Player = "pl_Realm", Amount = 150},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA1_Moves"},
			MapFlagIsFalse	{Name = "mf_BaseBDefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			FigureIsDead	{Tag = "ConvoyHorseA1_1"},
			FigureIsDead	{Tag = "ConvoyHorseA1_2"},
			FigureIsDead	{Tag = "ConvoyHorseA1_3"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_ConvoyB1_Enabled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA1_Moves"},
			MapFlagIsTrue	{Name = "mf_BaseBDefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			FigureIsDead	{Tag = "ConvoyHorseA1_1"},
			FigureIsDead	{Tag = "ConvoyHorseA1_2"},
			FigureIsDead	{Tag = "ConvoyHorseA1_3"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_ConvoyA2_Enabled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB1_Enabled"},
			MapFlagIsFalse	{Name = "mf_BaseBDefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "ConvoyGuardB1_1", Level = 8, UnitId = 311, X = 166, Y = 290, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardB1_2", Level = 8, UnitId = 304, X = 166, Y = 290, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardB1_3", Level = 8, UnitId = 304, X = 166, Y = 290, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardB1_4", Level = 8, UnitId = 311, X = 166, Y = 290, Team = "tm_Enemy"},

			FigureNpcSpawn	{Tag = "ConvoyHorseB1_1", Level = 5, UnitId = 262, X = 166, Y = 290, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyHorseB1_2", Level = 5, UnitId = 262, X = 166, Y = 290, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyHorseB1_3", Level = 5, UnitId = 262, X = 166, Y = 290, Team = "tm_Enemy"},

			MapFlagSetTrue	{Name = "mf_ConvoyB1_Moves"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB1_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardB1_1", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB1_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardB1_2", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB1_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardB1_3", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB1_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardB1_4", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB1_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseB1_1", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB1_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseB1_2", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB1_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseB1_3", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB1_Moves"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			AND
			{
				OR
				{
				FigureIsInRange	{Tag = "ConvoyHorseB1_1", Range = 12, X = 530, Y = 462},	  	
				FigureIsInRange	{Tag = "ConvoyHorseB1_2", Range = 12, X = 530, Y = 462},	  
				FigureIsInRange	{Tag = "ConvoyHorseB1_3", Range = 12, X = 530, Y = 462},
				},	   
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "ConvoyHorseB1_1"},
			FigureVanish	{Tag = "ConvoyHorseB1_2"},
			FigureVanish	{Tag = "ConvoyHorseB1_3"},
			MapFlagSetTrue	{Name = "mf_ConvoyB1_Disabled"},
			MapFlagSetTrue	{Name = "mf_ConvoyA2_Enabled"},
			PlayerResourceLenyaGive	{Player = "pl_Realm", Amount = 250},
			PlayerResourceSilverGive {Player = "pl_Realm", Amount = 300},
			PlayerResourceStoneGive	{Player = "pl_Realm", Amount = 150},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB1_Moves"},
			MapFlagIsFalse	{Name = "mf_BaseADefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			FigureIsDead	{Tag = "ConvoyHorseB1_1"},
			FigureIsDead	{Tag = "ConvoyHorseB1_2"},
			FigureIsDead	{Tag = "ConvoyHorseB1_3"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_ConvoyA2_Enabled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB1_Moves"},
			MapFlagIsTrue	{Name = "mf_BaseADefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			FigureIsDead	{Tag = "ConvoyHorseB1_1"},
			FigureIsDead	{Tag = "ConvoyHorseB1_2"},
			FigureIsDead	{Tag = "ConvoyHorseB1_3"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_ConvoyB2_Enabled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_BaseADefeated"},
			MapFlagIsTrue	{Name = "mf_ConvoyA2_Enabled"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "ConvoyGuardA2_1", Level = 8, UnitId = 311, X = 138, Y = 155, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardA2_2", Level = 8, UnitId = 304, X = 138, Y = 155, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardA2_3", Level = 8, UnitId = 304, X = 138, Y = 155, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardA2_4", Level = 8, UnitId = 311, X = 138, Y = 155, Team = "tm_Enemy"},

			FigureNpcSpawn	{Tag = "ConvoyHorseA2_1", Level = 5, UnitId = 262, X = 138, Y = 155, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyHorseA2_2", Level = 5, UnitId = 262, X = 138, Y = 155, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyHorseA2_3", Level = 5, UnitId = 262, X = 138, Y = 155, Team = "tm_Enemy"},

			MapFlagSetTrue	{Name = "mf_ConvoyA2_Moves"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA2_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardA2_1", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA2_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardA2_2", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA2_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardA2_3", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA2_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardA2_4", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA2_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseA2_1", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA2_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseA2_2", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA2_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseA2_3", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA2_Moves"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			AND
			{
				OR
				{
				FigureIsInRange	{Tag = "ConvoyHorseA2_1", Range = 12, X = 530, Y = 462},
				FigureIsInRange	{Tag = "ConvoyHorseA2_2", Range = 12, X = 530, Y = 462},
				FigureIsInRange	{Tag = "ConvoyHorseA2_3", Range = 12, X = 530, Y = 462},
				},
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "ConvoyHorseA2_1"},
			FigureVanish	{Tag = "ConvoyHorseA2_2"},
			FigureVanish	{Tag = "ConvoyHorseA2_3"},
			MapFlagSetTrue	{Name = "mf_ConvoyA2_Disabled"},
			MapFlagSetTrue	{Name = "mf_ConvoyB2_Enabled"},
			PlayerResourceLenyaGive	{Player = "pl_Realm", Amount = 250},
			PlayerResourceSilverGive {Player = "pl_Realm", Amount = 300},
			PlayerResourceStoneGive	{Player = "pl_Realm", Amount = 150},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA2_Moves"},
			MapFlagIsFalse	{Name = "mf_BaseBDefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			FigureIsDead	{Tag = "ConvoyHorseA2_1"},
			FigureIsDead	{Tag = "ConvoyHorseA2_2"},
			FigureIsDead	{Tag = "ConvoyHorseA2_3"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_ConvoyB2_Enabled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA2_Moves"},
			MapFlagIsTrue	{Name = "mf_BaseBDefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			FigureIsDead	{Tag = "ConvoyHorseA2_1"},
			FigureIsDead	{Tag = "ConvoyHorseA2_2"},
			FigureIsDead	{Tag = "ConvoyHorseA2_3"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_ConvoyA3_Enabled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB2_Enabled"},
			MapFlagIsFalse	{Name = "mf_BaseBDefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "ConvoyGuardB2_1", Level = 8, UnitId = 311, X = 166, Y = 290, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardB2_2", Level = 8, UnitId = 304, X = 166, Y = 290, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardB2_3", Level = 8, UnitId = 304, X = 166, Y = 290, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardB2_4", Level = 8, UnitId = 311, X = 166, Y = 290, Team = "tm_Enemy"},

			FigureNpcSpawn	{Tag = "ConvoyHorseB2_1", Level = 5, UnitId = 262, X = 166, Y = 290, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyHorseB2_2", Level = 5, UnitId = 262, X = 166, Y = 290, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyHorseB2_3", Level = 5, UnitId = 262, X = 166, Y = 290, Team = "tm_Enemy"},

			MapFlagSetTrue	{Name = "mf_ConvoyB2_Moves"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB2_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardB2_1", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB2_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardB2_2", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB2_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardB2_3", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB2_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardB2_4", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB2_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseB2_1", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB2_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseB2_2", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB2_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseB2_3", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB2_Moves"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			AND
			{
				OR
				{
				FigureIsInRange	{Tag = "ConvoyHorseB2_1", Range = 12, X = 530, Y = 462},	  	
				FigureIsInRange	{Tag = "ConvoyHorseB2_2", Range = 12, X = 530, Y = 462},	  
				FigureIsInRange	{Tag = "ConvoyHorseB2_3", Range = 12, X = 530, Y = 462},
				},	   
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "ConvoyHorseB2_1"},
			FigureVanish	{Tag = "ConvoyHorseB2_2"},
			FigureVanish	{Tag = "ConvoyHorseB2_3"},
			MapFlagSetTrue	{Name = "mf_ConvoyB2_Disabled"},
			MapFlagSetTrue	{Name = "mf_ConvoyA3_Enabled"},
			PlayerResourceLenyaGive	{Player = "pl_Realm", Amount = 250},
			PlayerResourceSilverGive {Player = "pl_Realm", Amount = 300},
			PlayerResourceStoneGive	{Player = "pl_Realm", Amount = 150},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB2_Moves"},
			MapFlagIsFalse	{Name = "mf_BaseADefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			FigureIsDead	{Tag = "ConvoyHorseB2_1"},
			FigureIsDead	{Tag = "ConvoyHorseB2_2"},
			FigureIsDead	{Tag = "ConvoyHorseB2_3"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_ConvoyA3_Enabled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB2_Moves"},
			MapFlagIsTrue	{Name = "mf_BaseADefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			FigureIsDead	{Tag = "ConvoyHorseB2_1"},
			FigureIsDead	{Tag = "ConvoyHorseB2_2"},
			FigureIsDead	{Tag = "ConvoyHorseB2_3"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_ConvoyB3_Enabled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_BaseADefeated"},
			MapFlagIsTrue	{Name = "mf_ConvoyA3_Enabled"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "ConvoyGuardA3_1", Level = 8, UnitId = 311, X = 138, Y = 155, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardA3_2", Level = 8, UnitId = 304, X = 138, Y = 155, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardA3_3", Level = 8, UnitId = 304, X = 138, Y = 155, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardA3_4", Level = 8, UnitId = 311, X = 138, Y = 155, Team = "tm_Enemy"},

			FigureNpcSpawn	{Tag = "ConvoyHorseA3_1", Level = 5, UnitId = 262, X = 138, Y = 155, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyHorseA3_2", Level = 5, UnitId = 262, X = 138, Y = 155, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyHorseA3_3", Level = 5, UnitId = 262, X = 138, Y = 155, Team = "tm_Enemy"},

			MapFlagSetTrue	{Name = "mf_ConvoyA3_Moves"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA3_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardA3_1", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA3_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardA3_2", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA3_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardA3_3", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA3_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardA3_4", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA3_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseA3_1", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA3_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseA3_2", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA3_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseA3_3", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA3_Moves"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			AND
			{
				OR
				{
				FigureIsInRange	{Tag = "ConvoyHorseA3_1", Range = 12, X = 530, Y = 462},
				FigureIsInRange	{Tag = "ConvoyHorseA3_2", Range = 12, X = 530, Y = 462},
				FigureIsInRange	{Tag = "ConvoyHorseA3_3", Range = 12, X = 530, Y = 462},
				},
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "ConvoyHorseA3_1"},
			FigureVanish	{Tag = "ConvoyHorseA3_2"},
			FigureVanish	{Tag = "ConvoyHorseA3_3"},
			MapFlagSetTrue	{Name = "mf_ConvoyA3_Disabled"},
			MapFlagSetTrue	{Name = "mf_ConvoyB3_Enabled"},
			PlayerResourceLenyaGive	{Player = "pl_Realm", Amount = 250},
			PlayerResourceSilverGive {Player = "pl_Realm", Amount = 300},
			PlayerResourceStoneGive	{Player = "pl_Realm", Amount = 150},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA3_Moves"},
			MapFlagIsFalse	{Name = "mf_BaseBDefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			FigureIsDead	{Tag = "ConvoyHorseA3_1"},
			FigureIsDead	{Tag = "ConvoyHorseA3_2"},
			FigureIsDead	{Tag = "ConvoyHorseA3_3"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_ConvoyB3_Enabled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA3_Moves"},
			MapFlagIsTrue	{Name = "mf_BaseBDefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			FigureIsDead	{Tag = "ConvoyHorseA3_1"},
			FigureIsDead	{Tag = "ConvoyHorseA3_2"},
			FigureIsDead	{Tag = "ConvoyHorseA3_3"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_ConvoyA4_Enabled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB3_Enabled"},
			MapFlagIsFalse	{Name = "mf_BaseBDefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "ConvoyGuardB3_1", Level = 8, UnitId = 311, X = 166, Y = 290, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardB3_2", Level = 8, UnitId = 304, X = 166, Y = 290, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardB3_3", Level = 8, UnitId = 304, X = 166, Y = 290, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardB3_4", Level = 8, UnitId = 311, X = 166, Y = 290, Team = "tm_Enemy"},

			FigureNpcSpawn	{Tag = "ConvoyHorseB3_1", Level = 5, UnitId = 262, X = 166, Y = 290, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyHorseB3_2", Level = 5, UnitId = 262, X = 166, Y = 290, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyHorseB3_3", Level = 5, UnitId = 262, X = 166, Y = 290, Team = "tm_Enemy"},

			MapFlagSetTrue	{Name = "mf_ConvoyB3_Moves"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB3_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardB3_1", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB3_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardB3_2", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB3_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardB3_3", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB3_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardB3_4", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB3_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseB3_1", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB3_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseB3_2", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB3_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseB3_3", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB3_Moves"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			AND
			{
				OR
				{
				FigureIsInRange	{Tag = "ConvoyHorseB3_1", Range = 12, X = 530, Y = 462},	  	
				FigureIsInRange	{Tag = "ConvoyHorseB3_2", Range = 12, X = 530, Y = 462},	  
				FigureIsInRange	{Tag = "ConvoyHorseB3_3", Range = 12, X = 530, Y = 462},
				},	   
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "ConvoyHorseB3_1"},
			FigureVanish	{Tag = "ConvoyHorseB3_2"},
			FigureVanish	{Tag = "ConvoyHorseB3_3"},
			MapFlagSetTrue	{Name = "mf_ConvoyB3_Disabled"},
			MapFlagSetTrue	{Name = "mf_ConvoyA4_Enabled"},
			PlayerResourceLenyaGive	{Player = "pl_Realm", Amount = 250},
			PlayerResourceSilverGive {Player = "pl_Realm", Amount = 300},
			PlayerResourceStoneGive	{Player = "pl_Realm", Amount = 150},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB3_Moves"},
			MapFlagIsFalse	{Name = "mf_BaseADefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			FigureIsDead	{Tag = "ConvoyHorseB3_1"},
			FigureIsDead	{Tag = "ConvoyHorseB3_2"},
			FigureIsDead	{Tag = "ConvoyHorseB3_3"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_ConvoyA4_Enabled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB3_Moves"},
			MapFlagIsTrue	{Name = "mf_BaseADefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			FigureIsDead	{Tag = "ConvoyHorseB3_1"},
			FigureIsDead	{Tag = "ConvoyHorseB3_2"},
			FigureIsDead	{Tag = "ConvoyHorseB3_3"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_ConvoyB4_Enabled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA4_Enabled"},
			MapFlagIsFalse	{Name = "mf_BaseADefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "ConvoyGuardA4_1", Level = 8, UnitId = 311, X = 138, Y = 155, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardA4_2", Level = 8, UnitId = 304, X = 138, Y = 155, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardA4_3", Level = 8, UnitId = 304, X = 138, Y = 155, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardA4_4", Level = 8, UnitId = 311, X = 138, Y = 155, Team = "tm_Enemy"},

			FigureNpcSpawn	{Tag = "ConvoyHorseA4_1", Level = 5, UnitId = 262, X = 138, Y = 155, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyHorseA4_2", Level = 5, UnitId = 262, X = 138, Y = 155, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyHorseA4_3", Level = 5, UnitId = 262, X = 138, Y = 155, Team = "tm_Enemy"},

			MapFlagSetTrue	{Name = "mf_ConvoyA4_Moves"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA4_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardA4_1", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA4_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardA4_2", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA4_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardA4_3", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA4_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardA4_4", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA4_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseA4_1", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA4_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseA4_2", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA4_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseA4_3", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA4_Moves"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			AND
			{
				OR
				{
				FigureIsInRange	{Tag = "ConvoyHorseA4_1", Range = 12, X = 530, Y = 462},
				FigureIsInRange	{Tag = "ConvoyHorseA4_2", Range = 12, X = 530, Y = 462},
				FigureIsInRange	{Tag = "ConvoyHorseA4_3", Range = 12, X = 530, Y = 462},
				},
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "ConvoyHorseA4_1"},
			FigureVanish	{Tag = "ConvoyHorseA4_2"},
			FigureVanish	{Tag = "ConvoyHorseA4_3"},
			MapFlagSetTrue	{Name = "mf_ConvoyA4_Disabled"},
			MapFlagSetTrue	{Name = "mf_ConvoyB4_Enabled"},
			PlayerResourceLenyaGive	{Player = "pl_Realm", Amount = 250},
			PlayerResourceSilverGive {Player = "pl_Realm", Amount = 300},
			PlayerResourceStoneGive	{Player = "pl_Realm", Amount = 150},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA4_Moves"},
			MapFlagIsFalse	{Name = "mf_BaseBDefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			FigureIsDead	{Tag = "ConvoyHorseA4_1"},
			FigureIsDead	{Tag = "ConvoyHorseA4_2"},
			FigureIsDead	{Tag = "ConvoyHorseA4_3"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_ConvoyB4_Enabled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA4_Moves"},
			MapFlagIsTrue	{Name = "mf_BaseBDefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			FigureIsDead	{Tag = "ConvoyHorseA4_1"},
			FigureIsDead	{Tag = "ConvoyHorseA4_2"},
			FigureIsDead	{Tag = "ConvoyHorseA4_3"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_ConvoyA5_Enabled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB4_Enabled"},
			MapFlagIsFalse	{Name = "mf_BaseBDefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "ConvoyGuardB4_1", Level = 8, UnitId = 311, X = 166, Y = 290, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardB4_2", Level = 8, UnitId = 304, X = 166, Y = 290, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardB4_3", Level = 8, UnitId = 304, X = 166, Y = 290, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardB4_4", Level = 8, UnitId = 311, X = 166, Y = 290, Team = "tm_Enemy"},

			FigureNpcSpawn	{Tag = "ConvoyHorseB4_1", Level = 5, UnitId = 262, X = 166, Y = 290, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyHorseB4_2", Level = 5, UnitId = 262, X = 166, Y = 290, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyHorseB4_3", Level = 5, UnitId = 262, X = 166, Y = 290, Team = "tm_Enemy"},

			MapFlagSetTrue	{Name = "mf_ConvoyB4_Moves"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB4_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardB4_1", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB4_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardB4_2", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB4_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardB4_3", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB4_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardB4_4", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB4_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseB4_1", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB4_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseB4_2", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB4_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseB4_3", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB4_Moves"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			AND
			{
				OR
				{
				FigureIsInRange	{Tag = "ConvoyHorseB4_1", Range = 12, X = 530, Y = 462},	  	
				FigureIsInRange	{Tag = "ConvoyHorseB4_2", Range = 12, X = 530, Y = 462},	  
				FigureIsInRange	{Tag = "ConvoyHorseB4_3", Range = 12, X = 530, Y = 462},
				},	   
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "ConvoyHorseB4_1"},
			FigureVanish	{Tag = "ConvoyHorseB4_2"},
			FigureVanish	{Tag = "ConvoyHorseB4_3"},
			MapFlagSetTrue	{Name = "mf_ConvoyB4_Disabled"},
			MapFlagSetTrue	{Name = "mf_ConvoyA5_Enabled"},
			PlayerResourceLenyaGive	{Player = "pl_Realm", Amount = 250},
			PlayerResourceSilverGive {Player = "pl_Realm", Amount = 300},
			PlayerResourceStoneGive	{Player = "pl_Realm", Amount = 150},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB4_Moves"},
			MapFlagIsFalse	{Name = "mf_BaseADefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			FigureIsDead	{Tag = "ConvoyHorseB4_1"},
			FigureIsDead	{Tag = "ConvoyHorseB4_2"},
			FigureIsDead	{Tag = "ConvoyHorseB4_3"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_ConvoyA5_Enabled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB4_Moves"},
			MapFlagIsTrue	{Name = "mf_BaseADefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			FigureIsDead	{Tag = "ConvoyHorseB4_1"},
			FigureIsDead	{Tag = "ConvoyHorseB4_2"},
			FigureIsDead	{Tag = "ConvoyHorseB4_3"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_ConvoyB5_Enabled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA5_Enabled"},
			MapFlagIsFalse	{Name = "mf_BaseADefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "ConvoyGuardA5_1", Level = 8, UnitId = 311, X = 138, Y = 155, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardA5_2", Level = 8, UnitId = 304, X = 138, Y = 155, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardA5_3", Level = 8, UnitId = 304, X = 138, Y = 155, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardA5_4", Level = 8, UnitId = 311, X = 138, Y = 155, Team = "tm_Enemy"},

			FigureNpcSpawn	{Tag = "ConvoyHorseA5_1", Level = 5, UnitId = 262, X = 138, Y = 155, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyHorseA5_2", Level = 5, UnitId = 262, X = 138, Y = 155, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyHorseA5_3", Level = 5, UnitId = 262, X = 138, Y = 155, Team = "tm_Enemy"},

			MapFlagSetTrue	{Name = "mf_ConvoyA5_Moves"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA5_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardA5_1", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA5_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardA5_2", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA5_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardA5_3", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA5_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardA5_4", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA5_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseA5_1", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA5_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseA5_2", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA5_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseA5_3", X = 190, Y = 148}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA5_Moves"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			AND
			{
				OR
				{
				FigureIsInRange	{Tag = "ConvoyHorseA5_1", Range = 12, X = 530, Y = 462},
				FigureIsInRange	{Tag = "ConvoyHorseA5_2", Range = 12, X = 530, Y = 462},
				FigureIsInRange	{Tag = "ConvoyHorseA5_3", Range = 12, X = 530, Y = 462},
				},
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "ConvoyHorseA5_1"},
			FigureVanish	{Tag = "ConvoyHorseA5_2"},
			FigureVanish	{Tag = "ConvoyHorseA5_3"},
			MapFlagSetTrue	{Name = "mf_ConvoyA5_Disabled"},
			MapFlagSetTrue	{Name = "mf_ConvoyB5_Enabled"},
			PlayerResourceLenyaGive	{Player = "pl_Realm", Amount = 250},
			PlayerResourceSilverGive {Player = "pl_Realm", Amount = 300},
			PlayerResourceStoneGive	{Player = "pl_Realm", Amount = 150},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA5_Moves"},
			MapFlagIsFalse	{Name = "mf_BaseBDefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			FigureIsDead	{Tag = "ConvoyHorseA5_1"},
			FigureIsDead	{Tag = "ConvoyHorseA5_2"},
			FigureIsDead	{Tag = "ConvoyHorseA5_3"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_ConvoyB5_Enabled"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB5_Enabled"},
			MapFlagIsFalse	{Name = "mf_BaseBDefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "ConvoyGuardB5_1", Level = 8, UnitId = 311, X = 166, Y = 290, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardB5_2", Level = 8, UnitId = 304, X = 166, Y = 290, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardB5_3", Level = 8, UnitId = 304, X = 166, Y = 290, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyGuardB5_4", Level = 8, UnitId = 311, X = 166, Y = 290, Team = "tm_Enemy"},

			FigureNpcSpawn	{Tag = "ConvoyHorseB5_1", Level = 5, UnitId = 262, X = 166, Y = 290, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyHorseB5_2", Level = 5, UnitId = 262, X = 166, Y = 290, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ConvoyHorseB5_3", Level = 5, UnitId = 262, X = 166, Y = 290, Team = "tm_Enemy"},

			MapFlagSetTrue	{Name = "mf_ConvoyB5_Moves"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB5_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardB5_1", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB5_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardB5_2", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB5_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardB5_3", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB5_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyGuardB5_4", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
       	 			"435, 368",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB5_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseB5_1", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB5_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseB5_2", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB5_Moves"},
		},
		Actions =
		{
			FigurePathGoto
			{
    			Goto = FigureWalk{Tag = "ConvoyHorseB5_3", X = 224, Y = 301}, 
    			Points = 
    			{ 
        			"248, 238", 
        			"292, 240", 
        			"332, 273",
        			"378, 280",
        			"406, 305",
        			"406, 357",
        			"432, 378",
        			"455, 378",
        			"469, 418",
				"530, 462",
    			}
			}
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB5_Moves"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			AND
			{
				OR
				{
				FigureIsInRange	{Tag = "ConvoyHorseB5_1", Range = 12, X = 530, Y = 462},	  	
				FigureIsInRange	{Tag = "ConvoyHorseB5_2", Range = 12, X = 530, Y = 462},	  
				FigureIsInRange	{Tag = "ConvoyHorseB5_3", Range = 12, X = 530, Y = 462},
				},	   
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "ConvoyHorseB5_1"},
			FigureVanish	{Tag = "ConvoyHorseB5_2"},
			FigureVanish	{Tag = "ConvoyHorseB5_3"},
			MapFlagSetTrue	{Name = "mf_ConvoyB5_Disabled"},
			PlayerResourceLenyaGive	{Player = "pl_Realm", Amount = 250},
			PlayerResourceSilverGive {Player = "pl_Realm", Amount = 300},
			PlayerResourceStoneGive	{Player = "pl_Realm", Amount = 150},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyA1_Moves"},
			MapFlagIsTrue	{Name = "mf_ConvoyA2_Moves"},
			MapFlagIsTrue	{Name = "mf_ConvoyA3_Moves"},
			MapFlagIsTrue	{Name = "mf_ConvoyA4_Moves"},
			MapFlagIsTrue	{Name = "mf_ConvoyA5_Moves"},
			MapFlagIsTrue	{Name = "mf_ConvoyB1_Moves"},
			MapFlagIsTrue	{Name = "mf_ConvoyB2_Moves"},
			MapFlagIsTrue	{Name = "mf_ConvoyB3_Moves"},
			MapFlagIsTrue	{Name = "mf_ConvoyB4_Moves"},
			MapFlagIsTrue	{Name = "mf_ConvoyB5_Moves"},
			MapFlagIsFalse	{Name = "mf_SubquestFailed"},
			MapFlagIsFalse	{Name = "mf_WinMixedA"},
			MapFlagIsFalse	{Name = "mf_WinMixedB"},
			MapFlagIsFalse	{Name = "mf_BaseADefeated"},
			MapFlagIsFalse	{Name = "mf_BaseBDefeated"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			MapFlagIsFalse	{Name = "mf_ConvoyA1_Disabled"},
			MapFlagIsFalse	{Name = "mf_ConvoyA2_Disabled"},
			MapFlagIsFalse	{Name = "mf_ConvoyA3_Disabled"},
			MapFlagIsFalse	{Name = "mf_ConvoyA4_Disabled"},
			MapFlagIsFalse	{Name = "mf_ConvoyA5_Disabled"},
			MapFlagIsFalse	{Name = "mf_ConvoyB1_Disabled"},
			MapFlagIsFalse	{Name = "mf_ConvoyB2_Disabled"},
			MapFlagIsFalse	{Name = "mf_ConvoyB3_Disabled"},
			MapFlagIsFalse	{Name = "mf_ConvoyB4_Disabled"},
			MapFlagIsFalse	{Name = "mf_ConvoyB5_Disabled"},
			FigureIsDead	{Tag = "ConvoyHorseB5_1"},
			FigureIsDead	{Tag = "ConvoyHorseB5_2"},
			FigureIsDead	{Tag = "ConvoyHorseB5_3"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_ConvoysKilled"},
			FigureVanish	{Tag  = "ConvoyALeader"},
			FigureVanish	{Tag  = "ConvoyBLeader"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_ConvoysKilled"},
			MapFlagIsFalse	{Name = "mf_WinMixedA"},
			MapFlagIsFalse	{Name = "mf_WinMixedB"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			MapFlagIsFalse	{Name = "mf_SubquestFailed"},
			FigureIsDead	{Tag = "ConvoyALeader"},
			MapFlagIsTrue	{Name = "mf_SpyDone"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_BaseADefeated"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_ConvoysKilled"},
			MapFlagIsFalse	{Name = "mf_WinMixedA"},
			MapFlagIsFalse	{Name = "mf_WinMixedB"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			MapFlagIsFalse	{Name = "mf_SubquestFailed"},
			FigureIsDead	{Tag = "ConvoyBLeader"},
			MapFlagIsTrue	{Name = "mf_SpyDone"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_BaseBDefeated"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_BaseADefeated"},
			MapFlagIsTrue	{Name = "mf_BaseBDefeated"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_BaseABDefeated"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_BaseADefeated"},
			MapFlagIsFalse	{Name = "mf_ConvoysKilled"},
			MapFlagIsFalse	{Name = "mf_SubquestFailed"},
			MapFlagIsFalse	{Name = "mf_WinMixedB"},
			MapFlagIsFalse	{Name = "mf_ConvoyB1_Disabled"},
			MapFlagIsFalse	{Name = "mf_ConvoyB2_Disabled"},
			MapFlagIsFalse	{Name = "mf_ConvoyB3_Disabled"},
			MapFlagIsFalse	{Name = "mf_ConvoyB4_Disabled"},
			MapFlagIsFalse	{Name = "mf_ConvoyB5_Disabled"},
			MapFlagIsTrue	{Name = "mf_ConvoyB5_Moves"},
			FigureIsDead	{Tag = "ConvoyHorseB5_1"},
			FigureIsDead	{Tag = "ConvoyHorseB5_2"},
			FigureIsDead	{Tag = "ConvoyHorseB5_3"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_WinMixedA"},
			FigureVanish	{Tag = "ConvoyBLeader"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_BaseBDefeated"},
			MapFlagIsFalse	{Name = "mf_ConvoysKilled"},
			MapFlagIsFalse	{Name = "mf_SubquestFailed"},
			MapFlagIsFalse	{Name = "mf_WinMixedA"},
			MapFlagIsFalse	{Name = "mf_ConvoyA1_Disabled"},
			MapFlagIsFalse	{Name = "mf_ConvoyA2_Disabled"},
			MapFlagIsFalse	{Name = "mf_ConvoyA3_Disabled"},
			MapFlagIsFalse	{Name = "mf_ConvoyA4_Disabled"},
			MapFlagIsFalse	{Name = "mf_ConvoyA5_Disabled"},
			MapFlagIsTrue	{Name = "mf_ConvoyA5_Moves"},
			FigureIsDead	{Tag = "ConvoyHorseA5_1"},
			FigureIsDead	{Tag = "ConvoyHorseA5_2"},
			FigureIsDead	{Tag = "ConvoyHorseA5_3"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_WinMixedB"},
			FigureVanish	{Tag = "ConvoyALeader"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_BaseABDefeated"},
			MapFlagIsFalse	{Name = "mf_ConvoysKilled"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
			MapFlagIsFalse	{Name = "mf_WinMixedA"},
			MapFlagIsFalse	{Name = "mf_WinMixedB"},
		},
		Actions =
		{
			FigureOutcry {Tag = "Observer", TextTag = "Spy03"},
			QuestSetSolved {Player = "pl_Human1", Quest = "CoopMapQuestGillyshire"},
			QuestSetSolved {Player = "pl_Human2", Quest = "CoopMapQuestGillyshire"},
			QuestSetSolved {Player = "pl_Human3", Quest = "CoopMapQuestGillyshire"},
			MapFlagSetTrue	{Name = "mf_SubquestSReward"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoysKilled"},
			MapFlagIsFalse	{Name = "mf_BaseABDefeated"},
			MapFlagIsFalse	{Name = "mf_WinMixedA"},
			MapFlagIsFalse	{Name = "mf_WinMixedB"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
		},
		Actions =
		{
			FigureOutcry {Tag = "Observer", TextTag = "Spy03"},
			QuestSetSolved {Player = "pl_Human1", Quest = "CoopMapQuestGillyshire"},
			QuestSetSolved {Player = "pl_Human2", Quest = "CoopMapQuestGillyshire"},
			QuestSetSolved {Player = "pl_Human3", Quest = "CoopMapQuestGillyshire"},
			MapFlagSetTrue	{Name = "mf_SubquestSReward"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_WinMixedA"},
			MapFlagIsFalse	{Name = "mf_ConvoysKilled"},
			MapFlagIsFalse	{Name = "mf_BaseABDefeated"},
			MapFlagIsFalse	{Name = "mf_WinMixedB"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
		},
		Actions =
		{
			FigureOutcry {Tag = "Observer", TextTag = "Spy03"},
			QuestSetSolved {Player = "pl_Human1", Quest = "CoopMapQuestGillyshire"},
			QuestSetSolved {Player = "pl_Human2", Quest = "CoopMapQuestGillyshire"},
			QuestSetSolved {Player = "pl_Human3", Quest = "CoopMapQuestGillyshire"},
			MapFlagSetTrue	{Name = "mf_SubquestSReward"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_WinMixedB"},
			MapFlagIsFalse	{Name = "mf_ConvoysKilled"},
			MapFlagIsFalse	{Name = "mf_BaseABDefeated"},
			MapFlagIsFalse	{Name = "mf_WinMixedA"},
			MapFlagIsFalse	{Name = "mf_RealmDefeatedNotConvoys"},
		},
		Actions =
		{
			FigureOutcry {Tag = "Observer", TextTag = "Spy03"},
			QuestSetSolved {Player = "pl_Human1", Quest = "CoopMapQuestGillyshire"},
			QuestSetSolved {Player = "pl_Human2", Quest = "CoopMapQuestGillyshire"},
			QuestSetSolved {Player = "pl_Human3", Quest = "CoopMapQuestGillyshire"},
			MapFlagSetTrue	{Name = "mf_SubquestSReward"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotSolved {Player = "pl_Human1", Quest = "CoopMapQuestGillyshire"},
			QuestIsNotSolved {Player = "pl_Human2", Quest = "CoopMapQuestGillyshire"},
			QuestIsNotSolved {Player = "pl_Human3", Quest = "CoopMapQuestGillyshire"},
			MapFlagIsFalse	{Name = "mf_BaseABDefeated"},
			MapFlagIsFalse	{Name = "mf_ConvoysKilled"},
			MapFlagIsFalse	{Name = "mf_WinMixedA"},
			MapFlagIsFalse	{Name = "mf_WinMixedB"},
			MapFlagIsFalse	{Name = "mf_SubquestFailed"},
			PlayerHasNotBuildingAmount	{Player = "pl_Realm", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Realm", Amount = 1},
		},
		Actions =
		{
			FigureOutcry {Tag = "Observer", TextTag = "Spy03"},
			QuestSetSolved {Player = "pl_Human1", Quest = "CoopMapQuestGillyshire"},
			QuestSetSolved {Player = "pl_Human2", Quest = "CoopMapQuestGillyshire"},
			QuestSetSolved {Player = "pl_Human3", Quest = "CoopMapQuestGillyshire"},
			MapFlagSetTrue	{Name = "mf_RealmDefeatedNotConvoys"},
			FigureVanish	{Tag = "ConvoyALeader"},
			FigureVanish	{Tag = "ConvoyBLeader"},
			MapFlagSetTrue	{Name = "mf_SubquestSReward"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyB5_Moves"},
			AND
			{
				OR
				{
					MapFlagIsFalse	{Name = "mf_BaseADefeated"},
					MapFlagIsFalse	{Name = "mf_BaseBDefeated"},
				},
			},
			AND
			{
				OR
				{
					MapFlagIsTrue	{Name = "mf_ConvoyA1_Disabled"},
					MapFlagIsTrue	{Name = "mf_ConvoyA2_Disabled"},
					MapFlagIsTrue	{Name = "mf_ConvoyA3_Disabled"},
					MapFlagIsTrue	{Name = "mf_ConvoyA4_Disabled"},
					MapFlagIsTrue	{Name = "mf_ConvoyA5_Disabled"},
					MapFlagIsTrue	{Name = "mf_ConvoyB1_Disabled"},
					MapFlagIsTrue	{Name = "mf_ConvoyB2_Disabled"},
					MapFlagIsTrue	{Name = "mf_ConvoyB3_Disabled"},
					MapFlagIsTrue	{Name = "mf_ConvoyB4_Disabled"},
					MapFlagIsTrue	{Name = "mf_ConvoyB5_Disabled"},
				},
			},
		},
		Actions =
		{
			FigureVanish	{Tag = "ConvoyALeader"},
			FigureVanish	{Tag = "ConvoyBLeader"},
			MapFlagSetTrue	{Name = "mf_SubquestFailed"},
			QuestSetUnsolvable {Player = "pl_Human1", Quest = "CoopMapQuestGillyshire"},
			QuestSetUnsolvable {Player = "pl_Human2", Quest = "CoopMapQuestGillyshire"},
			QuestSetUnsolvable {Player = "pl_Human3", Quest = "CoopMapQuestGillyshire"},
		},
	},
};
