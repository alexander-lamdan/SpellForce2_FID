for i = 1, 3 do
	local sPlayerName = "pl_Human" .. i
	
	-- ********************************************************************
	-- solved, wenn Shalagath tod ist
	-- ********************************************************************
	OnOneTimeEvent
	{
		EventName = "Player"..i.."KilledShalagath",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopShalagath"},
			FigureIsDead	{Tag    = "Shalagath"},
			MapFlagIsTrue   {Name   = "mf_ShalagathSpawned"}
			
		},
		Actions = 
		{
			QuestSetSolved	{Player = sPlayerName, Quest = "CoopShalagath"},
			QuestSetActive	{Player = sPlayerName, Quest = "CoopShalagathKilled"},
		},
	}
end
State
{
	StateName = "KilledShalagath"
};