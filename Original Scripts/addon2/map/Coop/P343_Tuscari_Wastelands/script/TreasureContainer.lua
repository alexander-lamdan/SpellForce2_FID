State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotActive 	{Player = "pl_Human1", Quest = "CoopTuscariMap"},
			QuestIsNotActive 	{Player = "pl_Human2", Quest = "CoopTuscariMap"},
			QuestIsNotActive 	{Player = "pl_Human3", Quest = "CoopTuscariMap"},
		},
		Actions =
		{
			ObjectVanish {Tag = "TreasureContainer"},
		},
	},
};