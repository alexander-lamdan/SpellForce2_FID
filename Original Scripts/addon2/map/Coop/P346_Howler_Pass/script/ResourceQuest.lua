State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
		},
		GotoState = "ResourceGathering",
	},
};

for i = 1, 3 do
	local sPlayerName = "pl_Human" .. i
	
	-- ********************************************************************
	-- Ein Spieler hat Resourcen abgeliefert - Alle bekommen sie gut geschrieben
	-- ********************************************************************
	
	OnEvent
	{
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopResources"},
			MapFlagIsTrue   {Name = "mf_GaveResources"},
		},
		Actions = 
		{
			AvatarValueAdd  {Player = sPlayerName, Name  = "av_P341_ResourcesGathered", Value = 500},
			AvatarItemMiscGive	{Player = sPlayerName, ItemId = 200, Amount = 1},
		},
	}	
	
	-- ********************************************************************
	-- solved, wenn 10.000 Stück Resourcen gesammelt
	-- ********************************************************************
	OnOneTimeEvent
	{
		EventName = "Player0"..i.."GotResources",
		Conditions = 
		{
			OR
			{
				AND
				{
					QuestIsActive	{Player = sPlayerName, Quest = "CoopResources"},
					AvatarHasItemMisc	{Player = sPlayerName, ItemId = 200, Amount = 20},
				},
				AND
				{
					QuestIsActive	{Player = sPlayerName, Quest = "CoopResources"},
			AvatarValueIsGreaterOrEqual	{Player = sPlayerName, Name  = "av_P341_ResourcesGathered", Value = 10000},
				},
			},
		},
		Actions = 
		{
			AvatarItemMiscTake	{sPlayerName, ItemId = 200, Amount = 999},
			QuestSetSolved	{Player = sPlayerName, Quest = "CoopResources"},
			QuestSetActive	{Player = sPlayerName, Quest = "CoopResourcesGatheredEnough"},
		},
	}
end
State
{
	StateName = "ResourceGathering",
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_GaveResources"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_GaveResources"},
			MapValueAdd 	{Name = "mv_TotalResourcesGathered", Value = 500},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapValueIsGreaterOrEqual 	{Name = "mv_TotalResourcesGathered", Value = 5000},
		},
		Actions = 
		{
			FigureOutcry {Tag  = "Demeter", TextTag = "Demeter08"},
		},
	
	},
};