for i = 1, 3 do
	local sPlayerName = "pl_Human" .. i
	
	-- ********************************************************************
	-- solved, wenn Spieler 5 von jedem Erz hat
	-- ********************************************************************
	OnOneTimeEvent
	{
		EventName = "Player"..i.."EnoughOreCollected",
		Conditions = 
		{
			QuestIsActive		{Player = sPlayerName, Quest = "CoopJandrimCollectPerfectOre"},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 170, Amount = 5},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 171, Amount = 5},
		},
		Actions = 
		{
			QuestSetSolved	{Player = sPlayerName, Quest = "CoopJandrimCollectPerfectOre"},
			QuestSetActive	{Player = sPlayerName, Quest = "CoopJandrimCollectPerfectOreSolved"},
		},
	}
end
State
{
	StateName = "GotOre"
};