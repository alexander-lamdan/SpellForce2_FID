
State
{
	StateName = "MainState",
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
		},
		DelayedActions = 
		{
		},
	},
	OnFigureRespawnEvent
	{
		WaitTime = 0,
		X = 481.873,
		Y = 501.855,
		NoSpawnEffect = true,
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_ReSpawn_Prophet"},
		},
		Actions = 
		{
			FigureLookAtDirection {Tag = "default", Direction = 328.442},
			FigureCutsceneTalkJobSet {Tag = "default"},
			CutsceneFigureWeaponsHide {Tag = "default"},
		},
	};

};
