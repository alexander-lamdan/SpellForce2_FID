for i = 1, 3 do
	local sPlayerName = "pl_Human" .. i
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive		{Player = sPlayerName, Quest = "CoopAnkbrandLight"},
			MapFlagIsTrue		{Name = "mf_TitanSpawned"},
			FigureIsDead		{Tag  = "AnkbrandGuardian"},
			
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = sPlayerName, ItemId = 168, Amount = 1},
			QuestSetSolved		{Player = sPlayerName, Quest = "CoopAnkbrandLight"},
			QuestSetActive		{Player = sPlayerName, Quest = "CoopAnkbrandLightFound"},
		},
	}
end

State
{
	StateName = "INIT",
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotActive 	{Player = "pl_Human1", Quest = "CoopAnkbrandLight"},
			QuestIsNotActive 	{Player = "pl_Human2", Quest = "CoopAnkbrandLight"},
			QuestIsNotActive 	{Player = "pl_Human3", Quest = "CoopAnkbrandLight"},
		},
		Actions = 
		{
			ObjectVanish	{Tag = "AnkbrandMarker"},
		},
	},
};