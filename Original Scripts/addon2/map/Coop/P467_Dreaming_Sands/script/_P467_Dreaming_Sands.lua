State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "XPBoss"},
		},
		Actions =
		{
			AvatarXPGive {Player = "pl_Human1", Amount = LevelXP[21] - LevelXP[20]},
			AvatarXPGive {Player = "pl_Human2", Amount = LevelXP[21] - LevelXP[20]},
			AvatarXPGive {Player = "pl_Human3", Amount = LevelXP[21] - LevelXP[20]},
		}
	},
}