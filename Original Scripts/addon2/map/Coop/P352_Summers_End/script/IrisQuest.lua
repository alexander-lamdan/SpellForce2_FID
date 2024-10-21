State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		GotoState = "Quest",
		Conditions = 
		{
			OR
			{
				QuestIsActive {Player = "pl_Human1", Quest = "CoopWifeIris"},
				QuestIsActive {Player = "pl_Human2", Quest = "CoopWifeIris"},
				QuestIsActive {Player = "pl_Human3", Quest = "CoopWifeIris"},
			},
		},
		Actions =
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "NoQuest",
		Conditions = 
		{
			QuestIsNotActive {Player = "pl_Human1", Quest = "CoopWifeIris"},
			QuestIsNotActive {Player = "pl_Human2", Quest = "CoopWifeIris"},
			QuestIsNotActive {Player = "pl_Human3", Quest = "CoopWifeIris"},
		},
		Actions =
		{
		},
	},

};
State
{
	StateName = "NoQuest",
	
	OnOneTimeEvent
	{
		GotoState = "Done",
		Conditions =
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "Iris"},
			FigureVanish	{Tag = "IrisCapturers"},
			ObjectVanish	{Tag = "IrisCage"},
		},
	},
};
State
{
	StateName = "Quest",
	
	-- Wo spawned Utrecht
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Player = "pl_Human1", Quest = "CoopWifeIris"},
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag  = "Utrecht", Level = 5, UnitId = 402, TargetTag = "pl_Human1Avatar", Team = "tm_Neutral"},
			MapValueSet				{Name = "mv_UtrechtFollowsPlayer", Value = 1},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotActive 	{Player = "pl_Human1", Quest = "CoopWifeIris"},
			QuestIsActive 		{Player = "pl_Human2", Quest = "CoopWifeIris"},
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Utrecht", Level = 5, UnitId = 402, TargetTag = "pl_Human2Avatar", Team = "tm_Neutral"},
			MapValueSet				{Name = "mv_UtrechtFollowsPlayer", Value = 2},
		},
	},

	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotActive 	{Player = "pl_Human1", Quest = "CoopWifeIris"},
			QuestIsNotActive 	{Player = "pl_Human2", Quest = "CoopWifeIris"},
			QuestIsActive 		{Player = "pl_Human3", Quest = "CoopWifeIris"},
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Utrecht", Level = 5, UnitId = 402, TargetTag = "pl_Human3Avatar", Team = "tm_Neutral"},
			MapValueSet				{Name = "mv_UtrechtFollowsPlayer", Value = 3},
		},
	},

	-- OutcrySequenz
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsGreater	{Name = "mv_UtrechtFollowsPlayer", Value = 0},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Utrecht", TextTag = "Utrecht01"},
			FigureOutcry	{Tag = "Iris", TextTag = "Iris01"},
			FigureOutcry	{Tag = "Utrecht", TextTag = "Utrecht02"},
			FigureLootItemEquipmentAdd	{Tag = "IrisFriendHench02", DropChance = 100, ItemId = 1151},
		},
	},
		     
	
	-- Wem folgt Utrecht
	
	OnFollowEvent
	{
		Tag = "Utrecht",
		TargetTag = "pl_Human1Avatar",
		OnConditions = 
		{
			MapValueIsEqual		{Name = "mv_UtrechtFollowsPlayer", Value = 1},
			FigureIsNotInCombat	{Tag  = "pl_Human1Avatar"},
			MapFlagIsFalse		{Name = "mf_UtrechtAtWife"},
		},
		Actions = 
		{
		},
	},
	OnFollowEvent
	{
		Tag = "Utrecht",
		TargetTag = "pl_Human2Avatar",
		OnConditions = 
		{
			MapValueIsEqual		{Name = "mv_UtrechtFollowsPlayer", Value = 2},
			FigureIsNotInCombat	{Tag  = "pl_Human2Avatar"},
			MapFlagIsFalse		{Name = "mf_UtrechtAtWife"},
		},
		Actions = 
		{
		},
	},
	OnFollowEvent
	{
		Tag = "Utrecht",
		TargetTag = "pl_Human3Avatar",
		OnConditions = 
		{
			MapValueIsEqual		{Name = "mv_UtrechtFollowsPlayer", Value = 3},
			FigureIsNotInCombat	{Tag  = "pl_Human3Avatar"},
			MapFlagIsFalse		{Name = "mf_UtrechtAtWife"},
		},
		Actions = 
		{
		},
	},
		
	-- Banditen tot Käfig verschwindet
	
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "IrisCapturers"},
		},
		Actions =
		{
			ObjectVanish	{Tag = "IrisCage"},		
		}, 
	},
	
	-- Iris frei, Utrecht tod
	
	OnOneTimeEvent
	{
		GotoState = "Done",
		Conditions = 
		{
			FigureIsDead			{Tag = "IrisCapturers"},
			FigureIsDead			{Tag = "Utrecht"},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Iris", TextTag = "Iris06"},
			FigureOutcry	{Tag = "Iris", TextTag = "Iris07"},
		}, 
	},	


	-- Iris frei, Utrecht am leben
	
		
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead			{Tag = "IrisCapturers"},
			FigureIsAlive			{Tag = "Utrecht"},
			FigureIsInEntityRange	{Tag = "Utrecht", TargetTag = "Iris", Range = 20},
		},
		Actions =
		{
			MapFlagSetTrue			{Name = "mf_UtrechtAtWife"},
		}, 
	},	


	-- Utrecht bei Iris
	
	OnOneTimeEvent
	{	Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_UtrechtAtWife"},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "Utrecht", Team = "tm_Neutral"},	
			FigureRunToEntity	{Tag = "Utrecht", TargetTag = "Iris"},
		}, 
	},
	OnOneTimeEvent
	{	GotoState = "Reward",
		Conditions = 
		{
			FigureIsInEntityRange	{Tag = "Utrecht", TargetTag = "Iris", Range  = 2},
		},
		Actions =
		{
			FigureStop			{Tag = "Utrecht"},
			FigureLookAtEntity	{Tag = "Utrecht", TargetTag = "Iris"},
			FigureLookAtEntity	{Tag = "Iris", TargetTag = "Utrecht"},
			
			FigureOutcry	{Tag = "Iris", TextTag = "Iris02"},
			FigureOutcry	{Tag = "Utrecht", TextTag = "Utrecht03"},
	 		FigureOutcry	{Tag = "Iris", TextTag = "Iris03"},
			FigureOutcry	{Tag = "Utrecht", TextTag = "Utrecht04"},
	 		FigureOutcry	{Tag = "Iris", TextTag = "Iris04"},
			FigureOutcry	{Tag = "Utrecht", TextTag = "Utrecht05"},
	 		FigureOutcry	{Tag = "Iris", TextTag = "Iris05"},
		}, 
	},
};
for i = 1, 3 do
	local sPlayerName = "pl_Human" .. i
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopWifeIris"},
		},
		Actions = 
		{
			QuestSetSolved	{Player = sPlayerName, Quest = "CoopWifeIris"},
			QuestSetActive	{Player = sPlayerName, Quest = "CoopWifeIrisRescued"},
		},
	}
end

State
{
	StateName = "Reward",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			MapTimerStart		{Name = "mt_DespawnUtrechtAnsIris"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_DespawnUtrechtAnsIris", Seconds = 90},
		},
		Actions =
		{
			FigureVanish	{Tag = "Utrecht"},
			FigureVanish	{Tag = "Iris"},
		},
	},
};
State
{
	StateName = "Done",
}; 