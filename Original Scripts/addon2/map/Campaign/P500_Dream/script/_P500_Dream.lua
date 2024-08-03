
--local MinimapMarker = 1
local buttonsize = 43

State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
	Conditions = 
		{
				GameIsUnBlocked{},
		},
		Actions =
		{
			
			TutorialUIPointerHide	{},
			MapFlagSetTrue {Name = "mf_P500_StartArriveCS"},
			
			--EffectStart	{Tag = "DR_Drakness_Effect_Rock", File = "Effect_Building_Darkness"},
			--EffectStart	{Tag = "DR_Drakness_Effect_Rock2", File = "Effect_Building_Darkness"},
			--EffectStart	{Tag = "DR_Drakness_Effect_Rock3", File = "Effect_Building_Darkness"},
			ObjectSpawnToEntity	{ObjectId = 2581, TargetTag = "DR_Darkness_Effect_Pos", Direction = 0, Tag = "DR_Darkness_Effect_Rock"},
			ObjectSpawnToEntity	{ObjectId = 2581, TargetTag = "DR_Darkness_Effect_Pos2", Direction = 0, Tag = "DR_Darkness_Effect_Rock2"},
			ObjectSpawnToEntity	{ObjectId = 2581, TargetTag = "DR_Drakness_Effect_Pos3", Direction = 0, Tag = "DR_Darkness_Effect_Rock3"},
			
		},
	},
			
		-- INIT SETUP
		OnOneTimeEvent
		{
		Conditions =
		{
			
		},
		Actions = 
		{
			--WeatherSetForever	{File = "litAtmo_P500_dream", FadeDuration = 0},
			--WeatherSetForever	{File = "litAtmo_P500_dream_2", FadeDuration = 0},
			WeatherSetForever	{File = "litAtmo_P500_dream_red", FadeDuration = 0},
			--WeatherSetForever	{File = "litAtmo_P500_dream_green", FadeDuration = 0},
			--WeatherSetForever	{File = "litAtmo_P500_dream_blue", FadeDuration = 0},
			
			MapFlagSetTrue {Name = "mf_P500_GuardGroup1Live"},
			
			FigureAnimPlayLooped	{Tag = "grunt", File = "base/gfx/figures/npc/figure_dwarf_worker_build.ska"},
			
			BuildingAbilityAdd {Tag = "DR_Tower1", AbilityId = Ability.Immortal },
			BuildingAbilityAdd {Tag = "DR_Tower2", AbilityId = Ability.Immortal },
			
			FigureAbilityAdd {Tag = "Commander_Garret", AbilityId = Ability.Immortal },
			FigureAbilityAdd {Tag = "DR_Antara", AbilityId = Ability.Immortal },			
			FigureAbilityAdd {Tag = "DR_TownGuard1", AbilityId = Ability.Immortal },			
			FigureAbilityAdd {Tag = "DR_TownGuard2", AbilityId = Ability.Immortal },	
			FigureAbilityAdd {Tag = "DR_Garret_Soldiers_01", AbilityId = Ability.Immortal },	
			FigureAbilityAdd {Tag = "DR_Garret_Soldiers_02", AbilityId = Ability.Immortal },	
			FigureAbilityAdd {Tag = "DR_Garret_Soldiers_03", AbilityId = Ability.Immortal },	
			FigureAbilityAdd {Tag = "DR_Garret_Soldiers_04", AbilityId = Ability.Immortal },
			FigureAbilityAdd {Tag = "Grunt", AbilityId = Ability.Immortal },	
			FigureAbilityAdd {Tag = "DR_GateGuard", AbilityId = Ability.Immortal },	
			FigureAbilityAdd {Tag = "DR_GateGuard2", AbilityId = Ability.Immortal },	
			FigureAbilityAdd {Tag = "DR_GateGuard3", AbilityId = Ability.Immortal },	
			
			FigureVanish	{Tag = "DR_BridgeWarrior1_Pos"},
			
			GateSetClosed	{Tag = "DR_TutoGate01"},
			LeverSetOff	{Tag = "DR_TutoLever01"},
			LeverSetDisabled	{Tag = "DR_TutoLever01"},
			
			GateSetClosed	{Tag = "DR_BridgeGate"},
			GateSetClosed	{Tag = "DR_EnemyGate"},
			GateSetClosed	{Tag = "DR_TownGate1"},
			
			FigureLootItemEquipmentAdd	{Tag = "DR_DragonMaster1", DropChance = 100, ItemId = 683},	
			FigureLootItemEquipmentAdd	{Tag = "DR_DragonMaster2", DropChance = 100, ItemId = 615},
			FigureLootItemEquipmentAdd	{Tag = "DR_DragonMaster2", DropChance = 100, ItemId = 326},
			
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P500_EndArriveCS"},
			MapFlagIsFalse {Name = "mf_P500_TutorialRequested"},
		},
		Actions = 
		{
			-- CameraSet	{X = 472.11, Y = 57.67 , Z = 637.99, LookAtX = 445.83 , LookAtY = 36.01, LookAtZ = 649.64},
			TutorialCameraCenterOnEntity	{Tag = "pl_Humanvatar"},
			TutorialCameraSetZoom	{Zoom = 1},
			FigureWalk	{Tag = "DR_Antara", X = 434, Y = 656 },
			--FigureFollowEntity	{Tag = "DR_Antara", TargetTag = "pl_HumanAvatar"},
			MapFlagSetTrue	{Name = "mf_P500_FirstQuestStart"},
			LeverSetEnabled	{Tag = "DR_TutoLever01"},	
		},
	};
	
	OnOneTimeLeverEvent
	{
		Lever = "DR_TutoLever01",
		
		OnConditions =
		{
			MapFlagIsTrue {Name = "mf_P500_EndArriveCS"},
			OR	
			{
				MapFlagIsTrue	{Name = "mf_P500_TutorialLeverOnRequest"},
				MapFlagIsFalse {Name = "mf_P500_TutorialRequested"},
			},
		},
		Actions =
		{
			GateSetOpen	{Tag = "DR_TutoGate01"},
			LeverSetDisabled	{Tag = "DR_TutoLever01"},
			MapFlagSetTrue	{Name = "mf_P500_GateOpened"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P500_GateOpened"},
			MapFlagIsFalse {Name = "mf_P500_TutorialRequested"},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "default", Amount = 1000},
			MapFlagSetTrue	{Name = "mf_P500_AntaraJoinRequest"},
			TutorialInfoTextShow {TextTag = "Tutorial35"},
		},
	};
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P500_AntaraJoinRequest"},
		},
		Actions = 
		{
			FigureVanish	{Tag = "DR_Antara"},
			PlayerHeroAdd	{ HeroId = 189 },
			FigureHeroSpawn	{Tag = "HeroAntara", X = 434, Y = 656,  Direction = 180},
			MapFlagSetTrue	{Name = "mf_P500_AntaraJoined"},
		},
	};
	
	-- First enemy and cutscene
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR	
			{
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "DR_AttackCutsceneStart", Range = 10},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroAntara", TargetTag = "DR_AttackCutsceneStart", Range = 10},
				--FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 10, X = 418, Y = 660},
				--FigureIsInRange	{Tag = "pl_HumanHeroAntara", Range = 10, X = 418, Y = 660},
			},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P500_StartAttackCS"},
			FigureNpcSpawn	{Tag = "DR_DWarrior01", Level = 7, UnitId = 1655, X = 402.636, Y = 662.283,  Team = "tm_Team1"},
			FigureNpcSpawn	{Tag = "DR_DWarrior02", Level = 7, UnitId = 1655, X = 407, Y = 665,  Team = "tm_Team1"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P500_EndAttackCS"},
		},
		Actions = 
		{
			FigureHealthSet	{Tag = "DR_DWarrior01", Percent = 80},
			FigureHealthSet	{Tag = "DR_DWarrior02", Percent = 80},
			-- FigureHealthSubtract	{Tag = "pl_HumanHeroAntara", Percent = 120},
			FigureKill	{Tag = "pl_HumanHeroAntara"},
			
			ObjectVanish	{Tag = "DR_Eye1"},
			ObjectVanish	{Tag = "DR_Eye1_Fire1"},
			ObjectVanish	{Tag = "DR_Eye1_Fire2"},
			ObjectVanish	{Tag = "DR_Eye1_Light"},
			ObjectVanish	{Tag = "DR_Eye1_Smoke"},
		},
	};
	
	-- Fisrt loot obejct spawn to the road /tuto mode off
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P500_EndAttackCS"},
			MapFlagIsFalse {Name = "mf_P500_TutorialRequested"},
			FigureIsDead	{Tag = "DR_DWarrior01"},
			FigureIsDead	{Tag = "DR_DWarrior02"},
		},
		Actions = 
		{
		  --ObjectSpawnToEntity	{ObjectId = 1272, TargetTag = "CS_03_DR_DeadWarrior2", Direction = 0, Tag = "DR_FirstLoot"},
		  --ObjectSpawn	{ObjectId = 867 , X = 419 , Y = 660 , Direction = 0, Tag = "DR_FirstLoot"},
		  ObjectSpawn	{ObjectId = 11 , X = 420 , Y = 658 , Direction = 0, Tag = "DR_FirstLoot"},
		  FigureLootItemEquipmentAdd	{Tag = "DR_FirstLoot", DropChance = 100, ItemId = 1282},
			FigureLootItemEquipmentAdd	{Tag = "DR_FirstLoot", DropChance = 100, ItemId = 490},
		},
	};
	
	-- Fisrt loot obejct spawn to the road /tuto mode on
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P500_EndAttackCS"},
			MapFlagIsTrue {Name = "mf_P500_TutorialRequested"},
			FigureIsDead	{Tag = "DR_DWarrior01"},
			FigureIsDead	{Tag = "DR_DWarrior02"},
		},
		Actions = 
		{
		  ObjectSpawn	{ObjectId = 11 , X = 420 , Y = 658 , Direction = 0, Tag = "DR_FirstLoot"},
		},
	};
	
	-- Demon (CS03) cutscene start
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P500_EndAttackCS"},
			FigureIsDead	{Tag = "DR_DWarrior01"},
			FigureIsDead	{Tag = "DR_DWarrior02"},
			FigureIsAlive {Tag = "pl_HumanHeroAntara"},
			OR	
			{
				MapFlagIsTrue {Name = "mf_P500_ResurrectTutorialEnd"},	
				MapFlagIsFalse {Name = "mf_P500_TutorialRequested"},
			},
		},
		Actions = 
		{
		  MapTimerStart	{Name = "mt_P500_DemonCutsceneTimer"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P500_DemonCutsceneTimer", Seconds = 3},
		},
		Actions = 
		{
		  MapFlagSetTrue {Name = "mf_P500_StartDemonCS"},
		  MapTimerStop	{Name = "mt_P500_DemonCutsceneTimer"},
		},
	};
	
	-- Demon custcene end - loot equip add /tuto mode on
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P500_EndDemonCS"},
			MapFlagIsTrue {Name = "mf_P500_TutorialRequested"},
		},
		Actions = 
		{
		  
			FigureLootItemEquipmentAdd	{Tag = "DR_FirstLoot", DropChance = 100, ItemId = 1282},
			FigureLootItemEquipmentAdd	{Tag = "DR_FirstLoot", DropChance = 100, ItemId = 490},
		},
	};
	
	-- first quest done, reached the village, wait for outcry if needed
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "DR_TO_VILLAGE"},
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			FigureIsAlive	{Tag = "pl_HumanHeroAntara"},
			OR	
			{
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "DR_ReachVillage", Range = 12},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroAntara", TargetTag = "DR_ReachVillage", Range = 12},
				--FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 12, X = 392, Y = 630},
				--FigureIsInRange	{Tag = "pl_HumanHeroAntara", Range = 12, X = 392, Y = 630},
			},
		},
		Actions = 
		{
		  --MapFlagSetTrue {Name = "mf_P500_GarrettQuestStart"},
		  --DialogSetEnabled	{Tag = "Commander_Garret"},
		  -- beacause waiting for outcry end, see above
		  MapFlagSetTrue	{Name = "mf_P500_PlayerReachedVillage"},
		},
	};
	
	-- Controloutcrty end and player reached the village
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P500_ControlOutcryEnd"},
			MapFlagIsTrue	{Name = "mf_P500_PlayerReachedVillage"},
		},
		Actions = 
		{
		  MapFlagSetTrue {Name = "mf_P500_GarrettQuestStart"},
		  MapTimerStart	{Name = "mt_P500_GarretDialogDelayTimer"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P500_GarretDialogDelayTimer", Seconds = 15},
		},
		Actions = 
		{
		  DialogSetEnabled	{Tag = "Commander_Garret"},
		},
	};
	
	-- player reached Garrett, custcene started
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P500_GarretDialogDelayTimer", Seconds = 15},
			QuestIsActive {Quest = "DR_TALK_TO_GARRETT"},
			OR	
			{
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "Commander_Garret", Range = 6},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroAntara", TargetTag = "Commander_Garret", Range = 6},
			},
		},
		Actions = 
		{
		  MapFlagSetTrue {Name = "mf_P500_StartGarrettCS"},
		  DialogSetDisabled	{Tag = "Commander_Garret"},
		  MapTimerStop	{Name = "mt_P500_GarretDialogDelayTimer"},
		},
	};
	
	-- Garrett custcene end
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P500_EndGarrettCS"},
			OR
			{
				MapFlagIsFalse	{Name = "mf_P500_TutorialRequested"},
				AND
				{
					MapFlagIsTrue	{Name = "mf_P500_SpellTutoFinished"},
					MapFlagIsTrue	{Name = "mf_P500_TutorialRequested"},
				},
			},
		},
		Actions = 
		{
		  MapFlagSetTrue {Name = "mf_P500_SuppliesQuestStart"},
		},
	};
	
	-- Eye2 vanish
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P500_EndGarrettCS"},
		},
		Actions = 
		{
		  ObjectVanish	{Tag = "DR_Eye2"},
			ObjectVanish	{Tag = "DR_Eye2_Fire1"},
			ObjectVanish	{Tag = "DR_Eye2_Fire2"},
			ObjectVanish	{Tag = "DR_Eye2_Light"},
			ObjectVanish	{Tag = "DR_Eye2_Smoke"},
		},
	};
	
	-- supplies picked up
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityIsNotExisting	{Tag = "DR_Chest01"},
			EntityIsNotExisting	{Tag = "DR_Chest02"},
			EntityIsNotExisting	{Tag = "DR_Chest03"},
		},
		Actions = 
		{
		  MapFlagSetTrue {Name = "mf_P500_SuppliesPickedUp"},
		},
	};
	
	-- village block/gate will open, when conditions are ok
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "DR_DEFENSE"},
			OR
				{
						MapFlagIsFalse {Name = "mf_P500_TutorialRequested"},
						AND	
						{
							MapFlagIsTrue {Name = "mf_P500_TutorialRequested"},
							MapFlagIsTrue	{Name = "mf_P500_CameraTutoFinished"},
						},	
				},
			
		},
		Actions = 
		{
		  ObjectVanish	{Tag = "DR_VillageBlock"},
		},
	};
	
	-- guard open the way, when player is arriving there (defense/outpost quest active)
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "DR_DEFENSE"},
			OR
				{
						MapFlagIsFalse {Name = "mf_P500_TutorialRequested"},
						AND	
						{
							MapFlagIsTrue {Name = "mf_P500_TutorialRequested"},
							MapFlagIsTrue	{Name = "mf_P500_CameraTutoFinished"},
						},	
				},
			OR
			{
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "DR_BlockOpen", Range = 6},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroAntara", TargetTag = "DR_BlockOpen", Range = 6},
			},
		},
		Actions = 
		{
		  MapTimerStart	{Name = "mt_P500_GuardWalkDelayTimer"},
		  --ObjectVanish	{Tag = "DR_VillageBlock"},
		},
	};
	
	-- guard delayed start
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P500_GuardWalkDelayTimer", Seconds = 1},
		},
		Actions = 
		{
		  FigureWalk	{Tag = "DR_GateGuard", X = 420, Y = 624.4 },
		  MapTimerStop	{Name = "mt_P500_GuardWalkDelayTimer"},
		  MapFlagSetTrue {Name = "mf_P500_VillageGateOpened"},
		},
	};
	
	
	-- village guard look at right direction
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P500_VillageGateOpened"},
			FigureIsIdle	{Tag = "DR_GateGuard"},
		},
		Actions = 
		{
		  FigureLookAtDirection	{Tag = "DR_GateGuard", Direction = 270},
		},
	};
	
	-- Wavestop outcry start
	OnOneTimeEvent
	{
		Conditions =
		{
			OR	
				{
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "DR_OutcryStart", Range = 5},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroAntara", TargetTag = "DR_OutcryStart", Range = 5},
				},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "WaveStopCry1", Tag = "pl_HumanHeroAntara"},
			FigureOutcry	{TextTag = "WaveStopCry2", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "WaveStopCry3", Tag = "pl_HumanHeroAntara"},
			FigureOutcry	{TextTag = "WaveStopCry4", Tag = "pl_HumanAvatar"},
			MapTimerStart	{Name = "mt_P500_RoadAttackTimer"},
		}
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P500_RoadAttackTimer", Seconds = 5},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P500_RoadAttackTimer"},
			FigureFollowEntity	{Tag = "DR_VillageDefender1", TargetTag = "pl_HumanAvatar"},
			FigureFollowEntity	{Tag = "DR_VillageDefender2", TargetTag = "pl_HumanAvatar"},
			FigureFollowEntity	{Tag = "DR_VillageDefender3", TargetTag = "pl_HumanAvatar"},	
		}
	},
	
	-- Guard attack
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR	
				{
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "DR_RoadDemon3", Range = 20},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroAntara", TargetTag = "DR_RoadDemon3", Range = 20},
				FigureHasNotHealth	{Tag = "DR_RoadDemon1", Percent = 95},
				FigureHasNotHealth	{Tag = "DR_RoadDemon2", Percent = 95},
				FigureHasNotHealth	{Tag = "DR_RoadDemon3", Percent = 95},
				},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P500_RoadAttackTimer"},
			FigureTeamTransfer	{Tag = "DR_RoadDemon1", Team = "tm_Team2"},
			FigureTeamTransfer	{Tag = "DR_RoadDemon2", Team = "tm_Team2"},
			FigureTeamTransfer	{Tag = "DR_RoadDemon3", Team = "tm_Team2"},
			
			FigureRunToEntity	{Tag = "DR_VillageDefender1", TargetTag = "DR_Darkness_Effect_Pos"},
			FigureRunToEntity	{Tag = "DR_VillageDefender2", TargetTag = "DR_Darkness_Effect_Pos"},
			FigureRunToEntity	{Tag = "DR_VillageDefender3", TargetTag = "DR_Darkness_Effect_Pos"},
		}
	},
	
	-- custcene start
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "DR_RoadDemon1"},
			FigureIsDead	{Tag = "DR_RoadDemon2"},
			FigureIsDead	{Tag = "DR_RoadDemon3"},
			
		},
		Actions =
		{
			FigureStop	{Tag = "DR_VillageDefender1"},
			FigureStop	{Tag = "DR_VillageDefender2"},
			FigureStop	{Tag = "DR_VillageDefender3"},
			MapFlagSetTrue	{Name = "mf_P500_RoadDemonsDied"},
			MapFlagSetTrue {Name = "mf_P500_StartVictoryCS"},
		}
	},
	
	-- nightsong and g master custcene teleport effect
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P500_NightSongTeleport"},
		},
		Actions =
		{
			MapTimerStart {Name = "mt_ShadowsongEffectTimer"},
			EffectStart	{Tag = "CS_05_DR_NightSong", File = "Effect_Spawn_Unit"},
			EffectStart	{Tag = "CS_05_DR_Twiddle", File = "Effect_Spawn_Unit"},	
		}
	},
	-- nightsong cutscene - vanish
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_ShadowsongEffectTimer", Seconds = 2},
		},
		Actions =
		{
			FigureVanish {Tag = "CS_05_DR_NightSong"},
			FigureVanish {Tag = "CS_05_DR_Twiddle"},
			MapTimerStop {Name = "mt_ShadowsongEffectTimer"},
		},
	},
	
	-- cutscene end
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P500_EndVictoryCS"},
		},
		Actions =
		{
			ObjectVanish	{Tag = "DR_Road_Wall1"},
			ObjectVanish	{Tag = "DR_Road_Wall2"},
			ObjectVanish	{Tag = "DR_Eye3"},
			ObjectVanish	{Tag = "DR_Eye3_Fire1"},
			ObjectVanish	{Tag = "DR_Eye3_Fire2"},
			ObjectVanish	{Tag = "DR_Eye3_Light"},
			ObjectVanish	{Tag = "DR_Eye3_Smoke"},
			EffectStop	{Tag = "DR_Drakness_Effect_Rock"},
			EffectStop	{Tag = "DR_Drakness_Effect_Rock2"},
			FigureWalk	{Tag = "DR_VillageDefender1", X = 431.5, Y = 616.447 },
			FigureWalk	{Tag = "DR_VillageDefender2", X = 433.026, Y = 618.006 },
			FigureWalk	{Tag = "DR_VillageDefender3", X = 432.871, Y = 615.335 },
			AvatarXPGive	{Player = "default", Amount = 500},
		}
	},
	
	-- Bridge warrior generating
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P500_EndVictoryCS"},
		},
		Actions =
		{
			 NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "DR_BridgeWarrior1", Level = 5, UnitId = 1655, X = 496.47, Y = 529.319, Team = "tm_Team2"},},
			 FigureLookAtDirection {Tag = "DR_BridgeWarrior1", Direction = 180},
			 FigureLootItemEquipmentAdd	{Tag = "DR_BridgeWarrior1", DropChance = 100, ItemId = 631},
			 MapFlagSetTrue	{Name = "mf_P500_BridgeWarriorCreated"},
		}
	},
	
	
	-- 2 dead demon warrior body vanish
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR	
				{
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "DR_BridgeMarker", Range = 8},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroAntara", TargetTag = "DR_BridgeMarker", Range = 8},
				},
		},
		Actions = 
		{
			ObjectVanish	{Tag = "CS_05_DR_DeadEnemy1"},
			ObjectVanish	{Tag = "CS_05_DR_DeadEnemy2"},
		},
	};
	
	-- fow off hack bridge
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
			FogOfWarRevealAtEntity	{FogOfWarId = 10, Tag = "DR_BridgeWarrior1", Range = 10, Height = 35},
		},
	};
	
	-- fow on/back
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P500_BridgeWarriorCreated"},
			FigureIsDead	{Tag = "DR_BridgeWarrior1"},
		},
		Actions = 
		{
			FogOfWarCloak	{FogOfWarId = 10},
		},
	};
	
	-- gate set open if tutorial not active
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse {Name = "mf_P500_TutorialRequested"},
			MapFlagIsTrue	{Name = "mf_P500_BridgeWarriorCreated"},
			OR	
				{
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "DR_BridgeMarker", Range = 8},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroAntara", TargetTag = "DR_BridgeMarker", Range = 8},
				},
		},
		Actions = 
		{
			GateSetOpen	{Tag = "DR_BridgeGate"},
			MapFlagSetTrue	{Name = "mf_P500_BridgeOpened"},
		},
	};
	
	-- Dino start
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR	
				{
				FigureIsInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "DR_Dino_Starter", Range = 5},
				FigureIsInEntityRange	{Tag = "pl_HumanHeroAntara", TargetTag = "DR_Dino_Starter", Range = 5},
				},
		},
		Actions = 
		{
			FigureWalkToEntity	{Tag = "DR_Dino1", TargetTag = "DR_Dino_Target"},
			FigureWalkToEntity	{Tag = "DR_Dino2", TargetTag = "DR_Dino_Target"},
		},
	};
	
	-- Dino turn to player
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR	
				{
				FigureIsIdle	{Tag = "DR_Dino1"},
				FigureIsIdle	{Tag = "DR_Dino2"},
				},
		},
		Actions = 
		{
			FigureDirectionSet	{Tag = "DR_Dino1", Direction = 150},
			FigureDirectionSet	{Tag = "DR_Dino2", Direction = 150},
			
		},
	};
	
	-- when player reached the outpost --> gets playerkit
	OnOneTimeEvent
	{
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
			PlayerKitTransfer	{Player = "default", PlayerKit = "pk_Outpost"},
			MapFlagSetTrue {Name = "mf_P500_HQAdded"},
			MapTimerStart	{Name = "mt_P500_HqAddDelayTimer"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_P500_HqAddDelayTimer", Seconds = 1},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P500_HqAddDelayTimer"},
			MapFlagSetTrue {Name = "mf_P500_HQAdded"},
		},
	},
	
	
	-- if tuto mode off, attack the player after created 5 soldiers
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_P500_TutorialRequested"},
			PlayerHasUnitAmount {UnitId = Unit.RTS.RealmSoldier, Amount = 5},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "DR_BaseAttacker1", Level = 6, UnitId = 1655, X = 340, Y = 299, Team = "tm_Team2"},
			FigureNpcSpawn	{Tag = "DR_BaseAttacker2", Level = 6, UnitId = 1655, X = 337, Y = 301, Team = "tm_Team2"},
			FigureNpcSpawn	{Tag = "DR_BaseAttacker3", Level = 6, UnitId = 1658, X = 337, Y = 301, Team = "tm_Team2"},
			
			FigureRunToEntity	{Tag = "DR_BaseAttacker1", TargetTag = "DR_QMarker_Outpost"},
			FigureRunToEntity	{Tag = "DR_BaseAttacker2", TargetTag = "DR_QMarker_Outpost"},
			FigureRunToEntity	{Tag = "DR_BaseAttacker3", TargetTag = "DR_QMarker_Outpost"},
			
		},
	},
	
	
	-- if tuto mode off, attack the player after created 5 crossbowman
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_P500_TutorialRequested"},
			PlayerHasUnitAmount	{UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "DR_BaseAttacker4", Level = 6, UnitId = 1655, X = 340, Y = 299, Team = "tm_Team2"},
			FigureNpcSpawn	{Tag = "DR_BaseAttacker5", Level = 6, UnitId = 1658, X = 337, Y = 301, Team = "tm_Team2"},
			FigureNpcSpawn	{Tag = "DR_BaseAttacker6", Level = 6, UnitId = 1723, X = 337, Y = 301, Team = "tm_Team2"},
			
			FigureRunToEntity	{Tag = "DR_BaseAttacker4", TargetTag = "DR_QMarker_Outpost"},
			FigureRunToEntity	{Tag = "DR_BaseAttacker5", TargetTag = "DR_QMarker_Outpost"},
			FigureRunToEntity	{Tag = "DR_BaseAttacker6", TargetTag = "DR_QMarker_Outpost"},
		},
	},
	
	
	-- when tower destroyed - extra dark effect start 
	OnOneTimeEvent
	{
		Conditions = 
		{
			BuildingIsDead	{Tag = "DR_Tower1"},
		},
		Actions =
		{
			EffectStart	{Tag = "DR_Drakness_Effect_Rock6", File = "Effect_Building_Darkness"},
			
		},
	},
	
	-- when player completed the last quest, we give more time to quest complete text and level up
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P500_LastQuestCompleted"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_P500_EndCutsceneStartTimer"},
		},
	},
	
	-- before last cutscene enemy set to neutral
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P500_EndCutsceneStartTimer", Seconds = 12.5},
		},
		Actions =
		{
			FigureTeamTransfer	{Tag = "DR_TowerGuard1", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "DR_TowerGuard2", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "DR_TowerGuard3", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "DR_TowerGuard4", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "DR_TowerGuard5", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "DR_Scout1", Team = "tm_Neutral"},
			FigureTeamTransfer	{Tag = "DR_Scout2", Team = "tm_Neutral"},
		},
	},
	
	-- last nightsong cutscene start after time
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P500_EndCutsceneStartTimer", Seconds = 13},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P500_EndCutsceneStartTimer"},
			MapFlagSetTrue {Name = "mf_P500_StartNightsongCS"},
		},
	},
	
	-- dream map end, go to next map
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P500_EndNightsongCS"},
		},
		Actions =
		{
			PlayerMapTravelAddon2	{Map = "Campaign/P501_Iron_Fields", TargetTag = "start"},
		},
	},
	
	-------------------------------------------------
	-- TOWER DEFENDERS
	-------------------------------------------------
	
	-- Scout escape
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				FigureHasNotHealth	{Tag = "DR_Scout1", Percent = 50},
				FigureHasNotHealth	{Tag = "DR_Scout2", Percent = 50},
			},
		},
		Actions =
		{
			FigureForcedRunToEntity	{Tag = "DR_Scout1", TargetTag = "DR_Tower2"},
			FigureForcedRunToEntity	{Tag = "DR_Scout2", TargetTag = "DR_Tower2"},
		},
	},
	
	-- Scouts are back
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse {Name = "mf_P500_GuardGroup1Live"},
		},
		Actions =
		{
			FigureForcedRunToEntity	{Tag = "DR_Scout1", TargetTag = "DR_Tower1"},
			FigureForcedRunToEntity	{Tag = "DR_Scout2", TargetTag = "DR_Tower1"},
		},
	},
	
	-- Group1 flag set on dead
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P500_GuardGroup1Live"},
			MapFlagIsTrue	{Name = "mf_P500_BridgeWarriorCreated"},
			FigureIsDead	{Tag = "DR_TowerGuard1"},
			FigureIsDead	{Tag = "DR_TowerGuard2"},
			FigureIsDead	{Tag = "DR_TowerGuard3"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P500_GuardGroup1Live"},
		},
	},
	
	-- Group2 flag set on dead
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P500_GuardGroup2Live"},
			MapFlagIsTrue	{Name = "mf_P500_BridgeWarriorCreated"},
			FigureIsDead	{Tag = "DR_TowerGuard4"},
			FigureIsDead	{Tag = "DR_TowerGuard5"},
			
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P500_GuardGroup2Live"},
		},
	},
	
	-- Tower Reinforce 1x
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsFalse {Name = "mf_P500_GuardGroup2Live"},
			MapFlagIsTrue	{Name = "mf_P500_BridgeWarriorCreated"},
			OR
			{
				FigureHasNotHealth	{Tag = "DR_TowerGuard1", Percent = 50},
				FigureHasNotHealth	{Tag = "DR_TowerGuard2", Percent = 50},
				FigureHasNotHealth	{Tag = "DR_TowerGuard3", Percent = 50},
			},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P500_GuardGroup2Live"},
			FigureNpcSpawn	{Tag = "DR_TowerGuard4", Level = 6, UnitId = 1721, X = 340, Y = 299, Team = "tm_Team2"},
			FigureNpcSpawn	{Tag = "DR_TowerGuard5", Level = 6, UnitId = 1723, X = 337, Y = 301, Team = "tm_Team2"},
			
			
			FigureRun	{Tag = "DR_TowerGuard4", X = 420 , Y = 371},
			FigureRun	{Tag = "DR_TowerGuard5", X = 422 , Y = 371},
			
		},
	},
	
	-- Tower Reinforce 2x
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsFalse {Name = "mf_P500_GuardGroup1Live"},
			MapFlagIsTrue	{Name = "mf_P500_BridgeWarriorCreated"},
			OR
			{
				FigureHasNotHealth	{Tag = "DR_TowerGuard4", Percent = 50},
				FigureHasNotHealth	{Tag = "DR_TowerGuard5", Percent = 50},
			},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P500_GuardGroup1Live"},
			FigureNpcSpawn	{Tag = "DR_TowerGuard1", Level = 6, UnitId = 1655, X = 340, Y = 299, Team = "tm_Team2"},
			FigureNpcSpawn	{Tag = "DR_TowerGuard2", Level = 6, UnitId = 1658, X = 337, Y = 301, Team = "tm_Team2"},
			FigureNpcSpawn	{Tag = "DR_TowerGuard3", Level = 6, UnitId = 1724, X = 336, Y = 301, Team = "tm_Team2"},
			
			FigureRun	{Tag = "DR_TowerGuard1", X = 420 , Y = 371},
			FigureRun	{Tag = "DR_TowerGuard2", X = 422 , Y = 371},
			FigureRun	{Tag = "DR_TowerGuard3", X = 420 , Y = 369},
		},
	},
	
	-----------------------------------------------------------------------
	-- Last Tower Defenders
	-----------------------------------------------------------------------
	OnEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "outpost_npc_01"},
			FigureIsDead	{Tag = "outpost_npc_02"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "outpost_npc_01", Level = 13, UnitId = 1655, X = 338.757, Y = 306.827, Team = "tm_Team2"},
			FigureDirectionSet	{Tag = "outpost_npc_01", Direction = 130},
			FigureNpcSpawn	{Tag = "outpost_npc_02", Level = 13, UnitId = 1658, X = 342.304, Y = 304.988, Team = "tm_Team2"},
			FigureDirectionSet	{Tag = "outpost_npc_02", Direction = 130},
			FigureLootItemGenericAdd	{Tag = "outpost_npc_02", DropChance = 100, Level = 10, Skill = 8},
		},
	},
	
	OnEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "outpost_npc_05"},
			FigureIsDead	{Tag = "outpost_npc_06"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "outpost_npc_05", Level = 13, UnitId = 1655, X = 346.615, Y = 298.057, Team = "tm_Team2"},
			FigureDirectionSet	{Tag = "outpost_npc_05", Direction = 130},
			FigureNpcSpawn	{Tag = "outpost_npc_06", Level = 13, UnitId = 1658, X = 344.664, Y = 302.256, Team = "tm_Team2"},
			FigureDirectionSet	{Tag = "outpost_npc_06", Direction = 130},
			FigureLootItemGenericAdd	{Tag = "outpost_npc_05", DropChance = 100, Level = 10, Skill = 77},
		},
	},
	
	------------------------------------------------------------------------
	-- Outcries
	------------------------------------------------------------------------
	
	-- Build outcry timer start after tutorial or after build quest done
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				AND
				{
					MapFlagIsTrue {Name = "mf_P500_TutorialOver"},
					MapFlagIsTrue	{Name = "mf_P500_TutorialRequested"},
					TutorialTextIsFinished	{Take = 143},
				},
				AND
				{
					QuestIsActive	{Player = "default", Quest = "DR_ATTACK"},
					MapFlagIsFalse	{Name = "mf_P500_TutorialRequested"},
				},
			},
			
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_P500_BuildOutcryStartTimer"},
		},
	},
	
	-- Build outcry
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P500_BuildOutcryStartTimer", Seconds = 15},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P500_BuildOutcryStartTimer"},
			FigureOutcry	{TextTag = "BuildCry1", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "BuildCry2", Tag = "pl_HumanHeroAntara"},
			--FigureOutcry	{TextTag = "BuildCry3", Tag = "pl_HumanAvatar"},
			--FigureOutcry	{TextTag = "BuildCry4", Tag = "pl_HumanHeroAntara"},
		},
	},
	
	-- control outcries timer start
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				FigureIsNotInEntityRange	{Tag = "pl_HumanAvatar", TargetTag = "DR_AttackCutsceneStart", Range = 5},
				FigureIsNotInEntityRange	{Tag = "pl_HumanHeroAntara", TargetTag = "DR_AttackCutsceneStart", Range = 5},
			},
			MapFlagIsTrue {Name = "mf_P500_EndDemonCS"},
			OR
			{
				MapFlagIsFalse	{Name = "mf_P500_TutorialRequested"},
				AND
				{
					MapFlagIsTrue	{Name = "mf_P500_EquipTutoEnd"},
					MapFlagIsTrue	{Name = "mf_P500_TutorialRequested"},
				},
			},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_P500_ControlOutcryStartTimer"},
		},
	},
	
	-- Control outcry start
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P500_ControlOutcryStartTimer", Seconds = 1},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "ControlCry1", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "ControlCry2", Tag = "pl_HumanHeroAntara"},
			--FigureOutcry	{TextTag = "ControlCry3", Tag = "pl_HumanAvatar"},
			--FigureOutcry	{TextTag = "ControlCry4", Tag = "pl_HumanHeroAntara"},
		},
	},
	
	-- control outcry end
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P500_ControlOutcryStartTimer", Seconds = 16},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P500_ControlOutcryStartTimer"},
			MapFlagSetTrue	{Name = "mf_P500_ControlOutcryEnd"},
		},
	},
	
	-- Supply outcries timer start
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P500_SuppliesQuestStart"},
		},
		Actions =
		{
			MapTimerStart	{Name = "mt_P500_SupplyOutcryStartTimer"},
		},
	},
	
	-- Supply outcry start
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P500_SupplyOutcryStartTimer", Seconds = 25},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P500_SupplyOutcryStartTimer"},
			FigureOutcry	{TextTag = "SupplyCry1", Tag = "pl_HumanHeroAntara"},
			FigureOutcry	{TextTag = "SupplyCry2", Tag = "pl_HumanAvatar"},
			FigureOutcry	{TextTag = "SupplyCry3", Tag = "pl_HumanHeroAntara"},
			FigureOutcry	{TextTag = "SupplyCry4", Tag = "pl_HumanAvatar"},
		},
	},
	
	-- extra game end conditions
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "DR_DEFENSE"},
			MapFlagIsTrue {Name = "mf_P500_HQAdded"},
			
			OR
				{
					PlayerHasNotBuilding	{Player = "default", BuildingId = Building.RTS.RealmHeadquarter , Amount = 1, OnlyCompleted = false},
					AND
					{
						PlayerHasNotUnitAmount {UnitId = Unit.RTS.RealmCraftsman, Amount = 1},
						PlayerHasNotResourceSilver	{Player = "default", Amount = 20},
					},
				},
			
		},
		Actions =
		{
			PlayerGameOver	{Player = "default", Tag = "default", LocaTag = "IGMenuGameOver_Title"}, 
		
		},
	},
	
};






