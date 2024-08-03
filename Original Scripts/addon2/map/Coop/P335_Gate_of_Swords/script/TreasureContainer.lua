State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotActive 	{Player = "pl_Human1", Quest = "CoopGateOfSwordsMap"},
			QuestIsNotActive 	{Player = "pl_Human2", Quest = "CoopGateOfSwordsMap"},
			QuestIsNotActive 	{Player = "pl_Human3", Quest = "CoopGateOfSwordsMap"},
		},
		Actions =
		{
			ObjectVanish {Tag = "TreasureContainer"},
			
			FigureVanish {Tag = "TreasureGuard01"},
			FigureVanish {Tag = "TreasureGuard02"},
			FigureVanish {Tag = "TreasureGuard03"},
			FigureVanish {Tag = "TreasureGuard04"},
			FigureVanish {Tag = "TreasureGuard05"},
			FigureVanish {Tag = "TreasureGuard06"},
			FigureVanish {Tag = "TreasureGuard07"},

		},
	},
};