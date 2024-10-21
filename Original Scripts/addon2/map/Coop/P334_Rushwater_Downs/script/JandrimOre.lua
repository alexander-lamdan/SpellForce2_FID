for i = 1, 3 do
	local sPlayerName = "pl_Human" .. i
	
	-- ********************************************************************
	-- solved, wenn Spieler 10 von jedem Erz hat
	-- ********************************************************************
	OnOneTimeEvent
	{
		EventName = "Player"..i.."EnoughOreCollected",
		Conditions = 
		{
			QuestIsActive		{Player = sPlayerName, Quest = "CoopJandrimCollectOre"},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 245, Amount = 10},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 246, Amount = 10},
		},
		Actions = 
		{
			QuestSetSolved	{Player = sPlayerName, Quest = "CoopJandrimCollectOre"},
			QuestSetActive	{Player = sPlayerName, Quest = "CoopJandrimCollectOreSolved"},
		},
	}
end
State
{
	StateName = "GotOre"
};
