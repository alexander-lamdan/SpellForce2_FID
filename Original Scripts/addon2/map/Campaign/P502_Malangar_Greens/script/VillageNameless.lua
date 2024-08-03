State
{
	StateName = "INIT",
		
		
		{
		Conditions = 
		{
			
		},
		Actions = 
		{
			
		  FigureVanish{Tag = "MG_Village_Demonic_Warrior_01"},
			FigureVanish{Tag = "MG_Village_Demonic_Warrior_02"},
			FigureVanish{Tag = "MG_Village_Demonic_Warrior_03"},
			FigureVanish{Tag = "MG_Village_Demonic_Warrior_04"},
			FigureVanish{Tag = "MG_Village_Demonic_Warrior_05"},
			FigureVanish{Tag = "MG_Village_Demonic_Warrior_06"},
			FigureVanish{Tag = "MG_Village_Demonic_Warrior_07"},
			FigureVanish{Tag = "MG_Village_Demonic_Warrior_08"},
			
			FigureVanish{Tag = "MG_Village_Chosen_01"},
			FigureVanish{Tag = "MG_Village_Chosen_02"},
			FigureVanish{Tag = "MG_Village_Chosen_03"},
			FigureVanish{Tag = "MG_Village_Chosen_04"},
			FigureVanish{Tag = "MG_Village_Chosen_05"},
			FigureVanish{Tag = "MG_Village_Chosen_06"},
			FigureVanish{Tag = "MG_Village_Chosen_07"},
			FigureVanish{Tag = "MG_Village_Chosen_08"},
			
			FigureVanish{Tag = "MG_Village_Spike_01"},
			FigureVanish{Tag = "MG_Village_Spike_02"},
			FigureVanish{Tag = "MG_Village_Spike_03"},
						
			FigureVanish{Tag = "MG_Village_Mage"},
		},		
	};
		
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "MG_KNOWYOURENEMY"},
		},
		Actions = 
		{
			
			NoSpawnEffect	{Spawn = FigureRespawn	{Tag = "MG_Village_Demonic_Warrior_01"},},
			NoSpawnEffect	{Spawn = FigureRespawn	{Tag = "MG_Village_Demonic_Warrior_02"},},
			NoSpawnEffect	{Spawn = FigureRespawn	{Tag = "MG_Village_Demonic_Warrior_03"},},
			NoSpawnEffect	{Spawn = FigureRespawn	{Tag = "MG_Village_Demonic_Warrior_04"},},
			NoSpawnEffect	{Spawn = FigureRespawn	{Tag = "MG_Village_Demonic_Warrior_05"},},
			NoSpawnEffect	{Spawn = FigureRespawn	{Tag = "MG_Village_Demonic_Warrior_06"},},
			NoSpawnEffect	{Spawn = FigureRespawn	{Tag = "MG_Village_Demonic_Warrior_07"},},
			NoSpawnEffect	{Spawn = FigureRespawn	{Tag = "MG_Village_Demonic_Warrior_08"},},
			
			NoSpawnEffect	{Spawn = FigureRespawn	{Tag = "MG_Village_Chosen_01"},},
			NoSpawnEffect	{Spawn = FigureRespawn	{Tag = "MG_Village_Chosen_02"},},
			NoSpawnEffect	{Spawn = FigureRespawn	{Tag = "MG_Village_Chosen_03"},},
			NoSpawnEffect	{Spawn = FigureRespawn	{Tag = "MG_Village_Chosen_04"},},
			NoSpawnEffect	{Spawn = FigureRespawn	{Tag = "MG_Village_Chosen_05"},},
			NoSpawnEffect	{Spawn = FigureRespawn	{Tag = "MG_Village_Chosen_06"},},
			NoSpawnEffect	{Spawn = FigureRespawn	{Tag = "MG_Village_Chosen_07"},},
			NoSpawnEffect	{Spawn = FigureRespawn	{Tag = "MG_Village_Chosen_08"},},
			
			NoSpawnEffect	{Spawn = FigureRespawn	{Tag = "MG_Village_Spike_01"},},
			NoSpawnEffect	{Spawn = FigureRespawn	{Tag = "MG_Village_Spike_02"},},
			NoSpawnEffect	{Spawn = FigureRespawn	{Tag = "MG_Village_Spike_03"},},
						
			NoSpawnEffect	{Spawn = FigureRespawn	{Tag = "MG_Village_Mage"},},
			MapFlagSetTrue	{Name = "mf_P502_VillageNamelessSpawned"},
		},		
	};
	
}