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
			FigureVanish	{Tag = "CitizenGfxCacheDummies"},
		},
		GotoState = "MAIN",
	},
};

for i = 1, 3 do
	local sPlayerName = "pl_Human" .. i

	OnOneTimeEvent
	{
		EventName = "MarketplaceReached" .. sPlayerName,
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopMarketplaceGoldenFields"},
			BuildingIsDead	{Tag = "LowLevelTower06"},
		},
		Actions = 
		{
			QuestSetSolved	{Player = sPlayerName, Quest = "CoopMarketplaceGoldenFields"},
			MapFlagSetTrue	{Name = "mf_MarketplaceReached"},
			QuestSetActive	{Player = sPlayerName, Quest = "CoopMarketplaceGoldenFieldsReached"},
		},
	};	
	OnOneTimeEvent
	{
		EventName = "CrystalQuestSolveActivateCurseQuestForPlayer" .. i,
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopMagicBarrierCrystalsDestroyedEnough"},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 58, Amount = 1},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 59, Amount = 1},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 60, Amount = 1},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 61, Amount = 1},
		},
		Actions = 
		{
			QuestSetSolved	{Player = sPlayerName, Quest = "CoopMagicBarrierCrystalsDestroyedEnough"},
			QuestSetActive	{Player = sPlayerName, Quest = "CoopGoldenFieldsCurse"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopGoldenFieldsCurse"},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 58, Amount = 1},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 59, Amount = 1},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 60, Amount = 1},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 61, Amount = 1},
			FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 25, TargetTag = "EvilMage"},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "EvilMage", TextTag = "EvilMage01"},
			AvatarItemMiscTake	{Player = sPlayerName, ItemId = 58, Amount = 999},
			AvatarItemMiscTake	{Player = sPlayerName, ItemId = 59, Amount = 999},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 60, Amount = 1},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 61, Amount = 1},
			FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 15, TargetTag = "EvilMage"},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "EvilMage", TextTag = "EvilMage02"},
			AvatarItemMiscTake	{Player = sPlayerName, ItemId = 60, Amount = 999},
			AvatarItemMiscTake	{Player = sPlayerName, ItemId = 61, Amount = 999},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Player = sPlayerName, Quest = "CoopGoldenFieldsCurse"},
			MapFlagIsFalse {Name = "mf_EvilMageIsDead"},
		},
		Actions = 
		{
			ObjectVanish	{Tag = "ForceField"},
			ObjectVanish	{Tag = "Blockers"},
			ObjectVanish	{Tag = "Blocker1"},
			ObjectVanish	{Tag = "Blocker2"},
			ObjectVanish	{Tag = "Blocker3"},
			ObjectVanish	{Tag = "Blocker4"},
			FigureVanish	{Tag = "EvilMage"},
			FigureVanish	{Tag = "EvilMageGuards"},
			FigureVanish	{Tag = "LowLevelMobs"},
			BuildingDestroy	{Tag = "LowLevelTowers"},
			FigureVanish	{Tag = "HighLevelMobs"},
			BuildingDestroy	{Tag = "HighLevelTowers"},
			FigureNpcSpawn	{Tag = "KingUlf", Level = 24, UnitId = 1064, X = 441, Y = 310, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "Einar", Level = 22, UnitId = 222, X = 441, Y = 301, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Citizen01", Level = 20, UnitId = 247, X = 338, Y = 366, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "Citizen02", Level = 20, UnitId = 248, X = 337, Y = 366, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "Citizen03", Level = 20, UnitId = 249, X = 336, Y = 366, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "Citizen04", Level = 20, UnitId = 250, X = 339, Y = 366, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "Citizen05", Level = 20, UnitId = 251, X = 340, Y = 366, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "Citizen06", Level = 20, UnitId = 252, X = 357, Y = 350, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "Citizen07", Level = 20, UnitId = 253, X = 358, Y = 350, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "Citizen08", Level = 20, UnitId = 254, X = 356, Y = 350, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "Citizen09", Level = 20, UnitId = 255, X = 329, Y = 455, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "Citizen10", Level = 20, UnitId = 256, X = 330, Y = 455, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CommanderA", Level = 22, UnitId = 1047, X = 335, Y = 277, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Soldier01", Level = 21, UnitId = 311, X = 335, Y = 280, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Soldier02", Level = 21, UnitId = 311, X = 336, Y = 280, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Soldier03", Level = 21, UnitId = 311, X = 335, Y = 279, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Soldier04", Level = 21, UnitId = 311, X = 336, Y = 281, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Soldier05", Level = 21, UnitId = 311, X = 335, Y = 281, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "CommanderB", Level = 22, UnitId = 1047, X = 420, Y = 278, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Soldier06", Level = 21, UnitId = 311, X = 420, Y = 280, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Soldier07", Level = 21, UnitId = 311, X = 421, Y = 280, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Soldier08", Level = 21, UnitId = 311, X = 419, Y = 280, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Soldier09", Level = 21, UnitId = 311, X = 420, Y = 281, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Soldier10", Level = 21, UnitId = 311, X = 421, Y = 281, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "CommanderC", Level = 22, UnitId = 1047, X = 441, Y = 295, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Soldier11", Level = 21, UnitId = 311, X = 441, Y = 295, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Soldier12", Level = 21, UnitId = 311, X = 441, Y = 295, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Soldier13", Level = 21, UnitId = 311, X = 441, Y = 295, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Soldier14", Level = 21, UnitId = 311, X = 441, Y = 295, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Soldier15", Level = 21, UnitId = 311, X = 441, Y = 295, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "CitizenMale", Level = 12, UnitId = 247, X = 233, Y = 460, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "CitizenFemale", Level = 12, UnitId = 253, X = 231, Y = 460, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "Citizen03", Level = 16, UnitId = 324, X = 235, Y = 460, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Citizen04", Level = 12, UnitId = 256, X = 233, Y = 462, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "Citizen05", Level = 12, UnitId = 251, X = 233, Y = 458, Team = "tm_Neutral"},
			MapFlagSetTrue {Name = "mf_NoQuests"},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_NoQuests"},
			FigureIsIdle	{Tag = "CommanderC"},
		},
		Actions = 
		{
			FigurePathGoto
			{
				Goto = FigureWalk {Tag = "CommanderC", X = 438, Y = 270}, 
				Points = 
				{
					"410, 277",
					"364, 294",
					"358, 336",
					"340, 369",
					"404, 389",
					"340, 369",
					"358, 336",
					"364, 294",
					"410, 277",
					"441, 295",
				},
			},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_NoQuests"},
			FigureIsIdle	{Tag = "Soldier11"},
		},
		Actions = 
		{
			FigurePathGoto
			{
				Goto = FigureWalk {Tag = "Soldier11", X = 438, Y = 270}, 
				Points = 
				{
					"410, 277",
					"364, 294",
					"358, 336",
					"340, 369",
					"404, 389",
					"340, 369",
					"358, 336",
					"364, 294",
					"410, 277",
					"441, 295",
				},
			},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_NoQuests"},
			FigureIsIdle	{Tag = "Soldier12"},
		},
		Actions = 
		{
			FigurePathGoto
			{
				Goto = FigureWalk {Tag = "Soldier12", X = 438, Y = 270}, 
				Points = 
				{
					"410, 277",
					"364, 294",
					"358, 336",
					"340, 369",
					"404, 389",
					"340, 369",
					"358, 336",
					"364, 294",
					"410, 277",
					"441, 295",
				},
			},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_NoQuests"},
			FigureIsIdle	{Tag = "Soldier13"},
		},
		Actions = 
		{
			FigurePathGoto
			{
				Goto = FigureWalk {Tag = "Soldier13", X = 438, Y = 270}, 
				Points = 
				{
					"410, 277",
					"364, 294",
					"358, 336",
					"340, 369",
					"404, 389",
					"340, 369",
					"358, 336",
					"364, 294",
					"410, 277",
					"441, 295",
				},
			},
		},
	};
end

State
{
	StateName = "MAIN",

	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Player = "pl_Human1", Quest = "CoopMarketplaceGoldenFields"},
			FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 25, TargetTag = "LowLevelTower06"},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "pl_Human1Avatar", TextTag = "Avatar01"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Player = "pl_Human2", Quest = "CoopMarketplaceGoldenFields"},
			FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 25, TargetTag = "LowLevelTower06"},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "pl_Human2Avatar", TextTag = "Avatar01"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Player = "pl_Human3", Quest = "CoopMarketplaceGoldenFields"},
			FigureTeamIsInRangeToEntity	{Team = "tm_Human", Range = 25, TargetTag = "LowLevelTower06"},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "pl_Human3Avatar", TextTag = "Avatar01"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			CoopPlayerIsPlaying	{Player = "pl_Human1"},
			QuestIsNotActive	{Player = "pl_Human1", Quest = "CoopGoldenFieldsCurse"},
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopGoldenFieldsCurse"},
			AND
			{
				OR
				{
					AvatarHasNotItemMisc	{Player = "pl_Human1", ItemId = 58, Amount = 1},
					AvatarHasNotItemMisc	{Player = "pl_Human1", ItemId = 59, Amount = 1},
					AvatarHasNotItemMisc	{Player = "pl_Human1", ItemId = 60, Amount = 1},
					AvatarHasNotItemMisc	{Player = "pl_Human1", ItemId = 61, Amount = 1},
				},
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "HighLevelMobs"},
			BuildingDestroy	{Tag = "HighLevelTowers"},
			FigureTeamTransfer	{Tag = "EvilMage", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard41", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard42", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard43", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard44", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard45", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard46", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard47", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard48", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard49", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard50", Team = "tm_Neutral"},
			MapFlagSetTrue	{Name = "mf_LowLevelRewards"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			CoopPlayerIsPlaying	{Player = "pl_Human2"},
			QuestIsNotActive	{Player = "pl_Human2", Quest = "CoopGoldenFieldsCurse"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopGoldenFieldsCurse"},	
			AND
			{
				OR
				{
					AvatarHasNotItemMisc	{Player = "pl_Human2", ItemId = 58, Amount = 1},
					AvatarHasNotItemMisc	{Player = "pl_Human2", ItemId = 59, Amount = 1},
					AvatarHasNotItemMisc	{Player = "pl_Human2", ItemId = 60, Amount = 1},
					AvatarHasNotItemMisc	{Player = "pl_Human2", ItemId = 61, Amount = 1},
				},
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "HighLevelMobs"},
			BuildingDestroy	{Tag = "HighLevelTowers"},
			FigureTeamTransfer	{Tag = "EvilMage", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard41", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard42", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard43", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard44", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard45", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard46", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard47", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard48", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard49", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard50", Team = "tm_Neutral"},
			MapFlagSetTrue	{Name = "mf_LowLevelRewards"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			CoopPlayerIsPlaying	{Player = "pl_Human3"},
			QuestIsNotActive	{Player = "pl_Human3", Quest = "CoopGoldenFieldsCurse"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopGoldenFieldsCurse"},
			AND
			{
				OR
				{
					AvatarHasNotItemMisc	{Player = "pl_Human3", ItemId = 58, Amount = 1},
					AvatarHasNotItemMisc	{Player = "pl_Human3", ItemId = 59, Amount = 1},
					AvatarHasNotItemMisc	{Player = "pl_Human3", ItemId = 60, Amount = 1},
					AvatarHasNotItemMisc	{Player = "pl_Human3", ItemId = 61, Amount = 1},
				},
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "HighLevelMobs"},
			BuildingDestroy	{Tag = "HighLevelTowers"},
			FigureTeamTransfer	{Tag = "EvilMage", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard41", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard42", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard43", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard44", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard45", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard46", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard47", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard48", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard49", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "EvilMageGuard50", Team = "tm_Neutral"},
			MapFlagSetTrue	{Name = "mf_LowLevelRewards"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				AND
				{
					QuestIsActive	{Player = "pl_Human1", Quest = "CoopGoldenFieldsCurse"},
					AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 58, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 59, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 60, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 61, Amount = 1},
				},
				AND
				{
					QuestIsActive	{Player = "pl_Human2", Quest = "CoopGoldenFieldsCurse"},
					AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 58, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 59, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 60, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 61, Amount = 1},
				},
				AND
				{
					QuestIsActive	{Player = "pl_Human3", Quest = "CoopGoldenFieldsCurse"},
					AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 58, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 59, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 60, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 61, Amount = 1},
				},
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "LowLevelMobs"},
			BuildingDestroy	{Tag = "LowLevelTowers"},
			ObjectVanish	{Tag = "ForceField"},
			ObjectVanish	{Tag = "Blockers"},
			ObjectVanish	{Tag = "Blocker1"},
			ObjectVanish	{Tag = "Blocker2"},
			ObjectVanish	{Tag = "Blocker3"},
			ObjectVanish	{Tag = "Blocker4"},
			MapFlagSetTrue	{Name = "mf_CitizensActivate"},
			MapFlagSetTrue	{Name = "mf_HighLevelRewards"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_CitizensActivate"},
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopMapQuestGoldenFields"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopMapQuestGoldenFields"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopMapQuestGoldenFields"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "CitizenMale", Level = 12, UnitId = 247, X = 233, Y = 460, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "CitizenFemale", Level = 12, UnitId = 253, X = 231, Y = 460, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Citizen03", Level = 12, UnitId = 324, X = 235, Y = 460, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Citizen04", Level = 12, UnitId = 256, X = 233, Y = 462, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Citizen05", Level = 12, UnitId = 251, X = 233, Y = 458, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "CitizenFoe01", Level = 17, UnitId = 103, X = 245, Y = 480, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "CitizenFoe02", Level = 14, UnitId = 103, X = 245, Y = 480, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "CitizenFoe03", Level = 14, UnitId = 103, X = 245, Y = 480, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "CitizenFoe04", Level = 14, UnitId = 103, X = 245, Y = 480, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "CitizenFoe05", Level = 16, UnitId = 103, X = 245, Y = 480, Team = "tm_Enemy"},
			FigureOutcry	{Tag = "CitizenMale", TextTag = "Citizen01"},
			FigureOutcry	{Tag = "CitizenFemale", TextTag = "Citizen02"},
			MapFlagSetTrue	{Name = "mf_CitizensAppear"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_CitizensAppear"},
			PlayerIsExisting	{Player = "pl_Human1"},
		},
		Actions = 
		{
			FigureRunToEntity	{Tag = "CitizenMale", TargetTag = "pl_Human1Avatar"},
			FigureRunToEntity	{Tag = "CitizenFemale", TargetTag = "pl_Human1Avatar"},
			FigureForcedRunToEntity	{Tag = "Citizen03", TargetTag = "pl_Human1Avatar"},
			FigureRunToEntity	{Tag = "Citizen04", TargetTag = "pl_Human1Avatar"},
			FigureRunToEntity	{Tag = "Citizen05", TargetTag = "pl_Human1Avatar"},
			MapFlagSetTrue	{Name = "mf_CitizensQuest"},
			FigureOutcry	{Tag = "CitizenFemale", TextTag = "Citizen03"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_CitizensAppear"},
			PlayerIsExisting	{Player = "pl_Human2"},
		},
		Actions = 
		{
			FigureRunToEntity	{Tag = "CitizenMale", TargetTag = "pl_Human2Avatar"},
			FigureRunToEntity	{Tag = "CitizenFemale", TargetTag = "pl_Human2Avatar"},
			FigureForcedRunToEntity	{Tag = "Citizen03", TargetTag = "pl_Human2Avatar"},
			FigureRunToEntity	{Tag = "Citizen04", TargetTag = "pl_Human2Avatar"},
			FigureRunToEntity	{Tag = "Citizen05", TargetTag = "pl_Human2Avatar"},
			MapFlagSetTrue	{Name = "mf_CitizensQuest"},
			FigureOutcry	{Tag = "CitizenFemale", TextTag = "Citizen03"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_CitizensAppear"},
			PlayerIsExisting	{Player = "pl_Human3"},
		},
		Actions = 
		{
			FigureRunToEntity	{Tag = "CitizenMale", TargetTag = "pl_Human3Avatar"},
			FigureRunToEntity	{Tag = "CitizenFemale", TargetTag = "pl_Human3Avatar"},
			FigureForcedRunToEntity	{Tag = "Citizen03", TargetTag = "pl_Human3Avatar"},
			FigureRunToEntity	{Tag = "Citizen04", TargetTag = "pl_Human3Avatar"},
			FigureRunToEntity	{Tag = "Citizen05", TargetTag = "pl_Human3Avatar"},
			MapFlagSetTrue	{Name = "mf_CitizensQuest"},
			FigureOutcry	{Tag = "CitizenFemale", TextTag = "Citizen03"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_CitizensQuest"},
		},
		Actions = 
		{
			QuestSetActive	{Player = "pl_Human1", Quest = "CoopMapQuestGoldenFields"},
			QuestSetActive	{Player = "pl_Human2", Quest = "CoopMapQuestGoldenFields"},
			QuestSetActive	{Player = "pl_Human3", Quest = "CoopMapQuestGoldenFields"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "CitizenFoe01"},
			FigureIsDead	{Tag = "CitizenFoe02"},
			FigureIsDead	{Tag = "CitizenFoe03"},
			FigureIsDead	{Tag = "CitizenFoe04"},
			FigureIsDead	{Tag = "CitizenFoe05"},
			FigureIsAlive	{Tag = "CitizenMale"},
			FigureIsAlive	{Tag = "CitizenFemale"},
			FigureIsAlive	{Tag = "Citizen03"},
			FigureIsAlive	{Tag = "Citizen04"},
			FigureIsAlive	{Tag = "Citizen05"},
			FigureIsNotInCombat	{Tag = "pl_Human1Avatar"},
			FigureIsNotInCombat	{Tag = "pl_Human2Avatar"},
			FigureIsNotInCombat	{Tag = "pl_Human3Avatar"},
			AND
			{
				OR
				{
					QuestIsActive	{Player = "pl_Human1", Quest = "CoopMapQuestGoldenFields"},
					QuestIsActive	{Player = "pl_Human2", Quest = "CoopMapQuestGoldenFields"},
					QuestIsActive	{Player = "pl_Human3", Quest = "CoopMapQuestGoldenFields"},
				},
			},
			AND
			{
				OR
				{
					FigureIsInEntityRange	{Tag = "pl_Human1Avatar", TargetTag = "CitizenFemale", Range = 5},
					FigureIsInEntityRange	{Tag = "pl_Human2Avatar", TargetTag = "CitizenFemale", Range = 5},
					FigureIsInEntityRange	{Tag = "pl_Human3Avatar", TargetTag = "CitizenFemale", Range = 5},
				},
			},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "CitizenFemale", TextTag = "Citizen04"},
			QuestSetSolved	{Player = "pl_Human1", Quest = "CoopMapQuestGoldenFields"},
			QuestSetSolved	{Player = "pl_Human2", Quest = "CoopMapQuestGoldenFields"},
			QuestSetSolved	{Player = "pl_Human3", Quest = "CoopMapQuestGoldenFields"},
			FigureOutcry	{Tag = "CitizenFemale", TextTag = "Citizen05"},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1186, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1186, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1186, Amount = 1},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "EvilMage"},
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopGoldenFieldsCurse"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopGoldenFieldsCurse"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopGoldenFieldsCurse"},
			AND
			{
				OR
				{
					QuestIsActive	{Player = "pl_Human1", Quest = "CoopGoldenFieldsCurse"},
					QuestIsActive	{Player = "pl_Human2", Quest = "CoopGoldenFieldsCurse"},
					QuestIsActive	{Player = "pl_Human3", Quest = "CoopGoldenFieldsCurse"},
				},
			},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_EvilMageIsDead"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_EvilMageIsDead"},
			FigureIsNotInCombat	{Tag = "pl_Human1Avatar"},
			FigureIsNotInCombat	{Tag = "pl_Human2Avatar"},
			FigureIsNotInCombat	{Tag = "pl_Human3Avatar"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "Einar", Level = 22, UnitId = 222, X = 441, Y = 301, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "CommanderA", Level = 22, UnitId = 1047, X = 335, Y = 277, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Soldier01", Level = 21, UnitId = 311, X = 335, Y = 280, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Soldier02", Level = 21, UnitId = 311, X = 336, Y = 280, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Soldier03", Level = 21, UnitId = 311, X = 335, Y = 279, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Soldier04", Level = 21, UnitId = 311, X = 336, Y = 281, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Soldier05", Level = 21, UnitId = 311, X = 335, Y = 281, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "CommanderB", Level = 22, UnitId = 1047, X = 420, Y = 278, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Soldier06", Level = 21, UnitId = 311, X = 420, Y = 280, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Soldier07", Level = 21, UnitId = 311, X = 421, Y = 280, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Soldier08", Level = 21, UnitId = 311, X = 419, Y = 280, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Soldier09", Level = 21, UnitId = 311, X = 420, Y = 281, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Soldier10", Level = 21, UnitId = 311, X = 421, Y = 281, Team = "tm_Human"},
			FigureOutcry	{Tag = "Einar", TextTag = "KingUlf02"},
			MapTimerStart	{Name = "mt_DeadMageTimer"},
			FigureKill	{Tag = "HighLevelMobs"},
			BuildingDestroy	{Tag = "HighLevelTowers"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_NoQuests"},
			AND
			{
				OR
				{
					AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 39, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 39, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 39, Amount = 1},
				},
			},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "Talienne", Level = 22, UnitId = 325, X = 439, Y = 303, Team = "tm_Neutral"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_NoQuests"},
			OR
			{
				AND
				{
					FigureIsInEntityRange	{Tag = "pl_Human1Avatar", TargetTag = "Talienne", Range = 6},
					AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 39, Amount = 1},
				},
				AND
				{
					FigureIsInEntityRange	{Tag = "pl_Human2Avatar", TargetTag = "Talienne", Range = 6},
					AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 39, Amount = 1},
				},
				AND
				{
					FigureIsInEntityRange	{Tag = "pl_Human3Avatar", TargetTag = "Talienne", Range = 6},
					AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 39, Amount = 1},
				},
			},
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = "pl_Human1", ItemId = 365, Amount = 1},
			AvatarItemMiscGive	{Player = "pl_Human2", ItemId = 365, Amount = 1},
			AvatarItemMiscGive	{Player = "pl_Human3", ItemId = 365, Amount = 1},
			AvatarItemMiscTake	{Player = "pl_Human1", ItemId = 39, Amount = 999},
			AvatarItemMiscTake	{Player = "pl_Human2", ItemId = 39, Amount = 999},
			AvatarItemMiscTake	{Player = "pl_Human3", ItemId = 39, Amount = 999},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_NoQuests"},
			OR
			{
				AND
				{
					FigureIsInEntityRange	{Tag = "pl_Human1Avatar", TargetTag = "KingUlf", Range = 5},
					AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 365, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 380, Amount = 1},
				},
				AND
				{
					FigureIsInEntityRange	{Tag = "pl_Human2Avatar", TargetTag = "KingUlf", Range = 5},
					AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 365, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 380, Amount = 1},
				},
				AND
				{
					FigureIsInEntityRange	{Tag = "pl_Human3Avatar", TargetTag = "KingUlf", Range = 5},
					AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 365, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 380, Amount = 1},
				},
			},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "KingUlf", TextTag = "KingUlf03"},
			AvatarItemMiscTake	{Player = "pl_Human1", ItemId = 365, Amount = 1},
			AvatarItemMiscTake	{Player = "pl_Human2", ItemId = 365, Amount = 1},
			AvatarItemMiscTake	{Player = "pl_Human3", ItemId = 365, Amount = 1},
			AvatarItemMiscTake	{Player = "pl_Human1", ItemId = 380, Amount = 1},
			AvatarItemMiscTake	{Player = "pl_Human2", ItemId = 380, Amount = 1},
			AvatarItemMiscTake	{Player = "pl_Human3", ItemId = 380, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1193, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1193, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1193, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 953, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 953, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 953, Amount = 1},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_NoQuests"},
			AND
			{
				OR
				{
					AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 101, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 101, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 101, Amount = 1},
				},
			},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 440, Y = 325, Direction = 0, Tag = "LeverChest"},
			ObjectSpawn	{ObjectId = 14, X = 440, Y = 325, Direction = 0, Tag = "Chest"},
		},
	},
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverChest",
		OnConditions = 
		{
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_ClickedOnChest"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ClickedOnChest"},
		},
		Actions = 
		{
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1208, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1208, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1208, Amount = 1},
			AvatarItemMiscTake	{Player = "pl_Human1", ItemId = 101, Amount = 999},
			AvatarItemMiscTake	{Player = "pl_Human2", ItemId = 101, Amount = 999},
			AvatarItemMiscTake	{Player = "pl_Human3", ItemId = 101, Amount = 999},
			ObjectVanish	{Tag = "LeverChest"},
			ObjectVanish	{Tag = "Chest"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_DeadMageTimer", Seconds = 6},
			PlayerIsExisting	{Player = "pl_Human1"},
		},
		Actions = 
		{
			FigureNpcSpawnToEntity	{Tag = "KingUlf", Level = 10, UnitId = 1064, TargetTag = "pl_Human1Avatar", Team = "tm_Neutral"},
			FigureLookAtEntity	{Tag = "KingUlf", TargetTag = "pl_Human1Avatar"},
			MapTimerStop	{Name = "mt_DeadMageTimer"},
			FigureOutcry	{Tag = "KingUlf", TextTag = "KingUlf01"},
			FigureOutcry	{Tag = "KingUlf", TextTag = "KingUlf03"},
			QuestSetSolved	{Player = "pl_Human1", Quest = "CoopGoldenFieldsCurse"},
			QuestSetSolved	{Player = "pl_Human2", Quest = "CoopGoldenFieldsCurse"},
			QuestSetSolved	{Player = "pl_Human3", Quest = "CoopGoldenFieldsCurse"},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1207, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1207, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1207, Amount = 1},
			QuestSetActive	{Player = "pl_Human1", Quest = "CoopGoldenFieldsCurseRemoved"},
			QuestSetActive	{Player = "pl_Human2", Quest = "CoopGoldenFieldsCurseRemoved"},
			QuestSetActive	{Player = "pl_Human3", Quest = "CoopGoldenFieldsCurseRemoved"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_DeadMageTimer", Seconds = 6},
			PlayerIsExisting	{Player = "pl_Human2"},
		},
		Actions = 
		{
			FigureNpcSpawnToEntity	{Tag = "KingUlf", Level = 10, UnitId = 1064, TargetTag = "pl_Human2Avatar", Team = "tm_Neutral"},
			FigureLookAtEntity	{Tag = "KingUlf", TargetTag = "pl_Human2Avatar"},
			MapTimerStop	{Name = "mt_DeadMageTimer"},
			FigureOutcry	{Tag = "KingUlf", TextTag = "KingUlf01"},
			FigureOutcry	{Tag = "KingUlf", TextTag = "KingUlf03"},
			QuestSetSolved	{Player = "pl_Human1", Quest = "CoopGoldenFieldsCurse"},
			QuestSetSolved	{Player = "pl_Human2", Quest = "CoopGoldenFieldsCurse"},
			QuestSetSolved	{Player = "pl_Human3", Quest = "CoopGoldenFieldsCurse"},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1207, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1207, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1207, Amount = 1},
			QuestSetActive	{Player = "pl_Human1", Quest = "CoopGoldenFieldsCurseRemoved"},
			QuestSetActive	{Player = "pl_Human2", Quest = "CoopGoldenFieldsCurseRemoved"},
			QuestSetActive	{Player = "pl_Human3", Quest = "CoopGoldenFieldsCurseRemoved"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_DeadMageTimer", Seconds = 6},
			PlayerIsExisting	{Player = "pl_Human3"},
		},
		Actions = 
		{
			FigureNpcSpawnToEntity	{Tag = "KingUlf", Level = 10, UnitId = 1064, TargetTag = "pl_Human3Avatar", Team = "tm_Neutral"},
			FigureLookAtEntity	{Tag = "KingUlf", TargetTag = "pl_Human3Avatar"},
			MapTimerStop	{Name = "mt_DeadMageTimer"},
			FigureOutcry	{Tag = "KingUlf", TextTag = "KingUlf01"},
			FigureOutcry	{Tag = "KingUlf", TextTag = "KingUlf03"},
			QuestSetSolved	{Player = "pl_Human1", Quest = "CoopGoldenFieldsCurse"},
			QuestSetSolved	{Player = "pl_Human2", Quest = "CoopGoldenFieldsCurse"},
			QuestSetSolved	{Player = "pl_Human3", Quest = "CoopGoldenFieldsCurse"},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1207, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1207, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1207, Amount = 1},
			QuestSetActive	{Player = "pl_Human1", Quest = "CoopGoldenFieldsCurseRemoved"},
			QuestSetActive	{Player = "pl_Human2", Quest = "CoopGoldenFieldsCurseRemoved"},
			QuestSetActive	{Player = "pl_Human3", Quest = "CoopGoldenFieldsCurseRemoved"},
		},
	},
};