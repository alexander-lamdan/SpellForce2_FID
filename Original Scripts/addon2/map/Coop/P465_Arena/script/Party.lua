dofile(GetScriptPath().."Constant.lua")

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
			AvatarValueSet {Name = "av_P465_Spawn", Value = 39},
			MapTimerStart {Name = "mt_P465_Spawn"},
		},
	},
	OnFigureSpawnOnlyWhenEvent
	{
		X = 221,
		Y = 198,
		Conditions =
		{
			OR
			{
				AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = AllWon},
				MapFlagIsTrue {Name = "mf_P465_Test"},
			},
			AvatarValueIsEqual {Name = "av_P465_Spawn", Value = myNumber},
			MapTimerIsElapsed {Name = "mt_P465_Spawn", Seconds = 2},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			AvatarValueDecrease {Name = "av_P465_Spawn", Value = 1},
			MapTimerStart {Name = "mt_P465_Spawn"},
		},
	},
	OnIdleGoHomeFake
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions =
		{
		},
		Actions =
		{
		},
		HomeActions =
		{
			MapValueIncrease {Name = "mv_P465_Party"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual {Name = "mv_P465_Party", Value = 39},
		},
		Actions =
		{
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_undead_skeleton_warrior_emote_bow.ska"},
			EntityTimerStart {Name = "et_P465_Party"},
			AvatarValueSet {Name = "av_P465_Spawn", Value = 1},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P465_Party", Seconds = 0.1},
		},
		Actions =
		{
			FigureLookAtDirection {Direction = 131},
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_undead_skeleton_warrior_emote_cheer.ska"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P465_Party", Seconds = 3.4},
		},
		Actions =
		{
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_undead_skeleton_warrior_emote_taunt.ska"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P465_Party", Seconds = 7.2},
		},
		Actions =
		{
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_undead_skeleton_warrior_emote_cheer.ska"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P465_Party", Seconds = 10.8},
		},
		Actions =
		{
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_undead_skeleton_warrior_emote_sad.ska"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P465_Party", Seconds = 14.4},
		},
		Actions =
		{
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_undead_skeleton_warrior_emote_cheer.ska"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P465_Party", Seconds = 17.8},
		},
		Actions =
		{
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_undead_skeleton_warrior_emote_wave.ska"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P465_Party", Seconds = 21.2},
		},
		Actions =
		{
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_undead_skeleton_warrior_emote_cheer.ska"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P465_Party", Seconds = 24.6},
		},
		Actions =
		{
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_undead_skeleton_warrior_emote_kneel_down.ska"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P465_Party", Seconds = 26.8},
		},
		Actions =
		{
			FigureAnimPlayLooped {File = "base/gfx/figures/npc/figure_undead_skeleton_warrior_emote_kneel_hold.ska"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P465_Party", Seconds = 33.4},
		},
		Actions =
		{
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_undead_skeleton_warrior_emote_kneel_up.ska"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P465_Party", Seconds = 36.7},
		},
		Actions =
		{
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_undead_skeleton_warrior_emote_cheer.ska"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P465_Party", Seconds = 40.0},
		},
		Actions =
		{
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_undead_skeleton_warrior_emote_taunt.ska"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P465_Party", Seconds = 43.4},
		},
		Actions =
		{
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_undead_skeleton_warrior_emote_cheer.ska"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P465_Party", Seconds = 46.8},
		},
		Actions =
		{
			FigureAnimPlayOnce {File = "base/gfx/figures/npc/figure_undead_skeleton_warrior_emote_bow.ska"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P465_Party", Seconds = 60},
		},
		Actions =
		{
			MapTimerStart {Name = "mt_P465_Kill"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P465_Kill", Seconds = 0.75},
			AvatarValueIsEqual {Name = "av_P465_Spawn", Value = myNumber},
		},
		Actions =
		{
			EffectStart	{File = "Effect_Deathblows_Hit"},
			FigureKill {},
			AvatarValueIncrease {Name = "av_P465_Spawn", Value = 1},
			MapTimerStart {Name = "mt_P465_Kill"},
		},
	}
}