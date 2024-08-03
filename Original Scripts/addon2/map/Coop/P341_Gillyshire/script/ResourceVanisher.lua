State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotActive {Player = "pl_Human1", Quest = "CoopResources"},
			QuestIsNotActive {Player = "pl_Human2", Quest = "CoopResources"},
			QuestIsNotActive {Player = "pl_Human3", Quest = "CoopResources"},
		},
		Actions =
		{
			FigureVanish {Tag = "Demeter"},
			FigureVanish {Tag = "Knecht2"},
			FigureVanish {Tag = "Knecht1"},
			FigureVanish {Tag = "horse01"},
			FigureVanish {Tag = "horse02"},
			FigureVanish {Tag = "horse03"},
			FigureVanish {Tag = "horse04"},
			FigureVanish {Tag = "horse05"},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "Disabled",
		Conditions = 
		{
			OR
			{
				QuestIsActive {Player = "pl_Human1", Quest = "CoopResources"},
				QuestIsActive {Player = "pl_Human2", Quest = "CoopResources"},
				QuestIsActive {Player = "pl_Human3", Quest = "CoopResources"},
			},
		},
		Actions =
		{
		},
	},
	
};
State
{
	StateName = "Disabled",
};
