State
{
	StateName = "INIT",

	-- FreedAya wird im Plattformscript gesetzt	
	
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
			FigureIsDead	{Tag = "CultCamp01Cultist01"},
			FigureIsDead	{Tag = "CultCamp01Cultist02"},
			FigureIsDead	{Tag = "CultCamp01Cultist03"},
			FigureIsDead	{Tag = "CultCamp01Cultist04"},
			FigureIsDead	{Tag = "CultCamp01Cultist05"},
			FigureIsDead	{Tag = "CultCamp01Cultist06"},
			FigureIsDead	{Tag = "CultCamp01Cultist07"},  
			FigureIsDead	{Tag = "CultCamp01Cultist08"},
			FigureIsDead	{Tag = "CultCamp01Cultist09"},
			FigureIsDead	{Tag = "CultCamp01Cultist10"},
			FigureIsDead	{Tag = "CultCamp01Cultist11"},
			FigureIsDead	{Tag = "CultCamp01Cultist12"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_DefeatedCultGroup1"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopMapQuestUnderHall"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopMapQuestUnderHall"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopMapQuestUnderHall"},
			FigureIsDead	{Tag = "CultCamp02Cultist01"},
			FigureIsDead	{Tag = "CultCamp02Cultist02"},
			FigureIsDead	{Tag = "CultCamp02Cultist03"},
			FigureIsDead	{Tag = "CultCamp02Cultist04"},
			FigureIsDead	{Tag = "CultCamp02Cultist05"},
			FigureIsDead	{Tag = "CultCamp02Cultist06"},
			FigureIsDead	{Tag = "CultCamp02Cultist07"},  
			FigureIsDead	{Tag = "CultCamp02Cultist08"},
			FigureIsDead	{Tag = "CultCamp02Cultist09"},
			FigureIsDead	{Tag = "CultCamp02Cultist10"},
			FigureIsDead	{Tag = "CultCamp02Cultist11"},
			FigureIsDead	{Tag = "CultCamp02Cultist12"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_DefeatedCultGroup2"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopMapQuestUnderHall"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopMapQuestUnderHall"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopMapQuestUnderHall"},
			FigureIsDead	{Tag = "CultCamp03Cultist01"},
			FigureIsDead	{Tag = "CultCamp03Cultist02"},
			FigureIsDead	{Tag = "CultCamp03Cultist03"},
			FigureIsDead	{Tag = "CultCamp03Cultist04"},
			FigureIsDead	{Tag = "CultCamp03Cultist05"},
			FigureIsDead	{Tag = "CultCamp03Cultist06"},
			FigureIsDead	{Tag = "CultCamp03Cultist07"},  
			FigureIsDead	{Tag = "CultCamp03Cultist08"},
			FigureIsDead	{Tag = "CultCamp03Cultist09"},
			FigureIsDead	{Tag = "CultCamp03Cultist10"},
			FigureIsDead	{Tag = "CultCamp03Cultist11"},
			FigureIsDead	{Tag = "CultCamp03Cultist12"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_DefeatedCultGroup3"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopMapQuestUnderHall"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopMapQuestUnderHall"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopMapQuestUnderHall"},
			FigureIsDead	{Tag = "CultCamp04Cultist01"},
			FigureIsDead	{Tag = "CultCamp04Cultist02"},
			FigureIsDead	{Tag = "CultCamp04Cultist03"},
			FigureIsDead	{Tag = "CultCamp04Cultist04"},
			FigureIsDead	{Tag = "CultCamp04Cultist05"},
			FigureIsDead	{Tag = "CultCamp04Cultist06"},
			FigureIsDead	{Tag = "CultCamp04Cultist07"},  
			FigureIsDead	{Tag = "CultCamp04Cultist08"},
			FigureIsDead	{Tag = "CultCamp04Cultist09"},
			FigureIsDead	{Tag = "CultCamp04Cultist10"},
			FigureIsDead	{Tag = "CultCamp04Cultist11"},
			FigureIsDead	{Tag = "CultCamp04Cultist12"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_DefeatedCultGroup4"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "CultCamp05Cultist01"},
			FigureIsDead	{Tag = "CultCamp05Cultist02"},
			FigureIsDead	{Tag = "CultCamp05Cultist03"},
			FigureIsDead	{Tag = "CultCamp05Cultist04"},
			FigureIsDead	{Tag = "CultCamp05Cultist05"},
			FigureIsDead	{Tag = "CultCamp05Cultist06"},
			FigureIsDead	{Tag = "CultCamp05Cultist07"},  
			FigureIsDead	{Tag = "CultCamp05Cultist08"},
			FigureIsDead	{Tag = "CultCamp05Cultist09"},
			FigureIsDead	{Tag = "CultCamp05Cultist10"},
			FigureIsDead	{Tag = "CultCamp05Cultist11"},
			FigureIsDead	{Tag = "CultCamp05Cultist12"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_DefeatedCultGroup5"},
		},
	},	
};
