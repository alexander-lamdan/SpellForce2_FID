State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				AND
				{
					QuestIsActive 	  		{Player = "pl_Human1", Quest = "CoopHolyShrines"},
					AvatarFlagIsFalse 		{Player = "pl_Human1", Name  = "af_P350_VisitedIronheartShrine"},
					FigureIsInEntityRange	{Tag 	= "pl_Human1Avatar", TargetTag = "Shrine", Range = 12},
				},
				AND
				{
					QuestIsActive 	  		{Player = "pl_Human2", Quest = "CoopHolyShrines"},
					AvatarFlagIsFalse 		{Player = "pl_Human2", Name  = "af_P350_VisitedIronheartShrine"},
					FigureIsInEntityRange	{Tag 	= "pl_Human2Avatar", TargetTag = "Shrine", Range = 12},
				},
				AND
				{
					QuestIsActive 	  		{Player = "pl_Human3", Quest = "CoopHolyShrines"},
					AvatarFlagIsFalse 		{Player = "pl_Human3", Name  = "af_P350_VisitedIronheartShrine"},
					FigureIsInEntityRange	{Tag 	= "pl_Human3Avatar", TargetTag = "Shrine", Range = 12},
				},
			},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_FoundIronShrine"},
			FigureOutcry   {Tag = "Shrine", TextTag = "Shrine01"},
			FigureOutcry   {Tag = "Shrine", TextTag = "Shrine02"},
		},
	},
};