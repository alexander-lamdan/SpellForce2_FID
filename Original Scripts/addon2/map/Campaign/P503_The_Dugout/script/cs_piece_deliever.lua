--************************************************************
--**
--**		Winterlight Peak Wind
--**
--************************************************************

-- Figuren die gerendert werden
local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroCaine'",
		"'pl_HumanHeroSariel'",
		"'Cutscene_Twiddle_01'",
		--"'D_twiddle_device'",
		--"'D_Godstone'",
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
			FigureVanish	{Tag = "Cutscene_Twiddle_01"}, 
			FigureVanish	{Tag = "Cutscene_Avatar_02"},
			FigureVanish	{Tag = "Cutscene_Caine_02"},
			FigureVanish	{Tag = "Cutscene_Sariel_02"},
		},
		GotoState = self,
	};



	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_P503_StartPieceDelivery"},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			ObjectSpawn	{ObjectId = 2510, X = 249.683, Y = 342.396, Direction = 0, Tag = "D_Godstone"},
			ObjectSpawn	{ObjectId = 2520, X = 257.523, Y = 342.18, Direction = 0, Tag = "D_twiddle_device"},
			-- Teleport und Ausrichtung der Akteure
			CutsceneFigureTeleport {Tag = "Cutscene_Twiddle_01", X = 256.118, Y = 344.349},
			FigureLookAtDirection {Tag = "Cutscene_Twiddle_01", Direction = 176.654},
			CutsceneFigureTeleport {Tag = "Cutscene_Twiddle_01", X = 256.118, Y = 344.349},
			FigureLookAtDirection {Tag = "Cutscene_Twiddle_01", Direction = 176.654},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 256.542, Y = 346.962},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 0},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 254.082, Y = 345.874},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 51.5662},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroSariel", X = 258.173, Y = 345.432},
			FigureLookAtDirection {Tag = "pl_HumanHeroSariel", Direction = 314.163},
			-- Waffen werden nicht dargestellt
			CutsceneFigureWeaponsHide {Tag = "Cutscene_Twiddle_01"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroSariel"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_03_Take08", Tag = "default", TargetTag = "default"},
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
	OnOneTimeEvent	-- MG_Sariel: SARIEL01
	{
		Conditions =
		{
		},
		Actions =
		{
			CutsceneSay {TextTag = "TWIDDLEARTIFACT01", Tag = "Cutscene_Twiddle_01"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	-- MG_Caine: CAINE01
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			
			CutsceneSay {TextTag = "AVATARARTIFACT02", Tag = "pl_HumanAvatar"},			
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
			
			CutsceneSay {TextTag = "AVATARARTIFACT03", Tag = "Cutscene_Twiddle_01"},			
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
			--CutsceneSayIsDone {},	
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 3},
		},
		Actions =
		{
			
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "Cutscene_Twiddle_01"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroSariel"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},	
			
			--CutsceneFigureTeleportBack {Tag = "pl_HumanAvatar"},
			--CutsceneFigureTeleportBack {Tag = "pl_HumanHeroSariel"},
			--CutsceneFigureTeleportBack {Tag = "pl_HumanHeroCaine"},	
			
			EntityTimerStop	{Name = "et_CStimer"},			
			--AvatarItemMiscTake	{ItemId = 418, Amount =1 },
			--AvatarItemMiscTake	{ItemId = 419, Amount =1 },
			--AvatarItemMiscTake	{ItemId = 420, Amount =1 },
			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			FadeInEffectStart{},
			CutsceneFigureRenderAll {},
			MapFlagSetTrue {Name = "mf_P503_EndPieceDelivery"},
			PlayerMapTravelAddon2	{Map = "Campaign/P504_The_Wasteland_Of_Sorrows", TargetTag = "start"},						
	},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
};