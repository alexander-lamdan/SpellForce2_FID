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
			QuestIsActive		{Player = sPlayerName, Quest = "CoopGateOfSwordsMap"},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 163, Amount = 1},
		},
		Actions = 
		{
			QuestSetSolved	{Player = sPlayerName, Quest = "CoopGateOfSwordsMap"},
			QuestSetActive	{Player = sPlayerName, Quest = "CoopGateOfSwordsMapFound"},
		},
	}
end
State
{
	StateName = "GotMap"
};