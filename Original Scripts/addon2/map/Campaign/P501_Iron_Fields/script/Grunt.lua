State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_AllQuestDone"},			
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 5000},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_GruntOption1Chosen"},			
		},
		Actions =
		{
			QuestSetActive {Quest = "SMITH_PASSION"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_GruntOption2Chosen"},			
		},
		Actions =
		{
			QuestSetActive {Quest = "SMITH_RETRIBUTION"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_GruntOption3Chosen"},			
		},
		Actions =
		{
			QuestSetActive {Quest = "SMITH_MERCYPEACE"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_GruntOption4Chosen"},			
		},
		Actions =
		{
			QuestSetActive {Quest = "SMITH_HALLITS"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_GruntOption5Chosen"},			
		},
		Actions =
		{
			QuestSetActive {Quest = "SMITH_EARTHQUAKE"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_GruntOption6Chosen"},			
		},
		Actions =
		{
			QuestSetActive {Quest = "SMITH_DRAGONCURSE"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_GruntOption7Chosen"},			
		},
		Actions =
		{
			QuestSetActive {Quest = "SMITH_MORPHEUS"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_GruntOption8Chosen"},			
		},
		Actions =
		{
			QuestSetActive {Quest = "SMITH_WITCHKING"},
		},
	},
		
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 444, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 445, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 446, Amount = 1},
			QuestIsActive {Quest = "SMITH_PASSION"},
		},
		Actions =
		{
				MapFlagSetTrue {Name = "mf_P501_HasIngredients1"},			
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 469, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 458, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 456, Amount = 1},
			QuestIsActive {Quest = "SMITH_RETRIBUTION"},	
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P501_HasIngredients2"},	
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 462, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 449, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 470, Amount = 2},
			QuestIsActive {Quest = "SMITH_MERCYPEACE"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P501_HasIngredients3"},	
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 464, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 461, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 474, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 457, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 459, Amount = 1},
			QuestIsActive {Quest = "SMITH_HALLITS"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P501_HasIngredients4"},	
		},
	},

	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 472, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 473, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 448, Amount = 1},
			QuestIsActive {Quest = "SMITH_EARTHQUAKE"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P501_HasIngredients5"},	
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 447, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 455, Amount = 1},
			QuestIsActive {Quest = "SMITH_DRAGONCURSE"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P501_HasIngredients6"},	
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 460, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 453, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 471, Amount = 1},		
			QuestIsActive {Quest = "SMITH_MORPHEUS"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P501_HasIngredients7"},	
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 465, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 463, Amount = 1},
			AvatarHasItemMisc	{Player = "default", ItemId = 454, Amount = 1},		
			QuestIsActive {Quest = "SMITH_WITCHKING"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P501_HasIngredients8"},	
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_SmithGiveItem1"},
		},
		Actions =
		{
			AvatarItemMiscTake	{Player = "default", ItemId = 444, Amount = 1},
			AvatarItemMiscTake {Player = "default", ItemId = 445, Amount = 1},
			AvatarItemMiscTake	{Player = "default", ItemId = 446, Amount = 1},
			AvatarItemEquipmentGive	{Player = "default", ItemId = 1251, Amount = 1},
			AvatarXPGive	{Player = "default", Amount = 500},
			QuestSetSolved {Quest = "SMITH_PASSION"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_SmithGiveItem2"},
		},
		Actions =
		{
			AvatarItemMiscTake	{Player = "default", ItemId = 469, Amount = 1},
			AvatarItemMiscTake {Player = "default", ItemId = 458, Amount = 1},
			AvatarItemMiscTake	{Player = "default", ItemId = 456, Amount = 1},
			AvatarItemEquipmentGive	{Player = "default", ItemId = 1252, Amount = 1},
			AvatarXPGive	{Player = "default", Amount = 500},
			QuestSetSolved {Quest = "SMITH_RETRIBUTION"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_SmithGiveItem3"},
		},
		Actions =
		{
			AvatarItemMiscTake	{Player = "default", ItemId = 462, Amount = 1},
			AvatarItemMiscTake {Player = "default", ItemId = 449, Amount = 1},
			AvatarItemMiscTake	{Player = "default", ItemId = 470, Amount = 2},
			AvatarItemEquipmentGive	{Player = "default", ItemId = 1253, Amount = 1},
			AvatarItemEquipmentGive	{Player = "default", ItemId = 1254, Amount = 1},
			AvatarXPGive	{Player = "default", Amount = 500},
			QuestSetSolved {Quest = "SMITH_MERCYPEACE"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_SmithGiveItem4"},
		},
		Actions =
		{
			AvatarItemMiscTake	{Player = "default", ItemId = 464, Amount = 1},
			AvatarItemMiscTake {Player = "default", ItemId = 461, Amount = 1},
			AvatarItemMiscTake	{Player = "default", ItemId = 474, Amount = 1},
			AvatarItemMiscTake	{Player = "default", ItemId = 457, Amount = 1},
			AvatarItemMiscTake	{Player = "default", ItemId = 459, Amount = 1},
			AvatarItemEquipmentGive	{Player = "default", ItemId = 1255, Amount = 1},
			AvatarItemEquipmentGive	{Player = "default", ItemId = 1256, Amount = 1},
			AvatarXPGive	{Player = "default", Amount = 500},
			QuestSetSolved {Quest = "SMITH_HALLITS"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_SmithGiveItem5"},
		},
		Actions =
		{
			AvatarItemMiscTake	{Player = "default", ItemId = 472, Amount = 1},
			AvatarItemMiscTake {Player = "default", ItemId = 473, Amount = 1},
			AvatarItemMiscTake	{Player = "default", ItemId = 448, Amount = 1},
			AvatarItemEquipmentGive	{Player = "default", ItemId = 1257, Amount = 1},
			AvatarXPGive	{Player = "default", Amount = 500},
			QuestSetSolved {Quest = "SMITH_EARTHQUAKE"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_SmithGiveItem6"},
		},
		Actions =
		{
			AvatarItemMiscTake	{Player = "default", ItemId = 447, Amount = 1},
			AvatarItemMiscTake {Player = "default", ItemId = 455, Amount = 1},
			AvatarItemEquipmentGive	{Player = "default", ItemId = 1258, Amount = 1},
			AvatarXPGive	{Player = "default", Amount = 500},
			QuestSetSolved {Quest = "SMITH_DRAGONCURSE"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_SmithGiveItem7"},
		},
		Actions =
		{
			AvatarItemMiscTake	{Player = "default", ItemId = 460, Amount = 1},
			AvatarItemMiscTake {Player = "default", ItemId = 453, Amount = 1},
			AvatarItemMiscTake {Player = "default", ItemId = 471, Amount = 1},
			AvatarItemEquipmentGive	{Player = "default", ItemId = 1259, Amount = 1},
			AvatarXPGive	{Player = "default", Amount = 500},
			QuestSetSolved {Quest = "SMITH_MORPHEUS"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_SmithGiveItem8"},
		},
		Actions =
		{
			AvatarItemMiscTake	{Player = "default", ItemId = 465, Amount = 1},
			AvatarItemMiscTake {Player = "default", ItemId = 463, Amount = 1},
			AvatarItemMiscTake {Player = "default", ItemId = 454, Amount = 1},
			AvatarItemEquipmentGive	{Player = "default", ItemId = 1260, Amount = 1},
			AvatarXPGive	{Player = "default", Amount = 500},
			QuestSetSolved {Quest = "SMITH_WITCHKING"},
		},
	},
	
	
	
}


--SMITH_PASSION
--SMITH_RETRIBUTION
--SMITH_MERCYPEACE
--SMITH_HALLITS
--SMITH_EARTHQUAKE
--SMITH_DRAGONCURSE
--SMITH_MORPHEUS
--SMITH_WITCHKING
