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
		
		"'MG_Army_01'",
		"'MG_Army_02'",
		"'MG_Army_03'",
		"'MG_Army_04'",
		"'MG_Army_05'",
		"'MG_Army_06'",
		"'MG_Army_07'",
		"'MG_Army_08'",
		"'MG_Army_09'",
		"'MG_Army_10'",
		"'MG_Army_11'",
		"'MG_Army_12'",
		"'MG_Army_13'",
		"'MG_Army_14'",
		"'MG_Army_15'",
		"'MG_Army_16'",
		"'MG_Army_17'",
		"'MG_Army_18'",
		"'MG_Army_19'",
		"'MG_Army_20'",
		"'MG_Army_21'",
		"'MG_Army_22'",
		"'MG_Army_23'",
		"'MG_Army_24'",
		"'MG_Army_25'",
		--"'MG_Army_26'",
		"'MG_Army_27'",
		--"'MG_Army_28'",
		"'MG_Army_29'",
		"'MG_Army_30'",
		"'MG_Army_31'",
		"'MG_Army_32'",
		"'MG_Army_33'",
		"'MG_Army_34'",
		"'MG_Army_35'",
		"'MG_Army_36'",
		"'MG_Army_37'",
		"'MG_Army_38'",
		"'MG_Army_39'",
		"'MG_Army_40'",
		"'MG_Army_41'",
		"'MG_Army_42'",
		"'MG_Army_43'",
		"'MG_Army_44'",
		"'MG_Army_45'",
		"'MG_Army_46'",
		"'MG_Army_47'",
		"'MG_Army_48'",
		"'MG_Army_49'",
		"'MG_Army_50'",	
		
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
			FigureVanish	{Tag = "Cutscene_04_Io"}, 
			FigureVanish	{Tag = "Cutscene_04_Caine"},
			FigureVanish	{Tag = "Cutscene_04_Antra"},
			FigureVanish	{Tag = "Cutscene_04_Sariel"},
			FigureVanish	{Tag = "Cutscene_04_Avatar"},
		},
		GotoState = self,
	};



	OnCutsceneFigureRespawnEvent	 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P502_StartNamelessArmyCS"},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			
			CutsceneFigureTeleport {Tag = "pl_HumanHeroIO", X = 586.327, Y = 395.825},
			FigureLookAtDirection {Tag = "pl_HumanHeroIO", Direction = 0},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroIO", X = 586.327, Y = 395.825},
			FigureLookAtDirection {Tag = "pl_HumanHeroIO", Direction = 0},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 588.617, Y = 393.946},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 0},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 590.603, Y = 392.534},
			FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 296.975},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroSariel", X = 587.994, Y = 396.864},
			FigureLookAtDirection {Tag = "pl_HumanHeroSariel", Direction = 0},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 588.012, Y = 395.529},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 0},

			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroIO"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroAntara"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroSariel"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			
			MapFlagSetTrue {Name = "mf_P502_NamelessArmyStart"},
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
			CameraTakeAddToTrack {File = "CS_04_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
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
			--CutsceneSayIsDone {},
		},
		Actions =
		{
			CutsceneSay {TextTag = "ARMYCAINE01", Tag = "pl_HumanHeroCaine"},
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
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 6},
		},
		Actions =
		{
			CutsceneSay {TextTag = "ARMYAVATAR01", Tag = "pl_HumanAvatar"},			
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
			CutsceneSay {TextTag = "ARMYSARIEL01", Tag = "pl_HumanHeroSariel"},			
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
			CutsceneSay {TextTag = "ARMYANTARA01", Tag = "pl_HumanHeroAntara"},			
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
			CutsceneSay {TextTag = "ARMYIO01", Tag = "pl_HumanHeroIO"},			
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
			CameraTakeAddToTrack {File = "CS_04_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ARMYCAINE02", Tag = "pl_HumanHeroCaine"},			
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
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_04_Take_04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			MapFlagSetTrue {Name = "mf_P502_NamelessArmyStartSecond"},
			CutsceneSay {TextTag = "ARMYSARIEL02", Tag = "pl_HumanHeroSariel"},			
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
			CameraTakeAddToTrack {File = "CS_04_Take_03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ARMYAVATAR02", Tag = "pl_HumanAvatar"},			
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
			CameraTakeAddToTrack {File = "CS_04_Take_07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ARMYANTARA02", Tag = "pl_HumanHeroAntara"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene11",
	},	
};


State
{
	StateName = "Cutscene11",
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

			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			FadeInEffectStart{},
			CutsceneFigureRenderAll {},
			MapFlagSetTrue {Name = "mf_P502_EndNamelessArmyCS"},
	},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
};