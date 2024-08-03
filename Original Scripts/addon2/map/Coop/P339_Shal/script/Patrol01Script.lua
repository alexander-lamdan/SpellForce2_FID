WP1X =  90  + X1
WP1Y =  56  + Y1

WP2X =  150 + X2
WP2Y =  115 + Y2

WP3X =  120 + X3
WP3Y =  185 + Y3

WP4X =  25  + X4
WP4Y =  160 + Y4
State
{
	StateName = "INIT",

	OnEvent
	{
		Conditions = 
		{
			FigureIsIdle	{Tag = "default"},
			FigureIsInRange	{Tag = "default", Range = 5, X = WP4X, Y = WP4Y},
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