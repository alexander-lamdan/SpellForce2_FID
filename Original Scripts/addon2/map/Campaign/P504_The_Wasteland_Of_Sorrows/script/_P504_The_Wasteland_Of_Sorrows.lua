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
			MapFigureLevelSet {},
			SetSurianWithAvatar{},
			DragonCallEnable { } ,			
			AvatarValueSet	{ Name = "av_P504_OnDragon", Value = 0},
			MapFlagSetTrue	{Name = "mf_P504_Surian"},
			
			--AvatarXPGive	{Player = "default", Amount = 100000},
			--AvatarXPGive	{Player = "default", Amount = 100000},
			--AvatarXPGive	{Player = "default", Amount = 100000},
			PlayerHeroAdd	{ Player ="pl_Human", HeroId = 183 },
			FigureHeroSpawnToEntity	{ Tag = "HeroPTwiddle", TargetTag = "pl_HumanAvatar", Direction = 0},
			--PlayerHeroAdd	{ Player ="pl_Human", HeroId = 188},
			--NoSpawnEffect { Spawn = FigureHeroSpawnToEntity	{Tag = "HeroSariel", TargetTag = "pl_HumanAvatar", Direction = 0},},
			--PlayerHeroAdd	{ Player ="pl_Human", HeroId = 182},
			--NoSpawnEffect { Spawn = FigureHeroSpawnToEntity	{Tag = "HeroCaine", TargetTag = "pl_HumanAvatar", Direction = 0},},
			--PlayerHeroAdd	{ Player ="pl_Human", HeroId = 190},
			--NoSpawnEffect { Spawn = FigureHeroSpawnToEntity	{Tag = "HeroIO", TargetTag = "pl_HumanAvatar", Direction = 0},},
			--PlayerHeroAdd	{ HeroId = 189},						
			--NoSpawnEffect { Spawn = FigureHeroSpawnToEntity	{Tag = "HeroAntara", TargetTag = "pl_HumanAvatar", Direction = 0},},	
			--PlayerHeroAdd	{ Player ="pl_Human", HeroId = 191},
			--NoSpawnEffect { Spawn = FigureHeroSpawnToEntity	{Tag = "HeroShadowWarrior", TargetTag = "pl_HumanAvatar", Direction = 0},},
					
			MapFlagSetFalse{Name = "mf_P504_CanGiveHQ"},
			MapFlagSetFalse{Name = "mf_P504_SharandalDemise"},
			MapFlagSetFalse{Name = "mf_P504_SharandalSacrifice"},
			MapFlagSetFalse{Name = "mf_P504_WizardsDead"},				
			MapFlagSetFalse {Name = "mf_P504_SharandalDamage"},
			
			FigureHoldPosition {Tag = "Fighter4"},				
			FigureHoldPosition {Tag = "Fighter3"},
			FigureHoldPosition {Tag = "Fighter2"},
			FigureHoldPosition {Tag = "Fighter1"},
			FigureHoldPosition {Tag = "ws_sharandal_01"},
			FigurePlayerTransfer	{Tag = "Surian" },		
			
			FigureAbilityAdd	{Tag = "CS_WOS_Nameless_01", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "CS_WOS_Nameless_02", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "CS_WOS_Nameless_03", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "CS_WOS_Nameless_04", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "CS_WOS_Nameless_05", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "CS_01_Shadow_01", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "CS_01_Shadow_02", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "CS_01_Shadow_03", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "CS_01_Shadow_05", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "CS_01_Shadow_06", AbilityId = Ability.Immortal },
			
			FigureAbilityAdd	{Tag = "Wl_spiderqueen", AbilityId = Ability.Immortal },
			MapTimerStart {Name = "mt_P504_IntroStart"},
			
			FigureForceAttackEntity	{Tag = "CS_WOS_Nameless_02", TargetTag = "CS_01_Shadow_01"},
			FigureForceAttackEntity	{Tag = "CS_WOS_Nameless_04", TargetTag = "CS_01_Shadow_05"},
			--BuildingHealthSet	{Tag = "tower_01", Percent = 40},
			BuildingHealthSet	{Tag = "Alchemist", Percent = 55},
			BuildingHealthSet	{Tag = "dark_fortress", Percent = 85},
			
			FigureHoldPosition {Tag = "pl_HumanHeroAntara"},
			FigureHoldPosition {Tag = "pl_HumanHeroCaine"},
			FigureHoldPosition {Tag = "pl_HumanHeroIO"},	
			FigureHoldPosition {Tag = "pl_HumanAvatar"},				
			FigureHoldPosition {Tag = "pl_HumanHeroPTwiddle"},				
			FigureHoldPosition {Tag = "pl_HumanHeroSariel"},				
			
			PlayerTravelDisable{},
	
		},
	};
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				FigureIsInRangeToEntity {Tag = "pl_HumanHeroAntara", TargetTag = "Shadow_Walk_Start", Range = 15},
				FigureIsInRangeToEntity {Tag = "pl_HumanHeroIO", TargetTag = "Shadow_Walk_Start", Range = 15},
				FigureIsInRangeToEntity {Tag = "pl_HumanHeroPTwiddle", TargetTag = "Shadow_Walk_Start", Range = 15},
				FigureIsInRangeToEntity {Tag = "pl_HumanHeroCaine", TargetTag = "Shadow_Walk_Start", Range = 15},
				FigureIsInRangeToEntity {Tag = "pl_HumanHeroSariel", TargetTag = "Shadow_Walk_Start", Range = 15},
				FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = "Shadow_Walk_Start", Range = 15},			
			},
		},
		Actions =
		{	
			FigureAbilityRemove {Tag = "CS_WOS_Nameless_01", AbilityId = Ability.Immortal },
			FigureAbilityRemove {Tag = "CS_WOS_Nameless_02", AbilityId = Ability.Immortal },
			FigureAbilityRemove {Tag = "CS_WOS_Nameless_03", AbilityId = Ability.Immortal },
			FigureAbilityRemove {Tag = "CS_WOS_Nameless_04", AbilityId = Ability.Immortal },
			FigureAbilityRemove {Tag = "CS_WOS_Nameless_05", AbilityId = Ability.Immortal },
			FigureAbilityRemove {Tag = "CS_01_Shadow_01", AbilityId = Ability.Immortal },
			FigureAbilityRemove {Tag = "CS_01_Shadow_02", AbilityId = Ability.Immortal },
			FigureAbilityRemove {Tag = "CS_01_Shadow_03", AbilityId = Ability.Immortal },
			FigureAbilityRemove {Tag = "CS_01_Shadow_05", AbilityId = Ability.Immortal },
			FigureHealthSet {Tag = "CS_WOS_Nameless_01", Percent = 100},
			FigureHealthSet {Tag = "CS_WOS_Nameless_02", Percent = 100},
			FigureHealthSet {Tag = "CS_WOS_Nameless_03", Percent = 100},
			FigureHealthSet {Tag = "CS_WOS_Nameless_04", Percent = 100},
			FigureHealthSet {Tag = "CS_WOS_Nameless_05", Percent = 100},
			FigureHealthSet {Tag = "CS_01_Shadow_01", Percent = 50},
			FigureHealthSet {Tag = "CS_01_Shadow_02", Percent = 50},
			FigureHealthSet {Tag = "CS_01_Shadow_03", Percent = 50},
			FigureHealthSet {Tag = "CS_01_Shadow_05", Percent = 50},
			
		},
	};
	

	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed{Name = "mt_P504_IntroStart", Seconds = 2},
			GameIsUnBlocked{},
		},
		Actions =
		{	
			FigureTeamTransfer	{Tag = "CS_WOS_Nameless_04", Team = "tm_Team2"},
			FigureKill	{Tag = "shadowblade_todie"},
			
			FigureOutcryImmediate {TextTag = "WHOANTARA1", Tag = "pl_HumanHeroAntara"},
			FigureOutcryImmediate {TextTag = "WHOIO1", Tag = "pl_HumanHeroIO"},
			FigureOutcryImmediate {TextTag = "WHOTWIDDLE1", Tag = "pl_HumanHeroPTwiddle"},
			FigureOutcryImmediate {TextTag = "WHOCAINE1", Tag = "pl_HumanHeroCaine"},
			FigureOutcryImmediate {TextTag = "WHOSARIEL1", Tag = "pl_HumanHeroSariel"},
			FigureOutcryImmediate {TextTag = "WHOAVATAR1", Tag = "pl_HumanAvatar"},

			FigureAnimPlayLooped	{Tag = "sucker_01", File = "addon2/gfx/figures/demonic/figure_demonic_npc_mage_spellcast_loop.ska"},
			FigureAnimPlayLooped	{Tag = "sucker_02", File = "addon2/gfx/figures/demonic/figure_demonic_npc_mage_spellcast_loop.ska"},
			FigureAnimPlayLooped	{Tag = "sucker_03", File = "addon2/gfx/figures/demonic/figure_demonic_npc_mage_spellcast_loop.ska"},
			FigureAnimPlayLooped	{Tag = "sucker_04", File = "addon2/gfx/figures/demonic/figure_demonic_npc_mage_spellcast_loop.ska"},
			FigureAnimPlayLooped	{Tag = "sucker_05", File = "addon2/gfx/figures/demonic/figure_demonic_npc_mage_spellcast_loop.ska"},
			FigureAnimPlayLooped	{Tag = "sucker_06", File = "addon2/gfx/figures/demonic/figure_demonic_npc_mage_spellcast_loop.ska"},
			FigureAnimPlayLooped	{Tag = "sucker_07", File = "addon2/gfx/figures/demonic/figure_demonic_npc_mage_spellcast_loop.ska"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "CS_WOS_Nameless_01"},
			FigureIsDead {Tag = "CS_WOS_Nameless_02"},
			FigureIsDead {Tag = "CS_WOS_Nameless_04"},
			FigureIsDead {Tag = "CS_WOS_Nameless_03"},
			FigureIsDead {Tag = "CS_WOS_Nameless_05"},
			MapTimerIsElapsed{Name = "mt_P504_IntroStart", Seconds = 20},			
		},
		Actions =
		{	
			MapFlagSetTrue {Name = "mf_P504_Start_Intro_Cut"},			
		},
	};
	
	OnOneTimeEvent
	-- Shadow save cutscene END
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P504_End_Intro_Cut"},
		},
		Actions =
		{	
			PlayerHeroRemove {Player ="pl_Human", Tag = "HeroPTwiddle"},
			FigureAbilityRemove	{Tag = "CS_01_Shadow_06", AbilityId = Ability.Immortal },
			FigureVanish {Tag = "CS_01_Shadow_06"},			
			PlayerHeroAdd	{ Player ="pl_Human", HeroId = 191},
			NoSpawnEffect { Spawn = FigureHeroSpawnToEntity	{Tag = "HeroShadowWarrior", TargetTag = "pl_HumanAvatar", Direction = 0},},			
			MapFlagSetTrue	{Name = "mf_P504_CanGiveHQ"},
			PlayerBuildingAdd	{BuildingId = 133 },
			PlayerBuildingAdd	{BuildingId = 134 },
			PlayerBuildingAdd	{BuildingId = 136 },
			PlayerBuildingAdd	{BuildingId = 137 },
			PlayerBuildingAdd	{BuildingId = 138 },
			PlayerBuildingAdd	{BuildingId = 139 },
			PlayerBuildingAdd	{BuildingId = 140 },
			PlayerBuildingAdd	{BuildingId = 141 },
			PlayerBuildingAdd	{BuildingId = 142 },
			PlayerBuildingAdd	{BuildingId = 143 },
			PlayerBuildingAdd	{BuildingId = 144 },
			PlayerBuildingAdd	{BuildingId = 145 },
			PlayerBuildingAdd	{BuildingId = 146 },
			PlayerBuildingAdd	{BuildingId = 147},
			PlayerBuildingUpgradeAdd	{UpgradeId = 18 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 20 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 22 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 24 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 26 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 28 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 30 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 32 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 34 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 36 },
			PlayerBuildingUpgradeAdd	{UpgradeId = 38 },
			PlayerKitTransfer	{PlayerKit = "pk_kit1"},
			ObjectVanish	{Tag = "body_01"},
			ObjectVanish	{Tag = "body_02"},
			ObjectVanish	{Tag = "body_03"},
			ObjectVanish	{Tag = "body_04"},
			
			
			
			MapTimerStart {Name = "mt_P504_MapTimer"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions =
		{
			PlayerHasFigureAmountEx	{Player = "default", Amount = 25 , CountWorkers = false, CountAvatarAndHeroes = false},
			MapTimerIsElapsed {Name = "mt_P504_MapTimer", Seconds = 1200},
			
		},
		Actions =
		{		
			MapFlagSetTrue {Name = "mf_P504_First_Wave_Done"},
			MapTimerStart {Name = "mt_P504_WaveTimer"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P504_WaveTimer", Seconds = 90},
		},
		Actions =
		{		
			MapFlagSetTrue {Name = "mf_P504_Second_Wave_Start"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P504_WaveTimer", Seconds = 250},
		},
		Actions =
		{		
			MapFlagSetTrue {Name = "mf_P504_Second_Wave_Again"},
			MapFlagSetFalse {Name = "mf_P504_Second_Wave_Start"},
			MapTimerStop {Name = "mt_P504_WaveTimer"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P504_CanGiveHQ"},
		},
		Actions =
		{		
			--MapFlagSetTrue {Name = "mf_P504_SharandalDamage"},
			--FogOfWarRevealAtEntity	{FogOfWarId = default, Tag = "WS_sharandal_01", Range = 20, Height = default},
			FogOfWarRevealAtEntity	{FogOfWarId = default, Tag = "undead_temple", Range = 25, Height = default},
			--MapTimerStart {Name = "mt_P504_DamageTimer"},
		},
	};
--[[	
	
	OnEvent
	{
		Conditions =
		{
			FigureIsAlive	{Tag = "WS_sharandal_01"},
			MapFlagIsFalse {Name = "mf_P504_WizardsDead"},
			MapTimerIsElapsed {Name = "mt_P504_DamageTimer", Seconds = 34},
		},
		Actions =
		{		
			FigureHealthSubtract	{Tag = "WS_sharandal_01", Percent = 5 },
			MapTimerStop {Name = "mt_P504_DamageTimer"},
			MapTimerStart {Name = "mt_P504_DamageTimer"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_P504_WizardsDead"},
			FigureHasNotHealth	{Tag = "WS_sharandal_01", Percent = 1},
		},
		Actions =
		{		
			FigureAbilityRemove {Tag = "WS_sharandal_01", AbilityId = Ability.Immortal },
			FigureKill	{Tag = "WS_sharandal_01"},
			MapTimerStop {Name = "mt_P504_DamageTimer"},
		},
	};
]]--
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P504_CanGiveHQ"},
			MapTimerIsElapsed {Name = "mt_P504_MapTimer", Seconds = 120},
		},
		Actions =
		{		
			MapFlagSetTrue {Name = "mf_P504_First_Wave_Start"},
		},
	};

	
	OnEvent
	{
		EventName = "RepeatEvent",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P504_First_Wave_Ready"},
			MapFlagIsFalse {Name = "mf_P504_First_Wave_Done"},
			FigureIsAlive	{Tag = "WS_wave_base_01"},
			FigureIsAlive	{Tag = "WS_wave_base_02"},
			FigureIsAlive	{Tag = "WS_wave_base_03"},
			FigureIsAlive	{Tag = "WS_wave_base_04"},
			FigureIsAlive	{Tag = "WS_wave_base_05"},
			FigureIsAlive	{Tag = "WS_wave_base_06"},
			FigureIsAlive	{Tag = "WS_wave_base_07"},
			FigureIsAlive	{Tag = "WS_wave_base_08"},
			FigureIsAlive	{Tag = "WS_wave_base_09"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P504_First_Wave_Ready"},
			FigureRunToEntity	{Tag = "WS_wave_base_01", TargetTag = "WS_Pact_hq"},			
			FigureRunToEntity	{Tag = "WS_wave_base_02", TargetTag = "WS_Pact_hq"},			
			FigureRunToEntity	{Tag = "WS_wave_base_03", TargetTag = "WS_Pact_hq"},			
			FigureRunToEntity	{Tag = "WS_wave_base_04", TargetTag = "WS_Pact_hq"},			
			FigureRunToEntity	{Tag = "WS_wave_base_05", TargetTag = "WS_Pact_hq"},			
			FigureRunToEntity	{Tag = "WS_wave_base_06", TargetTag = "WS_Pact_hq"},			
			FigureRunToEntity	{Tag = "WS_wave_base_07", TargetTag = "WS_Pact_hq"},			
			FigureRunToEntity	{Tag = "WS_wave_base_08", TargetTag = "WS_Pact_hq"},			
			FigureRunToEntity	{Tag = "WS_wave_base_09", TargetTag = "WS_Pact_hq"},			
		},
		GotoState = self,
	};
	
	OnEvent
	{
		EventName = "RepeatEvent2",
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P504_Second_Wave_Again"},
			FigureIsAlive	{Tag = "WS_wave_base_10"},
			FigureIsAlive	{Tag = "WS_wave_base_11"},
			FigureIsAlive	{Tag = "WS_wave_base_12"},
			FigureIsAlive	{Tag = "WS_wave_base_13"},
			FigureIsAlive	{Tag = "WS_wave_base_14"},
			FigureIsAlive	{Tag = "WS_wave_base_15"},
			FigureIsAlive	{Tag = "WS_wave_base_16"},
			FigureIsAlive	{Tag = "WS_wave_base_17"},
			FigureIsAlive	{Tag = "WS_wave_base_18"},
			FigureIsAlive	{Tag = "WS_wave_base_19"},
			FigureIsAlive	{Tag = "WS_wave_base_20"},
			FigureIsAlive	{Tag = "WS_wave_base_21"},
			FigureIsAlive	{Tag = "WS_wave_base_22"},
			FigureIsAlive	{Tag = "WS_wave_base_23"},
			FigureIsAlive	{Tag = "WS_wave_base_24"},
			FigureIsAlive	{Tag = "WS_wave_base_25"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P504_Second_Wave_Again"},
			MapFlagSetTrue {Name = "mf_P504_Second_SpawnStop"},
			MapTimerStart {Name = "mt_P504_SecondWaveTimer"},
			FigureRunToEntity	{Tag = "WS_wave_base_10", TargetTag = "WS_Pact_hq"},			
			FigureRunToEntity	{Tag = "WS_wave_base_11", TargetTag = "WS_Pact_hq"},			
			FigureRunToEntity	{Tag = "WS_wave_base_12", TargetTag = "WS_Pact_hq"},			
			FigureRunToEntity	{Tag = "WS_wave_base_13", TargetTag = "WS_Pact_hq"},			
			FigureRunToEntity	{Tag = "WS_wave_base_14", TargetTag = "WS_Pact_hq"},			
			FigureRunToEntity	{Tag = "WS_wave_base_15", TargetTag = "WS_Pact_hq"},			
			FigureRunToEntity	{Tag = "WS_wave_base_16", TargetTag = "WS_Pact_hq"},			
			FigureRunToEntity	{Tag = "WS_wave_base_17", TargetTag = "WS_Pact_hq"},			
			FigureRunToEntity	{Tag = "WS_wave_base_18", TargetTag = "WS_Pact_hq"},			
			FigureRunToEntity	{Tag = "WS_wave_base_19", TargetTag = "WS_Pact_hq"},			
			FigureRunToEntity	{Tag = "WS_wave_base_20", TargetTag = "WS_Pact_hq"},			
			FigureRunToEntity	{Tag = "WS_wave_base_21", TargetTag = "WS_Pact_hq"},			
			FigureRunToEntity	{Tag = "WS_wave_base_22", TargetTag = "WS_Pact_hq"},			
			FigureRunToEntity	{Tag = "WS_wave_base_23", TargetTag = "WS_Pact_hq"},			
			FigureRunToEntity	{Tag = "WS_wave_base_24", TargetTag = "WS_Pact_hq"},			
			FigureRunToEntity	{Tag = "WS_wave_base_25", TargetTag = "WS_Pact_hq"},			
			
		},
		GotoState = self,
	};
	
	OnEvent
	{
		EventName = "RepeatEvent3",
		Conditions = 
		{
			MapTimerIsElapsed{Name = "mt_P504_SecondWaveTimer", Seconds = 10},
		},
		Actions = 
		{
			MapTimerStop{Name = "mt_P504_SecondWaveTimer"},
			MapFlagSetFalse {Name = "mf_P504_Second_SpawnStop"},
		},
		GotoState = self,
	};
	
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "WS_wizard_01"},
			FigureIsDead	{Tag = "WS_wizard_02"},
			FigureIsDead	{Tag = "WS_wizard_03"},
			FigureIsDead	{Tag = "WS_wizard_04"},
			FigureIsDead	{Tag = "WS_wizard_05"},
			FigureIsDead	{Tag = "WS_wizard_06"},
			FigureIsDead	{Tag = "WS_wizard_07"},
			FigureIsDead	{Tag = "WS_wizard_08"},
			FigureIsDead	{Tag = "WS_wizard_09"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P504_WizardsDead"},
		},
	};
	
-- TELEPORT GAINED---------------------------------------
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue{Name = "mf_P504_End_Teleport_Cut"},
		},
		Actions =
		{		
			--FigureOutcry	{TextTag = "Teleport", Tag = "tutorialspeaker"},
			TutorialInfoTextShow	{TextTag = "Teleport"},
			AvatarSpellGive {Spell = 451 },
		},
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P504_End_SharandalBreak_Cut"},
		},
		Actions = 
		{
			AvatarXPGive	{Player = "default", Amount = 5000},
			MapTimerStart {Name = "mt_P504_SharandalOutcry"},
			FigureOutcryImmediate {TextTag = "FREESHARANDAL01", Tag = "ws_sharandal_01"},
			FigureOutcryImmediate {TextTag = "FREEAVATAR01", Tag = "pl_HumanAvatar"},
			FigureOutcryImmediate {TextTag = "FREESURIAN01", Tag = "Surian"},
			FigureOutcryImmediate {TextTag = "FREESHARANDAL02", Tag = "ws_sharandal_01"},
			FigureOutcryImmediate {TextTag = "FREEANTARA01", Tag = "pl_HumanHeroAntara"},
			FigureOutcryImmediate {TextTag = "FREESHARANDAL03", Tag = "ws_sharandal_01"},
		},
		GotoState = self,
	};
	
-- SHARANDAL DIALOG ENABLED
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_P504_SharandalOutcry", Seconds = 5},
		},
		Actions = 
		{
			DialogSetEnabled {Tag = "ws_sharandal_01"},
		},
		GotoState = self,
	};
	
	OnEvent
	{
		Conditions = 
		{
			AvatarValueIsEqual	{Player = "pl_Human", Name = "av_P504_OnDragon", Value = 1 },
			MapFlagIsTrue	{Name = "mf_P504_Surian"},
		--	AvatarValueIsEqual	{ Name = "av_p501_OnDragon", Value = 1 },
		},
		Actions = 
		{
			FigureVanish	{Tag = "Surian"},
			MapFlagSetFalse	{Name = "mf_P504_Surian"},
		},
	};


OnEvent
	{
		Conditions = 
		{
			AvatarValueIsEqual	{Player = "pl_Human", Name = "av_P504_OnDragon", Value = 0 },
			FigureIsDead	{Tag = "Surian"},
			MapFlagIsFalse	{Name = "mf_P504_Surian"},
		--	AvatarValueIsEqual	{ Name = "av_p501_OnDragon", Value = 1 },
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P504_Surian"},
			NoSpawnEffect	{Spawn =FigureNpcSpawnToEntity	{Tag = "Surian", Level = 27 , UnitId = 1689 , TargetTag = "pl_HumanAvatar", Team = "tm_Team1"}, },
			FigurePlayerTransfer	{Tag = "Surian" },		
		},
	};
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "WS_sharandal_attack_01"},
			FigureIsDead{Tag = "WS_sharandal_attack_02"},
			FigureIsDead{Tag = "WS_sharandal_attack_03"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P504_SharandalWave"},
		},
		GotoState = self,
	};
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead{Tag = "CS_05_BOSSTIME"},
			MapFlagIsTrue {Name = "mf_P504_EndBossFightCS"},
			--FigureIsDead{Tag = "Offender1"},
			--FigureIsDead{Tag = "Fighter4"},
			--FigureIsDead{Tag = "Fighter3"},
			--FigureIsDead{Tag = "Fighter2"},
			--FigureIsDead{Tag = "Fighter1"},
		},
		Actions = 
		{
			MapTimerStart {Name ="mt_P504_FinalCutReady"},
		},
		GotoState = self,
	};

OnOneTimeEvent
	{		
		Conditions = 
		{
			FigureIsAlive	{Tag = "pl_HumanAvatar"},
			FigureIsDead	{Tag = "Surian"},
			AvatarValueIsEqual	{Player = "pl_Human", Name = "av_P504_OnDragon", Value = 0 },
			MapFlagIsTrue	{Name = "mf_P504_Surian"},
		},
		Actions = 
		{			
			PlayerGameOver	{Tag = "default",  LocaTag = "IGMenuGameOver_Title"},
		},
	};

	OnOneTimeEvent
	{		
		Conditions = 
		{
			OR
			{
				FigureIsInRangeToEntity {Tag = "D_egg_17", TargetTag = "pl_HumanAvatar", Range = 15},
				FigureIsInRangeToEntity {Tag = "D_egg_21", TargetTag = "pl_HumanAvatar", Range = 15},
			},
		},
		Actions = 
		{			
				FigureOutcry {Tag = "pl_HumanAvatar", TextTag = "GUINEAPIGAVATAR01"},   		
		},
	};

-- GAME COMPLETED
	OnOneTimeEvent
	{		
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P504_End_Final_Cut"},
			MapTimerIsElapsed {Name = "mt_P504_End_Timer", Seconds = 1},
		},
		Actions = 
		{			
			CutscenePlayBinkVideo {File = "addon2/Video/outro_2.bik"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P504_End_Timer", Seconds = 1.2},	
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P504_End_Timer"},
			PlayerGameEnds{},	
		},
	},
	
		OnOneTimeEvent
	{		
		Conditions = 
		{
				MapFlagIsTrue {Name = "mf_P504_End_Teleport_Cut"},
		},
		Actions = 
		{			
				AvatarXPGive	{Player = "default", Amount = 4000},
		},
	};
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_P504_FinalCutReady", Seconds = 2},
		},
		Actions = 
		{			
			FigureTeleport	{Tag = "CS_05_BOSSTIME_DEAD", X = 274, Y = 23},
		},
	};
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
				MapTimerIsElapsed {Name = "mt_P504_FinalCutReady", Seconds = 5},
		},
		Actions = 
		{			
				MapFlagSetTrue {Name = "mf_P504_Start_Final_Cut"},
		},
	};
	
		OnOneTimeEvent
	{		
		Conditions = 
		{
				QuestIsSolved {Quest = "WOS_GUINEAPIG"},			
		},
		Actions = 
		{	
			AvatarXPGive	{Player = "default", Amount = 5000},			
		},
	};
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P504_EggQuest"},
			MapFlagIsFalse	{Name = "mf_P504_EggQuestDone"},	
			OR
			{
				FigureIsDead {Tag = "egg_wave_01"},
				FigureIsDead {Tag = "egg_wave_02"},
				FigureIsDead {Tag = "egg_wave_03"},
			},
			FigureIsAlive {Tag = "pl_HumanHeroSariel"},
		},		
		Actions = 
		{			
				FigureOutcryImmediate {TextTag = "AGAINSARIEL1", Tag = "pl_HumanHeroSariel"},
		},
	};
	
	OnEvent
	{
		EventName = "WaveTower2",
		--Name = "RepeatEvent",
		Conditions = 
		{
			BuildingIsAlive {Tag = "WS_tower_02"},
			MapFlagIsFalse {Name = "mf_P504_AllAliveTower2"},
			FigureIsAlive	{Tag = "WS_sharandal_wave_09"},
			FigureIsAlive	{Tag = "WS_sharandal_wave_10"},
			FigureIsAlive	{Tag = "WS_sharandal_wave_11"},
			FigureIsAlive	{Tag = "WS_sharandal_wave_12"},
			FigureIsAlive	{Tag = "WS_sharandal_wave_13"},
			FigureIsAlive	{Tag = "WS_sharandal_wave_14"},
			FigureIsAlive	{Tag = "WS_sharandal_wave_15"},
			FigureIsAlive	{Tag = "WS_sharandal_wave_16"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P504_AllAliveTower2"},
		},
		GotoState = self,
	};
	
	
	OnEvent
	{
		EventName = "WaveTower1",
		--Name = "RepeatEvent",
		Conditions = 
		{
			BuildingIsAlive {Tag = "WS_tower_01"},
			MapFlagIsFalse {Name = "mf_P504_AllAliveTower1"},
			FigureIsAlive	{Tag = "WS_sharandal_wave_01"},
			FigureIsAlive	{Tag = "WS_sharandal_wave_02"},
			FigureIsAlive	{Tag = "WS_sharandal_wave_03"},
			FigureIsAlive	{Tag = "WS_sharandal_wave_04"},
			FigureIsAlive	{Tag = "WS_sharandal_wave_05"},
			FigureIsAlive	{Tag = "WS_sharandal_wave_06"},
			FigureIsAlive	{Tag = "WS_sharandal_wave_07"},
			FigureIsAlive	{Tag = "WS_sharandal_wave_08"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P504_AllAliveTower1"},
		},
		GotoState = self,
	};
	
	--Surian Start	

	OnEvent
	{
		EventName = "PostMapTravelSurianDisable",
		Conditions = 
		{
			SurianIsNotWithAvatar{},
			MapFlagIsTrue {Name = "mf_MapChangeDetected"},
		},
		Actions = 
		{
			AvatarValueSet	{Player = "pl_Human", Name = "av_P504_OnDragon", Value = 0 },
			MapFlagSetFalse {Name = "mf_MapChangeDetected"},
			FigureVanish	{Tag = "Surian"},
			MapFlagSetTrue	{Name = "mf_P504_Surian"},
			DragonCallDisable {},
			--DragonCallEnable {},
		},
		GotoState = self,
	};
	
	OnEvent
	{
		EventName = "PostMapTravelSurianEnable",
		Conditions = 
		{
			SurianIsWithAvatar{},
			MapFlagIsTrue {Name = "mf_MapChangeDetected"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_MapChangeDetected"},
			AvatarValueSet	{Player = "pl_Human", Name = "av_P504_OnDragon", Value = 0 },
			MapFlagSetTrue	{Name = "mf_P504_Surian"},
			FigureVanish	{Tag = "Surian"},
			NoSpawnEffect	{Spawn = FigureNpcSpawnToEntity	{Tag = "Surian", Level = 18 , UnitId = 1689 , TargetTag = "pl_HumanAvatar", Team = "tm_Team1"}, },
			FigurePlayerTransfer	{Tag = "Surian" },
			DragonCallEnable {},
		},
		GotoState = self,
	};
	
	--Surian End	

-- LENYA DEFENSE TRIGGER 
	OnOneTimeEvent
	{		
		Conditions = 
		{
			FigureUnitRtsIsInRangeToEntity	{UnitId = 82, Range =10 , TargetTag = "slave_ambush_trigger"},		
		},		
		Actions = 
		{			
			FigureTeamTransfer	{Tag = "firegolem_01", Team = "Tm_Team2"},
			FigureTeamTransfer	{Tag = "firegolem_02", Team = "Tm_Team2"},
			FigureTeamTransfer	{Tag = "firegolem_03", Team = "Tm_Team2"},
			FigureTeamTransfer	{Tag = "firegolem_04", Team = "Tm_Team2"},
			FigureTeamTransfer	{Tag = "firegolem_05", Team = "Tm_Team2"},
			FigureTeamTransfer	{Tag = "firegolem_06", Team = "Tm_Team2"},
		},
	};
	
--UNDEAD GUARD RUNBACK
OnOneTimeEvent
	{		
		Conditions = 
		{
			FigureTeamIsInRange	{Team = "tm_Team1", Range = 15, X = 239, Y = 226},
		},		
		Actions = 
		{			
			FigureForcedRunToEntity	{Tag = "beast_undead_01", TargetTag = "marker_beast_guard_runto"},
			FigureForcedRunToEntity	{Tag = "beast_undead_02", TargetTag = "marker_beast_guard_runto"},	
		},
	};
--UNDEAD HEALERS RUNBACK
	OnOneTimeEvent
	{		
		Conditions = 
		{
			FigureIsDead	{Tag = "undead_sword_01"},
			FigureIsDead	{Tag = "undead_sword_01"},
			FigureIsDead	{Tag = "undead_sword_01"},
		},		
		Actions = 
		{			
			FigureForcedRun	{Tag = "undead_healer_01", X = 144, Y =134},
			FigureForcedRun	{Tag = "undead_healer_02", X = 140, Y =134},
			FigureForcedRun	{Tag = "undead_healer_03", X = 131, Y =138},
		},
	};
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			FigureTeamIsInRange	{Team = "tm_Team1", Range = 15, X = 151, Y = 152},
		},		
		Actions = 
		{			
			FigurePatrolWalk	{Tag = "undead_bow_01", X = 145, Y = 140},
			FigurePatrolWalk	{Tag = "undead_bow_02", X = 142, Y = 138},
			FigurePatrolWalk	{Tag = "undead_bow_03", X = 141, Y = 141},
			FigurePatrolWalk	{Tag = "undead_bow_04", X = 140, Y = 144},
			FigurePatrolWalk	{Tag = "undead_bow_05", X = 140, Y = 148},
			FigurePatrolWalk	{Tag = "undead_bow_06", X = 137, Y = 151},
		},
	};
	OnOneTimeEvent
	{		
		Conditions = 
		{
			FigureTeamIsInRange	{Team = "tm_Team1", Range = 15, X = 107, Y = 115},
		},		
		Actions = 
		{			
			FigureNpcSpawn	{Tag = "frenzie_01", Level = 9, UnitId = 117, X = 95, Y = 114, Team = "tm_Team3"},
			FigurePatrolWalk	{Tag = "frenzie_01", X = 145, Y = 140},
			FigureNpcSpawn	{Tag = "frenzie_02", Level = 9, UnitId = 117, X = 95, Y = 117, Team = "tm_Team3"},
			FigurePatrolWalk	{Tag = "frenzie_02", X = 145, Y = 140},
			FigureNpcSpawn	{Tag = "frenzie_03", Level = 8, UnitId = 117, X = 95, Y = 119, Team = "tm_Team3"},
			FigurePatrolWalk	{Tag = "frenzie_03", X = 145, Y = 140},
			FigureNpcSpawn	{Tag = "frenzie_04", Level = 9, UnitId = 117, X = 96, Y = 119, Team = "tm_Team3"},
			FigurePatrolWalk	{Tag = "frenzie_04", X = 145, Y = 140},
			FigureNpcSpawn	{Tag = "frenzie_05", Level = 8, UnitId = 117, X = 96, Y = 114, Team = "tm_Team3"},
			FigurePatrolWalk	{Tag = "frenzie_05", X = 145, Y = 140},
			FigureNpcSpawn	{Tag = "frenzie_06", Level = 9, UnitId = 117, X = 96, Y = 117, Team = "tm_Team3"},
			FigurePatrolWalk	{Tag = "frenzie_06", X = 145, Y = 140},
			FigureNpcSpawn	{Tag = "frenzie_07", Level = 8, UnitId = 117, X = 96, Y = 120, Team = "tm_Team3"},
			FigurePatrolWalk	{Tag = "frenzie_07", X = 145, Y = 140},
		},
	};
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			
			BuildingHasNotHealth	{Tag = "undead_smeltery", Percent =60},
		},		
		Actions = 
		{			
			FigureNpcSpawn	{Tag = "skelly_01", Level = 10, UnitId = 117, X = 101, Y = 86, Team = "tm_Team3"},
			FigurePatrolWalk	{Tag = "skelly_01", X = 105, Y = 103},
			FigureNpcSpawn	{Tag = "skelly_02", Level = 7, UnitId = 117, X = 101, Y = 88, Team = "tm_Team3"},
			FigurePatrolWalk	{Tag = "skelly_02", X = 105, Y = 103},
			FigureNpcSpawn	{Tag = "skelly_03", Level = 8, UnitId = 117, X = 96, Y = 88, Team = "tm_Team3"},
			FigurePatrolWalk	{Tag = "skelly_03", X = 105, Y = 103},
			FigureNpcSpawn	{Tag = "skelly_04", Level = 9, UnitId = 117, X = 98, Y = 88, Team = "tm_Team3"},
			FigurePatrolWalk	{Tag = "skelly_04", X = 105, Y = 103},
			FigureNpcSpawn	{Tag = "skelly_05", Level = 7, UnitId = 146, X = 93, Y = 92, Team = "tm_Team3"},
			FigurePatrolWalk	{Tag = "skelly_05", X = 105, Y = 103},
			FigureNpcSpawn	{Tag = "skelly_06", Level = 10, UnitId = 146, X = 93, Y = 98, Team = "tm_Team3"},
			FigurePatrolWalk	{Tag = "skelly_06", X = 105, Y = 103},
			FigureNpcSpawn	{Tag = "skelly_07", Level = 7, UnitId = 146, X = 91, Y = 100, Team = "tm_Team3"},
			FigurePatrolWalk	{Tag = "skelly_07", X = 105, Y = 103},
		},
	};

-- FINAL BATTLE
	OnOneTimeEvent
	{		
		Conditions = 
		{
			FigureTeamIsInRange	{Team = "tm_Team1", Range = 25, X = 597, Y = 365},
		},
		Actions = 
		{			
			MapFlagSetTrue {Name = "mf_P504_BossFightCS"},	
		},
	};
		
	OnOneTimeEvent
	{		
		Conditions = 
		{
			FigureTeamIsInRange	{Team = "tm_Team1", Range = 10, X = 147, Y = 207},
			BuildingIsDead	{Tag = "smallbase_tower_01"},
			FigureIsDead {Tag = "smallbase_nameless_01"},
			FigureIsDead {Tag = "smallbase_nameless_02"},
			FigureIsDead {Tag = "smallbase_nameless_03"},
			FigureIsDead {Tag = "smallbase_nameless_04"},
			FigureIsDead {Tag = "smallbase_nameless_05"},
			FigureIsDead {Tag = "smallbase_nameless_06"},
			FigureIsDead {Tag = "smallbase_nameless_07"},
		
		},
		Actions = 
		{	
			SoundAmbientPlayOnce	{File = "01_ambient/amb_war_siege3", X = 147, Y =207 , Z =0 , MaxRange = 20, FallOffRange = default},
			FigureTeamTransfer	{Tag = "prisoner_01", Team = "tm_Team1"},
			FigureWalk	{Tag = "prisoner_01", X = 147, Y = 207},
			FigureTeamTransfer	{Tag = "prisoner_02", Team = "tm_Team1"},
			FigureWalk	{Tag = "prisoner_02", X = 147, Y = 208},
			FigureTeamTransfer	{Tag = "prisoner_03", Team = "tm_Team1"},
			FigureWalk	{Tag = "prisoner_03", X = 145, Y = 211},
			FigureTeamTransfer	{Tag = "prisoner_04", Team = "tm_Team1"},
			FigureWalk	{Tag = "prisoner_04", X = 145, Y = 210},
			FigureTeamTransfer	{Tag = "prisoner_05", Team = "tm_Team1"},
			FigureWalk	{Tag = "prisoner_04", X = 149, Y = 201},
			FigureTeamTransfer	{Tag = "prisoner_06", Team = "tm_Team1"},
			FigureWalk	{Tag = "prisoner_05", X = 148, Y = 205},
			FigureTeamTransfer	{Tag = "prisoner_07", Team = "tm_Team1"},
			FigureWalk	{Tag = "prisoner_05", X = 149, Y = 203},
			PlayerKitTransfer	{PlayerKit = "pk_kit3"},
			AvatarXPGive	{Player = "default", Amount = 6000},
		},
	};
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---                                                                                                                 B O S S              F I G H T 

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureHasNotHealth	{Tag = "CS_05_BOSSTIME", Percent = 85},
		},
		Actions =
		{
			FigureCastSpellToEntity	{Tag = "CS_05_BOSSTIME", Spell = 284, Power = 2, TargetTag = "CS_05_BOSSTIME"}, --bladed armor
			FigureCastSpellToEntity	{Tag = "CS_05_BOSSTIME", Spell = 50, Power = 2, TargetTag = "pl_HumanAvatar"}, --thunderstorm
			--ObjectChange	{Tag = "default", ObjectId = , X = default, Y = default, Direction = default},
		},
	},	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureHasNotHealth	{Tag = "CS_05_BOSSTIME", Percent = 65},
		},
		Actions =
		{
			--NoSpawnEffect{Spawn = FigureNpcSpawnToEntity { Tag = "Sentinel_1", Level = 7, UnitId = 1675, TargetTag = "pl_HumanAvatar", Team = "tm_Team 2"}},
			--EffectStartAtEntityPosition {Tag = "Sentinel_1", File = "Effect_Spawn_Unit"},
			--NoSpawnEffect{Spawn = FigureNpcSpawnToEntity { Tag = "Sentinel_2",  Level = 6, UnitId = 1675, TargetTag = "pl_HumanAvatar", Team = "tm_Team 2"}},
			--EffectStartAtEntityPosition {Tag = "Sentinel_2", File = "Effect_Spawn_Unit"},
			--NoSpawnEffect{Spawn = FigureNpcSpawnToEntity { Tag = "Sentinel_3",  Level = 7, UnitId = 1675, TargetTag = "pl_HumanAvatar", Team = "tm_Team 2"}},
			FigureCastSpellToEntity	{Tag = "CS_05_BOSSTIME", Spell = 278, Power = 2, TargetTag = "CS_05_BOSSTIME"}, --riposte
			FigureCastSpellToEntity	{Tag = "CS_05_BOSSTIME", Spell = 50, Power = 2, TargetTag = "pl_HumanAvatar"}, --thunderstorm
			
		},
	},	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureHasNotHealth	{Tag = "CS_05_BOSSTIME", Percent = 45},
		},
		Actions =
		{
			FigureCastSpellToEntity	{Tag = "CS_05_BOSSTIME", Spell = 430, Power = 2, TargetTag = "pl_HumanAvatar"}, --ice comet
			FigureCastSpellToEntity	{Tag = "CS_05_BOSSTIME", Spell = 326, Power = 2, TargetTag = "CS_05_BOSSTIME"}, --raise dead
			
		},
	},	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureHasNotHealth	{Tag = "CS_05_BOSSTIME", Percent = 25},
		},
		Actions =
		{
			FigureCastSpellToEntity	{Tag = "CS_05_BOSSTIME", Spell = 286, Power = 2, TargetTag = "CS_05_BOSSTIME"}, --shield wall 
			FigureCastSpellToEntity	{Tag = "CS_05_BOSSTIME", Spell = 430, Power = 2, TargetTag = "pl_HumanAvatar"}, --ice comet
			FigureAbilityAdd	{Tag = "CS_05_BOSSTIME", AbilityId =52}, --Multi strike
			FigureAbilityAdd	{Tag = "CS_05_BOSSTIME", AbilityId =210}, --Regen 200%
			FigureAbilityAdd	{Tag = "CS_05_BOSSTIME", AbilityId =211}, --Regen 300%
		},
	},	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureHasNotHealth	{Tag = "CS_05_BOSSTIME", Percent = 20},
		},
		Actions =
		{
			FigureCastSpellToEntity	{Tag = "CS_05_BOSSTIME", Spell = 279, Power = 2, TargetTag = "CS_05_BOSSTIME"}, --berserk
			FigureCastSpellToEntity	{Tag = "CS_05_BOSSTIME", Spell = 329, Power = 2, TargetTag = "pl_HumanAvatar"}, --extinct
		},
	},

};	

