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
			DialogSetEnabled	{Tag = "crafting01"},
			DialogTypeSetSideQuest	{Tag = "crafting01"},
		},
		DelayedActions = 
		{
		},
	},
};