State
{
	StateName = "WaitForQuest",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_StartMapQuest"},
		},
		Actions = 
		{
			EntityFlagSetTrue {Name = "ef_GO"},
		},
		DelayedActions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP01",
		Conditions = 
		{
			EntityFlagIsTrue {Name = "ef_GO"},
		},
		Actions = 
		{
		},
	},
};

State 
{
	StateName = "WalkToWP01",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP01"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP02",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP01", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP02",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP02"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP03",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP02", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP03",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP03"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP04",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP03", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP04",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP04"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP05",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP04", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP05",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP05"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP06",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP05", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP06",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP06"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP07",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP06", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP07",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP07"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP08",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP07", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP08",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP08"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP09",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP08", Range = 2},
			
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy01WP08", Range = 2},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP08", Range = 2},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP08", Range = 2},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard01", TargetTag = "Convoy04WP08", Range = 2},	  
				FigureIsDead		 	{Tag = "ConvoyGuard01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP08", Range = 2},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP08", Range = 2},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
		},
	},
};
State 
{
	StateName = "WalkToWP09",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP09"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP10",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP09", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP10",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP10"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP11",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP10", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP11",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP11"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP12",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP11", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP12",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP12"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP13",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP12", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP13",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP13"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP14",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP13", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP14",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP14"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP15",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP14", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP15",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP15"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP16",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP15", Range = 2},
			
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse01", TargetTag = "Convoy01WP15", Range = 2},	  
				FigureIsDead		 	{Tag = "ConvoyHorse01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse02", TargetTag = "Convoy02WP15", Range = 2},	  
				FigureIsDead		 	{Tag = "ConvoyHorse02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyHorse03", TargetTag = "Convoy03WP15", Range = 2},	  
				FigureIsDead		 	{Tag = "ConvoyHorse03"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard01", TargetTag = "Convoy04WP15", Range = 2},	  
				FigureIsDead		 	{Tag = "ConvoyGuard01"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard02", TargetTag = "Convoy05WP15", Range = 2},	  
				FigureIsDead		 	{Tag = "ConvoyGuard02"}, 
			},
			OR
			{
				FigureIsInEntityRange 	{Tag = "ConvoyGuard03", TargetTag = "Convoy06WP15", Range = 2},	  
				FigureIsDead		 	{Tag = "ConvoyGuard03"}, 
			},
		},
	},
};
State 
{
	StateName = "WalkToWP16",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP16"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP17",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP16", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP17",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP17"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP18",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP17", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP18",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP18"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP19",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP18", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP19",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP19"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP20",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP19", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP20",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP20"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP21",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP20", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP21",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP21"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP22",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP21", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP22",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP22"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP23",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP22", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP23",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP23"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP24",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP23", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP24",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP24"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP25",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP24", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP25",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP25"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP26",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP25", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP26",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP26"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP27",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP26", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP27",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP27"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP28",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP27", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP28",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP28"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP29",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP28", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP29",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP29"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{
		GotoState = "WalkToWP30",
		Actions = 
		{
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP29", Range = 2},
		},
	},
};
State 
{
	StateName = "WalkToWP30",
	
	OnOneTimeEvent
	{
		Actions = 
		{
			FigureWalkToEntity {Tag = "default", TargetTag = "Convoy07WP29"},
		},
		Conditions = 
		{
		},
	},
	OnOneTimeEvent
	{

		Actions = 
		{
			MapValueAdd {Name = "mv_HorsesSaved", Value = 1},
		},
		Conditions = 
		{
			FigureIsInEntityRange {Tag = "default", TargetTag = "Convoy07WP29", Range = 2},
		},
	},
};