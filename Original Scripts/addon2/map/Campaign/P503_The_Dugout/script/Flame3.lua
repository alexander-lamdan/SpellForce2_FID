--Script for Fire Forge Quest. 
-- Value = 0 -----> Red 
-- Value = 1 -----> Green 
-- Value = 2 -----> Yellow 
-- Value = 3 -----> Blue 
-- Value = 4 -----> White 

State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		GotoState = "Puzzle",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P503_IgniteForge"},
		},
		Actions = 
		{				  
		  ObjectChange	{Tag = "Flame03", ObjectId = 1109, X = 57.1309, Y = 106.885, Direction = 182.383},
		},
	},
};

State
{
	StateName = "Puzzle",
	
	OnLeverEvent
	{
		Delay = 2,
		Lever = "lever03",
		OnConditions = 
		{
			QuestIsActive		{Quest = "INTO_FIRE"},
		},
		Actions = 
		{
			MapValueAdd 		{Name = "mv_Flame3State", Value = 1},
			MapValueSubtract	{Name = "mv_Flame2State", Value = 1},
			MapValueSubtract	{Name = "mv_Flame1State", Value = 1},
			
			MapFlagSetTrue		{Name = "mf_ChangeFlame1"},
			MapFlagSetTrue		{Name = "mf_ChangeFlame2"},
			MapFlagSetTrue		{Name = "mf_ChangeFlame3"},
		},
	},
	
	OnEvent
	{
		Conditions =
		{
			MapValueIsGreaterOrEqual	{Name = "mv_Flame3State", Value = 5},				
		},
		Actions = 
		{
			MapValueSet					{Name = "mv_Flame3State", Value = 0},				
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			MapValueIsLessOrEqual	{Name = "mv_Flame3State", Value = -1},							
		},
		Actions = 
		{
			MapValueSet				{Name = "mv_Flame3State", Value = 0},							
		},
		
	},
	
	-- FLAMESTATE == 0 ->-> RED
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ChangeFlame3"},
			MapValueIsEqual	{Name = "mv_Flame3State", Value = 0},
		},
		Actions = 
		{
			ObjectChange	{Tag = "Flame03", ObjectId = 1109, X = 57.1309, Y = 106.885, Direction = 182.383},
			MapFlagSetFalse {Name = "mf_ChangeFlame3"},
		},
		
	},
	-- FLAMESTATE == 1 ->-> GREEN
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ChangeFlame3"},
			MapValueIsEqual	{Name = "mv_Flame3State", Value = 1},
		},
		Actions = 
		{
			ObjectChange	{Tag = "Flame03", ObjectId = 1110, X = 57.1309, Y = 106.885, Direction = 182.383},
			MapFlagSetFalse {Name = "mf_ChangeFlame3"},
		},
		
	},
	-- FLAMESTATE == 2 ->-> YELLOW
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ChangeFlame3"},
			MapValueIsEqual	{Name = "mv_Flame3State", Value = 2},
		},
		Actions = 
		{
			ObjectChange	{Tag = "Flame03", ObjectId = 1111, X = 57.1309, Y = 106.885, Direction = 182.383},
			MapFlagSetFalse {Name = "mf_ChangeFlame3"},
		},
		
	},
	-- FLAMESTATE == 3 ->-> BLUE
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ChangeFlame3"},
			MapValueIsEqual	{Name = "mv_Flame3State", Value = 3},
		},
		Actions = 
		{
			ObjectChange	{Tag = "Flame03", ObjectId = 1113, X = 57.1309, Y = 106.885, Direction = 182.383},
			MapFlagSetFalse {Name = "mf_ChangeFlame3"},
		},
		
	},
	-- FLAMESTATE == 4 ->-> WHITE
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ChangeFlame3"},
			MapValueIsEqual	{Name = "mv_Flame3State", Value = 4},
		},
		Actions = 
		{
			ObjectChange	{Tag = "Flame03", ObjectId = 1112, X = 57.1309, Y = 106.885, Direction = 182.383},
			MapFlagSetFalse {Name = "mf_ChangeFlame3"},
		},
		
	},
	
	OnLeverEvent
	{
		Delay =3,
		Lever = "lever03",
		OnConditions = 
		{
			LeverIsOn	{Tag = "Lever"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "test3"},			
			MapFlagSetTrue	{Name = "mt_test3"},
		},
	};

  

  OnLeverEvent
	{
		Delay = 3,
		Lever = "lever03",
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mt_test3"},
			MapTimerIsElapsed	{Name = "test3", Seconds = 3},
			
		},
		Actions = 
		{			
			LeverSetEnabled	{Tag = "Lever"},
		},
	};
	


	
};
