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
			AvatarHasNotItemMisc	{Player = sPlayerName, ItemId = 59, Amount = 1},
			BuildingIsDead	{Tag = "crystal"},
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = sPlayerName, ItemId = 59, Amount = 1},
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
			QuestIsActive	   {Player = sPlayerName, Quest = "CoopMagicBarrierCrystals"},
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
			AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 59, Amount = 1},
			AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 59, Amount = 1},
			AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 59, Amount = 1},
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
			MapFlagIsTrue	{Name = "mf_ClanMainCampDefeated"},
			AND
			{
				OR
				{
					AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 100, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 100, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 100, Amount = 1},
				},
			},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 14, X = 287, Y = 555, Direction = 0, Tag = "Chest"},
			FigureNpcSpawn	{Tag = "ChestGuard", Level = 24, UnitId = 1019, X = 287, Y = 555, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ChestGuard", Level = 22, UnitId = 688, X = 289, Y = 555, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ChestGuard", Level = 22, UnitId = 688, X = 289, Y = 556, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ChestGuard", Level = 22, UnitId = 687, X = 289, Y = 555, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "ChestGuard", Level = 22, UnitId = 687, X = 289, Y = 554, Team = "tm_Enemy"},
			MapFlagSetTrue   {Name = "mf_TwoStarsReward"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue   {Name = "mf_TwoStarsReward"},
			FigureIsDead	{Tag = "boss"},
			FigureIsDead	{Tag = "BossGuard1"},
			FigureIsDead	{Tag = "BossGuard2"},
			FigureIsDead	{Tag = "BossGuard3"},
			FigureIsDead	{Tag = "BossGuard4"},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 287, Y = 555, Direction = 0, Tag = "LeverChest"},
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
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1219, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1219, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1219, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 965, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 965, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 965, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1160, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1160, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1160, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1221, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1221, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1221, Amount = 1},
			AvatarItemMiscTake	{Player = "pl_Human1", ItemId = 100, Amount = 999},
			AvatarItemMiscTake	{Player = "pl_Human2", ItemId = 100, Amount = 999},
			AvatarItemMiscTake	{Player = "pl_Human3", ItemId = 100, Amount = 999},
			ObjectVanish	{Tag = "LeverChest"},
		},
	},
};