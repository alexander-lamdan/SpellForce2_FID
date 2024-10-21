State
{
	StateName = "Avatar1",
	--------------------------------------
	-- Conditions für Cutscene Avatar01 --
	--------------------------------------
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_MarketplaceReached"},
			CoopPlayerIsPlaying	{Player = "pl_Human1"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_Cutscene01Avatar01"},
		},
		GotoState = "ScriptEnd",
	},
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_MarketplaceReached"},
			CoopPlayerIsPlaying	{Player = "pl_Human2"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_Cutscene01Avatar02"},
		},
		GotoState = "ScriptEnd",
	},
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_MarketplaceReached"},
			CoopPlayerIsPlaying	{Player = "pl_Human3"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_Cutscene01Avatar03"},
		},
		GotoState = "ScriptEnd",
	},
};

State
{
	StateName = "ScriptEnd",
};