State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
			FigureNpcSpawnToEntity	{Tag = "Egg1", Level = 10, UnitId = 1719 , TargetTag = "D_egg_1", Team = "tm_Team 2"},
			FigureNpcSpawnToEntity	{Tag = "Egg2", Level = 10, UnitId = 1719 , TargetTag = "D_egg_2", Team = "tm_Team 2"},
			FigureNpcSpawnToEntity	{Tag = "Egg3", Level = 10, UnitId = 1719 , TargetTag = "D_egg_3", Team = "tm_Team 2"},
			FigureNpcSpawnToEntity	{Tag = "Egg4", Level = 10, UnitId = 1719 , TargetTag = "D_egg_4", Team = "tm_Team 2"},
			FigureNpcSpawnToEntity	{Tag = "Egg5", Level = 10, UnitId = 1719 , TargetTag = "D_egg_5", Team = "tm_Team 2"},
			FigureNpcSpawnToEntity	{Tag = "Egg6", Level = 10, UnitId = 1719 , TargetTag = "D_egg_6", Team = "tm_Team 2"},
		},
		GotoState = "Spawned",
	};
};

State
{
	StateName = "Spawned",
	OnOneTimeEvent 
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Egg1"},
		},
		Actions =
		{
			EffectStartAtEntityPositionAddon2	{Tag = "D_egg_1", File = "Effect_Demonic_Egg"},
		},
	},
	
	OnOneTimeEvent 
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Egg2"},
		},
		Actions =
		{
			EffectStartAtEntityPositionAddon2	{Tag = "D_egg_2", File = "Effect_Demonic_Egg"},
		},
	},
	
	OnOneTimeEvent 
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Egg3"},
		},
		Actions =
		{
			EffectStartAtEntityPositionAddon2	{Tag = "D_egg_3", File = "Effect_Demonic_Egg"},
		},
	},
	
	OnOneTimeEvent 
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Egg4"},
		},
		Actions =
		{
			EffectStartAtEntityPositionAddon2	{Tag = "D_egg_4", File = "Effect_Demonic_Egg"},
		},
	},
	
	OnOneTimeEvent 
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Egg5"},
		},
		Actions =
		{
			EffectStartAtEntityPositionAddon2	{Tag = "D_egg_5", File = "Effect_Demonic_Egg"},
		},
	},
	
	OnOneTimeEvent 
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Egg6"},
		},
		Actions =
		{
			EffectStartAtEntityPositionAddon2	{Tag = "D_egg_6", File = "Effect_Demonic_Egg"},
		},
	},
}
