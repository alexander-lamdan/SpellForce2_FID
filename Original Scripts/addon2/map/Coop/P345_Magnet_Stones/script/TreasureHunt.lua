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
			QuestIsActive		{Player = sPlayerName, Quest = "CoopMagnetStonesMap"},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 165, Amount = 1},
		},
		Actions = 
		{
			QuestSetSolved	{Player = sPlayerName, Quest = "CoopMagnetStonesMap"},
			QuestSetActive	{Player = sPlayerName, Quest = "CoopMagnetStonesMapFound"},
		},
	}
end
State
{
	StateName = "GotMap"
};