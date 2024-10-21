dofile(GetScriptPath().."Constant.lua")

State
{
	StateName = "INIT",
	OnFigureSpawnOnlyWhenEvent
	{
		X = bossSpawnX, 
		Y = bossSpawnY, 
		Conditions =
		{
			AvatarIsNotTalking {},
			AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = Choice2a},
			MapFlagIsTrue {Name = "mf_P465_ArenaFightRunning"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P465_Boss1Spawned"},
		},
	},
	--OnDeadEvent
	--{
	--	Conditions =
	--	{
	--		MapFlagIsTrue {Name = "mf_P465_ArenaFightRunning"},
	--		MapFlagIsTrue {Name = "mf_P465_Boss1Spawned"},
	--	},
	--	Actions =
	--	{
	--		
	--	},
	--}
}