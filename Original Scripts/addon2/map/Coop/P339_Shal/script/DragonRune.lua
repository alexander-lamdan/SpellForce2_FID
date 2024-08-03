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
			QuestIsActive		{Player = sPlayerName, Quest = "CoopDragonRunes"},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 169, Amount = 3},
		},
		Actions = 
		{
			QuestSetSolved	{Player = sPlayerName, Quest = "CoopDragonRunes"},
			QuestSetActive	{Player = sPlayerName, Quest = "CoopDragonRunesFound"},
		},
	}
end
State
{
	StateName = "GotOre"
};
