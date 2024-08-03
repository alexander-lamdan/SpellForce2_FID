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
		X = 224,
		Y = 201,
		WaitTime = recastTimeBuffStepTrigger,
		Conditions =
		{
			-- Richtige Runde? ja/ Spieler in der Nähe? ja/ Noch Counter Übrig? ja/ Timer wieder abgelaufen? ja
			AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = avatarValue1},
			MapValueIsGreater {Name = "mv_P465_Charges", Value = 0},
			PlayerFigureIsInRangeToEntity {TargetTag = "GraveSpot", Range = 5},
			FigureTeamIsNotInRangeToEntity	{Team = "tm_Enemy", Range = trapRange, TargetTag = "GraveSpot"},
			MapFlagIsFalse {Name = "mf_P465_WBGroup"..myNumber.."Spawned"},
			MapFlagIsFalse {Name = "mf_P465_WOBGroup"..myNumber.."Spawned"},
			FigureIsAlive {Tag = myBoss1},
		},
		Actions =
		{
			MapTimerStart {Name = "mt_P465_Delay"},
			FigureAttackEntity {TargetTag = myBoss1},
			EntityFlagSetTrue {Name = "ef_P465_Spawned"},
		},
		DeathActions =
		{
			EntityFlagSetFalse {Name = "ef_P465_Spawned"},
		}
	},
	OnFigureRespawnEvent
	{
		X = 224,
		Y = 201,
		WaitTime = recastTimeBuffStepTrigger,
		Conditions =
		{
			AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = avatarValue2},
			MapValueIsGreater {Name = "mv_P465_Charges", Value = 0},
			PlayerFigureIsInRangeToEntity {TargetTag = "GraveSpot", Range = 5},
			FigureTeamIsNotInRangeToEntity	{Team = "tm_Enemy", Range = trapRange, TargetTag = "GraveSpot"},
			MapFlagIsFalse {Name = "mf_P465_WBGroup"..myNumber.."Spawned"},
			MapFlagIsFalse {Name = "mf_P465_WOBGroup"..myNumber.."Spawned"},
			FigureIsAlive {Tag = myBoss2},
		},
		Actions =
		{
			-- Counter runterzählen
			MapTimerStart {Name = "mt_P465_Delay"},
			FigureAttackEntity {TargetTag = myBoss2},
			EntityFlagSetTrue {Name = "ef_P465_Spawned"},
		},
		DeathActions =
		{
			EntityFlagSetFalse {Name = "ef_P465_Spawned"},
		}
	},
	OnEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_P465_Spawned"},
			MapFlagIsFalse {Name = "mf_P465_ArenaFightRunning"},
		},
		Actions =
		{
			FigureVanish {},
		},
	},
}