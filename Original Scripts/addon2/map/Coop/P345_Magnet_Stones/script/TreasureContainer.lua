State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotActive 	{Player = "pl_Human1", Quest = "CoopMagnetStonesMap"},
			QuestIsNotActive 	{Player = "pl_Human2", Quest = "CoopMagnetStonesMap"},
			QuestIsNotActive 	{Player = "pl_Human3", Quest = "CoopMagnetStonesMap"},
		},
		Actions =
		{
			ObjectVanish {Tag = "TreasureContainer"},
		},
	},
};