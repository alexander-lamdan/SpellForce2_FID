State
{
	StateName = "WaitForAvatar",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			OR
			{
			QuestIsActive	{Player = "pl_Human1", Quest = "CoopFreeMerchants"},
			QuestIsActive	{Player = "pl_Human2", Quest = "CoopFreeMerchants"},
			QuestIsActive	{Player = "pl_Human3", Quest = "CoopFreeMerchants"},
			},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_ChangeState"},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "Flee",
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_ChangeState"},
		},
		Actions =
		{
		},
	},
};

OnOneTimeEvent
{
	Conditions = 
	{
		OR
		{
		QuestIsSolved	{Player = "pl_Human1", Quest = "CoopFreeMerchants"},
		QuestIsSolved	{Player = "pl_Human2", Quest = "CoopFreeMerchants"},
		QuestIsSolved	{Player = "pl_Human3", Quest = "CoopFreeMerchants"},
		},
	},
	Actions = 
	{
		FigureVanish	{Tag = "default"},
	},
}

-- ********************************************************************
-- running to safepoint
-- ********************************************************************
OnOneTimeEvent
{
	Conditions = 
	{
		QuestIsActive	{Player = "pl_Human1", Quest = "CoopFreeMerchants"},
		FigureIsInEntityRange	{Tag    = "default", TargetTag = "pl_Human1Avatar", Range = 7},
		EntityFlagIsFalse		{Name   = "ef_FollowPlayerTwo"},
		EntityFlagIsFalse		{Name   = "ef_FollowPlayerThree"},
		FigureIsNotInCombat     {Tag    = "pl_Human1Avatar"},
	},
	Actions = 
	{
		FigureOutcry	    {Tag  = "pl_Human1Avatar", TextTag = "Avatar01"},
	 	FigureTeamTransfer	{Tag  = "default", Team = "tm_Human"},
		EntityFlagSetTrue   {Name = "ef_FollowPlayerOne"},
	},
}
OnFollowEvent
{
	Tag = "default",
	TargetTag = "pl_Human1Avatar",
	OnConditions = 
	{
		EntityFlagIsTrue    {Name = "ef_FollowPlayerOne"},
		FigureIsNotInCombat {Tag  = "pl_Human1Avatar"},
		FigureIsNotInEntityRange	{Tag = "default", TargetTag = "MerchantSafePoint", Range = 25},
	},
	Actions =
	{
	},
}

OnOneTimeEvent
{
	Conditions = 
	{
		QuestIsActive			{Player = "pl_Human2", Quest = "CoopFreeMerchants"},
		FigureIsInEntityRange	{Tag    = "default", TargetTag = "pl_Human2Avatar", Range = 7},
		EntityFlagIsFalse		{Name   = "ef_FollowPlayerOne"},
		EntityFlagIsFalse		{Name   = "ef_FollowPlayerThree"},
		FigureIsNotInCombat     {Tag    = "pl_Human2Avatar"},
	},
	Actions = 
	{
		FigureOutcry	    {Tag  = "pl_Human2Avatar", TextTag = "Avatar01"},
	 	FigureTeamTransfer	{Tag  = "default", Team = "tm_Human"},
		EntityFlagSetTrue   {Name = "ef_FollowPlayerTwo"},
	},
}
OnFollowEvent
{
	Tag = "default",
	TargetTag = "pl_Human2Avatar",
	OnConditions = 
	{
		EntityFlagIsTrue    {Name = "ef_FollowPlayerTwo"},
		FigureIsNotInCombat {Tag  = "pl_Human2Avatar"},
		FigureIsNotInEntityRange	{Tag = "default", TargetTag = "MerchantSafePoint", Range = 25},
	},
	Actions =
	{
	},
}

OnOneTimeEvent
{
	Conditions = 
	{
		QuestIsActive			{Player = "pl_Human3", Quest = "CoopFreeMerchants"},
		FigureIsInEntityRange	{Tag    = "default", TargetTag = "pl_Human3Avatar", Range = 7},
		EntityFlagIsFalse		{Name   = "ef_FollowPlayerOne"},
		EntityFlagIsFalse		{Name   = "ef_FollowPlayerTwo"},
		FigureIsNotInCombat     {Tag    = "pl_Human3Avatar"},
	},
	Actions = 
	{
		FigureOutcry	    {Tag  = "pl_Human3Avatar", TextTag = "Avatar01"},
	 	FigureTeamTransfer	{Tag  = "default", Team = "tm_Human"},
		EntityFlagSetTrue   {Name = "ef_FollowPlayerThree"},
	},
}
OnFollowEvent
{
	Tag = "default",
	TargetTag = "pl_Human3Avatar",
	OnConditions = 
	{
		EntityFlagIsTrue    {Name = "ef_FollowPlayerThree"},
		FigureIsNotInCombat {Tag  = "pl_Human3Avatar"},
		FigureIsNotInEntityRange	{Tag = "default", TargetTag = "MerchantSafePoint", Range = 25},
	},
	Actions =
	{
	},
}

OnOneTimeEvent
{
	EventName  = "MerchantInPortalRange",
	Conditions = 
	{
		FigureIsInEntityRange	{Tag = "default", TargetTag = "MerchantSafePoint", Range = 25},
	},
	Actions = 
	{
		FigureForcedRunToEntity	{Tag = "default", TargetTag = "MerchantSafePoint"},
	},
}
OnOneTimeEvent
{
	EventName = "MerchantReachedSafePoint",
	Conditions = 
	{
		FigureIsInEntityRange	{Tag = "default", TargetTag = "MerchantSafePoint", Range = 3},
	},
	Actions = 
	{
		EntityFlagSetTrue	{Name = "ef_MerchantLiberated"},
		EntityTimerStart	{Name = "et_MerchantWaitForDespawn"},
	},
}
OnOneTimeEvent
{
	EventName = "MerchantReachedSafePointDelayedVanish",
	Conditions = 
	{
		EntityTimerIsElapsed	{Name = "et_MerchantWaitForDespawn", Seconds = 0.1},
	},
	Actions = 
	{
		AvatarItemMiscGive	{Player = "pl_Human1", ItemId = 75, Amount = 1},
		AvatarItemMiscGive	{Player = "pl_Human2", ItemId = 75, Amount = 1},
		AvatarItemMiscGive	{Player = "pl_Human3", ItemId = 75, Amount = 1},
		AvatarXPGive	{Player = "pl_Human1", Amount = 20},
		AvatarXPGive	{Player = "pl_Human2", Amount = 20},
		AvatarXPGive	{Player = "pl_Human3", Amount = 20},
		FigureVanish	{Tag = "default"},
	},
}

for i = 1, 3 do
	local sPlayer = "pl_Human" .. i
	
	OnOneTimeEvent
	{
		EventName = "MerchantReachedSafePoint",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayer, Quest = "CoopFreeMerchants"},
			EntityFlagIsTrue	{Name = "ef_MerchantLiberated"},
		},
		Actions = 
		{
			PlayerNPCKillCountIncrease	{Player = sPlayer, UnitId = 723},
		},
	}
end

State
{
	StateName = "Flee",
};