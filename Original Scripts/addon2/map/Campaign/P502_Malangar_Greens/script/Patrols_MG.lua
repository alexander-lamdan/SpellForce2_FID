State
{
	StateName = "INIT",

	-- Patrol start
	OnOneTimeEvent
	{
		Conditions = 
		{
				MapFlagIsTrue	{Name = "mf_P502_EndCaineSarielCS"},
		},
		Actions =
		{
			FigureWalk	{Tag = "xp_ogre_01", X = 352 , Y = 557 },
			FigureWalk	{Tag = "xp_ogre_02", X = 352 , Y = 557 },
			FigureWalk	{Tag = "xp_ogre_04", X = 180 , Y = 415 },
			FigureWalk	{Tag = "xp_ogre_05", X = 180 , Y = 415 },
			FigureWalk	{Tag = "xp_ogre_06", X = 180 , Y = 415 },
			--FigureWalk	{Tag = "patrol_beast_01", X = 187, Y = 617 },
			--FigureWalk	{Tag = "patrol_beast_02", X = 219, Y = 666 },
			--FigureWalk	{Tag = "patrol_beast_03", X = 219, Y = 666 },
			MapFlagSetTrue {Name = "mf_P502_Patrol1Direction"},
			MapFlagSetTrue {Name = "mf_P502_Patrol2Direction"},
			MapFlagSetTrue {Name = "mf_P502_StartPatrols_beasts"},
			MapFlagSetTrue {Name = "mf_P502_StartPatrols_ogres2"},
			--MapFlagSetTrue {Name = "mf_P502_StartPatrols_nameless_village1"},
		},
	},


	----------------------------------------------------
	-- Ogre Patrol  1
	----------------------------------------------------

	-- Patrol 1 south endpoint

	OnEvent
	{
		Conditions = 
		{
				MapFlagIsTrue {Name = "mf_P502_Patrol1Direction"},
				FigureIsInRange {Tag = "xp_ogre_01", Range = 5, X = 352 , Y = 557 },
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P502_Patrol1Direction"},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "xp_ogre_01", X = 390, Y = 581}, 
					Points = 
					{
						"392, 613", 
						"364, 628",
						"368, 672",
					},
				},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "xp_ogre_02", X = 390, Y = 581}, 
					Points = 
					{
						"392, 613", 
						"364, 628",
						"368, 672",
					},
				},
		},
	},
	
	-- Patrol 1 north endpoint

	OnEvent
	{
		Conditions = 
		{
				MapFlagIsFalse {Name = "mf_P502_Patrol1Direction"},
				FigureIsInRange {Tag = "xp_ogre_01", Range = 5, X = 368 , Y = 672 },
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P502_Patrol1Direction"},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "xp_ogre_01", X = 337, Y = 666}, 
					Points = 
					{
						"341, 616", 
						"329, 593",
						"352, 557", 
					},
				},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "xp_ogre_02", X = 337, Y = 666}, 
					Points = 
					{
						"341, 616", 
						"329, 593",
						"352, 557", 
					},
				},
		},
	},
	----------------------------------------------------
	-- Beast Patrol  1
	----------------------------------------------------
	-- Beast patrol 1 south endpoint
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P502_StartPatrols_beasts"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P502_StartPatrols_beasts"},
			--FigureStop	{Tag = "patrol_beast_01"},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "patrol_beast_01", X = 219, Y = 666}, 
					Points = 
					{
						"267, 670", 
						"285, 666",
						"281, 651",
						"245, 631",
						"231, 610",
						"187, 617",
						"187, 644",
						"219, 666",
					},
				},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "patrol_beast_02", X = 219, Y = 666}, 
					Points = 
					{
						"267, 670", 
						"285, 666",
						"281, 651",
						"245, 631",
						"231, 610",
						"187, 617",
						"187, 644",
						"219, 666",
					},
				},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "patrol_beast_03", X = 219, Y = 666}, 
					Points = 
					{
						"267, 670", 
						"285, 666",
						"281, 651",
						"245, 631",
						"231, 610",
						"187, 617",
						"187, 644",
						"219, 666",
					},
				},
		},
	},
	----------------------------------------------------
	-- Ogre Patrol  2
	----------------------------------------------------
	-- Patrol 2 south endpoint
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P502_StartPatrols_ogres2"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P502_StartPatrols_ogres2"},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "xp_ogre_04", X = 180, Y = 415}, 
					Points = 
					{
						"163, 394", 
						"161, 372", 
						"224, 364",
						"243, 380",
						"270, 385",
						"271, 395",
						"218, 418",
						"180, 415",						
					},
				},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "xp_ogre_05", X = 180, Y = 415}, 
					Points = 
					{
						"163, 394", 
						"161, 372", 
						"224, 364",
						"243, 380",
						"270, 385",
						"271, 395",
						"218, 418",
						"180, 415",						
					},
				},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "xp_ogre_06", X = 180, Y = 415}, 
					Points = 
					{
						"163, 394", 
						"161, 372", 
						"224, 364",
						"243, 380",
						"270, 385",
						"271, 395",
						"218, 418",
						"180, 415",						
					},
				},
		},
	},
	----------------------------------------------------
	-- Nameless Village Patrol  1
	----------------------------------------------------
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P502_StartPatrols_nameless_village1"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P502_StartPatrols_nameless_village1"},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "MG_Village_Demonic_Warrior_07", X = 429, Y = 471}, 
					Points = 
					{
						"425, 443", 
						"452, 415", 
					},
				},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "MG_Village_Demonic_Warrior_06", X = 429, Y = 471}, 
					Points = 
					{
						"425, 443", 
						"452, 415", 
					},
				},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "MG_out_Village_Spike_01", X = 429, Y = 471}, 
					Points = 
					{
						"425, 443", 
						"452, 415", 
					},
				},
		},
	},
	----------------------------------------------------
	-- Nameless Village Patrol  1
	----------------------------------------------------
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P502_StartPatrols_nameless_village2"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P502_StartPatrols_nameless_village2"},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "MG_Village_Chosen_04", X = 464, Y = 485}, 
					Points = 
					{
						"499, 488", 
						"522, 523", 
					},
				},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "MG_out_Village_Chosen_01", X = 464, Y = 485}, 
					Points = 
					{
						"499, 488", 
						"522, 523", 
					},
				},
		},
	},
}