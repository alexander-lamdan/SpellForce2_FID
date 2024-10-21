
State
{
	StateName = "MainState",
	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(), -- 484.214
		Y = GetEntityY(), -- 501.024
		NoSpawnEffect = true,
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_Spawn_Truchsess"},
		},
		Actions = 
		{
			FigureLookAtDirection {Tag = "default", Direction = 308.434},
			FigureCutsceneTalkJobSet {Tag = "default"},
		},
	},

};
