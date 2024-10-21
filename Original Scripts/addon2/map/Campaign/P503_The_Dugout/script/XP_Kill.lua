--- TODO PETYA: xp-ket levonni a mainquestek XP rewardjaiból

State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_mob_01"},
			FigureIsDead {Tag = "xp_mob_02"},
			--FigureIsDead {Tag = "xp_mob_03"},
			FigureIsDead {Tag = "xp_mob_04"},
			FigureIsDead {Tag = "xp_mob_05"},
			FigureIsDead {Tag = "xp_mob_06"},
			FigureIsDead {Tag = "xp_mob_07"},
			
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 210},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			-- MUD GOLEM + 2 FIRE ELEMENTAL ADD
			FigureIsDead {Tag = "xp_mob_08"},
			FigureIsDead {Tag = "xp_mob_09"},
			FigureIsDead {Tag = "xp_mob_10"},
			
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 200},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			--FigureIsDead {Tag = "xp_mob_11"},
			--FigureIsDead {Tag = "xp_mob_12"},
			FigureIsDead {Tag = "xp_mob_13"},
			FigureIsDead {Tag = "xp_mob_14"},
			FigureIsDead {Tag = "xp_mob_15"},
			FigureIsDead {Tag = "xp_mob_16"},
			FigureIsDead {Tag = "xp_mob_17"},
			
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 290},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_mob_18"},
			FigureIsDead {Tag = "xp_mob_19"},
			FigureIsDead {Tag = "xp_mob_20"},
			FigureIsDead {Tag = "xp_mob_21"},
			FigureIsDead {Tag = "xp_mob_22"},
		
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 210},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_mob_23"},
			FigureIsDead {Tag = "xp_mob_24"},
			FigureIsDead {Tag = "xp_mob_25"},
			--FigureIsDead {Tag = "xp_mob_26"},
			--FigureIsDead {Tag = "xp_mob_27"},
			FigureIsDead {Tag = "xp_mob_28"},
		
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 240},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_mob_29"},
			FigureIsDead {Tag = "xp_mob_30"},
			FigureIsDead {Tag = "xp_mob_31"},
			FigureIsDead {Tag = "xp_mob_32"},
			FigureIsDead {Tag = "xp_mob_33"},
			
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 190},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_mob_34"},
			FigureIsDead {Tag = "xp_mob_35"},
			FigureIsDead {Tag = "xp_mob_36"},
			FigureIsDead {Tag = "dragon_slave_01"},
			FigureIsDead {Tag = "dragon_slave_02"},
			FigureIsDead {Tag = "dragon_slave_03"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 260},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_mob_37"},
			FigureIsDead {Tag = "xp_mob_38"},
			FigureIsDead {Tag = "xp_mob_39"},
			FigureIsDead {Tag = "xp_mob_40"},
			FigureIsDead {Tag = "avatar_attack_01"},
			FigureIsDead {Tag = "avatar_attack_02"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 280},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_mob_41"},
			FigureIsDead {Tag = "xp_mob_42"},
			FigureIsDead {Tag = "xp_mob_43"},
			FigureIsDead {Tag = "xp_mob_44"},
			FigureIsDead {Tag = "xp_mob_45"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 310},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_mob_46"},
			FigureIsDead {Tag = "xp_mob_47"},
			FigureIsDead {Tag = "xp_mob_48"},
			--FigureIsDead {Tag = "xp_mob_49"},
			--FigureIsDead {Tag = "xp_mob_50"},
			--FigureIsDead {Tag = "xp_mob_51"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 330},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_mob_52"},
			--FigureIsDead {Tag = "xp_mob_53"},
			FigureIsDead {Tag = "xp_mob_54"},
			FigureIsDead {Tag = "xp_mob_55"},
			--FigureIsDead {Tag = "xp_mob_56"},
			FigureIsDead {Tag = "xp_mob_57"},
			FigureIsDead {Tag = "xp_mob_58"},
			FigureIsDead {Tag = "xp_mob_59"},
			
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 430},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},
}