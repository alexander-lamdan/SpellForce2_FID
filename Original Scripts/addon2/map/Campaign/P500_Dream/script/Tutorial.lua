---------------------------------
-------------P500----------------
---------------------------------


local MinimapMarker = 1
local buttonsize = 43
local CamZoom1 = 3
local CamZoom2 = 7

State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		--GotoState = "Block_21",
		--GotoState = "Block23",
		Conditions = 
		{
		 	MapFlagIsTrue	{Name = "mf_P501_Tutorial"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P500_TutorialRequested"},
			AvatarFlagSetTrue	{Player = "default", Name = "af_P500_TutorialRequested"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
		 	MapFlagIsTrue {Name = "mf_P500_Wide"},
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Player = "default", Name = "af_P500_WideScreen"},
			MapFlagSetTrue	{Name = "mf_P500_WideScreen"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P500_EndArriveCS"},
			MapFlagIsTrue {Name = "mf_P500_TutorialRequested"},
		},
		Actions = 
		{
			--CameraSet	{X = 472.11, Y = 57.67 , Z = 637.99, LookAtX = 445.83 , LookAtY = 36.01, LookAtZ = 649.64},
			TutorialCameraCenterOnEntity	{Tag = "pl_Humanvatar"},
			TutorialCameraSetZoom {Zoom = CamZoom1},
			TutorialStateSet {TutorialState = FreezeIsoCameraZoom},
			TutorialStateSet {TutorialState = FreezeIsoCameraPosition},
			TutorialStateSet {TutorialState = DisableDestroyItemButton},
			EntityTimerStart	{Name = "et_TutorialBegins1"},
		},
	};

	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_TutorialBegins1", Seconds = 2},
			
		},
		Actions = 
		{
			EntityTimerStop	{Name = "et_TutorialBegins1"},
			TutorialInfoTextShow	{TextTag = "Tutorial1"},
			TutorialInfoTextShow {TextTag = "Tutorial2"},
			TutorialTaskTextShow {TextTag = "Tutorial3"},
			MapValueSet	{Name = "mv_P500_Marker", Value = 1},
			
		},
		GotoState = "TutorialRunning",
		
	};


			
}
-------------------------------------------------------------------------------------------
-- Avatar world selecting
-------------------------------------------------------------------------------------------
State
{
	StateName = "TutorialRunning",
	
	OnOneTimeEvent
	{
		GotoState = "Block_2",
		Conditions = 
		{
			TutorialTaskTextIsOnScreen	{Take = 3},
			FigureIsSelected	{Tag = "pl_HumanAvatar"},
		},
		Actions = 
		{
			TutorialTaskSetSolved	{Take = 3},
		},
		
	};
}
-------------------------------------------------------------------------------------------
-- Avatar icon selecting
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block_2",

	OnOneTimeEvent
	{
		Conditions = 
		{
			TutorialTaskTextIsNotOnScreen {Take = 3},
			TutorialTextIsFinished {Take = 3},
		},
		Actions = 
		{
			TutorialInfoTextShow {TextTag = "Tutorial4"},
			TutorialInfoTextShow {TextTag = "Tutorial5"},
			TutorialInfoTextShow {TextTag = "Tutorial6"},
			TutorialInfoTextShow {TextTag = "Tutorial7"},
			TutorialInfoTextShow {TextTag = "Tutorial8"},
			TutorialInfoTextShow {TextTag = "Tutorial9"},
			TutorialInfoTextShow {TextTag = "Tutorial10"},
			TutorialInfoTextShow {TextTag = "Tutorial11"},
			TutorialTaskTextShow {TextTag = "Tutorial12"},
			TutorialStateClear {TutorialState = AvatarPortraitButtonClicked},
			TutorialStateClear	{TutorialState = FreezeIsoCameraPosition},
			-- CameraStop {},
		},
	};
	OnOneTimeEvent
	{
		GotoState = "Block_5",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 12},
			TutorialStateIsSet	{TutorialState = AvatarPortraitButtonClicked},
		},
		Actions =
		{
			--MapFlagSetTrue {Name = "mf_P500_PortaitMarkerQuit"},
			TutorialTaskSetSolved {Take = 12},
			TutorialStateClear{TutorialState = FreezeIsoCameraZoom},
		},
	},
}

-------------------------------------------------------------------------------------------
-- Rts Move
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block_5",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsNotOnScreen {Take = 12},
			TutorialTextIsFinished {Take = 12},
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial13"},
			TutorialTaskTextShow {TextTag = "Tutorial17"},
			ObjectSpawnToEntity	{ObjectId = 1336, TargetTag = "DR_MoveTutorialPos", Direction = 0, Tag = "DR_TutorialEffect02"},
			--ObjectSpawn	{ObjectId = 1336, X = 436 , Y = 659 , Direction = 0, Tag = "DR_TutorialEffect02"},
			FigureFollowEntity	{Tag = "DR_Antara", TargetTag = "pl_HumanAvatar"},
		}
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 17},
		},
		Actions =
		{
			TutorialCameraCenterOnEntity	{Tag = "DR_MoveTutorialPos"},
			TutorialCameraSetZoom {Zoom = CamZoom2},
		},
	},
	
	
	OnOneTimeEvent
	{
		GotoState = "Block_6",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 17},
			--FigureIsInRange {Tag = "pl_HumanAvatar", Range = 3, X = 436 , Y = 659 },
			FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "DR_MoveTutorialPos", Range = 3},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 17},
			ObjectVanish	{Tag = "DR_TutorialEffect02"},
			TutorialCameraCenterOnEntity	{Tag = "DR_MoveTutorialPos"},
			TutorialCameraSetZoom {Zoom = CamZoom2},
			TutorialStateSet	{TutorialState = FreezeIsoCameraPosition },
			AvatarXPGive	{Player = "default", Amount = 1000},
			--TutorialTaskTextShow {TextTag = "Tutorial19"},
			--TutorialCameraCenterOnEntity {Tag = "CameraCenter01"},
			--TutorialCameraSetZoom {Zoom = 7},
			TutorialInfoTextShow {TextTag = "Tutorial24"},
			TutorialTaskTextShow {TextTag = "Tutorial25"},
		},
	},
	
}

-------------------------------------------------------------------------------------------
-- Level up
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block_6",
	OnOneTimeEvent
	{
		GotoState = "Block_7",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 25},
			OR
			{
				DialogSkillTreeIsVisible {},
				OR
				{
					AvatarHasSkill {Skill = 75}, -- Magic start
					AvatarHasSkill {Skill = 6} -- Combat start
				}
			}
		},
		Actions =
		{
			FigureWalk	{Tag = "DR_Antara", X = 434, Y = 656 },
			TutorialTaskSetSolved {Take = 25},
			TutorialInfoTextShow {TextTag = "Tutorial26"},
			TutorialInfoTextShow {TextTag = "Tutorial27"},
			TutorialInfoTextShow {TextTag = "Tutorial28"},
			TutorialInfoTextShow {TextTag = "Tutorial29"},
			TutorialInfoTextShow {TextTag = "Tutorial30"},
			TutorialTaskTextShow {TextTag = "Tutorial31"},
		}
	},
	
}
-------------------------------------------------------------------------------------------
-- Equipments 
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block_7",
	OnOneTimeEvent
	{
		GotoState = "Block_8",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 31},
			HeroHasNoSkillPointsLeft {Hero = 0},
			OR
			{
				AvatarHasSkill {Skill = 75}, -- Magie Anfang
				AvatarHasSkill {Skill = 6} -- Combat Anfang
			}
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 31},
			TutorialInfoTextShow {TextTag = "Tutorial32"},
			TutorialInfoTextShow {TextTag = "Tutorial33"},
			TutorialTaskTextShow {TextTag = "Tutorial34"},
			
		},
	},
}

-------------------------------------------------------------------------------------------
-- Equipment menu and all menu close
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block_8",
	OnOneTimeEvent
	{
		GotoState = "Block_9",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 34},
			DialogEquipmentIsNotVisible	{},
			DialogInventoryIsNotVisible	{},
			DialogQuestBookIsNotVisible	{},
			DialogSkillTreeIsNotVisible	{},
			DialogSpellBookIsNotVisible	{},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 34},
			TutorialTaskTextShow {TextTag = "Tutorial64"},
			MapFlagSetTrue	{Name = "mf_P500_FirstQuestStart"},
		}
	},
	
}

-------------------------------------------------------------------------------------------
-- Quest tuto
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block_9",
	OnOneTimeEvent
	{
		GotoState = "Block_10",
		Conditions =
		{
			DialogQuestBookIsVisible {},
			TutorialTaskTextIsOnScreen {Take = 64},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 64},
			TutorialInfoTextShow {TextTag = "Tutorial65"},
			TutorialTaskTextShow {TextTag = "Tutorial66"},
		},
	},
}
-------------------------------------------------------------------------------------------
-- Questbook Details
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block_10",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 66},
			DialogQuestBookDescriptionIsVisible	{},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 66},
			TutorialInfoTextShow {TextTag = "Tutorial67"},
			TutorialTaskTextShow {TextTag = "Tutorial68"},
		},
	},

	OnOneTimeEvent
	{
		GotoState = "Block_10B",
		Conditions =
		{
			DialogQuestBookDescriptionIsNotVisible	{},
			DialogQuestBookIsNotVisible	{},
			TutorialTaskTextIsOnScreen {Take = 68},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 68},
			TutorialInfoTextShow {TextTag = "Tutorial35"},
			TutorialInfoTextShow {TextTag = "Tutorial36"},
			TutorialTaskTextShow {TextTag = "Tutorial37"},
			MapFlagSetTrue	{Name = "mf_P500_AntaraJoinRequest"},
		},
	},
}
			
-------------------------------------------------------------------------------------------
-- Antara JOIN
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block_10B",
	
	OnOneTimeEvent
	{
		GotoState = "Block_11",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 37},
			FigureIsSelected	{Tag = "pl_HumanHeroAntara"},
			FigureIsSelected	{Tag = "pl_HumanAvatar"},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 37},
			
			--FigureVanish {Tag = "Bor"},
			--PlayerHeroAdd {Player = "pl_Human", HeroId = 8},
			--FigureOutcry {TextTag = "System2", Tag = "System_Npc"}, --SYSTEM-OC: sie haben den Realm bekommen
			--FigureHeroSpawnToEntity {Tag = "HeroBor", TargetTag = "pl_HumanAvatar", Direction = 90},
		}
	},		
}

-------------------------------------------------------------------------------------------
-- Lever and gate 
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block_11",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsNotOnScreen {Take = 37},
			TutorialTextIsFinished {Take = 37},
		},
		Actions =
		{
			TutorialCameraCenterOnEntity	{Tag = "pl_HumanAvatar"},
			TutorialCameraSetZoom {Zoom = CamZoom2},
			TutorialTaskTextShow {TextTag = "Tutorial90"},
			ObjectSpawnToEntity	{ObjectId = 1336 , TargetTag = "DR_TutoLever01", Direction = 0, Tag = "DR_TutorialEffect03"},
			LeverSetEnabled	{Tag = "DR_TutoLever01"},
			MapFlagSetTrue	{Name = "mf_P500_TutorialLeverOnRequest"},
		}
	},
	
	OnOneTimeEvent
	{
		GotoState = "Block_12",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P500_GateOpened"},
			TutorialTaskTextIsOnScreen {Take = 90},
		},
		Actions = 
		{
			TutorialTaskSetSolved {Take = 90},
			ObjectVanish	{Tag = "DR_TutorialEffect03"},
			TutorialStateClear	{TutorialState = FreezeIsoCameraPosition },
		},
	};
	
	
}

-------------------------------------------------------------------------------------------
-- Combat tutorial
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block_12",
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P500_EndAttackCS"},
		},
		Actions = 
		{
			
			-- TutorialCameraCenterOnEntity {Tag = "pl_HumanAvatar"},
			TutorialCameraCenterOnEntity	{Tag = "pl_HumanAvatar"},
			TutorialCameraSetZoom {Zoom = CamZoom2},
			TutorialStateSet {TutorialState = FreezeIsoCameraPosition},
			TutorialStateSet {TutorialState = FreezeIsoCameraZoom},
			EntityTimerStart	{Name = "et_TutorialBegins2"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_TutorialBegins2", Seconds = 2},
		},
		Actions = 
		{
			EntityTimerStop	{Name = "et_TutorialBegins2"},
			TutorialInfoTextShow	{TextTag = "Tutorial20"},
			TutorialTaskTextShow	{TextTag = "Tutorial19"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			TutorialTaskTextIsOnScreen	{Take = 19 },
			FigureIsDead	{Tag = "DR_DWarrior01"},
			FigureIsDead	{Tag = "DR_DWarrior02"},
		},
		Actions = 
		{
			TutorialTaskSetSolved	{Take = 19},
			
		},
		GotoState = "Block_13",
	};
}

-------------------------------------------------------------------------------------------
-- Resurrect 
-------------------------------------------------------------------------------------------

State
{
	StateName = "Block_13",
	
	OnOneTimeEvent
	{
		
		Conditions =
		{
			TutorialTaskTextIsNotOnScreen {Take = 19},
			TutorialTextIsFinished {Take = 19},
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial54"},
			TutorialTaskTextShow {TextTag = "Tutorial57"},
			MapFlagSetTrue	{Name = "mf_P500_ResurrectTutorialStarted"},
		},
	},
	
	OnOneTimeEvent
	{
		GotoState = "Block_14",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 57},
			FigureIsAlive {Tag = "pl_HumanHeroAntara"},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 57},
			TutorialInfoTextShow {TextTag = "Tutorial59"},
			TutorialInfoTextShow {TextTag = "Tutorial60"},
		},
	},
		
}

-------------------------------------------------------------------------------------------
-- Loot
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block_14",	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			TutorialTextIsFinished	{Take = 59},
			TutorialTextIsFinished	{Take = 60},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P500_ResurrectTutorialEnd"},
		},
	};

	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P500_EndDemonCS"},
		},
		Actions = 
		{
			TutorialCameraCenterOnEntity	{Tag = "pl_HumanAvatar"},
			TutorialCameraSetZoom {Zoom = CamZoom1},
			TutorialStateSet {TutorialState = FreezeIsoCameraZoom},
			TutorialStateSet {TutorialState = FreezeIsoCameraPosition},
			EntityTimerStart	{Name = "et_TutorialBegins3"},
		},
	};

	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_TutorialBegins3", Seconds = 2},
		},
		Actions = 
		{
			EntityTimerStop	{Name = "et_TutorialBegins3"},
			TutorialInfoTextShow	{TextTag = "Tutorial41"},
			TutorialTaskTextShow	{TextTag = "Tutorial42"},
		},
		GotoState = "Block_15",
	};
}

State
{
	StateName = "Block_15",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 42},
			-- loot window visible OR all items looted 
			OR
			{
				DialogLootIsVisible {},
				AND
				{
					AvatarHasItemEquipment {ItemId = 1282, Amount = 1},
					AvatarHasItemEquipment {ItemId = 490, Amount = 1},
				},
			},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 42},
			TutorialTaskTextShow {TextTag = "Tutorial43"},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "Block_16",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 43},
			AvatarHasItemEquipment {ItemId = 1282, Amount = 1},
			AvatarHasItemEquipment {ItemId = 490, Amount = 1},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 43},
			TutorialTaskTextShow {TextTag = "Tutorial44"},
		},
	},
}

-------------------------------------------------------------------------------------------
-- Inventory & Equipments
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block_16",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 44},
			OR
			{
				DialogEquipmentIsVisible	{},
				AvatarHasItemEquipped {ItemId = 1282},
				AvatarHasItemEquipped {ItemId = 490},
			}
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 44},
			TutorialInfoTextShow {TextTag = "Tutorial45"},
			TutorialTaskTextShow {TextTag = "Tutorial46"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 46},
			OR
			{
				DialogInventoryIsVisible	{},
				AvatarHasItemEquipped {ItemId = 1282},
				AvatarHasItemEquipped {ItemId = 490},
			},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 46},
			TutorialInfoTextShow {TextTag = "Tutorial47"},
			TutorialInfoTextShow {TextTag = "Tutorial48"},
			TutorialInfoTextShow {TextTag = "Tutorial49"},
			TutorialInfoTextShow {TextTag = "Tutorial50"},
			TutorialTaskTextShow {TextTag = "Tutorial51"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 51},
			OR
			{
				AvatarHasItemEquipped {ItemId = 1282},
				AvatarHasItemEquipped {ItemId = 490},
			},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 51},
			TutorialTaskTextShow {TextTag = "Tutorial52"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block_17",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 52},
			DialogEquipmentIsNotVisible	{},
			DialogInventoryIsNotVisible	{},
			DialogQuestBookIsNotVisible	{},
			DialogSkillTreeIsNotVisible	{},
			DialogSpellBookIsNotVisible	{},
			
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 52},
			TutorialStateClear {TutorialState = FreezeIsoCameraPosition},
			TutorialStateClear {TutorialState = FreezeIsoCameraZoom},
			TutorialStateClear {TutorialState = DisableDestroyItemButton},
			MapFlagSetTrue	{Name = "mf_P500_EquipTutoEnd"},
		}
	},
}

-------------------------------------------------------------------------------------------
-- Interact with NPC
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block_17",
	OnOneTimeEvent
	{
		
		Conditions =
		{
			QuestIsActive {Quest = "DR_TALK_TO_GARRETT"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_P500_InteractTutorialTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P500_StartGarrettCS"},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P500_InteractTutorialTimer"},
		},
		GotoState = "Block_18",
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_P500_InteractTutorialTimer", Seconds = 20},
			MapFlagIsFalse {Name = "mf_P500_StartGarrettCS"},
		},
		Actions =
		{
			TutorialInfoTextShow	{TextTag = "Tutorial92"},
			MapTimerStop	{Name = "mt_P500_InteractTutorialTimer"},
		},
		GotoState = "Block_18",
	},
	
}



-------------------------------------------------------------------------------------------
-- Spells
-------------------------------------------------------------------------------------------

State
{
	StateName = "Block_18",
	OnOneTimeEvent
	{
		Conditions =
		{
			--QuestIsActive {Quest = "DR_SUPPLIES"},
			MapFlagIsTrue {Name = "mf_P500_EndGarrettCS"},
		},
		Actions =
		{
			--MapTimerStart	{Name = "mt_P500_SpellTutorialTimer"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block_18B",
		Conditions =
		{
			--MapTimerIsElapsed	{Name = "mt_P500_SpellTutorialTimer", Seconds = 1},
			MapFlagIsTrue {Name = "mf_P500_EndGarrettCS"},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P500_SpellTutorialTimer"},
			TutorialTaskTextShow {TextTag = "Tutorial72"},
			TutorialCameraCenterOnEntity	{Tag = "pl_HumanAvatar"},
			TutorialCameraSetZoom {Zoom = CamZoom2},
			TutorialStateSet {TutorialState = FreezeIsoCameraPosition},
			TutorialStateSet {TutorialState = FreezeIsoCameraZoom},
		}
	},
	
}

State
{
	StateName = "Block_18B",	
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 72},
			DialogSpellBookIsVisible	{},
		},
		Actions =
		{
			TutorialTaskSetSolved	{Take = 72},
			TutorialInfoTextShow {TextTag = "Tutorial73"},
			TutorialInfoTextShow {TextTag = "Tutorial74"},
			TutorialInfoTextShow {TextTag = "Tutorial76"},
			TutorialInfoTextShow {TextTag = "Tutorial79"},
			MapFlagSetTrue	{Name = "mf_P500_SpellTutoStarted"},
		},
	},
	
	OnOneTimeEvent
	{
		GotoState = "Block_19",
		Conditions =
		{
			TutorialTextIsFinished	{Take = 79},
			MapFlagIsTrue	{Name = "mf_P500_SpellTutoStarted"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P500_SpellTutoFinished"},
			TutorialStateClear {TutorialState = FreezeIsoCameraPosition},
			TutorialStateClear {TutorialState = FreezeIsoCameraZoom},
		},
	},
	
}

-------------------------------------------------------------------------------------------
-- Third person cam control
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block_19",
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "DR_DEFENSE"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_P500_TPSTutorialTimer"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_P500_TPSTutorialTimer", Seconds = 20},
			
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P500_TPSTutorialTimer"},
			TutorialTaskTextShow {TextTag = "Tutorial14"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block_20",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 14},
			TutorialCameraIsIn3rdPersonView {},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 14},
		}
	},
	
}

-------------------------------------------------------------------------------------------
-- Back to RTS cam 
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block_20",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsNotOnScreen {Take = 14},
			TutorialTextIsFinished {Take = 14},
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial15"},
			TutorialTaskTextShow {TextTag = "Tutorial16"},
		}
	},
	OnOneTimeEvent
	{
		GotoState = "Block_21",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 16},
			TutorialCameraIsNotIn3rdPersonView {},
		},
		Actions =
		{
			TutorialCameraCenterOnEntity {Tag = "pl_HumanAvatar"},
			TutorialCameraSetZoom {Zoom = 7},
			TutorialTaskSetSolved {Take = 16},
			MapFlagSetTrue	{Name = "mf_P500_CameraTutoFinished"},
		}
	},
	
}

-------------------------------------------------------------------------------------------
-- Click and fight
-------------------------------------------------------------------------------------------

State
{
	StateName = "Block_21",
	OnOneTimeEvent
	{
	Conditions =
		{
			MapFlagIsTrue	{Name = "mf_P500_BridgeWarriorCreated"},
			OR	
				{
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "DR_BridgeMarker", Range = 8},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroAntara", TargetTag = "DR_BridgeMarker", Range = 8},
				},
		},
		Actions =
		{
			TutorialTaskTextShow {TextTag = "Tutorial39"},
			TutorialCameraCenterOnEntity	{Tag = "DR_BridgeWarrior1"},
			TutorialCameraSetZoom {Zoom = CamZoom2},
			-- FigureRun	{Tag = "DR_BridgeWarrior1", X = 495, Y = 543},
		}
	},
	
	OnOneTimeEvent
	{
	Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 39},
			OR
			{
				FigureIsSelected	{Tag = "DR_BridgeWarrior1"},
				FigureIsDead	{Tag = "DR_BridgeWarrior1"},
			},
		},
		Actions =
		{
			--TutorialTaskTextShow {TextTag = "Tutorial39"},
			TutorialTaskSetSolved	{Take = 39},
			TutorialTaskTextShow {TextTag = "Tutorial40"},
			GateSetOpen	{Tag = "DR_BridgeGate"},
			MapFlagSetTrue	{Name = "mf_P500_BridgeOpened"},
			-- FigureRun	{Tag = "DR_BridgeWarrior1", X = 495, Y = 543},
		}
	},
	
	OnOneTimeEvent
	{
	GotoState = "Block23",
	Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 40},
			FigureIsDead	{Tag = "DR_BridgeWarrior1"},
			MapFlagIsTrue	{Name = "mf_P500_BridgeWarriorCreated"},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 40},
			TutorialInfoTextShow {TextTag = "Tutorial999"},
			MapFlagSetTrue	{Name = "mf_P500_ClickAndFightDone"},
		}
	},
	
}

-------------------------------------------------------------------------------------------
-- BUILDING START
-------------------------------------------------------------------------------------------

State
{
	StateName = "Block23",
	OnOneTimeEvent
	{
		GotoState = "Block24",
		Conditions =
		{
			OR	
				{
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "DR_QMarker_Outpost", Range = 15},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroAntara", TargetTag = "DR_QMarker_Outpost", Range = 15},
				},
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial96"},
			TutorialInfoTextShow {TextTag = "Tutorial97"},
			TutorialInfoTextShow {TextTag = "Tutorial98"},
			TutorialTaskTextShow {TextTag = "Tutorial99"},	
		},
	},
}
-------------------------------------------------------------------------------------------
-- Workers send silver mining
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block24",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 99},
		},
		Actions =
		{
			ObjectSpawnToEntity	{ObjectId = 1336, TargetTag = "DR_Silver_Resource", Direction = 0, Tag = "DR_TutorialEffect05"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 99},
			TutorialWorkerIsGatheringSilver	{Amount = 2},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 99},
			TutorialInfoTextShow {TextTag = "Tutorial100"},
			TutorialTaskTextShow {TextTag = "Tutorial101"},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "Block25",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 101},
			PlayerHasResourceSilver {Amount = 50},
		},
		Actions =
		{
			ObjectVanish	{Tag = "DR_TutorialEffect05"},
			TutorialTaskSetSolved {Take = 101},
			TutorialTaskTextShow {TextTag = "Tutorial102"},
		},
	},
}
-------------------------------------------------------------------------------------------
-- More craftsmen
-------------------------------------------------------------------------------------------


State
{
	StateName = "Block25",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 102},
			BuildingIsSelected {BuildingId = Building.RTS.RealmHeadquarter},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 102},
			TutorialInfoTextShow {TextTag = "Tutorial103"},
			TutorialInfoTextShow {TextTag = "Tutorial104"},
			TutorialTaskTextShow {TextTag = "Tutorial105"},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "Block26",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 105},
			PlayerHasUnitAmount {Amount = 10, UnitId = 69},
		},
		Actions =
		{
			ObjectSpawnToEntity	{ObjectId = 1336, TargetTag = "DR_Stone_Resource", Direction = 0, Tag = "DR_TutorialEffect06"},
			TutorialTaskSetSolved {Take = 105},
			TutorialInfoTextShow {TextTag = "Tutorial107"},
			TutorialInfoTextShow {TextTag = "Tutorial108"},
			TutorialInfoTextShow {TextTag = "Tutorial109"},
			TutorialInfoTextShow {TextTag = "Tutorial110"},
			TutorialInfoTextShow {TextTag = "Tutorial111"},
			TutorialTaskTextShow {TextTag = "Tutorial112"},
		},
	},
}

-------------------------------------------------------------------------------------------
-- Build a blacksmith
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block26",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 112},
			OR
			{
				BuildingIsAboutToBeBuilt {BuildingId = 128},
				PlayerHasBuilding {BuildingId = Building.RTS.RealmBlacksmith, Amount = 1, OnlyCompleted = false},
			},
		},
		Actions =
		{
			ObjectVanish	{Tag = "DR_TutorialEffect06"},
			ObjectSpawnToEntity	{ObjectId = 1336, TargetTag = "DR_ForgeMarker", Direction = 0, Tag = "DR_TutorialEffect07"},
			TutorialTaskSetSolved {Take = 112},
			TutorialTaskTextShow {TextTag = "Tutorial113"},
			TutorialCameraCenterOnEntity {Tag = "ForgeMarker"},
			TutorialCameraSetZoom {Zoom = 7},
			
		},
	},
	OnOneTimeEvent
	{
		GotoState = "Block26a",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 113},
			PlayerHasBuilding {BuildingId = Building.RTS.RealmBlacksmith, Amount = 1, OnlyCompleted = false},
			
		},
		Actions =
		{
			ObjectVanish	{Tag = "DR_TutorialEffect07"},
			TutorialTaskSetSolved {Take = 113},
			TutorialInfoTextShow {TextTag = "Tutorial114"},
			TutorialTaskTextShow {TextTag = "Tutorial115"},
			
		},
	},
}

-------------------------------------------------------------------------------------------
-- Building in progress - waiting for it
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block26a",
	OnOneTimeEvent
	{
		GotoState = "Block28",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 115},
			PlayerHasBuilding {BuildingId = Building.RTS.RealmBlacksmith, Amount = 1, OnlyCompleted = true},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 115},
			TutorialTaskTextShow {TextTag = "Tutorial116"},		
		},
	},
}


-------------------------------------------------------------------------------------------
-- Training 5 soldiers
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block28",
	OnOneTimeEvent
	{
		GotoState = "Block30",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 116},
			PlayerHasUnitAmount {UnitId = Unit.RTS.RealmSoldier, Amount = 5},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 116},
			TutorialInfoTextShow {TextTag = "Tutorial117"},
			TutorialInfoTextShow {TextTag = "Tutorial118"},
			TutorialInfoTextShow {TextTag = "Tutorial121"},
			TutorialTaskTextShow {TextTag = "Tutorial122"},
			--MapFlagSetTrue {Name = "mf_ShowArmyAttackMarker"},
			--MapFlagSetTrue {Name = "mf_P301_BridgeArmyDoNotRespawn"},
			--GateSetOpen {Tag = "Gate3"},
		},
	},
}

-------------------------------------------------------------------------------------------
-- Blacksmith upgrade
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block30",
	OnOneTimeEvent
	{
		GotoState = "Block34",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 122},
			PlayerHasBuilding	{BuildingId = Building.RTS.RealmBlacksmith, OnlyCompleted = false,
									UpgradeId = Building.Upgrade.RealmWorkshop, Amount = 1},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 122},
			TutorialInfoTextShow {TextTag = "Tutorial123"},
			TutorialInfoTextShow {TextTag = "Tutorial124"},
			TutorialInfoTextShow {TextTag = "Tutorial125"},
			TutorialInfoTextShow {TextTag = "Tutorial126"},
			TutorialInfoTextShow {TextTag = "Tutorial127"},
			TutorialTaskTextShow {TextTag = "Tutorial128"},
			--FigureRtsKitSpawn {UnitId = 69, Level = 2, X = 511, Y = 414, PlayerKit = "pk_Give"},
			--FigureRtsKitSpawn {UnitId = 69, Level = 2, X = 511, Y = 413, PlayerKit = "pk_Give"},
			--FigureRtsKitSpawn {UnitId = 69, Level = 2, X = 509, Y = 415, PlayerKit = "pk_Give"},
			--PlayerKitTransfer {PlayerKit = "pk_Give"}
		},
	},
}
-------------------------------------------------------------------------------------------
--Grouop select and build a farm, create a crossbowman
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block34",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 128},
			PlayerUnitIsInGroup {Group = 0, UnitId = Unit.RTS.RealmCraftsman, Amount = 3},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 128},
			TutorialTaskTextShow {TextTag = "Tutorial129"},
			ObjectSpawnToEntity	{ObjectId = 1336, TargetTag = "DR_FarmMarker", Direction = 0, Tag = "DR_TutorialEffect08"},
			TutorialCameraCenterOnEntity {Tag = "DR_FarmMarker"},
			TutorialCameraSetZoom {Zoom = 7},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 129},
			PlayerHasBuilding  {BuildingId = Building.RTS.RealmFarm, OnlyCompleted = false, Amount = 1},
		},
		Actions =
		{
			ObjectVanish	{Tag = "DR_TutorialEffect08"},
			TutorialTaskSetSolved {Take = 129},
			TutorialTaskTextShow {TextTag = "Tutorial130"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 130},
			PlayerHasUnitAmount	{UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 130},
			TutorialInfoTextShow {TextTag = "Tutorial131"},
			TutorialTaskTextShow {TextTag = "Tutorial132"},
		},
		GotoState = "Block35",
	},
}
-------------------------------------------------------------------------------------------
-- Groups and combat shortcuts
-------------------------------------------------------------------------------------------
State
{
	StateName = "Block35",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 132},
			PlayerUnitIsInGroup {Group = 0, UnitId = Unit.RTS.RealmSoldier, Amount = 1},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 132},
			TutorialTaskTextShow {TextTag = "Tutorial133"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 133},
			OR
			{
				PlayerUnitIsInGroup {Group = 1, UnitId = Unit.RTS.RealmSoldier, Amount = 1},
				PlayerUnitIsInGroup {Group = 2, UnitId = Unit.RTS.RealmSoldier, Amount = 1},
				PlayerUnitIsInGroup {Group = 3, UnitId = Unit.RTS.RealmSoldier, Amount = 1},
				PlayerUnitIsInGroup {Group = 4, UnitId = Unit.RTS.RealmSoldier, Amount = 1},
				PlayerUnitIsInGroup {Group = 5, UnitId = Unit.RTS.RealmSoldier, Amount = 1},
				PlayerUnitIsInGroup {Group = 6, UnitId = Unit.RTS.RealmSoldier, Amount = 1},
				PlayerUnitIsInGroup {Group = 7, UnitId = Unit.RTS.RealmSoldier, Amount = 1},
				PlayerUnitIsInGroup {Group = 8, UnitId = Unit.RTS.RealmSoldier, Amount = 1},
				PlayerUnitIsInGroup {Group = 9, UnitId = Unit.RTS.RealmSoldier, Amount = 1},
				PlayerUnitIsInGroup {Group = 10, UnitId = Unit.RTS.RealmSoldier, Amount = 1},
			}
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 133},
			TutorialInfoTextShow {TextTag = "Tutorial134"},
			TutorialInfoTextShow {TextTag = "Tutorial135"},
			TutorialTaskTextShow {TextTag = "Tutorial136"},
		},
	},
	OnOneTimeEvent
	{
		GotoState = "TutorialEnd",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 136},
			OR
			{
				PlayerUnitIsInGroup {Group = 1, UnitId = Unit.RTS.RealmCrossbowman, Amount = 1},
				PlayerUnitIsInGroup {Group = 2, UnitId = Unit.RTS.RealmCrossbowman, Amount = 1},
				PlayerUnitIsInGroup {Group = 3, UnitId = Unit.RTS.RealmCrossbowman, Amount = 1},
				PlayerUnitIsInGroup {Group = 4, UnitId = Unit.RTS.RealmCrossbowman, Amount = 1},
				PlayerUnitIsInGroup {Group = 5, UnitId = Unit.RTS.RealmCrossbowman, Amount = 1},
				PlayerUnitIsInGroup {Group = 6, UnitId = Unit.RTS.RealmCrossbowman, Amount = 1},
				PlayerUnitIsInGroup {Group = 7, UnitId = Unit.RTS.RealmCrossbowman, Amount = 1},
				PlayerUnitIsInGroup {Group = 8, UnitId = Unit.RTS.RealmCrossbowman, Amount = 1},
				PlayerUnitIsInGroup {Group = 9, UnitId = Unit.RTS.RealmCrossbowman, Amount = 1},
				PlayerUnitIsInGroup {Group = 10, UnitId = Unit.RTS.RealmCrossbowman, Amount = 1},
			}
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 136},
			TutorialInfoTextShow {TextTag = "Tutorial139"},
			TutorialInfoTextShow {TextTag = "Tutorial140"},
			TutorialInfoTextShow {TextTag = "Tutorial143"},
			MapFlagSetTrue {Name = "mf_P500_TutorialOver"},
		},
	},
}

-------------------------------------------------------------------------------------------
-- Tutorial ENDE
-------------------------------------------------------------------------------------------
State	{StateName = "TutorialEnd"}