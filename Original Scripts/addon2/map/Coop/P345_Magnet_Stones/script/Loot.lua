State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P345_OuterBossSpawned"},
			FigureIsDead {Tag = "OuterBoss1"}
		},
		Actions =
		{
			ObjectSpawnToEntity {ObjectId = 1272, TargetTag = "OuterBoss1_Dead", Tag = "LootChest"},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 973},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 993},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 988},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1015},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1005},
		},
	},
}