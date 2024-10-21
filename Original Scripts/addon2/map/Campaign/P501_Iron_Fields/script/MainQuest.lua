--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "QuestBook",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P501_TalkCompleteAntaraNightmare" },
		},
		Actions =
		{
			QuestSetActive {Quest = "IF_NIGHTMARES"},
			
			--FogOfWarRevealAtEntity {Tag = "EllacruVilde", Range = 20, FogOfWarId = 66},
			FogOfWarRevealAtEntity	{FogOfWarId = 60, Tag = "EllacruVilde", Range = 15, Height = 35},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_EndNadiraCS"},
		},
		Actions =
		{
			FogOfWarCloak	{FogOfWarId = 60},
			QuestSetActive {Quest = "IF_ATTACK"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_FirstTalk1CompleteGarret"},
			QuestIsActive {Quest = "IF_ATTACK"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 3000},
			QuestSetSolved {Quest = "IF_ATTACK"},
			QuestSetActive {Quest = "IF_GARRETT"},
		},
	},
		
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_ReachedOutpost"},
			QuestIsActive{Quest = "IF_GARRETT"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 3000},
			QuestSetSolved {Quest = "IF_GARRETT"},
		},
	},
	
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved {Quest = "IF_GARRETT"},
		},
		Actions =
		{
			QuestSetActive {Quest = "IF_SUPPLY_POST"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasFigureAmountEx	{Player = "default", Amount = 10 , CountWorkers = false, CountAvatarAndHeroes = false},
			PlayerHasBuilding {BuildingId = Building.RTS.RealmFarm, Amount = 1, OnlyCompleted = true},
			QuestIsActive {Quest = "IF_SUPPLY_POST"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 4000},
			QuestSetSolved {Quest = "IF_SUPPLY_POST"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_TalkCompleteAntaraInvasion"},
		},
		Actions =
		{
			QuestSetActive {Quest = "IF_STOP_INVASION"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_BaseDestroyed"},
			QuestIsActive {Quest = "IF_STOP_INVASION"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 6000},
			QuestSetSolved {Quest = "IF_STOP_INVASION"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_TalkCompleteAntaraTowerBlockade"},
		},
		Actions =
		{
			QuestSetActive {Quest = "IF_TOWER_BLOCKADE"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_BlockadeDestroyed"},
			QuestIsActive {Quest = "IF_TOWER_BLOCKADE"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 5000},
			QuestSetSolved {Quest = "IF_TOWER_BLOCKADE"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_TalkToGarrett"},
		},
		Actions =
		{
			QuestSetActive {Quest = "IF_REPORT_COMMANDER"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_FirstTalk2CompleteGarret"},
			QuestIsActive {Quest = "IF_REPORT_COMMANDER"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 3000},
			AvatarItemEquipmentGive	{Player = "default", ItemId = 1249, Amount = 1},
			QuestSetSolved {Quest = "IF_REPORT_COMMANDER"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved {Quest = "IF_REPORT_COMMANDER"},
		},
		Actions =
		{
			QuestSetActive {Quest = "IF_SALVATION"},
		},
	},
	
		
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_ReadyToMalangarGreen"},			
			--QuestIsActive {Quest = "IF_SALVATION"},
		},
		Actions =
		{
			MapTimerStart {Name = "mt_P501_MapExitTimer"},
			DialogSetDisabled	{Tag = "Twiddle"},
			DialogSetDisabled	{Tag = "dead_body"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_TakePaper"},			
		},
		Actions =
		{
			QuestSetActive {Quest = "IF_ASCHOLAR"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_PaperTalkFinished"},			
			QuestIsActive {Quest = "IF_ASCHOLAR"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 4000},
			AvatarItemMiscGive	{Player = "default", ItemId = 433, Amount = 1},
			QuestSetActive {Quest = "MG_PRISMOFMAGIC"},
			QuestSetSolved {Quest = "IF_ASCHOLAR"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_FlinkDealAccepted"},			
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 1500},
			QuestSetActive {Quest = "IF_FLINK"},
		},
	},

	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_TitanCapTalkQuestDone"},			
			QuestIsActive {Quest = "IF_FLINK"},
		},
		Actions =
		{
			AvatarXPGive	{Player = "default", Amount = 2000},
			AvatarItemMiscTake	{Player = "default", ItemId = 438, Amount = 1},
			AvatarItemMiscTake	{Player = "default", ItemId = 439, Amount = 1},
			AvatarItemMiscTake	{Player = "default", ItemId = 440, Amount = 1},
			AvatarItemMiscTake	{Player = "default", ItemId = 441, Amount = 1},
			AvatarItemEquipmentGive	{Player = "default", ItemId = 1264 , Amount = 1},
			QuestSetSolved {Quest = "IF_FLINK"},
		},
	},	
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_EllacruAcceptQuest"},			
		},
		Actions =
		{
			QuestSetActive {Quest = "IF_LOSTHEIR"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_StartFightWithSymon"},
			MapFlagIsTrue {Name = "mf_P501_KillSymon"},
			FigureIsDead {Tag = "Symon"},
			AvatarHasItemMisc	{Player = "default", ItemId = 442 , Amount = 1},
			QuestIsActive {Quest = "IF_LOSTHEIR"},
		},
		Actions =
		{	
			AvatarXPGive	{Player = "default", Amount = 3000},
			QuestSetActive {Quest = "IF_MISSVILDE"},
			QuestSetSolved {Quest = "IF_LOSTHEIR"},
		},
	},	


	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_AcceptedToTeachElle"},
			QuestIsActive {Quest = "IF_LOSTHEIR"},
		},
		Actions =
		{	
			AvatarXPGive	{Player = "default", Amount = 3000},
			AvatarItemMiscGive	{Player = "default", ItemId = 442, Amount = 1},
			QuestSetActive {Quest = "IF_AUNTELLE"},
			QuestSetSolved {Quest = "IF_LOSTHEIR"},
		},
	},		
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_ChestPuzzleComplete"},			
			QuestIsActive {Quest = "IF_AUNTELLE"},
		},
		Actions =
		{			
			AvatarXPGive	{Player = "default", Amount = 2000},
			ObjectLootItemEquipmentAdd	{Tag = "symons_chest", DropChance = 100, ItemId = 1262},
			ObjectLootItemEquipmentAdd	{Tag = "symons_chest", DropChance = 100, ItemId = 1263},
			QuestSetSolved {Quest = "IF_AUNTELLE"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "IF_MISSVILDE"},
			MapFlagIsTrue {Name = "mf_P501_BackToElleQuestOver"},
		},
		Actions =
		{
			AvatarItemMiscTake	{Player = "default", ItemId = 442, Amount = 1},
			AvatarXPGive	{Player = "default", Amount = 3000},
			AvatarGoldGive	{Player = "default", Amount = 100},		
			QuestSetSolved {Quest = "IF_MISSVILDE"},
		},
	},		

	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_AcceptedDemiraQuest"},
		},
		Actions =
		{	
			QuestSetActive {Quest = "IF_DEMIRA"},
		},
	},		
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 443, Amount = 1},
			QuestIsActive {Quest = "IF_DEMIRA"},
		},
		Actions =
		{	
			QuestSetSolved {Quest = "IF_DEMIRA"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved {Quest = "IF_DEMIRA"},
		},
		Actions =
		{	
			QuestSetActive {Quest = "IF_TEFLIS"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_TeflisOver"},
			QuestIsActive {Quest = "IF_TEFLIS"},
		},
		Actions =
		{	
			AvatarItemMiscTake	{Player = "default", ItemId = 443, Amount = 1},
			AvatarXPGive	{Player = "default", Amount = 5000},
			QuestSetSolved {Quest = "IF_TEFLIS"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P501_EndSalvationCS" },
		},
		Actions =
		{
			QuestSetSolved {Quest = "IF_SALVATION"},
			QuestSetSolved {Quest = "IF_NIGHTMARES"},
		},
	},
}



--IF_NIGHTMARES ..S
--IF_ATTACK			.. S ..E
--IF_TOWER_BLOCKADE ..S ..E
--IF_REPORT_COMMANDER ..S ..E
--IF_SALVATION ..S ..E
--IF_TOMG ..S .. E
--IF_GARRETT ..S ..E
--IF_SUPPLY_POST ..S ..E
--IF_STOP_INVASION ..S ..E

--IF_ASCHOLAR ..S ..E
--IF_FLINK ..S ..E
--IF_LOSTHEIR
--IF_MISSVILDE
--IF_AUNTELLE
--IF_DEMIRA
--IF_TEFLIS
--IF_SMITH

--SMITH_PASSION
--SMITH_RETRIBUTION
--SMITH_MERCYPEACE
--SMITH_HALLITS
--SMITH_EARTHQUAKE
--SMITH_DRAGONCURSE
--SMITH_MORPHEUS
--SMITH_WITCHKING
