State
{
	StateName = "INIT",
	OnEvent
	{
		Conditions = 
		{
			PlayerHasNotFigureAmountEx	{Player = "pl_DemonBase", Amount = 35 , CountWorkers = false, CountAvatarAndHeroes = false},
			MapFlagIsTrue	{Name = "mf_p502_DemonSpawn"},
			MapTimerIsElapsed	{Name = "mt_p502_DemonSpawn1", Seconds = 5},

		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_p502_DemonSpawn1"},			
			MapValueRandomize	{Name = "mv_p502_SpawnDemon", MinValue = 189, MaxValue = 195},
			MapFlagSetTrue	{Name = "mf_p502_SpawnEvent"},			
		},
		GotoState = self,
	};

	
	
		OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_p502_SpawnEvent"},
			MapValueIsEqual	{Name = "mv_p502_SpawnDemon", Value =189 },
			BuildingIsAlive	{Tag = "MG_tower_05"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_p502_SpawnEvent"},
			FigureRtsPlayerSpawnToEntity	{UnitId = 189 , Player = "pl_DemonBase", TargetTag = "MG_tower_05", Amount = 1 },
		},
		GotoState = self,
	};
	
		OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_p502_SpawnEvent"},
			MapValueIsEqual	{Name = "mv_p502_SpawnDemon", Value = 190 },
			BuildingIsAlive	{Tag = "MG_tower_06"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_p502_SpawnEvent"},
			
			FigureRtsPlayerSpawnToEntity	{UnitId = 192 , Player = "pl_DemonBase", TargetTag = "MG_tower_06", Amount = 1 },
		},
		GotoState = self,
	};
	
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_p502_SpawnEvent"},
			MapValueIsEqual	{Name = "mv_p502_SpawnDemon", Value = 192 },
			BuildingIsAlive	{Tag = "MG_tower_06"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_p502_SpawnEvent"},
			
			FigureRtsPlayerSpawnToEntity	{UnitId = 192 , Player = "pl_DemonBase", TargetTag = "MG_tower_06", Amount = 1 },
		},
		GotoState = self,
	};
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_p502_SpawnEvent"},
			MapValueIsEqual	{Name = "mv_p502_SpawnDemon", Value = 195 },
			BuildingIsAlive	{Tag = "MG_tower_04"},
			
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_p502_SpawnEvent"},
			
			FigureRtsPlayerSpawnToEntity	{UnitId = 195 , Player = "pl_DemonBase", TargetTag = "MG_tower_04", Amount = 1 },
		},
		GotoState = self,
	};
	
};