
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
			MapFlagSetTrue{Name = "mf_P502Torch2On"}, 
		},

	},
	
	OnToggleEvent
	{
		OnConditions = 
		{			
			MapFlagIsTrue{Name = "mf_P502Torch2On"},
		},
		OnActions = 
		{
			ObjectChange{Tag = "default", ObjectId = 1557, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
		},
		OffConditions = 
		{
			MapFlagIsFalse{Name = "mf_P502Torch2On"},
		},
		OffActions = 
		{
			ObjectChange{Tag = "default", ObjectId = 1490, X = GetEntityX(), Y = GetEntityY(), Direction = 0},
		},
	};
	
}