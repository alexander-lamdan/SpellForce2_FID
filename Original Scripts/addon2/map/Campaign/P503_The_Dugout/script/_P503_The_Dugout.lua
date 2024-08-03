State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			--DragonCallDisable{},
			--PlayerHeroAdd	{ HeroId =182 },
			--PlayerHeroAdd	{ HeroId =188 },
			--PlayerHeroAdd	{ HeroId = 189 },
			--PlayerHeroAdd	{ HeroId = 190},
			MapFigureLevelSet {},
			ShadowRenderDisable{},
			--PlayerHeroRemove	{ HeroId =183 },
			PlayerHeroRemove	{ Tag = "HeroPTwiddle"},
			--FigureHeroSpawnToEntity	{ Tag = "HeroSariel", TargetTag = "pl_HumanAvatar", Direction = 0},
			--FigureHeroSpawnToEntity	{ Tag = "HeroCaine", TargetTag = "pl_HumanAvatar", Direction = 0},
			--FigureHeroSpawnToEntity	{ Tag = "HeroIO", TargetTag = "pl_HumanAvatar", Direction = 0},
			--FigureHeroSpawnToEntity	{ Tag = "HeroAntara", TargetTag = "pl_HumanAvatar", Direction = 0},
			--QuestSetActive	{Quest = "RECOVER_ARTIFACT"},
			ObjectVanish	{Tag = "D_Godstone"},
			ObjectVanish	{Tag = "D_twiddle_device"}, 			
			ObjectVanish	{Tag = "light_godstone_01"},
			ObjectVanish	{Tag = "light_godstone_02"},
			ObjectVanish	{Tag = "light_godstone_03"},
			FigureVanish	{Tag = "D_spirit_spawn_01"},
			FigureVanish	{Tag = "D_spirit_spawn_02"},
			FigureVanish	{Tag = "D_spirit_spawn_03"},
			FigureVanish	{Tag = "D_spirit_spawn_04"},
			FigureVanish	{Tag = "D_spirit_spawn_05"},
			FigureVanish	{Tag = "D_spirit_spawn_06"},
			FigureVanish	{Tag = "D_spirit_01"},
			FigureVanish	{Tag = "D_spirit_02"},
			FigureVanish	{Tag = "D_spirit_03"},
			FigureVanish	{Tag = "D_spirit_04"},
			FigureVanish	{Tag = "D_spirit_05"},
			FigureAbilityAdd	{Tag = "D_spirit_child", AbilityId = Ability.Immortal},		
			LeverSetDisabled {Tag = "lever01"},
			LeverSetDisabled {Tag = "lever02"},
			LeverSetDisabled {Tag = "lever03"},
			FigureVanish	{Tag = "sarok_merchant"},
			ObjectVanish	{Tag = "dugout_exit"}, --vanish the portal 
			PlayerTravelDisable	{},
			
		},
	},
		
	OnOneTimeEvent
	{
		Conditions = 
		{
				FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Dugout_start", Range = 5 },
		},
		Actions = 
		{
				--FigureForceAttackEntity	{Tag = "Survivors_q1_01", TargetTag = "pl_HumanAvatar"},
				FigureForceAttackEntity	{Tag = "Survivors_q1_02", TargetTag = "pl_HumanAvatar"},
				FigureForceAttackEntity	{Tag = "Survivors_q1_03", TargetTag = "pl_HumanAvatar"},
				--FigureForceAttackEntity	{Tag = "Survivors_q1_04", TargetTag = "pl_HumanAvatar"},
				FigureForceAttackEntity	{Tag = "Survivors_q1_05", TargetTag = "pl_HumanAvatar"},
				FigureForceAttackEntity	{Tag = "Survivors_q1_06", TargetTag = "pl_HumanAvatar"},
				FigureForceAttackEntity	{Tag = "Survivors_q1_07", TargetTag = "pl_HumanAvatar"},			
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
			FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 17, X = 313, Y = 322 },
			FigureIsInRange	{Tag = "pl_HumanHeroIO", Range = 17, X = 313, Y = 322 },
			FigureIsInRange	{Tag = "pl_HumanHeroCaine", Range = 17, X = 313, Y = 322 },
			FigureIsInRange	{Tag = "pl_HumanHeroAntara", Range = 17, X = 313, Y = 322 },
			FigureIsInRange	{Tag = "pl_HumanHeroSariel", Range = 17, X = 313, Y = 322 },
			
			},
		},
		Actions = 
		{
			PlayerTravelEnable	{},			
		},
	},
		
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsAlive	{Tag = "xp_mob_08"},
			OR{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "trigger_01", Range = 8 },
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "trigger_01", Range = 8 },
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroSariel", TargetTag = "trigger_01", Range = 8 },
			},

		},
		Actions = 
		{
			FigureTeleportToEntity	{Tag = "witchking_01", TargetTag = "trigger_02"},
			FogOfWarRevealAtEntity	{FogOfWarId = default, Tag = "witchking_01", Range = 5 , Height = default},
			EffectStartAtEntityPosition	{Tag = "witchking_01", File = "Effect_Misc_DemonPortal"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			--FigureIsDead	{Tag = "Survivors_q1_01"},
			FigureIsDead	{Tag = "Survivors_q1_02"},
			FigureIsDead	{Tag = "Survivors_q1_03"},
			--FigureIsDead	{Tag = "Survivors_q1_04"},
			FigureIsDead	{Tag = "Survivors_q1_05"},
			FigureIsDead	{Tag = "Survivors_q1_06"},
			FigureIsDead	{Tag = "Survivors_q1_07"},			
		},
		Actions = 
		{
			AvatarXPGive	{Amount = 10000},
			MapFlagSetTrue	{Name = "mf_P503_NamelessDemonsKilled"},			
			FigureRunToEntity	{Tag = "Survivors_q1_08", TargetTag = "pl_HumanAvatar"},
			MapValueAdd	{Name = "mv_survivorcnt", Value = 1},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Survivors_q1_09"},
			FigureIsDead	{Tag = "Survivors_q1_10"},
			--FigureIsDead	{Tag = "Survivors_q1_11"},
			--FigureIsDead	{Tag = "Survivors_q1_12"},
			FigureIsDead	{Tag = "Survivors_q1_13"},
			FigureIsDead	{Tag = "Survivors_q1_14"},
			FigureIsDead	{Tag = "Survivors_q1_15"},			
			FigureIsDead	{Tag = "Survivors_q1_16"},
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Child7", Tag = "Survivors_q1_17"},
			AvatarXPGive	{Amount = 3000},
			FigureRunToEntity	{Tag = "Survivors_q1_17", TargetTag = "start"},
			MapValueAdd	{Name = "mv_survivorcnt", Value = 1},			
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Survivors_q1_18"},
			FigureIsDead	{Tag = "Survivors_q1_19"},
			FigureIsDead	{Tag = "Survivors_q1_20"},
			--FigureIsDead	{Tag = "Survivors_q1_21"},
			FigureIsDead	{Tag = "Survivors_q1_22"},
			FigureIsDead	{Tag = "Survivors_q1_23"},
			--FigureIsDead	{Tag = "Survivors_q1_24"},			
			
		},
		Actions = 
		{			
			FigureOutcry	{TextTag = "Child8", Tag = "Survivors_q1_25"},
			AvatarXPGive	{Amount = 3000},
			FigureRunToEntity	{Tag = "Survivors_q1_25", TargetTag = "start"},		
			MapValueAdd	{Name = "mv_survivorcnt", Value = 1},	
		},
	},

	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Survivors_q1_27"},
			--FigureIsDead	{Tag = "Survivors_q1_28"},
			FigureIsDead	{Tag = "Survivors_q1_29"},
			FigureIsDead	{Tag = "Survivors_q1_30"},
			--FigureIsDead	{Tag = "Survivors_q1_31"},
			FigureIsDead	{Tag = "Survivors_q1_32"},
			FigureIsDead	{Tag = "Survivors_q1_33"},			
			FigureIsDead	{Tag = "Survivors_q1_34"},			
			
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Child10", Tag = "Survivors_q1_35"},
			AvatarXPGive	{Amount = 3000},
			FigureRunToEntity	{Tag = "Survivors_q1_35", TargetTag = "start"},		
			MapValueAdd	{Name = "mv_survivorcnt", Value = 1},	
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			--FigureIsDead	{Tag = "Survivors_q1_36"},
			FigureIsDead	{Tag = "Survivors_q1_37"},
			FigureIsDead	{Tag = "Survivors_q1_38"},
			--FigureIsDead	{Tag = "Survivors_q1_39"},
			FigureIsDead	{Tag = "Survivors_q1_40"},
			FigureIsDead	{Tag = "Survivors_q1_41"},
			FigureIsDead	{Tag = "Survivors_q1_42"},			
			FigureIsDead	{Tag = "Survivors_q1_43"},			
			FigureIsDead	{Tag = "Survivors_q1_44"},			
			FigureIsDead	{Tag = "Survivors_q1_45"},			
			
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Child9", Tag = "Survivors_q1_46"},
			AvatarXPGive	{Amount = 3000},
			FigureRunToEntity	{Tag = "Survivors_q1_46", TargetTag = "start"},
			MapValueAdd	{Name = "mv_survivorcnt", Value = 1},			
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			--FigureIsDead	{Tag = "Survivors_q1_47"},
			FigureIsDead	{Tag = "Survivors_q1_48"},
			FigureIsDead	{Tag = "Survivors_q1_49"},
			FigureIsDead	{Tag = "Survivors_q1_50"},
			--FigureIsDead	{Tag = "Survivors_q1_51"},
			FigureIsDead	{Tag = "Survivors_q1_52"},
			FigureIsDead	{Tag = "Survivors_q1_53"},			
			--FigureIsDead	{Tag = "Survivors_q1_54"},				
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Child11", Tag = "Survivors_q1_26"},
			AvatarXPGive	{Amount = 3000},
			FigureRunToEntity	{Tag = "Survivors_q1_26", TargetTag = "start"},
			MapValueAdd	{Name = "mv_survivorcnt", Value = 1},			
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Survivors_q1_55"},
			--FigureIsDead	{Tag = "Survivors_q1_56"},			
			FigureIsDead	{Tag = "Survivors_q1_57"},
			FigureIsDead	{Tag = "Survivors_q1_58"},
			--FigureIsDead	{Tag = "Survivors_q1_59"},
			--FigureIsDead	{Tag = "Survivors_q1_60"},
			--FigureIsDead	{Tag = "Survivors_q1_61"},						
		},
		Actions = 
		{
			FigureOutcry	{TextTag = "Child12", Tag = "Survivors_q1_62"},
			AvatarXPGive	{Amount = 3000},
			FigureRunToEntity	{Tag = "Survivors_q1_62", TargetTag = "start"},		
			MapValueAdd	{Name = "mv_survivorcnt", Value = 1},	
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
		
		},		
		Actions = 
		{
			DialogSetEnabled	{Tag = "D_spirit_child"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P503_NamelessDemonsKilled"},
		},		
		Actions = 
		{
			DialogSetEnabled	{Tag = "Survivors_q1_08"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P503_RaznakDead"},
		},		
		Actions = 
		{
			DialogSetEnabled	{Tag = "Huldik"},
		},
	},
	
OnToggleEvent
	{		
		OnConditions = 
		{
			MapFlagIsFalse	{Name = "mf_P503_ChildDialogFlag"},
			QuestIsActive	{ Quest = "ETERNAL_PEACE"}, 
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "D_spirit_child", Range = 20 },
		},
		OnActions = 
		{
			DialogSetEnabled	{Tag = "D_spirit_child"},
			MapFlagSetTrue	{Name = "mf_P503_ChildDialogFlag"},
		},
		OffConditions = 
		{
			MapFlagIsTrue	{Name = "mf_P503_ChildDialogFlag"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "D_spirit_child", Range = 20 },
		},
		OffActions = 
		{
		MapFlagSetFalse	{Name = "mf_P503_ChildDialogFlag"},
		},
	};


OnToggleEvent
	{		
		OnConditions = 
		{
			MapFlagIsFalse	{Name = "mf_P503_SarokDialogFlag"},
			QuestIsActive	{ Quest = "SAROKS_ARTIFACT"}, 			
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "D_dwarf_sarok", Range = 20 },
			MapFlagIsFalse	{Name = "mf_P503_SarokFightBegin"},
		},
		OnActions = 
		{
			MapFlagSetTrue	{Name = "mf_P503_SarokDialogFlag"},
			DialogSetEnabled	{Tag = "D_dwarf_sarok"},
		},
		OffConditions = 
		{
			MapFlagIsTrue	{Name = "mf_P503_SarokDialogFlag"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "D_dwarf_sarok", Range = 20 },
		},
		OffActions = 
		{
			MapFlagSetFalse	{Name = "mf_P503_SarokDialogFlag"},
		},
	};
		
	
	OnEvent
	{
		Eventname = "SpawnDemon1" , 
		Conditions = 
		{
			FigureIsDead	{Tag = "dragon_slave_01"},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "marker_spawn_end", Range = 3 },
		},
		Actions = 
		{
			NoSpawnEffect{Spawn = FigureNpcSpawnToEntity	{Tag = "dragon_slave_01", Level = 5, UnitId = 1675, TargetTag = "dragon_spawn_point_01", Team = "tm_Team 2"}},
			FigureForceAttackEntity	{Tag = "dragon_slave_01", TargetTag = "pl_HumanAvatar"},
		},
	}; 

	OnEvent
	{
		Eventname = "SpawnDemon2" , 
		Conditions = 
		{
			FigureIsDead	{Tag = "dragon_slave_02"},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "marker_spawn_end", Range = 3 },
		},
		Actions = 
		{
			NoSpawnEffect{Spawn = FigureNpcSpawnToEntity	{Tag = "dragon_slave_02", Level = 5, UnitId = 1675, TargetTag = "dragon_spawn_point_01", Team = "tm_Team 2"}},
			FigureForceAttackEntity	{Tag = "dragon_slave_02", TargetTag = "pl_HumanAvatar"},
		},
	};
	
	OnEvent
	{
		Eventname = "SpawnDemon3" , 
		Conditions = 
		{
			FigureIsDead	{Tag = "dragon_slave_03"},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "marker_spawn_end", Range = 3 },
		},
		Actions = 
		{
			NoSpawnEffect{Spawn = FigureNpcSpawnToEntity	{Tag = "dragon_slave_03", Level = 5, UnitId = 1675, TargetTag = "dragon_spawn_point_01", Team = "tm_Team 2"}},
			FigureForceAttackEntity	{Tag = "dragon_slave_03", TargetTag = "pl_HumanAvatar"},
		},
	};	
	
	OnEvent
	{
		Eventname = "SpawnDemon4" , 
		Conditions = 
		{
			FigureIsDead	{Tag = "dragon_slave_04"},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "marker_spawn_end", Range = 3 },
		},
		Actions = 
		{
			NoSpawnEffect{Spawn = FigureNpcSpawnToEntity	{Tag = "dragon_slave_04", Level = 5, UnitId = 1675, TargetTag = "dragon_spawn_point_02", Team = "tm_Team 2"}},
			FigureForceAttackEntity	{Tag = "dragon_slave_04", TargetTag = "pl_HumanAvatar"},
		},
	};
	
	OnEvent
	{
		Eventname = "SpawnDemon5" , 
		Conditions = 
		{
			FigureIsDead	{Tag = "dragon_slave_05"},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "marker_spawn_end", Range = 3 },
		},
		Actions = 
		{
			NoSpawnEffect{Spawn = FigureNpcSpawnToEntity	{Tag = "dragon_slave_05", Level = 5, UnitId = 1675, TargetTag = "dragon_spawn_point_02", Team = "tm_Team 2"}},
			FigureForceAttackEntity	{Tag = "dragon_slave_05", TargetTag = "pl_HumanAvatar"},
		},
	};
	
	OnEvent
	{
		Eventname = "SpawnDemon6" , 
		Conditions = 
		{
			FigureIsDead	{Tag = "dragon_slave_06"},
			FigureIsNotInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "marker_spawn_end", Range = 3 },
		},
		Actions = 
		{
			NoSpawnEffect{Spawn = FigureNpcSpawnToEntity	{Tag = "dragon_slave_06", Level = 5, UnitId = 1675, TargetTag = "dragon_spawn_point_02", Team = "tm_Team 2"}},
			FigureForceAttackEntity	{Tag = "dragon_slave_06", TargetTag = "pl_HumanAvatar"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "D_dwarf_sarok", Range = 14},
			MapFlagIsFalse	{Name = "mf_P503_StartSarokCut"},
			--FigureTeamTransfer	{Tag = "D_spirit_01", Team = "tm_Team 2"},
		},		
		Actions = 
		{			
			MapFlagSetTrue	{Name = "mf_P503_StartSarokCut"},  --Start the CutScene with Sarok 
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{			
			--AvatarHasItemEquipment	{Player = "pl_Human", ItemId = 1245, Amount = 1, SearchEquipment = true , SearchHeroEquipment = true , },
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 127, Amount = 1},
			
		},		
		Actions = 
		{				
			MapFlagSetTrue	{Name = "mf_P503_GotSarokTreasure"},  --got sarok's treasure
			AvatarGoldGive	{Amount = 252},			
			DialogSetEnabled	{Tag = "D_dwarf_sarok"},
			ObjectVanish	{Tag = "marker_sarok_quest"},
			
		},
	},  

	OnOneTimeEvent
	{
		Conditions = 
		{			
			MapFlagIsTrue	{Name = "mf_P503_GetStaff"},			
		},		
		Actions = 
		{				
			AvatarItemEquipmentGive	{ ItemId = 1240, Amount = 1},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions = 
		{			
			MapFlagIsTrue	{Name = "mf_P503_GetSword"},			
		},		
		Actions = 
		{				
			AvatarItemEquipmentGive	{ ItemId = 1241, Amount = 1},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{			
			MapFlagIsTrue	{Name = "mf_P503_SarokFightBegin"},			
		},		
		Actions = 
		{				
			FigureTeamTransfer	{Tag = "D_dwarf_sarok", Team = "tm_Team 2"},
			FigureForceAttackEntity	{Tag = "D_dwarf_sarok", TargetTag = "pl_HumanAvatar"},			
			DialogSetDisabled	{Tag = "D_dwarf_sarok"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions = 
		{			
			FigureIsDead	{Tag = "D_dwarf_sarok"},		
		},		
		Actions = 
		{				
			MapFlagSetTrue	{Name = "mf_P503_SarokQuestComplete"},
			DialogSetDisabled	{Tag = "D_dwarf_sarok"},	
		},
	},
		
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "D_spirit_quest_01"},
			FigureIsDead	{Tag = "D_spirit_quest_02"},
			FigureIsDead	{Tag = "D_spirit_quest_03"},
			FigureIsDead	{Tag = "D_spirit_quest_04"},
			FigureIsDead	{Tag = "D_spirit_quest_05"},
			FigureIsDead	{Tag = "D_spirit_quest_06"},
			FigureIsDead	{Tag = "D_spirit_quest_07"},
			FigureIsDead	{Tag = "D_spirit_quest_08"},
			--FigureIsDead	{Tag = "D_spirit_quest_09"},
			FigureIsDead	{Tag = "D_spirit_quest_10"},
			FigureIsDead	{Tag = "D_spirit_quest_11"},
			--FigureIsDead	{Tag = "D_spirit_quest_12"},
			FigureIsDead	{Tag = "D_spirit_quest_13"},
			FigureIsDead	{Tag = "Egg1"},
			FigureIsDead	{Tag = "Egg2"},
			FigureIsDead	{Tag = "Egg3"},
			FigureIsDead	{Tag = "Egg4"},
			FigureIsDead	{Tag = "Egg5"},
			FigureIsDead	{Tag = "Egg6"},
			QuestIsActive	{Quest = "ETERNAL_PEACE"},
			
	
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P503_SpiritDemonsKilled"},
			--FigureVanish	{Tag = "D_spirit_child"},
			--NoSpawnEffect{Spawn = FigureNpcSpawnToEntity {Tag = "D_spirit_child", Level = 5, UnitId = 1704, TargetTag = "pl_HumanAvatar", Team = "tm_Neutral"}},
			FigureTeleportToEntity	{Tag = "D_spirit_child", TargetTag = "marker_spirit_spawn"},
			DialogSetEnabled	{Tag = "D_spirit_child"},
		},
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive	{ Quest = "ETERNAL_PEACE"}, 
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "D_spirit_marker_02", Range = 10},
		},
		Actions = 
		{
			
			MapFlagSetTrue	{Name = "mf_P503_SpiritChildAttack"},
			NoSpawnEffect{Spawn = FigureNpcSpawn	{Tag = "D_spirit_01", Level = 5, UnitId =1709 , X =206.735 , Y = 55.448, Team = "tm_Team 2"}},
			FigureForceAttackEntity	{Tag = "D_spirit_01", TargetTag = "pl_HumanAvatar"},
			NoSpawnEffect{Spawn = FigureNpcSpawn	{Tag = "D_spirit_02", Level = 5, UnitId =1708 , X =209.056 , Y = 56.706, Team = "tm_Team 2"}},
			FigureForceAttackEntity	{Tag = "D_spirit_02", TargetTag = "pl_HumanAvatar"},
			NoSpawnEffect{Spawn = FigureNpcSpawn	{Tag = "D_spirit_03", Level = 5, UnitId =1708 , X =209.405 , Y = 54.488, Team = "tm_Team 2"}},
			FigureForceAttackEntity	{Tag = "D_spirit_03", TargetTag = "pl_HumanAvatar"},
			NoSpawnEffect{Spawn = FigureNpcSpawn	{Tag = "D_spirit_04", Level = 5, UnitId =1712 , X =211.935 , Y = 57.049, Team = "tm_Team 2"}},
			FigureForceAttackEntity	{Tag = "D_spirit_04", TargetTag = "pl_HumanAvatar"},
			NoSpawnEffect{Spawn = FigureNpcSpawn	{Tag = "D_spirit_05", Level = 5, UnitId =1712 , X =211.535 , Y = 54.248, Team = "tm_Team 2"}},
			FigureForceAttackEntity	{Tag = "D_spirit_05", TargetTag = "pl_HumanAvatar"},
		},
	},
		
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P503_TalkSpiritChildCompleteNotFriendly"}, 
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "D_spirit_marker_02", Range = 10},
		},
		Actions = 
		{
			
			MapFlagSetTrue	{Name = "mf_P503_SpiritChildAttack"},
			NoSpawnEffect{Spawn = FigureNpcSpawn	{Tag = "D_spirit_01", Level = 5, UnitId =1709 , X =206.735 , Y = 55.448, Team = "tm_Team 2"}},
			FigureForceAttackEntity	{Tag = "D_spirit_01", TargetTag = "pl_HumanAvatar"},
			NoSpawnEffect{Spawn = FigureNpcSpawn	{Tag = "D_spirit_02", Level = 5, UnitId =1708 , X =209.056 , Y = 56.706, Team = "tm_Team 2"}},
			FigureForceAttackEntity	{Tag = "D_spirit_02", TargetTag = "pl_HumanAvatar"},
			NoSpawnEffect{Spawn = FigureNpcSpawn	{Tag = "D_spirit_03", Level = 5, UnitId =1708 , X =209.405 , Y = 54.488, Team = "tm_Team 2"}},
			FigureForceAttackEntity	{Tag = "D_spirit_03", TargetTag = "pl_HumanAvatar"},
			NoSpawnEffect{Spawn = FigureNpcSpawn	{Tag = "D_spirit_04", Level = 5, UnitId =1712 , X =211.935 , Y = 57.049, Team = "tm_Team 2"}},
			FigureForceAttackEntity	{Tag = "D_spirit_04", TargetTag = "pl_HumanAvatar"},
			NoSpawnEffect{Spawn = FigureNpcSpawn	{Tag = "D_spirit_05", Level = 5, UnitId =1712 , X =211.535 , Y = 54.248, Team = "tm_Team 2"}},
			FigureForceAttackEntity	{Tag = "D_spirit_05", TargetTag = "pl_HumanAvatar"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P503_SpiritChildAttack"},
			FigureIsInRangeToEntity	{Tag = "D_spirit_01", TargetTag = "pl_HumanAvatar", Range = 10},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "Child1", Tag = "D_spirit_child"},
		},
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{			
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "marker_raznak_01", Range = 8},
		},
		Actions =
		{
			--FigureOutcry	{TextTag = "Child2", Tag = "pl_HumanAvatar"},
			--FigureOutcry	{TextTag = "Child3", Tag = "d_raznak"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{			
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "marker_raznak_02", Range = 8},
		},
		Actions =
		{
			--FigureOutcry	{TextTag = "Child2", Tag = "pl_HumanAvatar"},
			--FigureOutcry	{TextTag = "Child3", Tag = "d_raznak"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{			
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "marker_raznak_03", Range = 8},
		},
		Actions =
		{
			--FigureOutcry	{TextTag = "Child2", Tag = "pl_HumanAvatar"},
			--FigureOutcry	{TextTag = "Child3", Tag = "d_raznak"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{			
			MapFlagIsTrue {Name = "mf_P503_CompletedPhaseOne"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "Child4", Tag = "Huldik"},			
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{			
			MapFlagIsTrue {Name = "mf_P503_CompletedPhaseTwo"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "Child4", Tag = "Huldik"},			
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
			FigureOutcry	{TextTag = "Child5", Tag = "Huldik"},			
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
			FigureOutcry	{TextTag = "Child6", Tag = "Huldik"},			
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureHasNotHealth	{Tag = "d_raznak", Percent = 85},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "d_raznak", File = "./addon2/gfx/figures/npc/figure_boss_raznaktheburrower_spawn.ska"},
			FigureCastSpellToEntity	{Tag = "d_raznak", Spell = 308, Power = 1, TargetTag = "d_raznak"}, --chromatic shield
			FigureCastSpellToEntity	{Tag = "d_raznak", Spell = 411, Power = 1, TargetTag = "pl_HumanAvatar"}, --firestorm
			--ObjectChange	{Tag = "default", ObjectId = , X = default, Y = default, Direction = default},
		},
	},	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureHasNotHealth	{Tag = "d_raznak", Percent = 65},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "d_raznak", File = "./addon2/gfx/figures/npc/figure_boss_raznaktheburrower_spawn.ska"},
			NoSpawnEffect{Spawn = FigureNpcSpawnToEntity { Tag = "Sentinel_1", Level = 7, UnitId = 1675, TargetTag = "pl_HumanAvatar", Team = "tm_Team 2"}},
			EffectStartAtEntityPosition {Tag = "Sentinel_1", File = "Effect_Spawn_Unit"},
			NoSpawnEffect{Spawn = FigureNpcSpawnToEntity { Tag = "Sentinel_2",  Level = 6, UnitId = 1675, TargetTag = "pl_HumanAvatar", Team = "tm_Team 2"}},
			EffectStartAtEntityPosition {Tag = "Sentinel_2", File = "Effect_Spawn_Unit"},
			--NoSpawnEffect{Spawn = FigureNpcSpawnToEntity { Tag = "Sentinel_3",  Level = 7, UnitId = 1675, TargetTag = "pl_HumanAvatar", Team = "tm_Team 2"}},
			FigureCastSpellToEntity	{Tag = "d_raznak", Spell = 86, Power = 1, TargetTag = "pl_HumanAvatar"}, --dancing lights
		},
	},	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureHasNotHealth	{Tag = "d_raznak", Percent = 45},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "d_raznak", File = "./addon2/gfx/figures/npc/figure_boss_raznaktheburrower_spawn.ska"},
			FigureCastSpellToEntity	{Tag = "d_raznak", Spell = 430, Power = 1, TargetTag = "pl_HumanAvatar"}, --ice comet
			FigureCastSpellToEntity	{Tag = "d_raznak", Spell = 46, Power = 1, TargetTag = "d_raznak"}, --battle crytorm
			
		},
	},	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureHasNotHealth	{Tag = "d_raznak", Percent = 25},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "d_raznak", File = "./addon2/gfx/figures/npc/figure_boss_raznaktheburrower_spawn.ska"},
			NoSpawnEffect{Spawn = FigureNpcSpawnToEntity { Tag = "Krauler_1",  Level = 11, UnitId = 1677, TargetTag = "pl_HumanAvatar", Team = "tm_Team 2"}},	
			EffectStartAtEntityPosition {Tag = "Krauler_1", File = "Effect_Spawn_Unit"},
			NoSpawnEffect{Spawn = FigureNpcSpawnToEntity { Tag = "Krauler_2",  Level = 10, UnitId = 1677, TargetTag = "pl_HumanAvatar", Team = "tm_Team 2"}},
			EffectStartAtEntityPosition {Tag = "Krauler_2", File = "Effect_Spawn_Unit"},
			FigureCastSpellToEntity	{Tag = "d_raznak", Spell = 308, Power = 1, TargetTag = "d_raznak"}, --chromatic shield
			FigureCastSpellToEntity	{Tag = "d_raznak", Spell = 411, Power = 1, TargetTag = "pl_HumanAvatar"}, --firestorm
		},
	},	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureHasNotHealth	{Tag = "d_raznak", Percent = 5},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "d_raznak", File = "./addon2/gfx/figures/npc/figure_boss_raznaktheburrower_spawn.ska"},
			FigureCastSpellToEntity	{Tag = "d_raznak", Spell = 165, Power = 1, TargetTag = "pl_HumanAvatar"}, --extinct
		},
	},	
		
		
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "D_spirit_attack_marker", Range = 4},
		},
		Actions =
		{			
			NoSpawnEffect{Spawn = FigureNpcSpawn	{Tag = "D_spirit_spawn_01", Level = 12, UnitId =1713 , X =131.548 , Y = 97.5, Team = "tm_Team 3"}},
			NoSpawnEffect{Spawn = FigureNpcSpawn	{Tag = "D_spirit_spawn_02", Level = 12, UnitId =1711 , X =126.548 , Y = 94.5, Team = "tm_Team 3"}},
			NoSpawnEffect{Spawn = FigureNpcSpawn	{Tag = "D_spirit_spawn_03", Level = 12, UnitId =1708 , X =127.548 , Y = 97.697, Team = "tm_Team 3"}},
			NoSpawnEffect{Spawn = FigureNpcSpawn	{Tag = "D_spirit_spawn_04", Level = 12, UnitId =1705 , X =129.548 , Y = 99.85, Team = "tm_Team 3"}},
			NoSpawnEffect{Spawn = FigureNpcSpawn	{Tag = "D_spirit_spawn_05", Level = 12, UnitId =1714 , X =134.548 , Y = 101.5, Team = "tm_Team 3"}},
			NoSpawnEffect{Spawn = FigureNpcSpawn	{Tag = "D_spirit_spawn_06", Level = 12, UnitId =1705 , X =135.548 , Y = 97.5, Team = "tm_Team 3"}},		  
									
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "marker_avatar_attack", Range = 10},
			OR
			{
				QuestIsActive	{ Quest = "ETERNAL_PEACE"}, 
				MapFlagIsTrue {Name = "mf_P503_TalkSpiritChildCompleteNotFriendly"}, 
			},
		},
		Actions =
		{			
			FigureForceAttackEntity	{Tag = "avatar_attack_01", TargetTag = "pl_HumanAvatar"},
			FigureForceAttackEntity	{Tag = "avatar_attack_02", TargetTag = "pl_HumanAvatar"},
			FigureForceAttackEntity	{Tag = "D_spirit_spawn_01", TargetTag = "pl_HumanAvatar"},
			FigureForceAttackEntity	{Tag = "D_spirit_spawn_02", TargetTag = "pl_HumanAvatar"},									
			FigureForceAttackEntity	{Tag = "D_spirit_spawn_03", TargetTag = "pl_HumanAvatar"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "marker_avatar_attack", Range = 10},
			QuestIsSolved	{ Quest = "ETERNAL_PEACE"}, 
		},
		Actions =
		{			
			FigureForceAttackEntity	{Tag = "avatar_attack_01", TargetTag = "pl_HumanAvatar"},
			FigureForceAttackEntity	{Tag = "avatar_attack_02", TargetTag = "pl_HumanAvatar"},
			
			FigureTeamTransfer	{Tag = "D_spirit_spawn_01", Team = "tm_Team 1"},
			FigureTeamTransfer	{Tag = "D_spirit_spawn_02", Team = "tm_Team 1"},
			FigureTeamTransfer	{Tag = "D_spirit_spawn_03", Team = "tm_Team 1"},
			FigureTeamTransfer	{Tag = "D_spirit_spawn_04", Team = "tm_Team 1"},
			FigureTeamTransfer	{Tag = "D_spirit_spawn_05", Team = "tm_Team 1"},
			FigureTeamTransfer	{Tag = "D_spirit_spawn_06", Team = "tm_Team 1"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "portal", Range = 3},
		},
		Actions =
		{
			PlayerMapTravelAddon2	{Map = "Campaign/P504_The_Wasteland_Of_Sorrows", TargetTag = "Start"},						
		},
	},
	
	OnOneTimeEvent
	{
		EventName = "PhaseOne",
		Conditions = 
		{
			MapValueIsEqual {Name = "mv_Flame1State", Value = 1}, --check if all three flames are set to green
			MapValueIsEqual {Name = "mv_Flame2State", Value = 1},
			MapValueIsEqual {Name = "mv_Flame3State", Value = 1},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P503_CompletedPhaseOne"},
		},		
	},
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P503_CompletedPhaseOne"}, 
			MapValueIsEqual {Name = "mv_Flame1State", Value = 3}, --check if all three flames are set in correct order
			MapValueIsEqual {Name = "mv_Flame2State", Value = 1}, --for 2nd phase; i.e Blue, Green, Red 
			MapValueIsEqual {Name = "mv_Flame3State", Value = 0},			
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P503_CompletedPhaseTwo"},
		},		
	},
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P503_CompletedPhaseTwo"}, 
			MapValueIsEqual {Name = "mv_Flame1State", Value = 0}, --check if all three flames are set in correct order
			MapValueIsEqual {Name = "mv_Flame2State", Value = 2}, --for 3rd phase; i.e Red, Yellow, Green
			MapValueIsEqual {Name = "mv_Flame3State", Value = 1},			
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P503_CompletedPhaseThree"},
		},		
	},

	OnOneTimeEvent
	{		
		Conditions = 
		{
			FigureIsDead	{Tag = "d_raznak"},
		},
		Actions = 
		{
			QuestSetSolved	{Quest = "MG_INTOTHEDEPTHS"},
			AvatarXPGive	{Amount = 10000},
			QuestSetActive	{Quest = "HULDIK_SMITH"},
			DialogSetEnabled	{Tag = "Huldik"},
			MapFlagSetTrue	{Name = "mf_P503_RaznakDead"},
			
		},		
	},

	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P503_HuldikIngredientsQuest"},
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 466, Amount = 3 },
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 467, Amount =  1 },
			AvatarHasItemMisc	{Player = "pl_Human", ItemId = 468, Amount =  1 },		
		},		
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P503_GotHuldikIngredients"},	
			MapFlagSetTrue	{Name = "mf_P503_ForgeFireQuest"},	
			DialogSetEnabled	{Tag = "Huldik"},
					
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "PERFECTION"},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "dugout_exit", Range = 3 },					
		},
		Actions = 
		{					
		  PlayerMapTravelAddon2	{Map = "Campaign/P502_Malangar_Greens", TargetTag = "Start"},						
		},
	},

 	OnEvent
	{
		EventName = "PostMapTravelSurianDisable",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_MapChangeDetected"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_MapChangeDetected"},
			FigureVanish	{Tag = "Surian"},
			DragonCallDisable {},
		},
		GotoState = self,
	};
	
};
