State
{
	StateName = "GetWifeBack",
	
	OnFollowEvent
	{
		Tag = "Utrecht",
		TargetTag = "pl_Human1Avatar",
		OnConditions = 
		{
			MapValueIsEqual		{Name = "mv_UtrechtFollowsPlayer", Value = 1},
			FigureIsNotInCombat	{Tag  = "pl_Human1Avatar"},
			MapFlagIsFalse		{Name = "mf_UtrechtAtWife"},
		},
		Actions = 
		{
		},
	},
	OnFollowEvent
	{
		Tag = "Utrecht",
		TargetTag = "pl_Human2Avatar",
		OnConditions = 
		{
			MapValueIsEqual		{Name = "mv_UtrechtFollowsPlayer", Value = 2},
			FigureIsNotInCombat	{Tag  = "pl_Human2Avatar"},
			MapFlagIsFalse		{Name = "mf_UtrechtAtWife"},
		},
		Actions = 
		{
		},
	},
	OnFollowEvent
	{
		Tag = "Utrecht",
		TargetTag = "pl_Human3Avatar",
		OnConditions = 
		{
			MapValueIsEqual		{Name = "mv_UtrechtFollowsPlayer", Value = 3},
			FigureIsNotInCombat	{Tag  = "pl_Human3Avatar"},
			MapFlagIsFalse		{Name = "mf_UtrechtAtWife"},
		},
		Actions = 
		{
		},
	},


	
};