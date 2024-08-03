State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P504_EggQuest"},
			MapFlagIsFalse	{Name = "mf_P504_EggQuestDone"},	
			OR
			{
				FigureIsDead {Tag = "egg_wave_01"},
				FigureIsDead {Tag = "egg_wave_02"},
				FigureIsDead {Tag = "egg_wave_03"},
			}
		},
		Actions = 
		{
			FigureRunToEntity	{ TargetTag = "marker_dragonstain"},	
		},
		GotoState = self,
	};


	
	OnFigureRespawnEvent	
	{
		WaitTime = 20,
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_P504_EggQuest"},
			MapFlagIsFalse	{Name = "mf_P504_EggQuestDone"},
			BuildingIsAlive {Tag = "WS_tower_01"},
		},
		Actions = 
		{
			FigureRunToEntity	{ TargetTag = "marker_dragonstain"},	
		},
		NoSpawnEffect = true, 
		IsSpawnOnlyWhen = true,
	};
}