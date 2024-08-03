for i = 1, 3 do
	local sPlayer = "pl_Human" .. i
	
	OnOneTimeEvent
	{
		EventName = sPlayer .. "KilledIncarnation",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_IncarnationHasSpawned"},
			FigureIsDead	{Tag = "Incarnation"},
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Player = sPlayer, Name = "af_P363_NineShadowsMountainIncarnationAlreadyKilled"},
			AvatarValueAdd	{Player = sPlayer, Name = "av_P333_KilledIncarnations", Value = 1},			
			AvatarFlagSetTrue	{Player = sPlayer, Name = "af_P363_IncarnationKilled"},
			MapFlagSetTrue	{Name = "mf_IncarnationDead"},
		},
	}
end

State
{
	StateName = "MAIN",

	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 247, Amount = 1},
				AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 247, Amount = 1},
				AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 247, Amount = 1},
			},
		},
		Actions = 
		{
			FogOfWarReveal	{FogOfWarId = default, X = 598, Y = 364, Range = 5, Height = default},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_IncarnationDead"},
		},
		Actions = 
		{
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1206, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1206, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1206, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1202, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1202, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1202, Amount = 1},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Shalagath"},
			OR
			{
				AND
				{
					FigureIsInRange	{Tag = "pl_Human1Avatar", Range = 10, X = 598, Y = 364},
					AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 247, Amount = 1},
				},
				AND
				{
					FigureIsInRange	{Tag = "pl_Human2Avatar", Range = 10, X = 598, Y = 364},
					AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 247, Amount = 1},
				},
				AND
				{
					FigureIsInRange	{Tag = "pl_Human3Avatar", Range = 10, X = 598, Y = 364},
					AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 247, Amount = 1},
				},
			},
		},
		Actions =
		{
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1153, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1153, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1153, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1154, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1154, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1154, Amount = 1},
			AvatarItemMiscTake	{Player = "pl_Human1", ItemId = 247, Amount = 999},
			AvatarItemMiscTake	{Player = "pl_Human2", ItemId = 247, Amount = 999},
			AvatarItemMiscTake	{Player = "pl_Human3", ItemId = 247, Amount = 999},
		},
	},
};
