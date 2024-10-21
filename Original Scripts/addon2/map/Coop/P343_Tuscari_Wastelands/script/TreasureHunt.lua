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
			QuestIsActive		{Player = sPlayerName, Quest = "CoopTuscariMap"},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 164, Amount = 1},
		},
		Actions = 
		{
			QuestSetSolved	{Player = sPlayerName, Quest = "CoopTuscariMap"},
			QuestSetActive	{Player = sPlayerName, Quest = "CoopTuscariMapFound"},
		},
	}
end
State
{
	StateName = "GotMap"
};