State
{
	StateName = "INIT",
	
	---------------------------------------------------------------
	-- Outpost Resource attack -> randomized wolf invaders, targets
	----------------------------------------------------------------

OnOneTimeEvent
	{
		Conditions = 
		{
			
			FigureIsDead{Tag = "IF_cave_wolf_01"},
			FigureIsDead{Tag = "IF_cave_wolf_02"},
			FigureIsDead{Tag = "IF_cave_wolf_03"},
			FigureIsDead{Tag = "IF_cave_wolf_04"},
			FigureIsDead{Tag = "IF_cave_wolf_05"},
			FigureIsDead{Tag = "IF_cave_wolf_06"},
			FigureIsDead{Tag = "IF_cave_wolf_07"},
			FigureIsDead{Tag = "IF_cave_wolf_08"},
			FigureIsDead{Tag = "IF_cave_wolf_09"},
			FigureIsDead{Tag = "IF_cave_wolf_10"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P501_WolvesDead"},
		},
	};


	-- If the player has 10 soldier, the wolf spawn is started
	OnOneTimeEvent
	{
		Conditions = 
		{
			--PlayerHasFigureAmountEx	{Player = "default", Amount = 3 , CountWorkers = false, CountAvatarAndHeroes = false},
			MapFlagIsTrue {Name = "mf_P501_WaveStarter2"},
			MapFlagIsFalse	{Name = "mf_P501_WolvesDead"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P501_WolfSpawnRun"},
			MapTimerStart	{Name = "mt_P501_WolfSpawnTimer"},			
			MapValueRandomize	{Name = "mv_P501_SpawnWolf", MinValue = 791, MaxValue = 794},
			MapValueRandomize	{Name = "mv_P501_WolfTarget", MinValue = 1, MaxValue = 2},
			MapFlagSetTrue	{Name = "mf_P501_WolfSpawnEvent"},

		},
	};
	
	-- If the player killed wolves, the wolf spawn is off
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P501_WolvesDead"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P501_WolfSpawnRun"},
			MapTimerStop {Name = "mt_P501_WolfSpawnTimer"},
			
		},
	};
	
	-- Spawn timer and randomize
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P501_WolfSpawnRun"},
			MapTimerIsElapsed	{Name = "mt_P501_WolfSpawnTimer", Seconds = 240},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P501_WolfSpawnTimer"},			
			MapValueRandomize	{Name = "mv_P501_SpawnWolf", MinValue = 791, MaxValue = 794},
			MapValueRandomize	{Name = "mv_P501_WolfTarget", MinValue = 1, MaxValue = 2},
			MapFlagSetTrue	{Name = "mf_P501_WolfSpawnEvent"},	
		},

	};
	
	-- When the attackers are dead, the respawn timer will be restarted
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P501_WolfSpawnRun"},
			MapFlagIsTrue	{Name = "mf_P501_WolvesAlive"},
			FigureIsDead{Tag = "IF_InvaderWolf_01"},
			FigureIsDead{Tag = "IF_InvaderWolf_02"},
			FigureIsDead{Tag = "IF_InvaderWolf_03"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P501_WolvesAlive"},
			MapTimerStart {Name = "mt_P501_WolfSpawnTimer"},

		},
		
	};
	
	-- Wolf spawn -> Blood wolves
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_WolfSpawnEvent"},
			MapValueIsEqual	{Name = "mv_P501_SpawnWolf", Value = 791 },
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P501_WolfSpawnEvent"},
			NoSpawnEffect { Spawn = FigureNpcSpawn	{Tag = "IF_InvaderWolf_01", Level = 2 , UnitId = 791 , X = 690 , Y = 376 , Team = "tm_Team2"},},
			NoSpawnEffect { Spawn = FigureNpcSpawn	{Tag = "IF_InvaderWolf_02", Level = 3 , UnitId = 789 , X = 688 , Y = 376 , Team = "tm_Team2"},},
			NoSpawnEffect { Spawn = FigureNpcSpawn	{Tag = "IF_InvaderWolf_03", Level = 2 , UnitId = 789 , X = 686 , Y = 376 , Team = "tm_Team2"},},
		
			MapFlagSetTrue	{Name = "mf_P501_WolfMoveEvent"},
			MapFlagSetTrue	{Name = "mf_P501_WolvesAlive"},
			
		},

	};
	
	-- Wolf spawn -> Grey wolves
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_WolfSpawnEvent"},
			MapValueIsEqual	{Name = "mv_P501_SpawnWolf", Value = 792 },
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P501_WolfSpawnEvent"},
			NoSpawnEffect { Spawn = FigureNpcSpawn	{Tag = "IF_InvaderWolf_01", Level = 2 , UnitId = 792 , X = 690 , Y = 376 , Team = "tm_Team2"},},
			NoSpawnEffect { Spawn = FigureNpcSpawn	{Tag = "IF_InvaderWolf_02", Level = 3 , UnitId = 788 , X = 688 , Y = 376 , Team = "tm_Team2"},},
			NoSpawnEffect { Spawn = FigureNpcSpawn	{Tag = "IF_InvaderWolf_03", Level = 2 , UnitId = 788 , X = 686 , Y = 376 , Team = "tm_Team2"},},
		
			MapFlagSetTrue	{Name = "mf_P501_WolfMoveEvent"},
			MapFlagSetTrue	{Name = "mf_P501_WolvesAlive"},

		},
		
	};
	
	-- Wolf spawn -> Black wolves
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_WolfSpawnEvent"},
			MapValueIsEqual	{Name = "mv_P501_SpawnWolf", Value = 793 },
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P501_WolfSpawnEvent"},
			NoSpawnEffect { Spawn = FigureNpcSpawn	{Tag = "IF_InvaderWolf_01", Level = 2 , UnitId = 793 , X = 690 , Y = 376 , Team = "tm_Team2"},},
			NoSpawnEffect { Spawn = FigureNpcSpawn	{Tag = "IF_InvaderWolf_02", Level = 3 , UnitId = 502 , X = 688 , Y = 376 , Team = "tm_Team2"},},
			NoSpawnEffect { Spawn = FigureNpcSpawn	{Tag = "IF_InvaderWolf_03", Level = 2 , UnitId = 502 , X = 686 , Y = 376 , Team = "tm_Team2"},},
		
			MapFlagSetTrue	{Name = "mf_P501_WolfMoveEvent"},
			MapFlagSetTrue	{Name = "mf_P501_WolvesAlive"},
			
		},

	};
	
	-- Wolf spawn -> Steppe wolves
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_WolfSpawnEvent"},
			MapValueIsEqual	{Name = "mv_P501_SpawnWolf", Value = 794 },
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P501_WolfSpawnEvent"},
			NoSpawnEffect { Spawn = FigureNpcSpawn	{Tag = "IF_InvaderWolf_01", Level = 2 , UnitId = 794 , X = 690 , Y = 376 , Team = "tm_Team2"},},
			NoSpawnEffect { Spawn = FigureNpcSpawn	{Tag = "IF_InvaderWolf_02", Level = 3 , UnitId = 790 , X = 688 , Y = 376 , Team = "tm_Team2"},},
			NoSpawnEffect { Spawn = FigureNpcSpawn	{Tag = "IF_InvaderWolf_03", Level = 2 , UnitId = 790 , X = 686 , Y = 376 , Team = "tm_Team2"},},
		
			MapFlagSetTrue	{Name = "mf_P501_WolfMoveEvent"},
			MapFlagSetTrue	{Name = "mf_P501_WolvesAlive"},

		},
		
	};
	
	-- Wolf Move event -> Target 1
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_WolfMoveEvent"},
			MapValueIsEqual	{Name = "mv_P501_WolfTarget", Value = 1 },
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P501_WolfMoveEvent"},
			FigureForcedRunToEntity	{Tag = "IF_InvaderWolf_01", TargetTag = "IF_Outpost_Resource_Silver"},
			FigureForcedRunToEntity	{Tag = "IF_InvaderWolf_02", TargetTag = "IF_Outpost_Resource_Silver"},
			FigureForcedRunToEntity	{Tag = "IF_InvaderWolf_03", TargetTag = "IF_Outpost_Resource_Silver"},
		},
		
	};
		
	-- Wolf Move event -> Target 2
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_WolfMoveEvent"},
			MapValueIsEqual	{Name = "mv_P501_WolfTarget", Value = 2 },
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P501_WolfMoveEvent"},
			FigureForcedRunToEntity	{Tag = "IF_InvaderWolf_01", TargetTag = "IF_Outpost_Resource_Stone"},
			FigureForcedRunToEntity	{Tag = "IF_InvaderWolf_02", TargetTag = "IF_Outpost_Resource_Stone"},
			FigureForcedRunToEntity	{Tag = "IF_InvaderWolf_03", TargetTag = "IF_Outpost_Resource_Stone"},
		},

	};
			
};