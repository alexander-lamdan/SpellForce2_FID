for i = 1, 3 do
	local sPlayerName = "pl_Human" .. i
	
	-- ********************************************************************
	-- solved, wenn Spieler Karte gefunden hat
	-- ********************************************************************
	OnOneTimeEvent
	{
		EventName = "Player"..i.."GotMirror",
		Conditions = 
		{
			QuestIsActive		{Player = sPlayerName, Quest = "CoopAnkbrandLight"},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = 168, Amount = 1},
		},
		Actions = 
		{
			QuestSetSolved	{Player = sPlayerName, Quest = "CoopAnkbrandLight"},
			QuestSetActive	{Player = sPlayerName, Quest = "CoopAnkbrandLightFound"},
		},
	}
end
State
{
	StateName = "GotMap"
};