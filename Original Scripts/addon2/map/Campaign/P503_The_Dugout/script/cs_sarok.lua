--************************************************************
--**
--**		Winterlight Peak Wind
--**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroCaine'",
		"'pl_HumanHeroSariel'",
		"'D_dwarf_sarok'",
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
			FigureVanish	{Tag = "Cutscene_Sariel_01"}, 
			FigureVanish	{Tag = "Cutscene_Avatar_01"},
			FigureVanish	{Tag = "Cutscene_Caine_01"},
			
		},
		GotoState = self,
	};



	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P503_StartSarokCut"},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			-- Teleport und Ausrichtung der Akteure
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 255.26, Y = 278.355},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 17.1887},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 255.26, Y = 278.355},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 17.1887},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroSariel", X = 257.025, Y = 277.384},
			FigureLookAtDirection {Tag = "pl_HumanHeroSariel", Direction = 319.893},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 253.75, Y = 277.046},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 40.107},
			-- Waffen werden nicht dargestellt
			CutsceneFigureWeaponsHide {Tag = "D_dwarf_sarok"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroSariel"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
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
	OnOneTimeEvent	-- MG_Sariel: SARIEL01
	{
		Conditions =
		{
		},
		Actions =
		{
			CutsceneSay {TextTag = "SAROK01", Tag = "D_dwarf_sarok"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- MG_Caine: CAINE01
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			
			CutsceneSay {TextTag = "AVATAR01", Tag = "pl_HumanAvatar"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene03",
	},	
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- pl_HumanAvatar: AVATAR02
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SAROK02", Tag = "D_dwarf_sarok"},			
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
			
			CutsceneSay {TextTag = "AVATAR02", Tag = "pl_HumanAvatar"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene05",
	},	
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- MG_Sariel: SARIEL01
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SAROK03", Tag = "D_dwarf_sarok"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- pl_HumanHeroPTwiddle: PTWIDDLE01
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CAINE01", Tag = "pl_HumanHeroCaine"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene07",
	},	
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- pl_HumanAvatar: AVATAR02
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "SAROK04", Tag = "D_dwarf_sarok"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene08",
	},	
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- MG_Caine: CAINE01
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			
			CutsceneSay {TextTag = "AVATAR03", Tag = "pl_HumanAvatar"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene09",
	},	
};


State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- pl_HumanAvatar: AVATAR02
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "SAROK05", Tag = "D_dwarf_sarok"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene10",
	},	
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- pl_HumanHeroPTwiddle: PTWIDDLE01
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "SARIEL01", Tag = "pl_HumanHeroSariel"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene11",
	},	
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- pl_HumanAvatar: AVATAR02
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SAROK06", Tag = "D_dwarf_sarok"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene12",
	},	
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- pl_HumanHeroPTwiddle: PTWIDDLE01
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "CAINE02", Tag = "pl_HumanHeroCaine"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene13",
	},	
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- pl_HumanAvatar: AVATAR02
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "SAROK07", Tag = "D_dwarf_sarok"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene14",
	},	
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- MG_Caine: CAINE01
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},		
			CutsceneSay {TextTag = "AVATAR04", Tag = "pl_HumanAvatar"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene15",
	},	
};

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- pl_HumanAvatar: AVATAR02
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "SAROK08", Tag = "D_dwarf_sarok"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene16",
	},	
};


State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- pl_HumanAvatar: AVATAR02
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "SAROK09", Tag = "D_dwarf_sarok"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene17",
	},	
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- MG_Caine: CAINE01
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			
			CutsceneSay {TextTag = "AVATAR05", Tag = "pl_HumanAvatar"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene18",
	},	
};

State
{
	StateName = "Cutscene18",
	OnCutsceneFigureDespawnEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "D_dwarf_sarok"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroSariel"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},	
			
			CutsceneFigureTeleportBack {Tag = "pl_HumanAvatar"},
			CutsceneFigureTeleportBack {Tag = "pl_HumanHeroSariel"},
			CutsceneFigureTeleportBack {Tag = "pl_HumanHeroCaine"},	
			
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},
			MapFlagSetTrue {Name = "mf_P503_EndSarokCut"},
	},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
};