--************************************************************
--**
--**		Wastelands of Sorrows  :: Intro
--**
--************************************************************

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroCaine'",
		"'pl_HumanHeroSariel'",
		"'pl_HumanHeroAntara'",
		"'pl_HumanHeroIO'",
		"'CS_WOS_Twiddle'",
		"'Soulbender'",
		"'CS_01_ShadowWarrior'",
		"'cs_Surian'",
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
			FigureVanish {Tag = "Soulbender"},
			FigureVanish {Tag = "CS_WOS_Twiddle"},
			FigureVanish {Tag = "CS_01_WOS_Avatar"},
			FigureVanish {Tag = "CS_01_WOS_Io"},
			FigureVanish {Tag = "CS_01_WOS_Antra"},
			FigureVanish {Tag = "CS_01_WOS_Sariel"},
			FigureVanish {Tag = "CS_01_WOS_Caine"},
			FigureVanish {Tag = "CS_01_Shadow_04"},
			FigureVanish {Tag = "CS_01_Shadow_06"},
			FigureVanish {Tag = "CS_01_ShadowWarrior"},
			FigureVanish {Tag = "cs_Surian"},
			
		},
		GotoState = self,
	};



	OnCutsceneFigureRespawnEvent	
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P504_Start_Intro_Cut"},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 192.601, Y = 283.165},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 159.465},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 192.601, Y = 283.165},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 159.465},
			CutsceneFigureTeleport {Tag = "CS_WOS_Twiddle", X = 194.7, Y = 283.413},
			FigureLookAtDirection {Tag = "CS_WOS_Twiddle", Direction = 211.031},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroSariel", X = 197.001, Y = 286.36},
			FigureLookAtDirection {Tag = "pl_HumanHeroSariel", Direction = 279.786},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 197.388, Y = 283.49},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 256.868},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 197.919, Y = 285.664},
			FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 307.471},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroIO", X = 197.956, Y = 284.593},
			FigureLookAtDirection {Tag = "pl_HumanHeroIO", Direction = 268.327	},
			CutsceneFigureTeleport {Tag = "Soulbender", X = 161.199, Y = 210.698},
			FigureLookAtDirection {Tag = "Soulbender", Direction = 205.302},			
			CutsceneFigureTeleport {Tag = "CS_01_ShadowWarrior", X = 193.526, Y = 289.17},
			FigureLookAtDirection {Tag = "CS_01_ShadowWarrior", Direction = 314.163},	
			CutsceneFigureTeleport {Tag = "cs_Surian", X = 186.454, Y = 280.972},
			FigureLookAtDirection {Tag = "cs_Surian", Direction = 113.628},	
			--CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			---CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroPTwiddle"},
			--CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroSariel"},
			--CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},

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
			--CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_14", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHERESHADOWWARRIOR01", Tag = "CS_01_ShadowWarrior"},		
			FigureWalk {Tag = "CS_01_ShadowWarrior", X = 194.278, Y = 285.839},
			EntityTimerStart {Name = "et_CStimer"},
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
			CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "CS_01_ShadowWarrior", File = "base/gfx/figures/hero/figure_hero_male_attack_dagger_right_1.ska"},
			SoundGlobalPlayOnceAddon2	{File = "special/WoS_All_12"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 7},
		},
		Actions =
		{
			CutsceneFigureTeleport {Tag = "CS_WOS_Twiddle", X = 161.199, Y = 210.698},
			CutsceneFigureTeleport {Tag = "Soulbender", X = 194.853, Y = 283.471},
			FigureLookAtDirection {Tag = "Soulbender", Direction = 262.598},			
			EffectStartAtEntityPosition {Tag = "Soulbender", File = "Effect_Spawn_Unit"},
			--FigureAnimPlayOnce {Tag = "CS_WOS_Twiddle", File = "base/gfx/figures/hero/figure_hero_male_die.ska"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},
		},
		Actions =
		{
			--CutsceneFigureTeleport {Tag = "CS_WOS_Twiddle", X = 161.199, Y = 210.698},
			--CutsceneFigureTeleport {Tag = "Soulbender", X = 194.853, Y = 283.471},
			--FigureLookAtDirection {Tag = "Soulbender", Direction = 262.598},			
			--EffectStartAtEntityPosition {Tag = "Soulbender", File = "Effect_Spawn_Unit"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 8},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHERESOULBENDER01", Tag = "Soulbender"},		
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 18},
		},
		Actions =
		{
			SoundGlobalPlayOnceAddon2	{File = "special/WoS_Twiddle_14"},
			FigureKill {Tag = "Soulbender"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureVanish {Tag = "Soulbender_DEAD"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroSariel"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroAntara"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroIO"},
			CutsceneFigureWeaponsHide {Tag = "CS_01_ShadowWarrior"},
			CutsceneSay {TextTag = "WHERESHADOWWARRIOR02", Tag = "CS_01_ShadowWarrior"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};


State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- MG_Sariel: SARIEL01
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHERESARIEL01", Tag = "pl_HumanHeroSariel"},		
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
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHEREAVATAR01", Tag = "pl_HumanAvatar"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};


--[[State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHERESURIAN01", Tag = "cs_Surian"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};--]]

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS_01_Take_09", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHEREAVATAR02", Tag = "pl_HumanAvatar"},		
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
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHERESURIAN02", Tag = "cs_Surian"},		
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
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHEREAVATAR03", Tag = "pl_HumanAvatar"},		
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
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHERESURIAN03", Tag = "cs_Surian"},		
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
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHEREAVATAR04", Tag = "pl_HumanAvatar"},		
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
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHEREIO01", Tag = "pl_HumanHeroIO"},		
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
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHEREAVATAR05", Tag = "pl_HumanAvatar"},		
			EntityTimerStart {Name = "et_CStimer"},
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHERESHADOWWARRIOR03", Tag = "CS_01_ShadowWarrior"},		
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
			CameraTakeAddToTrack {File = "CS_01_Take_09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHEREAVATAR06", Tag = "pl_HumanAvatar"},		
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
			CameraTakeAddToTrack {File = "CS_01_Take_12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHEREANTARA01", Tag = "pl_HumanHeroAntara"},		
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHERESHADOWWARRIOR04", Tag = "CS_01_ShadowWarrior"},		
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHERECAINE01", Tag = "pl_HumanHeroCaine"},		
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHERESHADOWWARRIOR05", Tag = "CS_01_ShadowWarrior"},		
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHERECAINE02", Tag = "pl_HumanHeroCaine"},		
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_13", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHERESHADOWWARRIOR06", Tag = "CS_01_ShadowWarrior"},		
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHEREANTARA02", Tag = "pl_HumanHeroAntara"},		
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHERESHADOWWARRIOR07", Tag = "CS_01_ShadowWarrior"},		
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHEREAVATAR07", Tag = "pl_HumanAvatar"},		
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
--			CameraTrackClear {},
--			CameraTakeAddToTrack {File = "CS_01_Take_09", Tag = "default", TargetTag = "default"},
--			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHEREAVATAR08", Tag = "pl_HumanAvatar"},		
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHERESHADOWWARRIOR08", Tag = "CS_01_ShadowWarrior"},		
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHEREAVATAR09", Tag = "pl_HumanAvatar"},		
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
			CameraTakeAddToTrack {File = "CS_01_Take_05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHERESURIAN04", Tag = "cs_Surian"},		
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHERESHADOWWARRIOR09", Tag = "CS_01_ShadowWarrior"},		
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHEREANTARA03", Tag = "pl_HumanHeroAntara"},		
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_13", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHERESHADOWWARRIOR10", Tag = "CS_01_ShadowWarrior"},		
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "WHEREAVATAR10", Tag = "pl_HumanAvatar"},		
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene33",
	},
};

State
{
	StateName = "Cutscene33",
	OnCutsceneFigureDespawnEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},	
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6},
		},
		Actions =
		{
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroSariel"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroAntara"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroIO"},
			CutsceneFigureWeaponsShow {Tag = "CS_01_ShadowWarrior"},		
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},
			MapFlagSetTrue {Name = "mf_P504_End_Intro_Cut"},
			
		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
};