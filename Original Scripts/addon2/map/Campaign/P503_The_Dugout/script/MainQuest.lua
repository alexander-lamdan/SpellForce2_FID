--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "QuestBook",
	-- Starten der MapQuesten
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_P503_StartSarokCut"},
		},
		Actions =
		{
			QuestSetActive {Quest = "SAROKS_ARTIFACT"},
			FogOfWarRevealAtEntity	{FogOfWarId = 1, Tag = "Sarok_treasure", Range = 10 , Height = 6},			
		},
	},
		
	OnOneTimeEvent --IF PLAYER CHOOSE REWARD (SWORD OR STAFF) THEN TAKE THE ARTIFACT FROM PLAYER INVENTORY AND GIVE TO SAROK
	{
		Conditions =
		{
		 MapFlagIsTrue	{Name = "mf_P503_GetStaff"},
		},
		Actions =
		{
			--AvatarItemEquipmentTake	{ItemId = 1245, Amount = 1},
			AvatarItemMiscTake	{ItemId = 127, Amount = 1},
			MapFlagSetTrue	{Name = "mf_P503_SarokArtifact26"}, 
			QuestSetSolved {Quest = "SAROKS_ARTIFACT"},
			AvatarXPGive	{Amount = 5500},
			
			
		},
	},
	
	OnOneTimeEvent  --IF PLAYER CHOOSE REWARD (SWORD OR STAFF) THEN TAKE THE ARTIFACT FROM PLAYER INVENTORY AND GIVE TO SAROK
	{
		Conditions =
		{
		 MapFlagIsTrue	{Name = "mf_P503_GetSword"},
		},
		Actions =
		{			
			AvatarItemMiscTake	{ItemId = 127, Amount = 1},
			MapFlagSetTrue	{Name = "mf_P503_SarokArtifact26"},
			QuestSetSolved {Quest = "SAROKS_ARTIFACT"},
			AvatarXPGive	{Amount = 5500},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
		 MapFlagIsTrue	{Name = "mf_P503_SarokQuestComplete"},
		},
		Actions =
		{				
			QuestSetSolved {Quest = "SAROKS_ARTIFACT"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P503_ChooseReward"},
		},
		Actions = 
		{
			--FigureVanish	{Tag = "D_dwarf_sarok"},
			--FigureTeleport	{Tag = "sarok_merchant", X = 255.684, Y = 275.368},
			--NoSpawnEffect{Spawn = FigureNpcSpawn	{Tag = "sarok_merchant", Level = 15, UnitId = 1760, X = 255.684, Y = 275.368, Team = "tm_Team 1"}},
			
		},
	},


	OnOneTimeEvent
	{
		Conditions =
		{			
			MapFlagIsTrue {Name = "mf_P503_TalkSpiritChildCompleteFriendly"},
		},
		Actions =
		{
			QuestSetActive {Quest = "ETERNAL_PEACE"},		
			FogOfWarRevealAtEntity	{FogOfWarId = 1, Tag = "marker_spirit_spawn", Range = 10 , Height = 6},	
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{			
			MapFlagIsTrue {Name = "mf_P503_SurvivorQuest"},
		},
		Actions =
		{			
			QuestSetActive {Quest = "HEART_MINES"},						
			QuestSetActive {Quest = "SURVIVORS"},				
			FigureRunToEntity	{Tag = "Survivors_q1_08", TargetTag = "start"},
		},
	},
		
	OnOneTimeEvent
	{
		Conditions =
		{			
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Mines_heart", Range = 5},
		},
		Actions =
		{
			QuestSetSolved {Quest = "HEART_MINES"},			
			AvatarXPGive	{Amount = 9500},				
		},
	},
		
	OnOneTimeEvent
	{
		Conditions =
		{			
			MapFlagIsTrue {Name = "mf_P503_ArtifactRecd"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P503_TheArtifact28"},
			QuestSetSolved {Quest = "RECOVER_ARTIFACT"},			
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{			
			--MapFlagIsTrue {Name = "mf_P503_SpiritQuestComplete"},
			MapFlagIsTrue {Name = "mf_P503_SpiritDemonsKilled"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P503_EternalPiece27"},
			QuestSetSolved {Quest = "ETERNAL_PEACE"},		
			AvatarXPGive	{Amount = 5500},	
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{			
			MapFlagIsTrue {Name = "mf_P503_HuldikIngredientsQuest"},
		},
		Actions =
		{			
			QuestSetSolved	{Quest = "HULDIK_SMITH"},
			QuestSetActive {Quest = "MOON_SILVER"},						
			QuestSetActive {Quest = "ROYAL_WATER"},				
			QuestSetActive {Quest = "PROTECTIVE_GLOVES"},						
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive	{Quest = "MOON_SILVER"},
		  AvatarHasItemMisc	{Player = "pl_Human", ItemId = 466, Amount = 3 },
		},
		Actions =
		{				
			QuestSetSolved {Quest = "MOON_SILVER"},
			AvatarXPGive	{Amount = 8500},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive	{Quest = "ROYAL_WATER"},
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 467, Amount = 1 },
		},
		Actions =
		{				
			QuestSetSolved {Quest = "ROYAL_WATER"},
			AvatarXPGive	{Amount = 5500},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive	{Quest = "PROTECTIVE_GLOVES"},
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 468, Amount = 1 },
		},
		Actions =
		{				
			QuestSetSolved {Quest = "PROTECTIVE_GLOVES"},
			AvatarXPGive	{Amount = 5500},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
		  MapFlagIsTrue {Name = "mf_P503_ForgeFireQuest"},
		},
		Actions =
		{			
			QuestSetActive {Quest = "INTO_FIRE"},		
			AvatarItemMiscTake	{ItemId = 418, Amount = 1},	
		},
	},	

	OnOneTimeEvent
	{
		Conditions =
		{
		  MapFlagIsTrue {Name = "mf_P503_CompletedPhaseThree"},
		},
		Actions =
		{			
			QuestSetSolved {Quest = "INTO_FIRE"},	
			AvatarXPGive	{Amount = 10000},		
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
		  MapValueIsEqual	{Name = "mv_survivorcnt", Value = 7},
		},
		Actions =
		{			
			QuestSetSolved {Quest = "SURVIVORS"},			
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
		  QuestIsSolved {Quest = "INTO_FIRE"},
		},
		Actions =
		{			
			QuestSetSolved	{Quest = "MG_REPAIR"},
			AvatarItemMiscGive	{ItemId = 420, Amount = 1},
			QuestSetActive {Quest = "PERFECTION"},			
			ObjectSpawn	{ObjectId = 1432, X = 327.277, Y = 236.896, Direction = 0, Tag = "dugout_exit"},
		},
	},
	
}