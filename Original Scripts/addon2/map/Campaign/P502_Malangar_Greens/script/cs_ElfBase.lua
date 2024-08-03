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
		"'Cutscene_06_Druid'",
		"'CS_Professor_Twiddle'",
		"'pl_HumanHeroAntara'",
		"'pl_HumanHeroSariel'",
		"'pl_HumanHeroCaine'",
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
			FigureVanish	{Tag = "Cutscene_06_Druid"}, 
			FigureVanish	{Tag = "CS_Professor_Twiddle"},
			FigureVanish	{Tag = "Cutscene01_Antra"},
			FigureVanish	{Tag = "Cutscene_06_Caine"},
			FigureVanish	{Tag = "Cutscene_06_Sariel"},
		},
		GotoState = self,
	};



	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P502_StartToTheElvesCS"},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 459.868, Y = 652.687},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 131.78},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 459.868, Y = 652.687},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 131.78},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroSariel", X = 461.096, Y = 651.747},
			FigureLookAtDirection {Tag = "pl_HumanHeroSariel", Direction = 148.969},
			CutsceneFigureTeleport {Tag = "Cutscene_06_Druid", X = 463.478, Y = 655.661},
			FigureLookAtDirection {Tag = "Cutscene_06_Druid", Direction = 284.552},
			CutsceneFigureTeleport {Tag = "CS_Professor_Twiddle", X = 461.966, Y = 656.813},
			FigureLookAtDirection {Tag = "CS_Professor_Twiddle", Direction = 17.1887},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 463.124, Y = 653.103},
			FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 177.617},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 461.514, Y = 653.602},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 154.699},

			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroSariel"},
			CutsceneFigureWeaponsHide {Tag = "Cutscene_06_Druid"},
			CutsceneFigureWeaponsHide {Tag = "CS_Professor_Twiddle"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroAntara"},
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
			CameraTakeAddToTrack {File = "CS_08_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ELFBASEDRUID01", Tag = "Cutscene_06_Druid"},
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
			CameraTakeAddToTrack {File = "CS_08_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ELFBASETWIDDLE01", Tag = "CS_Professor_Twiddle"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene03",
	},	
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- MG_Caine: CAINE01
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_08_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ELFBASEDRUID02", Tag = "Cutscene_06_Druid"},			
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
			CameraTakeAddToTrack {File = "CS_08_Take_03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ELFBASEAVATAR01", Tag = "pl_HumanAvatar"},			
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
			CameraTakeAddToTrack {File = "CS_06_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "ELFBASEDRUID03", Tag = "Cutscene_06_Druid"},			
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
			--CutsceneSayIsDone {},	
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 14},
		},
		Actions =
		{
			
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroSariel"},
			CutsceneFigureWeaponsShow {Tag = "Cutscene_06_Druid"},
			CutsceneFigureWeaponsShow {Tag = "CS_Professor_Twiddle"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroAntara"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},

			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			FadeInEffectStart{},
			CutsceneFigureRenderAll {},
			MapFlagSetTrue {Name = "mf_P502_EndToTheElvesCS"},
	},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
};