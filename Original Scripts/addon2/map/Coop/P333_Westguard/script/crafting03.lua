State
{
	StateName = "INIT",

	OnObjectSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P333_Crafting"},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "crafting03"},
			DialogTypeSetSideQuest	{Tag = "crafting03"},
		},
		DelayedActions = 
		{
		},
	},
};