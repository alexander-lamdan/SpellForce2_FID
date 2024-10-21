State
{
	StateName = "INIT",
	
	-- Avatarflags für Kitaki werden im Plattformscript gesetzt
	
	-- Ork Camps
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotFigureAmount	{Player = "pl_SeekerGuards01", Amount = 1},
			PlayerHasNotBuildingAmount	{Player = "pl_SeekerGuards01", OnlyCompleted = "default", Amount = 1},	
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
			PlayerHasNotFigureAmount	{Player = "pl_SeekerGuards02", Amount = 1},
			PlayerHasNotBuildingAmount	{Player = "pl_SeekerGuards02", OnlyCompleted = "default", Amount = 1},	
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
			PlayerHasNotFigureAmount	{Player = "pl_SeekerGuards03", Amount = 1},
			PlayerHasNotBuildingAmount	{Player = "pl_SeekerGuards03", OnlyCompleted = "default", Amount = 1},	
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_DefeatedOrkCamp03"},
		},
	},
	
	-- Undead AI
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerHasNotBuildingAmount	{Player = "pl_Clans", Amount = 1, OnlyCompleted = default},
			PlayerHasNotFigureAmount	{Player = "pl_Clans", Amount = 1},
		},
		Actions = 
		{
			MapFlagSetTrue			{Name = "mf_DefeatedClanAI"},
		},
	},
	
	-- Runenwächter
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Boss"},
			
			FigureIsDead	{Tag = "BossGuard01"},
			FigureIsDead	{Tag = "BossGuard02"},
			FigureIsDead	{Tag = "BossGuard03"},
			FigureIsDead	{Tag = "BossGuard04"},
			FigureIsDead	{Tag = "BossGuard05"},
			
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_KilledBoss"},
		},
	},
	
	
};
