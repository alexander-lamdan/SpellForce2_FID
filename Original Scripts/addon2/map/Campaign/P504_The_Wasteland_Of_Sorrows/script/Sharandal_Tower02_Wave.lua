TargetIO = 0
TargetAvatar = 1
TargetCaine = 2
TargetSariel = 3
TargetAntara = 4

myCrossoverX = 289.027
myCrossoverY = 395.671

State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P504_SharandalWave"},
			BuildingIsAlive {Tag = "WS_sharandal_tower_02"},
		},
		Actions =
		{
			EntityValueRandomize {Name = "ev_P504_WhereToGo", MinValue = 0, MaxValue = 4},
			EntityTimerStart {Name = "et_P504_Bored"},
			EntityFlagSetTrue {Name = "ef_P504_Action"},
		},
	},
	
	OnFigureRespawnEvent
	{
		WaitTime = 60,
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P504_SharandalWave"},
			BuildingIsAlive {Tag = "WS_sharandal_tower_02"},
		},
		Actions =
		{
			EntityValueRandomize {Name = "ev_P504_WhereToGo", MinValue = 0, MaxValue = 4},
			EntityTimerStart {Name = "et_P504_Bored"}
		},
	},
		
	OnIdleRunHomeFake
	{
		X = myCrossoverX,
		Y = myCrossoverY,
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P504_WhereToGo", Value = 0},
			EntityFlagIsTrue {Name = "ef_P504_Action"},
			FigureIsAlive {Tag = "pl_HumanHeroIO"},
			MapFlagIsTrue {Name = "mf_P504_AllAliveTower2"},
		},
		
		Actions =
		{
		},
		HomeActions =
		{
			FigureRunToEntity {TargetTag = "pl_HumanHeroIO"},
			EntityTimerStart {Name = "et_P504_Bored"}
		},
	},
		
	OnIdleRunHomeFake
	{
		X = myCrossoverX,
		Y = myCrossoverY,
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P504_WhereToGo", Value = 1},
			EntityFlagIsTrue {Name = "ef_P504_Action"},
			FigureIsAlive {Tag = "pl_HumanAvatar"},
			MapFlagIsTrue {Name = "mf_P504_AllAliveTower2"},
		},
		Actions =
		{
		},
		HomeActions =
		{
			FigureRunToEntity {TargetTag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_P504_Bored"}
		},
	},
	
		OnIdleRunHomeFake
	{
		X = myCrossoverX,
		Y = myCrossoverY,
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P504_WhereToGo", Value = 2},
			EntityFlagIsTrue {Name = "ef_P504_Action"},
			FigureIsAlive {Tag = "pl_HumanHeroCaine"},
			
			MapFlagIsTrue {Name = "mf_P504_AllAliveTower2"},
		},
		Actions =
		{
		},
		HomeActions =
		{
			FigureRunToEntity {TargetTag = "pl_HumanHeroCaine"},
			EntityTimerStart {Name = "et_P504_Bored"}
		},
	},
	
	OnIdleRunHomeFake
	{
		X = myCrossoverX,
		Y = myCrossoverY,
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P504_WhereToGo", Value = 3},
			EntityFlagIsTrue {Name = "ef_P504_Action"},
			FigureIsAlive {Tag = "pl_HumanHeroSariel"},
			
			MapFlagIsTrue {Name = "mf_P504_AllAliveTower2"},
		},
		Actions =
		{
		},
		HomeActions =
		{
			FigureRunToEntity {TargetTag = "pl_HumanHeroSariel"},
			EntityTimerStart {Name = "et_P504_Bored"}
		},
	},
	
	OnIdleRunHomeFake
	{
		X = myCrossoverX,
		Y = myCrossoverY,
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P504_WhereToGo", Value = 4},
			EntityFlagIsTrue {Name = "ef_P504_Action"},
			FigureIsAlive {Tag = "pl_HumanHeroAntara"},
			
			MapFlagIsTrue {Name = "mf_P504_AllAliveTower2"},
		},
		Actions =
		{
		},
		HomeActions =
		{
			FigureRunToEntity {TargetTag = "pl_HumanHeroAntara"},
			EntityTimerStart {Name = "et_P504_Bored"}
		},
	},
	
	--OnEvent
	--{
		--Conditions =
		--{
			--FigureIsDead {},
			--MapFlagIsTrue {Name = "mf_P504_AllAliveTower2"},
		--},
		--Actions =
		--{
			--MapFlagSetFalse {Name = "mf_P504_AllAliveTower2"},
--		},
	--},
	
	
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P504_Bored", Seconds = 10}
		},
		Actions =
		{
			EntityTimerStart {Name = "et_P504_Bored"},
			EntityValueRandomize {Name = "ev_P504_WhereToGo", MinValue = 0, MaxValue = 4},
		},
	},
	
	OnDeadEvent
	{
		EventName = DeadEvent,
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P504_AllAliveTower2"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P504_AllAliveTower2"},
		},
	};



}