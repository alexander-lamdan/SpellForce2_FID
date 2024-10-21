State
{
	StateName = "INIT",

	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
		FigureIsDead	{Tag = "xp_mob_08"},
		OR{
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "trigger_01", Range = 8 },
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroCaine", TargetTag = "trigger_01", Range = 8 },
			FigureIsInRangeToEntity	{Tag = "pl_HumanHeroSariel", TargetTag = "trigger_01", Range = 8 },
			},
		},
		Actions = 
		{
			FigureForcedSimpleRunToEntity{TargetTag = "dugut_ambush_marker"},
			
		},
		DelayedActions = 
		{
		},
		NoSpawnEffect = false,
	};
}