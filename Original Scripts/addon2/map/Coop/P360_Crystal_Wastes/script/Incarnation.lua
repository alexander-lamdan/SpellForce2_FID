State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				AND
				{
					PlayerIsExisting	{Player = "pl_Human1"},
					AvatarFlagIsFalse	{Player = "pl_Human1", Name = "af_P360_CrystalWastesIncarnationAlreadyKilled"},
					QuestIsActive	{Player = "pl_Human1", Quest = "CoopEvilProphet"},
				},
				AND
				{
					PlayerIsExisting	{Player = "pl_Human2"},
					AvatarFlagIsFalse	{Player = "pl_Human2", Name = "af_P360_CrystalWastesIncarnationAlreadyKilled"},
					QuestIsActive	{Player = "pl_Human2", Quest = "CoopEvilProphet"},
				},
				AND
				{
					PlayerIsExisting	{Player = "pl_Human3"},
					AvatarFlagIsFalse	{Player = "pl_Human3", Name = "af_P360_CrystalWastesIncarnationAlreadyKilled"},
					QuestIsActive	{Player = "pl_Human3", Quest = "CoopEvilProphet"},
				},
			},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_IncarnationHasSpawned"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				QuestIsNotActive	{Player = "pl_Human1", Quest = "CoopEvilProphet"},
				AvatarFlagIsTrue	{Player = "pl_Human1", Name = "af_P360_CrystalWastesIncarnationAlreadyKilled"},
			},
			OR
			{
				QuestIsNotActive	{Player = "pl_Human2", Quest = "CoopEvilProphet"},
				AvatarFlagIsTrue	{Player = "pl_Human2", Name = "af_P360_CrystalWastesIncarnationAlreadyKilled"},
			},
			OR
			{
				QuestIsNotActive	{Player = "pl_Human3", Quest = "CoopEvilProphet"},
				AvatarFlagIsTrue	{Player = "pl_Human3", Name = "af_P360_CrystalWastesIncarnationAlreadyKilled"},
			},
		},
		Actions =
		{
			FigureVanish	{Tag = "IncarnationGuards"},
			FigureVanish	{Tag = "Incarnation"},
		},
	},
};
