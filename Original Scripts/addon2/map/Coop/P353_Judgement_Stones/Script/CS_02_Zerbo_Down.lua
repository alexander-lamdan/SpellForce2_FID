--************************************************************
--**														**
--**		Coop Judgement Stones Zerbo Down				**
--**														**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "Jandrim"}
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
	OnOneTimeEvent	-- Startbedingung für die Cutscenes
	{
		Conditions =
		{
			OR
			{
				MapFlagIsTrue {Name = "mf_Cutscene02"},
				AND
				{
					MapFlagIsTrue {Name = "mf_P353_First_Cutscene_Done"},
					FigureIsDead {Tag = "Zerbo"},
				},
			},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CSStartTimer"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- Kamera auf Truchsess und Prophet
	{
		Coop = true,
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CSStartTimer", Seconds = 2.2},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Akteure spawnen
			MapFlagSetTrue {Name = "mf_Spawn_Truchsess"},
			MapFlagSetTrue {Name = "mf_ReSpawn_Prophet"},
			-- Talkjobs werden in den Scripten der NPC direkt nach Spawn gestartet
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Prophet: Cutscene10
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Cutscene10", Tag = "Prophet"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Truchsess: Cutscene11
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6.2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Cutscene11", Tag = "Truchsess"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Prophet: Cutscene12
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6.4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Cutscene12", Tag = "Prophet"},
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6.6},
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
			MapFlagSetTrue	{Name = "mf_ZerboDead"},
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- Vanish der Akteure(alle Akteure Vanish, deshalb kein TalkJob-Stop)
			FigureVanish {Tag = "Prophet"},
			FigureVanish {Tag = "Truchsess"},
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};

