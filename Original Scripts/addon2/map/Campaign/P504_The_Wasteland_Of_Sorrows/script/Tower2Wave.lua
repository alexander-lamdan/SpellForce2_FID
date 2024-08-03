TargetTwiddle = 0
TargetAvatar = 1
TargetCaine = 2
TargetSariel = 3
myCrossoverX = 207
myCrossoverY = 272

State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_P504_EggQuest"},
			BuildingIsAlive {Tag = "WS_tower_01"},
		},
		Actions =
		{
			EntityValueRandomize {Name = "ev_P504_WhereToGo", MinValue = 0, MaxValue = 3},
			EntityTimerStart {Name = "et_P504_Bored"},
			EntityFlagSetTrue {Name = "ef_P504_Action"},
		},
	},
	
	OnFigureRespawnEvent
	{
		WaitTime = 60,
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_P504_EggQuest"},
			BuildingIsAlive {Tag = "WS_tower_01"},
		},
		Actions =
		{
			EntityValueRandomize {Name = "ev_P504_WhereToGo", MinValue = 0, MaxValue = 3},
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
			FigureIsAlive {Tag = "pl_HumanHeroPTwiddle"},
		},
		Actions =
		{
		},
		HomeActions =
		{
			FigureAttackEntity {TargetTag = "pl_HumanHeroPTwiddle"},
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
			
		},
		Actions =
		{
		},
		HomeActions =
		{
			FigureAttackEntity {TargetTag = "pl_HumanAvatar"},
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
		},
		Actions =
		{
		},
		HomeActions =
		{
			FigureAttackEntity {TargetTag = "pl_HumanHeroCaine"},
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
		},
		Actions =
		{
		},
		HomeActions =
		{
			FigureAttackEntity {TargetTag = "pl_HumanHeroSariel"},
			EntityTimerStart {Name = "et_P504_Bored"}
		},
	},
	
	
	OnEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P504_Bored", Seconds = 20}
		},
		Actions =
		{
			EntityTimerStart {Name = "et_P504_Bored"},
			EntityValueRandomize {Name = "ev_P504_WhereToGo", MinValue = 0, MaxValue = 3},
		},
	},

}