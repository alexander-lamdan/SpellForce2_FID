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
			LeverSetEnabled	{Tag = "lever01"},
			LeverSetEnabled	{Tag = "lever02"},
			LeverSetEnabled	{Tag = "lever03"},
			AvatarItemMiscTake	{ItemId = 466, Amount = 3},		  
			AvatarItemMiscTake	{ItemId = 467, Amount = 1},		  
			AvatarItemMiscTake	{ItemId = 468, Amount = 1},		  
		  ObjectChange	{Tag = "Flame01", ObjectId = 1109, X = 24.6396, Y = 111.612, Direction = 2},
		},
	},
};

State
{
	StateName = "Puzzle",
	
	OnLeverEvent
	{
		Delay = 2,
		Lever = "lever01",
		OnConditions = 
		{
			QuestIsActive		{Quest = "INTO_FIRE"},
		},
		Actions = 
		{
			MapValueAdd 		{Name = "mv_Flame1State", Value = 1},
			MapValueSubtract	{Name = "mv_Flame2State", Value = 1},
			MapValueSubtract	{Name = "mv_Flame3State", Value = 1},
			
			MapFlagSetTrue		{Name = "mf_ChangeFlame1"},
			MapFlagSetTrue		{Name = "mf_ChangeFlame2"},
			MapFlagSetTrue		{Name = "mf_ChangeFlame3"},
		},
	},
	
	OnEvent
	{
		Conditions =
		{
			MapValueIsGreaterOrEqual	{Name = "mv_Flame1State", Value = 5},				
		},
		Actions = 
		{
			MapValueSet					{Name = "mv_Flame1State", Value = 0},				
		},
		
	},
	OnEvent
	{
		Conditions =
		{
			MapValueIsLessOrEqual	{Name = "mv_Flame1State", Value = -1},							
		},
		Actions = 
		{
			MapValueSet				{Name = "mv_Flame1State", Value = 0},							
		},
		
	},
	
	-- FLAMESTATE == 0 ->-> RED
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ChangeFlame1"},
			MapValueIsEqual	{Name = "mv_Flame1State", Value = 0},
		},
		Actions = 
		{
			ObjectChange	{Tag = "Flame01", ObjectId = 1109, X = 24.6396, Y = 111.612, Direction = 2},
			MapFlagSetFalse {Name = "mf_ChangeFlame1"},
		},
		
	},
	-- FLAMESTATE == 1 ->-> GREEN
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ChangeFlame1"},
			MapValueIsEqual	{Name = "mv_Flame1State", Value = 1},
		},
		Actions = 
		{
			ObjectChange	{Tag = "Flame01", ObjectId = 1110, X = 24.6396, Y = 111.612, Direction = 2},
			MapFlagSetFalse {Name = "mf_ChangeFlame1"},
		},
		
	},
	-- FLAMESTATE == 2 ->-> YELLOW
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ChangeFlame1"},
			MapValueIsEqual	{Name = "mv_Flame1State", Value = 2},
		},
		Actions = 
		{
			ObjectChange	{Tag = "Flame01", ObjectId = 1111, X = 24.6396, Y = 111.612, Direction = 2},
			MapFlagSetFalse {Name = "mf_ChangeFlame1"},
		},
		
	},
	-- FLAMESTATE == 3 ->-> BLUE
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ChangeFlame1"},
			MapValueIsEqual	{Name = "mv_Flame1State", Value = 3},
		},
		Actions = 
		{
			ObjectChange	{Tag = "Flame01", ObjectId = 1113, X = 24.6396, Y = 111.612, Direction = 2},
			MapFlagSetFalse {Name = "mf_ChangeFlame1"},
		},
		
	},
	-- FLAMESTATE == 4 ->-> WHITE
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_ChangeFlame1"},
			MapValueIsEqual	{Name = "mv_Flame1State", Value = 4},
		},
		Actions = 
		{
			ObjectChange	{Tag = "Flame01", ObjectId = 1112, X = 24.6396, Y = 111.612, Direction = 2},
			MapFlagSetFalse {Name = "mf_ChangeFlame1"},
		},
		
	},
	
	OnLeverEvent
	{
		Delay =3,
		Lever = "lever01",
		OnConditions = 
		{
			LeverIsOn	{Tag = "Lever"},
		},
		Actions = 
		{
			MapTimerStart	{Name = "test"},			
			MapFlagSetTrue	{Name = "mt_test"},
		},
	};

  

  OnLeverEvent
	{
		Delay = 3,
		Lever = "lever01",
		OnConditions = 
		{
			MapFlagIsTrue	{Name = "mt_test"},
			MapTimerIsElapsed	{Name = "test", Seconds = 3},
			
		},
		Actions = 
		{			
			LeverSetEnabled	{Tag = "Lever"},
		},
	};
	


	
};
