State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "Bazun"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 500},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "Iron_Field_Warrior_14"},
			FigureIsDead {Tag = "Iron_Field_Warrior_17"},
			FigureIsDead {Tag = "Iron_Field_Warrior_18"},
			
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 300},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow	{TextTag = "Tutorial34"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "IF_Soul_Screamer"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 500},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_spider_01_1"},
			FigureIsDead {Tag = "xp_spider_01_2"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 500},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow	{TextTag = "Tutorial34"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_spider_03_1"},
			FigureIsDead {Tag = "xp_spider_03_2"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 500},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow	{TextTag = "Tutorial34"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_ogre_01_1"},
			FigureIsDead {Tag = "xp_ogre_01_2"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 500},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow	{TextTag = "Tutorial34"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "IF_Monument_Mage"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 500},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow	{TextTag = "Tutorial34"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "IF_WolfPatrol_01_1"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 300},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "IF_LionPatrol_01_1"},
			FigureIsDead {Tag = "IF_LionPatrol_01_2"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 300},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "IF_BearPatrol_01_1"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 300},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P501_TrollsDead"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 300},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow	{TextTag = "Tutorial34"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "IF_Renegade_01"},
			FigureIsDead {Tag = "IF_Renegade_02"},
			FigureIsDead {Tag = "IF_Renegade_03"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 500},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow	{TextTag = "Tutorial34"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "IF_FireElementals_01"},
			FigureIsDead {Tag = "IF_FireElementals_02"},
			FigureIsDead {Tag = "IF_FireElementals_03"},
			FigureIsDead {Tag = "IF_FireElementals_04"},
			
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 500},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow	{TextTag = "Tutorial34"},		
			},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "IF_animal_01"},
			FigureIsDead {Tag = "IF_animal_02"},
			FigureIsDead {Tag = "IF_SQ_Blood_Wolf"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 300},
		},
	},
		
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "IF_Silver_Wolf"},
			FigureIsDead {Tag = "IF_Silver_Wolf_2"},
			FigureIsDead {Tag = "IF_Silver_Wolf_3"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 300},
			
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "IF_East_Giant_Ogre_1"},
			FigureIsDead {Tag = "IF_East_Giant_Ogre_2"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 300},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow	{TextTag = "Tutorial34"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_P501_WolvesDead"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 500},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow	{TextTag = "Tutorial34"},
		},
	},
}