State
{
	StateName = "INIT",
	OnObjectSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_p502_QuestCompleteKnowYourEnemy"},
		},
		Actions = 
		{
		},
	};


}