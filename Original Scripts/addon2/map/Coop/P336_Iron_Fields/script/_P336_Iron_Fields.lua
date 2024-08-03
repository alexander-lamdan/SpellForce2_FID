State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				QuestIsActive 	{Player = "pl_Human1", Quest = "CoopHonorMarks"},
				QuestIsActive 	{Player = "pl_Human2", Quest = "CoopHonorMarks"},
				QuestIsActive 	{Player = "pl_Human3", Quest = "CoopHonorMarks"},	
			},
		},
		Actions = 
		{
			FogOfWarTeamAdd	{Team = "tm_Human"},
		},
		GotoState = "MAIN",
	},
};


for i = 1, 3 do
	local sPlayerName = "pl_Human" .. i
	
	-- ********************************************************************
	-- solved, wenn die gegner platt sind
	-- ********************************************************************
	OnOneTimeEvent
	{
		EventName = "ClansWiped",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopHonorMarks"},
			FigureIsAlive 	{Tag    = "MustSurvive1"},
			MapFlagIsTrue   {Name   = "mf_ClansCamp01Wiped"},
			MapFlagIsTrue   {Name   = "mf_ClansCamp02Wiped"},
		},
		Actions = 
		{
			
			AvatarItemMiscGive	{Player = sPlayerName, ItemId = Item.Misc.Ehrenmarke, Amount = 1},
			AvatarFlagSetTrue	{Player = sPlayerName, Name = "af_P336_GotHonorMark"},
		},
	}
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_MapQuestDone"},
			QuestIsSolved  {Player = sPlayerName, Quest = "CoopMapQuestIronFields"},
			AvatarHasNotLevel	{Player = sPlayerName, Level = 12},
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = sPlayerName, ItemId = 100, Amount = 1},
		},
	}
	OnOneTimeEvent
	{
		EventName = "Player0"..i.."EnoughHonorMarksCollected",
		Conditions = 
		{
			QuestIsActive	    {Player = sPlayerName, Quest = "CoopHonorMarks"},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = Item.Misc.Ehrenmarke, Amount = 5},
		},
		Actions = 
		{
			QuestSetSolved	{Player = sPlayerName, Quest = "CoopHonorMarks"},
			QuestSetActive	{Player = sPlayerName, Quest = "CoopHonorMarksCollectedEnough"},
		},
	}
end

State
{
	StateName = "MAIN",

	-- quest unsolvable nachrichten hier absetzen:
	OnOneTimeEvent
	{
		EventName = "MustSurvive1Died",
		Conditions = 
		{
			FigureIsDead {Tag = "MustSurvive1"},
		},
		Actions = 
		{
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotSolved {Player = "pl_Human1", Quest = "CoopMapQuestIronFields"},
			QuestIsNotSolved {Player = "pl_Human2", Quest = "CoopMapQuestIronFields"},
			QuestIsNotSolved {Player = "pl_Human3", Quest = "CoopMapQuestIronFields"},
		},
		Actions =
		{
			MapTimerStart {Name = "mt_MapQuestDelay"},
			VisualTimerStart	{Seconds = 900},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_MapQuestDelay", Seconds = 780},
		},
		Actions =
		{
			MapTimerStop  {Name = "mt_MapQuestDelay"},
			MapFlagSetTrue   {Name   = "mf_ConvoyAppears"},
		},
	},
	OnOneTimeEvent
	{

		Conditions = 
		{
			MapFlagIsTrue   {Name   = "mf_ConvoyAppears"},
			FigureIsAlive {Tag = "MustSurvive1"},
			CoopPlayerIsPlaying {Player = "pl_Human1"},
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "convoyguard01", Level = 4, UnitId = 369, TargetTag = "MapQuestPortal", Team = "tm_Human"},
			FigureNpcSpawnToEntity	{Tag = "convoyguard02", Level = 3, UnitId = 309, TargetTag = "MapQuestPortal", Team = "tm_Human"},
			FigureNpcSpawnToEntity	{Tag = "convoyguard03", Level = 3, UnitId = 309, TargetTag = "MapQuestPortal", Team = "tm_Human"},
			FigureNpcSpawnToEntity	{Tag = "convoyguard04", Level = 3, UnitId = 309, TargetTag = "MapQuestPortal", Team = "tm_Human"},

			FigureNpcSpawnToEntity	{Tag = "convoyhorse01", Level = 3, UnitId = 262, TargetTag = "MapQuestPortal", Team = "tm_Human"},
			FigureNpcSpawnToEntity	{Tag = "convoyhorse02", Level = 3, UnitId = 262, TargetTag = "MapQuestPortal", Team = "tm_Human"},
			FigureNpcSpawnToEntity	{Tag = "convoyhorse03", Level = 3, UnitId = 262, TargetTag = "MapQuestPortal", Team = "tm_Human"},
			MapFlagSetTrue   {Name   = "mf_ConvoyRevealed"},
		},
	},
	OnOneTimeEvent
	{

		Conditions = 
		{
			MapFlagIsTrue   {Name   = "mf_ConvoyAppears"},
			FigureIsAlive {Tag = "MustSurvive1"},
			CoopPlayerIsNotPlaying 	{Player = "pl_Human1"},
			CoopPlayerIsPlaying 	{Player = "pl_Human2"},
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "convoyguard01", Level = 4, UnitId = 369, TargetTag = "MapQuestPortal", Team = "tm_Human"},
			FigureNpcSpawnToEntity	{Tag = "convoyguard02", Level = 3, UnitId = 309, TargetTag = "MapQuestPortal", Team = "tm_Human"},
			FigureNpcSpawnToEntity	{Tag = "convoyguard03", Level = 3, UnitId = 309, TargetTag = "MapQuestPortal", Team = "tm_Human"},
			FigureNpcSpawnToEntity	{Tag = "convoyguard04", Level = 3, UnitId = 309, TargetTag = "MapQuestPortal", Team = "tm_Human"},

			FigureNpcSpawnToEntity	{Tag = "convoyhorse01", Level = 3, UnitId = 262, TargetTag = "MapQuestPortal", Team = "tm_Human"},
			FigureNpcSpawnToEntity	{Tag = "convoyhorse02", Level = 3, UnitId = 262, TargetTag = "MapQuestPortal", Team = "tm_Human"},
			FigureNpcSpawnToEntity	{Tag = "convoyhorse03", Level = 3, UnitId = 262, TargetTag = "MapQuestPortal", Team = "tm_Human"},
			MapFlagSetTrue   {Name   = "mf_ConvoyRevealed"},
		},
	},
	OnOneTimeEvent
	{

		Conditions = 
		{
			MapFlagIsTrue   {Name   = "mf_ConvoyAppears"},
			FigureIsAlive {Tag = "MustSurvive1"},
			CoopPlayerIsNotPlaying 	{Player = "pl_Human1"},
			CoopPlayerIsNotPlaying 	{Player = "pl_Human2"},
			CoopPlayerIsPlaying 	{Player = "pl_Human3"},
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "convoyguard01", Level = 4, UnitId = 369, TargetTag = "MapQuestPortal", Team = "tm_Human"},
			FigureNpcSpawnToEntity	{Tag = "convoyguard02", Level = 3, UnitId = 309, TargetTag = "MapQuestPortal", Team = "tm_Human"},
			FigureNpcSpawnToEntity	{Tag = "convoyguard03", Level = 3, UnitId = 309, TargetTag = "MapQuestPortal", Team = "tm_Human"},
			FigureNpcSpawnToEntity	{Tag = "convoyguard04", Level = 3, UnitId = 309, TargetTag = "MapQuestPortal", Team = "tm_Human"},

			FigureNpcSpawnToEntity	{Tag = "convoyhorse01", Level = 3, UnitId = 262, TargetTag = "MapQuestPortal", Team = "tm_Human"},
			FigureNpcSpawnToEntity	{Tag = "convoyhorse02", Level = 3, UnitId = 262, TargetTag = "MapQuestPortal", Team = "tm_Human"},
			FigureNpcSpawnToEntity	{Tag = "convoyhorse03", Level = 3, UnitId = 262, TargetTag = "MapQuestPortal", Team = "tm_Human"},
			MapFlagSetTrue   {Name   = "mf_ConvoyRevealed"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue   {Name   = "mf_ConvoyRevealed"},
			FigureIsAlive {Tag = "MustSurvive1"},
		},
		Actions =
		{
			FigureOutcry {Tag = "OutcryBauer", TextTag = "Elf01"},
			FigureOutcry {Tag = "OutcryBauer", TextTag = "Elf02"},
			FigureOutcry {Tag = "OutcryBauer", TextTag = "Elf03"},
			MapTimerStart 		{Name = "mt_StartQuest"},
			QuestSetActive     {Player = "pl_Human1", Quest = "CoopMapQuestIronFields"},
			QuestSetActive     {Player = "pl_Human2", Quest = "CoopMapQuestIronFields"},
			QuestSetActive     {Player = "pl_Human3", Quest = "CoopMapQuestIronFields"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsAlive {Tag = "MustSurvive1"},
			MapTimerIsElapsed {Name = "mt_StartQuest", Seconds = 120},
		},
		Actions =
		{
			MapFlagSetTrue     {Name = "mf_StartMapQuest"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_StartMapQuest"},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy04WP01"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP01"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP01"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy01WP01"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP01"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP01"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP01"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy01WP01", Range = 2},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy04WP01", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP01", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP01", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP01", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP01", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP01", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy04WP02"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP02"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP02"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy01WP02"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP02"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP02"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP02"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy01WP02", Range = 2},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy04WP02", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP02", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP02", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP02", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP02", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP02", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy04WP03"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP03"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP03"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy01WP03"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP03"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP03"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP03"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy01WP03", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy04WP03", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP03", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP03", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP03", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP03", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP03", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy04WP04"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP04"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP04"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy01WP04"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP04"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP04"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP04"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy01WP04", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy04WP04", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP04", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP04", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP04", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP04", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP04", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy04WP05"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP05"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP05"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy01WP05"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP05"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP05"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP05"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy01WP05", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy04WP05", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP05", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP05", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP05", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP05", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP05", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy04WP06"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP06"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP06"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy01WP06"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP06"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP06"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP06"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy01WP06", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy04WP06", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP06", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP06", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP06", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP06", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP06", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy04WP07"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP07"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP07"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy01WP07"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP07"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP07"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP07"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy01WP07", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy04WP07", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP07", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP07", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP07", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP07", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP07", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy04WP08"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP08"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP08"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy01WP08"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP08"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP08"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP08"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy01WP08", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy04WP08", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP08", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP08", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP08", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP08", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP08", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy04WP09"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP09"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP09"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy01WP09"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP09"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP09"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP09"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy01WP09", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy04WP09", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP09", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP09", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP09", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP09", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP09", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy04WP10"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP10"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP10"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy01WP10"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP10"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP10"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP10"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy01WP10", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy04WP10", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP10", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP10", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP10", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP10", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP10", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy04WP11"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP11"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP11"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy01WP11"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP11"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP11"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP11"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy01WP11", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy04WP11", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP11", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP11", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP11", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP11", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP11", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy04WP12"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP12"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP12"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy01WP12"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP12"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP12"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP12"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy01WP12", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy04WP12", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP12", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP12", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP12", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP12", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP12", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy04WP13"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP13"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP13"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy01WP13"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP13"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP13"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP13"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy01WP13", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy04WP13", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP13", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP13", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP13", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP13", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP13", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy04WP14"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP14"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP14"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy01WP14"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP14"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP14"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP14"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy01WP14", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy04WP14", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP14", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP14", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP14", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP14", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP14", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy04WP15"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP15"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP15"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy01WP15"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP15"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP15"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP15"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy01WP15", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy04WP15", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP15", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP15", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP15", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP15", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP15", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy04WP16"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP16"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP16"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy01WP16"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP16"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP16"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP16"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy01WP16", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy04WP16", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP16", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP16", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP16", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP16", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP16", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy04WP17"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP17"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP17"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy01WP17"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP17"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP17"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP17"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy01WP17", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy04WP17", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP17", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP17", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP17", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP17", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP17", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy04WP18"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP18"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP18"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy01WP18"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP18"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP18"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP18"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy01WP18", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy04WP18", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP18", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP18", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP18", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP18", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP18", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy04WP19"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP19"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP19"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy01WP19"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP19"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP19"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP19"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy01WP19", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy04WP19", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP19", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP19", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP19", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP19", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP19", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy01WP20"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP20"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP20"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy04WP20"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP20"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP20"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP20"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy04WP20", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy01WP20", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP20", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP20", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP20", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP20", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP20", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy01WP21"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP21"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP21"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy04WP21"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP21"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP21"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP21"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy04WP21", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy01WP21", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP21", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP21", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP21", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP21", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP21", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy01WP22"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP22"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP22"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy04WP22"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP22"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP22"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP22"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy04WP22", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy01WP22", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP22", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP22", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP22", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP22", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP22", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy01WP23"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP23"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP23"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy04WP23"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP23"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP23"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP23"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy04WP23", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy01WP23", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP23", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP23", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP23", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP23", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP23", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy01WP24"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP24"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP24"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy04WP24"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP24"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP24"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP24"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy04WP24", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy01WP24", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP24", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP24", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP24", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP24", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP24", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy01WP25"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP25"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP25"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy04WP25"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP25"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP25"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP25"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy04WP25", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy01WP25", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP25", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP25", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP25", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP25", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP25", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy01WP26"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP26"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP26"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy04WP26"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP26"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP26"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP26"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy04WP26", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy01WP26", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP26", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP26", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP26", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP26", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP26", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy01WP27"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP27"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP27"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy04WP27"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP27"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP27"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP27"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy04WP27", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy01WP27", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP27", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP27", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP27", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP27", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP27", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy01WP28"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP28"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP28"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy04WP28"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP28"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP28"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP28"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyguard01", TargetTag = "Convoy04WP28", Range = 5},

			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy01WP28", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP28", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP28", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP28", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP28", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard04", TargetTag = "Convoy07WP28", Range = 5},	  
				FigureIsDead		 	{Tag = "ConvoyGuard04"}, 
			},
		},
		Actions = 
		{
			FigureWalkToEntity {Tag = "convoyhorse01", TargetTag = "Convoy01WP29"},
			FigureWalkToEntity {Tag = "convoyhorse02", TargetTag = "Convoy02WP29"},
			FigureWalkToEntity {Tag = "convoyhorse03", TargetTag = "Convoy03WP29"},
			FigureWalkToEntity {Tag = "convoyguard01", TargetTag = "Convoy04WP29"},
			FigureWalkToEntity {Tag = "convoyguard02", TargetTag = "Convoy05WP29"},
			FigureWalkToEntity {Tag = "convoyguard03", TargetTag = "Convoy06WP29"},
			FigureWalkToEntity {Tag = "convoyguard04", TargetTag = "Convoy07WP29"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyhorse01", TargetTag = "Convoy01WP29", Range = 3},
		},
		Actions = 
		{
			MapValueAdd {Name = "mv_HorsesSaved", Value = 1},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyhorse02", TargetTag = "Convoy02WP29", Range = 3},
		},
		Actions = 
		{
			MapValueAdd {Name = "mv_HorsesSaved", Value = 1},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "convoyhorse03", TargetTag = "Convoy03WP29", Range = 3},
		},
		Actions = 
		{
			MapValueAdd {Name = "mv_HorsesSaved", Value = 1},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsGreater {Name = "mv_HorsesSaved", Value = 1},
			FigureIsAlive	{Tag = "MustSurvive1"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_MapQuestDone"},
			FigureOutcry {Tag = "MustSurvive1", TextTag = "Elf04"},
			FigureOutcry {Tag = "MustSurvive1", TextTag = "Elf05"},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 318, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 318, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 318, Amount = 1},
			QuestSetSolved {Player = "pl_Human1", Quest = "CoopMapQuestIronFields"},
			QuestSetSolved {Player = "pl_Human2", Quest = "CoopMapQuestIronFields"},
			QuestSetSolved {Player = "pl_Human3", Quest = "CoopMapQuestIronFields"},
		},
	},
};
