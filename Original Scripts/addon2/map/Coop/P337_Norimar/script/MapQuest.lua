State
{
	StateName = "INIT",
	

	-- Quest startet wenn Falkenhorst gerettet
	OnOneTimeEvent
	{
		GotoState = "Quest",
		Conditions = 
		{
			MapFlagIsTrue		{Name   = "mf_BeastWiped"},
			QuestIsNotSolved 	{Player = "pl_Human1", Quest = "CoopMapQuestNorimar"},
			QuestIsNotSolved 	{Player = "pl_Human2", Quest = "CoopMapQuestNorimar"},
			QuestIsNotSolved 	{Player = "pl_Human3", Quest = "CoopMapQuestNorimar"},
		},
		Actions =
		{
			QuestSetActive 	{Player = "pl_Human1", Quest = "CoopMapQuestNorimar"},
			QuestSetActive 	{Player = "pl_Human2", Quest = "CoopMapQuestNorimar"},
			QuestSetActive 	{Player = "pl_Human3", Quest = "CoopMapQuestNorimar"},
		},
	},
	
};

State 
{	
	StateName = "Quest",
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead   {Tag = "BeastChief1"},
			FigureIsDead   {Tag = "BeastChief2"},
			FigureIsDead   {Tag = "BeastChief3"},
			FigureIsDead   {Tag = "BeastChief4"},
			FigureIsDead   {Tag = "BeastChief5"},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Ortbrandt", TextTag = "Ortbrandt04"},
			FigureOutcry	{Tag = "Ortbrandt", TextTag = "Ortbrandt05"},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 500, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 500, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 500, Amount = 1},
			MapFlagSetTrue	{Name   = "mf_SubquestDone"},
			QuestSetSolved 	{Player = "pl_Human1", Quest = "CoopMapQuestNorimar"},
			QuestSetSolved 	{Player = "pl_Human2", Quest = "CoopMapQuestNorimar"},
			QuestSetSolved 	{Player = "pl_Human3", Quest = "CoopMapQuestNorimar"},
		},
	},
	
};
