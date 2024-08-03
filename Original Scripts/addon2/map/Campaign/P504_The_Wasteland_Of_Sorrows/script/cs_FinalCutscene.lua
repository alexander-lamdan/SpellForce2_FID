
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Mg_spirit_craig_08'",
		"'pl_HumanHeroSariel'",
		"'pl_HumanHeroCaine'",
		"'pl_HumanHeroIO'",
		"'pl_HumanHeroShadowWarrior'",
		"'pl_HumanHeroAntara'",
		"'Cutscene_Warrior_FS01'",
		"'Cutscene_Warrior_FS02'",
		"'Cutscene_Warrior_FS03'",
		"'Cutscene_Warrior_FS04'",
		"'Cutscene_Warrior_FS05'",
		"'Cutscene_Warrior_FS06'",
		"'Cutscene_Warrior_FS07'",
		"'Cutscene_Warrior_FS08'",
		"'Cutscene_Warrior_FS09'",
		"'Cutscene_Warrior_FS10'",
		"'Cutscene_Warrior_FS11'",
		"'cs_nightsong'",
--		"'CS_03_Antara'",
--		"'CS_03_Caine'",
--		"'CS_03_ShadowWarrior'",
--		"'CS_03_Io'",
--		"'CS_03_Avatar'",
--		"'CS_03_Sariel'",
--		"'Cutscene_Caine_04'",
--		"'Cutscene_Io_03'",
--		"'Cutscene_Sariel_03'",
--		"'Cutscene_Antara_03'",
--		"'Cutscene_Avatar_05'",
	}
}

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
			--base/gfx/figures/hero/figure_hero_female_special_prisoned.ska
			FigureVanish {Tag = "Craig_Posi_1"},
			FigureVanish {Tag = "Craig_Posi_2"},
			FigureVanish {Tag = "Cutscene_Caine_03"},
			FigureVanish {Tag = "Mg_spirit_craig_07"},			
			FigureVanish {Tag = "Cutscene_Avatar_04"},	
			FigureVanish {Tag = "Cutscene_Warrior_FS01"},			
			FigureVanish {Tag = "Cutscene_Warrior_FS02"},			
			FigureVanish {Tag = "Cutscene_Warrior_FS03"},			
			FigureVanish {Tag = "Cutscene_Warrior_FS04"},			
			FigureVanish {Tag = "Cutscene_Warrior_FS05"},			
			FigureVanish {Tag = "Cutscene_Warrior_FS06"},			
			FigureVanish {Tag = "Cutscene_Warrior_FS07"},			
			FigureVanish {Tag = "Cutscene_Warrior_FS08"},			
			FigureVanish {Tag = "Cutscene_Warrior_FS09"},			
			FigureVanish {Tag = "Cutscene_Warrior_FS10"},	
			FigureVanish {Tag = "Cutscene_Warrior_FS11"},	

			FigureVanish {Tag = "Cutscene_Warriior_1"},			
			FigureVanish {Tag = "Cutscene_Warriior_2"},			
			FigureVanish {Tag = "Cutscene_Warriior_3"},			
			FigureVanish {Tag = "Cutscene_Warriior_4"},			
			FigureVanish {Tag = "Cutscene_Warriior_5"},			
			FigureVanish {Tag = "Cutscene_Warriior_6"},			

			FigureVanish {Tag = "Cutscene_Caine_04"},	
			FigureVanish {Tag = "Cutscene_Twiddle_03"},	
			FigureVanish {Tag = "Cutscene_Sariel_03"},	
			FigureVanish {Tag = "Cutscene_Avatar_04"},	
			FigureVanish {Tag = "Cutscene_Twiddle_04"},	
			FigureVanish {Tag = "Cutscene_Avatar_06"},	
			FigureVanish {Tag = "Cutscene_Avatar_05"},	
			FigureVanish {Tag = "Cutscene_Sariel_04"},	
			FigureVanish {Tag = "Mg_spirit_craig_08"},	
			FigureVanish {Tag = "Cutscene03_ShadowWarrior"},	
			
			
			FigureVanish {Tag = "CS_03_Antara"},
			FigureVanish {Tag = "CS_03_Caine"},
			FigureVanish {Tag = "CS_03_ShadowWarrior"},
			FigureVanish {Tag = "CS_03_Io"},
			FigureVanish {Tag = "CS_03_Avatar"},
			FigureVanish {Tag = "CS_03_Sariel"},
			FigureVanish {Tag = "Cutscene_Caine_04"},
			FigureVanish {Tag = "Cutscene_Io_03"},
			FigureVanish {Tag = "Cutscene_Sariel_03"},
			FigureVanish {Tag = "Cutscene_Antara_03"},
			FigureVanish {Tag = "Cutscene_Avatar_05"},			
					
			FigureVanish {Tag = "CS_Wl_spiderqueen"},
			
			FigureAnimPlayLooped {Tag = "cs_nightsong", File = "base/gfx/figures/hero/figure_hero_female_special_prisoned.ska"},
			EffectStartAddon2	{Tag = "cs_nightsong", File = "Effect_Nightsong_Bound"},
			
		},
		GotoState = self,
	};

	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P504_Start_Final_Cut"},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
					
			FigureAbilityAdd	{Tag = "pl_HumanHeroSariel", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "pl_HumanHeroCaine", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "pl_HumanHeroAntara", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "pl_HumanHeroIO", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "pl_HumanHeroShadowWarrior", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "pl_HumanAvatar", AbilityId = Ability.Immortal },
			
			CutsceneFigureTeleportToEntity {Tag = "Cutscene_Warrior_FS01", TargetTag = "CS_WarriorPos01"},
			FigureLookAtDirection {Tag = "Cutscene_Warrior_FS01", Direction = 239.679},
			CutsceneFigureTeleportToEntity {Tag = "Cutscene_Warrior_FS02", TargetTag = "CS_WarriorPos02"},
			FigureLookAtDirection {Tag = "Cutscene_Warrior_FS02", Direction = 239.679},
			CutsceneFigureTeleportToEntity {Tag = "Cutscene_Warrior_FS03", TargetTag = "CS_WarriorPos03"},
			FigureLookAtDirection {Tag = "Cutscene_Warrior_FS03", Direction = 239.679},
			CutsceneFigureTeleportToEntity {Tag = "Cutscene_Warrior_FS04", TargetTag = "CS_WarriorPos04"},
			FigureLookAtDirection {Tag = "Cutscene_Warrior_FS04", Direction = 239.679},
			CutsceneFigureTeleportToEntity {Tag = "Cutscene_Warrior_FS05", TargetTag = "CS_WarriorPos05"},
			FigureLookAtDirection {Tag = "Cutscene_Warrior_FS06", Direction = 239.679},
			CutsceneFigureTeleportToEntity {Tag = "Cutscene_Warrior_FS06", TargetTag = "CS_WarriorPos06"},
			FigureLookAtDirection {Tag = "Cutscene_Warrior_FS06", Direction = 239.679},
			CutsceneFigureTeleportToEntity {Tag = "Cutscene_Warrior_FS07", TargetTag = "CS_WarriorPos07"},
			FigureLookAtDirection {Tag = "Cutscene_Warrior_FS07", Direction = 239.679},
			CutsceneFigureTeleportToEntity {Tag = "Cutscene_Warrior_FS08", TargetTag = "CS_WarriorPos08"},
			FigureLookAtDirection {Tag = "Cutscene_Warrior_FS08", Direction = 239.679},
			CutsceneFigureTeleportToEntity {Tag = "Cutscene_Warrior_FS09", TargetTag = "CS_WarriorPos09"},
			FigureLookAtDirection {Tag = "Cutscene_Warrior_FS09", Direction = 239.679},
			CutsceneFigureTeleportToEntity {Tag = "Cutscene_Warrior_FS10", TargetTag = "CS_WarriorPos10"},
			FigureLookAtDirection {Tag = "Cutscene_Warrior_FS10", Direction = 239.679},
			CutsceneFigureTeleportToEntity {Tag = "Cutscene_Warrior_FS11", TargetTag = "Craig_Titan_Kill"},
			FigureLookAtDirection {Tag = "Cutscene_Warrior_FS11", Direction = 239.679},	

			CutsceneFigureTeleport {Tag = "Mg_spirit_craig_08", X = 575.495, Y = 386.381},
			FigureLookAtDirection {Tag = "Mg_spirit_craig_08", Direction = 91.6733},
			FigureAbilityAdd	{Tag = "Mg_spirit_craig_08", AbilityId = Ability.Immortal },
			
			CutsceneFigureTeleport {Tag = "cs_nightsong", X = 616.693, Y = 364.305}, --- 2
			FigureLookAtDirection {Tag = "cs_nightsong", Direction = 285.516},
			
			CutsceneFigureTeleport {Tag = "cs_nightsong", X = 616.693, Y = 364.305}, --- 2
			FigureLookAtDirection {Tag = "cs_nightsong", Direction = 285.516},
			
			FigureAnimPlayLooped {Tag = "cs_nightsong", File = "base/gfx/figures/hero/figure_hero_female_special_prisoned.ska"},
			EffectStartAddon2	{Tag = "cs_nightsong", File = "Effect_Nightsong_Bound"},
						
			CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 598.567, Y = 362.747}, --- 2
			FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 120.321},			
			
			CutsceneFigureTeleport {Tag = "pl_HumanHeroSariel", X = 598.342, Y = 361.251}, -- 4
			FigureLookAtDirection {Tag = "pl_HumanHeroSariel", Direction = 57.2958},
			
			CutsceneFigureTeleport {Tag = "pl_HumanHeroIO", X = 598.545, Y = 360.119}, -- 1
			FigureLookAtDirection {Tag = "pl_HumanHeroIO", Direction = 130.817},
			
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 600.381, Y = 362.379},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 68.7549},
			
			CutsceneFigureTeleport {Tag = "pl_HumanHeroShadowWarrior",X = 601.799, Y = 361.425},
			FigureLookAtDirection {Tag = "pl_HumanHeroShadowWarrior", Direction = 97.4028},
			
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 599.762, Y = 359.419 }, -- 3
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 137.51	},
		
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroSariel"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroAntara"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroIO"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroShadowWarrior"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
--			CutsceneCombatOn	{},
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};


State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	
	{
		Conditions =
		{
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EntityTimerStart {Name = "et_CStimer"},
			EffectStartAddon2	{Tag = "Final_Gate", File = "Effect_Gate_01"},
			EffectStartAddon2	{Tag = "Final_Gate", File = "Effect_Gate_02"},
			--FigureAnimPlayOnce{Tag = "CS_Wl_spiderqueen" , File = "addon2/gfx/figures/hero/figure_boss_Spider_Queent_Self_Cast.ska"},
		},
		GotoState = "Cutscene02",
	},
};


State
{
	StateName = "Cutscene02",
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},
			--CutsceneSayIsDone {},
		},
		Actions =
		{
			FigureRun {Tag = "pl_HumanHeroShadowWarrior", X = 615.492, Y = 361.834 },
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take_03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
		},
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 13},
			FigureIsInRange {Tag = "pl_HumanHeroShadowWarrior", X = 615.492, Y = 361.834,  Range = 1},
			--CutsceneSayIsDone {},
		},
		Actions =
		{
			FigureLookAtDirection {Tag = "pl_HumanHeroShadowWarrior", Direction = 168.998},
			CutsceneSay {TextTag = "FINALSHADOWWARRIOR01", Tag = "pl_HumanHeroShadowWarrior"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 16},
			CutsceneSayIsDone {},
		},
		Actions =
		{
			FigureLookAtDirection {Tag = "pl_HumanHeroShadowWarrior", Direction = 168.998},
			EffectStartAddon2	{Tag = "pl_HumanHeroShadowWarrior", File = "Effect_Benefactions_Cast"},
			FigureAnimPlayOnce	{Tag = "pl_HumanHeroShadowWarrior", File = "base/gfx/figures/hero/figure_hero_male_cast.ska"},
		},
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 17},
			--CutsceneSayIsDone {},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "pl_HumanHeroShadowWarrior", File = "base/gfx/figures/hero/figure_hero_male_resolve_enemy.ska"},
			EffectStop {Tag = "cs_nightsong"},
			FigureAnimPlayOnce {Tag = "cs_nightsong" , File = "base/gfx/figures/hero/figure_hero_female_die.ska"},				
			FigureWalk {Tag = "pl_HumanAvatar", X = 614.05, Y = 362.174},
			FigureWalk {Tag = "pl_HumanHeroCaine", X = 618.197, Y = 361.203},
		},		
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 19},
			--CutsceneSayIsDone {},
		},
		Actions =
		{
			FigureAnimPlayLooped {Tag = "cs_nightsong" , File = "base/gfx/figures/hero/figure_hero_female_dead.ska"},				
			EffectStop {Tag = "pl_HumanHeroShadowWarrior"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
	
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 614.05, Y = 362.174},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 136.547},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroShadowWarrior", X = 616.355, Y = 361.2},
			FigureLookAtDirection {Tag = "pl_HumanHeroShadowWarrior", Direction = 186.187},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 618.704, Y = 361.653}, -- 3
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 249.212	},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take_04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FINALCAINE01", Tag = "pl_HumanHeroCaine"},			
		},		
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take_99", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FINALAVATAR01", Tag = "pl_HumanAvatar"},			
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 15},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_down.ska"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};



State
{
	StateName = "Cutscene04",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			FigureAnimPlayLooped	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_hold.ska"},
			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
			--CutsceneSayIsDone {},
		},
		Actions =
		{

			
			FigureTeleportToEntity {Tag = "Mg_spirit_craig_08", TargetTag = "Craig_Last_Run"},
			FigureLookAtDirection {Tag = "Mg_spirit_craig_08", Direction = 31.4879},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take14", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FINALCRAIG01", Tag = "Mg_spirit_craig_08"},
		},
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3.5},
		},
		Actions =
		{
			FigureForcedRunToEntity	{Tag = "Mg_spirit_craig_08", TargetTag = "Craig_Titan_Kill"},
			FigureTeamTransfer {Tag = "Mg_spirit_craig_08", Team = "tm_Team1"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},	
};

State
{
	StateName = "Cutscene06",
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = "Mg_spirit_craig_08", TargetTag = "Cutscene_Warrior_FS01", Range = 3 },
		},
		Actions =
		{
			FigureKill {Tag = "Cutscene_Warrior_FS01"},
		},
	},		
		
	OnOneTimeEvent	
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = "Mg_spirit_craig_08", TargetTag = "Cutscene_Warrior_FS01", Range = 15 },
		},
		Actions =
		{
			FigureTeamTransfer {Tag = "Cutscene_Warrior_FS01", Team = "tm_Team2"},
			FigureAttackEntity {Tag = "Cutscene_Warrior_FS01", TargetTag = "Mg_spirit_craig_08"},
		},		
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = "Mg_spirit_craig_08", TargetTag = "Cutscene_Warrior_FS02", Range = 3 },
		},
		Actions =
		{
			FigureKill {Tag = "Cutscene_Warrior_FS02"},
		},
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = "Mg_spirit_craig_08", TargetTag = "Cutscene_Warrior_FS02", Range = 15 },
		},
		Actions =
		{
			FigureTeamTransfer {Tag = "Cutscene_Warrior_FS02", Team = "tm_Team2"},
			FigureAttackEntity {Tag = "Cutscene_Warrior_FS02", TargetTag = "Mg_spirit_craig_08"},
		},		
	},
	

	OnOneTimeEvent	
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = "Mg_spirit_craig_08", TargetTag = "Cutscene_Warrior_FS03", Range = 3 },
		},
		Actions =
		{
			FigureKill {Tag = "Cutscene_Warrior_FS03"},
		},
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = "Mg_spirit_craig_08", TargetTag = "Cutscene_Warrior_FS03", Range = 15 },
		},
		Actions =
		{
			FigureTeamTransfer {Tag = "Cutscene_Warrior_FS03", Team = "tm_Team2"},
			FigureAttackEntity {Tag = "Cutscene_Warrior_FS03", TargetTag = "Mg_spirit_craig_08"},
		},		
	},

	OnOneTimeEvent	
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = "Mg_spirit_craig_08", TargetTag = "Cutscene_Warrior_FS04", Range = 3 },
		},
		Actions =
		{
			FigureKill {Tag = "Cutscene_Warrior_FS04"},
		},
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = "Mg_spirit_craig_08", TargetTag = "Cutscene_Warrior_FS04", Range = 15 },
		},
		Actions =
		{
			FigureTeamTransfer {Tag = "Cutscene_Warrior_FS04", Team = "tm_Team2"},
			FigureAttackEntity {Tag = "Cutscene_Warrior_FS04", TargetTag = "Mg_spirit_craig_08"},
		},		
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = "Mg_spirit_craig_08", TargetTag = "Cutscene_Warrior_FS05", Range = 3 },
		},
		Actions =
		{
			FigureKill {Tag = "Cutscene_Warrior_FS05"},
		},
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = "Mg_spirit_craig_08", TargetTag = "Cutscene_Warrior_FS05", Range = 15 },
		},
		Actions =
		{
			FigureTeamTransfer {Tag = "Cutscene_Warrior_FS05", Team = "tm_Team2"},
			FigureAttackEntity {Tag = "Cutscene_Warrior_FS05", TargetTag = "Mg_spirit_craig_08"},
		},		
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = "Mg_spirit_craig_08", TargetTag = "Cutscene_Warrior_FS06", Range = 3 },
		},
		Actions =
		{
			FigureKill {Tag = "Cutscene_Warrior_FS06"},
		},
	},
	
		OnOneTimeEvent	
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = "Mg_spirit_craig_08", TargetTag = "Cutscene_Warrior_FS06", Range = 15 },
		},
		Actions =
		{
			FigureTeamTransfer {Tag = "Cutscene_Warrior_FS06", Team = "tm_Team2"},
			FigureAttackEntity {Tag = "Cutscene_Warrior_FS06", TargetTag = "Mg_spirit_craig_08"},
		},		
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = "Mg_spirit_craig_08", TargetTag = "Cutscene_Warrior_FS07", Range = 3 },
		},
		Actions =
		{
			FigureKill {Tag = "Cutscene_Warrior_FS07"},
		},
	},
	
		
		OnOneTimeEvent	
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = "Mg_spirit_craig_08", TargetTag = "Cutscene_Warrior_FS07", Range = 15 },
		},
		Actions =
		{
			FigureTeamTransfer {Tag = "Cutscene_Warrior_FS07", Team = "tm_Team2"},
			FigureAttackEntity {Tag = "Cutscene_Warrior_FS07", TargetTag = "Mg_spirit_craig_08"},
		},		
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = "Mg_spirit_craig_08", TargetTag = "Cutscene_Warrior_FS08", Range = 3 },
		},
		Actions =
		{
			FigureKill {Tag = "Cutscene_Warrior_FS08"},
		},
	},
	
			OnOneTimeEvent	
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = "Mg_spirit_craig_08", TargetTag = "Cutscene_Warrior_FS08", Range = 15 },
		},
		Actions =
		{
			FigureTeamTransfer {Tag = "Cutscene_Warrior_FS08", Team = "tm_Team2"},
			FigureAttackEntity {Tag = "Cutscene_Warrior_FS08", TargetTag = "Mg_spirit_craig_08"},
		},		
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = "Mg_spirit_craig_08", TargetTag = "Cutscene_Warrior_FS09", Range = 3 },
		},
		Actions =
		{
			FigureKill {Tag = "Cutscene_Warrior_FS09"},
		},
	},
	
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = "Mg_spirit_craig_08", TargetTag = "Cutscene_Warrior_FS09", Range = 15 },
		},
		Actions =
		{
			FigureTeamTransfer {Tag = "Cutscene_Warrior_FS09", Team = "tm_Team2"},
			FigureAttackEntity {Tag = "Cutscene_Warrior_FS09", TargetTag = "Mg_spirit_craig_08"},
		},		
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = "Mg_spirit_craig_08", TargetTag = "Cutscene_Warrior_FS10", Range = 3 },
		},
		Actions =
		{
			FigureKill {Tag = "Cutscene_Warrior_FS10"},
		},
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = "Mg_spirit_craig_08", TargetTag = "Cutscene_Warrior_FS10", Range = 15 },
		},
		Actions =
		{
			FigureTeamTransfer {Tag = "Cutscene_Warrior_FS10", Team = "tm_Team2"},
			FigureAttackEntity {Tag = "Cutscene_Warrior_FS10", TargetTag = "Mg_spirit_craig_08"},
		},		
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = "Mg_spirit_craig_08", TargetTag = "Cutscene_Warrior_FS11", Range = 3 },
		},
		Actions =
		{
			FigureKill {Tag = "Cutscene_Warrior_FS11"},
		},
	},

	OnOneTimeEvent	
	{
		Conditions =
		{
			FigureIsInRangeToEntity {Tag = "Mg_spirit_craig_08", TargetTag = "Cutscene_Warrior_FS11", Range = 15 },
		},
		Actions =
		{
			FigureTeamTransfer {Tag = "Cutscene_Warrior_FS11", Team = "tm_Team2"},
			FigureAttackEntity {Tag = "Cutscene_Warrior_FS11", TargetTag = "Mg_spirit_craig_08"},
		},		
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 9},
			--CutsceneSayIsDone {},
		},
		Actions =
		{
			CutsceneFigureTeleport {Tag = "Mg_spirit_craig_08", X = 618.81, Y = 369.169},
			FigureLookAtDirection {Tag = "Mg_spirit_craig_08", Direction = 292.208},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take_05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "FINALCRAIG02", Tag = "Mg_spirit_craig_08"},
		},
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 9},
			--CutsceneSayIsDone {},
		},
		Actions =
		{
			--EffectStartAtEntityPositionAddon2 {Tag = "Final_Effect_Marker", File = "Effect_Final"},
			EffectStartAtEntityPositionAddon2	{Tag = "cs_nightsong", File = "Effect_Final"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
			--CutsceneSayIsDone {},
		},
		Actions =
		{
			
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS_03_Take_05", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			--EntityTimerStart {Name = "et_CStimer"},
		},
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},			
		},
		Actions =
		{
						
			FigureTeleportToEntity {Tag = "Mg_spirit_craig_08", TargetTag = "pl_HumanAvatar"},
			CutsceneSay {TextTag = "FINALCRAIG03", Tag = "Mg_spirit_craig_08"},		
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take_06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
		},
	},
	
	OnOneTimeEvent	
	{	
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 13},			
		},
		Actions =
		{
				EffectStartAddon2 {Tag = "GateMarker", File = "Effect_Gate_01"},					
				EffectStartAddon2	{Tag = "GateMarker", File = "Effect_Gate_02"},					
				EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
	
};

State
{
	StateName = "Cutscene08",
	OnCutsceneFigureDespawnEvent	
	{
		Conditions =
		{
			--CutsceneSayIsDone {},	
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 14},
		},
		Actions =
		{
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroPTwiddle"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroSariel"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},	
			
			--CutsceneFigureTeleportBack {Tag = "pl_HumanAvatar"},
			--CutsceneFigureTeleportBack {Tag = "pl_HumanHeroPTwiddle"},
			--CutsceneFigureTeleportBack {Tag = "pl_HumanHeroSariel"},
			--CutsceneFigureTeleportBack {Tag = "pl_HumanHeroCaine"},	
			
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			FadeInEffectStart{},
			CutsceneFigureRenderAll {},
			MapFlagSetTrue {Name = "mf_P504_End_Final_Cut"},	
			MapTimerStart {Name = "mt_P504_End_Timer"},
			
		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
};
