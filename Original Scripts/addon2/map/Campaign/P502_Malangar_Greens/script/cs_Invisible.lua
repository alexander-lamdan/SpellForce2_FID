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
		"'MG_human_prisoner_01'",
		"'MG_human_prisoner_02'",
		"'MG_Shaikan_prisoner'",
		"'MG_ork_prisoner'",
		"'MG_human_prisoner_03'",
		"'MG_Pact_prisoner'",
		"'Prison_Demon_06'",
		"'Prison_Demon_03'",
		"'Prison_Demon_08'",
		"'Prison_Demon_02'",
		"'Prison_Demon_01'",
		"'Prison_Demon_07'",
		"'Prison_Demon_05'",
		"'Prison_Demon_04'",
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
			FigureVanish	{Tag = "Cutscene_05_Io"}, 
			FigureVanish	{Tag = "Cutscene_05_Caine"},
			FigureVanish	{Tag = "Cutscene_05_Antra"},
			FigureVanish	{Tag = "Cutscene_05_Sariel"},
			FigureVanish	{Tag = "Cutscene_05_Avatar"},
		},
		GotoState = self,
	};



	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P502_StartInvisibleCutscene"},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			
			CutsceneFigureTeleport {Tag = "pl_HumanHeroIO", X = 425.021, Y = 215.983},
			FigureLookAtDirection {Tag = "pl_HumanHeroIO", Direction = 239.679},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroIO", X = 425.021, Y = 215.983},
			FigureLookAtDirection {Tag = "pl_HumanHeroIO", Direction = 239.679},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 425.967, Y = 217.426},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 251.138},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 423.741, Y = 221.915},
			FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 314.164},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroSariel", X = 422.898, Y = 215.279},
			FigureLookAtDirection {Tag = "pl_HumanHeroSariel", Direction = 188.113},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 425.518, Y = 220.156},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 302.704},

			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroIO"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroAntara"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroSariel"},
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
			CameraTakeAddToTrack {File = "CS_05_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_05_Take_04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "INVISIBLEAVATAR01", Tag = "pl_HumanAvatar"},
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 1},
		},
		Actions =
		{
			-- Make Avatar invisible
			FigureCastSpellToEntity	{Tag = "pl_HumanAvatar", Spell = 449, Power = 1, TargetTag = "pl_HumanAvatar"},
		},
	},
	OnOneTimeEvent	
	{
		Conditions =
		{			
			--CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 7},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_05_Take_05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "INVISIBLEANTARA01", Tag = "pl_HumanHeroAntara"},			
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
			CameraTakeAddToTrack {File = "CS_05_Take_06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			FigureCastSpellToEntity	{Tag = "pl_HumanAvatar", Spell = 449, Power = 1, TargetTag = "pl_HumanAvatar"},
			CutsceneSay {TextTag = "INVISIBLESARIEL01", Tag = "pl_HumanHeroSariel"},			
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
			CameraTakeAddToTrack {File = "CS_05_Take_07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "INVISIBLEAVATAR02", Tag = "pl_HumanAvatar"},			
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
			CutsceneSay {TextTag = "INVISIBLESARIEL02", Tag = "pl_HumanHeroSariel"},			
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
			CutsceneSay {TextTag = "INVISIBLECAINE01", Tag = "pl_HumanHeroCaine"},			
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
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 7},
		},
		Actions =
		{
			AvatarSpellGive {Player = "default", Spell = 449},			 
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
			MapFlagSetTrue {Name = "mf_P502_EndInvisibleCutscene"},
			--MapTimerStart	{Name = "mt_P502_InvisibilityOutcry"},
	},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
};