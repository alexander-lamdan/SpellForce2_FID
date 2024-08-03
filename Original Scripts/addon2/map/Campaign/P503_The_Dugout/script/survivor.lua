State
{
	StateName = "SURVIVOR",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "Survivors_q1_08", TargetTag = "start", Range = 2},
		},
			
		Actions = 
		{
			FigureVanish	{Tag = "Survivors_q1_08"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "Survivors_q1_17", TargetTag = "start", Range = 2},
		},
			
		Actions = 
		{
			FigureVanish	{Tag = "Survivors_q1_17"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "Survivors_q1_25", TargetTag = "start", Range = 2},
		},
			
		Actions = 
		{
			FigureVanish	{Tag = "Survivors_q1_25"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "Survivors_q1_35", TargetTag = "start", Range = 2},
		},
			
		Actions = 
		{
			FigureVanish	{Tag = "Survivors_q1_35"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "Survivors_q1_46", TargetTag = "start", Range = 2},
		},
			
		Actions = 
		{
			FigureVanish	{Tag = "Survivors_q1_46"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "Survivors_q1_26", TargetTag = "start", Range = 2},
		},
			
		Actions = 
		{
			FigureVanish	{Tag = "Survivors_q1_26"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "Survivors_q1_62", TargetTag = "start", Range = 2},
		},
			
		Actions = 
		{
			FigureVanish	{Tag = "Survivors_q1_62"},
		},
	},
}