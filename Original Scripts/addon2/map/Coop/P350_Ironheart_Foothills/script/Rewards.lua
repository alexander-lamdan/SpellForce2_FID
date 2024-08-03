State
{
	StateName = "INIT",

	-- 
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_FoundEvilPriest1"},
			FigureIsDead  {Tag  = "EvilPriest1"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_KilledEvilPriest1" },
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_FoundEvilPriest2"},
			FigureIsDead  {Tag  = "EvilPriest2"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_KilledEvilPriest2" },
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_FoundEvilPriest3"},
			FigureIsDead  {Tag  = "EvilPriest3"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_KilledEvilPriest3" },
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopHolyShrines"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopHolyShrines"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopHolyShrines"},
			FigureIsDead	{Tag = "BanditCamp01Bandit01"},
			FigureIsDead	{Tag = "BanditCamp01Bandit02"},
			FigureIsDead	{Tag = "BanditCamp01Bandit03"},
			FigureIsDead	{Tag = "BanditCamp01Bandit04"},
			FigureIsDead	{Tag = "BanditCamp01Bandit05"},
			FigureIsDead	{Tag = "BanditCamp01Bandit06"},
			FigureIsDead	{Tag = "BanditCamp01Bandit07"},  
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_DefeatedBandits"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopHolyShrines"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopHolyShrines"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopHolyShrines"},
			FigureIsDead	{Tag = "CultCampGuard01"},
			FigureIsDead	{Tag = "CultCampGuard02"},
			FigureIsDead	{Tag = "CultCampGuard03"},
			FigureIsDead	{Tag = "CultCampGuard04"},
			FigureIsDead	{Tag = "CultCampGuard05"},
			FigureIsDead	{Tag = "CultCampGuard06"},
			FigureIsDead	{Tag = "CultCampGuard07"},  
			FigureIsDead	{Tag = "CultCampGuard08"},
			FigureIsDead	{Tag = "CultCampGuard09"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_DefeatedCultCamp"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "CultistGroup01Cultist01"},
			FigureIsDead	{Tag = "CultistGroup01Cultist02"},
			FigureIsDead	{Tag = "CultistGroup01Cultist03"},
			FigureIsDead	{Tag = "CultistGroup01Cultist04"},
			FigureIsDead	{Tag = "CultistGroup01Cultist05"},
			FigureIsDead	{Tag = "CultistGroup01Cultist06"},
			FigureIsDead	{Tag = "CultistGroup01Cultist07"},  
			FigureIsDead	{Tag = "CultistGroup01Cultist08"},
			FigureIsDead	{Tag = "CultistGroup01Cultist09"},
			FigureIsDead	{Tag = "CultistGroup01Cultist10"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_DefeatedCultGroup"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopHolyShrines"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopHolyShrines"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopHolyShrines"},
			FigureIsDead	{Tag = "RuneGuardian01"},
			FigureIsDead	{Tag = "RuneGuardian02"},
			FigureIsDead	{Tag = "RuneGuardian03"},
			FigureIsDead	{Tag = "RuneGuardian04"},
			FigureIsDead	{Tag = "RuneGuardian05"},
			FigureIsDead	{Tag = "RuneGuardian06"},
			FigureIsDead	{Tag = "RuneGuardian07"},  
			FigureIsDead	{Tag = "RuneGuardian08"},
			FigureIsDead	{Tag = "RuneGuardian09"},
			FigureIsDead	{Tag = "RuneGuardian10"},
			FigureIsDead	{Tag = "RuneGuardian11"},
			FigureIsDead	{Tag = "RuneGuardian12"},
			FigureIsDead	{Tag = "RuneGuardian13"},
			FigureIsDead	{Tag = "RuneGuardian14"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_DefeatedRuneGuardians"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopHolyShrines"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopHolyShrines"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopHolyShrines"},
			FigureIsDead	{Tag = "ShrineGuardian01"},
			FigureIsDead	{Tag = "ShrineGuardian02"},
			FigureIsDead	{Tag = "ShrineGuardian03"},
			FigureIsDead	{Tag = "ShrineGuardian04"},
			FigureIsDead	{Tag = "ShrineGuardian05"},
			FigureIsDead	{Tag = "ShrineGuardian06"},
			FigureIsDead	{Tag = "ShrineGuardian07"},  
			FigureIsDead	{Tag = "ShrineGuardian08"},
			FigureIsDead	{Tag = "ShrineGuardian09"},
			FigureIsDead	{Tag = "ShrineGuardian10"},
			FigureIsDead	{Tag = "ShrineGuardian11"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_DefeatedShrineGuardians"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "SpiderQueen"},
			FigureIsDead	{Tag = "Spider01"},
			FigureIsDead	{Tag = "Spider02"},
			FigureIsDead	{Tag = "Spider03"},
			FigureIsDead	{Tag = "Spider04"},
			FigureIsDead	{Tag = "Spider05"},
			FigureIsDead	{Tag = "Spider06"},
			FigureIsDead	{Tag = "Spider07"},  
			FigureIsDead	{Tag = "Spider08"},
			FigureIsDead	{Tag = "Spider09"},
			FigureIsDead	{Tag = "Spider10"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_DefeatedSpiders"},
		},
	},	
};