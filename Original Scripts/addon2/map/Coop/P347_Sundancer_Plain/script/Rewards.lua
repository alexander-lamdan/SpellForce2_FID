State
{
	StateName = "INIT",
	
	-- Avatarflags für Kitaki werden im Plattformscript gesetzt
	
	-- Ork Camps
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "OrcCamp01Guard01"},
			FigureIsDead	{Tag = "OrcCamp01Guard02"},
			FigureIsDead	{Tag = "OrcCamp01Guard03"},
			FigureIsDead	{Tag = "OrcCamp01Guard04"},
			FigureIsDead	{Tag = "OrcCamp01Guard05"},
			FigureIsDead	{Tag = "OrcCamp01Guard06"},
			FigureIsDead	{Tag = "OrcCamp01Guard07"},  
			FigureIsDead	{Tag = "OrcCamp01Guard08"},
			FigureIsDead	{Tag = "OrcCamp01Guard09"},
			FigureIsDead	{Tag = "OrcCamp01Guard10"},
			FigureIsDead	{Tag = "OrcCamp01Guard11"},
			FigureIsDead	{Tag = "OrcCamp01Guard12"},
			FigureIsDead	{Tag = "OrcCamp01Guard13"},
			FigureIsDead	{Tag = "OrcCamp01Guard14"},
			FigureIsDead	{Tag = "OrcCamp01Guard15"},
			FigureIsDead	{Tag = "OrcCamp01Guard16"},
			FigureIsDead	{Tag = "OrcCamp01Guard17"},
			FigureIsDead	{Tag = "OrcCamp01Guard18"},
			
			BuildingIsDead	{Tag = "OrcCamp01Tower01"},
			BuildingIsDead	{Tag = "OrcCamp01Tower02"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_DefeatedOrkCamp01"},
		},
	},	
	
		OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "OrcCamp02Guard01"},
			FigureIsDead	{Tag = "OrcCamp02Guard02"},
			FigureIsDead	{Tag = "OrcCamp02Guard03"},
			FigureIsDead	{Tag = "OrcCamp02Guard04"},
			FigureIsDead	{Tag = "OrcCamp02Guard05"},
			FigureIsDead	{Tag = "OrcCamp02Guard06"},
			FigureIsDead	{Tag = "OrcCamp02Guard07"},  
			FigureIsDead	{Tag = "OrcCamp02Guard08"},
			FigureIsDead	{Tag = "OrcCamp02Guard09"},
			FigureIsDead	{Tag = "OrcCamp02Guard10"},
			FigureIsDead	{Tag = "OrcCamp02Guard11"},
			FigureIsDead	{Tag = "OrcCamp02Guard12"},
			FigureIsDead	{Tag = "OrcCamp02Guard13"},
			FigureIsDead	{Tag = "OrcCamp02Guard14"},
			FigureIsDead	{Tag = "OrcCamp02Guard15"},
			FigureIsDead	{Tag = "OrcCamp02Guard16"},
			
			BuildingIsDead	{Tag = "OrcCamp02Tower01"},
			BuildingIsDead	{Tag = "OrcCamp02Tower02"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_DefeatedOrkCamp02"},
		},
	},
		OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "OrcCamp03Guard01"},
			FigureIsDead	{Tag = "OrcCamp03Guard02"},
			FigureIsDead	{Tag = "OrcCamp03Guard03"},
			FigureIsDead	{Tag = "OrcCamp03Guard04"},
			FigureIsDead	{Tag = "OrcCamp03Guard05"},
			FigureIsDead	{Tag = "OrcCamp03Guard06"},
			FigureIsDead	{Tag = "OrcCamp03Guard07"},  
			FigureIsDead	{Tag = "OrcCamp03Guard08"},
			FigureIsDead	{Tag = "OrcCamp03Guard09"},
			FigureIsDead	{Tag = "OrcCamp03Guard10"},
			FigureIsDead	{Tag = "OrcCamp03Guard11"},
			FigureIsDead	{Tag = "OrcCamp03Guard12"},
			FigureIsDead	{Tag = "OrcCamp03Guard13"},
			FigureIsDead	{Tag = "OrcCamp03Guard14"},
			FigureIsDead	{Tag = "OrcCamp03Guard15"},
			FigureIsDead	{Tag = "OrcCamp03Guard16"},
			FigureIsDead	{Tag = "OrcCamp03Guard17"},
			FigureIsDead	{Tag = "OrcCamp03Guard18"},
			
			BuildingIsDead	{Tag = "OrcCamp03Tower01"},
			BuildingIsDead	{Tag = "OrcCamp03Tower02"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_DefeatedOrkCamp03"},
		},
	},
	

	-- Schreinwächter
	OnOneTimeEvent
	{
		Conditions = 
		{
			
			FigureIsDead	{Tag = "DemonGuardian01"},
			FigureIsDead	{Tag = "DemonGuardian02"},
			FigureIsDead	{Tag = "DemonGuardian03"},
			FigureIsDead	{Tag = "DemonGuardian04"},
			FigureIsDead	{Tag = "DemonGuardian05"},
			
			FigureIsDead	{Tag = "DemonGuardian06"},
			FigureIsDead	{Tag = "DemonGuardian07"},
			FigureIsDead	{Tag = "DemonGuardian08"},
			FigureIsDead	{Tag = "DemonGuardian09"},
			FigureIsDead	{Tag = "DemonGuardian10"},
			
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_DefeatedDemons"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			
			FigureIsDead	{Tag = "Boss1"},
			
			FigureIsDead	{Tag = "Boss1Guard1"},
			FigureIsDead	{Tag = "Boss1Guard2"},
			FigureIsDead	{Tag = "Boss1Guard3"},
			FigureIsDead	{Tag = "Boss1Guard4"},
			FigureIsDead	{Tag = "Boss1Guard5"},
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_DefeatedBoss1"},
		},
	},
	
	
};
