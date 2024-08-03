--************************************************************
--**														**
--**		Coop DraghLur Prophet Freed						**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "Prophet"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"''",
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
		},
	},
	OnCutsceneFigureRespawnEvent	-- Kamera auf Prophet
	{
		Coop = true,
		Conditions =
		{
			OR
			{
				MapFlagIsTrue	{Name = "mf_Cutscene01"},
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
			-- Vanish des Käfigs
			ObjectVanish {Tag = "Prophet_Cage"},
			-- Teleport der Akteure
			FigureTeleport {Tag = "Prophet", X = 423.979, Y = 663.416},
			FigureLookAtDirection {Tag = "Prophet", Direction = 0},
			-- Talkjobs
			FigureCutsceneTalkJobSet {Tag = "Prophet"},
			-- Weapon Hide
			CutsceneFigureWeaponsHide {Tag = "Prophet"},
			EntityTimerStart {Name = "et_CStimer"},

		},
		Tags = _tRenderList,
		Coop = true,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Prophet: Prophet1
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Prophet01", Tag = "Prophet"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Prophet: Prophet2
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6.1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Prophet02", Tag = "Prophet"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Prophet: Prophet3
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5.3},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Prophet03", Tag = "Prophet"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- Kurze Pause nach CutsceneSay
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5.8},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- Talkjobs werden beendet
			FigureStop   {Tag = "Prophet"},
			-- Weapon Show
			CutsceneFigureWeaponsShow {Tag = "Prophet"},
			-- Scriptingkram für die Map
			FigureVanish {Tag = "Prophet"},
			MapFlagSetTrue {Name = "mf_CutsceneDone"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};