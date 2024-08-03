
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroCaine'",
		"'pl_HumanHeroSariel'",
		"'pl_HumanHeroAntara'",
		"'pl_HumanHeroIO'",
		"'pl_HumanHeroShadowWarrior'",
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
			FigureVanish {Tag = "Cutscene_Sariel_01"},
			FigureVanish {Tag = "Cutscene_Caine_01"},
			FigureVanish {Tag = "Cutscene_Twiddle_01"},
			FigureVanish {Tag = "Cutscene_Avatar_01"},
			FigureVanish {Tag = "Cutscene_Avatar_02"},	
			FigureVanish {Tag = "Cutscene_02_Io"},	
			FigureVanish {Tag = "Cutscene_02_ShadowWarrior"},	
			FigureVanish {Tag = "Cutscene_02_Antara"},	
		},
		GotoState = self,
	};



	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P504_Start_Teleport_Cut"},
				MapTimerIsElapsed {Name = "mt_P504_CutScene_Timer", Seconds = 3},
				OR
				{
						FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = "marker_teleport_cutscene_01", Range = 10},
						FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = "marker_teleport_cutscene_02", Range = 10},
						FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = "marker_teleport_cutscene_03", Range = 10},
						FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = "marker_teleport_cutscene_04", Range = 10},
						FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = "marker_teleport_cutscene_05", Range = 10},
						FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = "marker_teleport_cutscene_06", Range = 10},
						FigureIsInRangeToEntity {Tag = "pl_HumanAvatar", TargetTag = "marker_teleport_cutscene_07", Range = 10},
				},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 335.259, Y = 369.821},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 84.9805},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 335.259, Y = 369.821},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 84.9805},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 337.276, Y = 365.554},
			FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 142.276},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroSariel", X = 334.754, Y = 371.27},
			FigureLookAtDirection {Tag = "pl_HumanHeroSariel", Direction = 80.2141},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 335.959, Y = 373.131},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 45.8366},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroIO", X = 335.542, Y = 366.645},
			FigureLookAtDirection {Tag = "pl_HumanHeroIO", Direction = 113.628},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroShadowWarrior", X = 334.482, Y = 367.601},
			FigureLookAtDirection {Tag = "pl_HumanHeroShadowWarrior", Direction = 114.592},
			
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroSariel"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroAntara"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroIO"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroShadowWarrior"},
			
			EntityTimerStart {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			MapTimerStop {Name = "mt_P504_CutScene_Timer"},
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "Cutscene011",
	},
};


State
{
	StateName = "Cutscene011",
	OnOneTimeEvent	
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 8},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CHASMAVATAR01", Tag = "pl_HumanAvatar"},		
			EntityTimerStart {Name = "et_CStimer"},

		},
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
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CutsceneSay {TextTag = "CHASMSHADOWWARRIOR01", Tag = "pl_HumanHeroShadowWarrior"},
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
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CHASMANTARA01", Tag = "pl_HumanHeroAntara"},			
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
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CHASMAVATAR02", Tag = "pl_HumanAvatar"},			
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
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
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
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 369.56, Y = 371.322 },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 228.22},
			EffectStartAtEntityPosition {Tag = "pl_HumanAvatar",File = "Effect_Spawn_Unit"},
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
			--CutsceneSayIsDone {},	
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CHASMAVATAR03", Tag = "pl_HumanAvatar"},						
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
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CHASMANTARA02", Tag = "pl_HumanHeroAntara"},		
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
			CutsceneSayIsDone {},	
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 335.259, Y = 369.821},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 84.9805},
			EffectStartAtEntityPosition {Tag = "pl_HumanAvatar",File = "Effect_Spawn_Unit"},
			CutsceneSay {TextTag = "CHASMAVATAR04", Tag = "pl_HumanAvatar"},		
			EntityTimerStart {Name = "et_CStimer"},
		},	 
		GotoState = "Cutscene08",
	},	
};


State
{
	StateName = "Cutscene08",
	OnCutsceneFigureDespawnEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroSariel"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroAntara"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroIO"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroShadowWarrior"},
			
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},
			MapFlagSetTrue {Name = "mf_P504_End_Teleport_Cut"},	
		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
};