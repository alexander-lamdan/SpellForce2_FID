State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
		},
		GotoState = "Follow",
	},
};

State
{
	StateName = "Follow",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
	  		OR
	  		{
	  			MapFlagIsTrue {Name = "mf_ActorsSpawn"},
	  			QuestIsActive {Quest = "CoopConjureNiethalf", Player = "pl_Human1"},
	  			QuestIsActive {Quest = "CoopConjureNiethalf", Player = "pl_Human2"},
	 			QuestIsActive {Quest = "CoopConjureNiethalf", Player = "pl_Human3"},
	  		},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_JandrimOutcry"},
		},
		DelayedActions = 
		{
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed 	{Name = "mt_JandrimOutcry", Seconds = 1},
		}, 
		Actions = 
		{		
			FigureOutcry	{Tag = "Jandrim", TextTag = "Jandrim01"},
			MapTimerStop	{Name = "mt_JandrimOutcry"},
		},
	},
	
	
	
	OnFollowEvent
	{
		Tag = "Jandrim",
		TargetTag = "pl_Human1Avatar",
		OnConditions = 
		{
			FigureIsNotInCombat	{Tag = "pl_Human1Avatar"},
			QuestIsActive		{Player = "pl_Human1", Quest = "CoopConjureNiethalf"},
			MapFlagIsFalse 		{Name = "mf_P353_First_Cutscene_Running"},

		},
		Actions = 
		{
		},
	},
		OnFollowEvent
	{
		Tag = "Jandrim",
		TargetTag = "pl_Human2Avatar",
		OnConditions = 
		{
			FigureIsNotInCombat	{Tag = "pl_Human2Avatar"},
			QuestIsNotActive	{Player = "pl_Human1", Quest = "CoopConjureNiethalf"},
			QuestIsActive		{Player = "pl_Human2", Quest = "CoopConjureNiethalf"},
			MapFlagIsFalse 		{Name = "mf_P353_First_Cutscene_Running"},
		},
		Actions = 
		{
		},
	},
	OnFollowEvent
	{     
		Tag = "Jandrim",
		TargetTag = "pl_Human3Avatar",
		OnConditions = 
		{     
			FigureIsNotInCombat	{Tag = "pl_Human3Avatar"},
			QuestIsNotActive	{Player = "pl_Human1", Quest = "CoopConjureNiethalf"},
			QuestIsNotActive	{Player = "pl_Human2", Quest = "CoopConjureNiethalf"},
			QuestIsActive		{Player = "pl_Human3", Quest = "CoopConjureNiethalf"},
			MapFlagIsFalse 		{Name = "mf_P353_First_Cutscene_Running"},
		},     
		Actions = 
		{     
		},     
	},
	
	OnOneTimeEvent
	{
		GotoState = "Summoning",
		Conditions =
		{
			OR
			{
				FigureIsInRange	{Tag = "Jandrim", X = 437, Y = 429, Range = 9},
				FigureIsInRange	{Tag = "Jandrim", X = 285, Y = 283, Range = 9},
			},
		},
		Actions = 
		{
			FigureOutcry	{Tag = Jandrim, TextTag = "Jandrim02"},
		},
	},
	
};

State
{
	StateName = "Summoning",
	
	OnIdleRunHomeFake
	{
		X = 351 ,
		Y = 348,
		Range = 0.5,
		UpdateInterval = 0,
		Conditions = 
		{
		},
		Actions = 
		{
		},
		HomeActions = 
		{
		},
		OneTimeHomeActions = 
		{
			MapFlagSetTrue 		 {Name = "mf_StartRitual"},
			MapTimerStart  	     {Name = "mt_RitualTimer"},
			FigureOutcry		 {Tag = "Jandrim", TextTag = "Jandrim03"},
			FigureOutcry		 {Tag = "Jandrim", TextTag = "Jandrim04"},
			FigureOutcry		 {Tag = "Jandrim", TextTag = "Jandrim05"},
			FigureHoldPosition   {},
			VisualTimerStart	 {Seconds = 120},
		},
	};
	

	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed   {Name = "mt_RitualTimer", Seconds = 0.1},
		},
		Actions = 
		{
			FigureUnitChange	{Tag = "Jandrim", UnitId = 772, Level = 20},
			MapFlagSetTrue 		 {Name = "mf_JandrimKneelDown"},
		},
	},
			
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed   {Name = "mt_RitualTimer", Seconds = 25},
		},
		Actions = 
		{
			FigureOutcry        {Tag = "Jandrim", TextTag = "Jandrim06"}
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed   {Name = "mt_RitualTimer", Seconds = 45},
		},
		Actions = 
		{
			FigureOutcry        {Tag = "Jandrim", TextTag = "Jandrim07"}
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed   {Name = "mt_RitualTimer", Seconds = 60},
		},
		Actions = 
		{
			FigureOutcry        {Tag = "Ghost01", TextTag = "Priest01"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed   {Name = "mt_RitualTimer", Seconds = 75},
		},
		Actions = 
		{
			FigureOutcry        {Tag = "Ghost03", TextTag = "Priest02"},
		},
	},		
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed   {Name = "mt_RitualTimer", Seconds = 90},
		},
		Actions = 
		{
			FigureOutcry        {Tag = "Ghost05", TextTag = "Priest03"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed   {Name = "mt_RitualTimer", Seconds = 110},
		},
		Actions = 
		{
			FigureOutcry        {Tag = "Ghost07", TextTag = "Priest04"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed   {Name = "mt_RitualTimer", Seconds = 120},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_Cutscene01"},
			MapFlagSetTrue {Name = "mf_JandrimKneelUp"},
		},
	},	
				
	
	
	
	
	
	-- Kneel Script von Markus geklaut
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_JandrimKneelDown"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "Jandrim", File = "base/gfx/figures/npc/figure_npc_dwarf_emote_kneel_down.ska"}, -- 2.17s
			FigureLookAtDirection	{Tag = "Jandrim", Direction = 125},
			EntityTimerStart {Name = "et_timer001"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_timer001", Seconds = 2.17},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_JandrimKneelHold"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityFlagIsTrue {Name = "ef_JandrimKneelHold"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "Jandrim", File = "base/gfx/figures/npc/figure_npc_dwarf_emote_kneel_hold.ska"}, -- 3.29s
			EntityTimerStart {Name = "et_kneel_hold"},
		},
	},
	OnEvent
	{
		EventName = KneelHold2,
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_kneel_hold", Seconds = 3},
		},
		Actions = 
		{
			FigureAnimPlayOnce	{Tag = "Jandrim", File = "base/gfx/figures/npc/figure_npc_dwarf_emote_kneel_hold.ska"}, -- 3.29s
			EntityTimerStart {Name = "et_kneel_hold"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_JandrimKneelUp"},
		},
		Actions =
		{
			FigureAnimPlayOnce	{Tag = "Jandrim", File = "base/gfx/figures/npc/figure_npc_dwarf_emote_kneel_up.ska"}, -- 1.83s
			EntityTimerStop {Name = "et_kneel_hold"},
		},
	},

	OnOneTimeEvent
	{
		GotoState = "Cutscene",
		Conditions =
		{
			MapFlagIsTrue 		{Name = "mf_P353_First_Cutscene_Running"},
		},
		Actions = 
		{
		},
	},
};
State
{
	StateName = "Cutscene",
	
	OnOneTimeEvent
	{
		Actions =
		{
			FigureUnitChange	{Tag = "Jandrim", UnitId = 381, Level = 4},
		},
		Conditions =
		{
		},
	},
};