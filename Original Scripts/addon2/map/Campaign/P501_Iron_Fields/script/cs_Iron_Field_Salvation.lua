--************************************************************
--**
--**		Iron Fields  :: Salvation CutScene
--**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'IF_CutScene_Twiddle'",
		"'CS_07_IF_Noradim_spawn'",
		"'CS_07_IF_Soul_Carrier_spawn'",
		"'Former_Conqueress_spawn'",
		"'CS_07_IF_Noradim_dialog'",
		"'CS_07_IF_Soul_Carrier_dialog'",
		"'cs_Surian'",
		"'Former_Conqueress_dialog'",
		"'pl_HumanHeroAntara'",
		"'cs_twiddle_invisible'",
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
			FigureVanish {Tag = "CS_07_IF_Antaris"},
			FigureVanish {Tag = "CS_07_IF_Avatar"},
			FigureVanish {Tag = "CS_Surian"},
		},
	},
	
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P501_StartSalvationCS"},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			FigureTeleportToEntity {Tag = "CS_07_IF_Noradim_spawn", TargetTag = "Destroyed_Village"},
			FigureTeleportToEntity {Tag = "CS_07_IF_Soul_Carrier_spawn", TargetTag = "Destroyed_Village"},
			FigureTeleportToEntity {Tag = "Former_Conqueress_spawn", TargetTag = "Destroyed_Village"},
			FigureTeleportToEntity {Tag = "CS_07_IF_Noradim_dialog", TargetTag = "Destroyed_Village"},
			FigureTeleportToEntity {Tag = "CS_07_IF_Soul_Carrier_dialog", TargetTag = "Destroyed_Village"},
			FigureTeleportToEntity {Tag = "Former_Conqueress_dialog", TargetTag = "Destroyed_Village"},
			FigureTeleportToEntity {Tag = "IF_CutScene_Twiddle", TargetTag = "Destroyed_Village"},
			FigureTeleportToEntity {Tag = "cs_Surian", TargetTag = "Destroyed_Village"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroAntara"},
			CutsceneFigureTeleport {Tag = "cs_twiddle_invisible", X = 82.0719, Y = 630.309},
			FigureLookAtDirection {Tag = "cs_twiddle_invisible", Direction = 0},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 78.6837, Y = 624.748},
			FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 158.502},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 79.9905, Y = 624.634},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 188.113},			
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "Cutscene01",
		--GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONTWIDDLE01", Tag = "cs_twiddle_invisible"},
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
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONAVATAR01", Tag = "pl_HumanAvatar"},
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
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			FigureVanish{Tag = "cs_twiddle_invisible"},
			CutsceneFigureTeleport {Tag = "IF_CutScene_Twiddle", X = 82.0719, Y = 630.309},
			FigureLookAtDirection {Tag = "IF_CutScene_Twiddle", Direction = 0},
			EffectStartAtEntityPosition {Tag = "IF_CutScene_Twiddle", File = "Effect_Spawn_Unit"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONTWIDDLE02", Tag = "IF_CutScene_Twiddle"},
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
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONANTARA01", Tag = "pl_HumanHeroAntara"},
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
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONTWIDDLE03", Tag = "IF_CutScene_Twiddle"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene06",
	},	
};

State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONAVATAR02", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene07",
	},	
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			--CameraTrackClear {},
			--CameraTakeAddToTrack {File = "CS_07_Take_03", Tag = "default", TargetTag = "default"},
			--CameraTrackPlay {},
			--CutsceneSay {TextTag = "SALVATIONAVATAR01", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene08",
	},	
};

State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONTWIDDLE04", Tag = "IF_CutScene_Twiddle"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene09",
	},	
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONAVATAR03", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene10",
	},	
};

State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_99", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneFigureTeleport {Tag = "CS_07_IF_Noradim_spawn", X = 85.0546, Y = 631.032},
			FigureLookAtDirection {Tag = "CS_07_IF_Noradim_spawn", Direction = 275.933},
			EffectStartAtEntityPosition {Tag = "CS_07_IF_Noradim_spawn", File = "Effect_Spawn_Unit"},
			FigureForcedWalk	{Tag = "CS_07_IF_Noradim_spawn",  X = 70.5928, Y = 634.491},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene11",
	},	
};

State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},	
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4.5},
		},
		Actions =
		{
			--FigureLookAtDirection {Tag = "CS_07_IF_Noradim_spawn", Direction = 51.5662},
			CutsceneSay {TextTag = "SALVATIONNORADIM01", Tag = "CS_07_IF_Noradim_spawn"},
			CutsceneFigureTeleport {Tag = "CS_07_IF_Soul_Carrier_spawn", X = 85.0546, Y = 631.032},
			FigureLookAtDirection {Tag = "CS_07_IF_Soul_Carrier_spawn", Direction = 275.933},
			EffectStartAtEntityPosition {Tag = "CS_07_IF_Soul_Carrier_spawn", File = "Effect_Spawn_Unit"},
			FigureForcedWalk	{Tag = "CS_07_IF_Soul_Carrier_spawn",  X = 62.8227, Y = 626.475},			
		},	
	},	
	
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 13},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_98", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			--FigureLookAtDirection {Tag = "CS_07_IF_Soul_Carrier_spawn", Direction = 74.4845},
			CutsceneFigureTeleport {Tag = "Former_Conqueress_spawn", X = 93.7077, Y = 629.276},
			FigureLookAtDirection {Tag = "Former_Conqueress_spawn", Direction = 275.933},
			EffectStartAtEntityPosition {Tag = "Former_Conqueress_spawn", File = "Effect_Spawn_Unit"},
			FigureForcedWalk	{Tag = "Former_Conqueress_spawn",  X = 79.4173, Y = 639.192},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene12",
	},
};

State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			FigureTeleportToEntity {Tag = "CS_07_IF_Noradim_spawn", TargetTag = "Destroyed_Village"},
			FigureTeleportToEntity {Tag = "CS_07_IF_Soul_Carrier_spawn", TargetTag = "Destroyed_Village"},
			FigureTeleportToEntity {Tag = "Former_Conqueress_spawn", TargetTag = "Destroyed_Village"},
			CutsceneFigureTeleport {Tag = "CS_07_IF_Soul_Carrier_dialog", X = 70.9187, Y = 625.008},
			FigureLookAtDirection {Tag = "CS_07_IF_Soul_Carrier_dialog", Direction = 78.2877},
			CutsceneFigureTeleport {Tag = "CS_07_IF_Noradim_dialog", X = 73.2552, Y = 634.88},
			FigureLookAtDirection {Tag = "CS_07_IF_Noradim_dialog", Direction = 354.27},
			CutsceneFigureTeleport {Tag = "Former_Conqueress_dialog", X = 81.7327 , Y = 636.046	},
			FigureLookAtDirection {Tag = "Former_Conqueress_dialog", Direction = 302.704},
			CutsceneFigureTeleport {Tag = "cs_Surian", X = 67.0262 , Y = 617.231 },
			FigureLookAtDirection {Tag = "cs_Surian", Direction = 115.505},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONSOULCARRIER01", Tag = "CS_07_IF_Soul_Carrier_dialog"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene13",
	},	
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene14",
	},	
};	

State
{
	StateName = "Cutscene14",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONANTARA02", Tag = "pl_HumanHeroAntara"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene15",
	},	
};	

State
{
	StateName = "Cutscene15",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "SALVATIONAVATAR04", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene16",
	},	
};	

State
{
	StateName = "Cutscene16",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONTWIDDLE05", Tag = "IF_CutScene_Twiddle"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene17",
	},	
};	

State
{
	StateName = "Cutscene17",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "SALVATIONNORADIM02", Tag = "CS_07_IF_Noradim_dialog"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene18",
	},	
};	


State
{
	StateName = "Cutscene18",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "SALVATIONCONQUERESS01", Tag = "Former_Conqueress_dialog"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene19",
	},	
};	

State
{
	StateName = "Cutscene19",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "SALVATIONSOULCARRIER02", Tag = "CS_07_IF_Soul_Carrier_dialog"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene20",
	},	
};	

State
{
	StateName = "Cutscene20",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_13", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONANTARA03", Tag = "pl_HumanHeroAntara"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene21",
	},	
};	

State
{
	StateName = "Cutscene21",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_15", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONCONQUERESS02", Tag = "Former_Conqueress_dialog"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene22",
	},	
};	

State
{
	StateName = "Cutscene22",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONAVATAR05", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene23",
	},	
};	

State
{
	StateName = "Cutscene23",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_17", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONSURIAN01", Tag = "cs_Surian"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene24",
	},	
};	

State
{
	StateName = "Cutscene24",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_16", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONNORADIM03", Tag = "CS_07_IF_Noradim_dialog"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene25",
	},	
};	 


State
{
	StateName = "Cutscene25",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONAVATAR06", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene26",
	},	
};	 


State
{
	StateName = "Cutscene26",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_16", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONNORADIM04", Tag = "CS_07_IF_Noradim_dialog"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene27",
	},	
};	 


State
{
	StateName = "Cutscene27",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONAVATAR07", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene28",
	},	
};	 

State
{
	StateName = "Cutscene28",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONCONQUERESS03", Tag = "Former_Conqueress_dialog"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene29",
	},	
};	 


State
{
	StateName = "Cutscene29",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONAVATAR08", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene30",
	},	
};	 


State
{
	StateName = "Cutscene30",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_18", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONSOULCARRIER03", Tag = "CS_07_IF_Soul_Carrier_dialog"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene31",
	},	
};	 


State
{
	StateName = "Cutscene31",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONAVATAR09", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene32",
	},	
};	 


State
{
	StateName = "Cutscene32",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_16", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONNORADIM05", Tag = "CS_07_IF_Noradim_dialog"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene33",
	},	
};	 


State
{
	StateName = "Cutscene33",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONAVATAR10", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene34",
	},	
};	 


State
{
	StateName = "Cutscene34",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONSOULCARRIER04", Tag = "CS_07_IF_Soul_Carrier_dialog"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene35",
	},	
};	 


State
{
	StateName = "Cutscene35",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "SALVATIONCONQUERESS04", Tag = "Former_Conqueress_dialog"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene36",
	},	
};	 


State
{
	StateName = "Cutscene36",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "SALVATIONNORADIM06", Tag = "CS_07_IF_Noradim_dialog"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene37",
	},	
};	 


State
{
	StateName = "Cutscene37",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "SALVATIONSOULCARRIER05", Tag = "CS_07_IF_Soul_Carrier_dialog"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene38",
	},	
};	 


State
{
	StateName = "Cutscene38",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_14", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONNORADIM07", Tag = "CS_07_IF_Noradim_dialog"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene39",
	},	
};	 


State
{
	StateName = "Cutscene39",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONAVATAR11", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene40",
	},	
};	 


State
{
	StateName = "Cutscene40",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_10", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONSOULCARRIER06", Tag = "CS_07_IF_Soul_Carrier_dialog"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene41",
	},	
};	 


State
{
	StateName = "Cutscene41",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_16", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONNORADIM08", Tag = "CS_07_IF_Noradim_dialog"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene42",
	},	
};	 


State
{
	StateName = "Cutscene42",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_12", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONTWIDDLE06", Tag = "IF_CutScene_Twiddle"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene43",
	},	
};	 


State
{
	StateName = "Cutscene43",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CutsceneSay {TextTag = "SALVATIONSOULCARRIER07", Tag = "CS_07_IF_Soul_Carrier_dialog"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene44",
	},	
};	 


State
{
	StateName = "Cutscene44",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_14", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONNORADIM09", Tag = "CS_07_IF_Noradim_dialog"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene45",
	},	
};	 

State
{
	StateName = "Cutscene45",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_13", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONANTARA04", Tag = "pl_HumanHeroAntara"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene46",
	},	
};	 


State
{
	StateName = "Cutscene46",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_15", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONCONQUERESS06", Tag = "Former_Conqueress_dialog"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene47",
	},	
};	 

State
{
	StateName = "Cutscene47",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_16", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONNORADIM10", Tag = "CS_07_IF_Noradim_dialog"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene49",
	},	
};	

State
{
	StateName = "Cutscene49",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_17", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONSURIAN02", Tag = "cs_Surian"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene50",
	},	
};	

State
{
	StateName = "Cutscene50",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_14", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONNORADIM11", Tag = "CS_07_IF_Noradim_dialog"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene51",
	},	
};	

State
{
	StateName = "Cutscene51",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONAVATAR12", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene52",
	},	
};	



State
{
	StateName = "Cutscene52",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_21", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			EffectStartAddon2	{Tag = "pl_HumanAvatar", File = "Effect_Avatar_Blood_Bond"},
			EffectStartAddon2	{Tag = "cs_Surian", File = "Effect_Surian_Blood_Bond"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene53",
	},	
};	
		
State
{
	StateName = "Cutscene53",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},	
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			EffectStop {Tag = "cs_Surian"},
			EffectStop {Tag = "pl_HumanAvatar"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_17", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONSURIAN03", Tag = "cs_Surian"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene54",
	},	
};	

State
{
	StateName = "Cutscene54",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			FigureVanish{Tag = "CS_07_IF_Noradim_dialog"},
			FigureVanish{Tag = "CS_07_IF_Soul_Carrier_dialog"},
			FigureVanish{Tag = "Former_Conqueress_dialog"},
			CutsceneFigureTeleport {Tag = "CS_07_IF_Noradim_spawn", X = 70.5928, Y = 634.491},
			FigureLookAtDirection {Tag = "CS_07_IF_Noradim_spawn", Direction = 51.5662},
			CutsceneFigureTeleport {Tag = "CS_07_IF_Soul_Carrier_spawn", X = 62.8227, Y = 626.475},
			FigureLookAtDirection {Tag = "CS_07_IF_Soul_Carrier_spawn", Direction = 74.4845},
			CutsceneFigureTeleport {Tag = "Former_Conqueress_spawn", X = 79.4173, Y = 639.192},
			FigureLookAtDirection {Tag = "Former_Conqueress_spawn", Direction = 0},
		},	
		GotoState = "Cutscene55",
	},	
};	

State
{
	StateName = "Cutscene55",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},	
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONAVATAR13", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene56",
	},	
};	


State
{
	StateName = "Cutscene56",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_07_Take_09", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "SALVATIONSOULCARRIER08", Tag = "CS_07_IF_Soul_Carrier_spawn"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene57",
	},	
};	

State
{
	StateName = "Cutscene57",
	OnCutsceneFigureDespawnEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},	
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},
			MapFlagSetTrue {Name = "mf_P501_EndSalvationCS"},	
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroAntara"},
			FadeInEffectStart{},
		},	
		GotoState = "CutsceneEnd",
	},	
};


State
{
	StateName = "CutsceneEnd",
};