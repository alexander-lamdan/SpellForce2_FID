--************************************************************
--**
--**		Iron Fields  :: Nadira CutScene
--**
--************************************************************

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Nadira'",
		"'pl_HumanHeroAntara'",		
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
			FigureVanish {Tag = "CS_02_IF_Avatar"},
			FigureVanish {Tag = "CS_02_IF_Antaris"},
			FigureVanish {Tag = "CS_02_IF_Nadira"},
		},
	},
	
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P501_StartNadiraCS"},
		},
		Actions =
		{
			_tRenderList,
		  CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroAntara"},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 192.007, Y = 635.258},
			FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 157.539},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 192.007, Y = 635.258},
			FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 157.539},
			CutsceneFigureTeleport {Tag = "Nadira", X = 211.049 , Y = 645.012},
			FigureLookAtDirection {Tag = "Nadira", Direction = 340.885},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 193.155, Y = 634.81},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 179.494},
			
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_00", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureForcedRun {Tag = "Nadira", X = 193.337, Y = 636.921},
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
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},	
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneFigureTeleport {Tag = "Nadira", X = 193.337, Y = 636.921},
			FigureLookAtDirection {Tag = "Nadira", Direction = 340.885},
			CutsceneSay {TextTag = "ATTACKNADIRA01", Tag = "Nadira"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene02",
	},	
};


State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CutsceneSay {TextTag = "ATTACKAVATAR01", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene03",
	},	
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- 
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
			CutsceneSay {TextTag = "ATTACKNADIRA02", Tag = "Nadira"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene04",
	},	
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ATTACKAVATAR02", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene05",
	},	
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CutsceneSay {TextTag = "ATTACKNADIRA03", Tag = "Nadira"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene06",
	},	
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CutsceneSay {TextTag = "ATTACKAVATAR03", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene07",
	},	
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CutsceneSay {TextTag = "ATTACKNADIRA04", Tag = "Nadira"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene08",
	},	
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CutsceneSay {TextTag = "ATTACKAVATAR04", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene09",
	},	
};


State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- 
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
			CutsceneSay {TextTag = "ATTACKNADIRA05", Tag = "Nadira"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene10",
	},	
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CutsceneSay {TextTag = "ATTACKNADIRA06", Tag = "Nadira"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene11",
	},	
};



State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ATTACKNADIRA07", Tag = "Nadira"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene12",
	},	
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CutsceneSay {TextTag = "ATTACKAVATAR05", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene13",
	},	
};


State
{
	StateName = "Cutscene13",
	OnCutsceneFigureDespawnEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},
			FigureVanish {Tag = "NoNameNpc"},
			MapFlagSetTrue {Name = "mf_P501_EndNadiraCS"},	
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroAntara"},
			FadeInEffectStart{},
		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
};