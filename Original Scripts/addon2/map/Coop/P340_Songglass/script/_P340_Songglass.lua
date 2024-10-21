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
			QuestIsNotSolved {Player = "pl_Human1", Quest = "CoopMapQuestSongGlass"},
			QuestIsNotSolved {Player = "pl_Human2", Quest = "CoopMapQuestSongGlass"},
			QuestIsNotSolved {Player = "pl_Human3", Quest = "CoopMapQuestSongGlass"},
		},
		Actions = 
		{
			MapTimerStart {Name = "mt_StartTimer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_StartTimer", Seconds = 10},
			MapFlagIsFalse	{Name = "mf_MalkuthAppears"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_MalkuthAppears"},
			PlayerResourceLenyaGive	{Player = "pl_Undead", Amount = 300},
			PlayerResourceSilverGive {Player = "pl_Undead", Amount = 300},
			PlayerResourceStoneGive	{Player = "pl_Undead", Amount = 300},
			PlayerResourceLenyaGive	{Player = "pl_Clans", Amount = 300},
			PlayerResourceSilverGive {Player = "pl_Clans", Amount = 300},
			PlayerResourceStoneGive	{Player = "pl_Clans", Amount = 300},
			MapTimerStop {Name = "mt_StartTimer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			CoopPlayerIsPlaying {Player = "pl_Human1"},
			MapFlagIsTrue	{Name = "mf_MalkuthAppears"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag  = "Malkuth", Level = 8, UnitId = 522, X = 588, Y = 105, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag  = "ConvoyGuard01", Level = 6, UnitId = 272, X = 602, Y = 105, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag  = "ConvoyGuard02", Level = 6, UnitId = 1126, X = 602, Y = 105, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag  = "ConvoyGuard03", Level = 6, UnitId = 1126, X = 602, Y = 105, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag  = "ConvoyHorse01", Level = 3, UnitId = 262, X = 602, Y = 112, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag  = "ConvoyHorse02", Level = 3, UnitId = 262, X = 602, Y = 112, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag  = "ConvoyHorse03", Level = 3, UnitId = 262, X = 602, Y = 112, Team = "tm_Neutral"},
			FogOfWarReveal	{FogOfWarId = default, X = 588, Y = 105, Range = 12, Height = default},
			EntityValueSet	{Name = "ev_MalkuthRevealed", Value = 1},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityValueIsEqual {Name = "ev_MalkuthRevealed", Value = 1},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Malkuth", TextTag = "Malkuth01"},
			FigureOutcry	{Tag = "Malkuth", TextTag = "Malkuth02"},
			FigureOutcry	{Tag = "Malkuth", TextTag = "Malkuth03"},
			QuestSetActive {Player = "pl_Human1", Quest = "CoopMapQuestSongGlass"},
			MapFlagSetTrue	{Name = "mf_MalkuthDone"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			CoopPlayerIsNotPlaying 	{Player = "pl_Human1"},
			CoopPlayerIsPlaying 	{Player = "pl_Human2"},
			MapFlagIsTrue	{Name = "mf_MalkuthAppears"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag  = "Malkuth", Level = 8, UnitId = 522, X = 588, Y = 105, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag  = "ConvoyGuard01", Level = 6, UnitId = 272, X = 602, Y = 105, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag  = "ConvoyGuard02", Level = 6, UnitId = 1126, X = 602, Y = 105, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag  = "ConvoyGuard03", Level = 6, UnitId = 1126, X = 602, Y = 105, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag  = "ConvoyHorse01", Level = 3, UnitId = 262, X = 602, Y = 112, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag  = "ConvoyHorse02", Level = 3, UnitId = 262, X = 602, Y = 112, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag  = "ConvoyHorse03", Level = 3, UnitId = 262, X = 602, Y = 112, Team = "tm_Neutral"},
			FogOfWarReveal	{FogOfWarId = default, X = 588, Y = 105, Range = 12, Height = default},
			EntityValueSet	{Name = "ev_MalkuthRevealed", Value = 2},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityValueIsEqual {Name = "ev_MalkuthRevealed", Value = 2},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Malkuth", TextTag = "Malkuth01"},
			FigureOutcry	{Tag = "Malkuth", TextTag = "Malkuth02"},
			FigureOutcry	{Tag = "Malkuth", TextTag = "Malkuth03"},
			QuestSetActive {Player = "pl_Human2", Quest = "CoopMapQuestSongGlass"},
			MapFlagSetTrue	{Name = "mf_MalkuthDone"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			CoopPlayerIsNotPlaying 	{Player = "pl_Human1"},
			CoopPlayerIsNotPlaying 	{Player = "pl_Human2"},
			CoopPlayerIsPlaying 	{Player = "pl_Human3"},
			MapFlagIsTrue	{Name = "mf_MalkuthAppears"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag  = "Malkuth", Level = 8, UnitId = 522, X = 588, Y = 105, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag  = "ConvoyGuard01", Level = 6, UnitId = 272, X = 602, Y = 105, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag  = "ConvoyGuard02", Level = 6, UnitId = 1126, X = 602, Y = 105, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag  = "ConvoyGuard03", Level = 6, UnitId = 1126, X = 602, Y = 105, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag  = "ConvoyHorse01", Level = 3, UnitId = 262, X = 602, Y = 112, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag  = "ConvoyHorse02", Level = 3, UnitId = 262, X = 602, Y = 112, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag  = "ConvoyHorse03", Level = 3, UnitId = 262, X = 602, Y = 112, Team = "tm_Neutral"},
			FogOfWarReveal	{FogOfWarId = default, X = 588, Y = 105, Range = 12, Height = default},
			EntityValueSet	{Name = "ev_MalkuthRevealed", Value = 3},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityValueIsEqual {Name = "ev_MalkuthRevealed", Value = 3},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Malkuth", TextTag = "Malkuth01"},
			FigureOutcry	{Tag = "Malkuth", TextTag = "Malkuth02"},
			FigureOutcry	{Tag = "Malkuth", TextTag = "Malkuth03"},
			QuestSetActive {Player = "pl_Human3", Quest = "CoopMapQuestSongGlass"},
			MapFlagSetTrue	{Name = "mf_MalkuthDone"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ClansDefeated"},
			MapFlagIsFalse	{Name = "mf_UndeadDefeated"},
			MapFlagIsFalse	{Name = "mf_EnemyFeed"},
		},
		Actions = 
		{
			PlayerResourceLenyaGive	{Player = "pl_Undead", Amount = 6000},
			PlayerResourceSilverGive {Player = "pl_Undead", Amount = 6000},
			PlayerResourceStoneGive	{Player = "pl_Undead", Amount = 6000},
			PlayerResourceLenyaGive	{Player = "pl_Clans", Amount = 6000},
			PlayerResourceSilverGive {Player = "pl_Clans", Amount = 6000},
			PlayerResourceStoneGive	{Player = "pl_Clans", Amount = 6000},
			MapFlagSetTrue	{Name = "mf_EnemyFeed"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_UndeadDefeated"},
			MapFlagIsFalse	{Name = "mf_ClansDefeated"},
			MapFlagIsFalse	{Name = "mf_EnemyFeed"},
		},
		Actions = 
		{
			PlayerResourceLenyaGive	{Player = "pl_Undead", Amount = 6000},
			PlayerResourceSilverGive {Player = "pl_Undead", Amount = 6000},
			PlayerResourceStoneGive	{Player = "pl_Undead", Amount = 6000},
			PlayerResourceLenyaGive	{Player = "pl_Clans", Amount = 6000},
			PlayerResourceSilverGive {Player = "pl_Clans", Amount = 6000},
			PlayerResourceStoneGive	{Player = "pl_Clans", Amount = 6000},
			MapFlagSetTrue	{Name = "mf_EnemyFeed"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_EnemyFeed"},
			MapFlagIsTrue	{Name = "mf_MalkuthDone"},
		},
		Actions = 
		{
			FigureTeamTransfer	{Tag = "Malkuth", Team = "tm_Human"},
			FigureTeamTransfer	{Tag = "ConvoyGuard01", Team = "tm_Human"},
			FigureTeamTransfer	{Tag = "ConvoyGuard02", Team = "tm_Human"},
			FigureTeamTransfer	{Tag = "ConvoyGuard03", Team = "tm_Human"},
			FigureTeamTransfer	{Tag = "ConvoyHorse01", Team = "tm_Human"},
			FigureTeamTransfer	{Tag = "ConvoyHorse02", Team = "tm_Human"},
			FigureTeamTransfer	{Tag = "ConvoyHorse03", Team = "tm_Human"},
			MapFlagSetTrue	{Name = "mf_ConvoyTransfered"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ConvoyTransfered"},
		},
		Actions = 
		{
			FigureWalk	{Tag = "Malkuth", X = 546, Y = 105},
			FigureWalk	{Tag = "ConvoyGuard01", X = 546, Y = 105},
			FigureWalk	{Tag = "ConvoyGuard02", X = 546, Y = 105},
			FigureWalk	{Tag = "ConvoyGuard03", X = 546, Y = 105},
			FigureWalk	{Tag = "ConvoyHorse01", X = 546, Y = 105},
			FigureWalk	{Tag = "ConvoyHorse02", X = 546, Y = 105},
			FigureWalk	{Tag = "ConvoyHorse03", X = 546, Y = 105},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRange	{Tag = "Malkuth", Range = 5, X = 546, Y = 105},

			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse01", Range = 5, X = 546, Y = 105},	  
				FigureIsDead	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse02", Range = 5, X = 546, Y = 105},	  
				FigureIsDead	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse03", Range = 5, X = 546, Y = 105},	  
				FigureIsDead	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard01", Range = 5, X = 546, Y = 105},	  
				FigureIsDead	{Tag = "ConvoyGuard01"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard02", Range = 5, X = 546, Y = 105},	  
				FigureIsDead	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard03", Range = 5, X = 546, Y = 105},	  
				FigureIsDead	{Tag = "ConvoyGuard03"}, 
			},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag  = "ConvoyEnemy01", Level = 10, UnitId = 193, X = 441, Y = 280, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag  = "ConvoyEnemy02", Level = 10, UnitId = 193, X = 441, Y = 280, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag  = "ConvoyEnemy03", Level = 10, UnitId = 193, X = 441, Y = 280, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag  = "ConvoyEnemy04", Level = 10, UnitId = 193, X = 441, Y = 280, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag  = "ConvoyEnemy05", Level = 10, UnitId = 193, X = 441, Y = 280, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag  = "ConvoyEnemy06", Level = 10, UnitId = 193, X = 441, Y = 280, Team = "tm_Enemy"},
			FigureWalk	{Tag = "Malkuth", X = 448, Y = 273},
			FigureWalk	{Tag = "ConvoyGuard01", X = 448, Y = 273},
			FigureWalk	{Tag = "ConvoyGuard02", X = 448, Y = 273},
			FigureWalk	{Tag = "ConvoyGuard03", X = 448, Y = 273},
			FigureWalk	{Tag = "ConvoyHorse01", X = 448, Y = 273},
			FigureWalk	{Tag = "ConvoyHorse02", X = 448, Y = 273},
			FigureWalk	{Tag = "ConvoyHorse03", X = 448, Y = 273},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRange	{Tag = "Malkuth", Range = 5, X = 448, Y = 273},

			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse01", Range = 5, X = 448, Y = 273},	  
				FigureIsDead	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse02", Range = 5, X = 448, Y = 273},	  
				FigureIsDead	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse03", Range = 5, X = 448, Y = 273},	  
				FigureIsDead	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard01", Range = 5, X = 448, Y = 273},	  
				FigureIsDead	{Tag = "ConvoyGuard01"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard02", Range = 5, X = 448, Y = 273},	  
				FigureIsDead	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard03", Range = 5, X = 448, Y = 273},	  
				FigureIsDead	{Tag = "ConvoyGuard03"}, 
			},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag  = "ConvoyEnemyA1", Level = 10, UnitId = 193, X = 371, Y = 308, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag  = "ConvoyEnemyA2", Level = 10, UnitId = 193, X = 371, Y = 308, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag  = "ConvoyEnemyA3", Level = 10, UnitId = 193, X = 371, Y = 308, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag  = "ConvoyEnemyA4", Level = 10, UnitId = 193, X = 371, Y = 308, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag  = "ConvoyEnemyA5", Level = 10, UnitId = 193, X = 371, Y = 308, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag  = "ConvoyEnemyA6", Level = 10, UnitId = 193, X = 371, Y = 308, Team = "tm_Enemy"},
			FigureWalk	{Tag = "Malkuth", X = 371, Y = 287},
			FigureWalk	{Tag = "ConvoyHorse01", X = 371, Y = 287},
			FigureWalk	{Tag = "ConvoyHorse02", X = 371, Y = 287},
			FigureWalk	{Tag = "ConvoyHorse03", X = 371, Y = 287},
			FigureWalk	{Tag = "ConvoyGuard01", X = 371, Y = 287},
			FigureWalk	{Tag = "ConvoyGuard02", X = 371, Y = 287},
			FigureWalk	{Tag = "ConvoyGuard03", X = 371, Y = 287},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRange	{Tag = "Malkuth", Range = 5, X = 371, Y = 287},

			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse01", Range = 5, X = 371, Y = 287},	  
				FigureIsDead	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse02", Range = 5, X = 371, Y = 287},	  
				FigureIsDead	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse03", Range = 5, X = 371, Y = 287},	  
				FigureIsDead	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard01", Range = 5, X = 371, Y = 287},	  
				FigureIsDead	{Tag = "ConvoyGuard01"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard02", Range = 5, X = 371, Y = 287},	  
				FigureIsDead	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard03", Range = 5, X = 371, Y = 287},	  
				FigureIsDead	{Tag = "ConvoyGuard03"}, 
			},
		},
		Actions = 
		{
			FigureWalk	{Tag = "Malkuth", X = 364, Y = 441},
			FigureWalk	{Tag = "ConvoyHorse01", X = 364, Y = 441},
			FigureWalk	{Tag = "ConvoyHorse02", X = 364, Y = 441},
			FigureWalk	{Tag = "ConvoyHorse03", X = 364, Y = 441},
			FigureWalk	{Tag = "ConvoyGuard01", X = 364, Y = 441},
			FigureWalk	{Tag = "ConvoyGuard02", X = 364, Y = 441},
			FigureWalk	{Tag = "ConvoyGuard03", X = 364, Y = 441},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRange	{Tag = "Malkuth", Range = 5, X = 364, Y = 441},

			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse01", Range = 5, X = 364, Y = 441},	  
				FigureIsDead	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse02", Range = 5, X = 364, Y = 441},	  
				FigureIsDead	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse03", Range = 5, X = 364, Y = 441},	  
				FigureIsDead	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard01", Range = 5, X = 364, Y = 441},	  
				FigureIsDead	{Tag = "ConvoyGuard01"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard02", Range = 5, X = 364, Y = 441},	  
				FigureIsDead	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard03", Range = 5, X = 364, Y = 441},	  
				FigureIsDead	{Tag = "ConvoyGuard03"}, 
			},
		},
		Actions = 
		{
			FigureWalk	{Tag = "Malkuth", X = 385, Y = 497},
			FigureWalk	{Tag = "ConvoyHorse01", X = 385, Y = 497},
			FigureWalk	{Tag = "ConvoyHorse02", X = 385, Y = 497},
			FigureWalk	{Tag = "ConvoyHorse03", X = 385, Y = 497},
			FigureWalk	{Tag = "ConvoyGuard01", X = 385, Y = 497},
			FigureWalk	{Tag = "ConvoyGuard02", X = 385, Y = 497},
			FigureWalk	{Tag = "ConvoyGuard03", X = 385, Y = 497},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRange	{Tag = "Malkuth", Range = 5, X = 385, Y = 497},

			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse01", Range = 5, X = 385, Y = 497},	  
				FigureIsDead	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse02", Range = 5, X = 385, Y = 497},	  
				FigureIsDead	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse03", Range = 5, X = 385, Y = 497},	  
				FigureIsDead	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard01", Range = 5, X = 385, Y = 497},	  
				FigureIsDead	{Tag = "ConvoyGuard01"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard02", Range = 5, X = 385, Y = 497},	  
				FigureIsDead	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard03", Range = 5, X = 385, Y = 497},	  
				FigureIsDead	{Tag = "ConvoyGuard03"}, 
			},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag  = "ConvoyEnemyB1", Level = 10, UnitId = 193, X = 336, Y = 490, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag  = "ConvoyEnemyB2", Level = 10, UnitId = 193, X = 336, Y = 490, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag  = "ConvoyEnemyB3", Level = 10, UnitId = 193, X = 336, Y = 490, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag  = "ConvoyEnemyB4", Level = 10, UnitId = 193, X = 336, Y = 490, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag  = "ConvoyEnemyB5", Level = 10, UnitId = 193, X = 336, Y = 490, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag  = "ConvoyEnemyB6", Level = 10, UnitId = 193, X = 336, Y = 490, Team = "tm_Enemy"},
			FigureWalk	{Tag = "Malkuth", X = 336, Y = 490},
			FigureWalk	{Tag = "ConvoyHorse01", X = 336, Y = 490},
			FigureWalk	{Tag = "ConvoyHorse02", X = 336, Y = 490},
			FigureWalk	{Tag = "ConvoyHorse03", X = 336, Y = 490},
			FigureWalk	{Tag = "ConvoyGuard01", X = 336, Y = 490},
			FigureWalk	{Tag = "ConvoyGuard02", X = 336, Y = 490},
			FigureWalk	{Tag = "ConvoyGuard03", X = 336, Y = 490},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRange	{Tag = "Malkuth", Range = 5, X = 336, Y = 490},

			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse01", Range = 5, X = 336, Y = 490},	  
				FigureIsDead	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse02", Range = 5, X = 336, Y = 490},	  
				FigureIsDead	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse03", Range = 5, X = 336, Y = 490},	  
				FigureIsDead	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard01", Range = 5, X = 336, Y = 490},	  
				FigureIsDead	{Tag = "ConvoyGuard01"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard02", Range = 5, X = 336, Y = 490},	  
				FigureIsDead	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard03", Range = 5, X = 336, Y = 490},	  
				FigureIsDead	{Tag = "ConvoyGuard03"}, 
			},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag  = "ConvoyEnemyC1", Level = 10, UnitId = 193, X = 231, Y = 532, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag  = "ConvoyEnemyC2", Level = 10, UnitId = 193, X = 231, Y = 532, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag  = "ConvoyEnemyC3", Level = 10, UnitId = 193, X = 231, Y = 532, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag  = "ConvoyEnemyC4", Level = 10, UnitId = 193, X = 231, Y = 532, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag  = "ConvoyEnemyC5", Level = 10, UnitId = 193, X = 231, Y = 532, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag  = "ConvoyEnemyC6", Level = 10, UnitId = 193, X = 231, Y = 532, Team = "tm_Enemy"},
			FigureWalk	{Tag = "Malkuth", X = 259, Y = 490},
			FigureWalk	{Tag = "ConvoyHorse01", X = 259, Y = 490},
			FigureWalk	{Tag = "ConvoyHorse02", X = 259, Y = 490},
			FigureWalk	{Tag = "ConvoyHorse03", X = 259, Y = 490},
			FigureWalk	{Tag = "ConvoyGuard01", X = 259, Y = 490},
			FigureWalk	{Tag = "ConvoyGuard02", X = 259, Y = 490},
			FigureWalk	{Tag = "ConvoyGuard03", X = 259, Y = 490},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRange	{Tag = "Malkuth", Range = 5, X = 259, Y = 490},

			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse01", Range = 5, X = 259, Y = 490},	  
				FigureIsDead	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse02", Range = 5, X = 259, Y = 490},	  
				FigureIsDead	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse03", Range = 5, X = 259, Y = 490},	  
				FigureIsDead	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard01", Range = 5, X = 259, Y = 490},	  
				FigureIsDead	{Tag = "ConvoyGuard01"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard02", Range = 5, X = 259, Y = 490},	  
				FigureIsDead	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard03", Range = 5, X = 259, Y = 490},	  
				FigureIsDead	{Tag = "ConvoyGuard03"}, 
			},
		},
		Actions = 
		{
			FigureWalk	{Tag = "Malkuth", X = 231, Y = 520},
			FigureWalk	{Tag = "ConvoyHorse01", X = 231, Y = 520},
			FigureWalk	{Tag = "ConvoyHorse02", X = 231, Y = 520},
			FigureWalk	{Tag = "ConvoyHorse03", X = 231, Y = 520},
			FigureWalk	{Tag = "ConvoyGuard01", X = 231, Y = 520},
			FigureWalk	{Tag = "ConvoyGuard02", X = 231, Y = 520},
			FigureWalk	{Tag = "ConvoyGuard03", X = 231, Y = 520},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRange	{Tag = "Malkuth", Range = 5, X = 231, Y = 520},

			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse01", Range = 5, X = 231, Y = 520},	  
				FigureIsDead	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse02", Range = 5, X = 231, Y = 520},	  
				FigureIsDead	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse03", Range = 5, X = 231, Y = 520},	  
				FigureIsDead	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard01", Range = 5, X = 231, Y = 520},	  
				FigureIsDead	{Tag = "ConvoyGuard01"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard02", Range = 5, X = 231, Y = 520},	  
				FigureIsDead	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard03", Range = 5, X = 231, Y = 520},	  
				FigureIsDead	{Tag = "ConvoyGuard03"}, 
			},
		},
		Actions = 
		{
			FigureWalk	{Tag = "Malkuth", X = 189, Y = 520},
			FigureWalk	{Tag = "ConvoyHorse01", X = 189, Y = 520},
			FigureWalk	{Tag = "ConvoyHorse02", X = 189, Y = 520},
			FigureWalk	{Tag = "ConvoyHorse03", X = 189, Y = 520},
			FigureWalk	{Tag = "ConvoyGuard01", X = 189, Y = 520},
			FigureWalk	{Tag = "ConvoyGuard02", X = 189, Y = 520},
			FigureWalk	{Tag = "ConvoyGuard03", X = 189, Y = 520},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRange	{Tag = "Malkuth", Range = 5, X = 189, Y = 520},

			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse01", Range = 5, X = 189, Y = 520},	  
				FigureIsDead	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse02", Range = 5, X = 189, Y = 520},	  
				FigureIsDead	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse03", Range = 5, X = 189, Y = 520},	  
				FigureIsDead	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard01", Range = 5, X = 189, Y = 520},	  
				FigureIsDead	{Tag = "ConvoyGuard01"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard02", Range = 5, X = 189, Y = 520},	  
				FigureIsDead	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard03", Range = 5, X = 189, Y = 520},	  
				FigureIsDead	{Tag = "ConvoyGuard03"}, 
			},
		},
		Actions = 
		{
			FigureWalk	{Tag = "Malkuth", X = 203, Y = 434},
			FigureWalk	{Tag = "ConvoyHorse01", X = 203, Y = 434},
			FigureWalk	{Tag = "ConvoyHorse02", X = 203, Y = 434},
			FigureWalk	{Tag = "ConvoyHorse03", X = 203, Y = 434},
			FigureWalk	{Tag = "ConvoyGuard01", X = 203, Y = 434},
			FigureWalk	{Tag = "ConvoyGuard02", X = 203, Y = 434},
			FigureWalk	{Tag = "ConvoyGuard03", X = 203, Y = 434},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRange	{Tag = "Malkuth", Range = 5, X = 203, Y = 434},

			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse01", Range = 5, X = 203, Y = 434},	  
				FigureIsDead	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse02", Range = 5, X = 203, Y = 434},	  
				FigureIsDead	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse03", Range = 5, X = 203, Y = 434},	  
				FigureIsDead	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard01", Range = 5, X = 203, Y = 434},	  
				FigureIsDead	{Tag = "ConvoyGuard01"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard02", Range = 5, X = 203, Y = 434},	  
				FigureIsDead	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard03", Range = 5, X = 203, Y = 434},	  
				FigureIsDead	{Tag = "ConvoyGuard03"}, 
			},
		},
		Actions = 
		{
			FigureWalk	{Tag = "Malkuth", X = 201, Y = 366},
			FigureWalk	{Tag = "ConvoyHorse01", X = 201, Y = 366},
			FigureWalk	{Tag = "ConvoyHorse02", X = 201, Y = 366},
			FigureWalk	{Tag = "ConvoyHorse03", X = 201, Y = 366},
			FigureWalk	{Tag = "ConvoyGuard01", X = 201, Y = 366},
			FigureWalk	{Tag = "ConvoyGuard02", X = 201, Y = 366},
			FigureWalk	{Tag = "ConvoyGuard03", X = 201, Y = 366},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRange	{Tag = "Malkuth", Range = 5, X = 201, Y = 366},

			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse01", Range = 5, X = 201, Y = 366},	  
				FigureIsDead	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse02", Range = 5, X = 201, Y = 366},	  
				FigureIsDead	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyHorse03", Range = 5, X = 201, Y = 366},	  
				FigureIsDead	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard01", Range = 5, X = 201, Y = 366},	  
				FigureIsDead	{Tag = "ConvoyGuard01"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard02", Range = 5, X = 201, Y = 366},	  
				FigureIsDead	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInRange	{Tag = "ConvoyGuard03", Range = 5, X = 201, Y = 366},	  
				FigureIsDead	{Tag = "ConvoyGuard03"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity	{Tag = "Malkuth", TargetTag = "MerchantSafePoint"},
			FigureWalkToEntity	{Tag = "ConvoyHorse01", TargetTag = "MerchantSafePoint"},
			FigureWalkToEntity	{Tag = "ConvoyHorse02", TargetTag = "MerchantSafePoint"},
			FigureWalkToEntity	{Tag = "ConvoyHorse03", TargetTag = "MerchantSafePoint"},
			FigureWalkToEntity	{Tag = "ConvoyGuard01", TargetTag = "MerchantSafePoint"},
			FigureWalkToEntity	{Tag = "ConvoyGuard02", TargetTag = "MerchantSafePoint"},
			FigureWalkToEntity	{Tag = "ConvoyGuard03", TargetTag = "MerchantSafePoint"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "ConvoyHorse01", TargetTag = "MerchantSafePoint", Range = 10},
		},
		Actions = 
		{
			MapValueAdd {Name = "mv_HorseSaved", Value = 1},
			FigureVanish	{Tag = "ConvoyHorse01"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "ConvoyHorse02", TargetTag = "MerchantSafePoint", Range = 10},
		},
		Actions = 
		{
			MapValueAdd {Name = "mv_HorseSaved", Value = 1},
			FigureVanish	{Tag = "ConvoyHorse02"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "ConvoyHorse03", TargetTag = "MerchantSafePoint", Range = 10},
		},
		Actions = 
		{
			MapValueAdd {Name = "mv_HorseSaved", Value = 1},
			FigureVanish	{Tag = "ConvoyHorse03"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsGreater {Name = "mv_HorseSaved", Value = 2},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_SubquestDone"},
			QuestSetSolved {Player = "pl_Human1", Quest = "CoopMapQuestSongGlass"},
			QuestSetSolved {Player = "pl_Human2", Quest = "CoopMapQuestSongGlass"},
			QuestSetSolved {Player = "pl_Human3", Quest = "CoopMapQuestSongGlass"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SubquestDone"},
		},
		Actions =
		{
			FigureOutcry {Tag = "ConvoyGuard01", TextTag = "ConvoyLeader01"},
			FigureOutcry {Tag = "ConvoyGuard01", TextTag = "ConvoyLeader02"},
			MapFlagSetTrue	{Name = "mf_VanishGuards"},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1161, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1161, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1161, Amount = 1},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_VanishGuards"},
		},
		Actions =
		{
			FigureVanish	{Tag = "Malkuth"},
			FigureVanish	{Tag = "ConvoyGuard01"},
			FigureVanish	{Tag = "ConvoyGuard02"},
			FigureVanish	{Tag = "ConvoyGuard03"},
			MapFlagSetTrue	{Name = "mf_SubquestSReward"},
		},
	},
};
