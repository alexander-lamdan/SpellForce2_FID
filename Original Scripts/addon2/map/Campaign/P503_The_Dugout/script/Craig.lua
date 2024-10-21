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
		
			FigureVanish	{Tag = "Mg_spirit_craig_05"},		
		
		},
	};

	
	--05 
		OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Mg_spirit_craig_05_marker", Range =30 },
		},
		Actions = 
		{
			FigureRespawnToEntity	{Tag = "Mg_spirit_craig_05", TargetTag = "Mg_spirit_craig_05_marker"},
		},
	};

	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Mg_spirit_craig_05", Range =10 },
		},
		Actions = 
		{
			FigureVanish	{Tag = "Mg_spirit_craig_05"},
		},
	};
	
	

};