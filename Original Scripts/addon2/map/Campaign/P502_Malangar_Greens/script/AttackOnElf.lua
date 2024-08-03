State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P502_AttackElfCamp"},	
		},
		Actions =
		{
			FigureTeamTransfer	{ Team = "tm_Team2"},
			FigureForceAttackEntity	{TargetTag = "a10"},
			MapFlagSetTrue	{Name = "mf_P502_AttackOnElfStarted"},
		},
		NoSpawnEffect = true,
	};	
	
};