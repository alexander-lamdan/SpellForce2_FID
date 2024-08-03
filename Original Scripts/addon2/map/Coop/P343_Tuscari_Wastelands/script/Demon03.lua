
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
			FigureLookAtDirection {Tag = "default", Direction = 351.978},			
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

