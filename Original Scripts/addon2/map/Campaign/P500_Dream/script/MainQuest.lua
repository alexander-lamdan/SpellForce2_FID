--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "QuestBook",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P500_FirstQuestStart"},
		},
		Actions =
		{
			QuestSetActive {Quest = "DR_MAIN"},
			QuestSetActive {Quest = "DR_TO_VILLAGE"},
			FogOfWarRevealAtEntity {Tag = "DR_QMarker_Village", Range = 10, FogOfWarId = 4},
		},
	},
		
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "DR_TO_VILLAGE"},
			MapFlagIsTrue {Name = "mf_P500_GarrettQuestStart"},
			--QuestIsSolved {Quest = "IF_GARRETT"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "DR_TO_VILLAGE"},
			AvatarXPGive	{Player = "default", Amount = 1100},
			QuestSetActive {Quest = "DR_TALK_TO_GARRETT"},
			
		},
	},
		
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "DR_TALK_TO_GARRETT"},
			MapFlagIsTrue {Name = "mf_P500_SuppliesQuestStart"},
			--QuestIsSolved {Quest = "IF_GARRETT"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "DR_TALK_TO_GARRETT"},
			AvatarXPGive	{Player = "default", Amount = 1200},
			QuestSetActive {Quest = "DR_SUPPLIES"},
			FogOfWarCloak	{FogOfWarId = 4},
			FogOfWarRevealAtEntity {Tag = "DR_QMarker_Supply1", Range = 5, FogOfWarId = 5},
			FogOfWarRevealAtEntity {Tag = "DR_QMarker_Supply2", Range = 5, FogOfWarId = 6},
			FogOfWarRevealAtEntity {Tag = "DR_QMarker_Supply3", Range = 5, FogOfWarId = 7},
			FigureLootItemEquipmentAdd	{Tag = "DR_Chest01", DropChance = 100, ItemId = 312},
			FigureLootItemEquipmentAdd	{Tag = "DR_Chest01", DropChance = 100, ItemId = 308},
			FigureLootItemEquipmentAdd	{Tag = "DR_Chest02", DropChance = 100, ItemId = 502},
			FigureLootItemEquipmentAdd	{Tag = "DR_Chest02", DropChance = 100, ItemId = 313},
			FigureLootItemEquipmentAdd	{Tag = "DR_Chest03", DropChance = 100, ItemId = 316},
			FigureLootItemEquipmentAdd	{Tag = "DR_Chest03", DropChance = 100, ItemId = 317},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "DR_SUPPLIES"},
			MapFlagIsTrue {Name = "mf_P500_SuppliesPickedUp"},
			OR
				{
						MapFlagIsFalse {Name = "mf_P500_TutorialRequested"},
						AND	
						{
							MapFlagIsTrue {Name = "mf_P500_TutorialRequested"},
							MapFlagIsTrue	{Name = "mf_P500_SpellTutoFinished"},
						},	
				},
		},
		Actions =
		{
			QuestSetSolved {Quest = "DR_SUPPLIES"},
			AvatarXPGive	{Player = "default", Amount = 1300},
			QuestSetActive {Quest = "DR_DEFENSE"},
			FogOfWarCloak	{FogOfWarId = 5},
			FogOfWarCloak	{FogOfWarId = 6},
			FogOfWarCloak	{FogOfWarId = 7},
			FogOfWarRevealAtEntity {Tag = "DR_QMarker_Outpost", Range = 5, FogOfWarId = 8},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "DR_DEFENSE"},
			PlayerHasUnitAmount {UnitId = Unit.RTS.RealmSoldier, Amount = 5},
			PlayerHasUnitAmount	{UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
			PlayerHasBuilding  {BuildingId = Building.RTS.RealmFarm, OnlyCompleted = false, Amount = 1},
		},
		Actions =
		{
			QuestSetSolved {Quest = "DR_DEFENSE"},
			AvatarXPGive	{Player = "default", Amount = 1500},
			QuestSetActive {Quest = "DR_ATTACK"},
			FogOfWarCloak	{FogOfWarId = 8},
			FogOfWarRevealAtEntity {Tag = "DR_QMarker_Tower", Range = 5, FogOfWarId = 9},
			BuildingAbilityRemove {Tag = "DR_Tower1", AbilityId = Ability.Immortal },
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "DR_ATTACK"},
			BuildingIsDead	{Tag = "DR_Tower1"},
		},
		Actions =
		{
			QuestSetSolved {Quest = "DR_ATTACK"},
			QuestSetSolved {Quest = "DR_MAIN"},
			AvatarXPGive	{Player = "default", Amount = 2200},
			MapFlagSetTrue {Name = "mf_P500_LastQuestCompleted"},
		},
	},
	
}
	
	
-- DR_TO_VILLAGE
-- DR_TALK_TO_GARRETT
-- DR_SUPPLIES
-- DR_DEFENSE
-- DR_ATTACK