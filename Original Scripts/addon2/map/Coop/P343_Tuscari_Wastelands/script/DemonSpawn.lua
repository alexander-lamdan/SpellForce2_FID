State
{
	StateName = "DemonSpawn",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_DemonsDefeated"},
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
		
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_DemonsDefeated"},
			
			FigureIsDead {Tag = "FreeTrader01"},
			FigureIsDead {Tag = "FreeTrader02"},
			FigureIsDead {Tag = "FreeTrader03"},
			FigureIsDead {Tag = "FreeTrader04"},
			FigureIsDead {Tag = "FreeTrader05"},
			                               
			FigureIsDead {Tag = "FreeTrader06"},
			FigureIsDead {Tag = "FreeTrader07"},
			FigureIsDead {Tag = "FreeTrader08"},
			FigureIsDead {Tag = "FreeTrader09"},
			FigureIsDead {Tag = "FreeTrader10"},
			                               
			FigureIsDead {Tag = "FreeTrader11"},
			FigureIsDead {Tag = "FreeTrader12"},
			FigureIsDead {Tag = "FreeTrader13"},
			FigureIsDead {Tag = "FreeTrader14"},
			FigureIsDead {Tag = "FreeTrader15"},
			                               
			FigureIsDead {Tag = "FreeTrader16"},
			FigureIsDead {Tag = "FreeTrader17"},
			FigureIsDead {Tag = "FreeTrader18"},
			FigureIsDead {Tag = "FreeTrader19"},
			FigureIsDead {Tag = "FreeTrader20"},
		},
		Actions = 
		{
			FigureTeamTransfer	{Tag = "default", Team = "tm_ProphetKillPlayers"},
		},	
	},
};

