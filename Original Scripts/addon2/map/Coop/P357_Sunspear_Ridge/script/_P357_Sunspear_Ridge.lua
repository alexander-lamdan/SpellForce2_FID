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
			AvatarHasNotItemMisc	{Player = sPlayerName, ItemId = 60, Amount = 1},
			BuildingIsDead	{Tag = "crystal"},
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = sPlayerName, ItemId = 60, Amount = 1},
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
			AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 60, Amount = 1},
			AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 60, Amount = 1},
			AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 60, Amount = 1},
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
				AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 103, Amount = 1},
				AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 103, Amount = 1},
				AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 103, Amount = 1},
			},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 14, X = 492, Y = 611, Direction = 0, Tag = "Chest"},
			ObjectSpawn	{ObjectId = 1677, X = 492, Y = 611, Direction = 0, Tag = "LeverChest"},
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
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1121, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1121, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1121, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1122, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1122, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1122, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1123, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1123, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1123, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1124, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1124, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1124, Amount = 1},
			AvatarItemMiscGive	{Player = "pl_Human1", ItemId = 380, Amount = 1},
			AvatarItemMiscGive	{Player = "pl_Human2", ItemId = 380, Amount = 1},
			AvatarItemMiscGive	{Player = "pl_Human3", ItemId = 380, Amount = 1},
			AvatarItemMiscTake	{Player = "pl_Human1", ItemId = 103, Amount = 999},
			AvatarItemMiscTake	{Player = "pl_Human2", ItemId = 103, Amount = 999},
			AvatarItemMiscTake	{Player = "pl_Human3", ItemId = 103, Amount = 999},
			ObjectVanish	{Tag = "LeverChest"},
			ObjectVanish	{Tag = "Chest"},
		},
	},
};