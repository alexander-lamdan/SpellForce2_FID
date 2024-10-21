--************************************************************
--**
--**		Malangar Greens  :: INTRO
--**
--************************************************************

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'cs_Surian'",
		"'Cutscene_01_Twiddle'",
		"'pl_HumanHeroAntara'",
		"'MG_Sariel'",
		"'MG_Caine'",
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
			FigureVanish	{Tag = "Cutscene_01_Twiddle"}, 
			FigureVanish	{Tag = "Cutscene01_Antra"},
			FigureVanish	{Tag = "Cutscene02_Sariel"},
			FigureVanish	{Tag = "Cutscene02_Caine"},
			FigureVanish	{Tag = "Cutscene01_Avatar"},
			FigureVanish	{Tag = "cs_surian"},
		},
		GotoState = self,
	};



	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P502_StartCaineSarielCS"},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			
			CutsceneFigureTeleport {Tag = "MG_Caine", X = 218.394, Y = 529.223},
			FigureLookAtDirection {Tag = "MG_Caine", Direction = 354.27},
			CutsceneFigureTeleport {Tag = "MG_Caine", X = 218.394, Y = 529.223},
			FigureLookAtDirection {Tag = "MG_Caine", Direction = 354.27},
			CutsceneFigureTeleport {Tag = "MG_Sariel", X = 217.981, Y = 530.933},
			FigureLookAtDirection {Tag = "MG_Sariel", Direction = 0},
			CutsceneFigureTeleport {Tag = "cs_Surian", X = 204.297, Y = 472.871},
			FigureLookAtDirection {Tag = "cs_Surian", Direction = 130.817},
			CutsceneFigureTeleport {Tag = "Cutscene_01_Twiddle", X = 207.222, Y = 477.482},
			FigureLookAtDirection {Tag = "Cutscene_01_Twiddle", Direction = 97.4024},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 209.553, Y = 475.58},
			FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 222.49},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 210.666, Y = 477.253},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 245.408},

			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "Cutscene_01_Twiddle"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroAntara"},
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
			CameraTakeAddToTrack {File = "CS_01_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "INTROAVATAR01", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_01_Take_03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "INTROANATAR01", Tag = "pl_HumanHeroAntara"},			
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
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "INTROSURIAN01", Tag = "cs_Surian"},			
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
			CameraTakeAddToTrack {File = "CS_01_Take_05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "INTROANATAR02", Tag = "pl_HumanHeroAntara"},			
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
			CameraTakeAddToTrack {File = "CS_01_Take_07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "INTROSURIAN02", Tag = "cs_Surian"},			
			FigureWalk {Tag = "cs_Surian",X = 143.266, Y = 391.143},
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
			CameraTakeAddToTrack {File = "CS_01_Take_04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureVanish {Tag = "cs_Surian"},
			CutsceneSay {TextTag = "INTROAVATAR03", Tag = "pl_HumanAvatar"},			
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
			CameraTakeAddToTrack {File = "CS_02_Take48", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "INTROTWIDDLE01", Tag = "Cutscene_01_Twiddle"},			
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 15},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "INTROAVATAR04", Tag = "pl_HumanAvatar"},			
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
			CameraTakeAddToTrack {File = "CS_02_Take_05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "INTROTWIDDLE02", Tag = "Cutscene_01_Twiddle"},			
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
			CameraTakeAddToTrack {File = "CS_01_Take_04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "INTROAVATAR05", Tag = "pl_HumanAvatar"},			
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
			CameraTakeAddToTrack {File = "CS_02_Take_05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "INTROTWIDDLE03", Tag = "Cutscene_01_Twiddle"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene12",
	},	
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_97", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "INTROANATAR03", Tag = "pl_HumanHeroAntara"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene13",
	},	
};


State
{
	StateName = "Cutscene13",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_99", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneFigureTeleportToEntity {Tag = "MG_Caine", TargetTag = "Cutscene_Sariel_05" },
			FigureLookAtDirection {Tag = "MG_Caine", Direction = 0},
			CutsceneFigureTeleportToEntity {Tag = "MG_Sariel", TargetTag = "Cutscene_Caine_03"},
			FigureLookAtDirection {Tag = "MG_Sariel", Direction = 0},
			FigureForcedWalk {Tag = "MG_Caine", X = 210.278,Y = 479.056},
			FigureForcedWalk {Tag = "MG_Sariel", X = 208.86,Y = 480.606},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene14",
	},	
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6},
		},
		Actions =
		{
			CutsceneFigureTeleport {Tag = "MG_Caine", X = 210.278,Y = 479.056},
			FigureLookAtDirection {Tag = "MG_Caine", Direction = 319.893},
			CutsceneFigureTeleport {Tag = "MG_Sariel", X = 208.86,Y = 480.606 },
			FigureLookAtDirection {Tag = "MG_Sariel", Direction = 336.119},
			CutsceneFigureWeaponsHide {Tag = "MG_Caine"},
			CutsceneFigureWeaponsHide {Tag = "MG_Sariel"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_98", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MEETCAINE01", Tag = "MG_Caine"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene15",
	},	
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_96", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MEETSARIEL01", Tag = "MG_Sariel"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene16",
	},	
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take_04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MEETAVATAR01", Tag = "pl_HumanAvatar"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene17",
	},	
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MEETCAINE02", Tag = "MG_Caine"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene18",
	},	
};

State
{
	StateName = "Cutscene18",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MEETSARIEL02", Tag = "MG_Sariel"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene19",
	},	
};

State
{
	StateName = "Cutscene19",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MEETCAINE03", Tag = "MG_Caine"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene20",
	},	
};

State
{
	StateName = "Cutscene20",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MEETSARIEL03", Tag = "MG_Sariel"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene21",
	},	
};

State
{
	StateName = "Cutscene21",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MEETTWIDDLE01", Tag = "Cutscene_01_Twiddle"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene22",
	},	
};


State
{
	StateName = "Cutscene22",
	OnOneTimeEvent
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
			CutsceneSay {TextTag = "MEETCAINE04", Tag = "MG_Caine"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene23",
	},	
};

State
{
	StateName = "Cutscene23",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MEETTWIDDLE02", Tag = "Cutscene_01_Twiddle"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene24",
	},	
};

State
{
	StateName = "Cutscene24",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_96", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MEETSARIEL04", Tag = "MG_Sariel"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene25",
	},	
};

State
{
	StateName = "Cutscene25",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MEETCAINE05", Tag = "MG_Caine"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene26",
	},	
};

State
{
	StateName = "Cutscene26",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MEETAVATAR02", Tag = "pl_HumanAvatar"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene27",
	},	
};

State
{
	StateName = "Cutscene27",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_96", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MEETSARIEL05", Tag = "MG_Sariel"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene28",
	},	
};

State
{
	StateName = "Cutscene28",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_95", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MEETCAINE06", Tag = "MG_Caine"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene29",
	},	
};

State
{
	StateName = "Cutscene29",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CutsceneSay {TextTag = "MEETSARIEL06", Tag = "MG_Sariel"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene30",
	},	
};

State
{
	StateName = "Cutscene30",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "MEETTWIDDLE03", Tag = "Cutscene_01_Twiddle"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene31",
	},	
};

State
{
	StateName = "Cutscene31",
	OnOneTimeEvent
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
			CutsceneSay {TextTag = "MEETCAINE07", Tag = "MG_Caine"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene32",
	},	
};


State
{
	StateName = "Cutscene32",
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
			CutsceneFigureWeaponsShow {Tag = "Cutscene_01_Twiddle"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroAntara"},
			FigureVanish {Tag = "MG_Caine"},
			FigureVanish {Tag = "MG_Sariel"},
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			FadeInEffectStart{},
			CutsceneFigureRenderAll {},
			MapFlagSetTrue {Name = "mf_P502_EndCaineSarielCS"},
	},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
};