--************************************************************
--**
--**		Dream  :: Start CutScene
--**
--************************************************************

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		--"'pl_HumanHeroAntara'",
		"'DR_Antara'",
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
			FigureVanish {Tag = "CS_01_DR_Avatar"},
		},
	},

	
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P500_StartArriveCS"},
		},
		Actions =
		{
			_tRenderList,
		  CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "DR_Antara"},
			
			CutsceneFigureTeleport {Tag = "DR_Antara", X = 446.091, Y = 653.25 },
			FigureLookAtDirection {Tag = "DR_Antara", Direction = 120},
			
			CutsceneFigureTeleport {Tag = "DR_Antara", X = 446.091, Y = 653.25 },
			FigureLookAtDirection {Tag = "DR_Antara", Direction = 120},
			
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 450.803, Y = 652.907  },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 300},
			
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 450.803, Y = 652.907 },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 300},
					
			--FigureAnimPlayOnce	{Tag = "DR_Antara", File = "base/gfx/figures/hero/figure_hero_female_talkspecial_1.ska"},
			
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
			CameraTakeAddToTrack {File = "CS_01_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "AwakeCS01", Tag = "DR_Antara"},
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
			CameraTakeAddToTrack {File = "CS_01_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "AwakeCS02", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_01_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "AwakeCS03", Tag = "DR_Antara"},
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
			CameraTakeAddToTrack {File = "CS_01_Take_03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "AwakeCS04", Tag = "DR_Antara"},
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
			CameraTakeAddToTrack {File = "CS_01_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "AwakeCS05", Tag = "pl_HumanAvatar"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "AwakeCS06", Tag = "DR_Antara"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene07",
	},	
};

State
{
	StateName = "Cutscene07",
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
			CutsceneFigureWeaponsShow {Tag = "DR_Antara"},
			FadeInEffectStart{},
			MapFlagSetTrue {Name = "mf_P500_EndArriveCS"},

		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
	
};




