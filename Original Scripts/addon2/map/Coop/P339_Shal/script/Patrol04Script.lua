WP1X =  166 + XL
WP1Y =   28 + YL

WP2X =  146 + XU
WP2Y =  116 + YU

WP3X =  210 + XR
WP3Y =  156 + YR

WP4X =  308 + XD
WP4Y =  106 + YD
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