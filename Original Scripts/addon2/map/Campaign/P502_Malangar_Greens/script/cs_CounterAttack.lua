--************************************************************
--**
--**		Malangar Greens  :: Counter Attack
--**
--************************************************************

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'Cutscene_06_Surian'",
		"'pl_HumanHeroAntara'",
		"'pl_HumanHeroSariel'",
		"'pl_HumanHeroCaine'",
		"'pl_HumanHeroIO'",
		"'Dwarf'",
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
			FigureVanish	{Tag = "Cutscene_07_Antra"},
			FigureVanish	{Tag = "Cutscene_07_Caine"},
			FigureVanish	{Tag = "Cutscene_07_Sariel"},
			FigureVanish	{Tag = "Cutscene_07_Avatar"},
			FigureVanish	{Tag = "Cutscene_06_Surian"},
		},
		GotoState = self,
	};



	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P502_StartAfterMathCS"},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 184.771, Y = 123.754},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 314.163},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 184.771, Y = 123.754},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 314.163},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroSariel", X = 180.359, Y = 124.694},
			FigureLookAtDirection {Tag = "pl_HumanHeroSariel", Direction = 45.8366},
			CutsceneFigureTeleport {Tag = "Cutscene_06_Surian", X = 182.321, Y = 111.82},
			FigureLookAtDirection {Tag = "Cutscene_06_Surian", Direction = 153.735},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 180.986, Y = 125.826},
			FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 34.3775},
--			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 182.687, Y = 125.741},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar",X = 182.687, Y = 125.741 },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 0},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroIO", X = 184.098, Y = 125.099},
			FigureLookAtDirection {Tag = "pl_HumanHeroIO", Direction = 342.811},
			CutsceneFigureTeleport {Tag = "Dwarf", X = 182.572, Y = 120.724},
			FigureLookAtDirection {Tag = "Dwarf", Direction = 188.113},
			FigureTeleportToEntity	{Tag = "Surian", TargetTag = "Start"},

			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroSariel"},
			CutsceneFigureWeaponsHide {Tag = "Dwarf"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroAntara"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroIO"},
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
			
			--FigureWalk	{Tag = "pl_HumanAvatar", X = 182.687, Y = 125.741 },
			CameraTakeAddToTrack {File = "CS_07_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			--FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 0},
			CutsceneSay {TextTag = "CONUTERDWARF01", Tag = "Dwarf"},
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
			CameraTakeAddToTrack {File = "CS_07_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CONUTERAVATAR01", Tag = "pl_HumanAvatar"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene03",
	},	
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- pl_HumanHeroCaine: CAINE01
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureTeleportToEntity	{Tag = "Surian", TargetTag = "Start"},
			CutsceneSay {TextTag = "CONUTERDWARF02", Tag = "Dwarf"},			
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
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CONUTERCAINE01", Tag = "pl_HumanHeroCaine"},			
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
			CameraTakeAddToTrack {File = "Cs_07_Take_04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CONUTERDWARF03", Tag = "Dwarf"},			
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
			CameraTakeAddToTrack {File = "Cs_07_Take_07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CONUTERANATARA01", Tag = "pl_HumanHeroAntara"},			
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
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CONUTERDWARF04", Tag = "Dwarf"},			
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
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 15},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CONUTERAVATAR02", Tag = "pl_HumanAvatar"},			
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
			CameraTakeAddToTrack {File = "CS_07_Take_04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CONUTERDWARF05", Tag = "Dwarf"},			
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
			CameraTakeAddToTrack {File = "CS_07_Take_05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CONUTERAVATAR03", Tag = "pl_HumanAvatar"},			
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
			CameraTakeAddToTrack {File = "CS_07_Take_06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CONUTERAVATAR04", Tag = "pl_HumanAvatar"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene12",
	},	
};


State
{
	StateName = "Cutscene12",
	OnCutsceneFigureDespawnEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 27},
		},
		Actions =
		{
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroSariel"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroAntara"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "Dwarf"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroIO"},

			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			FadeInEffectStart{},
			CutsceneFigureRenderAll {},
			MapFlagSetTrue {Name = "mf_P502_EndAfterMathCS"},
	},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
};