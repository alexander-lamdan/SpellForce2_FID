
State
{
	StateName = "INIT",
	
	-- Demon Camps
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_NoMoreCult"},
			FigureIsDead	{Tag = "DemonCamp1"},
			BuildingIsDead	{Tag = "Portal01"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_DemonCamp1Defeated"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_NoMoreCult"},
			FigureIsDead	{Tag = "DemonCamp2"},
			BuildingIsDead	{Tag = "Portal2"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_DemonCamp2Defeated"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_NoMoreCult"},
			FigureIsDead	{Tag = "DemonCamp3"},
			BuildingIsDead	{Tag = "Portal3"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_DemonCamp3Defeated"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_NoMoreCult"},
			FigureIsDead	{Tag = "DemonCamp04Enemy01"},
			FigureIsDead	{Tag = "DemonCamp04Enemy02"},
			FigureIsDead	{Tag = "DemonCamp04Enemy03"},
			FigureIsDead	{Tag = "DemonCamp04Enemy04"},
			FigureIsDead	{Tag = "DemonCamp04Enemy05"},
			FigureIsDead	{Tag = "DemonCamp04Enemy06"},
			FigureIsDead	{Tag = "DemonCamp04Enemy07"},
			FigureIsDead	{Tag = "DemonCamp04Enemy08"},
			BuildingIsDead	{Tag = "Portal4"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_DemonCamp4Defeated"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_NoMoreCult"},
			FigureIsDead	{Tag = "DemonCamp5"},
			BuildingIsDead	{Tag = "Portal5"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_DemonCamp5Defeated"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_NoMoreCult"},
			FigureIsDead	{Tag = "SpiderCamp"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_SpidersDefeated"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "UndeadCamp"},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_UndeadCampDefeated"},
		},
	},
};