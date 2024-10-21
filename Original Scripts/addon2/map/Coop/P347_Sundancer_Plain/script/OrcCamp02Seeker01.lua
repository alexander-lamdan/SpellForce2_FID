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
			FigureIsAlive	{Tag = "default"},	
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
			MapFlagIsTrue	{Name = "mf_Seeker02Free"},
		},
		Actions = 
		{
			FigureTeamTransfer		{Tag = "OrcCamp02Seeker01", Team   = "tm_Human"},
			FigurePlayerTransfer	{Tag = "OrcCamp02Seeker01", Player = "pl_Human1"},
			--PlayerKitTransfer	{Player = "pl_Human1", PlayerKit = "pk_Seeker0201"},
		},
	},
	
};