for i = 1, 3 do
	local sPlayerName = "pl_Human" .. i
	
	-- ********************************************************************
	-- solved, wenn die gegner platt sind
	-- ********************************************************************
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopMissingJandra"},
			OR
			{
				FigureIsInEntityRange {Tag = "pl_Human1Avatar", TargetTag = "Ische", Range = 10},
				FigureIsInEntityRange {Tag = "pl_Human2Avatar", TargetTag = "Ische", Range = 10},
				FigureIsInEntityRange {Tag = "pl_Human3Avatar", TargetTag = "Ische", Range = 10},
			},
		},
		Actions = 
		{
			QuestSetSolved		{Player = sPlayerName, Quest = "CoopMissingJandra"},
			QuestSetActive		{Player = sPlayerName, Quest = "CoopMissingJandraFound"},
			AvatarItemMiscGive	{Player = sPlayerName, ItemId = 266, Amount = 1},
			MapFlagSetTrue		{Name   = "mf_FoundJandra"},
		},
	}
end

State
{
	StateName = "SideQuest",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotActive {Quest = "CoopMissingJandra", Player = "pl_Human1"},
			QuestIsNotActive {Quest = "CoopMissingJandra", Player = "pl_Human2"},
			QuestIsNotActive {Quest = "CoopMissingJandra", Player = "pl_Human3"},
		},
		Actions = 
		{
			FigureVanish	{Tag = "JandraSkeletons"},
		},
	},
	
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions =
		{
			OR
			{
				QuestIsActive {Quest = "CoopMissingJandra", Player = "pl_Human1"},
				QuestIsActive {Quest = "CoopMissingJandra", Player = "pl_Human2"},
				QuestIsActive {Quest = "CoopMissingJandra", Player = "pl_Human3"},
			},
		},
		Actions = 
		{
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "CoopMissingJandraFound", Player = "pl_Human1"},
			MapFlagIsTrue	{Name   = "mf_FoundJandra"},
		},
		Actions = 
		{
			FigureOutcry 	{Tag = "Ische", TextTag = "JandraQuest01"},
			FigureOutcry 	{Tag = "pl_Human1Avatar", TextTag = "JandraQuest02"},
			FigureOutcry 	{Tag = "pl_Human1Avatar", TextTag = "JandraQuest03"},
			FigureOutcry 	{Tag = "Ische", TextTag = "JandraQuest04"},
			FigureOutcry 	{Tag = "Ische", TextTag = "JandraQuest05"},
			FigureOutcry 	{Tag = "Ische", TextTag = "JandraQuest06"},
			FigureOutcry 	{Tag = "Ische", TextTag = "JandraQuest07"},
			
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotActive {Quest = "CoopMissingJandraFound", Player = "pl_Human1"},
			QuestIsActive 	 {Quest = "CoopMissingJandraFound", Player = "pl_Human2"},
			MapFlagIsTrue 	 {Name   = "mf_FoundJandra"},
		},
		Actions = 
		{
			FigureOutcry 	{Tag = "Ische", TextTag = "JandraQuest01"},
			FigureOutcry 	{Tag = "pl_Human2Avatar", TextTag = "JandraQuest02"},
			FigureOutcry 	{Tag = "pl_Human2Avatar", TextTag = "JandraQuest03"},
			FigureOutcry 	{Tag = "Ische", TextTag = "JandraQuest04"},
			FigureOutcry 	{Tag = "Ische", TextTag = "JandraQuest05"},
			FigureOutcry 	{Tag = "Ische", TextTag = "JandraQuest06"},
			FigureOutcry 	{Tag = "Ische", TextTag = "JandraQuest07"},
			
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotActive {Quest = "CoopMissingJandraFound", Player = "pl_Human1"},
			QuestIsNotActive {Quest = "CoopMissingJandraFound", Player = "pl_Human2"},
			QuestIsActive 	 {Quest = "CoopMissingJandraFound", Player = "pl_Human3"},
			MapFlagIsTrue 	 {Name   = "mf_FoundJandra"},
		},
		Actions = 
		{
			FigureOutcry 	{Tag = "Ische", TextTag = "JandraQuest01"},
			FigureOutcry 	{Tag = "pl_Human3Avatar", TextTag = "JandraQuest02"},
			FigureOutcry 	{Tag = "pl_Human3Avatar", TextTag = "JandraQuest03"},
			FigureOutcry 	{Tag = "Ische", TextTag = "JandraQuest04"},
			FigureOutcry 	{Tag = "Ische", TextTag = "JandraQuest05"},
			FigureOutcry 	{Tag = "Ische", TextTag = "JandraQuest06"},
			FigureOutcry 	{Tag = "Ische", TextTag = "JandraQuest07"},
			
		},
	},
	
	
};

