State
{
	StateName = "INIT",
	OnObjectSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_NewMarker"},
		},
		Actions = 
		{
			ObjectVanish {Tag = "InvasionMarker1"},
		},
	};
}