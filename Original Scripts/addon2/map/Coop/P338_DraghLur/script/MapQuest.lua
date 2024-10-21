State
{
	StateName = "WaitForQuest",
	OnOneTimeEvent
	{
		GotoState = "StartQuest",
		Conditions = 
		{
			FigureTeamIsInRange	{Team = "tm_Human", Range = 7, X = 257, Y = 518},
			QuestIsNotSolved {Player = "pl_Human1", Quest = "CoopMapQuestDraghLur"},
			QuestIsNotSolved {Player = "pl_Human2", Quest = "CoopMapQuestDraghLur"},			
			QuestIsNotSolved {Player = "pl_Human3", Quest = "CoopMapQuestDraghLur"},
		},
		Actions = 
		{
		},
	},
};
State
{
	StateName = "StartQuest",
	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
			FigureOutcry {Tag = "QuestGiver", TextTag = "Peasant01"},
			FigureOutcry {Tag = "QuestGiver", TextTag = "Peasant02"},
			FigureOutcry {Tag = "QuestGiver", TextTag = "Peasant03"},
			FigureOutcry {Tag = "QuestGiver", TextTag = "Peasant04"},
			
			QuestSetActive {Player = "pl_Human1", Quest = "CoopMapQuestDraghLur"},
			QuestSetActive {Player = "pl_Human2", Quest = "CoopMapQuestDraghLur"},			
			QuestSetActive {Player = "pl_Human3", Quest = "CoopMapQuestDraghLur"},
			
			EntityTimerStart {Name = "et_QuestGiverRunsAwayDelay"},
			
			FigureLootItemEquipmentAdd	{Tag = "PrisonGuard15", DropChance = 100, ItemId = 377},
			FogOfWarRevealAtEntity	{FogOfWarId = default, Tag = "Prisoner01", Range = 5, Height = default},
			FogOfWarRevealAtEntity	{FogOfWarId = default, Tag = "Prisoner02", Range = 5, Height = default},
			FogOfWarRevealAtEntity	{FogOfWarId = default, Tag = "Prisoner03", Range = 5, Height = default},
			FogOfWarRevealAtEntity	{FogOfWarId = default, Tag = "Prisoner04", Range = 5, Height = default},
			FogOfWarRevealAtEntity	{FogOfWarId = default, Tag = "Prisoner05", Range = 5, Height = default},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_QuestGiverRunsAwayDelay", Seconds = 20},
		},
		Actions =
		{
			FigureRunToEntity {Tag = "QuestGiver", TargetTag = "DraghLurPortal"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange  {Tag = "QuestGiver", TargetTag = "DraghLurPortal", Range = 2},
		},
		Actions =
		{
			FigureVanish {Tag = "QuestGiver"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_PrisonGuardsDefeated"},
		},
		Actions =
		{
			ObjectVanish {Tag = "Cage01"},
			ObjectVanish {Tag = "Cage02"},
			ObjectVanish {Tag = "Cage03"},
			ObjectVanish {Tag = "Cage04"},
			ObjectVanish {Tag = "Cage05"},
			
			
			FigureOutcry {Tag = "Prisoner01", TextTag = "Peasant05"},
			FigureOutcry {Tag = "Prisoner01", TextTag = "Peasant06"},
			EntityTimerStart	{Name = "et_FleeTimer"},
			
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityTimerIsElapsed	{Name = "et_FleeTimer", Seconds = 10},
		},
		Actions =
		{
			FigureRunToEntity {Tag = "Prisoner01", TargetTag = "DraghLurPortal"},
			FigureRunToEntity {Tag = "Prisoner02", TargetTag = "DraghLurPortal"},
			FigureRunToEntity {Tag = "Prisoner03", TargetTag = "DraghLurPortal"},
			FigureRunToEntity {Tag = "Prisoner04", TargetTag = "DraghLurPortal"},
			FigureRunToEntity {Tag = "Prisoner05", TargetTag = "DraghLurPortal"},
				
			QuestSetSolved {Player = "pl_Human1", Quest = "CoopMapQuestDraghLur"},
			QuestSetSolved {Player = "pl_Human2", Quest = "CoopMapQuestDraghLur"},			
			QuestSetSolved {Player = "pl_Human3", Quest = "CoopMapQuestDraghLur"},
		},
	},
	
};


