for i = 1, 3 do
	local sPlayerName = "pl_Human" .. i
	
	-- ********************************************************************
	-- solved, wenn Spieler Karte gefunden hat
	-- ********************************************************************
	OnOneTimeEvent
	{
		EventName = "Player"..i.."GotMap",
		Conditions = 
		{
			QuestIsActive		{Player = sPlayerName, Quest = "CoopUnderhallMap"},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 166, Amount = 1},
		},
		Actions = 
		{
			QuestSetSolved	{Player = sPlayerName, Quest = "CoopUnderhallMap"},
			QuestSetActive	{Player = sPlayerName, Quest = "CoopUnderhallMapFound"},
		},
	}
end
State
{
	StateName = "GotMap"
};