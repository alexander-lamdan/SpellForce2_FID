State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasNotItemMisc {Player = "pl_Human1", ItemId = 408, Amount = 1},
			AvatarHasNotItemMisc {Player = "pl_Human2", ItemId = 408, Amount = 1},
			AvatarHasNotItemMisc {Player = "pl_Human3", ItemId = 408, Amount = 1},
		},
		Actions =
		{
			FigureVanish {},
		},
	},
}