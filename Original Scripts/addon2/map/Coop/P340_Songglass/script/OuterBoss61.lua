State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
			OR
			{
				AvatarHasItemMisc {Player = "pl_Human1", ItemId = 408, Amount = 1},
				AvatarHasItemMisc {Player = "pl_Human2", ItemId = 408, Amount = 1},
				AvatarHasItemMisc {Player = "pl_Human3", ItemId = 408, Amount = 1},
			},
			OR
			{
				AvatarValueIsLess {Player = "pl_Human1", Name = "av_P465_ArenaState", Value = 11},
				AvatarValueIsLess {Player = "pl_Human2", Name = "av_P465_ArenaState", Value = 11},
				AvatarValueIsLess {Player = "pl_Human3", Name = "av_P465_ArenaState", Value = 11},
			},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P345_OuterBossSpawned"},
			PlayerBuildingTeamTransfer {Player = "pl_Human1", Team = "tm_Neutral"},
			PlayerBuildingTeamTransfer {Player = "pl_Human2", Team = "tm_Neutral"},
			PlayerBuildingTeamTransfer {Player = "pl_Human3", Team = "tm_Neutral"},
			PlayerBuildingTeamTransfer {Player = "pl_Clans", Team = "tm_Neutral"},
			PlayerBuildingTeamTransfer {Player = "pl_Undead", Team = "tm_Neutral"},
			FogOfWarRevealAtEntity {Range = 20},
		},
	},
}
State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AvatarHasItemMisc {Player = "pl_Human1", ItemId = 408, Amount = 1},
				AvatarHasItemMisc {Player = "pl_Human2", ItemId = 408, Amount = 1},
				AvatarHasItemMisc {Player = "pl_Human3", ItemId = 408, Amount = 1},
			},
			OR
			{
				AvatarValueIsLess {Player = "pl_Human1", Name = "av_P465_ArenaState", Value = 11},
				AvatarValueIsLess {Player = "pl_Human2", Name = "av_P465_ArenaState", Value = 11},
				AvatarValueIsLess {Player = "pl_Human3", Name = "av_P465_ArenaState", Value = 11},
			},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P345_OuterBossSpawned"},
			PlayerBuildingTeamTransfer {Player = "pl_Human1", Team = "tm_Neutral"},
			PlayerBuildingTeamTransfer {Player = "pl_Human2", Team = "tm_Neutral"},
			PlayerBuildingTeamTransfer {Player = "pl_Human3", Team = "tm_Neutral"},
			PlayerBuildingTeamTransfer {Player = "pl_Undead1", Team = "tm_Neutral"},
			PlayerBuildingTeamTransfer {Player = "pl_Undead2", Team = "tm_Neutral"},
			FogOfWarRevealAtEntity {Range = 20},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AND
				{
					AvatarHasNotItemMisc {Player = "pl_Human1", ItemId = 408, Amount = 1},
					AvatarHasNotItemMisc {Player = "pl_Human2", ItemId = 408, Amount = 1},
					AvatarHasNotItemMisc {Player = "pl_Human3", ItemId = 408, Amount = 1},
				},
				AND
				{
					PlayerIsExisting {Player = "pl_Human1"},
					AvatarValueIsGreaterOrEqual {Player = "pl_Human1", Name = "av_P465_ArenaState", Value = 11},
				},
				AND
				{
					PlayerIsExisting {Player = "pl_Human2"},
					AvatarValueIsGreaterOrEqual {Player = "pl_Human2", Name = "av_P465_ArenaState", Value = 11},
				},
				AND
				{
					PlayerIsExisting {Player = "pl_Human3"},
					AvatarValueIsGreaterOrEqual {Player = "pl_Human3", Name = "av_P465_ArenaState", Value = 11},
				},
			},
		},
		Actions =
		{
			FigureVanish {},
		},
	}
}