--************************************************************
--**
--**		Dream  :: Attack CutScene
--**
--************************************************************

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroAntara'",
		--"'DR_Antara'",
		"'DR_DWarrior01'",
		"'DR_DWarrior02'",
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
			FigureVanish {Tag = "CS_02_DR_Avatar1"},
			FigureVanish {Tag = "CS_02_DR_Antara1"},
			FigureVanish {Tag = "CS_02_DR_Avatar2"},
			FigureVanish {Tag = "CS_02_DR_Antara2"},
			FigureVanish {Tag = "CS_02_DR_Warrior1"},
			FigureVanish {Tag = "CS_02_DR_Warrior2"},
			
		},
	},

	
	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P500_StartAttackCS"},
		},
		Actions =
		{
			_tRenderList,
		  CutsceneBegin{},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroAntara"},
			
			CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 428.212, Y = 658.644  },
			FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 270},
			
			CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 428.212, Y = 658.644 },
			FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 270},
			
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 428.776, Y = 660.877 },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
			
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 428.776, Y = 660.877 },
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 270},
					
			FigureWalk	{Tag = "pl_HumanAvatar", X = 422.032, Y = 661.803 },
			FigureWalk	{Tag = "pl_HumanHeroAntara", X = 421.804, Y = 659.681, },

			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_02_Take_01", Tag = "default", TargetTag = "default"},
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			CutsceneSay {TextTag = "AttackCS01", Tag = "pl_HumanAvatar"},
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
			CameraTakeAddToTrack {File = "CS_02_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "AttackCS02", Tag = "pl_HumanHeroAntara"},
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
			CameraTakeAddToTrack {File = "CS_02_Take_03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "AttackCS03", Tag = "DR_DWarrior01"},
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
			CameraTakeAddToTrack {File = "CS_02_Take_04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "AttackCS04", Tag = "pl_HumanHeroAntara"},
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
			CameraTakeAddToTrack {File = "CS_02_Take_05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "AttackCS05", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
			--FigureSimpleWalk	{Tag = "DR_DWarrior01", X = 409.725, Y = 660.357  },
			--FigureSimpleWalk	{Tag = "DR_DWarrior02", X = 408.924, Y = 656.988  },
--			CutsceneCombatEnable	{Tag = "pl_HumanAvatar"},
--			CutsceneCombatEnable	{Tag = "pl_HumanHeroAntara"},
--			FigureTeamTransfer	{Tag = "DR_DWarrior01", Team = "tm_Team2"},
--			FigureTeamTransfer	{Tag = "DR_DWarrior02", Team = "tm_Team2"},
--			FigureAttackEntity	{Tag = "DR_DWarrior01", TargetTag = "pl_HumanHeroAntara"},
--			FigureAttackEntity	{Tag = "DR_DWarrior02", TargetTag = "pl_HumanAvatar"},
			
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
--			CutsceneSayIsDone {},	
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 4},
		},
		Actions =
		{
			--CutsceneCombatEnable	{Tag = "pl_HumanAvatar"},
			--CutsceneCombatEnable	{Tag = "pl_HumanHeroAntara"},
			CutsceneCombatOn	{},
			FigureTeamTransfer	{Tag = "DR_DWarrior01", Team = "tm_Team2"},
			FigureTeamTransfer	{Tag = "DR_DWarrior02", Team = "tm_Team2"},
			FigureAttackEntity	{Tag = "DR_DWarrior01", TargetTag = "pl_HumanHeroAntara"},
			FigureAttackEntity	{Tag = "DR_DWarrior02", TargetTag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroAntara"},
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
--			CutsceneSayIsDone {},	
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			FigureAttackEntity	{Tag = "pl_HumanHeroAntara", TargetTag = "DR_DWarrior01"},
			FigureAttackEntity	{Tag = "pl_HumanAvatar", TargetTag = "DR_DWarrior02"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene08",
	},	
};

State
{
	StateName = "Cutscene08",
	OnCutsceneFigureDespawnEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},	
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 2},

		},
		Actions =
		{
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			CutsceneCombatOff	{},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroAntara"},
			FadeInEffectStart{},
			MapFlagSetTrue {Name = "mf_P500_EndAttackCS"},

		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
	
};




