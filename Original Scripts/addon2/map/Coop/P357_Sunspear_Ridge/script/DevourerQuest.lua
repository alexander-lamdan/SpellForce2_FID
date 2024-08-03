State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsNotActive {Player = "pl_Human1", Quest = "CoopDragonHunter"},
			QuestIsNotActive {Player = "pl_Human2", Quest = "CoopDragonHunter"},
			QuestIsNotActive {Player = "pl_Human3", Quest = "CoopDragonHunter"},
		},
		Actions =
		{
			FigureVanish {Tag = "Devourer"},
		},
	},
	OnEvent
	{
		GotoState = "QuestSolver",
		Conditions =
		{
		},
		Actions =
		{
		},
	},
};
for i = 1, 3 do
	local sPlayerName = "pl_Human" .. i
	
	-- ********************************************************************
	-- solved, wenn Spieler Verschlinger Rune hat
	-- ********************************************************************
	OnOneTimeEvent
	{
		EventName = "Player"..i.."GotDevourerRunes",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopDragonHunter"},
			FigureIsDead	{Tag = "Devourer"},
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = sPlayerName, ItemId = 247, Amount = 1},
			QuestSetSolved	{Player = sPlayerName, Quest = "CoopDragonHunter"},
			QuestSetActive	{Player = sPlayerName, Quest = "CoopDragonHunterFound"},
		},
	}
end
State 
{
	StateName = "QuestSolver",	

};