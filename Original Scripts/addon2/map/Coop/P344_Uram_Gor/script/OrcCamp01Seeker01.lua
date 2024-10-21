State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
	    	QuestIsActive	{Player = "pl_Human1", Quest = "CoopSpyDocuments"},
		},
		Actions = 
		{
		},
		DelayedActions = 
		{
		},
	},
	
	OnOneTimeEvent
	{
		GotoState = "Main",
		Conditions = 
		{
			FigureIsAlive	{},	
		},
		Actions = 
		{
		},
	},
};

State
{
	StateName = "Main",
		
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_Seeker01Free"},
		},
		Actions = 
		{
			FigureTeamTransfer		{Tag = "OrcCamp01Seeker01", Team   = "tm_Human"},
			FigurePlayerTransfer	{Tag = "OrcCamp01Seeker01", Player = "pl_Human1"},
			--PlayerKitTransfer	{Player = "pl_Human1", PlayerKit = "pk_Seeker0101"},
		},
	},
	
};