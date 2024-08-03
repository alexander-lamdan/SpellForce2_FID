WP1X =  270 + XD
WP1Y =  195 + YD

WP2X =  230 + XR
WP2Y =  275 + YR

WP3X =  325 + XU
WP3Y =  185 + YU

WP4X =  229 + XL
WP4Y =  275 + YL
State
{
	StateName = "INIT",
	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "default"},
			FigureIsInRange	{Tag = "default", Range = 10, X = WP4X, Y = WP4Y},
		},
		Actions = 
		{
			FigurePathGoto
			{
				Goto = FigureWalk {Tag = "default", X = WP1X, Y = WP1Y}, 
				Points = 
				{
					--WP1X ..", ".. WP1Y,
					WP2X ..", ".. WP2Y,
					WP3X ..", ".. WP3Y,
					WP4X ..", ".. WP4Y,
				},
			},
		},
	};
};