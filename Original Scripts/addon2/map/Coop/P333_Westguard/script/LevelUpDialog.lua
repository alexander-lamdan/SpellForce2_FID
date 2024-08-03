if not DEBUG then
	State
	{
		StateName = "VanishMe",
		
		OnOneTimeEvent
		{
			Conditions = 
			{
			},
			Actions = 
			{
				FigureVanish {},
			},
		};
		
		OnFigureRespawnEvent
		{
			WaitTime = 0,
			X = GetEntityX(),
			Y = GetEntityY(),
			Conditions = 
			{
				MapFlagIsTrue {Name = "mf_SpawnQuestHelper"},
			},
			Actions = 
			{
			},
			DeathActions = 
			{
			},
			DelayedActions = 
			{
				DialogSetEnabled	{Tag = "default"},
				DialogTypeSetSideQuest	{Tag = "default"},
			},
		};

		OnIdleGoHomeFake
		{
			X = GetEntityX(),
			Y = GetEntityY(),
			Range = 1,
			UpdateInterval = 0,
			Conditions = 
			{
			},
			Actions = 
			{
			},
			HomeActions = 
			{
				FigureDirectionSet	{Tag = "default", Direction = GetEntityDirection()},
			},
			OneTimeHomeActions = 
			{
			},
		};
	}
end
