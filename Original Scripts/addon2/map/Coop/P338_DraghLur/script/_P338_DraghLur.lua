State
{
	StateName = "INIT",

	OnOneTimeEvent
	{
		GotoState = "MAIN",
		Conditions = 
		{
		},
		Actions = 
		{
			--QuestSetActive	{Player = "pl_Human1", Quest = "CoopMainQuests"},
			--QuestSetActive	{Player = "pl_Human1", Quest = "CoopBaseChapter_1"},
			--QuestSetActive	{Player = "pl_Human1", Quest = "CoopProphet"},

			---------Mapflags-----------------------------------------
			--mf_StartCutscene -> sobald RTS Gegner besiegt ist
			--mf_CutsceneDone  -> sobald Cutscene vorbei ist, Quest wird gelöst
		},
		
	},
};

for i = 1, 3 do
	local sPlayerName = "pl_Human" .. i
	
		OnOneTimeEvent
	{
		EventName = "ProphetFree",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopProphet"},
			MapFlagIsTrue	{Name   = "mf_CutsceneDone"},
		},
		Actions = 
		{
			QuestSetSolved	{Player = sPlayerName, Quest = "CoopProphet"},
			QuestSetActive	{Player = sPlayerName, Quest = "CoopProphetLiberated"},
		},
	}
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Player = sPlayerName, Quest = "CoopMapQuestDraghLur"},
		},
		Actions = 
		{
			FigureVanish {Tag = "QuestGiver"},
		},
	}
end

State
{
	StateName = "MAIN",

	OnOneTimeEvent
	{
		Conditions = 
		{
			--PlayerHasNotBuildingAmount	{Player = "pl_Pact01", Amount = 1, OnlyCompleted = default},
			OR
			{
				FigureIsInEntityRange {Tag = "pl_Human1Avatar", TargetTag = "Prophet", Range = 10},
				FigureIsInEntityRange {Tag = "pl_Human2Avatar", TargetTag = "Prophet", Range = 10},
				FigureIsInEntityRange {Tag = "pl_Human3Avatar", TargetTag = "Prophet", Range = 10},
			},
			FigureIsDead {Tag = "Boss"},
			OR
			{
				QuestIsActive	{Player = "pl_Human1", Quest = "CoopProphet"},
				QuestIsActive	{Player = "pl_Human2", Quest = "CoopProphet"},
				QuestIsActive	{Player = "pl_Human3", Quest = "CoopProphet"},
			},
		},
		Actions = 
		{
			MapFlagSetTrue   {Name = "mf_StartCutscene"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_CutsceneDone"},
		},
		Actions = 
		{
			MapFlagSetTrue   {Name = "mf_NightSoongAppears"},
		},
	},
	OnOneTimeEvent
	{

		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_NightSoongAppears"},
			CoopPlayerIsPlaying	{Player = "pl_Human1"},
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Soong", Level = 9, UnitId = 276, TargetTag = "DraghLurPortal", Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "PactMan01", Level = 6, UnitId = 336, X = 308, Y = 84, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "PactMan02", Level = 6, UnitId = 336, X = 308, Y = 84, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "PactMan03", Level = 6, UnitId = 336, X = 308, Y = 84, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "PactMan04", Level = 6, UnitId = 336, X = 308, Y = 84, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "PactMan05", Level = 6, UnitId = 336, X = 308, Y = 84, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "PactMan06", Level = 6, UnitId = 336, X = 308, Y = 84, Team = "tm_Enemy"},
			MapFlagSetTrue	{Name = "mf_NightSoongWaits"},
		},
	},
	OnOneTimeEvent
	{

		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_NightSoongAppears"},
			CoopPlayerIsNotPlaying	{Player = "pl_Human1"},
			CoopPlayerIsPlaying	{Player = "pl_Human2"},
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Soong", Level = 9, UnitId = 276, TargetTag = "DraghLurPortal", Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "PactMan01", Level = 6, UnitId = 336, X = 308, Y = 84, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "PactMan02", Level = 6, UnitId = 336, X = 308, Y = 84, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "PactMan03", Level = 6, UnitId = 336, X = 308, Y = 84, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "PactMan04", Level = 6, UnitId = 336, X = 308, Y = 84, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "PactMan05", Level = 6, UnitId = 336, X = 308, Y = 84, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "PactMan06", Level = 6, UnitId = 336, X = 308, Y = 84, Team = "tm_Enemy"},
			MapFlagSetTrue	{Name = "mf_NightSoongWaits"},
		},
	},
	OnOneTimeEvent
	{

		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_NightSoongAppears"},
			CoopPlayerIsNotPlaying	{Player = "pl_Human1"},
			CoopPlayerIsNotPlaying	{Player = "pl_Human2"},
			CoopPlayerIsPlaying	{Player = "pl_Human3"},
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Soong", Level = 9, UnitId = 276, TargetTag = "DraghLurPortal", Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "PactMan01", Level = 6, UnitId = 336, X = 308, Y = 84, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "PactMan02", Level = 6, UnitId = 336, X = 308, Y = 84, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "PactMan03", Level = 6, UnitId = 336, X = 308, Y = 84, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "PactMan04", Level = 6, UnitId = 336, X = 308, Y = 84, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "PactMan05", Level = 6, UnitId = 336, X = 308, Y = 84, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "PactMan06", Level = 6, UnitId = 336, X = 308, Y = 84, Team = "tm_Enemy"},
			MapFlagSetTrue	{Name = "mf_NightSoongWaits"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_NightSoongWaits"},
		},
		Actions = 
		{

			FigureWalk	{Tag = "Soong", X = 259,Y = 546},
			FogOfWarTeamAdd	{Team = "tm_Human"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_NightSoongWaits"},
			FigureIsInRange	{Tag = "Soong", Range = 8, X = 259,Y = 546},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_SoongtoWestGuard"},
			FigureVanish	{Tag = "Soong"},
		},
	},
};
