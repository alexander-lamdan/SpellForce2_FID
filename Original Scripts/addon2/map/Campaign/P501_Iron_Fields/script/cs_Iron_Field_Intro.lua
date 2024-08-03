--************************************************************
--**
--**		Iron Fields  :: Fast Skill CutScene
--**
--************************************************************

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
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
		},
	},
	
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P501_StartIntroCS"},
		},
		Actions =
		{
			--_tRenderList,
		  --CutsceneBegin{},
			--CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			--CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroAntara"},
			--EntityTimerStart {Name = "et_CStimer"},
			--CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 425.105, Y = 613.43},
			--FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 174.727},
			--CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 425.848, Y = 614.621},
			--FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 308.434},
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};


State
{
	StateName = "Cutscene01",
	OnCutsceneFigureDespawnEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			--EntityTimerStop	{Name = "et_CStimer"},			
			--CameraTrackClear {},
			--CameraStop {},
			--CutsceneEnd	{},	
			--CutsceneFigureRenderAll {},
			--FigureVanish {Tag = "NoNameNpc"},
			MapFlagSetTrue {Name = "mf_P501_EndIntroCS"},	
			--CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			--CutsceneFigureTeleportBack {Tag = "pl_HumanHeroAntara"},
			FadeInEffectStart{},
		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
};