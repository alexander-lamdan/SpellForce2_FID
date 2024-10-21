State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotActive 	{Player = "pl_Human1", Quest = "CoopUnderhallMap"},
			QuestIsNotActive 	{Player = "pl_Human2", Quest = "CoopUnderhallMap"},
			QuestIsNotActive 	{Player = "pl_Human3", Quest = "CoopUnderhallMap"},
		},
		Actions =
		{
			ObjectVanish {Tag = "TreasureContainer"},
		},
	},
};