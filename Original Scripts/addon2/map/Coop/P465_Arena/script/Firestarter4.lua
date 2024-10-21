-- In der entsprechenden Runde spawnt der entsprechende Firestarter

dofile(GetScriptPath().."Constant.lua")

State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = 132.357, 
		Y = 145.201, 
		Conditions =
		{
			-- Richtige Runde? ja/ Spieler in der N�he? ja/ Noch Counter �brig? ja/ Timer wieder abgelaufen? ja
			OR
			{
				AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = Choice2g},
				AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = Choice2h},
			},
			MapTimerIsElapsed {Name = "mt_P465_Delay", Seconds = recastTimeBuffStepTrigger},
			MapValueIsGreater {Name = "mv_P465_Charges", Value = 0},
			PlayerFigureIsInRangeToEntity {TargetTag = "Trap01", Range = 5},
			FigureTeamIsInRangeToEntity	{Team = "tm_Enemy", Range = trapRange, TargetTag = "Trap01"},
		},
		Actions =
		{
			-- Counter runterz�hlen
			MapValueDecrease {Name = "mv_P465_Charges", Value = 1},
			MapTimerStart {Name = "mt_P465_Delay"},
			FigureCastSpellToEntity	{Spell = 40, Power = 38, TargetTag = "Firestarter4"},
			FigureVanish {Tag = "Firestarter1"}
		},
	},
	OnFigureRespawnEvent
	{
		X = 132.357, 
		Y = 145.201, 
		WaitTime = recastTimeBuffStepTrigger,
		Conditions =
		{
			-- Richtige Runde? ja/ Spieler in der N�he? ja/ Noch Counter �brig? ja/ Timer wieder abgelaufen? ja
			OR
			{
				AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = Choice2g},
				AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = Choice2h},
			},
			MapValueIsGreater {Name = "mv_P465_Charges", Value = 0},
			PlayerFigureIsInRangeToEntity {TargetTag = "Trap01", Range = 5},
			FigureTeamIsInRangeToEntity	{Team = "tm_Enemy", Range = trapRange, TargetTag = "Trap01"},
		},
		Actions =
		{
			-- Counter runterz�hlen
			MapValueDecrease {Name = "mv_P465_Charges", Value = 1},
			MapTimerStart {Name = "mt_P465_Delay"},
			FigureCastSpellToEntity	{Spell = 40, Power = 38, TargetTag = "Firestarter4"},
			FigureVanish {Tag = "Firestarter4"}
		},
	},
}