--************************************************************
--**
--**		Dream  :: Demon CutScene
--**
--************************************************************

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroAntara'",
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
			ObjectVanish	{Tag = "CS_03_DR_WarriorBody1"},
			ObjectVanish	{Tag = "CS_03_DR_WarriorBody2"},
		},
	},

	
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P500_StartDemonCS"},
		},
		Actions =
		{
			_tRenderList,
		  CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroAntara"},
			
			CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 421.804, Y = 659.681  },
			FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 270},
			
			CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 421.804, Y = 659.681 },
			FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 270},
			
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar",X = 422.032, Y = 661.803 },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
			
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 422.032, Y = 661.803 },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
					
			--ObjectSpawn	{ObjectId = 2514, X = 417.005, Y = 658.033,  Direction = 10, Tag = "CS_03_DR_DeadWarrior1"},
			--ObjectSpawn	{ObjectId = 2514, X = 418.97, Y = 660.84,   Direction = 10, Tag = "CS_03_DR_DeadWarrior2"},
			FigureVanish	{Tag = "DR_DWarrior01_DEAD"},
			FigureVanish	{Tag = "DR_DWarrior02_DEAD"},
			
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
			CameraTakeAddToTrack {File = "CS_03_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "DemonCS01", Tag = "pl_HumanHeroAntara"},
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
			CameraTakeAddToTrack {File = "CS_03_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "DemonCS02", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_03_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "DemonCS03", Tag = "pl_HumanHeroAntara"},
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
			CutsceneSay {TextTag = "DemonCS04", Tag = "pl_HumanHeroAntara"},
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
			CameraTakeAddToTrack {File = "CS_03_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "DemonCS05", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
			
			
		},	
		GotoState = "Cutscene06",
	},	
};


State
{
	StateName = "Cutscene06",
	OnCutsceneFigureDespawnEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},

		},
		Actions =
		{
			--ObjectVanish	{Tag = "CS_03_DR_DeadWarrior1"},
			--ObjectVanish	{Tag = "CS_03_DR_DeadWarrior2"},
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroAntara"},
			FadeInEffectStart{},
			MapFlagSetTrue {Name = "mf_P500_EndDemonCS"},

		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
	
};




