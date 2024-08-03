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
			OR
			{
				AND
				{
					QuestIsActive	{Player = "pl_Human1", Quest = "CoopHolyShrines"},
					AvatarFlagIsFalse	{Player = "pl_Human1", Name  = "af_P342_VisitedIcefangsShrine"},
					FigureIsInEntityRange	{Tag 	= "pl_Human1Avatar", TargetTag = "Shrine", Range = 12},
				},
				AND
				{
					QuestIsActive	{Player = "pl_Human2", Quest = "CoopHolyShrines"},
					AvatarFlagIsFalse	{Player = "pl_Human2", Name  = "af_P342_VisitedIcefangsShrine"},
					FigureIsInEntityRange	{Tag 	= "pl_Human2Avatar", TargetTag = "Shrine", Range = 12},
				},
				AND
				{
					QuestIsActive	{Player = "pl_Human3", Quest = "CoopHolyShrines"},
					AvatarFlagIsFalse	{Player = "pl_Human3", Name  = "af_P342_VisitedIcefangsShrine"},
					FigureIsInEntityRange	{Tag 	= "pl_Human3Avatar", TargetTag = "Shrine", Range = 12},
				},
			},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_FoundIceShrine"},
			FigureOutcry	{Tag = "Shrine", TextTag = "Shrine01"},
			FigureOutcry	{Tag = "Shrine", TextTag = "Shrine02"},
		},
	},
};
