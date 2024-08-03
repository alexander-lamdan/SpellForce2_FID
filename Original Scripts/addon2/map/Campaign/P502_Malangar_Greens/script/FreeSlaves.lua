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
			FigureVanish	{Tag = "Prison_Demon_01"},
			FigureVanish	{Tag = "Prison_Demon_02"},
			FigureVanish	{Tag = "Prison_Demon_03"},
			FigureVanish	{Tag = "Prison_Demon_04"},
			FigureVanish	{Tag = "Prison_Demon_05"},
			FigureVanish	{Tag = "Prison_Demon_06"},
			FigureVanish	{Tag = "Prison_Demon_07"},
			FigureVanish	{Tag = "Prison_Demon_08"},
			
			FigureVanish	{Tag = "MG_human_prisoner_01"},
			FigureVanish	{Tag = "MG_human_prisoner_02"},
			FigureVanish	{Tag = "MG_human_prisoner_03"},
			
			FigureVanish	{Tag = "MG_Shaikan_prisoner"},
			FigureVanish	{Tag = "MG_Pact_prisoner"},
			FigureVanish	{Tag = "MG_Ork_prisoner"},
			
			FigureVanish	{Tag = "prisone_Soldier_01"},
			FigureVanish	{Tag = "prisone_Soldier_02"},
			FigureVanish	{Tag = "prisone_Soldier_03"},
			FigureVanish	{Tag = "prisone_Soldier_04"},
			FigureVanish	{Tag = "prisone_Soldier_05"},
		},
	};
	
	
		OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P502_VillageSurvivorDialogOver"},
		},
		Actions = 
		{
		
			FigureRespawn	{Tag = "Prison_Demon_01"},
			FigureRespawn	{Tag = "Prison_Demon_02"},
			FigureRespawn	{Tag = "Prison_Demon_03"},
			FigureRespawn	{Tag = "Prison_Demon_04"},
			FigureRespawn	{Tag = "Prison_Demon_05"},
			FigureRespawn	{Tag = "Prison_Demon_06"},
			FigureRespawn	{Tag = "Prison_Demon_07"},
			FigureRespawn	{Tag = "Prison_Demon_08"},
			
			FigureRespawn	{Tag = "MG_human_prisoner_01"},
			FigureRespawn	{Tag = "MG_human_prisoner_02"},
			FigureRespawn	{Tag = "MG_human_prisoner_03"},
			
			FigureRespawn	{Tag = "MG_Shaikan_prisoner"},
			FigureRespawn	{Tag = "MG_Pact_prisoner"},
			FigureRespawn	{Tag = "MG_Ork_prisoner"},
			
			FigureRespawn	{Tag = "prisone_Soldier_01"},
			FigureRespawn	{Tag = "prisone_Soldier_02"},
			FigureRespawn	{Tag = "prisone_Soldier_03"},
			FigureRespawn	{Tag = "prisone_Soldier_04"},
			FigureRespawn	{Tag = "prisone_Soldier_05"},
		},
	};


	
};