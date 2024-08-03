
State
{
	StateName = "MainScript",
   	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		NoSpawnEffect = true,
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CS_01_Spawn"},
		},
		Actions = 
		{
			FigureLookAtDirection {Tag = "default", Direction = 0},	
			MapFlagSetTrue {Name = "mf_CS_01_Kneel_Up_Zerbo"},		
		},
	};
   	OnOneTimeEvent
   	{
 		 Conditions =
   		{
   			MapFlagIsTrue {Name = "mf_CS_01_Vanish"},
   		},
   		Actions =
   		{
			FigureVanish {Tag = "default"},
   		},
   		GotoState = "EndScript",
   },
};
	
State
{	
	StateName = "EndScript",
};

