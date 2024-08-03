--************************************************************
--**														**
--**		Coop Fireforge Aya Freed						**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "Halicos"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Aya'",
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
			-- erste Cutscene Vanish
			FigureVanish {Tag = "CS_01_Avatar01"},
			FigureVanish {Tag = "CS_01_Avatar02"},
			FigureVanish {Tag = "CS_01_Avatar03"},
			FigureVanish {Tag = "CS_01_Halicos01"},
			FigureVanish {Tag = "CS_01_Halicos02"},
			FigureVanish {Tag = "CS_01_Halicos03"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- Kamera Halicos
	{
		Coop = true,
		Conditions =
		{
			OR
			{
				MapFlagIsTrue {Name = "mf_Cutscene01"},
				MapFlagIsTrue	   {Name = "mf_StartCutscene"},
			},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Vanish
			ObjectVanish {Tag = "Aya_Cage"},
			-- Teleport der Akteure
			FigureTeleport {Tag = "Halicos", X = 382.566, Y = 411.86},
			FigureLookAtDirection {Tag = "Halicos", Direction = 42.3989},
			FigureTeleport {Tag = "Aya", X = 388.08, Y = 406.668},
			FigureLookAtDirection {Tag = "Aya", Direction = 233.95},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "Aya"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "Aya"},
			CutsceneFigureWeaponsHide {Tag = "Halicos"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene00",
	},
};

State
{
	StateName = "Cutscene00",
	OnOneTimeEvent	-- Halicos geht zu Aya
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "Halicos", X = 386.126, Y = 408.511},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Aya: Cutscene01
	{
		Conditions =
		{
			FigureIsIdle {Tag = "Halicos"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Cutscene01", Tag = "Aya"},
			-- Talkjob Halicos
			FigureCutsceneTalkJobSet {Tag = "Halicos"},
			-- Ausrichten von Halicos
			FigureLookAtDirection {Tag = "Halicos", Direction = 51.5662},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Halicos: Cutscene02
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Cutscene02", Tag = "Halicos"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Aya: Cutscene03
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.85},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Cutscene03", Tag = "Aya"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Halicos: Cutscene04
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.1},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Cutscene04", Tag = "Halicos"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Aya: Cutscene05
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Cutscene05", Tag = "Aya"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- Aya: Cutscene06
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4.4},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Cutscene06", Tag = "Aya"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Halicos: Cutscene07
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 9.7},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Cutscene07", Tag = "Halicos"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Aya: Cutscene08
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Cutscene08", Tag = "Aya"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08b",
	},
};

State
{
	StateName = "Cutscene08b",
	OnOneTimeEvent	-- Halicos geht zu den Avataren
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureSimpleWalk {Tag = "Halicos", X = 381.849, Y = 410.848},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Halicos: Cutscene09
	{
		Conditions =
		{
			FigureIsIdle {Tag = "Halicos"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			CutsceneSay {TextTag = "Cutscene09", Tag = "Halicos"},
			FigureLookAtDirection {Tag = "Halicos", Direction = 240},			
			FigureCutsceneTalkJobSet {Tag = "Halicos"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Kurze Pause nach CutsceneSay
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5.2},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_MissionDone"},
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- Talkjobs werden beendet
			FigureStop {Tag = "Aya"},
			FigureStop {Tag = "Halicos"},
			-- Weapons Show
			CutsceneFigureWeaponsShow {Tag = "Aya"},
			CutsceneFigureWeaponsShow {Tag = "Halicos"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};