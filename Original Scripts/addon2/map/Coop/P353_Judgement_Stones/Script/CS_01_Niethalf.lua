--************************************************************
--**														**
--**		Coop Judgement Stones Niethalf					**
--**														**
--************************************************************
-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "Zerbo"}
_tRenderList.tModFuncs = 
{ 
	Add = 
	{	
		"'Prophet'",
		"'Jandrim'",
		"'Zerbo'",
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
			-- erste Cutscene Vanish
			FigureVanish {Tag = "CS_01_Jandrim01"},
			FigureVanish {Tag = "CS_01_Jandrim02"},
			FigureVanish {Tag = "CS_01_Panther01"},
			FigureVanish {Tag = "CS_01_Panther02"},
			-- zweite Cutscene Vanish
			FigureVanish {Tag = "CS_02_Prophet01"},
		},
	},
	OnCutsceneFigureRespawnEvent	-- Kamera auf Pentagramm
	{
		Coop = true,
		Conditions =
		{
				MapFlagIsTrue	{Name = "mf_Cutscene01"},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			-- Teleport der Akteure
			FigureTeleport {Tag = "Jandrim", X = 349.353, Y = 346.55},
			FigureLookAtDirection {Tag = "Jandrim", Direction = 125},
			FigureTeleport {Tag = "Zerbo", X = 359.362, Y = 357.385},
			FigureLookAtDirection {Tag = "Zerbo", Direction = 17},
			FigureTeleport {Tag = "Prophet", X = 362.886, Y = 355.804},
			FigureLookAtDirection {Tag = "Prophet", Direction = 319.893},
			-- Zerbo hockt von Mapbeginn an(sollte er jedenfalls)
			-- Flag damit Jandrim in der CS nicht wegläuft
			MapFlagSetTrue	{Name = "mf_P353_First_Cutscene_Running"},
			-- Niethalf spawnt außerhalb des Sichtbereiches, damit er nicht umswappt
			MapFlagSetTrue	{Name = "mf_Spawn_Niethalf"},
			-- Weapons Hide
			CutsceneFigureWeaponsHide {Tag = "Jandrim"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		Tags = _tRenderList,
		GotoState = "Cutscene00",
	},
};

State
{
	StateName = "Cutscene00",
	OnOneTimeEvent	-- -- Jandrim läuft zu Zerbo
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.2},
		},
		Actions =
		{
			FigureSimpleWalk {Tag = "Jandrim", X = 356.006, Y = 351.686},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene01",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- Niethalf Effekt starten
	{
		Conditions =
		{
			FigureIsIdle {Tag = "Jandrim"},
		},
		Actions =
		{
			EffectStart {Tag = "Niethalf_Effekt", File = "Effect_Misc_SpawnSpecial_02"},
			-- SOUND: Niethalf Spawn
			MapFlagSetTrue {Name = "mf_P353_Judgement_Stones_01_SOUND_Play_Niethalf_Spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- Niethalf erscheint
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			FigureTeleport {Tag = "Niethalf", X = 360.008, Y = 353.473},
			FigureLookAtDirection {Tag = "Niethalf", Direction = 180},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	-- Niethalf: Cutscene01
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Cutscene01", Tag = "Niethalf"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	-- Niethalf: Cutscene02
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.51},
		},
		Actions =
		{	
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take02b", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			CutsceneSay {TextTag = "Cutscene02", Tag = "Niethalf"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06a",
	},
};

State
{
	StateName = "Cutscene06a",
	OnOneTimeEvent	-- Zerbo steht auf
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3.61},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take02a", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			MapFlagSetTrue {Name = "mf_CS_01_Kneel_Up_Zerbo"}, -- 1.83s
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06b",
	},
};

State
{
	StateName = "Cutscene06b",
	OnOneTimeEvent	-- Zerbo: Cutscene03
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.9},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			CutsceneSay {TextTag = "Cutscene03", Tag = "Zerbo"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- Niethalf: Cutscene04
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.41},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			CutsceneSay {TextTag = "Cutscene04", Tag = "Niethalf"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- Zerbo: Cutscene05
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3.6},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			CutsceneSay {TextTag = "Cutscene05", Tag = "Zerbo"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- Zerbo: Cutscene06
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.6},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Cutscene06", Tag = "Zerbo"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene10",
	},
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- Niethalf: Cutscene07
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3.2},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Cutscene07", Tag = "Niethalf"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene11",
	},
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- Effekt auf Zerbo & Anim Warcry auf Zerbo
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3.7},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EffectStart {Tag = "Zerbo_Effect", File = "Effect_Misc_TransformPanter"},
			FigureAnimPlayOnce {Tag = "Zerbo", File = "base/gfx/figures/hero/figure_hero_male_special_warcry.ska"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- Zerbo-Mesh wird gegen ein Panther-Mesh getauscht
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			FigureUnitChange {Tag = "Zerbo", UnitId = 705, Level = 20},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene12b",
	},
};

State
{
	StateName = "Cutscene12b",
	OnOneTimeEvent	-- Effekt auf Prophet
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1.5},
		},
		Actions =
		{
			EffectStart {Tag = "Prophet", File = "Effect_Misc_SpawnSpecial_01"},
			-- SOUND: Prophet Vanish
			MapFlagSetTrue {Name = "mf_P353_Judgement_Stones_01_SOUND_Play_Prophet_Despawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene13",
	},
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- Zerbo geht zu Niethalf & Prophet-Vanish
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.8},
		},
		Actions =
		{
			FigureVanish {Tag = "Prophet"},
			FigureSimpleWalk {Tag = "Zerbo", X = 359.796, Y = 355.997},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14",
	},
};

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- Zerbo schlägt zu
	{
		Conditions =
		{
			FigureIsIdle {Tag = "Zerbo"},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureAnimPlayOnce {Tag = "Zerbo", File = "base/gfx/figures/npc/figure_animal_wildcat_attack3.ska"}, -- 1.04s
			-- SOUND: Zerbo Attack
			MapFlagSetTrue {Name = "mf_P353_Judgement_Stones_01_SOUND_Play_Zerbo_Attack"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14a",
	},
};

State
{
	StateName = "Cutscene14a",
	OnOneTimeEvent	-- Effekt auf Niethalf
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take09a", Tag = "default", TargetTag = "default"},
			CameraTakeAddToTrack {File = "CS_01_Take09b", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			EffectStart {Tag = "Niethalf", File = "Effect_Misc_God_Vanishing"},
			-- SOUND: Niethalf Vanish
			MapFlagSetTrue {Name = "mf_P353_Judgement_Stones_01_SOUND_Play_Niethalf_Vanish"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene14d",
	},
};

State
{
	StateName = "Cutscene14d",
	OnOneTimeEvent	-- Jandrim: Cutscene08
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_01_Take10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "Cutscene08", Tag = "Jandrim"},
			-- Ausrichten von Jandrim
			FigureLookAtDirection {Tag = "Jandrim", Direction = 125},
			-- Talkjob Jandrim
			FigureCutsceneTalkJobSet {Tag = "Jandrim"},
			-- Niethalf Vanish
			FigureVanish {Tag = "Niethalf"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene16",
	},
};

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- Jandrim: Cutscene09
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4.71},
		},
		Actions =
		{
			CutsceneSay {TextTag = "Cutscene09", Tag = "Jandrim"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene17",
	},
};

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- Kurze Pause nach CutsceneSay
	{
		Conditions =
		{
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 8.6},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene18",
	},
};

State
{
	StateName = "Cutscene18",
	OnCutsceneFigureDespawnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			MapFlagSetTrue      {Name = "mf_NiethalfSummoned"},
			FigureTeamTransfer	{Tag = "Zerbo", Team = "tm_Enemy"},
			EntityTimerStop {Name = "et_CStimer"},
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd{},
			-- Figuren werden wieder dargestellt
			CutsceneFigureRenderAll {},
			-- Weapons Show
			CutsceneFigureWeaponsHide {Tag = "Jandrim"},
			-- Flag damit Jandrim seinen normalen Jobs wieder nachgeht
			MapFlagSetFalse {Name = "mf_P353_First_Cutscene_Running"},
			-- Flag damit die zweite Cutscene erst losgehen kann wenn dieser durchgelaufen ist
			-- und Zerbo getötet wurde
			MapFlagSetTrue {Name = "mf_P353_First_Cutscene_Done"},
			-- hier noch die Teams und Playerkits ändern, damit die Aggro werden
		},
		GotoState = "CutsceneEnd",
	},
};

State
{
	StateName = "CutsceneEnd",
};