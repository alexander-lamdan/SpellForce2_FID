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
			-- Richtige Runde? ja/ Spieler in der Nähe? ja/ Noch Counter Übrig? ja/ Timer wieder abgelaufen? ja
			OR
			{
				AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = Choice2e},
				AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = Choice2f},
			},
			MapTimerIsElapsed {Name = "mt_P465_Delay", Seconds = recastTimeBuffStepTrigger},
			MapValueIsGreater {Name = "mv_P465_Charges", Value = 0},
			PlayerFigureIsInRangeToEntity {TargetTag = "Trap01", Range = 5},
			FigureTeamIsInRangeToEntity	{Team = "tm_Enemy", Range = trapRange, TargetTag = "Trap01"},
		},
		Actions =
		{
			-- Counter runterzählen
			MapValueDecrease {Name = "mv_P465_Charges", Value = 1},
			MapTimerStart {Name = "mt_P465_Delay"},
			FigureCastSpellToEntity	{Spell = 40, Power = 35, TargetTag = "Firestarter3"},
			FigureVanish {Tag = "Firestarter3"}
		},
	},
	OnFigureRespawnEvent
	{
		X = 132.357, 
		Y = 145.201, 
		WaitTime = recastTimeBuffStepTrigger,
		Conditions =
		{
			-- Richtige Runde? ja/ Spieler in der Nähe? ja/ Noch Counter Übrig? ja/ Timer wieder abgelaufen? ja
			OR
			{
				AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = Choice2e},
				AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = Choice2f},
			},
			MapValueIsGreater {Name = "mv_P465_Charges", Value = 0},
			PlayerFigureIsInRangeToEntity {TargetTag = "Trap01", Range = 5},
			FigureTeamIsInRangeToEntity	{Team = "tm_Enemy", Range = trapRange, TargetTag = "Trap01"},
		},
		Actions =
		{
			-- Counter runterzählen
			MapValueDecrease {Name = "mv_P465_Charges", Value = 1},
			MapTimerStart {Name = "mt_P465_Delay"},
			FigureCastSpellToEntity	{Spell = 40, Power = 35, TargetTag = "Firestarter3"},
			FigureVanish {Tag = "Firestarter3"}
		},
	},
}