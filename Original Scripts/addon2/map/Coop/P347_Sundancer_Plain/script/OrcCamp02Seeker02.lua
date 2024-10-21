State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
	    	QuestIsActive	{Player = "pl_Human2", Quest = "CoopSpyDocuments"},
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
			FigureTeamTransfer		{Tag = "OrcCamp02Seeker02", Team   = "tm_Human"},
			FigurePlayerTransfer	{Tag = "OrcCamp02Seeker02", Player = "pl_Human2"},
			--PlayerKitTransfer	{Player = "pl_Human2", PlayerKit = "pk_Seeker0202"},
		},
	},
	
};