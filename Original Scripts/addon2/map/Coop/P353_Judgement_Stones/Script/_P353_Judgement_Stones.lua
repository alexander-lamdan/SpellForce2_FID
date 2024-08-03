State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions = 	
		{
			QuestIsActive		{Player = "pl_Human1", Quest = "CoopConjureNiethalfSolved"},
		},
		Actions =
		{
			QuestSetInactive	{Player = "pl_Human1", Quest = "CoopConjureNiethalfSolved"},
			QuestSetActiveAgain {Player = "pl_Human1", Quest = "CoopConjureNiethalf"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 	
		{
			QuestIsActive		{Player = "pl_Human2", Quest = "CoopConjureNiethalfSolved"},
		},
		Actions =
		{
			QuestSetInactive	{Player = "pl_Human2", Quest = "CoopConjureNiethalfSolved"},
			QuestSetActiveAgain {Player = "pl_Human2", Quest = "CoopConjureNiethalf"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 	
		{
			QuestIsActive		{Player = "pl_Human3", Quest = "CoopConjureNiethalfSolved"},
		},
		Actions =
		{
			QuestSetInactive	{Player = "pl_Human3", Quest = "CoopConjureNiethalfSolved"},
			QuestSetActiveAgain {Player = "pl_Human3", Quest = "CoopConjureNiethalf"},
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
 		--	QuestSetActive	{Player = "pl_Human1", Quest = "CoopMainQuests"},
		--	QuestSetActive	{Player = "pl_Human1", Quest = "CoopBaseChapter_4"},
		--	QuestSetActive	{Player = "pl_Human1", Quest = "CoopConjureNiethalf"},
		},
		GotoState = "MAIN",
	},


};
for i = 1, 3 do
	local sPlayerName = "pl_Human" .. i
	
	OnOneTimeEvent
	{
		EventName = "Player"..i.."NiethalfSummoned",
		Conditions = 
		{
			QuestIsActive		{Player = sPlayerName, Quest = "CoopConjureNiethalf"},
			MapFlagIsTrue		{Name = "mf_NiethalfSummoned"},
					
		},
		Actions = 
		{
			QuestSetSolved	{Player = sPlayerName, Quest = "CoopConjureNiethalf"},
			QuestSetActive	{Player = sPlayerName, Quest = "CoopConjureNiethalfSolved"},
		},
	}
	OnOneTimeEvent
	{
		EventName = "Player"..i.."ZerboDefeated",
			Conditions = 
		{
			QuestIsActive		{Player = sPlayerName, Quest = "CoopConjureNiethalfSolved"},
			MapFlagIsTrue		{Name = "mf_ZerboDead"},
		},
		Actions = 
		{
			AvatarFlagSetTrue		{Player = sPlayerName, Name = "af_P353_ZerboDead"},
			
			-- wird erst im Jandrim Dialog gesolved und aktiviert!!!
			-- QuestSetSolved	{Player = sPlayerName, Quest = "CoopConjureNiethalfSolved"},
			-- QuestSetActive	{Player = sPlayerName, Quest = "CoopTalkToHalicosAgain"},
		},
	}
end

State
{
	StateName = "MAIN",
	OnOneTimeEvent
	{
		Conditions = 
		{
		   	QuestIsNotActive {Quest = "CoopConjureNiethalf", Player = "pl_Human1"},
	  		QuestIsNotActive {Quest = "CoopConjureNiethalf", Player = "pl_Human2"},
	  		QuestIsNotActive {Quest = "CoopConjureNiethalf", Player = "pl_Human3"},
	  		MapFlagIsFalse	 {Name  = "mf_NiethalfSummoned"},
	  },
		Actions = 
		{
			FigureVanish	{Tag  = "Zerbo"},
			MapFlagSetTrue	{Name = "mf_QuestNotActive"},
		},
	},
};


