State 
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				FigureIsInEntityRange {Tag = "pl_Human1Avatar", TargetTag = "Demeter", Range = 12},
				FigureIsInEntityRange {Tag = "pl_Human2Avatar", TargetTag = "Demeter", Range = 12},
				FigureIsInEntityRange {Tag = "pl_Human3Avatar", TargetTag = "Demeter", Range = 12},
			},                                                                                    
		},
		Actions =
		{
			FigureOutcry	   {Tag  = "Demeter", TextTag = "Demeter01"},
			FigureOutcry	   {Tag  = "Demeter", TextTag = "Demeter02"},
			FigureOutcry	   {Tag  = "Demeter", TextTag = "Demeter03"},
			FigureOutcry	   {Tag  = "Demeter", TextTag = "Demeter04"},
		},
	},
	
};