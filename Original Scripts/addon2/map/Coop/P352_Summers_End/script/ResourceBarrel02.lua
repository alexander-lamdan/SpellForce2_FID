State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotActive {Player = "pl_Human2", Quest = "CoopResources"},
		},
		Actions =
		{
			ObjectVanish {Tag = "default"},
		},
	},
	OnLeverEvent
	{
		Delay = 5,
		Lever = "ResourceBarrel02",
		OnConditions = 
		{
		},
		Actions = 
		{
			EntityFlagSetTrue {Name = "ef_ClickedOnBarrel"},
		},
	},
	
	
	-- Spieler hat gerade Fass angeklickt und genug Resourcen
	OnEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue   		{Name = "ef_ClickedOnBarrel"},
			PlayerHasResourceLenya	{Player = "pl_Human2", Amount = 500},
			PlayerHasResourceSilver	{Player = "pl_Human2", Amount = 500},
			PlayerHasResourceStone	{Player = "pl_Human2", Amount = 500},
			MapValueIsLess 			{Name = "mv_TotalResourcesGathered", Value = 5000},
		},
		Actions = 
		{
			FigureOutcry	   {Tag  = "Demeter", TextTag = "Demeter06"},
			MapFlagSetTrue	   {Name = "mf_GaveResources"},
			EntityFlagSetFalse {Name = "ef_ClickedOnBarrel"},
			
			PlayerResourceLenyaTake		{Player = "pl_Human2", Amount = 500},
			PlayerResourceSilverTake	{Player = "pl_Human2", Amount = 500},
			PlayerResourceStoneTake		{Player = "pl_Human2", Amount = 500},
			
		},
	},
	
	-- Spieler hat gerade Fass angeklickt und nicht genug Resourcen
	
	OnEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue   		{Name = "ef_ClickedOnBarrel"},
			OR
			{
				PlayerHasNotResourceLenya	{Player = "pl_Human2", Amount = 500},
				PlayerHasNotResourceSilver	{Player = "pl_Human2", Amount = 500},
				PlayerHasNotResourceStone	{Player = "pl_Human2", Amount = 500},
			},
			
		},
		Actions = 
		{
			FigureOutcry	   {Tag  = "Demeter", TextTag = "Demeter07"},
			EntityFlagSetFalse {Name = "ef_ClickedOnBarrel"},
		},
	},
	
	-- Spieler hat gerade Fass angeklickt und genug Resourcen, aber Fass ist voll
	
	OnEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue   			{Name = "ef_ClickedOnBarrel"},
			PlayerHasResourceLenya		{Player = "pl_Human2", Amount = 500},
			PlayerHasResourceSilver		{Player = "pl_Human2", Amount = 500},
			PlayerHasResourceStone		{Player = "pl_Human2", Amount = 500},
			MapValueIsGreaterOrEqual 	{Name = "mv_TotalResourcesGathered", Value = 5000},
		},
		Actions = 
		{
			FigureOutcry	   {Tag  = "Demeter", TextTag = "Demeter09"},
			EntityFlagSetFalse {Name = "ef_ClickedOnBarrel"},
		},
	},
	
};