
for i = 1, 3 do
	local sPlayerName = "pl_Human" .. i
	-- ********************************************************************
	-- Cutscene vorbei - Quest gelöst
	-- ********************************************************************
	OnOneTimeEvent
	{
		EventName = "Player"..i.."GolemsDead",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopProtectMerchants"},
			MapFlagIsTrue {Name = "mf_CS_01_Vanish"},
		},
		Actions = 
		{
			QuestSetSolved	{Player = sPlayerName, Quest = "CoopProtectMerchants"},
			QuestSetActive	{Player = sPlayerName, Quest = "CoopProtectMerchantsSolved"},
		},
	}
end



State
{
	
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
				MapFlagIsFalse { Name ="mf_InitDone" },
		},
		Actions =
		{
			MapFlagSetTrue { Name = "mf_InitDone"},
			MapFlagSetTrue { Name = "mf_DisableAI"},	
		},
	},
		
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				QuestIsActive {Quest = "CoopProtectMerchants", Player = "pl_Human1"},
				QuestIsActive {Quest = "CoopProtectMerchants", Player = "pl_Human2"},
				QuestIsActive {Quest = "CoopProtectMerchants", Player = "pl_Human3"},
			},
		},
		Actions =
		{
			VisualTimerStart	{Seconds = 600},
			MapTimerStart    	{Name= "mt_DemonTimer"},
			MapFlagSetFalse { Name = "mf_DisableAI"},	
		},
	},
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				MapTimerIsElapsed {Name = "mt_DemonTimer", Seconds = 460},
				MapFlagIsTrue {Name ="mf_DisableAI"},
			},
		},
		Actions =
		{
			AIAttackFrequencySet	{Player = "pl_Demon01", Minutes = 1},
			AIAttackFrequencySet	{Player = "pl_Demon02", Minutes = 1},
			AIAttackFrequencySet	{Player = "pl_Demon03", Minutes = 1},
			AIAttackFrequencySet	{Player = "pl_Demon04", Minutes = 1},
			AIAttackFrequencySet	{Player = "pl_Demon05", Minutes = 1},
			AIAttackFrequencySet	{Player = "pl_Demon06", Minutes = 1},
			
			AIUnitTimerSet	{Player = "pl_Demon01", Value = 999},
			AIUnitTimerSet	{Player = "pl_Demon02", Value = 999},
			AIUnitTimerSet	{Player = "pl_Demon03", Value = 999},
			AIUnitTimerSet	{Player = "pl_Demon04", Value = 999},
			AIUnitTimerSet	{Player = "pl_Demon05", Value = 999},
			AIUnitTimerSet	{Player = "pl_Demon06", Value = 999},
			
			AITroupSizeSet	{Player = "pl_Demon01", Size = 999},
			AITroupSizeSet	{Player = "pl_Demon02", Size = 999},
			AITroupSizeSet	{Player = "pl_Demon03", Size = 999},
			AITroupSizeSet	{Player = "pl_Demon04", Size = 999},
			AITroupSizeSet	{Player = "pl_Demon05", Size = 999},
			AITroupSizeSet	{Player = "pl_Demon06", Size = 999},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_DemonTimer", Seconds = 600},

	
			PlayerHasNotFigureAmount	{Player = "pl_Demon01", Amount = 1},
			PlayerHasNotFigureAmount	{Player = "pl_Demon02", Amount = 1},
			PlayerHasNotFigureAmount	{Player = "pl_Demon03", Amount = 1},
			PlayerHasNotFigureAmount	{Player = "pl_Demon04", Amount = 1},
			PlayerHasNotFigureAmount	{Player = "pl_Demon05", Amount = 1},
			
		--	OR
		--	{
		--		QuestIsActive {Quest = "CoopProtectMerchants", Player = "pl_Human1"},
		--		QuestIsActive {Quest = "CoopProtectMerchants", Player = "pl_Human2"},
		--		QuestIsActive {Quest = "CoopProtectMerchants", Player = "pl_Human3"},
		--	},
			
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_DemonsDefeated"},
			
			
			FigureHealthSet {Tag = "FreeTrader01", Percent = 10},
			FigureHealthSet {Tag = "FreeTrader02", Percent = 10},
			FigureHealthSet {Tag = "FreeTrader03", Percent = 10},
			FigureHealthSet {Tag = "FreeTrader04", Percent = 10},
			FigureHealthSet {Tag = "FreeTrader05", Percent = 10},
			
			FigureHealthSet {Tag = "FreeTrader06", Percent = 10},
			FigureHealthSet {Tag = "FreeTrader07", Percent = 10},
			FigureHealthSet {Tag = "FreeTrader08", Percent = 10},
			FigureHealthSet {Tag = "FreeTrader09", Percent = 10},
			FigureHealthSet {Tag = "FreeTrader10", Percent = 10},
			
			FigureHealthSet {Tag = "FreeTrader11", Percent = 10},
			FigureHealthSet {Tag = "FreeTrader12", Percent = 10},
			FigureHealthSet {Tag = "FreeTrader13", Percent = 10},
			FigureHealthSet {Tag = "FreeTrader14", Percent = 10},
			FigureHealthSet {Tag = "FreeTrader15", Percent = 10},
			
			FigureHealthSet {Tag = "FreeTrader16", Percent = 10},
			FigureHealthSet {Tag = "FreeTrader17", Percent = 10},
			FigureHealthSet {Tag = "FreeTrader18", Percent = 10},
			FigureHealthSet {Tag = "FreeTrader19", Percent = 10},
			FigureHealthSet {Tag = "FreeTrader20", Percent = 10},
			
		},
		
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			
			MapFlagIsTrue	{Name = "mf_DemonsDefeated"},
			                 
			FigureIsDead	{Tag = "DemonBoss"},
			
			FigureIsDead	{Tag = "Golem01"},
			FigureIsDead	{Tag = "Golem02"},
			FigureIsDead	{Tag = "Golem03"},
			FigureIsDead	{Tag = "Golem04"},
			FigureIsDead	{Tag = "Golem05"},
			FigureIsDead	{Tag = "Golem06"},
			FigureIsDead	{Tag = "Golem07"},
			FigureIsDead	{Tag = "Golem08"},
			FigureIsDead	{Tag = "Golem09"},
			FigureIsDead	{Tag = "Golem10"},
			
			FigureIsDead {Tag = "FreeTrader01"},
			FigureIsDead {Tag = "FreeTrader02"},
			FigureIsDead {Tag = "FreeTrader03"},
			FigureIsDead {Tag = "FreeTrader04"},
			FigureIsDead {Tag = "FreeTrader05"},
			                               
			FigureIsDead {Tag = "FreeTrader06"},
			FigureIsDead {Tag = "FreeTrader07"},
			FigureIsDead {Tag = "FreeTrader08"},
			FigureIsDead {Tag = "FreeTrader09"},
			FigureIsDead {Tag = "FreeTrader10"},
			                               
			FigureIsDead {Tag = "FreeTrader11"},
			FigureIsDead {Tag = "FreeTrader12"},
			FigureIsDead {Tag = "FreeTrader13"},
			FigureIsDead {Tag = "FreeTrader14"},
			FigureIsDead {Tag = "FreeTrader15"},
			                               
			FigureIsDead {Tag = "FreeTrader16"},
			FigureIsDead {Tag = "FreeTrader17"},
			FigureIsDead {Tag = "FreeTrader18"},
			FigureIsDead {Tag = "FreeTrader19"},
			FigureIsDead {Tag = "FreeTrader20"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_StartCutscene"},
		},
		
	};

};

