--************************************************************
--**
--**		Dream  :: Victory CutScene
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
			ObjectVanish	{Tag = "CS_05_DR_DeadEnemy1"},
			ObjectVanish	{Tag = "CS_05_DR_DeadEnemy2"},
			FigureVanish	{Tag = "CS_05_DR_Soldier1"},
			FigureVanish	{Tag = "CS_05_DR_Soldier2"},
			FigureVanish	{Tag = "CS_05_DR_Soldier3"},
			FigureVanish	{Tag = "CS_05_DR_Antara"},
			FigureVanish	{Tag = "CS_05_DR_Avatar"},
			FigureVanish	{Tag = "CS_05_DR_NightSong"},
			FigureVanish	{Tag = "CS_05_DR_Twiddle"},
		},
	},

	
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P500_StartVictoryCS"},
		},
		Actions =
		{
			_tRenderList,
		  CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroAntara"},
			
			CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 457.292, Y = 591.013  },
			FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 140},
			
			CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 457.292, Y = 591.013 },
			FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 140},
			
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 459.399, Y = 592.28 },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 330},
			
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 459.399, Y = 592.28 },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 330},
					
			ObjectSpawn	{ObjectId = 2514, X = 459.028, Y = 588.722, Direction = 250, Tag = "CS_05_DR_DeadEnemy1"},
			ObjectSpawn	{ObjectId = 2514, X = 463.522, Y = 589.129, Direction = 50, Tag = "CS_05_DR_DeadEnemy2"},
			FigureVanish	{Tag = "DR_RoadDemon1_DEAD"},
			FigureVanish	{Tag = "DR_RoadDemon2_DEAD"},
			FigureVanish	{Tag = "DR_RoadDemon3_DEAD"},
		
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_05_DR_Soldier1", Level = 5, UnitId = 311, X = 457.851, Y = 594.661, Team = "tm_Team1"},},
			FigureLookAtDirection {Tag = "CS_05_DR_Soldier1", Direction = 0},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_05_DR_Soldier2", Level = 5, UnitId = 311, X = 455.59, Y = 595.135, Team = "tm_Team1"},},
			FigureLookAtDirection {Tag = "CS_05_DR_Soldier2", Direction = 40},
	
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_05_DR_Soldier3", Level = 5, UnitId = 311, X = 456.857, Y = 593.79, Team = "tm_Team1"},},
			FigureLookAtDirection {Tag = "CS_05_DR_Soldier3", Direction = 30},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_05_DR_NightSong", Level = 5, UnitId = 1763, X = 471.748, Y = 595.128, Team = "tm_Team1"},},
			FigureLookAtDirection {Tag = "CS_05_DR_NightSong", Direction = 270},
	
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_05_DR_Twiddle", Level = 5, UnitId = 1659, X = 471.875, Y = 593.864, Team = "tm_Team1"},},
			FigureLookAtDirection {Tag = "CS_05_DR_Twiddle", Direction = 260},						

			--EffectStop	{Tag = "DR_Drakness_Effect_Rock"},
			--EffectStop	{Tag = "DR_Drakness_Effect_Rock2"},
			ObjectVanish	{Tag = "DR_Darkness_Effect_Rock"},
			ObjectVanish	{Tag = "DR_Darkness_Effect_Rock2"},
			
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_05_Take_99", Tag = "default", TargetTag = "default"},
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
	OnOneTimeEvent	-- 
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroAntara"},
			
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_05_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			MapFlagSetTrue {Name = "mf_P500_NightSongTeleport"},
			CutsceneSay {TextTag = "VictoryCS01", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_05_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureDirectionSetToEntity	{Tag = "pl_HumanAvatar", TargetTag = "CS_05_DR_Soldier3"},
			CutsceneSay {TextTag = "VictoryCS02", Tag = "pl_HumanHeroAntara"},
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
			CameraTakeAddToTrack {File = "CS_05_Take_03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "VictoryCS03", Tag = "pl_HumanAvatar"},
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
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_05_Take_04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "VictoryCS04", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_05_Take_05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "VictoryCS05", Tag = "CS_05_DR_Soldier1"},
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
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_05_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "VictoryCS06", Tag = "pl_HumanAvatar"},
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
		},
		Actions =
		{
			CutsceneSay {TextTag = "VictoryCS07", Tag = "pl_HumanAvatar"},
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
			CutsceneSayIsDone {},	
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_05_Take_05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "VictoryCS08", Tag = "CS_05_DR_Soldier1"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene09",
	},	
};

State
{
	StateName = "Cutscene09",
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
			MapFlagSetTrue {Name = "mf_P500_EndVictoryCS"},
			FigureVanish	{Tag = "CS_05_DR_Soldier1"},
			FigureVanish	{Tag = "CS_05_DR_Soldier2"},
			FigureVanish	{Tag = "CS_05_DR_Soldier3"},
			FigureVanish	{Tag = "CS_05_DR_NightSong"},
			FigureVanish	{Tag = "CS_05_DR_Twiddle"},
			
		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
	
};




