State
{
	StateName = "INIT",
	--===================================================================================
	-- TEST FREISCHALTUNG VON QUEST-KAPITELN
	--===================================================================================

	-------------------------------------------------------------------------------------
	-- DIALOG ANSCHALTUNG:
	-------------------------------------------------------------------------------------
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_EnableAnderhallDialog"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_EnableAnderhallDialog"},
			DialogSetEnabled	{Tag = "Anderhall"},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_EnableJandrimDialog"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_EnableJandrimDialog"},
			DialogSetEnabled	{Tag = "Jandrim_Windhammer"},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_EnableHalicosDialog"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_EnableHalicosDialog"},
			DialogSetEnabled	{Tag = "Halicos"},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_EnableYliaDialog"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_EnableYliaDialog"},
			DialogSetEnabled	{Tag = "Ylia"},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_EnableMersadionDialog"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_EnableMersadionDialog"},
			DialogSetEnabled	{Tag = "Odin"},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_EnableUtrechtDialog"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_EnableUtrechtDialog"},
			DialogSetEnabled	{Tag = "VerwalterUtrecht"},
		},
	};
	
	-------------------------------------------------------------------------------------
	-- CHAPTER STARTER:
	-------------------------------------------------------------------------------------
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_StartChapter2"},
		},
		Actions = 
		{
			QuestSetActive	{Quest = "CoopBaseChapter_1"},

			QuestSetSolved	{Quest = "CoopHonorMarks"},
			QuestSetSolved	{Quest = "CoopHonorMarksCollectedEnough"},
			QuestSetSolved	{Quest = "CoopProphet"},
			QuestSetSolved	{Quest = "CoopProphetLiberated"},
			QuestSetSolved	{Quest = "CoopBaseChapter_1"},
			
			QuestSetActive	{Quest = "CoopBaseChapter_2"},
			QuestSetActive	{Quest = "CoopFreeMerchants"},

			MapFlagSetTrue {Name = "mf_EnableHalicosDialog"},
			MapFlagSetTrue {Name = "mf_EnableAnderhallDialog"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_StartChapter3"},
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "CoopFreeMerchants"},
			QuestSetSolved	{Quest = "CoopFreeMerchantsLiberatedEnough"},
			QuestSetSolved	{Quest = "CoopProtectMerchants"},
			QuestSetSolved	{Quest = "CoopProtectMerchantsSolved"},
			QuestSetSolved	{Quest = "CoopTalkToAnyone"},
			QuestSetSolved	{Quest = "CoopBaseChapter_2"},

			QuestSetActive	{Quest = "CoopBaseChapter_3"},
			QuestSetActive	{Quest = "CoopSpyDocuments"},

			MapFlagSetTrue {Name = "mf_EnableJandrimDialog"},
			DialogSetDisabled	{Tag = "Halicos"},
			MapFlagSetTrue {Name = "mf_EnableAnderhallDialog"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_StartChapter4"},
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "CoopLiberateAya"},
			QuestSetSolved	{Quest = "CoopLiberateAyaSolved"},
			QuestSetSolved	{Quest = "CoopSpyDocuments"},
			QuestSetSolved	{Quest = "CoopSpyDocumentsCollected"},
			QuestSetSolved	{Quest = "CoopTalkToHalicos"},
			QuestSetSolved	{Quest = "CoopTalkToJandrim"},
			QuestSetSolved	{Quest = "CoopBaseChapter_3"},

			QuestSetActive	{Quest = "CoopBaseChapter_4"},
			QuestSetActive	{Quest = "CoopEvokePriests"},

			MapFlagSetTrue {Name = "mf_EnableJandrimDialog"},
			DialogSetDisabled	{Tag = "Halicos"},
			MapFlagSetTrue {Name = "mf_EnableAnderhallDialog"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_StartChapter5"},
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "CoopConjureNiethalf"},
			QuestSetSolved	{Quest = "CoopConjureNiethalfSolved"},
			QuestSetSolved	{Quest = "CoopEvokePriests"},
			QuestSetSolved	{Quest = "CoopEvokePriestsSolved"},
			QuestSetSolved	{Quest = "CoopTalkToHalicosAgain"},
			QuestSetSolved	{Quest = "CoopBaseChapter_4"},

			QuestSetActive	{Quest = "CoopBaseChapter_5"},
			QuestSetActive	{Quest = "CoopMarketplaceGoldenFields"},

			MapFlagSetTrue {Name = "mf_EnableJandrimDialog"},
			MapFlagSetTrue {Name = "mf_EnableHalicosDialog"},
			MapFlagSetTrue {Name = "mf_EnableAnderhallDialog"},
			MapFlagSetTrue {Name = "mf_EnableYliaDialog"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_StartChapter6"},
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "CoopGoldenFieldsCurse"},
			QuestSetSolved	{Quest = "CoopGoldenFieldsCurseRemoved"},
			QuestSetSolved	{Quest = "CoopMagicBarrierCrystals"},
			QuestSetSolved	{Quest = "CoopMagicBarrierCrystalsDestroyedEnough"},
			QuestSetSolved	{Quest = "CoopMarketPlaceGoldenFields"},
			QuestSetSolved	{Quest = "CoopMarketPlaceGoldenFieldsReached"},
			QuestSetSolved	{Quest = "CoopTalkToYlia"},
			QuestSetSolved	{Quest = "CoopBaseChapter_5"},

			QuestSetActive	{Quest = "CoopBaseChapter_6"},
			QuestSetActive	{Quest = "CoopEvilProphet"},

			MapFlagSetTrue {Name = "mf_EnableJandrimDialog"},
			MapFlagSetTrue {Name = "mf_EnableHalicosDialog"},
			MapFlagSetTrue {Name = "mf_EnableAnderhallDialog"},
			MapFlagSetTrue {Name = "mf_EnableYliaDialog"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_GiveAllBuildings"},
		},
		Actions = 
		{
			-- Clans
			
			PlayerBuildingAdd	{BuildingId = 149},
			PlayerBuildingAdd	{BuildingId = 150},
			PlayerBuildingAdd	{BuildingId = 152},
			PlayerBuildingAdd	{BuildingId = 153},
			PlayerBuildingAdd	{BuildingId = 154},
			PlayerBuildingAdd	{BuildingId = 155},
			PlayerBuildingAdd	{BuildingId = 156},
			PlayerBuildingAdd	{BuildingId = 157},
			PlayerBuildingAdd	{BuildingId = 158},
			PlayerBuildingAdd	{BuildingId = 159},
			PlayerBuildingAdd	{BuildingId = 160},
			PlayerBuildingAdd	{BuildingId = 161},
			PlayerBuildingAdd	{BuildingId = 162},
			PlayerBuildingAdd	{BuildingId = 163},
			
			PlayerBuildingUpgradeAdd	{UpgradeId = 27},
			PlayerBuildingUpgradeAdd	{UpgradeId = 33},
			PlayerBuildingUpgradeAdd	{UpgradeId = 19},
			PlayerBuildingUpgradeAdd	{UpgradeId = 29},
			PlayerBuildingUpgradeAdd	{UpgradeId = 21},
			PlayerBuildingUpgradeAdd	{UpgradeId = 25},
			PlayerBuildingUpgradeAdd	{UpgradeId = 39},
			PlayerBuildingUpgradeAdd	{UpgradeId = 37},
			PlayerBuildingUpgradeAdd	{UpgradeId = 35},
			PlayerBuildingUpgradeAdd	{UpgradeId = 31},
			PlayerBuildingUpgradeAdd	{UpgradeId = 23},
			
			-- Pact
			
			PlayerBuildingAdd	{BuildingId = 133},
			PlayerBuildingAdd	{BuildingId = 134},
			PlayerBuildingAdd	{BuildingId = 136},
			PlayerBuildingAdd	{BuildingId = 137},
			PlayerBuildingAdd	{BuildingId = 138},
			PlayerBuildingAdd	{BuildingId = 139},
			PlayerBuildingAdd	{BuildingId = 140},
			PlayerBuildingAdd	{BuildingId = 141},
			PlayerBuildingAdd	{BuildingId = 142},
			PlayerBuildingAdd	{BuildingId = 143},
			PlayerBuildingAdd	{BuildingId = 144},
			PlayerBuildingAdd	{BuildingId = 145},
			PlayerBuildingAdd	{BuildingId = 146},
			PlayerBuildingAdd	{BuildingId = 147},
			
			PlayerBuildingUpgradeAdd	{UpgradeId = 26},
			PlayerBuildingUpgradeAdd	{UpgradeId = 24},
			PlayerBuildingUpgradeAdd	{UpgradeId = 28},
			PlayerBuildingUpgradeAdd	{UpgradeId = 20},
			PlayerBuildingUpgradeAdd	{UpgradeId = 30},
			PlayerBuildingUpgradeAdd	{UpgradeId = 22},
			PlayerBuildingUpgradeAdd	{UpgradeId = 36},
			PlayerBuildingUpgradeAdd	{UpgradeId = 38},
			PlayerBuildingUpgradeAdd	{UpgradeId = 32},
			PlayerBuildingUpgradeAdd	{UpgradeId = 18},
			PlayerBuildingUpgradeAdd	{UpgradeId = 34},
			
			
			-- Realm
			
			PlayerBuildingAdd	{BuildingId = 115},
			PlayerBuildingAdd	{BuildingId = 116},
			PlayerBuildingAdd	{BuildingId = 118},
			PlayerBuildingAdd	{BuildingId = 119},
			PlayerBuildingAdd	{BuildingId = 120},
			PlayerBuildingAdd	{BuildingId = 121},
			PlayerBuildingAdd	{BuildingId = 122},
			PlayerBuildingAdd	{BuildingId = 123},
			PlayerBuildingAdd	{BuildingId = 124},
			PlayerBuildingAdd	{BuildingId = 125},
			PlayerBuildingAdd	{BuildingId = 126},
			PlayerBuildingAdd	{BuildingId = 128},
			PlayerBuildingAdd	{BuildingId = 130},
			PlayerBuildingAdd	{BuildingId = 131},
			PlayerBuildingAdd	{BuildingId = 185},
			
			PlayerBuildingUpgradeAdd	{UpgradeId = 9},
			PlayerBuildingUpgradeAdd	{UpgradeId = 14},
			PlayerBuildingUpgradeAdd	{UpgradeId = 13},
			PlayerBuildingUpgradeAdd	{UpgradeId = 6},
			PlayerBuildingUpgradeAdd	{UpgradeId = 15},
			PlayerBuildingUpgradeAdd	{UpgradeId = 12},
			PlayerBuildingUpgradeAdd	{UpgradeId = 8},
			PlayerBuildingUpgradeAdd	{UpgradeId = 11},
			PlayerBuildingUpgradeAdd	{UpgradeId = 7},
			PlayerBuildingUpgradeAdd	{UpgradeId = 6},
			PlayerBuildingUpgradeAdd	{UpgradeId = 10},			
			
		},
	};
};