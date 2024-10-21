State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		GotoState = "QuestActive",
		Conditions = 
		{
	      	OR
	    	{
	    		QuestIsActive {Quest = "CoopEvilProphet", Player = "pl_Human1"},
	  			QuestIsActive {Quest = "CoopEvilProphet", Player = "pl_Human2"},
	  			QuestIsActive {Quest = "CoopEvilProphet", Player = "pl_Human3"},
	  		},
		},
		Actions = 
		{
		},
	},
};

State
{
	StateName = "QuestActive",
	
	OnOneTimeEvent
	{
		GotoState = "Killed3Incarnations",
		Conditions = 
		{
			OR
			{
				AvatarValueIsGreater	{Player = "pl_Human1", Name ="av_P333_KilledIncarnations", Value = 2},
				AvatarValueIsGreater	{Player = "pl_Human2", Name ="av_P333_KilledIncarnations", Value = 2},
				AvatarValueIsGreater	{Player = "pl_Human3", Name ="av_P333_KilledIncarnations", Value = 2},	
			},
			
		},
		Actions = 
		{
		
		},
	},
	
	OnOneTimeEvent
	{
		GotoState = "Killed2Incarnations",
		Conditions = 
		{
			OR
			{
				AvatarValueIsEqual	{Player = "pl_Human1", Name ="av_P333_KilledIncarnations", Value = 2},
				AvatarValueIsEqual	{Player = "pl_Human2", Name ="av_P333_KilledIncarnations", Value = 2},
				AvatarValueIsEqual	{Player = "pl_Human3", Name ="av_P333_KilledIncarnations", Value = 2},
				
			},
			
		},
		Actions = 
		{
		
		},
	},
	
	OnOneTimeEvent
	{
		GotoState = "Killed1Incarnations",
		Conditions = 
		{
			OR
			{
				AvatarValueIsEqual	{Player = "pl_Human1", Name ="av_P333_KilledIncarnations", Value = 1},
				AvatarValueIsEqual	{Player = "pl_Human2", Name ="av_P333_KilledIncarnations", Value = 1},
				AvatarValueIsEqual	{Player = "pl_Human3", Name ="av_P333_KilledIncarnations", Value = 1},
			},
			
		},
		Actions = 
		{
		
		},
	},
	
		OnOneTimeEvent
	{
		GotoState = "Killed0Incarnations",
		Conditions = 
		{
			OR
			{
				AvatarValueIsEqual	{Player = "pl_Human1", Name ="av_P333_KilledIncarnations", Value = 0},
				AvatarValueIsEqual	{Player = "pl_Human2", Name ="av_P333_KilledIncarnations", Value = 0},
				AvatarValueIsEqual	{Player = "pl_Human3", Name ="av_P333_KilledIncarnations", Value = 0},
			},
			
		},
		Actions = 
		{
		
		},
	},
};

State
{
	StateName = "Killed0Incarnations",
	OnOneTimeEvent
	{
		GotoState = "BossFight",
		Conditions =
		{
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "FinalBoss", Level = 30, UnitId = 899, X = 170, Y =  225, Team = "tm_Enemy"},
		},
	},
};
State
{
	StateName = "Killed1Incarnations",
	OnOneTimeEvent
	{
		GotoState = "BossFight",
		Conditions =
		{
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "FinalBoss", Level = 30, UnitId = 1002, X = 170, Y =  225, Team = "tm_Enemy"},
		},
	},
};
State
{
	StateName = "Killed2Incarnations",
	OnOneTimeEvent
	{
		GotoState = "BossFight",
		Conditions =
		{
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "FinalBoss", Level = 30, UnitId = 1003, X = 170, Y =  225, Team = "tm_Enemy"},
		},
	},
};
State
{
	StateName = "Killed3Incarnations",
	OnOneTimeEvent
	{
		GotoState = "BossFight",
		Conditions =
		{
		},
		Actions =
		{
			 FigureNpcSpawn	{Tag = "FinalBoss", Level = 30, UnitId = 1004, X = 170, Y =  225, Team = "tm_Enemy"},
		},
	},
};

for i = 1, 3 do
	local sPlayerName = "pl_Human" .. i
	
	OnOneTimeEvent
	{
		EventName = "Player"..i.."ProphetDead",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopEvilProphet"},
			FigureIsDead	{Tag = "FinalBoss"},
					
		},
		Actions = 
		{
			QuestSetSolved	{Player = sPlayerName, Quest = "CoopEvilProphet"},
			QuestSetActive	{Player = sPlayerName, Quest = "CoopEvilProphetKilled"},
		},
	}
end

State
{
	StateName = "BossFight",
};




