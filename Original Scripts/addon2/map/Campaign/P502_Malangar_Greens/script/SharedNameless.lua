State
{
	StateName = "INIT",
	
	
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
		
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_P502_Checkpos"},
		},		
	};
	
	OnEvent
	{
		

		Conditions = 
		{
				EntityTimerIsElapsed	{Name = "et_P502_Checkpos", Seconds = 10 },
				FigureIsNotInEntityRange	{TargetTag = "NamelessMarker", Range = 10 },
				FigureIsNotInEntityRange	{TargetTag = "pl_HumanHeroIO", Range = 2 },
				FigureIsNotInEntityRange	{TargetTag = "pl_HumanHeroAvatar", Range = 2 },
				FigureIsNotInEntityRange	{TargetTag = "pl_HumanHeroSariel", Range = 2 },
				FigureIsNotInEntityRange	{TargetTag = "pl_HumanHeroCaine", Range = 2 },				
		},
		Actions = 
		{
			FigureWalkToEntity	{TargetTag = "NamelessMarker"},
			EntityTimerStart	{Name = "et_P502_Checkpos"},
			
		},
		
	};
	
	OnEvent
	{
		Conditions = 
		{
				EntityTimerIsElapsed	{Name = "et_P502_Checkpos", Seconds = 10 },
				FigureIsNotInEntityRange	{TargetTag = "NamelessMarker", Range = 20 },		
		},
		Actions = 
		{
			FigureWalkToEntity	{TargetTag = "NamelessMarker"},
			EntityTimerStart	{Name = "et_P502_Checkpos"},
		},

	};
	
	
	
}