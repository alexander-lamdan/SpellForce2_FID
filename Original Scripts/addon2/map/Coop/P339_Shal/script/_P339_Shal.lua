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
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_AtyoLeft"},
			AvatarHasNotLevel	{Player = sPlayer, Level = 14},
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
end

State
{
	StateName = "MAIN",

	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotSolved {Player = "pl_Human1", Quest = "CoopMapQuestShal"},
			QuestIsNotSolved {Player = "pl_Human2", Quest = "CoopMapQuestShal"},
			QuestIsNotSolved {Player = "pl_Human3", Quest = "CoopMapQuestShal"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "Atyo", Level = 7, UnitId = 1128, X = 28, Y = 35, Team = "tm_Human"},
			MapFlagSetTrue	{Name = "mf_AtyoAppears"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			CoopPlayerIsPlaying {Player = "pl_Human1"},
			MapFlagIsTrue	{Name = "mf_AtyoAppears"},
		},
		Actions =
		{
			FigureRunToEntity	{Tag = "Atyo", TargetTag = "pl_Human1Avatar"},
			FigureOutcry	{Tag = "Atyo", TextTag = "Atyo01"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			CoopPlayerIsNotPlaying 	{Player = "pl_Human1"},
			CoopPlayerIsPlaying 	{Player = "pl_Human2"},
			MapFlagIsTrue	{Name = "mf_AtyoAppears"},
		},
		Actions =
		{
			FigureRunToEntity	{Tag = "Atyo", TargetTag = "pl_Human2Avatar"},
			FigureOutcry	{Tag = "Atyo", TextTag = "Atyo01"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			CoopPlayerIsNotPlaying 	{Player = "pl_Human1"},
			CoopPlayerIsNotPlaying 	{Player = "pl_Human2"},
			CoopPlayerIsPlaying 	{Player = "pl_Human3"},
			MapFlagIsTrue	{Name = "mf_AtyoAppears"},
		},
		Actions =
		{
			FigureRunToEntity	{Tag = "Atyo", TargetTag = "pl_Human3Avatar"},
			FigureOutcry	{Tag = "Atyo", TextTag = "Atyo01"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				FigureIsInEntityRange	{Tag = "Atyo", TargetTag = "pl_Human1Avatar", Range = 6},
				FigureIsInEntityRange	{Tag = "Atyo", TargetTag = "pl_Human2Avatar", Range = 6},
				FigureIsInEntityRange	{Tag = "Atyo", TargetTag = "pl_Human3Avatar", Range = 6},
			},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Atyo", TextTag = "Atyo02"},
			FigureOutcry	{Tag = "Atyo", TextTag = "Atyo03"},
			FigureOutcry	{Tag = "Atyo", TextTag = "Atyo04"},
			FigureOutcry	{Tag = "Atyo", TextTag = "Atyo05"},
			QuestSetActive	{Player = "pl_Human1", Quest = "CoopMapQuestShal"},
			QuestSetActive	{Player = "pl_Human2", Quest = "CoopMapQuestShal"},
			QuestSetActive	{Player = "pl_Human3", Quest = "CoopMapQuestShal"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Player = "pl_Human1", Quest = "CoopMapQuestShal"},
			MapFlagIsFalse	{Name = "mf_FollowPlayer2"},
			MapFlagIsFalse	{Name = "mf_FollowPlayer3"},
		},
		Actions = 
		{
			MapFlagSetTrue   {Name = "mf_FollowPlayer1"},
			FigureFollowEntity	{Tag = "Atyo", TargetTag = "pl_Human1Avatar"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Player = "pl_Human2", Quest = "CoopMapQuestShal"},
			MapFlagIsFalse	{Name = "mf_FollowPlayer1"},
			MapFlagIsFalse	{Name = "mf_FollowPlayer3"},
		},
		Actions = 
		{
			MapFlagSetTrue   {Name = "mf_FollowPlayer2"},
			FigureFollowEntity	{Tag = "Atyo", TargetTag = "pl_Human2Avatar"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Player = "pl_Human3", Quest = "CoopMapQuestShal"},
			MapFlagIsFalse	{Name = "mf_FollowPlayer1"},
			MapFlagIsFalse	{Name = "mf_FollowPlayer2"},
		},
		Actions = 
		{
			MapFlagSetTrue   {Name = "mf_FollowPlayer3"},
			FigureFollowEntity	{Tag = "Atyo", TargetTag = "pl_Human3Avatar"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				MapFlagIsTrue    {Name = "mf_FollowPlayer1"},
				MapFlagIsTrue    {Name = "mf_FollowPlayer2"},
				MapFlagIsTrue    {Name = "mf_FollowPlayer3"},
			},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "Baran", Level = 7, UnitId = 1125, X = 273, Y = 315, Team = "tm_Neutral"},

			FigureNpcSpawn	{Tag = "BaranGuard01", Level = 8, UnitId = 911, X = 273, Y = 301, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "BaranGuard02", Level = 7, UnitId = 911, X = 273, Y = 301, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "BaranGuard03", Level = 7, UnitId = 911, X = 273, Y = 301, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "BaranGuard04", Level = 7, UnitId = 911, X = 273, Y = 301, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "BaranGuard05", Level = 7, UnitId = 911, X = 273, Y = 301, Team = "tm_Enemy"},
			FogOfWarReveal	{FogOfWarId = default, X = 273, Y = 315, Range = 7, Height = default},
			MapFlagSetTrue	{Name = "mf_GuardsRevealed"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_GuardsRevealed"},
			FigureIsInEntityRange	{Tag = "Atyo", TargetTag = "Baran", Range = 10},
			FigureIsAlive	{Tag = "Atyo"},
			FigureIsAlive	{Tag = "Baran"},
			FigureIsDead	{Tag = "BaranGuard01"},
			FigureIsDead	{Tag = "BaranGuard02"},
			FigureIsDead	{Tag = "BaranGuard03"},
			FigureIsDead	{Tag = "BaranGuard04"},
			FigureIsDead	{Tag = "BaranGuard05"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_GuardsAreDead"},
			FigureOutcry	{Tag = "Atyo", TextTag = "Atyo06"},
			FigureOutcry	{Tag = "Atyo", TextTag = "Atyo07"},
		},
	},
	
	-- ********************************************************************
	-- solver der gesamtquest, sobald man mind. 20 Händler befreit hat
	-- ********************************************************************
	OnOneTimeEvent
	{

		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_GuardsAreDead"},
		},
		Actions =
		{
	 		FigureTeamTransfer	{Tag  = "Atyo", Team = "tm_Neutral"},
			MapFlagSetTrue	{Name = "mf_BaranFree"},
			QuestSetSolved {Player = "pl_Human1", Quest = "CoopMapQuestShal"},
			QuestSetSolved {Player = "pl_Human2", Quest = "CoopMapQuestShal"},
			QuestSetSolved {Player = "pl_Human3", Quest = "CoopMapQuestShal"},
		},
	},
	OnOneTimeEvent
	{

		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_BaranFree"},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Atyo", TextTag = "Atyo08"},
			FigureOutcry	{Tag = "Atyo", TextTag = "Atyo09"},
			MapFlagSetTrue	{Name = "mf_AtyoReward"},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 817, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 817, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 817, Amount = 1},
			FigureRunToEntity	{Tag = "Atyo", TargetTag = "MerchantSafePoint"},
			FigureRunToEntity	{Tag = "Baran", TargetTag = "MerchantSafePoint"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "Atyo", TargetTag = "MerchantSafePoint", Range = 10},
			MapFlagIsTrue	{Name = "mf_AtyoReward"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_AtyoLeft"},
			FigureVanish	{Tag = "Atyo"},
			FigureVanish	{Tag = "Baran"},
		},
	},
};
