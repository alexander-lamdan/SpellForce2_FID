State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
	    	QuestIsActive	{Player = "pl_Human3", Quest = "CoopSpyDocuments"},
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
			FigureTeamTransfer		{Tag = "OrcCamp02Seeker03", Team   = "tm_Human"},
			FigurePlayerTransfer	{Tag = "OrcCamp02Seeker03", Player = "pl_Human3"},
			--PlayerKitTransfer	{Player = "pl_Human3", PlayerKit = "pk_Seeker0203"},
		},
	},
	
};