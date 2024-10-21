WP1X =  150 + XR
WP1Y =  333 + YR

WP2X =  202 + XD
WP2Y =  252 + YD

WP3X =  116 + XL
WP3Y =  185 + YL

WP4X =  71  + XU
WP4Y =  248 + YU
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