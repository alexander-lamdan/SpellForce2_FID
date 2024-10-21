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
			DialogSetEnabled	{Tag = "crafting04"},
			DialogTypeSetSideQuest	{Tag = "crafting04"},
		},
		DelayedActions = 
		{
		},
	},
};