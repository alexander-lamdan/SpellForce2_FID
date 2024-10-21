State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_EndSalvationCS"},
		},
		Actions = 
		{
			DialogSetDisabled{},
			MapFlagSetTrue {Name = "mf_P501_TwiddleOnMap"},
			MapTimerStart {Name = "mt_P501_TwiddleOnMapTimer"},
		},
		NoSpawnEffect = true,
	};

}