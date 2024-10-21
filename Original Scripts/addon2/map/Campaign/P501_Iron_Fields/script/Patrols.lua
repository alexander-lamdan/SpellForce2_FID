State
{
	StateName = "INIT",

	-- Patrol start
	OnOneTimeEvent
	{
		Conditions = 
		{
				MapFlagIsTrue {Name = "mf_P501_EndIntroCS"},
		},
		Actions =
		{
			FigureWalk	{Tag = "IF_NamelessPatrol_01_1", X = 350 , Y = 310 },
			FigureWalk	{Tag = "IF_NamelessPatrol_01_2", X = 350 , Y = 310 },
			MapFlagSetTrue {Name = "mf_P501_Patrol1Direction"},
			
			FigureWalk	{Tag = "IF_LionPatrol_01_1", X = 196 , Y = 266 },
			FigureWalk	{Tag = "IF_LionPatrol_01_2", X = 196 , Y = 266 },
			MapFlagSetTrue {Name = "mf_P501_Patrol2Direction"},
			
			FigureWalk	{Tag = "IF_WolfPatrol_01_1", X = 399 , Y = 44 },
			MapFlagSetTrue {Name = "mf_P501_Patrol3Direction"},
			
			FigureWalk	{Tag = "IF_BearPatrol_01_1", X = 281 , Y = 96 },
			MapFlagSetTrue {Name = "mf_P501_Patrol4Direction"},
		},
	},


	----------------------------------------------------
	-- Nameless Patrol 
	----------------------------------------------------

	-- Patrol 1 tower endpoint

	OnEvent
	{
		Conditions = 
		{
				MapFlagIsTrue {Name = "mf_P501_Patrol1Direction"},
				FigureIsInRange {Tag = "IF_NamelessPatrol_01_1", Range = 5, X = 350, Y = 310},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P501_Patrol1Direction"},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "IF_NamelessPatrol_01_1", X = 385, Y = 343}, 
					Points = 
					{
						"417, 368", 
						"439, 369", 
						"463, 389",
						"466, 410",
						"463, 429",
						"470, 441",
					},
				},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "IF_NamelessPatrol_01_2", X = 385, Y = 343}, 
					Points = 
					{
						"417, 368", 
						"439, 369", 
						"463, 389",
						"466, 410",
						"463, 429",
						"470, 441",
					},
				},
		},
	},
	
	-- Patrol 1 outpost endpoint

	OnEvent
	{
		Conditions = 
		{
				MapFlagIsFalse {Name = "mf_P501_Patrol1Direction"},
				FigureIsInRange {Tag = "IF_NamelessPatrol_01_1", Range = 5, X = 470, Y = 441},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P501_Patrol1Direction"},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk {Tag = "IF_NamelessPatrol_01_1", X = 463, Y = 429}, 
					Points = 
					{
						"466, 410",
						"463, 389",
						"439, 369",
						"417, 368", 
						"385, 343", 
						"350, 310",
					},
				},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk {Tag = "IF_NamelessPatrol_01_2", X = 463, Y = 429}, 
					Points = 
					{
						"466, 410",
						"463, 389",
						"439, 369",
						"417, 368", 
						"385, 343", 
						"350, 310",
					},
				},
		},
	},

	---------------------------------------------------
	-- Lion Patrol
	----------------------------------------------------
	-- Patrol 1 forest endpoint

	OnEvent
	{
		Conditions = 
		{
				MapFlagIsTrue {Name = "mf_P501_Patrol2Direction"},
				FigureIsInRange {Tag = "IF_LionPatrol_01_1", Range = 5, X = 196, Y = 266},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P501_Patrol2Direction"},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "IF_LionPatrol_01_1", X = 152, Y = 285}, 
					Points = 
					{
						"149, 312", 
						"166, 323", 
					},
				},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "IF_LionPatrol_01_2", X = 152, Y = 285}, 
					Points = 
					{
						"149, 312", 
						"166, 323",
					},
				},
		},
	},
	
	-- Patrol 1 heromonument endpoint

	OnEvent
	{
		Conditions = 
		{
				MapFlagIsFalse {Name = "mf_P501_Patrol2Direction"},
				FigureIsInRange {Tag = "IF_LionPatrol_01_1", Range = 5, X = 166, Y = 323},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P501_Patrol2Direction"},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk {Tag = "IF_LionPatrol_01_1", X = 191, Y = 308}, 
					Points = 
					{
						"219, 292",
						"196, 266",
					},
				},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk {Tag = "IF_LionPatrol_01_2", X = 191, Y = 308}, 
					Points = 
					{
						"219, 292",
						"196, 266",
					},
				},
		},
	},

	---------------------------------------------------
	-- Wolf Patrol
	----------------------------------------------------
	-- Patrol 1 forest endpoint

	OnEvent
	{
		Conditions = 
		{
				MapFlagIsTrue {Name = "mf_P501_Patrol3Direction"},
				FigureIsInRange {Tag = "IF_WolfPatrol_01_1", Range = 5, X = 399, Y = 44},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P501_Patrol3Direction"},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "IF_WolfPatrol_01_1", X = 394, Y = 28}, 
					Points = 
					{
						"344, 21", 
						"313, 29", 
						"288, 32", 
					},
				},
			
		},
	},
	
	-- Patrol 1 heromonument endpoint

	OnEvent
	{
		Conditions = 
		{
				MapFlagIsFalse {Name = "mf_P501_Patrol3Direction"},
				FigureIsInRange {Tag = "IF_WolfPatrol_01_1", Range = 5, X = 288, Y = 32},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P501_Patrol3Direction"},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk {Tag = "IF_WolfPatrol_01_1", X = 301, Y = 65}, 
					Points = 
					{
						"327, 54",
						"386, 56",
						"399, 44",
					},
				},
			
		},
	},
	
	---------------------------------------------------
	-- Bear Patrol
	----------------------------------------------------
	-- Patrol 1 forest endpoint

	OnEvent
	{
		Conditions = 
		{
				MapFlagIsTrue {Name = "mf_P501_Patrol4Direction"},
				FigureIsInRange {Tag = "IF_BearPatrol_01_1", Range = 5, X = 281, Y = 96},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P501_Patrol4Direction"},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "IF_BearPatrol_01_1", X = 224, Y = 68}, 
					Points = 
					{
						"193, 88",
						"210, 103", 
					},
				},
			
		},
	},
	
	-- Patrol 1 heromonument endpoint

	OnEvent
	{
		Conditions = 
		{
				MapFlagIsFalse {Name = "mf_P501_Patrol4Direction"},
				FigureIsInRange {Tag = "IF_BearPatrol_01_1", Range = 5, X = 210, Y = 103},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P501_Patrol4Direction"},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk {Tag = "IF_BearPatrol_01_1", X = 235, Y = 78}, 
					Points = 
					{
						"267, 103",
						"281, 96",
					},
				},
			
		},
	},
					
};