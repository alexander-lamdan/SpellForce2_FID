
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
			MapFlagSetTrue{Name = "mf_P502Torch4On"}, -- ist zu Beginn aus
		},
	
	},


	OnToggleEvent
	{
		OnConditions = 
		{
			MapFlagIsTrue{Name = "mf_P502Torch4On"},
		},
		OnActions = 
		{
			ObjectChange{Tag = "default", ObjectId = 1557, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
		},
		OffConditions = 
		{
			MapFlagIsFalse{Name = "mf_P502Torch4On"},
		},
		OffActions = 
		{
			ObjectChange{Tag = "default", ObjectId = 1490, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
		},
	};
	
}
