State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		GotoState = "CoopMain",
		Conditions = 
		{
		},
		Actions = 
		{			
		},
	},
}; 

for i = 1, 3 do
	local sPlayerName = "pl_Human" .. i
	
	-- ********************************************************************
	-- solved, wenn die gegner platt sind
	-- ********************************************************************
	OnOneTimeEvent
	{
		EventName = "CrystalDestroyed",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopMagicBarrierCrystals"},
			AvatarHasNotItemMisc	{Player = sPlayerName, ItemId = 58, Amount = 1},
			BuildingIsDead	{Tag = "crystal"},
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = sPlayerName, ItemId = 58, Amount = 1},
			MapFlagSetTrue	{Name = "mf_CrystalIsDead"},
		},
	}

	-- ********************************************************************
	-- solver der gesamtquest, sobald man mind. 4 Bärenmarken besitzt
	-- ********************************************************************
	OnOneTimeEvent
	{
		EventName = "Player"..i.."EnoughHonorMarksCollected",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopMagicBarrierCrystals"},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 58, Amount = 1},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 59, Amount = 1},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 60, Amount = 1},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 61, Amount = 1},
		},
		Actions = 
		{
			QuestSetSolved	{Player = sPlayerName, Quest = "CoopMagicBarrierCrystals"},
			QuestSetActive	{Player = sPlayerName, Quest = "CoopMagicBarrierCrystalsDestroyedEnough"},
		},
	}
end

State
{
	StateName = "CoopMain",
	OnOneTimeEvent
	{
		Conditions = 
		{
				QuestIsNotActive	{Player = "pl_Human1", Quest = "CoopMagicBarrierCrystals"},
				QuestIsNotActive	{Player = "pl_Human2", Quest = "CoopMagicBarrierCrystals"},
				QuestIsNotActive	{Player = "pl_Human3", Quest = "CoopMagicBarrierCrystals"},
		},
		Actions = 
		{
			BuildingDestroy	{Tag = "crystal"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
			AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 58, Amount = 1},
			AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 58, Amount = 1},
			AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 58, Amount = 1},
			},
		},
		Actions = 
		{
			BuildingDestroy	{Tag = "crystal"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 80, Amount = 1},
				AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 80, Amount = 1},
				AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 80, Amount = 1},
			},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 14, X = 176, Y = 545, Direction = 0, Tag = "Chest"},
			FogOfWarReveal	{FogOfWarId = default, X = 176, Y = 545, Range = 7, Height = default},
			FigureNpcSpawn	{Tag = "ChestGuard01", Level = 25, UnitId = 1019, X = 176, Y = 543, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ChestGuard02", Level = 24, UnitId = 688, X = 178, Y = 543, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ChestGuard03", Level = 24, UnitId = 688, X = 174, Y = 543, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ChestGuard04", Level = 24, UnitId = 688, X = 173, Y = 540, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ChestGuard05", Level = 24, UnitId = 687, X = 175, Y = 540, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ChestGuard06", Level = 24, UnitId = 687, X = 177, Y = 540, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ChestGuard07", Level = 24, UnitId = 687, X = 179, Y = 540, Team = "tm_Enemy"},
			MapFlagSetTrue   {Name = "mf_SinistrimReward"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue   {Name = "mf_SinistrimReward"},
			FigureIsDead	{Tag = "ChestGuard01"},
			FigureIsDead	{Tag = "ChestGuard02"},
			FigureIsDead	{Tag = "ChestGuard03"},
			FigureIsDead	{Tag = "ChestGuard04"},
			FigureIsDead	{Tag = "ChestGuard05"},
			FigureIsDead	{Tag = "ChestGuard06"},
			FigureIsDead	{Tag = "ChestGuard07"},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 176, Y = 545, Direction = 0, Tag = "LeverChest"},
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
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1170, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1170, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1170, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1172, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1172, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1172, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1173, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1173, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1173, Amount = 1},
			AvatarItemMiscTake	{Player = "pl_Human1", ItemId = 80, Amount = 999},
			AvatarItemMiscTake	{Player = "pl_Human2", ItemId = 80, Amount = 999},
			AvatarItemMiscTake	{Player = "pl_Human3", ItemId = 80, Amount = 999},
			ObjectVanish	{Tag = "Chest"},
			ObjectVanish	{Tag = "LeverChest"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopMapQuestSteelShore"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopMapQuestSteelShore"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopMapQuestSteelShore"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "Hunter", Level = 24, UnitId = 172, X = 176, Y = 109, Team = "tm_Coop"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_SinistrimLeaves"},
			AND
			{
				AvatarHasNotItemMisc	{Player = "pl_Human1", ItemId = 114, Amount = 1},
				AvatarHasNotItemMisc	{Player = "pl_Human2", ItemId = 114, Amount = 1},
				AvatarHasNotItemMisc	{Player = "pl_Human3", ItemId = 114, Amount = 1},
			},
			AND
			{
				AvatarHasNotItemMisc	{Player = "pl_Human1", ItemId = 136, Amount = 1},
				AvatarHasNotItemMisc	{Player = "pl_Human2", ItemId = 136, Amount = 1},
				AvatarHasNotItemMisc	{Player = "pl_Human3", ItemId = 136, Amount = 1},
			},
			AND
			{
				OR
				{
					FigureIsInEntityRange	{Tag = "pl_Human1Avatar", TargetTag = "Hunter", Range = 7},
					FigureIsInEntityRange	{Tag = "pl_Human2Avatar", TargetTag = "Hunter", Range = 7},
					FigureIsInEntityRange	{Tag = "pl_Human3Avatar", TargetTag = "Hunter", Range = 7},
				},
			},	
		},
		Actions =
		{
			FigureOutcry	{Tag = "Hunter", TextTag = "Hunter1"},
			FigureOutcry	{Tag = "Hunter", TextTag = "Hunter2"},
			FigureOutcry	{Tag = "Hunter", TextTag = "Hunter3"},
			FigureOutcry	{Tag = "Hunter", TextTag = "Hunter4"},
			QuestSetActive	{Player = "pl_Human1", Quest = "CoopMapQuestSteelShore"},
			QuestSetActive	{Player = "pl_Human2", Quest = "CoopMapQuestSteelShore"},
			QuestSetActive	{Player = "pl_Human3", Quest = "CoopMapQuestSteelShore"},
			AvatarItemMiscGive	{Player = "pl_Human1", ItemId = 114, Amount = 1},
			AvatarItemMiscGive	{Player = "pl_Human2", ItemId = 114, Amount = 1},
			AvatarItemMiscGive	{Player = "pl_Human3", ItemId = 114, Amount = 1},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
			AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 136, Amount = 1},
			AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 136, Amount = 1},
			AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 136, Amount = 1},
			},
		},
		Actions =
		{
			QuestSetActive	{Player = "pl_Human1", Quest = "CoopMapQuestSteelShore"},
			QuestSetActive	{Player = "pl_Human2", Quest = "CoopMapQuestSteelShore"},
			QuestSetActive	{Player = "pl_Human3", Quest = "CoopMapQuestSteelShore"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
			AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 114, Amount = 1},
			AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 114, Amount = 1},
			AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 114, Amount = 1},
			},
		},
		Actions = 
		{
			QuestSetActive	{Player = "pl_Human1", Quest = "CoopMapQuestSteelShore"},
			QuestSetActive	{Player = "pl_Human2", Quest = "CoopMapQuestSteelShore"},
			QuestSetActive	{Player = "pl_Human3", Quest = "CoopMapQuestSteelShore"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			AND
			{
				OR
				{
					FigureIsInEntityRange	{Tag = "pl_Human1Avatar", TargetTag = "Hunter", Range = 6},
					FigureIsInEntityRange	{Tag = "pl_Human2Avatar", TargetTag = "Hunter", Range = 6},
					FigureIsInEntityRange	{Tag = "pl_Human3Avatar", TargetTag = "Hunter", Range = 6},
				},
			},
			AND
			{
				OR
				{
					AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 136, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 136, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 136, Amount = 1},
				},
			},	
		},
		Actions =
		{
			FigureOutcry	{Tag = "Hunter", TextTag = "Hunter5"},
			MapFlagSetTrue	{Name = "mf_SinistrimLeaves"},
			AvatarItemMiscTake	{Player = "pl_Human1", ItemId = 136, Amount = 999},
			AvatarItemMiscTake	{Player = "pl_Human2", ItemId = 136, Amount = 999},
			AvatarItemMiscTake	{Player = "pl_Human3", ItemId = 136, Amount = 999},
			AvatarItemMiscGive	{Player = "pl_Human1", ItemId = 80, Amount = 1},
			AvatarItemMiscGive	{Player = "pl_Human2", ItemId = 80, Amount = 1},
			AvatarItemMiscGive	{Player = "pl_Human3", ItemId = 80, Amount = 1},
			MapTimerStart	{Name = "mt_LeaveTimer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_LeaveTimer", Seconds = 8},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Hunter", TextTag = "Hunter6"},
			QuestSetSolved	{Player = "pl_Human1", Quest = "CoopMapQuestSteelShore"},
			QuestSetSolved	{Player = "pl_Human2", Quest = "CoopMapQuestSteelShore"},
			QuestSetSolved	{Player = "pl_Human3", Quest = "CoopMapQuestSteelShore"},
			FigureForcedWalk	{Tag = "Hunter", X = 178, Y = 95},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_LeaveTimer", Seconds = 22},
		},
		Actions =
		{
			FigureVanish	{Tag = "Hunter"},
			MapTimerStop	{Name = "mt_LeaveTimer"}
		},
	},
};