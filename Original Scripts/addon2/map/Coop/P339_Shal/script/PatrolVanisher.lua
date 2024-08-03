State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				AND
				{
					CoopPlayerIsPlaying 	{Player = "pl_Human1"},
					CoopPlayerIsNotPlaying 	{Player = "pl_Human2"},
					CoopPlayerIsNotPlaying 	{Player = "pl_Human3"},
				},
				AND
				{
					CoopPlayerIsPlaying 	{Player = "pl_Human2"},
					CoopPlayerIsNotPlaying 	{Player = "pl_Human1"},
					CoopPlayerIsNotPlaying 	{Player = "pl_Human3"},
				},
				AND
				{
					CoopPlayerIsPlaying 	{Player = "pl_Human3"},
					CoopPlayerIsNotPlaying 	{Player = "pl_Human1"},
					CoopPlayerIsNotPlaying 	{Player = "pl_Human2"},
				},
			},
		},
		Actions =
		{
			-- Patrol 1
			
			FigureVanish {Tag = "Patrol01Guard07"},
			FigureVanish {Tag = "Patrol01Guard08"},
			FigureVanish {Tag = "Patrol01Guard09"},
			FigureVanish {Tag = "Patrol01Guard10"},
			FigureVanish {Tag = "Patrol01Guard11"},
			FigureVanish {Tag = "Patrol01Guard12"},
			FigureVanish {Tag = "Patrol01Guard13"},
			FigureVanish {Tag = "Patrol01Guard14"},
			FigureVanish {Tag = "Patrol01Guard15"},
						
			-- Patrol 2
			
			FigureVanish {Tag = "Patrol02Guard07"},
			FigureVanish {Tag = "Patrol02Guard08"},
			FigureVanish {Tag = "Patrol02Guard09"},
			FigureVanish {Tag = "Patrol02Guard10"},
			FigureVanish {Tag = "Patrol02Guard11"},
			FigureVanish {Tag = "Patrol02Guard12"},
			FigureVanish {Tag = "Patrol02Guard13"},
			FigureVanish {Tag = "Patrol02Guard14"},
			FigureVanish {Tag = "Patrol02Guard15"},
			
			-- Patrol 3
			
			FigureVanish {Tag = "Patrol03Guard07"},
			FigureVanish {Tag = "Patrol03Guard08"},
			FigureVanish {Tag = "Patrol03Guard09"},
			FigureVanish {Tag = "Patrol03Guard10"},
			FigureVanish {Tag = "Patrol03Guard11"},
			FigureVanish {Tag = "Patrol03Guard12"},
			FigureVanish {Tag = "Patrol03Guard13"},
			FigureVanish {Tag = "Patrol03Guard14"},
			FigureVanish {Tag = "Patrol03Guard15"},
			
			-- Patrol 4
			
			FigureVanish {Tag = "Patrol04Guard07"},
			FigureVanish {Tag = "Patrol04Guard08"},
			FigureVanish {Tag = "Patrol04Guard09"},
			FigureVanish {Tag = "Patrol04Guard10"},
			FigureVanish {Tag = "Patrol04Guard11"},
			FigureVanish {Tag = "Patrol04Guard12"},
			FigureVanish {Tag = "Patrol04Guard13"},
			FigureVanish {Tag = "Patrol04Guard14"},
			FigureVanish {Tag = "Patrol04Guard15"},
			
			-- Patrol 5
			
			FigureVanish {Tag = "Patrol05Guard07"},
			FigureVanish {Tag = "Patrol05Guard08"},
			FigureVanish {Tag = "Patrol05Guard09"},
			FigureVanish {Tag = "Patrol05Guard10"},
			FigureVanish {Tag = "Patrol05Guard11"},
			FigureVanish {Tag = "Patrol05Guard12"},
			FigureVanish {Tag = "Patrol05Guard13"},
			FigureVanish {Tag = "Patrol05Guard14"},
			FigureVanish {Tag = "Patrol05Guard15"},
			
		},
	}, 
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				AND
				{
					CoopPlayerIsPlaying 	{Player = "pl_Human1"},
					CoopPlayerIsPlaying 	{Player = "pl_Human2"},
					CoopPlayerIsNotPlaying 	{Player = "pl_Human3"},
				},
				AND
				{
					CoopPlayerIsPlaying 	{Player = "pl_Human1"},
					CoopPlayerIsPlaying 	{Player = "pl_Human3"},
					CoopPlayerIsNotPlaying 	{Player = "pl_Human2"},
				},
				AND
				{
					CoopPlayerIsPlaying 	{Player = "pl_Human2"},
					CoopPlayerIsPlaying 	{Player = "pl_Human3"},
					CoopPlayerIsNotPlaying 	{Player = "pl_Human1"},
				},
			},			
		},
		Actions =
		{
						-- Patrol 1
			
			FigureVanish {Tag = "Patrol01Guard13"},
			FigureVanish {Tag = "Patrol01Guard14"},
			FigureVanish {Tag = "Patrol01Guard15"},
			
			-- Patrol 2
			
			FigureVanish {Tag = "Patrol02Guard13"},
			FigureVanish {Tag = "Patrol02Guard14"},
			FigureVanish {Tag = "Patrol02Guard15"},
			
			-- Patrol 3
			
			FigureVanish {Tag = "Patrol03Guard13"},
			FigureVanish {Tag = "Patrol03Guard14"},
			FigureVanish {Tag = "Patrol03Guard15"},
			
			-- Patrol 4
			
			FigureVanish {Tag = "Patrol04Guard13"},
			FigureVanish {Tag = "Patrol04Guard14"},
			FigureVanish {Tag = "Patrol04Guard15"},
			
			-- Patrol 5
			
			FigureVanish {Tag = "Patrol05Guard13"},
			FigureVanish {Tag = "Patrol05Guard14"},
			FigureVanish {Tag = "Patrol05Guard15"},
		},
	},
};
