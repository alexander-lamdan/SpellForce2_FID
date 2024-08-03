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
			AvatarHasNotItemMisc	{Player = sPlayerName, ItemId = 61, Amount = 1},
			BuildingIsDead	{Tag = "crystal"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_CrystalIsDead"},
			AvatarItemMiscGive	{Player = sPlayerName, ItemId = 61, Amount = 1},
			AvatarItemMiscGive	{Player = sPlayerName, ItemId = 216, Amount = 1},
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
			MapFlagSetTrue	{Name = "mf_NoMoreCult"},
			BuildingDestroy	{Tag = "crystal"},
			BuildingDestroy	{Tag = "Portal01"},
			FigureVanish	{Tag = "DemonCamp1"},
			BuildingDestroy	{Tag = "Portal2"},
			FigureVanish	{Tag = "DemonCamp2"},
			BuildingDestroy	{Tag = "Portal3"},
			FigureVanish	{Tag = "DemonCamp3"},
			BuildingDestroy	{Tag = "Portal4"},
			FigureVanish	{Tag = "DemonCamp04Enemy01"},
			FigureVanish	{Tag = "DemonCamp04Enemy02"},
			FigureVanish	{Tag = "DemonCamp04Enemy03"},
			FigureVanish	{Tag = "DemonCamp04Enemy04"},
			FigureVanish	{Tag = "DemonCamp04Enemy05"},
			FigureVanish	{Tag = "DemonCamp04Enemy06"},
			FigureVanish	{Tag = "DemonCamp04Enemy07"},
			FigureVanish	{Tag = "DemonCamp04Enemy08"},
			BuildingDestroy	{Tag = "Portal5"},
			FigureVanish	{Tag = "DemonCamp5"},
			FigureVanish	{Tag = "CrystalGuard01"},
			FigureVanish	{Tag = "CrystalGuard02"},
			FigureVanish	{Tag = "CrystalGuard03"},
			FigureVanish	{Tag = "CrystalGuard04"},
			FigureVanish	{Tag = "CrystalGuard05"},
			FigureVanish	{Tag = "CrystalGuard06"},
			FigureVanish	{Tag = "CrystalGuard07"},
			FigureVanish	{Tag = "CrystalGuard08"},
			FigureVanish	{Tag = "CrystalGuard09"},
			FigureVanish	{Tag = "CrystalGuard10"},
			FigureVanish	{Tag = "CrystalGuard11"},
			FigureVanish	{Tag = "CrystalGuard12"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 61, Amount = 1},
				AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 61, Amount = 1},
				AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 61, Amount = 1},
			},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_NoMoreCult"},
			BuildingDestroy	{Tag = "crystal"},
			BuildingDestroy	{Tag = "Portal01"},
			FigureVanish	{Tag = "DemonCamp1"},
			BuildingDestroy	{Tag = "Portal2"},
			FigureVanish	{Tag = "DemonCamp2"},
			BuildingDestroy	{Tag = "Portal3"},
			FigureVanish	{Tag = "DemonCamp3"},
			BuildingDestroy	{Tag = "Portal4"},
			FigureVanish	{Tag = "DemonCamp04Enemy01"},
			FigureVanish	{Tag = "DemonCamp04Enemy02"},
			FigureVanish	{Tag = "DemonCamp04Enemy03"},
			FigureVanish	{Tag = "DemonCamp04Enemy04"},
			FigureVanish	{Tag = "DemonCamp04Enemy05"},
			FigureVanish	{Tag = "DemonCamp04Enemy06"},
			FigureVanish	{Tag = "DemonCamp04Enemy07"},
			FigureVanish	{Tag = "DemonCamp04Enemy08"},
			BuildingDestroy	{Tag = "Portal5"},
			FigureVanish	{Tag = "DemonCamp5"},
			FigureVanish	{Tag = "CrystalGuard01"},
			FigureVanish	{Tag = "CrystalGuard02"},
			FigureVanish	{Tag = "CrystalGuard03"},
			FigureVanish	{Tag = "CrystalGuard04"},
			FigureVanish	{Tag = "CrystalGuard05"},
			FigureVanish	{Tag = "CrystalGuard06"},
			FigureVanish	{Tag = "CrystalGuard07"},
			FigureVanish	{Tag = "CrystalGuard08"},
			FigureVanish	{Tag = "CrystalGuard09"},
			FigureVanish	{Tag = "CrystalGuard10"},
			FigureVanish	{Tag = "CrystalGuard11"},
			FigureVanish	{Tag = "CrystalGuard12"},
		},
	};
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
			MapFlagSetTrue	{Name = "mf_SinistrimSpiders"},
			FigureNpcSpawn	{Tag = "SinistrimSpider01", Level = 26, UnitId = 738, X = 253, Y = 298, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "SinistrimSpider02", Level = 26, UnitId = 471, X = 250, Y = 292, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "SinistrimSpider03", Level = 26, UnitId = 471, X = 261, Y = 310, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "SinistrimSpider04", Level = 26, UnitId = 471, X = 233, Y = 310, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "SinistrimSpider05", Level = 26, UnitId = 471, X = 235, Y = 298, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "SinistrimSpider06", Level = 26, UnitId = 471, X = 261, Y = 310, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "SinistrimSpider07", Level = 26, UnitId = 471, X = 233, Y = 310, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "SinistrimSpider08", Level = 26, UnitId = 471, X = 235, Y = 298, Team = "tm_Enemy"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_SinistrimSpiders"},
			FigureIsDead	{Tag = "SinistrimSpider01"},
			FigureIsDead	{Tag = "SinistrimSpider02"},
			FigureIsDead	{Tag = "SinistrimSpider03"},
			FigureIsDead	{Tag = "SinistrimSpider04"},
			FigureIsDead	{Tag = "SinistrimSpider05"},
			FigureIsDead	{Tag = "SinistrimSpider06"},
			FigureIsDead	{Tag = "SinistrimSpider07"},
			FigureIsDead	{Tag = "SinistrimSpider08"},
		},
		Actions =
		{
			AvatarItemMiscTake	{Player = "pl_Human1", ItemId = 114, Amount = 1},
			AvatarItemMiscTake	{Player = "pl_Human2", ItemId = 114, Amount = 1},
			AvatarItemMiscTake	{Player = "pl_Human3", ItemId = 114, Amount = 1},
			AvatarItemMiscGive	{Player = "pl_Human1", ItemId = 136, Amount = 1},
			AvatarItemMiscGive	{Player = "pl_Human2", ItemId = 136, Amount = 1},
			AvatarItemMiscGive	{Player = "pl_Human3", ItemId = 136, Amount = 1},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			CoopPlayerIsPlaying {Player = "pl_Human1"},
			CoopPlayerIsNotPlaying 	{Player = "pl_Human2"},
			CoopPlayerIsNotPlaying 	{Player = "pl_Human3"},
			BuildingIsDead	{Tag = "crystal"},	
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "Sansha", Level = 26, UnitId = 368, X = 371, Y = 378, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf01", Level = 26, UnitId = 883, X = 373, Y = 380, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf02", Level = 26, UnitId = 883, X = 373, Y = 378, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf03", Level = 26, UnitId = 883, X = 373, Y = 376, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf04", Level = 26, UnitId = 884, X = 371, Y = 374, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf05", Level = 26, UnitId = 883, X = 369, Y = 380, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf06", Level = 26, UnitId = 883, X = 369, Y = 378, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf07", Level = 26, UnitId = 883, X = 369, Y = 376, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf08", Level = 26, UnitId = 884, X = 369, Y = 374, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf09", Level = 26, UnitId = 883, X = 371, Y = 382, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf10", Level = 26, UnitId = 883, X = 373, Y = 382, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf11", Level = 26, UnitId = 883, X = 375, Y = 382, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf12", Level = 26, UnitId = 883, X = 369, Y = 382, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf13", Level = 26, UnitId = 883, X = 367, Y = 382, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf14", Level = 26, UnitId = 883, X = 370, Y = 370, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf15", Level = 26, UnitId = 883, X = 372, Y = 370, Team = "tm_Human"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			CoopPlayerIsNotPlaying 	{Player = "pl_Human1"},
			CoopPlayerIsNotPlaying 	{Player = "pl_Human3"},
			CoopPlayerIsPlaying 	{Player = "pl_Human2"},
			BuildingIsDead	{Tag = "crystal"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "Sansha", Level = 26, UnitId = 368, X = 375, Y = 378, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf01", Level = 26, UnitId = 883, X = 377, Y = 380, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf02", Level = 26, UnitId = 883, X = 377, Y = 378, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf03", Level = 26, UnitId = 883, X = 377, Y = 376, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf04", Level = 26, UnitId = 884, X = 375, Y = 374, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf05", Level = 26, UnitId = 883, X = 373, Y = 380, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf06", Level = 26, UnitId = 883, X = 373, Y = 378, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf07", Level = 26, UnitId = 883, X = 373, Y = 376, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf08", Level = 26, UnitId = 884, X = 373, Y = 374, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf09", Level = 26, UnitId = 883, X = 375, Y = 382, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf10", Level = 26, UnitId = 883, X = 377, Y = 382, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf11", Level = 26, UnitId = 883, X = 379, Y = 382, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf12", Level = 26, UnitId = 883, X = 373, Y = 382, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf13", Level = 26, UnitId = 883, X = 371, Y = 382, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf14", Level = 26, UnitId = 883, X = 374, Y = 370, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf15", Level = 26, UnitId = 883, X = 376, Y = 370, Team = "tm_Human"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			CoopPlayerIsNotPlaying 	{Player = "pl_Human1"},
			CoopPlayerIsNotPlaying 	{Player = "pl_Human2"},
			CoopPlayerIsPlaying 	{Player = "pl_Human3"},
			BuildingIsDead	{Tag = "crystal"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "Sansha", Level = 26, UnitId = 368, X = 375, Y = 378, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf01", Level = 26, UnitId = 883, X = 377, Y = 380, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf02", Level = 26, UnitId = 883, X = 377, Y = 378, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf03", Level = 26, UnitId = 883, X = 377, Y = 376, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf04", Level = 26, UnitId = 884, X = 375, Y = 374, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf05", Level = 26, UnitId = 883, X = 373, Y = 380, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf06", Level = 26, UnitId = 883, X = 373, Y = 378, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf07", Level = 26, UnitId = 883, X = 373, Y = 376, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf08", Level = 26, UnitId = 884, X = 373, Y = 374, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf09", Level = 26, UnitId = 883, X = 375, Y = 382, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf10", Level = 26, UnitId = 883, X = 377, Y = 382, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf11", Level = 26, UnitId = 883, X = 379, Y = 382, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf12", Level = 26, UnitId = 883, X = 373, Y = 382, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf13", Level = 26, UnitId = 883, X = 371, Y = 382, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf14", Level = 26, UnitId = 883, X = 374, Y = 370, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "Elf15", Level = 26, UnitId = 883, X = 376, Y = 370, Team = "tm_Human"},
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
					FigureIsInEntityRange	{Tag = "pl_Human1Avatar", TargetTag = "Sansha", Range = 6},
					FigureIsInEntityRange	{Tag = "pl_Human2Avatar", TargetTag = "Sansha", Range = 6},
					FigureIsInEntityRange	{Tag = "pl_Human3Avatar", TargetTag = "Sansha", Range = 6},
				},
			},
			AND
			{
				OR
				{
					AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 216, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 216, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 216, Amount = 1},
				},
			},	
		},
		Actions =
		{
			AvatarItemMiscTake	{Player = "pl_Human1", ItemId = 216, Amount = 1},
			AvatarItemMiscTake	{Player = "pl_Human2", ItemId = 216, Amount = 1},
			AvatarItemMiscTake	{Player = "pl_Human3", ItemId = 216, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 970, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 970, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 970, Amount = 1},
		},
	},
};