
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
			MapFlagSetTrue{Name = "mf_P502Torch5On"}, -- ist zu Beginn aus
		},
		
	},

	
	OnToggleEvent
	{
		OnConditions = 
		{
			MapFlagIsTrue{Name = "mf_P502Torch5On"},
		},
		OnActions = 
		{
			ObjectChange{Tag = "default", ObjectId = 1557, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
		},
		OffConditions = 
		{
			MapFlagIsFalse	{Name = "mf_P502Torch5On"},
		},
		OffActions = 
		{
			ObjectChange{Tag = "default", ObjectId = 1490, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
		},
	};
}
