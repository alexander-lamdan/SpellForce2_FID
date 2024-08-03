--************************************************************
--**
--**		Dream  :: Garrett CutScene
--**
--************************************************************

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroAntara'",
		"'Commander_Garret'",
		--"'DR_Antara'",
		
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
			FigureVanish	{Tag = "CS_04_DR_Avatar"},
			FigureVanish	{Tag = "CS_04_DR_Antara"},
			FigureVanish	{Tag = "CS_04_DR_Scout"},
			
		},
	},

	
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P500_StartGarrettCS"},
		},
		Actions =
		{
			_tRenderList,
		  CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroAntara"},
			CutsceneFigureWeaponsHide {Tag = "Commander_Garret"},
			
			CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 348.281, Y = 632.649 },
			FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 190},
			
			CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 348.281, Y = 632.649 },
			FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 190},
			
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 351.418, Y = 634.118 },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 220},
			
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 351.418, Y = 634.118 },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 220},
					
			FigureLookAtDirection {Tag = "Commander_Garret", Direction = 354},

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
			
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "BadFeelCS01", Tag = "Commander_Garret"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "BadFeelCS02", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_04_Take_03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "BadFeelCS03", Tag = "Commander_Garret"},
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
			CameraTakeAddToTrack {File = "CS_04_Take_04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "BadFeelCS04", Tag = "pl_HumanAvatar"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take_05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "BadFeelCS05", Tag = "Commander_Garret"},
			NoSpawnEffect	{Spawn = FigureNpcSpawnToEntity	{Tag = "DR_Scout", Level = 5, UnitId = 303, TargetTag = "DR_ScoutSpawn", Team = "tm_Team1"},},					
			CutsceneFigureWeaponsHide {Tag = "DR_Scout"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "RunScoutRun",
	},	
};

State
{
	StateName = "RunScoutRun",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},	
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			FigureRun	{Tag = "DR_Scout",X = 349.062, Y = 634.685 },
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0},
			--CutsceneSayIsDone {},	
			--FigureIsIdle	{Tag = "DR_Scout"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take_03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "BadFeelCS06", Tag = "DR_Scout"},
			EntityTimerStart {Name = "et_CStimer"},
			--FigureHealthSubtract	{Tag = "DR_Scout", Percent = 110},
		},	
		GotoState = "ScoutDie",
	},	
};

State
{
	StateName = "ScoutDie",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			FigureIsIdle	{Tag = "DR_Scout"},
			--CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			FigureKill	{Tag = "DR_Scout"},
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		--			CutsceneSayIsDone {},	
		},
		Actions =
		{
			
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take_07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "BadFeelCS07", Tag = "Commander_Garret"},
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
			
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take_08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "BadFeelCS08", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_04_Take_09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "BadFeelCS09", Tag = "Commander_Garret"},
			EntityTimerStart {Name = "et_CStimer"},
			
			
		},	
		GotoState = "Cutscene10",
	},	
};


State
{
	StateName = "Cutscene10",
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
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroAntara"},
			CutsceneFigureWeaponsShow {Tag = "Commander_Garret"},			
			FadeInEffectStart{},
			MapFlagSetTrue {Name = "mf_P500_EndGarrettCS"},

		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
	
};




