--************************************************************
--**
--**		WoS  :: Last Boss Intro CutScene
--**
--************************************************************

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'cs_nightsong'",
		"'sucker_01'",
		"'sucker_02'",
		"'sucker_03'",
		"'sucker_04'",
		"'sucker_05'",
		"'sucker_06'",
		"'sucker_07'",
		"'BF_01'",
		"'BF_02'",
		"'BF_03'",
		"'BF_04'",
		"'BF_05'",
		"'BF_06'",
		"'BF_07'",
		"'BF_08'",
		"'BF_09'",
		"'BF_10'",
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
				MapFlagIsTrue {Name = "mf_P504_BossFightCS"},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			
			NoSpawnEffect	{Spawn = FigureNpcSpawn	{Tag = "CS_05_BOSSTIME", Level = 20, UnitId = 1676, X = 626.56, Y = 372.987, Team = "tm_Team2"},},
			FigureWalk	{Tag = "CS_05_BOSSTIME", X = 622.83, Y = 367.335 },

--[[			EffectStartAtEntityPosition {Tag = "sucker_01", File = "Effect_DemonicMage_Trajectory"},					
			EffectStartAtEntityPosition {Tag = "sucker_02", File = "Effect_DemonicMage_Trajectory"},					
			EffectStartAtEntityPosition {Tag = "sucker_03", File = "Effect_DemonicMage_Trajectory"},					
			EffectStartAtEntityPosition {Tag = "sucker_04", File = "Effect_DemonicMage_Trajectory"},					
			EffectStartAtEntityPosition {Tag = "sucker_05", File = "Effect_DemonicMage_Trajectory"},					
			EffectStartAtEntityPosition {Tag = "sucker_06", File = "Effect_DemonicMage_Trajectory"},					
			EffectStartAtEntityPosition {Tag = "sucker_07", File = "Effect_DemonicMage_Trajectory"},					--]]
			
			
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_05_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},	
			SoundGlobalPlayOnceAddon2 {File = "special/here_comes_trouble"},

		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "CS_01",
	},
};


State
{
	StateName = "CS_01",
	OnCutsceneFigureDespawnEvent	-- 
	{
		Conditions =
		{
			FigureIsIdle	{Tag = "CS_05_BOSSTIME"},
		},
		Actions =
		{
			FigureLookAtDirection {Tag = "CS_05_BOSSTIME", Direction = 285.516},
--			FigureAnimPlayOnce	{Tag = "BF_08", File = "addon2/gfx/figures/demonic/figure_demonic_npc_chosen_Rage.ska"},
	--		FigureAnimPlayOnce	{Tag = "BF_07", File = "addon2/gfx/figures/npc/figure_demonic_renegade_Combat Magic1.ska"},
--			FigureAnimPlayOnce	{Tag = "BF_06", File = "addon2/gfx/figures/demonic/figure_demonic_npc_warrior_melee_special.ska"},
--			FigureAnimPlayOnce	{Tag = "BF_03", File = "addon2/gfx/figures/demonic/figure_demonic_npc_warrior_idle_war.ska"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "FIGHT",
	},	
};

--[[State
{
	StateName = "CS_02",
	OnCutsceneFigureDespawnEvent	-- 
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 0.5},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "BF_04", File = "addon2/gfx/figures/demonic/figure_demonic_npc_chosen_Rage.ska"},
			FigureAnimPlayOnce	{Tag = "BF_01", File = "addon2/gfx/figures/demonic/figure_demonic_npc_warrior_idle_war.ska"},
			FigureAnimPlayOnce	{Tag = "BF_02", File = "addon2/gfx/figures/demonic/figure_demonic_npc_warrior_melee_special.ska"},
			FigureAnimPlayOnce	{Tag = "BF_05", File = "addon2/gfx/figures/npc/figure_demonic_renegade_Rage.ska"},
			FigureAnimPlayOnce	{Tag = "BF_09", File = "addon2/gfx/figures/demonic/figure_demonic_npc_warrior_idle_war.ska"},
			FigureAnimPlayOnce	{Tag = "BF_10", File = "addon2/gfx/figures/demonic/figure_demonic_npc_warrior_melee_special.ska"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "FIGHT",
	},	
};--]]

State
{
	StateName = "FIGHT",
	OnCutsceneFigureDespawnEvent	-- 
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 9},
		},
		Actions =
		{
			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			CutsceneFigureRenderAll {},	
			FadeInEffectStart{},
			MapFlagSetTrue {Name = "mf_P504_EndBossFightCS"},

		},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
	
};




