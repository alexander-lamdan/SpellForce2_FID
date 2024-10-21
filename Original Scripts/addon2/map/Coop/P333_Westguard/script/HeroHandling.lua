State
{
	StateName = "PreINIT",

	OnOneTimeEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
			FigureDirectionSetToEntity	{TargetTag = "Halicos", Tag = "Hero_Adventurer1"},
			FigureDirectionSetToEntity	{TargetTag = "Halicos", Tag = "Hero_Adventurer2"},
			FigureDirectionSetToEntity	{TargetTag = "Halicos", Tag = "Hero_Adventurer3"},
			FigureDirectionSetToEntity	{TargetTag = "Halicos", Tag = "Hero_Adventurer4"},
			FigureDirectionSetToEntity	{TargetTag = "Halicos", Tag = "Hero_Adventurer5"},
			FigureDirectionSetToEntity	{TargetTag = "Halicos", Tag = "Hero_Warrior"},
			FigureDirectionSetToEntity	{TargetTag = "Halicos", Tag = "Hero_Healer"},
			FigureDirectionSetToEntity	{TargetTag = "Halicos", Tag = "Hero_Mage"},
			FigureDirectionSetToEntity	{TargetTag = "Halicos", Tag = "Hero_Assassin"},
			FigureDirectionSetToEntity	{TargetTag = "Halicos", Tag = "Hero_Archer"},
		},
	};
}
