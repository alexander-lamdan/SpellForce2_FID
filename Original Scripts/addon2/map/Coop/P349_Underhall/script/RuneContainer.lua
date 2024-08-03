State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotActive {Player = "pl_Human1", Quest = "CoopMoreDragonRunes"},
			QuestIsNotActive {Player = "pl_Human2", Quest = "CoopMoreDragonRunes"},
			QuestIsNotActive {Player = "pl_Human3", Quest = "CoopMoreDragonRunes"},
		},
		Actions =
		{
			ObjectVanish {},
		},
	},
};