--************************************************************
--**
--**		Malangar Greens  :: Necropolis
--**
--************************************************************

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroCaine'",
		"'pl_HumanHeroIO'",
		"'pl_HumanHeroSariel'",
		"'pl_HumanHeroAntara'",
		"'cs_Necropolis_Gardian_01'",
		"'cs_Necropolis_Gardian_02'",
		"'cs_Necropolis_Gardian_03'",
		"'cs_Necropolis_Gardian_04'",
		"'cs_Necropolis_Gardian_05'",
		"'cs_Necropolis_Gardian_06'",
		"'cs_Necropolis_Gardian_07'",
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
			FigureVanish	{Tag = "Cutscene_03_Io"}, 
			FigureVanish	{Tag = "Cutscene_03_Caine"},
			FigureVanish	{Tag = "Cutscene_03_Antra"},
			FigureVanish	{Tag = "Cutscene_03_Sariel"},
			FigureVanish	{Tag = "Cutscene_03_Avatar"},
			
			FigureVanish	{Tag = "cs_Necropolis_Gardian_01"},
			FigureVanish	{Tag = "cs_Necropolis_Gardian_02"},
			FigureVanish	{Tag = "cs_Necropolis_Gardian_03"},
			FigureVanish	{Tag = "cs_Necropolis_Gardian_04"},
			FigureVanish	{Tag = "cs_Necropolis_Gardian_05"},
			FigureVanish	{Tag = "cs_Necropolis_Gardian_06"},
			FigureVanish	{Tag = "cs_Necropolis_Gardian_07"},
		},
		GotoState = self,
	};



	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P502_StartNecropolisCS"},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			
			CutsceneFigureTeleport {Tag = "pl_HumanHeroIO", X = 575.544, Y = 378.887},
			FigureLookAtDirection {Tag = "pl_HumanHeroIO", Direction = 154.699},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroIO", X = 575.544, Y = 378.887},
			FigureLookAtDirection {Tag = "pl_HumanHeroIO", Direction = 154.699},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 572.08, Y = 380.91},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 131.78},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 575.613, Y = 377.105},
			FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 165.195},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroSariel", X = 573.936, Y = 378.71},
			FigureLookAtDirection {Tag = "pl_HumanHeroSariel", Direction = 143.239},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 574.3, Y = 380.35},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 131.78},
			CutsceneFigureTeleport {Tag = "cs_Necropolis_Gardian_01", X = 591.703, Y = 392.627},
			FigureLookAtDirection {Tag = "cs_Necropolis_Gardian_01", Direction = 291.245},
			CutsceneFigureTeleport {Tag = "cs_Necropolis_Gardian_02", X = 595.926, Y = 390.657},
			FigureLookAtDirection {Tag = "cs_Necropolis_Gardian_02", Direction = 291.245},
			CutsceneFigureTeleport {Tag = "cs_Necropolis_Gardian_03", X = 594.655, Y = 393.254},
			FigureLookAtDirection {Tag = "cs_Necropolis_Gardian_03", Direction = 291.245},
			CutsceneFigureTeleport {Tag = "cs_Necropolis_Gardian_04", X = 590.026, Y = 395.99},
			FigureLookAtDirection {Tag = "cs_Necropolis_Gardian_04", Direction = 291.245},
			CutsceneFigureTeleport {Tag = "cs_Necropolis_Gardian_05", X = 591.207, Y = 400.386},
			FigureLookAtDirection {Tag = "cs_Necropolis_Gardian_05", Direction = 291.245},
			CutsceneFigureTeleport {Tag = "cs_Necropolis_Gardian_06", X = 592.317, Y = 397.858},
			FigureLookAtDirection {Tag = "cs_Necropolis_Gardian_06", Direction = 291.245},
			CutsceneFigureTeleport {Tag = "cs_Necropolis_Gardian_07", X = 593.465, Y = 395.711},
			FigureLookAtDirection {Tag = "cs_Necropolis_Gardian_07", Direction = 291.245},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroIO"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroAntara"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroSariel"},
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
			CameraTakeAddToTrack {File = "CS_03_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NECROPOLISAVATAR01", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_03_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6},
		},
		Actions =
		{
			CutsceneSay {TextTag = "NECROPOLISANTARA01", Tag = "pl_HumanHeroAntara"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene04",
	},	
};


State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	-- MG_Caine: CAINE01
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take_03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NECROPOLISCAINE01", Tag = "pl_HumanHeroCaine"},			
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
			CameraTakeAddToTrack {File = "CS_03_Take_05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NECROPOLISSARIEL01", Tag = "pl_HumanHeroSariel"},			
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
			CameraTakeAddToTrack {File = "CS_03_Take_04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NECROPOLISIO01", Tag = "pl_HumanHeroIO"},			
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
			CameraTakeAddToTrack {File = "CS_03_Take_07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NECROPOLISAVATAR02", Tag = "pl_HumanAvatar"},			
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
			--CutsceneSayIsDone {},	
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroIO"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroAntara"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroSariel"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			
			FigureVanish {Tag = "Necropolis_Gardian_01"},
			FigureVanish {Tag = "Necropolis_Gardian_02"},
			FigureVanish {Tag = "Necropolis_Gardian_03"},
			FigureVanish {Tag = "Necropolis_Gardian_04"},
			FigureVanish {Tag = "Necropolis_Gardian_05"},
			FigureVanish {Tag = "Necropolis_Gardian_06"},
			FigureVanish {Tag = "Necropolis_Gardian_07"},

			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			FadeInEffectStart{},
			CutsceneFigureRenderAll {},
			MapFlagSetTrue {Name = "mf_P502_EndNecropolisCS"},
	},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
};