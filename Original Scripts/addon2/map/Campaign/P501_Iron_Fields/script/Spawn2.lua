State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_BackToElleKillHer"},
		},
		Actions = 
		{
			FigureTeamTransfer {Team = "tm_Team2"},
			FigureAttackEntity {TargetTag = "pl_HumanAvatar"},
		},
		NoSpawnEffect = true,
	};
}