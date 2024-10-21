State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotActive {Player = "pl_Human1", Quest = "CoopJandrimCollectOre"},
			QuestIsNotActive {Player = "pl_Human2", Quest = "CoopJandrimCollectOre"},
			QuestIsNotActive {Player = "pl_Human3", Quest = "CoopJandrimCollectOre"},
		},
		Actions =
		{
			ObjectVanish {Tag = "Ore01"},
			ObjectVanish {Tag = "Ore02"},
			ObjectVanish {Tag = "Ore03"},
			ObjectVanish {Tag = "Ore04"},
		},
	},
};