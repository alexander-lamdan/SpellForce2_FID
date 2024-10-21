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
			AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = Choice2c},
			MapValueIsGreater {Name = "mv_P465_Charges", Value = 0},
			PlayerFigureIsInRangeToEntity {TargetTag = "Trap01", Range = 5},
		},
		Actions =
		{
			-- Counter runterzählen
			MapValueDecrease {Name = "mv_P465_Charges", Value = 1},
			MapTimerStart {Name = "mt_P465_Delay"},
			FigureTeleportToEntity {TargetTag = "Boss03"},
			FigureCastSpellToEntity	{Spell = 54, Power = 32, TargetTag = "Boss03"},
			FigureVanish {Tag = "Painbringer2"}
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
			AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = Choice2d},
			MapValueIsGreater {Name = "mv_P465_Charges", Value = 0},
			PlayerFigureIsInRangeToEntity {TargetTag = "Trap01", Range = 5},
		},
		Actions =
		{
			-- Counter runterzählen
			MapValueDecrease {Name = "mv_P465_Charges", Value = 1},
			MapTimerStart {Name = "mt_P465_Delay"},
			FigureTeleportToEntity {TargetTag = "Boss04"},
			FigureCastSpellToEntity	{Spell = 54, Power = 32, TargetTag = "Boss04"},
			FigureVanish {Tag = "Painbringer2"}
		},
	},
}