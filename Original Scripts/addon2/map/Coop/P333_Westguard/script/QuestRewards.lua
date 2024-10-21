State
{
	StateName = "QuestRewards",

	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved		{Quest = "CoopJandrimCollectOreSolved"},
			AvatarFlagIsFalse	{Name = "af_P333_CoopJandrimCollectOreSolved_RewardGiven"},
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Name = "af_P333_CoopJandrimCollectOreSolved_RewardGiven"},
			AvatarSilverGive	{Amount = 50},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved		{Quest = "CoopMissingJandraFound"},
			AvatarFlagIsFalse	{Name = "af_P333_CoopMissingJandraFound_RewardGiven"},
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Name = "af_P333_CoopMissingJandraFound_RewardGiven"},
			AvatarSilverGive	{Amount = 50},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved		{Quest = "CoopWifeIrisRescued"},
			AvatarFlagIsFalse	{Name = "af_P333_CoopWifeIrisRescued_RewardGiven"},
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Name = "af_P333_CoopWifeIrisRescued_RewardGiven"},
			AvatarSilverGive	{Amount = 200},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved		{Quest = "CoopAnkbrandLightFound"},
			AvatarFlagIsFalse	{Name = "af_P333_CoopAnkbrandLightFound_RewardGiven"},
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Name = "af_P333_CoopAnkbrandLightFound_RewardGiven"},
			AvatarItemEquipmentGive	{ItemId = 482, Amount = 1},
			AvatarItemEquipmentGive	{ItemId = 464, Amount = 1},
			AvatarItemEquipmentGive	{ItemId = 456, Amount = 1},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved		{Quest = "CoopHolyShrinesVisited"},
			AvatarFlagIsFalse	{Name = "af_P333_CoopHolyShrinesVisited_RewardGiven"},
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Name = "af_P333_CoopHolyShrinesVisited_RewardGiven"},
			AvatarItemEquipmentGive	{ItemId = 355, Amount = 1},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P333_NightSongJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_NightSong_RewardGiven"},
		},
		Actions = 
		{
			AvatarItemEquipmentGive	{ItemId = 956, Amount = 1},
			AvatarItemEquipmentGive	{ItemId = 957, Amount = 1},
			AvatarFlagSetTrue	{Name = "af_P333_NightSong_RewardGiven"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved		{Quest = "CoopMapQuestShal"},
			QuestIsSolved		{Quest = "CoopMapQuestSongGlass"},
			QuestIsSolved		{Quest = "CoopMapQuestGillyshire"},
			AvatarHasItemMisc	{ItemId = 70, Amount = 3},
			AvatarFlagIsFalse	{Name = "af_P333_StarsReward"},

		},
		Actions = 
		{
			AvatarItemEquipmentGive	{ItemId = 1196, Amount = 1},
			AvatarItemEquipmentGive	{ItemId = 518, Amount = 1},
			AvatarItemEquipmentGive	{ItemId = 516, Amount = 1},
			AvatarItemEquipmentGive	{ItemId = 513, Amount = 1},
			AvatarItemEquipmentGive	{ItemId = 506, Amount = 1},
			AvatarItemMiscTake	{ItemId = 70, Amount = 999},
			AvatarFlagSetTrue	{Name = "af_P333_StarsReward"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved		{Quest = "CoopMapQuestShal"},
			QuestIsSolved		{Quest = "CoopMapQuestSongGlass"},
			QuestIsSolved		{Quest = "CoopMapQuestGillyshire"},
			AvatarHasItemMisc	{ItemId = 70, Amount = 2},
			AvatarFlagIsFalse	{Name = "af_P333_StarsReward"},

		},
		Actions = 
		{
			AvatarItemEquipmentGive	{ItemId = 516, Amount = 1},
			AvatarItemEquipmentGive	{ItemId = 513, Amount = 1},
			AvatarItemEquipmentGive	{ItemId = 506, Amount = 1},
			AvatarItemMiscTake	{ItemId = 70, Amount = 999},
			AvatarFlagSetTrue	{Name = "af_P333_StarsReward"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved		{Quest = "CoopMapQuestShal"},
			QuestIsSolved		{Quest = "CoopMapQuestSongGlass"},
			QuestIsSolved		{Quest = "CoopMapQuestGillyshire"},
			AvatarHasItemMisc	{ItemId = 70, Amount = 1},
			AvatarFlagIsFalse	{Name = "af_P333_StarsReward"},

		},
		Actions = 
		{
			AvatarItemEquipmentGive	{ItemId = 506, Amount = 1},
			AvatarItemMiscTake	{ItemId = 70, Amount = 999},
			AvatarFlagSetTrue	{Name = "af_P333_StarsReward"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved		{Quest = "CoopLiberateAyaSolved"},
			AvatarFlagIsTrue	{Name = "af_P333_AyaRewards"},
			AvatarFlagIsFalse	{Name = "af_P333_AyaRewardGiven"},
		},
		Actions = 
		{
			AvatarItemEquipmentGive	{ItemId = 968, Amount = 1},
			AvatarItemEquipmentGive	{ItemId = 969, Amount = 1},
			AvatarFlagSetTrue	{Name = "af_P333_AyaRewardGiven"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved		{Quest = "CoopDragonHunterFound"},
			AvatarFlagIsFalse	{Name = "af_P333_OdinRewardGiven"},
		},
		Actions = 
		{
			AvatarItemEquipmentGive	{ItemId = 972, Amount = 1},
			AvatarFlagSetTrue	{Name = "af_P333_OdinRewardGiven"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved		{Quest = "CoopWifeIrisRescued"},
			AvatarFlagIsTrue	{Name = "af_P333_IrisRewards"},
			AvatarFlagIsFalse	{Name = "af_P333_IrisRewardGiven"},
		},
		Actions = 
		{
			AvatarItemEquipmentGive	{ItemId = 971, Amount = 1},
			AvatarFlagSetTrue	{Name = "af_P333_IrisRewardGiven"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved		{Quest = "CoopNeedleWatchTowersBuilt"},
			AvatarFlagIsFalse	{Name = "af_P333_CoopNeedleWatchTowersBuilt_RewardGiven"},
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Name = "af_P333_CoopNeedleWatchTowersBuilt_RewardGiven"},
			AvatarSilverGive	{Amount = 500},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved		{Quest = "CoopResourcesGatheredEnough"},
			AvatarFlagIsFalse	{Name = "af_P333_CoopResourcesGatheredEnough_RewardGiven"},
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Name = "af_P333_CoopResourcesGatheredEnough_RewardGiven"},
			AvatarSilverGive	{Amount = 700},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved		{Quest = "CoopShalagathKilled"},
			AvatarFlagIsFalse	{Name = "af_P333_CoopShalagathKilled_RewardGiven"},
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Name = "af_P333_CoopShalagathKilled_RewardGiven"},
			AvatarSilverGive	{Amount = 4000},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved		{Quest = "CoopDragonRunesFound"},
			AvatarFlagIsFalse	{Name = "af_P333_CoopDragonRunesFound_RewardGiven"},
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Name = "af_P333_CoopDragonRunesFound_RewardGiven"},
			AvatarSilverGive	{Amount = 500},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved		{Quest = "CoopMoreDragonRunesFound"},
			AvatarFlagIsFalse	{Name = "af_P333_CoopMoreDragonRunesFound_RewardGiven"},
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Name = "af_P333_CoopMoreDragonRunesFound_RewardGiven"},
			AvatarSilverGive	{Amount = 1000},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved		{Quest = "CoopDragonHunterFound"},
			AvatarFlagIsFalse	{Name = "af_P333_CoopDragonHunterFound_RewardGiven"},
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Name = "af_P333_CoopDragonHunterFound_RewardGiven"},
			AvatarSilverGive	{Amount = 1000},
		},
	};
}
