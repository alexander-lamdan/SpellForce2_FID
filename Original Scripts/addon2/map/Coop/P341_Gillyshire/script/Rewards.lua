State
{
	StateName = "INIT",
	
	-- 
	
	OnOneTimeEvent
	{
		EventName = "UndeadPlayer1Wiped",
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Realm", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Realm", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_RealmDefeated"},
		},
	},

		OnOneTimeEvent
	{
		Conditions =
		{
			
			
			FigureIsDead {Tag = "BlockadeWarrior01"},
			FigureIsDead {Tag = "BlockadeWarrior02"},
			FigureIsDead {Tag = "BlockadeWarrior03"},
			FigureIsDead {Tag = "BlockadeWarrior04"},
			FigureIsDead {Tag = "BlockadeWarrior05"},
			                     
			FigureIsDead {Tag = "BlockadeWarrior06"},
			FigureIsDead {Tag = "BlockadeWarrior07"},
			FigureIsDead {Tag = "BlockadeWarrior08"},
			FigureIsDead {Tag = "BlockadeWarrior09"},
			FigureIsDead {Tag = "BlockadeWarrior10"},
			
			FigureIsDead {Tag = "BlockadeWarrior11"},
			FigureIsDead {Tag = "BlockadeWarrior12"},
			FigureIsDead {Tag = "BlockadeWarrior13"},
			FigureIsDead {Tag = "BlockadeWarrior14"},
			FigureIsDead {Tag = "BlockadeWarrior15"},
			                                    
			FigureIsDead {Tag = "BlockadeWarrior16"},
			FigureIsDead {Tag = "BlockadeWarrior17"},
			FigureIsDead {Tag = "BlockadeWarrior18"},
			FigureIsDead {Tag = "BlockadeWarrior19"},
			FigureIsDead {Tag = "BlockadeWarrior20"},

			FigureIsDead {Tag = "BlockadeWarrior21"},
			FigureIsDead {Tag = "BlockadeWarrior22"},
			FigureIsDead {Tag = "BlockadeWarrior23"},
			FigureIsDead {Tag = "BlockadeWarrior24"},
			FigureIsDead {Tag = "BlockadeWarrior25"},
			                                    
			FigureIsDead {Tag = "BlockadeWarrior26"},
			FigureIsDead {Tag = "BlockadeWarrior27"},
			FigureIsDead {Tag = "BlockadeWarrior28"},
			FigureIsDead {Tag = "BlockadeWarrior29"},
			
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_BlockadeDefeated"},	
		},
	}, 
};

