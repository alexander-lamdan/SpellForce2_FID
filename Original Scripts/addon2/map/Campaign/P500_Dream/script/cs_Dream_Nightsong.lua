--************************************************************
--**
--**		Dream  :: Nightsong CutScene
--**
--************************************************************

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroAntara'",
		
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
			FigureVanish	{Tag = "CS_06_DR_Antara"},
			FigureVanish	{Tag = "CS_06_DR_Avatar"},
			FigureVanish	{Tag = "CS_06_DR_Nightsong"},
			FigureVanish	{Tag = "CS_06_DR_Warrior"},
			FigureVanish	{Tag = "CS_06_DR_Chosen"},
			
		},
	},

	
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P500_StartNightsongCS"},
		},
		Actions =
		{
			_tRenderList,
		  CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroAntara"},
			
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 418.49, Y = 366.887 },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 310},
			
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar",  X = 418.49, Y = 366.887 },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 310},
			
			CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 420.016, Y = 364.401 },
			FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 270},
			
			CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 420.016, Y = 364.401 },
			FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 270},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_06_DR_Nightsong", Level = 10, UnitId = 1763, X = 414, Y = 376, Team = "tm_Team1"},},
			FigureRun	{Tag = "CS_06_DR_Nightsong", X = 412.326, Y = 363.941 },
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_06_DR_Warrior", Level = 8, UnitId = 1659, X = 413, Y = 378, Team = "tm_Team1"},},
			FigureRun	{Tag = "CS_06_DR_Warrior", X = 410.87, Y = 361.69 },
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_06_DR_Chosen", Level = 8, UnitId = 1659, X = 414, Y = 379, Team = "tm_Team1"},},
			FigureRun	{Tag = "CS_06_DR_Chosen", X = 409.823, Y = 365.054 },
					
			--EffectStart	{Tag = "DR_Drakness_Effect_Rock4", File = "Effect_Building_Darkness"},
			
			--EffectStop	{Tag = "DR_Drakness_Effect_Rock3"},
			--EffectStop	{Tag = "DR_Drakness_Effect_Rock4"},
			
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_06_Take_99", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},			
			
--			EntityTimerStart {Name = "et_CStimer"},
			
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
};

--[[State
{
	StateName = "TurnAround",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			FigureIsIdle	{Tag = "CS_06_DR_Nightsong"},
			FigureIsIdle	{Tag = "CS_06_DR_Warrior"},
			FigureIsIdle	{Tag = "CS_06_DR_Chosen"},
		},
		Actions =
		{
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene01",
	},	
};--]]

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			FigureIsIdle	{Tag = "CS_06_DR_Nightsong"},
			FigureIsIdle	{Tag = "CS_06_DR_Warrior"},
			FigureIsIdle	{Tag = "CS_06_DR_Chosen"},
--		EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2.5},
		},
		Actions =
		{
			
			
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_06_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureLookAtDirection {Tag = "CS_06_DR_Nightsong", Direction = 125},
			FigureLookAtDirection {Tag = "CS_06_DR_Warrior", Direction = 120},
			FigureLookAtDirection {Tag = "CS_06_DR_Chosen", Direction = 100},
			CutsceneSay {TextTag = "NightSongCS01", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_06_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NightSongCS02", Tag = "CS_06_DR_Nightsong"},
			EntityTimerStart {Name = "et_CStimer"},
			

		},	
		GotoState = "RunForThePurpleMist",
	},	
};

State
{
	StateName = "RunForThePurpleMist",
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_06_Take_99", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureRun	{Tag = "CS_06_DR_Nightsong", X = 351, Y = 310 },
			FigureRun	{Tag = "CS_06_DR_Warrior", X = 351, Y = 310 },
			FigureRun	{Tag = "CS_06_DR_Chosen", X = 351, Y = 310 },
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
--			CutsceneSayIsDone {},	
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_06_Take_03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "NightSongCS03", Tag = "pl_HumanHeroAntara"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene04",
	},	
};


State
{
	StateName = "Cutscene04",
	OnCutsceneFigureDespawnEvent	-- 
	{
		Conditions =
		{
			CutsceneSayIsDone {},	
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},

		},
		Actions =
		{
			
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroAntara"},
			FadeInEffectStart{},
			FigureVanish	{Tag = "CS_06_DR_Antara"},
			FigureVanish	{Tag = "CS_06_DR_Avatar"},
			FigureVanish	{Tag = "CS_06_DR_Nightsong"},
			FigureVanish	{Tag = "CS_06_DR_Warrior"},
			FigureVanish	{Tag = "CS_06_DR_Chosen"},
			MapFlagSetTrue {Name = "mf_P500_EndNightsongCS"},
		
		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
	
};




