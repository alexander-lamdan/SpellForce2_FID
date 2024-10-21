State
{
	StateName = "INIT",
	OnObjectSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			QuestIsActive {Quest = "IF_SALVATION"},
		},
		Actions = 
		{
		},
	};
}