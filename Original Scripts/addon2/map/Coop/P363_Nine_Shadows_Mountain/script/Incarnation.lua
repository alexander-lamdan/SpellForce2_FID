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
					AvatarFlagIsFalse	{Player = "pl_Human1", Name = "af_P363_NineShadowsMountainIncarnationAlreadyKilled"},
					QuestIsActive	{Player = "pl_Human1", Quest = "CoopEvilProphet"},
				},
				AND
				{
					AvatarFlagIsFalse	{Player = "pl_Human2", Name = "af_P363_NineShadowsMountainIncarnationAlreadyKilled"},
					QuestIsActive	{Player = "pl_Human2", Quest = "CoopEvilProphet"},
				},
				AND
				{
					AvatarFlagIsFalse	{Player = "pl_Human3", Name = "af_P363_NineShadowsMountainIncarnationAlreadyKilled"},
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
				AvatarFlagIsTrue	{Player = "pl_Human1", Name = "af_P363_NineShadowsMountainIncarnationAlreadyKilled"},
			},
			OR
			{
				QuestIsNotActive	{Player = "pl_Human2", Quest = "CoopEvilProphet"},
				AvatarFlagIsTrue	{Player = "pl_Human2", Name = "af_P363_NineShadowsMountainIncarnationAlreadyKilled"},
			},
			OR
			{
				QuestIsNotActive	{Player = "pl_Human3", Quest = "CoopEvilProphet"},
				AvatarFlagIsTrue	{Player = "pl_Human3", Name = "af_P363_NineShadowsMountainIncarnationAlreadyKilled"},
			},
		},
		Actions =
		{
			FigureVanish	{Tag = "IncarnationGuards"},
			FigureVanish	{Tag = "Incarnation"},
		},
	},
};
