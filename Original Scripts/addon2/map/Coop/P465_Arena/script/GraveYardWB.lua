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
			OR
			{
				AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = avatarValue1},
				AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = avatarValue2},
			},
			MapValueIsGreater {Name = "mv_P465_Charges", Value = 0},
			MapFlagIsFalse {Name = "mf_P465_WBGroup"..myNumber.."Spawned"}, 
			MapFlagIsFalse {Name = "mf_P465_WoBGroup"..myNumber.."Spawned"},
			PlayerFigureIsInRangeToEntity {TargetTag = "GraveSpot", Range = 5},
			FigureTeamIsInRangeToEntity	{Team = "tm_Enemy", Range = trapRange, TargetTag = "GraveSpot"},
		},
		Actions =
		{
			MapTimerStart {Name = "mt_P465_Delay"},
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
			EntityFlagSetFalse {Name = "ef_P465_Spawned"},
			FigureVanish {},
		},
	},
}