State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		GotoState = "MAIN",
		Conditions = 
		{
		},
		Actions = 
		{
		},
		
	},
};

for i = 1, 3 do
	local sPlayerName = "pl_Human" .. i
	
	-- ********************************************************************
	-- solved, wenn die gegner platt sind
	-- ********************************************************************
	OnOneTimeEvent
	{
		EventName = "BeastsWiped",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopHonorMarks"},
			FigureIsAlive   {Tag = "Ortbrandt"},
			MapFlagIsTrue 	{Name = "mf_BeastCamp01Wiped"},
			MapFlagIsTrue 	{Name = "mf_BeastCamp02Wiped"},
			MapFlagIsTrue 	{Name = "mf_BeastCamp03Wiped"},
			MapFlagIsTrue	{Name = "mf_OutcryFirst"},

		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = sPlayerName, ItemId = Item.Misc.Ehrenmarke, Amount = 1},
			MapFlagSetTrue		{Name   = "mf_BeastWiped"},
		},
	}
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved  {Player = sPlayerName, Quest = "CoopMapQuestNorimar"},
			AvatarHasNotLevel	{Player = sPlayerName, Level = 12},
			MapFlagIsTrue	{Name   = "mf_SubquestDone"},
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = sPlayerName, ItemId = 101, Amount = 1},
		},
	}
	OnOneTimeEvent
	{
		EventName = "Player"..i.."EnoughHonorMarksCollected",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopHonorMarks"},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = Item.Misc.Ehrenmarke, Amount = 4},
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
	
	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions =
		{
			MapTimerStart {Name = "mt_BeastDelay"},
			FogOfWarRevealAtEntity {Tag = "NorimarCoopPortal", Range = 15},
			FogOfWarRevealAtEntity {Tag = "Ortbrandt", Range = 15},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_BeastDelay", Seconds = 180},
		},
		Actions =
		{
			PlayerActivate    {Player = "pl_Beast02"},			
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue		{Name   = "mf_BeastWiped"},
		}, 
		Actions = 
		{
			FigureOutcry   {Tag = "Ortbrandt", TextTag = "Ortbrandt01"},
			FigureOutcry   {Tag = "Ortbrandt", TextTag = "Ortbrandt02"},
			FigureOutcry   {Tag = "Ortbrandt", TextTag = "Ortbrandt03"},
		},
	},

};





