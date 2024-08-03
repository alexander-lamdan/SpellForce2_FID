-- In der entsprechenden Runde spawnt der entsprechende Firestarter

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
			FigureVanish {},
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
			AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = Choice2a},
			MapValueIsGreater {Name = "mv_P465_Charges", Value = 0},
			PlayerFigureIsInRangeToEntity {TargetTag = "Trap01", Range = 5},
		},
		Actions =
		{
			-- Counter runterzählen
			MapValueDecrease {Name = "mv_P465_Charges", Value = 1},
			MapTimerStart {Name = "mt_P465_Delay"},
			FigureTeleportToEntity {TargetTag = "Boss01"},
			FigureCastSpellToEntity	{Spell = 54, Power = 30, TargetTag = "Boss01"},
			FigureVanish {Tag = "Painbringer1"}
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
			AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = Choice2b},
			MapValueIsGreater {Name = "mv_P465_Charges", Value = 0},
			PlayerFigureIsInRangeToEntity {TargetTag = "Trap01", Range = 5},
		},
		Actions =
		{
			-- Counter runterzählen
			MapValueDecrease {Name = "mv_P465_Charges", Value = 1},
			MapTimerStart {Name = "mt_P465_Delay"},
			FigureTeleportToEntity {TargetTag = "Boss02"},
			FigureCastSpellToEntity	{Spell = 54, Power = 30, TargetTag = "Boss02"},
			FigureVanish {Tag = "Painbringer1"}
		},
	},
}