for i = 1, 3 do
	local sPlayer = "pl_Human" .. i
	
	OnOneTimeEvent
	{
		EventName = sPlayer .. "KilledIncarnation",
		Conditions = 
		{
			-- der kill darf nur einmal gezählt werden:
			AvatarFlagIsFalse	{Player = sPlayer, Name = "af_P360_CrystalWastesIncarnationAlreadyKilled"},
			
			-- die quest muss aktiv sein:
			QuestIsActive	{Player = sPlayer, Quest = "CoopEvilProphet"},
			
			-- die inkarnation muss auch tatsächlich gespawned worden sein:
			MapFlagIsTrue	{Name = "mf_IncarnationHasSpawned"},
			
			-- und natürlich muss sie tot sein:
			FigureIsDead	{Tag = "Incarnation"},
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Player = sPlayer, Name = "af_P360_CrystalWastesIncarnationAlreadyKilled"},
			AvatarValueAdd	{Player = sPlayer, Name = "av_P333_KilledIncarnations", Value = 1},
			
			-- Die hier wird für XP Vergabe verwendet (Kann nicht die andere Flag verwenden, weil QuestRewards.lua Flags nach Abfrage sofort wieder auf False stellt)
			
			AvatarFlagSetTrue	{Player = sPlayer, Name = "af_P360_IncarnationKilled"},
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
			MapFlagIsTrue	{Name = "mf_IncarnationDead"},
		},
		Actions = 
		{
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1205, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1205, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1205, Amount = 1},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerIsExisting	{Player = "pl_Human1"},
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopMapQuestCrystalWastes"},
		},
		Actions = 
		{
			FigureNpcSpawnToEntity	{Tag = "Priest", Level = 10, UnitId = 1284, TargetTag = "pl_Human1Avatar", Team = "tm_Neutral"},
			FigureOutcry	{Tag = "Priest", TextTag = "Priest01"},
			FigureOutcry	{Tag = "Priest", TextTag = "Priest02"},
			FigureOutcry	{Tag = "Priest", TextTag = "Priest03"},
			FigureOutcry	{Tag = "Priest", TextTag = "Priest04"},
			FigureOutcry	{Tag = "Priest", TextTag = "Priest05"},
			FigureOutcry	{Tag = "Priest", TextTag = "Priest06"},
			QuestSetActive	{Player = "pl_Human1", Quest = "CoopMapQuestCrystalWastes"},
			QuestSetActive	{Player = "pl_Human2", Quest = "CoopMapQuestCrystalWastes"},
			QuestSetActive	{Player = "pl_Human3", Quest = "CoopMapQuestCrystalWastes"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerIsExisting	{Player = "pl_Human2"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopMapQuestCrystalWastes"},
		},
		Actions = 
		{
			FigureNpcSpawnToEntity	{Tag = "Priest", Level = 10, UnitId = 1284, TargetTag = "pl_Human2Avatar", Team = "tm_Neutral"},
			FigureOutcry	{Tag = "Priest", TextTag = "Priest01"},
			FigureOutcry	{Tag = "Priest", TextTag = "Priest02"},
			FigureOutcry	{Tag = "Priest", TextTag = "Priest03"},
			FigureOutcry	{Tag = "Priest", TextTag = "Priest04"},
			FigureOutcry	{Tag = "Priest", TextTag = "Priest05"},
			FigureOutcry	{Tag = "Priest", TextTag = "Priest06"},
			QuestSetActive	{Player = "pl_Human1", Quest = "CoopMapQuestCrystalWastes"},
			QuestSetActive	{Player = "pl_Human2", Quest = "CoopMapQuestCrystalWastes"},
			QuestSetActive	{Player = "pl_Human3", Quest = "CoopMapQuestCrystalWastes"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerIsExisting	{Player = "pl_Human3"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopMapQuestCrystalWastes"},
		},
		Actions = 
		{
			FigureNpcSpawnToEntity	{Tag = "Priest", Level = 10, UnitId = 1284, TargetTag = "pl_Human3Avatar", Team = "tm_Neutral"},
			FigureOutcry	{Tag = "Priest", TextTag = "Priest01"},
			FigureOutcry	{Tag = "Priest", TextTag = "Priest02"},
			FigureOutcry	{Tag = "Priest", TextTag = "Priest03"},
			FigureOutcry	{Tag = "Priest", TextTag = "Priest04"},
			FigureOutcry	{Tag = "Priest", TextTag = "Priest05"},
			FigureOutcry	{Tag = "Priest", TextTag = "Priest06"},
			QuestSetActive	{Player = "pl_Human1", Quest = "CoopMapQuestCrystalWastes"},
			QuestSetActive	{Player = "pl_Human2", Quest = "CoopMapQuestCrystalWastes"},
			QuestSetActive	{Player = "pl_Human3", Quest = "CoopMapQuestCrystalWastes"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
			QuestIsActive	{Player = "pl_Human1", Quest = "CoopMapQuestCrystalWastes"},
			QuestIsActive	{Player = "pl_Human2", Quest = "CoopMapQuestCrystalWastes"},
			QuestIsActive	{Player = "pl_Human3", Quest = "CoopMapQuestCrystalWastes"},
			},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1199, X = 46, Y = 153, Direction = 0, Tag = "Crystal"},
			FigureNpcSpawn	{Tag = "Demon01", Level = 28, UnitId = 557, X = 50, Y = 154, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Demon02", Level = 28, UnitId = 557, X = 52, Y = 154, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Demon03", Level = 30, UnitId = 362, X = 50, Y = 156, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Demon04", Level = 28, UnitId = 726, X = 54, Y = 154, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Demon05", Level = 28, UnitId = 726, X = 56, Y = 154, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Demon06", Level = 28, UnitId = 726, X = 50, Y = 158, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Demon07", Level = 28, UnitId = 726, X = 52, Y = 156, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Demon08", Level = 28, UnitId = 557, X = 51, Y = 148, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Demon09", Level = 28, UnitId = 557, X = 50, Y = 154, Team = "tm_Enemy"},
			MapFlagSetTrue	{Name = "mf_CrystalSpawned"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_CrystalSpawned"},
		},
		Actions = 
		{
			ObjectLootItemMiscAdd	{Tag = "Crystal", DropChance = 100, ItemId = 127},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 127, Amount = 1},
				AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 127, Amount = 1},
				AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 127, Amount = 1},
			},
			AND
			{
				OR
				{
					FigureIsInEntityRange	{Tag = "pl_Human1Avatar", TargetTag = "Priest", Range = 6},
					FigureIsInEntityRange	{Tag = "pl_Human2Avatar", TargetTag = "Priest", Range = 6},
					FigureIsInEntityRange	{Tag = "pl_Human3Avatar", TargetTag = "Priest", Range = 6},
				},
			},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Priest", TextTag = "Priest07"},
			FigureOutcry	{Tag = "Priest", TextTag = "Priest08"},
			AvatarItemMiscTake	{Player = "pl_Human1", ItemId = 127, Amount = 999},
			AvatarItemMiscTake	{Player = "pl_Human2", ItemId = 127, Amount = 999},
			AvatarItemMiscTake	{Player = "pl_Human3", ItemId = 127, Amount = 999},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 950, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 950, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 950, Amount = 1},
			MapTimerStart	{Name = "mt_PriestTimer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_PriestTimer", Seconds = 12},
		},
		Actions = 
		{
			QuestSetSolved	{Player = "pl_Human1", Quest = "CoopMapQuestCrystalWastes"},
			QuestSetSolved	{Player = "pl_Human2", Quest = "CoopMapQuestCrystalWastes"},
			QuestSetSolved	{Player = "pl_Human3", Quest = "CoopMapQuestCrystalWastes"},
			MapTimerStop	{Name = "mt_PriestTimer"},
			FigureVanish	{Tag = "Priest"},
		},
	},	
};
