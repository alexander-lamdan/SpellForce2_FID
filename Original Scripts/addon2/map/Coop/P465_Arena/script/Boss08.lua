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
			AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = Choice2h},
			MapFlagIsTrue {Name = "mf_P465_ArenaFightRunning"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P465_Boss8Spawned"},
		},
	},
	
}