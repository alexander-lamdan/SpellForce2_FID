for i = 1, 3 do
	local sPlayer = "pl_Human" .. i
	
	OnOneTimeEvent
	{
		EventName = sPlayer .. "KilledIncarnation",
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_IncarnationHasSpawned"},
			FigureIsDead	{Tag = "Incarnation"},
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Player = sPlayer, Name = "af_P362_CrystalForestIncarnationAlreadyKilled"},
			AvatarValueAdd	{Player = sPlayer, Name = "av_P333_KilledIncarnations", Value = 1},
			-- Die hier wird für XP Vergabe verwendet (Kann nicht die andere Flag verwenden, weil QuestRewards.lua Flags nach Abfrage sofort wieder auf False stellt)
			
			AvatarFlagSetTrue	{Player = sPlayer, Name = "af_P362_IncarnationKilled"},
			MapFlagSetTrue	{Name = "mf_IncarnationDead"},
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
			QuestIsNotActive	{Player = "pl_Human1", Quest = "CoopEvilProphet"},
			QuestIsNotActive	{Player = "pl_Human2", Quest = "CoopEvilProphet"},
			QuestIsNotActive	{Player = "pl_Human3", Quest = "CoopEvilProphet"},
		},
		Actions = 
		{
			FigureVanish	{Tag = "IncarnationGuards"},
			FigureVanish	{Tag = "Incarnation"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				AvatarFlagIsTrue	{Player = "pl_Human1", Name = "af_P362_CrystalForestIncarnationAlreadyKilled"},
				AvatarFlagIsTrue	{Player = "pl_Human2", Name = "af_P362_CrystalForestIncarnationAlreadyKilled"},
				AvatarFlagIsTrue	{Player = "pl_Human3", Name = "af_P362_CrystalForestIncarnationAlreadyKilled"},
			},
		},
		Actions =
		{
			FigureVanish	{Tag = "IncarnationGuards"},
			FigureVanish	{Tag = "Incarnation"},
		},
	},	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_IncarnationDead"},
		},
		Actions = 
		{
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1203, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1203, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1203, Amount = 1},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerIsExisting	{Player = "pl_Human1"},
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopMapQuestCrystalForest"},
		},
		Actions = 
		{
			FigureNpcSpawnToEntity	{Tag = "Hunter", Level = 10, UnitId = 531, TargetTag = "pl_Human1Avatar", Team = "tm_Neutral"},
			FigureLookAtEntity	{Tag = "Hunter", TargetTag = "pl_Human1Avatar"},
			FigureNpcSpawn	{Tag = "Raptor01", Level = 28, UnitId = 528, X = 365, Y = 457, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Raptor02", Level = 28, UnitId = 528, X = 375, Y = 459, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Raptor03", Level = 28, UnitId = 528, X = 371, Y = 457, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Raptor04", Level = 28, UnitId = 528, X = 375, Y = 456, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Raptor05", Level = 28, UnitId = 528, X = 368, Y = 452, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Raptor06", Level = 28, UnitId = 528, X = 372, Y = 452, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Raptor07", Level = 28, UnitId = 528, X = 369, Y = 449, Team = "tm_Enemy"},
			MapFlagSetTrue	{Name = "mf_RaptorsSpawned"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerIsExisting	{Player = "pl_Human2"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopMapQuestCrystalForest"},
		},
		Actions = 
		{
			FigureNpcSpawnToEntity	{Tag = "Hunter", Level = 10, UnitId = 531, TargetTag = "pl_Human2Avatar", Team = "tm_Neutral"},
			FigureLookAtEntity	{Tag = "Hunter", TargetTag = "pl_Human2Avatar"},
			FigureNpcSpawn	{Tag = "Raptor01", Level = 28, UnitId = 528, X = 365, Y = 457, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Raptor02", Level = 28, UnitId = 528, X = 375, Y = 459, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Raptor03", Level = 28, UnitId = 528, X = 371, Y = 457, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Raptor04", Level = 28, UnitId = 528, X = 375, Y = 456, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Raptor05", Level = 28, UnitId = 528, X = 368, Y = 452, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Raptor06", Level = 28, UnitId = 528, X = 372, Y = 452, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Raptor07", Level = 28, UnitId = 528, X = 369, Y = 449, Team = "tm_Enemy"},
			MapFlagSetTrue	{Name = "mf_RaptorsSpawned"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerIsExisting	{Player = "pl_Human3"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopMapQuestCrystalForest"},
		},
		Actions = 
		{
			FigureNpcSpawnToEntity	{Tag = "Hunter", Level = 10, UnitId = 531, TargetTag = "pl_Human3Avatar", Team = "tm_Neutral"},
			FigureLookAtEntity	{Tag = "Hunter", TargetTag = "pl_Human3Avatar"},
			FigureNpcSpawn	{Tag = "Raptor01", Level = 28, UnitId = 528, X = 365, Y = 457, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Raptor02", Level = 28, UnitId = 528, X = 375, Y = 459, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Raptor03", Level = 28, UnitId = 528, X = 371, Y = 457, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Raptor04", Level = 28, UnitId = 528, X = 375, Y = 456, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Raptor05", Level = 28, UnitId = 528, X = 368, Y = 452, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Raptor06", Level = 28, UnitId = 528, X = 372, Y = 452, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Raptor07", Level = 28, UnitId = 528, X = 369, Y = 449, Team = "tm_Enemy"},
			MapFlagSetTrue	{Name = "mf_RaptorsSpawned"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_RaptorsSpawned"},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Hunter", TextTag = "Hunter01"},
			FigureOutcry	{Tag = "Hunter", TextTag = "Hunter02"},
			FigureOutcry	{Tag = "Hunter", TextTag = "Hunter03"},
			FigureOutcry	{Tag = "Hunter", TextTag = "Hunter04"},
			FigureOutcry	{Tag = "Hunter", TextTag = "Hunter05"},
			FigureOutcry	{Tag = "Hunter", TextTag = "Hunter06"},
			FigureOutcry	{Tag = "Hunter", TextTag = "Hunter07"},
			QuestSetActive	{Player = "pl_Human1", Quest = "CoopMapQuestCrystalForest"},
			QuestSetActive	{Player = "pl_Human2", Quest = "CoopMapQuestCrystalForest"},
			QuestSetActive	{Player = "pl_Human3", Quest = "CoopMapQuestCrystalForest"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "Raptor01"},
			FigureIsDead	{Tag = "Raptor02"},
			FigureIsDead	{Tag = "Raptor03"},
			FigureIsDead	{Tag = "Raptor04"},
			FigureIsDead	{Tag = "Raptor05"},
			FigureIsDead	{Tag = "Raptor06"},
			FigureIsDead	{Tag = "Raptor07"},
		},
		Actions = 
		{
			FigureRun	{Tag = "Hunter", X = 375, Y = 459},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInRange	{Tag = "Hunter", Range = 6, X = 375, Y = 459},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_RaptorsDead"},
			QuestSetSolved	{Player = "pl_Human1", Quest = "CoopMapQuestCrystalForest"},
			QuestSetSolved	{Player = "pl_Human2", Quest = "CoopMapQuestCrystalForest"},
			QuestSetSolved	{Player = "pl_Human3", Quest = "CoopMapQuestCrystalForest"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_RaptorsDead"},
			OR
			{
				FigureIsInEntityRange	{Tag = "pl_Human1Avatar", TargetTag = "Hunter", Range = 6},
				FigureIsInEntityRange	{Tag = "pl_Human2Avatar", TargetTag = "Hunter", Range = 6},
				FigureIsInEntityRange	{Tag = "pl_Human3Avatar", TargetTag = "Hunter", Range = 6},
			},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Hunter", TextTag = "Hunter08"},
			AvatarItemMiscGive	{Player = "pl_Human1", ItemId = 39, Amount = 1},
			AvatarItemMiscGive	{Player = "pl_Human2", ItemId = 39, Amount = 1},
			AvatarItemMiscGive	{Player = "pl_Human3", ItemId = 39, Amount = 1},
		},
	},
};
