WP1X =  270 + XU
WP1Y =  194 + YU

WP2X =  200 + XL
WP2Y =  235 + YL

WP3X =  120 + XD
WP3Y =  190 + YD

WP4X =  194 + XR
WP4Y =  158 + YR
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