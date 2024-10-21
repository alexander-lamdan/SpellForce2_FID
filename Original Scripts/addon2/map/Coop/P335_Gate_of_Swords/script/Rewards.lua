State
{
	StateName = "RushwaterQuestRewards",
	
	-- Rewards für Honormarks und Camp Zerstörung werden im Platform Script vergeben:
	-- af_P335_UndeadCampWiped
	-- af_P335_PactCampWiped
	-- af_P335_GotHonorMark
	
	
	-- Rewards für Bosse
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Boss01"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_Boss01Killed"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Boss02"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_Boss02Killed"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Boss03"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_Boss03Killed"},
		},
	},
	
	-- Rewards für RTS Camps
	
	OnOneTimeEvent
	{
		EventName = "UndeadPlayer1Wiped",
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Undead", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Undead", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_UndeadWiped"},
		},
	},
	
	OnOneTimeEvent
	{
		EventName = "UndeadPlayer1Wiped",
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Pact", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Pact", Amount = 1},},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_PactWiped"},
		},
	},
			
	
	-- Rewards für Mini Camps
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "MiniCamp01Enemy01"},
			FigureIsDead {Tag = "MiniCamp01Enemy02"},	
			FigureIsDead {Tag = "MiniCamp01Enemy03"},
			FigureIsDead {Tag = "MiniCamp01Enemy04"},
			FigureIsDead {Tag = "MiniCamp01Enemy05"},
			
			FigureIsDead {Tag = "MiniCamp01Enemy06"},
			FigureIsDead {Tag = "MiniCamp01Enemy07"},
			FigureIsDead {Tag = "MiniCamp01Enemy08"},
			FigureIsDead {Tag = "MiniCamp01Enemy09"},
			FigureIsDead {Tag = "MiniCamp01Enemy10"},
			
			FigureIsDead {Tag = "MiniCamp01Enemy11"},
			FigureIsDead {Tag = "MiniCamp01Enemy12"},
			FigureIsDead {Tag = "MiniCamp01Enemy13"},
			FigureIsDead {Tag = "MiniCamp01Enemy14"},
			FigureIsDead {Tag = "MiniCamp01Enemy15"},
			FigureIsDead {Tag = "MiniCamp01Enemy16"},
			FigureIsDead {Tag = "MiniCamp01Enemy17"},
			
			
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_MiniCamp01Defeated"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "MiniCamp02Enemy01"},
			FigureIsDead {Tag = "MiniCamp02Enemy02"},
			FigureIsDead {Tag = "MiniCamp02Enemy03"},
			FigureIsDead {Tag = "MiniCamp02Enemy04"},
			FigureIsDead {Tag = "MiniCamp02Enemy05"},
			
			FigureIsDead {Tag = "MiniCamp02Enemy06"},
			FigureIsDead {Tag = "MiniCamp02Enemy07"},
			FigureIsDead {Tag = "MiniCamp02Enemy08"},
			FigureIsDead {Tag = "MiniCamp02Enemy09"},
			FigureIsDead {Tag = "MiniCamp02Enemy10"},
			
			FigureIsDead {Tag = "MiniCamp02Enemy11"},
			FigureIsDead {Tag = "MiniCamp02Enemy12"},
			FigureIsDead {Tag = "MiniCamp02Enemy13"},
			FigureIsDead {Tag = "MiniCamp02Enemy14"},
			FigureIsDead {Tag = "MiniCamp02Enemy15"},
			
			FigureIsDead {Tag = "MiniCamp02Enemy16"},
			FigureIsDead {Tag = "MiniCamp02Enemy17"},
			FigureIsDead {Tag = "MiniCamp02Enemy18"},
			FigureIsDead {Tag = "MiniCamp02Enemy19"},
			FigureIsDead {Tag = "MiniCamp02Enemy20"},
			
			FigureIsDead {Tag = "PatrolBarb"},
			
			BuildingIsDead {Tag = "MiniCamp02Tower01"},
			BuildingIsDead {Tag = "MiniCamp02Tower02"},
			
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_MiniCamp02Defeated"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "MiniCamp03Enemy01"},
			FigureIsDead {Tag = "MiniCamp03Enemy02"},
			FigureIsDead {Tag = "MiniCamp03Enemy03"},
			FigureIsDead {Tag = "MiniCamp03Enemy04"},
			FigureIsDead {Tag = "MiniCamp03Enemy05"},
			                              
			FigureIsDead {Tag = "MiniCamp03Enemy06"},
			FigureIsDead {Tag = "MiniCamp03Enemy07"},
			FigureIsDead {Tag = "MiniCamp03Enemy08"},
			FigureIsDead {Tag = "MiniCamp03Enemy09"},
			
			BuildingIsDead {Tag = "MiniCamp03Nest01"},
			BuildingIsDead {Tag = "MiniCamp03Nest02"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_MiniCamp03Defeated"},
		},
	},
};