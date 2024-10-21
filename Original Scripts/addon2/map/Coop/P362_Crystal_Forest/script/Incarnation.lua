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
					AvatarFlagIsFalse	{Player = "pl_Human1", Name = "af_P362_CrystalForestIncarnationAlreadyKilled"},
					QuestIsActive	{Player = "pl_Human1", Quest = "CoopEvilProphet"},
				},
				AND
				{
					AvatarFlagIsFalse	{Player = "pl_Human2", Name = "af_P362_CrystalForestIncarnationAlreadyKilled"},
					QuestIsActive	{Player = "pl_Human2", Quest = "CoopEvilProphet"},
				},
				AND
				{
					AvatarFlagIsFalse	{Player = "pl_Human3", Name = "af_P362_CrystalForestIncarnationAlreadyKilled"},
					QuestIsActive	{Player = "pl_Human3", Quest = "CoopEvilProphet"},
				},
			},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_IncarnationHasSpawned"},
		},
	},
};
