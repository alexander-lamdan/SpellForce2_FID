State
{
	StateName = "INIT",

	-- Patrol start
	OnOneTimeEvent
	{
		Conditions = 
		{
		
		},
		Actions =
		{
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "nightwing_01", X = 100, Y = 70}, 
					Points = 
					{
						"78, 82", 
						"92, 133",
						"123, 130",
					},
				},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "nightwing_02", X = 100, Y = 70}, 
					Points = 
					{
						"78, 82", 
						"92, 133",
						"123, 130",
					},
				},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "nightwing_03", X = 100, Y = 70}, 
					Points = 
					{
						"78, 82", 
						"92, 133",
						"123, 130",
					},
				},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "nightwing_04", X = 100, Y = 70}, 
					Points = 
					{
						"78, 82", 
						"92, 133",
						"123, 130",
					},
				},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "nameless_pat_01", X = 330, Y = 295}, 
					Points = 
					{
						"305, 271", 
						"280, 228", 
					},
				},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "nameless_pat_02", X = 330, Y = 295}, 
					Points = 
					{
						"306, 272", 
						"280, 230", 
					},
				},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "nameless_pat_03", X = 330, Y = 295}, 
					Points = 
					{
						"304, 270", 
						"281, 230", 
					},
				},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "nameless_pat_04", X = 330, Y = 295}, 
					Points = 
					{
						"306, 274", 
						"280, 231", 
					},
				},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "nameless_pat_05", X = 330, Y = 295}, 
					Points = 
					{
						"304, 272", 
						"279, 229", 
					},
				},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "nameless_pat_06", X = 330, Y = 295}, 
					Points = 
					{
						"304, 271", 
						"280, 232", 
					},
				},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "Offender1", X = 561, Y = 352}, 
					Points = 
					{
						"505, 350", 
					},
				},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "titan_01", X = 526, Y = 379}, 
					Points = 
					{
						"529, 338", 
					},
				},
			FigurePathGoto
				{
					Goto = FigurePatrolWalk{Tag = "titan_02", X = 539, Y = 273}, 
					Points = 
					{
						"533, 316", 
					},
				},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P504_WizardsDead"},
		},
		Actions =
		{
			FigurePathGoto
			{
				Goto = FigurePatrolWalk{Tag = "WL_dragon_egg_01", X = 433, Y = 337}, 
				Points = 
				{
					"380, 366", 
					"327, 365", 
					"361, 333",
					"442, 337",
				},
			},
			FigurePathGoto
			{
				Goto = FigurePatrolWalk{Tag = "WL_dragon_egg_02", X = 434, Y = 369}, 
				Points = 
				{
					"414, 362", 
					"333, 396", 
					"354, 439",
					"443, 373",
				},
			},
		},
	},

}