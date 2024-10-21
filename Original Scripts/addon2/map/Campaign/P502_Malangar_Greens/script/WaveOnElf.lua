State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_AttackElfBase"},			
		},
		Actions =
		{
			FigureTeamTransfer	{ Team = "tm_Team2"},
			--FigureAttackEntity	{TargetTag = target},		
			FigureRunToEntity	{TargetTag = "To_The_Elves"},
			EffectStartAtEntityPosition {File = "Effect_Spawn_Unit"},
		},
		NoSpawnEffect = true,
	};	
	
};