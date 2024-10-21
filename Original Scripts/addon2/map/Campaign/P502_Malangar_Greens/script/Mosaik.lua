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
			FigureVanish	{Tag = "MosaicSpawn101"},
			FigureVanish	{Tag = "MosaicSpawn102"},
			FigureVanish	{Tag = "MosaicSpawn103"},
			FigureVanish	{Tag = "MosaicSpawn104"},
			FigureVanish	{Tag = "MosaicSpawn105"},
			FigureVanish	{Tag = "MosaicSpawn106"},
			FigureVanish	{Tag = "MosaicSpawn107"},
			
			FigureVanish	{Tag = "MosaicSpawn201"},
			FigureVanish	{Tag = "MosaicSpawn202"},
			FigureVanish	{Tag = "MosaicSpawn203"},
			FigureVanish	{Tag = "MosaicSpawn204"},
			FigureVanish	{Tag = "MosaicSpawn205"},
			FigureVanish	{Tag = "MosaicSpawn206"},
			FigureVanish	{Tag = "MosaicSpawn207"},
			FigureVanish	{Tag = "MosaicSpawn208"},
			FigureVanish	{Tag = "MosaicSpawn209"},
			FigureVanish	{Tag = "MosaicSpawn210"},
			FigureVanish	{Tag = "MosaicSpawn211"},
			FigureVanish	{Tag = "MosaicSpawn212"},

			FigureVanish	{Tag = "MosaicSpawn301"},
			FigureVanish	{Tag = "MosaicSpawn302"},
			FigureVanish	{Tag = "MosaicSpawn303"},
			FigureVanish	{Tag = "MosaicSpawn304"},
			FigureVanish	{Tag = "MosaicSpawn305"},
			FigureVanish	{Tag = "MosaicSpawn306"},
			FigureVanish	{Tag = "MosaicSpawn307"},
			FigureVanish	{Tag = "MosaicSpawn308"},
			FigureVanish	{Tag = "MosaicSpawn309"},
			FigureVanish	{Tag = "MosaicSpawn310"},
			FigureVanish	{Tag = "MosaicSpawn311"},
			FigureVanish	{Tag = "MosaicSpawn312"},
			FigureVanish	{Tag = "MosaicSpawn313"},
			FigureVanish	{Tag = "MosaicSpawn314"},
			FigureVanish	{Tag = "MosaicSpawn315"},
			FigureVanish	{Tag = "MosaicSpawn316"},
			FigureVanish	{Tag = "MosaicSpawn317"},
			FigureVanish	{Tag = "MosaicSpawn318"},
			FigureVanish	{Tag = "MosaicSpawn319"},
			FigureVanish	{Tag = "MosaicSpawn320"},
			--FigureVanish	{Tag = "MosaicSpawn321"},
			--FigureVanish	{Tag = "MosaicSpawn322"},
			
			FigureVanish	{Tag = "MosaicSpawn401"},
			FigureVanish	{Tag = "MosaicSpawn402"},
			FigureVanish	{Tag = "MosaicSpawn403"},
			FigureVanish	{Tag = "MosaicSpawn404"},
			FigureVanish	{Tag = "MosaicSpawn405"},
			FigureVanish	{Tag = "MosaicSpawn406"},
			FigureVanish	{Tag = "MosaicSpawn407"},
			FigureVanish	{Tag = "MosaicSpawn408"},
			FigureVanish	{Tag = "MosaicSpawn409"},
			FigureVanish	{Tag = "MosaicSpawn410"},
			FigureVanish	{Tag = "MosaicSpawn411"},
			FigureVanish	{Tag = "MosaicSpawn412"},
			FigureVanish	{Tag = "MosaicSpawn413"},
			FigureVanish	{Tag = "MosaicSpawn414"},
			FigureVanish	{Tag = "MosaicSpawn415"},
			FigureVanish	{Tag = "MosaicSpawn416"},
			FigureVanish	{Tag = "MosaicSpawn417"},
			FigureVanish	{Tag = "MosaicSpawn418"},
			FigureVanish	{Tag = "MosaicSpawn419"},
			FigureVanish	{Tag = "MosaicSpawn420"},
			FigureVanish	{Tag = "MosaicSpawn421"},
			FigureVanish	{Tag = "MosaicSpawn422"},
			
			
			FigureVanish	{Tag = "MosaicMaster"},
			
		},
	};
	
OnOneTimeEvent
	{		
		Conditions = 
		{
			AvatarValueIsEqual	{Name = "av_P502_MosaicOfDeath", Value = 1 },			
		},
		Actions = 
		{
			FigureRespawn	{Tag = "MosaicSpawn101", X = 663, Y = 305},
			FigureRespawn	{Tag = "MosaicSpawn102", X = 662, Y = 309},
			FigureRespawn	{Tag = "MosaicSpawn103", X = 655, Y = 296},
			FigureRespawn	{Tag = "MosaicSpawn104", X = 644, Y = 295},
			FigureRespawn	{Tag = "MosaicSpawn105", X = 637, Y = 303},
			FigureRespawn	{Tag = "MosaicSpawn106", X = 638, Y = 312},
			FigureRespawn	{Tag = "MosaicSpawn107", X = 649, Y = 301},
			},
	};

OnOneTimeEvent
	{		
		Conditions = 
		{
			AvatarValueIsEqual	{Name = "av_P502_MosaicOfDeath", Value = 2 },			
		},
		Actions = 
		{
			FigureRespawn	{Tag = "MosaicSpawn201", X = 663, Y = 305},
			FigureRespawn	{Tag = "MosaicSpawn202", X = 662, Y = 309},
			FigureRespawn	{Tag = "MosaicSpawn203", X = 655, Y = 296},
			FigureRespawn	{Tag = "MosaicSpawn201", X = 644, Y = 295},			
			FigureRespawn	{Tag = "MosaicSpawn204", X = 637, Y = 303},
			FigureRespawn	{Tag = "MosaicSpawn205", X = 638, Y = 312},
			FigureRespawn	{Tag = "MosaicSpawn206", X = 639, Y = 313},
			FigureRespawn	{Tag = "MosaicSpawn207", X = 646, Y = 313},
			FigureRespawn	{Tag = "MosaicSpawn208", X = 642, Y = 313},
			FigureRespawn	{Tag = "MosaicSpawn209", X = 656, Y = 315},
			FigureRespawn	{Tag = "MosaicSpawn210", X = 639, Y = 298},
			FigureRespawn	{Tag = "MosaicSpawn211", X = 651, Y = 295},
			FigureRespawn	{Tag = "MosaicSpawn212", X = 652, Y = 295},
		},
	};
	
	OnOneTimeEvent
	{		
		Conditions = 
		{
			AvatarValueIsEqual	{Name = "av_P502_MosaicOfDeath", Value = 3 },			
		},
		Actions = 
		{
			FigureRespawn	{Tag = "MosaicSpawn301", X = 663, Y = 305},
			FigureRespawn	{Tag = "MosaicSpawn302", X = 662, Y = 307},
			FigureRespawn	{Tag = "MosaicSpawn303", X = 655, Y = 296},
			FigureRespawn	{Tag = "MosaicSpawn304", X = 657, Y = 297},			
			FigureRespawn	{Tag = "MosaicSpawn305", X = 638, Y = 303},
			FigureRespawn	{Tag = "MosaicSpawn306", X = 637, Y = 301},
			FigureRespawn	{Tag = "MosaicSpawn307", X = 646, Y = 313},
			FigureRespawn	{Tag = "MosaicSpawn308", X = 645, Y = 311},			
			FigureRespawn	{Tag = "MosaicSpawn309", X = 656, Y = 315},
			FigureRespawn	{Tag = "MosaicSpawn310", X = 657, Y = 313},
			
			
			FigureRespawn	{Tag = "MosaicSpawn311", X = 651, Y = 295},		
			FigureRespawn	{Tag = "MosaicSpawn312", X = 652, Y = 296},
			FigureRespawn	{Tag = "MosaicSpawn313", X = 639, Y = 298},
			FigureRespawn	{Tag = "MosaicSpawn314", X = 640, Y = 299},
			FigureRespawn	{Tag = "MosaicSpawn315", X = 650, Y = 301},		
			FigureRespawn	{Tag = "MosaicSpawn316", X = 649, Y = 303},
			FigureRespawn	{Tag = "MosaicSpawn317", X = 642, Y = 313},
			FigureRespawn	{Tag = "MosaicSpawn318", X = 644, Y = 316},
			FigureRespawn	{Tag = "MosaicSpawn319", X = 646, Y = 295},			
			FigureRespawn	{Tag = "MosaicSpawn320", X = 648, Y = 296},
			--FigureRespawn	{Tag = "MosaicSpawn321"},
			--FigureRespawn	{Tag = "MosaicSpawn322"},			
		},
	};


OnOneTimeEvent
	{		
		Conditions = 
		{
			AvatarValueIsEqual	{Name = "av_P502_MosaicOfDeath", Value = 4 },			
		},
		Actions = 
		{
		
			FigureRespawn	{Tag = "MosaicSpawn401", X = 663, Y = 305},
			FigureRespawn	{Tag = "MosaicSpawn402", X = 662, Y = 307},
			FigureRespawn	{Tag = "MosaicSpawn403", X = 655, Y = 296},
			FigureRespawn	{Tag = "MosaicSpawn404", X = 657, Y = 297},			
			FigureRespawn	{Tag = "MosaicSpawn405", X = 638, Y = 303},
			FigureRespawn	{Tag = "MosaicSpawn406", X = 637, Y = 301},
			FigureRespawn	{Tag = "MosaicSpawn407", X = 646, Y = 313},
			FigureRespawn	{Tag = "MosaicSpawn408", X = 645, Y = 311},			
			FigureRespawn	{Tag = "MosaicSpawn409", X = 656, Y = 315},
			FigureRespawn	{Tag = "MosaicSpawn410", X = 657, Y = 313},
			
			FigureRespawn	{Tag = "MosaicSpawn411", X = 651, Y = 295},		
			FigureRespawn	{Tag = "MosaicSpawn412", X = 652, Y = 296},
			FigureRespawn	{Tag = "MosaicSpawn413", X = 639, Y = 298},
			FigureRespawn	{Tag = "MosaicSpawn414", X = 640, Y = 299},
			FigureRespawn	{Tag = "MosaicSpawn415", X = 650, Y = 301},		
			FigureRespawn	{Tag = "MosaicSpawn416", X = 649, Y = 303},
			FigureRespawn	{Tag = "MosaicSpawn417", X = 642, Y = 313},
			FigureRespawn	{Tag = "MosaicSpawn418", X = 644, Y = 316},
			FigureRespawn	{Tag = "MosaicSpawn419", X = 646, Y = 295},			
			FigureRespawn	{Tag = "MosaicSpawn420", X = 648, Y = 296},
			
			FigureRespawn	{Tag = "MosaicSpawn421", X = 655, Y = 315},
			FigureRespawn	{Tag = "MosaicSpawn422", X = 656, Y = 314},
			FigureRespawn	{Tag = "MosaicSpawn423", X = 658, Y = 308},
			FigureRespawn	{Tag = "MosaicSpawn424", X = 658, Y = 299},
			FigureRespawn	{Tag = "MosaicSpawn425", X = 659, Y = 300},
			
			FigureRespawn	{Tag = "MosaicMaster", X = 648, Y = 302},
		},
	};

OnOneTimeEvent
	{		
		Conditions = 
		{
			AvatarValueIsEqual	{Name = "av_P502_MosaicOfDeath", Value = 4 },
			
			FigureIsDead	{Tag = "MosaicSpawn401"},
			FigureIsDead	{Tag = "MosaicSpawn402"},
			FigureIsDead	{Tag = "MosaicSpawn403"},			
			FigureIsDead	{Tag = "MosaicSpawn404"},
			FigureIsDead	{Tag = "MosaicSpawn405"},
			FigureIsDead	{Tag = "MosaicSpawn406"},
			FigureIsDead	{Tag = "MosaicSpawn407"},
			FigureIsDead	{Tag = "MosaicSpawn408"},
			FigureIsDead	{Tag = "MosaicSpawn409"},
			FigureIsDead	{Tag = "MosaicSpawn410"},			
			
			FigureIsDead	{Tag = "MosaicSpawn411"},
			FigureIsDead	{Tag = "MosaicSpawn412"},
			FigureIsDead	{Tag = "MosaicSpawn413"},
			FigureIsDead	{Tag = "MosaicSpawn414"},
			FigureIsDead	{Tag = "MosaicSpawn415"},
			FigureIsDead	{Tag = "MosaicSpawn416"},
			FigureIsDead	{Tag = "MosaicSpawn417"},			
			FigureIsDead	{Tag = "MosaicSpawn418"},
			FigureIsDead	{Tag = "MosaicSpawn419"},
			FigureIsDead	{Tag = "MosaicSpawn420"},
			
			FigureIsDead	{Tag = "MosaicSpawn421"},
			FigureIsDead	{Tag = "MosaicSpawn422"},
			FigureIsDead	{Tag = "MosaicSpawn423"},
			FigureIsDead	{Tag = "MosaicSpawn424"},
			FigureIsDead	{Tag = "MosaicSpawn425"},
			
			FigureIsDead	{Tag = "MosaicMaster"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_P502_MosaicofDeathComplete"},
		},		
	};
	
};