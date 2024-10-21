--************************************************************
--**
--**		Malangar Greens  :: Malangar Greens Returns
--**
--************************************************************

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'MG2_Elf_01'",
		"'MG2_Elf_02'",
		"'MG2_Elf_03'",
		"'MG2_Elf_04'",
		"'MG2_Elf_05'",
		"'Chosen_01'",
		"'Chosen_02'",
		"'Chosen_03'",
		"'Chosen_04'",
		"'Chosen_05'",
		"'CS_MG2_Chosen_Attack_Caine'",
		"'CS_MG2_Chosen_Attack_Sariel'",
		"'CS_MG2_Chosen_Attack_Io'",
		"'CS_MG2_Chosen_Attack_Antara'",
		"'pl_HumanHeroIO'",
		"'pl_HumanHeroSariel'",
		"'pl_HumanHeroAntara'",
		"'pl_HumanHeroCaine'",
		"'CS_MG2_Twiddle'",
		"'MG2_Surian'",
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
			FigureVanish	{Tag = "MG2_Elf_01"},
			FigureVanish	{Tag = "MG2_Elf_02"},
			FigureVanish	{Tag = "MG2_Elf_03"},
			FigureVanish	{Tag = "MG2_Elf_04"},
			FigureVanish	{Tag = "MG2_Elf_05"},
			FigureVanish	{Tag = "Chosen_01"},
			FigureVanish	{Tag = "Chosen_02"},
			FigureVanish	{Tag = "Chosen_03"},
			FigureVanish	{Tag = "Chosen_04"},
			FigureVanish	{Tag = "Chosen_05"},
			FigureVanish	{Tag = "CS_MG2_Chosen_Attack_Caine"},
			FigureVanish	{Tag = "CS_MG2_Chosen_Attack_Sariel"},
			FigureVanish	{Tag = "CS_MG2_Chosen_Attack_Io"},
			FigureVanish	{Tag = "CS_MG2_Chosen_Attack_Antara"},
			FigureVanish	{Tag = "CS_MG2_Twiddle"},
			FigureVanish	{Tag = "CS_MG2_Caine"},
			FigureVanish	{Tag = "MG2_Sariel_revived"},
			FigureVanish	{Tag = "CS_MG2_Sariel"}, 
			FigureVanish	{Tag = "MG2_Avatar_revive_Sariel"},
			FigureVanish	{Tag = "CS_MG2_Antara"},
			FigureVanish	{Tag = "CS_MG2_Avatar_Save_Io"},
			FigureVanish	{Tag = "CS_MG2_Io"},
			FigureVanish	{Tag = "CS_MG2_Avatar_Go_Invisible"},
			FigureVanish	{Tag = "MG2_Surian"},			
		},
		GotoState = self,
	};



	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P502_StartActivityCS"},
				GameIsUnBlocked{},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CutsceneFigureTeleport {Tag = "MG2_Elf_01", X = 443.923, Y = 648.873},
			FigureLookAtDirection {Tag = "MG2_Elf_01", Direction = 85.9437},
			CutsceneFigureTeleport {Tag = "MG2_Elf_01", X = 443.923, Y = 648.873},
			FigureLookAtDirection {Tag = "MG2_Elf_01", Direction = 85.9437},
			CutsceneFigureTeleport {Tag = "Chosen_01", X = 445.727, Y = 648.881},
			FigureLookAtDirection {Tag = "Chosen_01", Direction = 302.704},
			CutsceneFigureTeleport {Tag = "MG2_Elf_03", X = 445.67, Y = 644.606},
			FigureLookAtDirection {Tag = "MG2_Elf_03", Direction = 103.132},
			CutsceneFigureTeleport {Tag = "Chosen_03", X = 447.314, Y = 645.557},
			FigureLookAtDirection {Tag = "Chosen_03", Direction = 302.704},
			CutsceneFigureTeleport {Tag = "MG2_Elf_02", X = 450.29, Y = 649.924},
			FigureLookAtDirection {Tag = "MG2_Elf_02", Direction = 337.082},
			CutsceneFigureTeleport {Tag = "Chosen_02", X = 449.39, Y = 648.431},
			FigureLookAtDirection {Tag = "Chosen_02", Direction = 119.358},
			CutsceneFigureTeleport {Tag = "MG2_Elf_04", X = 451.592, Y = 644.704},
			FigureLookAtDirection {Tag = "MG2_Elf_04", Direction = 314.163},
			CutsceneFigureTeleport {Tag = "Chosen_04", X = 449.829, Y = 644.932},
			FigureLookAtDirection {Tag = "Chosen_04", Direction = 68.7549},
			CutsceneFigureTeleport {Tag = "MG2_Elf_05", X = 450.191, Y = 640.227},
			FigureLookAtDirection {Tag = "MG2_Elf_05", Direction = 228.22},
			CutsceneFigureTeleport {Tag = "Chosen_05", X = 449.95, Y = 641.798},
			FigureLookAtDirection {Tag = "Chosen_05", Direction = 0},			
			CutsceneFigureTeleport {Tag = "CS_MG2_Chosen_Attack_Sariel", X = 440.792, Y = 638.514},
			FigureLookAtDirection {Tag = "CS_MG2_Chosen_Attack_Sariel", Direction = 0},
			CutsceneFigureTeleport {Tag = "CS_MG2_Chosen_Attack_Caine", X = 444.98, Y = 639.361},
			FigureLookAtDirection {Tag = "CS_MG2_Chosen_Attack_Caine", Direction = 84.0173},
			CutsceneFigureTeleport {Tag = "CS_MG2_Chosen_Attack_Antara", X = 441.398, Y = 635.855},
			FigureLookAtDirection {Tag = "CS_MG2_Chosen_Attack_Antara", Direction = 301.741},
			CutsceneFigureTeleport {Tag = "CS_MG2_Chosen_Attack_Io", X = 444.709, Y = 636.087},
			FigureLookAtDirection {Tag = "CS_MG2_Chosen_Attack_Io", Direction = 325.623},			
			CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 439.439, Y = 634.395},
			FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 130.817},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 446.958, Y = 639.707},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 308.434},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroIO", X = 444.039, Y = 633.964},
			FigureLookAtDirection {Tag = "pl_HumanHeroIO", Direction = 200.535},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroSariel", X = 442.259, Y = 639.885},
			FigureLookAtDirection {Tag = "pl_HumanHeroSariel", Direction = 337.082},
			CutsceneFigureTeleport {Tag = "CS_MG2_Twiddle", X = 490.116, Y = 663.937},
			FigureLookAtDirection {Tag = "CS_MG2_Twiddle", Direction = 302.704},			
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 448.435, Y = 636.709},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 182.383},
			FigureAbilityAdd	{Tag = "pl_HumanAvatar", AbilityId = Ability.Immortal },
			--FigureTeleportToEntity {Tag = "MG2_Surian", TargetTag = "CS_MG2_Twiddle"},
			FigureHoldPosition {Tag = "pl_HumanHeroAntara"},
			FigureHoldPosition {Tag = "pl_HumanHeroIO"},
			FigureHoldPosition {Tag = "pl_HumanHeroSariel"},
			FigureHoldPosition {Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
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
		},
		Actions =
		{
			CutsceneCombatOn{},
			FigureTeamTransfer {Tag = "Chosen_01",Team = "tm_Team2"},
			FigureTeamTransfer {Tag = "Chosen_02",Team = "tm_Team2"},
			FigureTeamTransfer {Tag = "Chosen_03",Team = "tm_Team2"},
			FigureTeamTransfer {Tag = "Chosen_04",Team = "tm_Team2"},
			FigureTeamTransfer {Tag = "Chosen_05",Team = "tm_Team2"},
			FigureTeamTransfer {Tag = "CS_MG2_Chosen_Attack_Caine",Team = "tm_Team2"},
			FigureTeamTransfer {Tag = "CS_MG2_Chosen_Attack_Sariel",Team = "tm_Team2"},
			FigureTeamTransfer {Tag = "CS_MG2_Chosen_Attack_Io",Team = "tm_Team2"},
			FigureTeamTransfer {Tag = "CS_MG2_Chosen_Attack_Antara",Team = "tm_Team2"},
			FigureTeamTransfer {Tag = "MG2_Elf_01",Team = "tm_Team1"},
			FigureTeamTransfer {Tag = "MG2_Elf_02",Team = "tm_Team1"},
			FigureTeamTransfer {Tag = "MG2_Elf_03",Team = "tm_Team1"},
			FigureTeamTransfer {Tag = "MG2_Elf_04",Team = "tm_Team1"},
			FigureTeamTransfer {Tag = "MG2_Elf_05",Team = "tm_Team1"},
			
			FigureAbilityAdd	{Tag = "Chosen_01", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "Chosen_02", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "Chosen_03", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "Chosen_04", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "Chosen_05", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "CS_MG2_Chosen_Attack_Caine", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "CS_MG2_Chosen_Attack_Sariel", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "CS_MG2_Chosen_Attack_Io", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "CS_MG2_Chosen_Attack_Antara", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "MG2_Elf_01", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "MG2_Elf_02", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "MG2_Elf_03", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "MG2_Elf_04", AbilityId = Ability.Immortal },
			FigureAbilityAdd	{Tag = "MG2_Elf_05", AbilityId = Ability.Immortal },
			
			FigureAttackEntity	{Tag = "MG2_Elf_01", TargetTag = "Chosen_01"},
			FigureAttackEntity	{Tag = "MG2_Elf_02", TargetTag = "Chosen_02"},
			FigureAttackEntity	{Tag = "MG2_Elf_03", TargetTag = "Chosen_03"},
			FigureAttackEntity	{Tag = "MG2_Elf_04", TargetTag = "Chosen_04"},
			FigureAttackEntity	{Tag = "MG2_Elf_05", TargetTag = "Chosen_05"},
			FigureAttackEntity	{Tag = "Chosen_01", TargetTag = "MG2_Elf_01"},
			FigureAttackEntity	{Tag = "Chosen_02", TargetTag = "MG2_Elf_02"},
			FigureAttackEntity	{Tag = "Chosen_03", TargetTag = "MG2_Elf_03"},
			FigureAttackEntity	{Tag = "Chosen_04", TargetTag = "MG2_Elf_04"},
			FigureAttackEntity	{Tag = "Chosen_05", TargetTag = "MG2_Elf_05"},
			
		
			FigureAttackEntity	{Tag = "CS_MG2_Chosen_Attack_Caine", TargetTag = "pl_HumanHeroCaine"},
			FigureAttackEntity	{Tag = "CS_MG2_Chosen_Attack_Sariel", TargetTag = "pl_HumanHeroSariel"},
			FigureAttackEntity	{Tag = "CS_MG2_Chosen_Attack_Io", TargetTag = "pl_HumanHeroIO"},
			FigureAttackEntity	{Tag = "CS_MG2_Chosen_Attack_Antara", TargetTag = "pl_HumanHeroAntara"},
			FigureAttackEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "CS_MG2_Chosen_Attack_Caine"},						
			FigureAttackEntity	{Tag = "pl_HumanHeroSariel", TargetTag = "CS_MG2_Chosen_Attack_Sariel"},
			FigureAttackEntity	{Tag = "pl_HumanHeroIO", TargetTag = "CS_MG2_Chosen_Attack_Io"},
			FigureAttackEntity	{Tag = "pl_HumanHeroAntara", TargetTag = "CS_MG2_Chosen_Attack_Antara"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_99", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			FigureTeamTransfer {Tag = "pl_HumanAvatar", Team = "tm_Neutral"},
		},	
	},	

	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 8},
		},
		Actions =
		{
			FigureTeleportToEntity {Tag = "pl_HumanAvatar", TargetTag = "CS_MG2_Twiddle"},
			FigureHoldPosition {Tag = "pl_HumanAvatar"},
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
			CutsceneSay {TextTag = "MGRETURNSCAINE01", Tag = "pl_HumanHeroCaine"},
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
			CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_20", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSANTARA01", Tag = "pl_HumanHeroAntara"},			
			FigureAbilityRemove	{Tag = "MG2_Elf_01", AbilityId = Ability.Immortal },
			FigureKill {Tag = "MG2_Elf_01"},
			FigureAttackEntity	{Tag = "Chosen_01", TargetTag = "MG2_Elf_02"},
		},	
	},	
	
	OnOneTimeEvent	
	{
		Conditions =
		{			
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6},
		},
		Actions =
		{
			FigureAbilityRemove	{Tag = "Chosen_02", AbilityId = Ability.Immortal },
			FigureKill {Tag = "Chosen_02"},
			FigureAbilityRemove	{Tag = "MG2_Elf_03", AbilityId = Ability.Immortal },
			FigureKill {Tag = "MG2_Elf_03"},
			FigureAbilityRemove	{Tag = "MG2_Elf_04", AbilityId = Ability.Immortal },
			FigureKill {Tag = "MG2_Elf_04"},
			FigureAttackEntity	{Tag = "Chosen_03", TargetTag = "pl_HumanHeroSariel"},
			--FigureAttackEntity	{Tag = "pl_HumanHeroSariel", TargetTag = "Chosen_03"},
			FigureAttackEntity	{Tag = "Chosen_04", TargetTag = "pl_HumanHeroSariel"},
			FigureAttackEntity	{Tag = "MG2_Elf_02", TargetTag = "Chosen_01"},
		},	
	},	
	
	OnOneTimeEvent	
	{
		Conditions =
		{			
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 8},
		},
		Actions =
		{
			FigureAbilityRemove	{Tag = "Chosen_03", AbilityId = Ability.Immortal },
			FigureKill {Tag = "Chosen_03"},
			FigureAbilityRemove	{Tag = "MG2_Elf_02", AbilityId = Ability.Immortal },
			FigureKill {Tag = "MG2_Elf_02"},
			FigureAttackEntity	{Tag = "Chosen_01", TargetTag = "Chosen_05"},
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
			CutsceneSayIsDone {},			
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSSARIEL01", Tag = "pl_HumanHeroSariel"},			
		},	
	},	
	
	OnOneTimeEvent	
	{
		Conditions =
		{			
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 7},
		},
		Actions =
		{
			FigureKill {Tag = "pl_HumanHeroSariel"},
			
		},	
	},	
	
	OnOneTimeEvent	
	{
		Conditions =
		{			
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 9.0},
		},
		Actions =
		{
			--FigureAnimPlayLooped	{Tag = "pl_HumanHeroSariel", File = "addon2/gfx/figures/hero/figure_hero_female_sariel_diestill.ska"},
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroIO", X = 444.039, Y = 633.964},
			FigureLookAtDirection {Tag = "pl_HumanHeroIO", Direction = 200.535},
			CutsceneFigureTeleport {Tag = "CS_MG2_Chosen_Attack_Io", X = 444.709, Y = 636.087},
			FigureLookAtDirection {Tag = "CS_MG2_Chosen_Attack_Io", Direction = 325.623},		
			FigureAttackEntity	{Tag = "CS_MG2_Chosen_Attack_Io", TargetTag = "pl_HumanHeroIO"},	
			
		},	
	},	
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 7},
		},
		Actions =
		{
			FigureTeamTransfer {Tag = "pl_HumanAvatar", Team = "tm_Team1"},
			FigureTeleport {Tag = "pl_HumanAvatar", X = 445.088, Y = 635.002},
			FigureAttackEntity {Tag = "pl_HumanAvatar", TargetTag = "CS_MG2_Chosen_Attack_Io"},
		},	
	},	
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 9},
		},
		Actions =
		{
			FigureAbilityRemove	{Tag = "CS_MG2_Chosen_Attack_Io", AbilityId = Ability.Immortal },
			FigureKill {Tag = "CS_MG2_Chosen_Attack_Io"},
		},	
	},	
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 11},
		},
		Actions =
		{
			FigureAbilityRemove	{Tag = "CS_MG2_Chosen_Attack_Sariel", AbilityId = Ability.Immortal },
			FigureKill {Tag = "CS_MG2_Chosen_Attack_Sariel"},
			FigureAbilityRemove	{Tag = "MG2_Elf_05", AbilityId = Ability.Immortal },
			FigureKill {Tag = "MG2_Elf_05"},
			FigureAbilityRemove	{Tag = "Chosen_01", AbilityId = Ability.Immortal },
			FigureKill {Tag = "Chosen_01"},
			FigureAbilityRemove	{Tag = "Chosen_04", AbilityId = Ability.Immortal },
			FigureKill {Tag = "Chosen_04"},
			FigureAbilityRemove	{Tag = "Chosen_05", AbilityId = Ability.Immortal },
			FigureKill {Tag = "Chosen_05"},
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
		},	
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6},
		},
		Actions =
		{
			FigureAbilityRemove	{Tag = "CS_MG2_Chosen_Attack_Antara", AbilityId = Ability.Immortal },
			FigureKill {Tag = "CS_MG2_Chosen_Attack_Antara"},
			FigureAbilityRemove	{Tag = "CS_MG2_Chosen_Attack_Caine", AbilityId = Ability.Immortal },
			FigureKill {Tag = "CS_MG2_Chosen_Attack_Caine"},		
			EntityTimerStart {Name = "et_CStimer"},
			FigureVanish	{Tag = "MG2_Elf_01_DEAD"},
			FigureVanish	{Tag = "MG2_Elf_02_DEAD"},
			FigureVanish	{Tag = "MG2_Elf_03_DEAD"},
			FigureVanish	{Tag = "MG2_Elf_04_DEAD"},
			FigureVanish	{Tag = "MG2_Elf_05_DEAD"},
			FigureVanish	{Tag = "Chosen_01_DEAD"},
			FigureVanish	{Tag = "Chosen_02_DEAD"},
			FigureVanish	{Tag = "Chosen_03_DEAD"},
			FigureVanish	{Tag = "Chosen_04_DEAD"},
			FigureVanish	{Tag = "Chosen_05_DEAD"},
			FigureVanish	{Tag = "CS_MG2_Chosen_Attack_Caine_DEAD"},
			FigureVanish	{Tag = "CS_MG2_Chosen_Attack_Sariel_DEAD"},
			FigureVanish	{Tag = "CS_MG2_Chosen_Attack_Io_DEAD"},
			FigureVanish	{Tag = "CS_MG2_Chosen_Attack_Antara_DEAD"},
			
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			FigureForcedWalk {Tag = "pl_HumanAvatar", X = 439.699, Y = 640.428},
		},	
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 7},
			FigureIsInRange {Tag = "pl_HumanAvatar",X = 439.699, Y = 640.428, Range = 2 },
		},
		Actions =
		{
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 50.603},
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_down.ska"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.17},
		},
		Actions =
		{
			FigureAnimPlayLooped	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_hold.ska"},
		},
	},
	OnOneTimeEvent	
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroAntara"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroSariel"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroIO"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSCAINE02",Tag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent
	{
		Conditions =
		{
			
			CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},		
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_21", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce	{Tag = "pl_HumanAvatar", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_up.ska"},
		},	
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 7},		
		},
		Actions =
		{
			CutsceneSay {TextTag = "MGRETURNSAVATAR01", Tag = "pl_HumanAvatar"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene10",
	},	
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},		
		},
		Actions =
		{
			FigureForcedWalk {Tag = "pl_HumanHeroCaine", X = 443.837, Y = 639.029},
		},	
	},	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 8},		
			FigureIsInRange {Tag = "pl_HumanHeroCaine", X = 443.837, Y = 639.029, Range = 2},
		},
		Actions =
		{
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 308.434},
			CutsceneSay {TextTag = "MGRETURNSCAINE03", Tag = "pl_HumanHeroCaine"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene11",
	},	
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_down.ska"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.17},
		},
		Actions =
		{
			FigureAnimPlayLooped	{Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_hold.ska"},
		},
	},
	OnOneTimeEvent	
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6},
		},
		Actions =
		{
			--FigureHealthSet {Tag = "pl_HumanHeroSariel", Percent = 100},
			--FigureAnimPlayOnce	{Tag = "pl_HumanHeroSariel", File = "addon2/gfx/figures/hero/figure_hero_female_sariel_Idel.ska"},
			ResurrectParty {Tag = "pl_Human", TargetTag = "HeroSariel"},
			EffectStartAtEntityPosition {Tag = "pl_HumanHeroSariel", File = "Effect_Spawn_Unit"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 8},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "pl_HumanHeroCaine", File = "base/gfx/figures/hero/figure_hero_male_emote_kneel_up.ska"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};


State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSANTARA02", Tag = "pl_HumanHeroAntara"},		
			EntityTimerStart {Name = "et_CStimer"},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 439.439, Y = 634.395},
			FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 130.817},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 446.958, Y = 639.707},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 308.434},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroIO", X = 444.039, Y = 633.964},
			FigureLookAtDirection {Tag = "pl_HumanHeroIO", Direction = 200.535},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroSariel", X = 442.006, Y = 640.459},
			FigureLookAtDirection {Tag = "pl_HumanHeroSariel", Direction = 40.107},
			CutsceneFigureTeleport {Tag = "CS_MG2_Twiddle", X = 490.116, Y = 663.937},
			FigureLookAtDirection {Tag = "CS_MG2_Twiddle", Direction = 302.704},			
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 439.699, Y = 640.428},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 50.603},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSCAINE04", Tag = "pl_HumanHeroCaine"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene15",
	},
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSAVATAR02", Tag = "pl_HumanAvatar"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSIO01", Tag = "pl_HumanHeroIO"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSCAINE05", Tag = "pl_HumanHeroCaine"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene18",
	},
};

State
{
	StateName = "Cutscene18",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSANTARA03", Tag = "pl_HumanHeroAntara"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene19",
	},
};

State
{
	StateName = "Cutscene19",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSCAINE06", Tag = "pl_HumanHeroCaine"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene20",
	},
};

State
{
	StateName = "Cutscene20",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_15", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSSARIEL02", Tag = "pl_HumanHeroSariel"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene21",
	},
};

State
{
	StateName = "Cutscene21",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSCAINE07", Tag = "pl_HumanHeroCaine"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene22",
	},
};

State
{
	StateName = "Cutscene22",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_16", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSIO02", Tag = "pl_HumanHeroIO"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene23",
	},
};

State
{
	StateName = "Cutscene23",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSAVATAR03", Tag = "pl_HumanAvatar"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene24",
	},
};

State
{
	StateName = "Cutscene24",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSCAINE08", Tag = "pl_HumanHeroCaine"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene25",
	},
};

State
{
	StateName = "Cutscene25",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			FigureTeleportToEntity {Tag = "CS_MG2_Twiddle", TargetTag = "Twiddle_Walk_Start"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_13", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureForcedWalk {Tag = "CS_MG2_Twiddle", X = 443.433 ,Y = 641.14},
		},
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			FigureIsInRange  {Tag = "CS_MG2_Twiddle", X = 443.433 ,Y = 641.14, Range = 2},
		},
		Actions =
		{
			FigureLookAtDirection {Tag = "CS_MG2_Twiddle", Direction = 348.541},
			CutsceneSay {TextTag = "MGRETURNSTWIDDLE01", Tag = "CS_MG2_Twiddle"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene26",
	},
};

State
{
	StateName = "Cutscene26",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSCAINE09", Tag = "pl_HumanHeroCaine"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene27",
	},
};

State
{
	StateName = "Cutscene27",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_14", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSTWIDDLE02", Tag = "CS_MG2_Twiddle"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene28",
	},
};

State
{
	StateName = "Cutscene28",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_18", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSTWIDDLE03", Tag = "CS_MG2_Twiddle"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene29",
	},
};

State
{
	StateName = "Cutscene29",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_16", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSIO03", Tag = "pl_HumanHeroIO"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene30",
	},
};

State
{
	StateName = "Cutscene30",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_14", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSTWIDDLE04", Tag = "CS_MG2_Twiddle"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene31",
	},
};

State
{
	StateName = "Cutscene31",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSCAINE10", Tag = "pl_HumanHeroCaine"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene32",
	},
};

State
{
	StateName = "Cutscene32",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_17", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSTWIDDLE05", Tag = "CS_MG2_Twiddle"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene33",
	},
};

State
{
	StateName = "Cutscene33",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_18", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSTWIDDLE06", Tag = "CS_MG2_Twiddle"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene34",
	},
};

State
{
	StateName = "Cutscene34",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSSARIEL03", Tag = "pl_HumanHeroSariel"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene35",
	},
};

State
{
	StateName = "Cutscene35",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSCAINE11", Tag = "pl_HumanHeroCaine"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene36",
	},
};

State
{
	StateName = "Cutscene36",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_15", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSSARIEL04", Tag = "pl_HumanHeroSariel"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene37",
	},
};

State
{
	StateName = "Cutscene37",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_18", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSTWIDDLE07", Tag = "CS_MG2_Twiddle"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene38",
	},
};


State
{
	StateName = "Cutscene38",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSANTARA04", Tag = "pl_HumanHeroAntara"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene39",
	},
};

State
{
	StateName = "Cutscene39",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_18", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSTWIDDLE08", Tag = "CS_MG2_Twiddle"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene40",
	},
};

State
{
	StateName = "Cutscene40",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSIO04", Tag = "pl_HumanHeroIO"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene41",
	},
};

State
{
	StateName = "Cutscene41",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_17", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSTWIDDLE09", Tag = "CS_MG2_Twiddle"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene42",
	},
};

State
{
	StateName = "Cutscene42",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSCAINE12", Tag = "pl_HumanHeroCaine"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene43",
	},
};

State
{
	StateName = "Cutscene43",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSAVATAR04", Tag = "pl_HumanAvatar"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene44",
	},
};

State
{
	StateName = "Cutscene44",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSCAINE13", Tag = "pl_HumanHeroCaine"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene45",
	},
};

State
{
	StateName = "Cutscene45",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSAVATAR05", Tag = "pl_HumanAvatar"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene46",
	},
};

State
{
	StateName = "Cutscene46",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSAVATAR06", Tag = "pl_HumanAvatar"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene47",
	},
};

State
{
	StateName = "Cutscene47",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_14", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSTWIDDLE10", Tag = "CS_MG2_Twiddle"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene48",
	},
};

State
{
	StateName = "Cutscene48",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSAVATAR07", Tag = "pl_HumanAvatar"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene49",
	},
};

State
{
	StateName = "Cutscene49",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_14", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSTWIDDLE11", Tag = "CS_MG2_Twiddle"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene50",
	},
};

State
{
	StateName = "Cutscene50",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CutsceneFigureTeleport {Tag = "MG2_Surian", X = 455.249, Y = 639.16},
			FigureLookAtDirection {Tag = "MG2_Surian", Direction = 279.786},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_19", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSSURIAN01", Tag = "MG2_Surian"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene51",
	},
};

State
{
	StateName = "Cutscene51",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_10_Take_07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MGRETURNSAVATAR08", Tag = "pl_HumanAvatar"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene52",
	},
};

State
{
	StateName = "Cutscene52",
	OnCutsceneFigureDespawnEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},	
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 7},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_CStimer"},			
--[[			FigureVanish	{Tag = "MG2_Elf_01_DEAD"},
			FigureVanish	{Tag = "MG2_Elf_02_DEAD"},
			FigureVanish	{Tag = "MG2_Elf_03_DEAD"},
			FigureVanish	{Tag = "MG2_Elf_04_DEAD"},
			FigureVanish	{Tag = "MG2_Elf_05_DEAD"},
			FigureVanish	{Tag = "Chosen_01_DEAD"},
			FigureVanish	{Tag = "Chosen_02_DEAD"},
			FigureVanish	{Tag = "Chosen_03_DEAD"},
			FigureVanish	{Tag = "Chosen_04_DEAD"},
			FigureVanish	{Tag = "Chosen_05_DEAD"},
			FigureVanish	{Tag = "CS_MG2_Chosen_Attack_Caine_DEAD"},
			FigureVanish	{Tag = "CS_MG2_Chosen_Attack_Sariel_DEAD"},
			FigureVanish	{Tag = "CS_MG2_Chosen_Attack_Io_DEAD"},
			FigureVanish	{Tag = "CS_MG2_Chosen_Attack_Antara_DEAD"},			--]]
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroAntara"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroSariel"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroIO"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			FadeInEffectStart{},
			CutsceneFigureRenderAll {},
			MapFlagSetTrue {Name = "mf_P502_EndActivityCS"},
			MapTimerStart {Name = "mt_P502_EndTimer"}
	},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
};