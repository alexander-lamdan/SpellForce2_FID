State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasNotItemMisc {Player = "pl_Human1", ItemId = 409, Amount = 1},
			AvatarHasNotItemMisc {Player = "pl_Human2", ItemId = 409, Amount = 1},
			AvatarHasNotItemMisc {Player = "pl_Human3", ItemId = 409, Amount = 1},
		},
		Actions =
		{
			FigureVanish {},
		},
	},
}