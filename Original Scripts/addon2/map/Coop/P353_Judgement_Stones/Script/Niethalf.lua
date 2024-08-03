
State
{
	StateName = "MainState",
	OnFigureSpawnOnlyWhenEvent
	{
		X = 485.9,
		Y = 504,
		NoSpawnEffect = true,
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_Spawn_Niethalf"},
		},
		Actions = 
		{
			FigureLookAtDirection {Tag = "default", Direction = 180},
			FigureCutsceneTalkJobSet {Tag = "default"},
			CutsceneFigureWeaponsHide {Tag = "default"},
		},
	},

};
