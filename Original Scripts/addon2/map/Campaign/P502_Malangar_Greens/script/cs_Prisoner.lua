--************************************************************
--**
--**		Malangar Greens  :: Elf Base
--**
--************************************************************

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'MG_Pact_prisoner'",
	}
}

State
{
	StateName = "INIT",
	
	OnCutsceneFigureRespawnEvent	
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P502_StartPrisonerCS"},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			
			CutsceneFigureTeleport {Tag = "MG_Pact_prisoner", X = 336.099, Y = 220.464},
			FigureLookAtDirection {Tag = "MG_Pact_prisoner", Direction = 85.9437},
			CutsceneFigureTeleport {Tag = "MG_Pact_prisoner", X = 336.099, Y = 220.464},
			FigureLookAtDirection {Tag = "MG_Pact_prisoner", Direction = 85.9437},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 337.916, Y = 219.826},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 255.905},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_09_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "PRISONERSKERG01", Tag = "MG_Pact_prisoner"},
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
			CameraTakeAddToTrack {File = "CS_09_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "PRISONERAVATAR01", Tag = "pl_HumanAvatar"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene03",
	},	
};

State
{
	StateName = "Cutscene03",
	OnCutsceneFigureDespawnEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},	
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			FadeInEffectStart{},
			CutsceneFigureRenderAll {},
			MapFlagSetTrue {Name = "mf_P502_EndPrisonerCS"},
	},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
};