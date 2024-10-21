--- TODO PETYA: xp-ket levonni a mainquestek XP rewardjaiból

State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_spider_01"},
			FigureIsDead {Tag = "xp_spider_02"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 140},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_spider_03"},
			FigureIsDead {Tag = "xp_spider_04"},
			FigureIsDead {Tag = "xp_spider_05"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 180},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_spider_06"},
			FigureIsDead {Tag = "xp_spider_07"},
			FigureIsDead {Tag = "xp_spider_08"},
			FigureIsDead {Tag = "xp_spider_09"},
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
			FigureIsDead {Tag = "xp_spider_10"},
			FigureIsDead {Tag = "xp_spider_11"},
			FigureIsDead {Tag = "xp_spider_12"},
			FigureIsDead {Tag = "xp_spider_13"},
			FigureIsDead {Tag = "xp_spider_14"},
			FigureIsDead {Tag = "xp_spider_15"},
			FigureIsDead {Tag = "xp_spider_16"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 370},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_nameless_01"},
			FigureIsDead {Tag = "xp_nameless_02"},
			FigureIsDead {Tag = "xp_nameless_03"},
			FigureIsDead {Tag = "xp_nameless_04"},
			FigureIsDead {Tag = "xp_nameless_05"},
			FigureIsDead {Tag = "xp_nameless_06"},
			FigureIsDead {Tag = "xp_nameless_07"},
			FigureIsDead {Tag = "xp_nameless_08"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 420},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "Spider_Spawan_01"},
			FigureIsDead {Tag = "Spider_Spawan_02"},
			FigureIsDead {Tag = "Spider_Spawan_03"},
			FigureIsDead {Tag = "Spider_Spawan_04"},
			FigureIsDead {Tag = "Spider_Spawan_05"},
			FigureIsDead {Tag = "Spider_Spawan_06"},
			FigureIsDead {Tag = "Spider_Spawan_07"},
			FigureIsDead {Tag = "Spider_01"},
			FigureIsDead {Tag = "Spider_02"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 390},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},
	
--[[
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "Animal_19"},
			FigureIsDead {Tag = "Animal_20"},
			FigureIsDead {Tag = "Animal_21"},
			FigureIsDead {Tag = "Animal_22"},
			FigureIsDead {Tag = "Animal_23"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 320},
		},
	},	
]]
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "MG_elric_npc_01"},
			FigureIsDead {Tag = "MG_elric_npc_03"},
			FigureIsDead {Tag = "MG_elric_npc_03"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 380},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "MG_elric_npc_05"},
			FigureIsDead {Tag = "MG_elric_npc_06"},
			FigureIsDead {Tag = "MG_elric_npc_07"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 380},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "MG_elric_npc_08"},
			FigureIsDead {Tag = "MG_elric_npc_09"},
			FigureIsDead {Tag = "MG_elric_npc_10"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 380},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},	
--[[	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "Animal_14"},
			FigureIsDead {Tag = "Animal_15"},
			FigureIsDead {Tag = "Animal_16"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 240},
		},
	},	
]]	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "bug_01"},
			FigureIsDead {Tag = "bug_02"},
			FigureIsDead {Tag = "bug_03"},
			FigureIsDead {Tag = "bug_04"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 320},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "bug_05"},
			FigureIsDead {Tag = "bug_06"},
			FigureIsDead {Tag = "bug_07"},
			FigureIsDead {Tag = "bug_08"},
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
			FigureIsDead {Tag = "xp_nameless_09"},
			FigureIsDead {Tag = "xp_nameless_10"},
			FigureIsDead {Tag = "xp_nameless_11"},
			FigureIsDead {Tag = "xp_nameless_12"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 410},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_nameless_13"},
			FigureIsDead {Tag = "xp_nameless_14"},
			FigureIsDead {Tag = "xp_nameless_15"},
			FigureIsDead {Tag = "xp_nameless_16"},
			FigureIsDead {Tag = "xp_nameless_17"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 370},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "bug_09"},
			FigureIsDead {Tag = "bug_10"},
			FigureIsDead {Tag = "bug_11"},
			FigureIsDead {Tag = "bug_12"},
			FigureIsDead {Tag = "bug_13"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 320},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "bug_14"},
			FigureIsDead {Tag = "bug_15"},
			FigureIsDead {Tag = "bug_16"},
			FigureIsDead {Tag = "bug_17"},
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
			FigureIsDead {Tag = "bug_18"},
			FigureIsDead {Tag = "bug_19"},
			FigureIsDead {Tag = "bug_20"},
			FigureIsDead {Tag = "bug_21"},
			FigureIsDead {Tag = "bug_22"},
			FigureIsDead {Tag = "bug_23"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 400},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "bug_24"},
			FigureIsDead {Tag = "bug_25"},
			FigureIsDead {Tag = "bug_26"},
			FigureIsDead {Tag = "bug_27"},
			FigureIsDead {Tag = "bug_28"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 400},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_bear_01"},
			FigureIsDead {Tag = "xp_bear_02"},
			FigureIsDead {Tag = "xp_bear_03"},
			FigureIsDead {Tag = "xp_bear_04"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 180},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},
	OnOneTimeEvent	
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_bear_05"},
			FigureIsDead {Tag = "xp_bear_06"},
			FigureIsDead {Tag = "xp_bear_07"},
			FigureIsDead {Tag = "xp_bear_08"},
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
			FigureIsDead {Tag = "xp_bear_09"},
			FigureIsDead {Tag = "xp_bear_10"},
			FigureIsDead {Tag = "xp_bear_11"},
			FigureIsDead {Tag = "xp_bear_12"},
			FigureIsDead {Tag = "xp_blackbear_01"},
			FigureIsDead {Tag = "xp_blackbear_02"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 320},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},		
	OnOneTimeEvent	
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_bear_13"},
			FigureIsDead {Tag = "xp_bear_14"},
			FigureIsDead {Tag = "xp_bear_15"},
			FigureIsDead {Tag = "xp_bear_16"},
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
			FigureIsDead {Tag = "xp_bear_17"},
			FigureIsDead {Tag = "xp_bear_18"},
			FigureIsDead {Tag = "xp_bear_19"},
			FigureIsDead {Tag = "xp_bear_20"},
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
			FigureIsDead {Tag = "xp_bear_21"},
			FigureIsDead {Tag = "xp_bear_22"},
			FigureIsDead {Tag = "xp_bear_23"},
			FigureIsDead {Tag = "xp_bear_24"},
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
			FigureIsDead {Tag = "xp_mosquito_01"},
			FigureIsDead {Tag = "xp_mosquito_02"},
			FigureIsDead {Tag = "xp_mosquito_03"},
			FigureIsDead {Tag = "xp_mosquito_04"},
			FigureIsDead {Tag = "xp_mosquito_05"},
			FigureIsDead {Tag = "xp_mosquito_06"},
			FigureIsDead {Tag = "xp_mosquito_07"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 210},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},
--[[
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "animal_01"},
			FigureIsDead {Tag = "animal_02"},
			FigureIsDead {Tag = "animal_03"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 120},
			DebugMessage {Caption = "default", Message = "animal_01, 02, 03 elvileg halott"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "animal_04"},
			FigureIsDead {Tag = "animal_05"},
			FigureIsDead {Tag = "animal_06"},
			FigureIsDead {Tag = "animal_07"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 190},
		},
	},	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "animal_08"},
			FigureIsDead {Tag = "animal_09"},
			FigureIsDead {Tag = "animal_10"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 140},
		},
	},	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "animal_11"},
			FigureIsDead {Tag = "animal_12"},
			FigureIsDead {Tag = "animal_13"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 130},
		},
	},	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "animal_14"},
			FigureIsDead {Tag = "animal_15"},
			FigureIsDead {Tag = "animal_16"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 250},
		},
	},	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "animal_20"},
			FigureIsDead {Tag = "animal_21"},
			FigureIsDead {Tag = "animal_22"},
			FigureIsDead {Tag = "animal_23"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 180},
		},
	},	
]]
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_ogre_01"},
			FigureIsDead {Tag = "xp_ogre_02"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 110},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_ogre_03"},
			FigureIsDead {Tag = "xp_ogre_04"},
			FigureIsDead {Tag = "xp_ogre_05"},
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
			FigureIsDead {Tag = "xp_wolf_01"},
			FigureIsDead {Tag = "xp_wolf_02"},
			FigureIsDead {Tag = "xp_wolf_03"},
			FigureIsDead {Tag = "xp_wolf_04"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 150},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_wolf_05"},
			FigureIsDead {Tag = "xp_wolf_06"},
			FigureIsDead {Tag = "xp_wolf_07"},
			FigureIsDead {Tag = "xp_wolf_08"},
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
			FigureIsDead {Tag = "xp_wolf_09"},
			--FigureIsDead {Tag = "xp_wolf_10"},
			FigureIsDead {Tag = "xp_wolf_11"},
			FigureIsDead {Tag = "xp_wolf_12"},
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
			FigureIsDead {Tag = "xp_wolf_13"},
			FigureIsDead {Tag = "xp_wolf_14"},
			FigureIsDead {Tag = "xp_wolf_15"},
			FigureIsDead {Tag = "xp_wolf_16"},
			FigureIsDead {Tag = "xp_wolf_17"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 220},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_wolf_18"},
			FigureIsDead {Tag = "xp_wolf_19"},
			FigureIsDead {Tag = "xp_wolf_20"},
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
			FigureIsDead {Tag = "xp_beast_01"},
			FigureIsDead {Tag = "xp_beast_02"},
			FigureIsDead {Tag = "xp_beast_03"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 270},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},		
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_cat_01"},
			FigureIsDead {Tag = "xp_cat_02"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 80},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_cat_03"},
			FigureIsDead {Tag = "xp_cat_04"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 90},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_cat_03"},
			FigureIsDead {Tag = "xp_cat_04"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 90},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_elemental_01"},
			FigureIsDead {Tag = "xp_elemental_02"},
			FigureIsDead {Tag = "xp_elemental_03"},
			FigureIsDead {Tag = "xp_elemental_04"},
			FigureIsDead {Tag = "xp_elemental_05"},
			FigureIsDead {Tag = "xp_elemental_06"},
			
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
			FigureIsDead {Tag = "xp_hornet_01"},
			FigureIsDead {Tag = "xp_hornet_02"},
			FigureIsDead {Tag = "xp_hornet_03"},
			FigureIsDead {Tag = "xp_hornet_04"},
			FigureIsDead {Tag = "xp_hornet_05"},
			FigureIsDead {Tag = "xp_hornet_06"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 130},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_boss_fireelemental"},
			FigureIsDead {Tag = "fireelemental_add_1"},
			FigureIsDead {Tag = "fireelemental_add_2"},
			FigureIsDead {Tag = "fireelemental_add_3"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 1190},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_titan_01"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 190},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "xp_boss_iceelemental"},
			FigureIsDead {Tag = "iceelemental_add_1"},
			FigureIsDead {Tag = "iceelemental_add_2"},
			FigureIsDead {Tag = "iceelemental_add_3"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 1190},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "beast_guard_01"},
			FigureIsDead {Tag = "beast_guard_02"},
			FigureIsDead {Tag = "beast_ambush_01"},
			FigureIsDead {Tag = "beast_ambush_02"},
			FigureIsDead {Tag = "beast_ambush_03"},
			FigureIsDead {Tag = "beast_ambush_04"},
			FigureIsDead {Tag = "beast_ambush_05"},
			FigureIsDead {Tag = "beast_ambush_06"},
			
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 780},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------IDÁIG MEGVAN A MAIN QUEST -BÕL VALÓ XP LEVONÁN, HA ÚJ MOBXP KERÜL BE AZT IS LE KELL VONNI A QUESTEKBÕL------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "patrol_beast_01"},
			FigureIsDead {Tag = "patrol_beast_02"},
			FigureIsDead {Tag = "patrol_beast_03"},
			
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 220},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "beast_01"},
			FigureIsDead {Tag = "beast_02"},
			FigureIsDead {Tag = "beast_03"},
			FigureIsDead {Tag = "beast_04"},
			FigureIsDead {Tag = "skyclaw_01"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 490},
			AvatarGoldGive	{Player = "default", Amount = 50 },
			TutorialInfoTextShow {TextTag = "Tutorial34"},
		},
	},
	
}