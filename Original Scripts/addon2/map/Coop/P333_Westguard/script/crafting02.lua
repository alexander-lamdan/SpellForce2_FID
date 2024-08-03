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
			DialogSetEnabled	{Tag = "crafting02"},
			DialogTypeSetSideQuest	{Tag = "crafting02"},
		},
		DelayedActions = 
		{
		},
	},
};