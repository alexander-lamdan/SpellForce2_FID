--State
--{
--	StateName = "INIT",
--
--	OnOneTimeEvent
--	{
--		Conditions = 
--		{
--		},
--		Actions = 
--		{
--		},
--		GotoState = "MAIN",
--	},
--};


for i = 1, 3 do
	local sPlayerName = "pl_Human" .. i
	
	-- ********************************************************************
	-- solved, wenn die gegner platt sind
	-- ********************************************************************
	OnOneTimeEvent
	{
		EventName = "UndeadPlayer1Wiped",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopHonorMarks"},
			FigureIsAlive 	{Tag = "MustSurvive1"},
			MapFlagIsTrue	{Name = "mf_UndeadWiped"},
			MapFlagIsTrue	{Name = "mf_PactWiped"},
			MapFlagIsTrue	{Name = "mf_OutcryFirst"},
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = sPlayerName, ItemId = Item.Misc.Ehrenmarke, Amount = 1},
			AvatarFlagSetTrue	{Player = sPlayerName, Name = "af_P335_GotHonorMark"},
		},
	}			
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsSolved	{Player = sPlayerName, Quest = "CoopHonorMarksCollectedEnough"},
		},
		Actions = 
		{
			FigureVanish 	{Tag = "MustSurvive1"},
		},
	}
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_MorcaShamanReward"},
			QuestIsSolved  {Player = sPlayerName, Quest = "CoopMapQuestGateOfSwords"},
			AvatarHasNotLevel	{Player = sPlayerName, Level = 10},
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = sPlayerName, ItemId = 99, Amount = 1},
		},
	}
	OnOneTimeEvent
	{
		EventName = "Player"..i.."EnoughHonorMarksCollected",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopHonorMarks"},
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
};
