State
{
	StateName = "INIT",
	
	-- Patrol1
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				QuestIsActive	{Player = "pl_Human1", Quest = "CoopMapQuestShal"},
				QuestIsActive	{Player = "pl_Human2", Quest = "CoopMapQuestShal"},
				QuestIsActive	{Player = "pl_Human3", Quest = "CoopMapQuestShal"},
			},
			FigureIsDead {Tag = "Patrol01Leader"},
			
			FigureIsDead {Tag = "Patrol01Guard01"},
			FigureIsDead {Tag = "Patrol01Guard02"},
			FigureIsDead {Tag = "Patrol01Guard03"},
			FigureIsDead {Tag = "Patrol01Guard04"},
			FigureIsDead {Tag = "Patrol01Guard05"},
			
			FigureIsDead {Tag = "Patrol01Guard06"},
			FigureIsDead {Tag = "Patrol01Guard07"},
			FigureIsDead {Tag = "Patrol01Guard08"},
			FigureIsDead {Tag = "Patrol01Guard09"},
			FigureIsDead {Tag = "Patrol01Guard10"},
			
			FigureIsDead {Tag = "Patrol01Guard11"},
			FigureIsDead {Tag = "Patrol01Guard12"},
			FigureIsDead {Tag = "Patrol01Guard13"},
			FigureIsDead {Tag = "Patrol01Guard14"},
			FigureIsDead {Tag = "Patrol01Guard15"},
			
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_Patrol01Defeated"},	
		},
	}, 
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				QuestIsActive	{Player = "pl_Human1", Quest = "CoopFreeMerchants"},
				QuestIsActive	{Player = "pl_Human2", Quest = "CoopFreeMerchants"},
				QuestIsActive	{Player = "pl_Human3", Quest = "CoopFreeMerchants"},
			},
			FigureIsDead {Tag = "Patrol02Leader"},
			
			FigureIsDead {Tag = "Patrol02Guard01"},
			FigureIsDead {Tag = "Patrol02Guard02"},
			FigureIsDead {Tag = "Patrol02Guard03"},
			FigureIsDead {Tag = "Patrol02Guard04"},
			FigureIsDead {Tag = "Patrol02Guard05"},
			
			FigureIsDead {Tag = "Patrol02Guard06"},
			FigureIsDead {Tag = "Patrol02Guard07"},
			FigureIsDead {Tag = "Patrol02Guard08"},
			FigureIsDead {Tag = "Patrol02Guard09"},
			FigureIsDead {Tag = "Patrol02Guard10"},
			
			FigureIsDead {Tag = "Patrol02Guard11"},
			FigureIsDead {Tag = "Patrol02Guard12"},
			FigureIsDead {Tag = "Patrol02Guard13"},
			FigureIsDead {Tag = "Patrol02Guard14"},
			FigureIsDead {Tag = "Patrol02Guard15"},
			
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_Patrol02Defeated"},	
		},
	}, 
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				QuestIsActive	{Player = "pl_Human1", Quest = "CoopMapQuestShal"},
				QuestIsActive	{Player = "pl_Human2", Quest = "CoopMapQuestShal"},
				QuestIsActive	{Player = "pl_Human3", Quest = "CoopMapQuestShal"},
			},
			FigureIsDead {Tag = "Patrol03Leader"},
			
			FigureIsDead {Tag = "Patrol03Guard01"},
			FigureIsDead {Tag = "Patrol03Guard02"},
			FigureIsDead {Tag = "Patrol03Guard03"},
			FigureIsDead {Tag = "Patrol03Guard04"},
			FigureIsDead {Tag = "Patrol03Guard05"},
			                            
			FigureIsDead {Tag = "Patrol03Guard06"},
			FigureIsDead {Tag = "Patrol03Guard07"},
			FigureIsDead {Tag = "Patrol03Guard08"},
			FigureIsDead {Tag = "Patrol03Guard09"},
			FigureIsDead {Tag = "Patrol03Guard10"},
			                            
			FigureIsDead {Tag = "Patrol03Guard11"},
			FigureIsDead {Tag = "Patrol03Guard12"},
			FigureIsDead {Tag = "Patrol03Guard13"},
			FigureIsDead {Tag = "Patrol03Guard14"},
			FigureIsDead {Tag = "Patrol03Guard15"},
			
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_Patrol03Defeated"},	
		},
	}, 
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				QuestIsActive	{Player = "pl_Human1", Quest = "CoopFreeMerchants"},
				QuestIsActive	{Player = "pl_Human2", Quest = "CoopFreeMerchants"},
				QuestIsActive	{Player = "pl_Human3", Quest = "CoopFreeMerchants"},
			},
			FigureIsDead {Tag = "Patrol04Leader"},
			
			FigureIsDead {Tag = "Patrol04Guard01"},
			FigureIsDead {Tag = "Patrol04Guard02"},
			FigureIsDead {Tag = "Patrol04Guard03"},
			FigureIsDead {Tag = "Patrol04Guard04"},
			FigureIsDead {Tag = "Patrol04Guard05"},
			
			FigureIsDead {Tag = "Patrol04Guard06"},
			FigureIsDead {Tag = "Patrol04Guard07"},
			FigureIsDead {Tag = "Patrol04Guard08"},
			FigureIsDead {Tag = "Patrol04Guard09"},
			FigureIsDead {Tag = "Patrol04Guard10"},
			
			FigureIsDead {Tag = "Patrol04Guard11"},
			FigureIsDead {Tag = "Patrol04Guard12"},
			FigureIsDead {Tag = "Patrol04Guard13"},
			FigureIsDead {Tag = "Patrol04Guard14"},
			FigureIsDead {Tag = "Patrol04Guard15"},
			
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_Patrol04Defeated"},	
		},
	}, 
	
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				QuestIsActive	{Player = "pl_Human1", Quest = "CoopMapQuestShal"},
				QuestIsActive	{Player = "pl_Human2", Quest = "CoopMapQuestShal"},
				QuestIsActive	{Player = "pl_Human3", Quest = "CoopMapQuestShal"},
			},
			FigureIsDead {Tag = "Patrol05Leader"},
			
			FigureIsDead {Tag = "Patrol05Guard01"},
			FigureIsDead {Tag = "Patrol05Guard02"},
			FigureIsDead {Tag = "Patrol05Guard03"},
			FigureIsDead {Tag = "Patrol05Guard04"},
			FigureIsDead {Tag = "Patrol05Guard05"},
			
			FigureIsDead {Tag = "Patrol05Guard06"},
			FigureIsDead {Tag = "Patrol05Guard07"},
			FigureIsDead {Tag = "Patrol05Guard08"},
			FigureIsDead {Tag = "Patrol05Guard09"},
			FigureIsDead {Tag = "Patrol05Guard10"},
			
			FigureIsDead {Tag = "Patrol05Guard11"},
			FigureIsDead {Tag = "Patrol05Guard12"},
			FigureIsDead {Tag = "Patrol05Guard13"},
			FigureIsDead {Tag = "Patrol05Guard14"},
			FigureIsDead {Tag = "Patrol05Guard15"},
			
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_Patrol05Defeated"},	
		},
	}, 
};

