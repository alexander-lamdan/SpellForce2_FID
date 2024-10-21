for i = 1, 3 do
	local sPlayerName = "pl_Human" .. i
	
	-- ********************************************************************
	-- solved, wenn Spieler genug Runen hat
	-- ********************************************************************
	OnOneTimeEvent
	{
		EventName = "Player"..i.."GotEnoughRunes",
		Conditions = 
		{
			QuestIsActive		{Player = sPlayerName, Quest = "CoopMoreDragonRunes"},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 169, Amount = 3},
		},
		Actions = 
		{
			QuestSetSolved	{Player = sPlayerName, Quest = "CoopMoreDragonRunes"},
			QuestSetActive	{Player = sPlayerName, Quest = "CoopMoreDragonRunesFound"},
		},
	}
end
State
{
	StateName = "GotOre"
};
