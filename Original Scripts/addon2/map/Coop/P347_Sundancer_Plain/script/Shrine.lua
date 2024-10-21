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
					AvatarFlagIsFalse 		{Player = "pl_Human1", Name  = "af_P347_VisitedSundancerShrine"},
					FigureIsInEntityRange	{Tag 	= "pl_Human1Avatar", TargetTag = "Shrine", Range = 10},
				},
				AND
				{
					QuestIsActive 	  		{Player = "pl_Human2", Quest = "CoopHolyShrines"},
					AvatarFlagIsFalse 		{Player = "pl_Human2", Name  = "af_P347_VisitedSundancerShrine"},
					FigureIsInEntityRange	{Tag 	= "pl_Human2Avatar", TargetTag = "Shrine", Range = 10},
				},
				AND
				{
					QuestIsActive 	  		{Player = "pl_Human3", Quest = "CoopHolyShrines"},
					AvatarFlagIsFalse 		{Player = "pl_Human3", Name  = "af_P347_VisitedSundancerShrine"},
					FigureIsInEntityRange	{Tag 	= "pl_Human3Avatar", TargetTag = "Shrine", Range = 10},
				},
			},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_FoundSunShrine"},
			FigureOutcry   {Tag = "Shrine", TextTag = "Shrine01"},
			FigureOutcry   {Tag = "Shrine", TextTag = "Shrine02"},
		},
	},
};