--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "QuestBook",
	-- Starten der MapQuesten
	
	OnOneTimeEvent
	{
		Conditions =
		{
		--	MapFlagIsTrue {Name = "mf_P502_EndMapEntryCS"},
		},
		Actions =
		{				
			  QuestSetActive {Quest = "MG_PORTALS"},
		--	  MapFlagSetTrue	{Name = "mf_P502_StartCaineSarielCS"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_EndCaineSarielCS"},
		},
		Actions =
		{
			FigureVanish	{Tag = "Surian"},
			QuestSetActive {Quest = "MG_TOTHEELVES"},
		},
	},
	
	--	OnOneTimeEvent
	--{
	--	Conditions =
	--	{
	--		MapFlagIsTrue {Name = "mf_P502_EndToTheElvesCS"},
	--	},
	--	Actions =
	--	{
	--		QuestSetSolved {Quest = "MG_TOTHEELVES"},
	--	},
	--},
	
	
		OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_EndToTheElvesCS"},
			QuestIsActive	{Quest = "MG_TOTHEELVES"},
		},
		Actions =
		{	
			PlayerHeroRemove	{Player = "pl_Human", Tag = "HeroPTwiddle"},	
			QuestSetActive {Quest = "MG_IO"},			
			FigureTeleportToEntity	{Tag = "Twiddle", TargetTag = "To_The_Elves"},
			DialogSetEnabled	{Tag = "Twiddle"},
			DialogSetEnabled	{Tag = "Io"},
			--AvatarItemMiscGive	{ItemId = 418, Amount = 1},
			AvatarXPGive	{Amount = 9000},	
			MapTimerStart	{Name = "mt_P502_TwiddleDialog"},			
			QuestSetSolved	{Quest = "MG_TOTHEELVES"},
		},
	},
	
	
--			OnOneTimeEvent
--	{
--		Conditions =
--		{
--			MapFlagIsTrue {Name = "mf_P502_EndToTheElvesCS"},
--		},
--		Actions =
--		{
--			QuestSetSolved	{Quest = "MG_TOTHEELVES"},
--		},
--	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_TwiddleDialogOver"},
		},
		Actions =
		{
			DialogSetEnabled	{Tag = "grave_Dialogue_01"},
			AvatarItemMiscTake	{ ItemId = 418 , Amount = 1},
			
			QuestSetActive {Quest = "MG_COMPENSATOR"},
		},
	},	
	
		OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_IODialogOver"},
		},
		Actions =
		{
			FigureVanish	{Tag = "Io"},
				
			
		-- Add Hero IO
			PlayerHeroAdd	{ HeroId = 190},
			FigureHeroSpawnToEntity	{ Tag = "HeroIO", TargetTag = "pl_HumanAvatar", Direction = 0},
			
			LeverSetEnabled	{Tag = "MG_NecropolisGate_Switch_01"},	
			LeverSetEnabled	{Tag = "MG_NecropolisGate_Switch_02"},	
			LeverSetEnabled	{Tag = "MG_NecropolisGate_Switch_03"},	
			LeverSetEnabled	{Tag = "MG_NecropolisGate_Switch_04"},	
			LeverSetEnabled	{Tag = "MG_NecropolisGate_Switch_05"},	
			LeverSetEnabled	{Tag = "MG_NecropolisGate_Switch_06"},	
			LeverSetEnabled	{Tag = "MG_NecropolisGate_Switch_07"},	
			MapFlagSetTrue	{Name = "mf_P502Torch5On"},
			MapFlagSetTrue	{Name = "mf_P502_PuzzleInit"},
					
			DialogSetEnabled	{Tag = "grave_dialogue_01"},
			--DialogSetEnabled	{Tag = "grave_dialogue_02"},
			--DialogSetEnabled	{Tag = "grave_dialogue_03"},
			--DialogSetEnabled	{Tag = "grave_dialogue_04"},
			--DialogSetEnabled	{Tag = "grave_dialogue_05"},
				QuestSetActive {Quest = "MG_RITEOFCLEANSING"},		
				DialogSetEnabled	{Tag = "Tree"},
				
				MapTimerStart	{Name = "mt_P502_SadIOOutcry"},
			
			--MapFlagSetTrue	{Name = "mf_P502_StartNecropolisCS"},
			--MapFlagSetTrue	{Name = "mf_P502_EndNecropolisCS"},
		},
	},


	OnOneTimeEvent
	{
		Conditions =
		{
			GateIsOpen	{Tag = "Necropolis_Gate"},
			MapTimerIsElapsed	{Name = "mt_P502_NecropolisGate", Seconds = 4 },			
		},
		Actions =
		{			
				MapFlagSetTrue	{Name = "mf_P502_StartNecropolisCS"},			
				MapTimerStop	{Name = "mt_P502_NecropolisGate"},
		},
	},
	
		OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_EndNecropolisCS"},
			MapFlagIsFalse	{Name = "mf_P502_Guardian"},
--			FigureIsDead	{Tag = "Necropolis_Gardian_01"},
--			FigureIsDead	{Tag = "Necropolis_Gardian_02"},
--			FigureIsDead	{Tag = "Necropolis_Gardian_03"},
--			FigureIsDead	{Tag = "Necropolis_Gardian_04"},
--			FigureIsDead	{Tag = "Necropolis_Gardian_05"},
--			FigureIsDead	{Tag = "Necropolis_Gardian_06"},
--			FigureIsDead	{Tag = "Necropolis_Gardian_07"},
		},
		Actions =
		{		
			FigureVanish	{Tag = "Necropolis_Gardian_01"},
			FigureVanish	{Tag = "Necropolis_Gardian_02"},
			FigureVanish	{Tag = "Necropolis_Gardian_03"},
			FigureVanish	{Tag = "Necropolis_Gardian_04"},
			FigureVanish	{Tag = "Necropolis_Gardian_05"},
			FigureVanish	{Tag = "Necropolis_Gardian_06"},
			FigureVanish	{Tag = "Necropolis_Gardian_07"},
			
				FigureRespawnToEntity	{Tag = "Necropolis_Gardian_01" , TargetTag = "Necropolis_Gardian_Marker_01" },
				FigureRespawnToEntity	{Tag = "Necropolis_Gardian_02" , TargetTag = "Necropolis_Gardian_Marker_02" },
				FigureRespawnToEntity	{Tag = "Necropolis_Gardian_03" , TargetTag = "Necropolis_Gardian_Marker_03" },
				FigureRespawnToEntity	{Tag = "Necropolis_Gardian_04" , TargetTag = "Necropolis_Gardian_Marker_04" },
				FigureRespawnToEntity	{Tag = "Necropolis_Gardian_05" , TargetTag = "Necropolis_Gardian_Marker_05" },
				FigureRespawnToEntity	{Tag = "Necropolis_Gardian_06" , TargetTag = "Necropolis_Gardian_Marker_06" },
				FigureRespawnToEntity	{Tag = "Necropolis_Gardian_07" , TargetTag = "Necropolis_Gardian_Marker_07" },
				
				MapFlagSetTrue	{Name = "mf_P502_Guardian"},	
				QuestSetActive {Quest = "MG_SWORDORSPIRIT"},	
				FogOfWarRevealAtEntity	{FogOfWarId = default, Tag = "Necropolis_Gardian_Marker_04", Range = 10 , Height = 5 },	
		},
	},
	
	--	OnOneTimeEvent
	--{
	--	Conditions =
	--	{
	--		MapFlagIsTrue {Name = "mf_P502_EndNecropolisCS"},
	--		MapFlagIsFalse	{Name = "mf_P502_Guardian"},
	--	},
	--	Actions =
	--	{		
			--	FigureRespawnToEntity	{Tag = "Necropolis_Gardian_01" , TargetTag = "Necropolis_Gardian_Marker_01" },
			--	FigureRespawnToEntity	{Tag = "Necropolis_Gardian_02" , TargetTag = "Necropolis_Gardian_Marker_02" },
			--	FigureRespawnToEntity	{Tag = "Necropolis_Gardian_03" , TargetTag = "Necropolis_Gardian_Marker_03" },
			--	FigureRespawnToEntity	{Tag = "Necropolis_Gardian_04" , TargetTag = "Necropolis_Gardian_Marker_04" },
			--	FigureRespawnToEntity	{Tag = "Necropolis_Gardian_05" , TargetTag = "Necropolis_Gardian_Marker_05" },
			--	FigureRespawnToEntity	{Tag = "Necropolis_Gardian_06" , TargetTag = "Necropolis_Gardian_Marker_06" },
			--	FigureRespawnToEntity	{Tag = "Necropolis_Gardian_07" , TargetTag = "Necropolis_Gardian_Marker_07" },
	--		
	--			MapFlagSetTrue	{Name = "mf_P502_Guardian"},	
	--			QuestSetActive {Quest = "MG_SWORDORSPIRIT"},			
	--	},
	--},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_RitesofCleansingComplete"},
			QuestIsActive {Quest = "MG_RITEOFCLEANSING"},
		},
		Actions =
		{			
				AvatarXPGive	{Amount = 5500},			
				QuestSetSolved {Quest = "MG_RITEOFCLEANSING"},			
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			-- Compensator ID
			QuestIsActive {Quest = "MG_COMPENSATOR"},
			AvatarHasItemMisc	{ ItemId = 419, Amount = 1 },			
		},
		Actions =
		{					
				MapFlagSetTrue {Name = "mf_p502_QuestReportToTwiddle"},
				DialogSetEnabled	{Tag = "Twiddle"},
				AvatarXPGive	{Amount = 3500},			
				QuestSetSolved {Quest = "MG_COMPENSATOR"},			
		},
	},

	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_EndNamelessArmyCS"},
		},
		Actions =
		{			
			QuestSetActive {Quest = "MG_KNOWYOURENEMY"},			
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_p502_QuestCompleteKnowYourEnemy"},
			QuestIsActive {Quest = "MG_KNOWYOURENEMY"},
		},
		Actions =
		{			
						
			DialogSetEnabled	{Tag = "MG_village_Survivor"},
			AvatarXPGive	{Amount = 4500},			
			QuestSetSolved {Quest = "MG_KNOWYOURENEMY"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_VillageSurvivorDialogOver"},
		},
		Actions =
		{			
			QuestSetActive {Quest = "MG_FREESLAVES"},
		},
	},
	
	
		OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "MG_FREESLAVES"},
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Prison_Cutscene", Range = 10 },			
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P502_StartInvisibleCutscene"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_FactionChosen"},
			QuestIsActive {Quest = "MG_FREESLAVES"},
		},
		Actions =
		{	
			QuestSetActive {Quest = "MG_SHADOWSONG"},
			AvatarXPGive	{Amount = 2500},			
			QuestSetSolved {Quest = "MG_FREESLAVES"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mf_P502_TowerBuildWarning", Seconds = 4 },
			
		},
		Actions =
		{	
			MapTimerStop {Name = "mf_P502_TowerBuildWarning"},
			TutorialInfoTextShow {TextTag = "Tutorial206"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_p502_QuestReportToTwiddle"},
		},
		Actions =
		{			
			QuestSetActive {Quest = "MG_TOTWIDDLE"},
			DialogSetEnabled	{Tag = "Twiddle"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_CompensatorDialogOver"},
			MapFlagIsTrue {Name = "mf_P502_ArmyDialogOver"},			
		},
		Actions =
		{						
		MapTimerStart	{Name = "mt_P502_TwiddleQuestFinished"},
		},
	},
		
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_P502_TwiddleQuestFinished", Seconds = 5 },
		},
		Actions =
		{		
			MapTimerStop	{Name = "mt_P502_TwiddleQuestFinished"},	
			MapFlagSetTrue {Name = "mf_P502_TwiddleForcedDialogsOver"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_TwiddleForcedDialogsOver"},			
			AvatarIsNotTalking	{},
		},
		Actions =
		{	
			QuestSetActive {Quest = "MG_COUNTERATTACK"},
			QuestSetActive {Quest = "MG_REPAIR"},
			AvatarItemMiscGive	{ItemId = 418, Amount = 1},
			MapFlagSetTrue {Name = "mf_P502_CheckForPrismQuestActive"},
		},
	},
		
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_CheckForPrismQuestActive"},	
			QuestIsActive {Quest = "MG_PRISMOFMAGIC"},
		},
		Actions =
		{	
			DialogSetEnabled	{Tag = "Twiddle"},
		},
	
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_FactionChosen"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "base_marker", Range = 35 },
		},
		Actions =
		{		
			MapTimerStart {Name = "mf_P502_TowerBuildWarning"},
		},
	},

	
	OnOneTimeEvent
	{
		Conditions =
		{
			--MapFlagIsTrue {Name = "mf_P502_ArmyDialogOver"},
			MapFlagIsTrue {Name = "mf_P502_CompensatorDialogOver"},
			QuestIsActive {Quest = "MG_TOTWIDDLE"},
		},
		Actions =
		{	
		MapTimerStart	{Name = "mt_P502_QuestCompleteToTwiddle"},					
--			QuestSetActive {Quest = "MG_REPAIR"},

		--	AvatarXPGive	{Amount = 8000},			
		--	QuestSetSolved {Quest = "MG_TOTWIDDLE"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			--MapFlagIsTrue {Name = "mf_P502_ArmyDialogOver"},
			MapFlagIsTrue {Name = "mf_P502_CompensatorDialogOver"},
			QuestIsActive {Quest = "MG_TOTWIDDLE"},
			QuestIsActive{Quest = "MG_IO"},
			MapTimerIsElapsed	{Name = "mt_P502_QuestCompleteToTwiddle", Seconds = 20 },
			AvatarIsNotTalking	{},
			GameIsUnBlocked{},
		},
		Actions =
		{	
			MapTimerStop	{Name = "mt_P502_QuestCompleteToTwiddle"},					
			AvatarXPGive	{Amount = 8000},			
			QuestSetSolved {Quest = "MG_TOTWIDDLE"},
			QuestSetSolved {Quest = "MG_IO"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_NamelessBaseDestroyed"},
			QuestIsActive {Quest = "MG_COUNTERATTACK"},		
		},
		Actions =
		{	
			AvatarXPGive	{Amount = 8500},			
			QuestSetSolved {Quest = "MG_COUNTERATTACK"},			
		},
	},
	
--					OnOneTimeEvent
--	{
--		Conditions =
--		{
--			MapFlagIsTrue {Name = "mf_P502_GuardianKilled"},
--		
--		},
--		Actions =
--		{	
--		
--			QuestSetSolved {Quest = "MG_SWORDORSPIRIT"},			
--		},
--	},
	
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_NamelessBaseDestroyed"},
			MapFlagIsTrue {Name = "mf_P502_CompensatorDialogOver"},
			OR{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Gate", Range = 15 },
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroIO", TargetTag = "Gate", Range = 15 },
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroAntara", TargetTag = "Gate", Range = 15 },
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "Gate", Range = 15 },
				FigureIsInRangeToEntity	{Tag = "pl_HumanHeroSariel", TargetTag = "Gate", Range = 15 },
			},
		},
		Actions =
		{			
				MapFlagSetTrue {Name = "mf_P502_StartAfterMathCS"},
				--MapFlagSetTrue {Name = "mf_P502_EndAfterMathCS"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_EndAfterMathCS"},
		
		},
		Actions =
		{		
			ObjectVanish	{Tag = "Gate"},	
			MapFlagSetFalse	{Name = "mf_P502_SurianAdded"},	
			FigureVanish	{Tag = "Surian"},
			SetSurianNotWithAvatar { },
			DragonCallDisable { } ,	
			FogOfWarRevealAtEntity	{Tag = "Teleport_Dugout", Range = 4 , Height = 4},
			QuestSetActive {Quest = "MG_INTOTHEDEPTHS"},			
			FigureWalkToEntity	{Tag = "Dwarf", TargetTag = "To_The_Elves"},
		},
	},


--					OnOneTimeEvent
--	{
--		Conditions =
--		{
--			MapFlagIsTrue	{Name = "mf_P502_EndPrisonerCS"},			
	---		FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "To_The_Elves", Range = 15 },
--			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroIO", TargetTag = "To_The_Elves", Range = 15 },
--		
--		},
--		Actions =
--		{			
--			--MapFlagSetTrue {Name = "mf_P502_StartACuaseToFightFor"},
--			
--			MapFlagSetTrue {Name = "mf_p502_StartSomethingToFightForCS"},
--			
--			
--		},
--	},


							OnOneTimeEvent
	{
		Conditions =
		{		
			--MapFlagIsTrue {Name = "mf_P502_EndACuaseToFightFor"},
			
			MapFlagIsTrue {Name = "mf_p502_EndSomethingToFightForCS"},
			
			--FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "To_The_Elves", Range = 15 },
			--FigureIsInRangeToEntity	{Tag = "pl_HumanHeroIO", TargetTag = "To_The_Elves", Range = 15 },
			--QuestIsSolved	{Quest = "MG_COMPENSATOR"},
			--QuestIsSolved	{Quest = "MG_RITEOFCLEANSING"},
			QuestIsActive{Quest = "MG_IO"},
		
		},
		Actions =
		{		
			FigureVanish	{Tag = "MG_human_prisoner_01"},
			FigureVanish	{Tag = "MG_human_prisoner_02"},
			FigureVanish	{Tag = "MG_human_prisoner_03"},
			
			FigureVanish	{Tag = "MG_Shaikan_prisoner"},
			FigureVanish	{Tag = "MG_Pact_prisoner"},
			FigureVanish	{Tag = "MG_Ork_prisoner"},
			
			FigureVanish	{Tag = "prisone_Soldier_01"},
			FigureVanish	{Tag = "prisone_Soldier_02"},
			FigureVanish	{Tag = "prisone_Soldier_03"},
			FigureVanish	{Tag = "prisone_Soldier_04"},
			FigureVanish	{Tag = "prisone_Soldier_05"},
			
			FigureTeleport	{Tag = "Surian", X =450 , Y = 653},
			--AvatarXPGive	{Amount = 2500},				
			--QuestSetSolved{Quest = "MG_IO"},
		},
	},
	
	
						OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_P502_GuardianXPGiven"},
			QuestIsActive {Quest = "MG_SWORDORSPIRIT"},
		},
		Actions =
		{			
				--AvatarXPGive	{Amount = 000},			
				QuestSetSolved {Quest = "MG_SWORDORSPIRIT"},
		},
	},
	
				OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved {Quest = "MG_SWORDORSPIRIT"},
		
		},
		Actions =
		{			
			LeverSetDisabled	{Tag = "MG_NecropolisGate_Switch_01"},
			LeverSetDisabled	{Tag = "MG_NecropolisGate_Switch_02"},
			LeverSetDisabled	{Tag = "MG_NecropolisGate_Switch_03"},
			LeverSetDisabled	{Tag = "MG_NecropolisGate_Switch_04"},
			LeverSetDisabled	{Tag = "MG_NecropolisGate_Switch_05"},
			LeverSetDisabled	{Tag = "MG_NecropolisGate_Switch_06"},
			LeverSetDisabled	{Tag = "MG_NecropolisGate_Switch_07"},
		},
	},



	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_FactionChosen"},
			--MapFlagIsTrue {Name = "mf_P502_DragonRidingTUTFinished"},
		},
		Actions =
		{			
	--		MapFlagSetTrue {Name = "mf_p502_QuestReportToTwiddle"},		
			MapFlagSetFalse	{Name = "mf_P502_FirstTimeDialog"},		
			DialogSetEnabled	{Tag = "Twiddle"},
		},
	},
	
-- SIDE QUEST
	
		OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_QuestMerchant"},
		},
		Actions =
		{
			QuestSetActive {Quest = "MG_MERCHANT"},
		},
	},
	
			OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_QuestMerchantComplete"},
			AvatarHasItemMisc	{ ItemId = 452, Amount = 4},
			QuestIsActive {Quest = "MG_MERCHANT"},
		},
		Actions =
		{
			AvatarXPGive	{Amount = 5500},	
			AvatarItemMiscTake	{ ItemId = 452 , Amount = 4 },
			AvatarItemEquipmentGive	{ ItemId = 1261 , Amount = 1 },		
			QuestSetSolved {Quest = "MG_MERCHANT"},
		},
	},
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			AvatarHasItemMisc	{Player = "default", ItemId = 92, Amount = 1},
			AvatarValueIsEqual	{Name = "av_P502_MosaicOfDeath", Value = 6 },
			
		},
		Actions = 
		{
			AvatarValueSet	{Name = "av_P502_MosaicOfDeath", Value = 0},
			DialogSetEnabled	{Tag = "Mosaik"},
			QuestSetActive {Quest = "MG_MOSAIC"},
		},
	};	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_MosaicofDeathComplete"},
			QuestIsActive {Quest = "MG_MOSAIC"},
		},
		Actions =
		{
			AvatarXPGive	{Amount = 5500},	
			AvatarItemMiscTake	{ItemId = 92 , Amount = 1 },
			QuestSetSolved {Quest = "MG_MOSAIC"},
		},
	},
	
  OnOneTimeEvent
	{
		Conditions =
		{			
			AvatarHasItemEquipment	{ ItemId = 1265, Amount = 1},
			QuestIsActive {Quest = "MG_PRISMOFMAGIC"},
		},
		Actions =
		{		
			AvatarXPGive	{Amount = 3000},
			AvatarItemMiscTake	{ ItemId = 433 , Amount = 1},
			AvatarItemMiscTake	{ ItemId = 434 , Amount = 1},
			AvatarItemMiscTake	{ ItemId = 435 , Amount = 1},
			AvatarItemMiscTake	{ ItemId = 436 , Amount = 1},
			AvatarItemMiscTake	{ ItemId = 437 , Amount = 1},
			MapFlagSetTrue	{Name = "mf_P502_SpawnHirin"},		
			QuestSetSolved {Quest = "MG_PRISMOFMAGIC"},
		},
	},	
	
OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_ElfDruidForestDialogOver"},
		},
		Actions =
		{		
			QuestSetActive {Quest = "MG_FORESTSPIRITS"},
		},
	},

OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_ForestSpiritOver"},
			QuestIsActive {Quest = "MG_FORESTSPIRITS"},
		},
		Actions =
		{		
			AvatarXPGive	{Amount = 3000},	
			QuestSetSolved {Quest = "MG_FORESTSPIRITS"},
		},
	},

	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			QuestIsSolved	{ Quest = "INTO_FIRE" },
		},
		Actions = 
		{	
			FigureVanish{Tag = "Druid"},
			FigureVanish{Tag = "elf_army_01"},
			FigureVanish{Tag = "elf_army_02"},
			FigureVanish{Tag = "elf_army_03"},
			FigureVanish{Tag = "elf_army_04"},
			FigureVanish{Tag = "elf_army_05"},
			FigureVanish{Tag = "elf_army_06"},
			FigureVanish{Tag = "elf_army_07"},
			FigureVanish{Tag = "elf_army_08"},
			FigureVanish{Tag = "elf_army_09"},
			FigureVanish{Tag = "elf_army_10"},
			FigureVanish{Tag = "elf_army_11"},
			FigureVanish{Tag = "elf_army_12"},
			FigureVanish{Tag = "elf_army_13"},
			FigureVanish{Tag = "elf_army_14"},
			FigureVanish{Tag = "elf_army_15"},
			FigureVanish{Tag = "elf_army_16"},
			FigureVanish{Tag = "elf_army_17"},
			FigureVanish{Tag = "elf_army_18"},
			FigureVanish{Tag = "elf_army_19"},
			FigureVanish{Tag = "elf_army_20"},
			FigureVanish{Tag = "elf_camp_09"},			
			FigureVanish{Tag = "elf_camp_11"},			
			FigureVanish{Tag = "elf_camp_14"},			
			FigureVanish{Tag = "elf_camp_15"},			
			FigureVanish{Tag = "elf_camp_20"},			
			FigureVanish{Tag = "elf_camp_22"},			
			FigureVanish{Tag = "elf_camp_24"},			
			FigureVanish{Tag = "elf_camp_29"},			
			FigureVanish{Tag = "elf_camp_34"},			
			FigureVanish{Tag = "elf_druid_01"},
			FigureVanish{Tag = "elf_druid_02"},
			FigureVanish{Tag = "elf_ranger_01"},
			FigureVanish{Tag = "elf_ranger_02"},
			FigureVanish{Tag = "elf_ranger_03"},
			FigureVanish{Tag = "elf_ranger_04"},
			FigureVanish{Tag = "elf_ranger_05"},
			FigureVanish{Tag = "elf_ranger_06"},
			FigureVanish{Tag = "elf_ranger_07"},
			FigureVanish{Tag = "elf_ranger_08"},
			FigureVanish{Tag = "elf_ranger_09"},
			FigureVanish{Tag = "elf_ranger_10"},
			FigureVanish{Tag = "elf_ranger_11"},
			FigureVanish{Tag = "elf_ranger_12"},
			FigureVanish{Tag = "elf_ranger_13"},
			FigureVanish{Tag = "elf_ranger_14"},
			FigureVanish{Tag = "elf_ranger_15"},
			FigureVanish{Tag = "elf_ranger_16"},
			FigureVanish{Tag = "elf_ranger_17"},		
			FigureVanish{Tag = "elf_treant_01"},
			FigureVanish{Tag = "elf_treant_02"},
			FigureVanish{Tag = "elf_treant_03"},
			FigureVanish{Tag = "elf_treant_04"},
			FigureVanish{Tag = "elf_treant_05"},
			FigureVanish{Tag = "elf_treant_06"},
			FigureVanish{Tag = "elf_treant_07"},
			
			AvatarItemMiscTake	{ItemId = 418, Amount =1 },
			AvatarItemMiscTake	{ItemId = 419, Amount =1 },
			AvatarItemMiscTake	{ItemId = 420, Amount =1 },
			ObjectVanish	{Tag = "DeviceBase"},	
			FigureTeleport	{Tag = "Twiddle", X = 198 , Y = 470 },					
			MapFlagSetTrue	{Name = "mf_P502_MG2"},
			MapFlagSetTrue	{Name = "mf_P502_StartActivityCS"},
			--MapFlagSetTrue	{Name = "mf_P502_EndActivityCS"},
			DialogSetEnabled	{Tag = "Twiddle"},
			
		},
	};
	
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_EndActivityCS"},
		},
		Actions = 
		{	
			AvatarXPGive	{Amount = 18000},	
			QuestSetSolved	{ Quest = "PERFECTION"},
			FigureAbilityRemove	{Tag = "pl_HumanAvatar", AbilityId = Ability.Immortal },
			FigureVanish	{Tag = "Surian"},
			AvatarValueSet	{Player = "pl_Human", Name = "av_P502_OnDragon", Value = 0 },
			MapFlagSetTrue	{Name = "mf_P502_Surian"},
			NoSpawnEffect	{Spawn = FigureNpcSpawnToEntity	{Tag = "Surian", Level = 18 , UnitId = 1689 , TargetTag = "pl_HumanAvatar", Team = "tm_Team1"}, },
			FigurePlayerTransfer	{Tag = "Surian" },
			SetSurianWithAvatar { },
			DragonCallEnable { } ,			
			MapFlagSetTrue	{Name = "mf_P502_SurianAdded"},	
		},
	};
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_MG2"},			
			MapFlagIsTrue	{Name = "mf_P502_EndActivityCS"},
			MapFlagIsTrue	{Name = "mf_P502_MG2DialogOver"},
			QuestIsActive	{ Quest = "MG_PORTALS"},						
		},
		Actions = 
		{	
			QuestSetActive	{ Quest = "MG2_PORTALSTART"},	
			DialogSetEnabled	{Tag = "Twiddle_Device"},
			DialogSetDisabled	{Tag = "Twiddle"},
			AvatarXPGive	{Amount = 6000},	
			QuestSetSolved	{ Quest = "MG_PORTALS"},				
	--		DialogSetEnabled	{Tag = "Twiddle"},					
		},
	};
	OnOneTimeEvent
	{		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P502_MG2DeviceOver"},			
		},
		Actions = 
		{			
			
			MapTimerStart	{Name = "mt_P502_TravelToWastelandTimer"},
			AvatarXPGive	{Amount = 6000},	
			QuestSetSolved	{ Quest = "MG2_PORTALSTART"},		
		},
	};
	OnOneTimeEvent
	{		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P502_TravelToWastelandTimer", Seconds = 2},
		},
		Actions = 
		{			
			EffectStartAtEntityPosition	{Tag = "pl_HumanAvatar", File = "Effect_AreaHeal_Impact"},
		},
	};
	OnOneTimeEvent
	{		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P502_TravelToWastelandTimer", Seconds = 4},
		},
		Actions = 
		{			
			MapTimerStop {Name = "mt_P502_TravelToWastelandTimer"},
			MapFlagSetTrue	{Name = "mf_P502_LoadWS"},
		},
	};
	
	
}
	
