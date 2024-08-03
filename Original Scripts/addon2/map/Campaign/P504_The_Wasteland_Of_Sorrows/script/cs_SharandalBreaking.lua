
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'WS_sharandal_01'",
	}
}

State
{
	StateName = "INIT",
	
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P504_Start_SharandalBreak_Cut"},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			EntityTimerStart {Name = "et_CStimer"},
			CameraTrackClear {},
			CutsceneFigureTeleport {Tag = "WS_sharandal_01", X = 330.507, Y = 447.58},
			FigureLookAtDirection {Tag = "WS_sharandal_01", Direction = 2.83956},
			CutsceneFigureTeleport {Tag = "WS_sharandal_01", X = 330.507, Y = 447.58},
			FigureLookAtDirection {Tag = "WS_sharandal_01", Direction = 2.83956},
			CameraTakeAddToTrack {File = "CS_04_Take11", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "WS_sharandal_01", File = "addon2/gfx/figures/npc/figure_boss_dragon_sharandal_breack_chain.ska"},
			SoundGlobalPlayOnceAddon2 {File = "special/sharandal_struggling"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};


State
{
	StateName = "Cutscene02",
	OnCutsceneFigureDespawnEvent	-- 
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},
			CutsceneFigureTeleportBack	{Tag = "WS_sharandal_01"},
			MapFlagSetTrue {Name = "mf_P504_End_SharandalBreak_Cut"},	
			FigureAnimPlayOnce	{File = "addon2/gfx/figures/npc/figure_boss_dragon_sharandal_idle.ska"},
		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
};