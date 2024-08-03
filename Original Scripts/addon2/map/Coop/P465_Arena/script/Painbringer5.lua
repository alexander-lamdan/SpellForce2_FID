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
			AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = Choice2i},
			MapValueIsGreater {Name = "mv_P465_Charges", Value = 0},
			PlayerFigureIsInRangeToEntity {TargetTag = "Trap01", Range = 5},
		},
		Actions =
		{
			-- Counter runterzählen
			MapValueDecrease {Name = "mv_P465_Charges", Value = 1},
			MapTimerStart {Name = "mt_P465_Delay"},
			FigureTeleportToEntity {TargetTag = "Boss09"},
			FigureCastSpellToEntity	{Spell = 54, Power = 40, TargetTag = "Boss09"},
			FigureVanish {Tag = "Painbringer5"}
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
			AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = Choice2j},
			MapValueIsGreater {Name = "mv_P465_Charges", Value = 0},
			PlayerFigureIsInRangeToEntity {TargetTag = "Trap01", Range = 5},
		},
		Actions =
		{
			-- Counter runterzählen
			MapValueDecrease {Name = "mv_P465_Charges", Value = 1},
			MapTimerStart {Name = "mt_P465_Delay"},
			FigureTeleportToEntity {TargetTag = "Boss10"},
			FigureCastSpellToEntity	{Spell = 54, Power = 40, TargetTag = "Boss10"},
			FigureVanish {Tag = "Painbringer5"}
		},
	},
}