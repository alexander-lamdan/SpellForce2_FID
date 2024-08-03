State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotActive {Player = "pl_Human1", Quest = "CoopNeedleWatchTowers"},
			QuestIsNotActive {Player = "pl_Human2", Quest = "CoopNeedleWatchTowers"},
			QuestIsNotActive {Player = "pl_Human3", Quest = "CoopNeedleWatchTowers"},
		},
		Actions = 
		{
			ObjectVanish   {Tag = "TowerMarker01"},
			ObjectVanish   {Tag = "TowerMarker02"},
			ObjectVanish   {Tag = "TowerMarker03"},
			ObjectVanish   {Tag = "TowerMarker04"},
			ObjectVanish   {Tag = "TowerMarker05"},
		},
	},

	OnOneTimeEvent
	{
		GotoState = "BuildTowers",
		Conditions = 
		{
			OR
			{
				QuestIsActive {Player = "pl_Human1", Quest = "CoopNeedleWatchTowers"},
				QuestIsActive {Player = "pl_Human2", Quest = "CoopNeedleWatchTowers"},
				QuestIsActive {Player = "pl_Human3", Quest = "CoopNeedleWatchTowers"},
			},
		},
		Actions = 
		{
			FogOfWarRevealAtEntity	{Tag = "TowerMarker01", Range = 4, Height = default},
			FogOfWarRevealAtEntity	{Tag = "TowerMarker02", Range = 4, Height = default},
			FogOfWarRevealAtEntity	{Tag = "TowerMarker03", Range = 4, Height = default},
			FogOfWarRevealAtEntity	{Tag = "TowerMarker04", Range = 4, Height = default},
			FogOfWarRevealAtEntity	{Tag = "TowerMarker05", Range = 4, Height = default},
		},
	},


};

for i = 1, 3 do
	local sPlayerName = "pl_Human" .. i
	
	-- ********************************************************************
	-- solved, wenn 5 Türme gleichzeitig stehen
	-- ********************************************************************
	OnOneTimeEvent
	{
		EventName = "Player"..i.."SolvedTowerQuest",
		Conditions = 
		{
			QuestIsActive		{Player = sPlayerName, Quest = "CoopNeedleWatchTowers"},
			MapFlagIsTrue		{Name = "mf_TowersBuilt"},
		},
		Actions = 
		{
			QuestSetSolved	{Player = sPlayerName, Quest = "CoopNeedleWatchTowers"},
			QuestSetActive	{Player = sPlayerName, Quest = "CoopNeedleWatchTowersBuilt"},
		},
	}
end
State
{
	StateName = "BuildTowers",
	--OnOneTimeEvent
	--{
	--	Conditions = 
	--	{
	--		OR
	--		{
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human1", BuildingId = 154, Range = 10, TargetTag = "TowerMarker01"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human1", BuildingId = 138, Range = 10, TargetTag = "TowerMarker01"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human1", BuildingId = 120, Range = 10, TargetTag = "TowerMarker01"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human2", BuildingId = 154, Range = 10, TargetTag = "TowerMarker01"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human2", BuildingId = 138, Range = 10, TargetTag = "TowerMarker01"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human2", BuildingId = 120, Range = 10, TargetTag = "TowerMarker01"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human3", BuildingId = 154, Range = 10, TargetTag = "TowerMarker01"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human3", BuildingId = 138, Range = 10, TargetTag = "TowerMarker01"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human3", BuildingId = 120, Range = 10, TargetTag = "TowerMarker01"},
	--		},
	--	},
	--	Actions = 
	--	{
	--	
	--	},
	--},
	--OnOneTimeEvent
	--{
	--	Conditions = 
	--	{
	--		OR
	--		{
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human1", BuildingId = 154, Range = 10, TargetTag = "TowerMarker02"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human1", BuildingId = 138, Range = 10, TargetTag = "TowerMarker02"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human1", BuildingId = 120, Range = 10, TargetTag = "TowerMarker02"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human2", BuildingId = 154, Range = 10, TargetTag = "TowerMarker02"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human2", BuildingId = 138, Range = 10, TargetTag = "TowerMarker02"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human2", BuildingId = 120, Range = 10, TargetTag = "TowerMarker02"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human3", BuildingId = 154, Range = 10, TargetTag = "TowerMarker02"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human3", BuildingId = 138, Range = 10, TargetTag = "TowerMarker02"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human3", BuildingId = 120, Range = 10, TargetTag = "TowerMarker02"},
	--		},
	--	},
	--	Actions = 
	--	{
	--		ObjectVanish   {Tag = "TowerMarker02"},
	--	},
	--},
	--OnOneTimeEvent
	--{
	--	Conditions = 
	--	{
	--		OR
	--		{
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human1", BuildingId = 154, Range = 10, TargetTag = "TowerMarker03"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human1", BuildingId = 138, Range = 10, TargetTag = "TowerMarker03"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human1", BuildingId = 120, Range = 10, TargetTag = "TowerMarker03"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human2", BuildingId = 154, Range = 10, TargetTag = "TowerMarker03"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human2", BuildingId = 138, Range = 10, TargetTag = "TowerMarker03"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human2", BuildingId = 120, Range = 10, TargetTag = "TowerMarker03"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human3", BuildingId = 154, Range = 10, TargetTag = "TowerMarker03"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human3", BuildingId = 138, Range = 10, TargetTag = "TowerMarker03"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human3", BuildingId = 120, Range = 10, TargetTag = "TowerMarker03"},
	--		},
	--	},
	--	Actions = 
	--	{
	--	
	--	},
	--},
	--OnOneTimeEvent
	--{
	--	Conditions = 
	--	{
	--		OR
	--		{
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human1", BuildingId = 154, Range = 10, TargetTag = "TowerMarker04"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human1", BuildingId = 138, Range = 10, TargetTag = "TowerMarker04"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human1", BuildingId = 120, Range = 10, TargetTag = "TowerMarker04"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human2", BuildingId = 154, Range = 10, TargetTag = "TowerMarker04"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human2", BuildingId = 138, Range = 10, TargetTag = "TowerMarker04"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human2", BuildingId = 120, Range = 10, TargetTag = "TowerMarker04"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human3", BuildingId = 154, Range = 10, TargetTag = "TowerMarker04"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human3", BuildingId = 138, Range = 10, TargetTag = "TowerMarker04"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human3", BuildingId = 120, Range = 10, TargetTag = "TowerMarker04"},
	--		},
	--	},
	--	Actions = 
	--	{
	--	
	--	},
	--},
	--OnOneTimeEvent
	--{
	--	Conditions = 
	--	{
	--		OR
	--		{
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human1", BuildingId = 154, Range = 10, TargetTag = "TowerMarker05"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human1", BuildingId = 138, Range = 10, TargetTag = "TowerMarker05"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human1", BuildingId = 120, Range = 10, TargetTag = "TowerMarker05"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human2", BuildingId = 154, Range = 10, TargetTag = "TowerMarker05"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human2", BuildingId = 138, Range = 10, TargetTag = "TowerMarker05"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human2", BuildingId = 120, Range = 10, TargetTag = "TowerMarker05"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human3", BuildingId = 154, Range = 10, TargetTag = "TowerMarker05"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human3", BuildingId = 138, Range = 10, TargetTag = "TowerMarker05"},
	--			PlayerBuildingIsInEntityRange {Player = "pl_Human3", BuildingId = 120, Range = 10, TargetTag = "TowerMarker05"},
	--		},
	--	},
	--	Actions = 
	--	{
	--	
	--	},
	--},
	
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			SetUpdateInterval	{Steps = 30},
			OR
			{
				PlayerBuildingIsInRange {Player = "pl_Human1", BuildingId = 154, Range = 10, X = 250, Y = 338},
				PlayerBuildingIsInRange {Player = "pl_Human1", BuildingId = 138, Range = 10, X = 250, Y = 338},
				PlayerBuildingIsInRange {Player = "pl_Human1", BuildingId = 120, Range = 10, X = 250, Y = 338},
				PlayerBuildingIsInRange {Player = "pl_Human2", BuildingId = 154, Range = 10, X = 250, Y = 338},
				PlayerBuildingIsInRange {Player = "pl_Human2", BuildingId = 138, Range = 10, X = 250, Y = 338},
				PlayerBuildingIsInRange {Player = "pl_Human2", BuildingId = 120, Range = 10, X = 250, Y = 338},
				PlayerBuildingIsInRange {Player = "pl_Human3", BuildingId = 154, Range = 10, X = 250, Y = 338},
				PlayerBuildingIsInRange {Player = "pl_Human3", BuildingId = 138, Range = 10, X = 250, Y = 338},
				PlayerBuildingIsInRange {Player = "pl_Human3", BuildingId = 120, Range = 10, X = 250, Y = 338},

				-- check Shaikan Towers as well!
				PlayerBuildingIsInRange {Player = "pl_Human1", BuildingId = 198, Range = 10, X = 250, Y = 338},
				PlayerBuildingIsInRange {Player = "pl_Human2", BuildingId = 198, Range = 10, X = 250, Y = 338},
				PlayerBuildingIsInRange {Player = "pl_Human3", BuildingId = 198, Range = 10, X = 250, Y = 338},
			},
			OR
			{
				PlayerBuildingIsInRange {Player = "pl_Human1", BuildingId = 154, Range = 10, X = 323, Y = 190 },
				PlayerBuildingIsInRange {Player = "pl_Human1", BuildingId = 138, Range = 10, X = 323, Y = 190},
				PlayerBuildingIsInRange {Player = "pl_Human1", BuildingId = 120, Range = 10, X = 323, Y = 190},
				PlayerBuildingIsInRange {Player = "pl_Human2", BuildingId = 154, Range = 10, X = 323, Y = 190},
				PlayerBuildingIsInRange {Player = "pl_Human2", BuildingId = 138, Range = 10, X = 323, Y = 190},
				PlayerBuildingIsInRange {Player = "pl_Human2", BuildingId = 120, Range = 10, X = 323, Y = 190},
				PlayerBuildingIsInRange {Player = "pl_Human3", BuildingId = 154, Range = 10, X = 323, Y = 190},
				PlayerBuildingIsInRange {Player = "pl_Human3", BuildingId = 138, Range = 10, X = 323, Y = 190},
				PlayerBuildingIsInRange {Player = "pl_Human3", BuildingId = 120, Range = 10, X = 323, Y = 190},

				-- check Shaikan Towers as well!
				PlayerBuildingIsInRange {Player = "pl_Human1", BuildingId = 198, Range = 10, X = 323, Y = 190},
				PlayerBuildingIsInRange {Player = "pl_Human2", BuildingId = 198, Range = 10, X = 323, Y = 190},
				PlayerBuildingIsInRange {Player = "pl_Human3", BuildingId = 198, Range = 10, X = 323, Y = 190},
			},
			OR
			{
				PlayerBuildingIsInRange {Player = "pl_Human1", BuildingId = 154, Range = 10, X = 380, Y = 158},
				PlayerBuildingIsInRange {Player = "pl_Human1", BuildingId = 138, Range = 10, X = 380, Y = 158},
				PlayerBuildingIsInRange {Player = "pl_Human1", BuildingId = 120, Range = 10, X = 380, Y = 158},
				PlayerBuildingIsInRange {Player = "pl_Human2", BuildingId = 154, Range = 10, X = 380, Y = 158},
				PlayerBuildingIsInRange {Player = "pl_Human2", BuildingId = 138, Range = 10, X = 380, Y = 158},
				PlayerBuildingIsInRange {Player = "pl_Human2", BuildingId = 120, Range = 10, X = 380, Y = 158},
				PlayerBuildingIsInRange {Player = "pl_Human3", BuildingId = 154, Range = 10, X = 380, Y = 158},
				PlayerBuildingIsInRange {Player = "pl_Human3", BuildingId = 138, Range = 10, X = 380, Y = 158},
				PlayerBuildingIsInRange {Player = "pl_Human3", BuildingId = 120, Range = 10, X = 380, Y = 158},

				-- check Shaikan Towers as well!
				PlayerBuildingIsInRange {Player = "pl_Human1", BuildingId = 198, Range = 10, X = 380, Y = 158},
				PlayerBuildingIsInRange {Player = "pl_Human2", BuildingId = 198, Range = 10, X = 380, Y = 158},
				PlayerBuildingIsInRange {Player = "pl_Human3", BuildingId = 198, Range = 10, X = 380, Y = 158},
			},
			OR
			{
				PlayerBuildingIsInRange {Player = "pl_Human1", BuildingId = 154, Range = 10, X = 346, Y = 283},
				PlayerBuildingIsInRange {Player = "pl_Human1", BuildingId = 138, Range = 10, X = 346, Y = 283},
				PlayerBuildingIsInRange {Player = "pl_Human1", BuildingId = 120, Range = 10, X = 346, Y = 283},
				PlayerBuildingIsInRange {Player = "pl_Human2", BuildingId = 154, Range = 10, X = 346, Y = 283},
				PlayerBuildingIsInRange {Player = "pl_Human2", BuildingId = 138, Range = 10, X = 346, Y = 283},
				PlayerBuildingIsInRange {Player = "pl_Human2", BuildingId = 120, Range = 10, X = 346, Y = 283},
				PlayerBuildingIsInRange {Player = "pl_Human3", BuildingId = 154, Range = 10, X = 346, Y = 283},
				PlayerBuildingIsInRange {Player = "pl_Human3", BuildingId = 138, Range = 10, X = 346, Y = 283},
				PlayerBuildingIsInRange {Player = "pl_Human3", BuildingId = 120, Range = 10, X = 346, Y = 283},

				-- check Shaikan Towers as well!
				PlayerBuildingIsInRange {Player = "pl_Human1", BuildingId = 198, Range = 10, X = 346, Y = 283},
				PlayerBuildingIsInRange {Player = "pl_Human2", BuildingId = 198, Range = 10, X = 346, Y = 283},
				PlayerBuildingIsInRange {Player = "pl_Human3", BuildingId = 198, Range = 10, X = 346, Y = 283},
			},
			OR
			{
				PlayerBuildingIsInRange {Player = "pl_Human1", BuildingId = 154, Range = 10, X = 282, Y = 362},
				PlayerBuildingIsInRange {Player = "pl_Human1", BuildingId = 138, Range = 10, X = 282, Y = 362},
				PlayerBuildingIsInRange {Player = "pl_Human1", BuildingId = 120, Range = 10, X = 282, Y = 362},
				PlayerBuildingIsInRange {Player = "pl_Human2", BuildingId = 154, Range = 10, X = 282, Y = 362},
				PlayerBuildingIsInRange {Player = "pl_Human2", BuildingId = 138, Range = 10, X = 282, Y = 362},
				PlayerBuildingIsInRange {Player = "pl_Human2", BuildingId = 120, Range = 10, X = 282, Y = 362},
				PlayerBuildingIsInRange {Player = "pl_Human3", BuildingId = 154, Range = 10, X = 282, Y = 362},
				PlayerBuildingIsInRange {Player = "pl_Human3", BuildingId = 138, Range = 10, X = 282, Y = 362},
				PlayerBuildingIsInRange {Player = "pl_Human3", BuildingId = 120, Range = 10, X = 282, Y = 362},

				-- check Shaikan Towers as well!
				PlayerBuildingIsInRange {Player = "pl_Human1", BuildingId = 198, Range = 10, X = 282, Y = 362},
				PlayerBuildingIsInRange {Player = "pl_Human2", BuildingId = 198, Range = 10, X = 282, Y = 362},
				PlayerBuildingIsInRange {Player = "pl_Human3", BuildingId = 198, Range = 10, X = 282, Y = 362},
			},
		},
		Actions = 
		{
			MapFlagSetTrue    {Name = "mf_TowersBuilt"},
		},
	},
	
};
