State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotActive {Player = "pl_Human1", Quest = "CoopJandrimCollectPerfectOre"},
			QuestIsNotActive {Player = "pl_Human2", Quest = "CoopJandrimCollectPerfectOre"},
			QuestIsNotActive {Player = "pl_Human3", Quest = "CoopJandrimCollectPerfectOre"},
		},
		Actions =
		{
			ObjectVanish {Tag = "Ore01"},
			ObjectVanish {Tag = "Ore02"},
		},
	},
};