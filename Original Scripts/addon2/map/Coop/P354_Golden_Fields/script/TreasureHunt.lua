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
			QuestIsActive		{Player = sPlayerName, Quest = "CoopGoldenFieldsMap"},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 167, Amount = 1},
		},
		Actions = 
		{
			QuestSetSolved	{Player = sPlayerName, Quest = "CoopGoldenFieldsMap"},
			QuestSetActive	{Player = sPlayerName, Quest = "CoopGoldenFieldsMapFound"},
		},
	}
end
State
{
	StateName = "GotMap"
};