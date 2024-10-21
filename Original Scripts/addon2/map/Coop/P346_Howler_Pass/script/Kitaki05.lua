State                                                                                     
{                                                                                        
	StateName = "INIT",                                                                  
	                                                                                     
	OnFigureSpawnOnlyWhenEvent                                                           
	{                                                                                    
		Conditions =                                                                     
		{                                                                                
	    	OR                                                                           
	    	{                                                                            
	    		FigureIsInRange	{Tag = "OrcCamp01Seeker01", X = 308, Y = 43, Range = 16},
	    		FigureIsInRange	{Tag = "OrcCamp01Seeker02", X = 308, Y = 43, Range = 16},
	    		FigureIsInRange	{Tag = "OrcCamp01Seeker03", X = 308, Y = 43, Range = 16},
	    		FigureIsInRange	{Tag = "OrcCamp02Seeker01", X = 308, Y = 43, Range = 16},
	    		FigureIsInRange	{Tag = "OrcCamp02Seeker02", X = 308, Y = 43, Range = 16},
	    		FigureIsInRange	{Tag = "OrcCamp02Seeker03", X = 308, Y = 43, Range = 16},
	    		FigureIsInRange	{Tag = "OrcCamp03Seeker01", X = 308, Y = 43, Range = 16},
	    		FigureIsInRange	{Tag = "OrcCamp03Seeker02", X = 308, Y = 43, Range = 16},
	    		FigureIsInRange	{Tag = "OrcCamp03Seeker03", X = 308, Y = 43, Range = 16},
	    	},                                                                           
		},                                                                               
		Actions =                                                                        
		{                                                                                
			MapFlagSetTrue	{Name = "mf_Spy5Found"},            
			FigureOutcry	{Tag  = "OutcrySpeaker", TextTag = "Seer02"},                         
		},                                                                               
		DelayedActions =                                                                 
		{                                                                                
		},                                                                               
	},                                                                                   
};                                                                                       