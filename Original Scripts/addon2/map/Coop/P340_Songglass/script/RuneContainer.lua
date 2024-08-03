State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotActive {Player = "pl_Human1", Quest = "CoopDragonRunes"},
			QuestIsNotActive {Player = "pl_Human2", Quest = "CoopDragonRunes"},
			QuestIsNotActive {Player = "pl_Human3", Quest = "CoopDragonRunes"},
		},
		Actions =
		{
			ObjectVanish {},
		},
	},
};