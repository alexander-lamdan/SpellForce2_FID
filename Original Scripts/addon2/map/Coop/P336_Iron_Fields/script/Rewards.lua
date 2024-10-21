State
{
	StateName = "IronFieldsRewards",
	
	-- Rewards für Honormarks werden im Platform Script vergeben:
	-- af_P334_GotHonorMark1
	
	
	-- Boss Exp
	
	
	-- Camp Exp
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Clans01", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Clans01", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_ClansCamp01Wiped"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Clans02", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Clans02", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_ClansCamp02Wiped"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Beast", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Beast", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_BeastCampWiped"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Boss1"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_Boss01Killed"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "ClanAmbusher01"},
			FigureIsDead	{Tag = "ClanAmbusher02"},
			FigureIsDead	{Tag = "ClanAmbusher03"},
			FigureIsDead	{Tag = "ClanAmbusher04"},
			FigureIsDead	{Tag = "ClanAmbusher05"},
			
			FigureIsDead	{Tag = "ClanAmbusher06"},
			FigureIsDead	{Tag = "ClanAmbusher07"},
			FigureIsDead	{Tag = "ClanAmbusher08"},
			FigureIsDead	{Tag = "ClanAmbusher09"},
			FigureIsDead	{Tag = "ClanAmbusher10"},
			
			FigureIsDead	{Tag = "ClanAmbusher11"},
			FigureIsDead	{Tag = "ClanAmbusher12"},
			FigureIsDead	{Tag = "ClanAmbusher13"},
			FigureIsDead	{Tag = "ClanAmbusher14"},
			FigureIsDead	{Tag = "ClanAmbusher15"},
			                                    
			FigureIsDead	{Tag = "ClanAmbusher16"},
			FigureIsDead	{Tag = "ClanAmbusher17"},
			FigureIsDead	{Tag = "ClanAmbusher18"},
			FigureIsDead	{Tag = "ClanAmbusher19"},
			
			BuildingIsDead  {Tag = "ClanAmbusherTower01"},
			BuildingIsDead  {Tag = "ClanAmbusherTower02"},
			
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_AmbushersDead"},
		},
	},
};