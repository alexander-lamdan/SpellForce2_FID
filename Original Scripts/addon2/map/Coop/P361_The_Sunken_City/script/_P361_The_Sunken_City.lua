State
{
	StateName = "INIT",

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
			MapFlagIsFalse	{Name = "mf_IncarnationDead"},
			OR
			{
				AvatarFlagIsTrue	{Player = "pl_Human1", Name = "af_P361_SunkenCityIncarnationAlreadyKilled"},
				AvatarFlagIsTrue	{Player = "pl_Human2", Name = "af_P361_SunkenCityIncarnationAlreadyKilled"},
				AvatarFlagIsTrue	{Player = "pl_Human3", Name = "af_P361_SunkenCityIncarnationAlreadyKilled"},
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "IncarnationGuards"},
			FigureVanish	{Tag = "Incarnation"},
		},
		GotoState = "MAIN",
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerIsExisting	{Player = "pl_Human1"},
			QuestIsSolved	{Player = "pl_Human1", Quest = "CoopMapQuestTheSunkenCity"},
		},
		Actions = 
		{
			FigureVanish	{Tag = "IncarnationGuards"},
			FigureVanish	{Tag = "Incarnation"},
		},
		GotoState = "MAIN",
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerIsExisting	{Player = "pl_Human2"},
			QuestIsSolved	{Player = "pl_Human2", Quest = "CoopMapQuestTheSunkenCity"},
		},
		Actions = 
		{
			FigureVanish	{Tag = "IncarnationGuards"},
			FigureVanish	{Tag = "Incarnation"},
		},
		GotoState = "MAIN",
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerIsExisting	{Player = "pl_Human3"},
			QuestIsSolved	{Player = "pl_Human3", Quest = "CoopMapQuestTheSunkenCity"},
		},
		Actions = 
		{
			FigureVanish	{Tag = "IncarnationGuards"},
			FigureVanish	{Tag = "Incarnation"},
		},
		GotoState = "MAIN",
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				AND
				{
					AvatarFlagIsFalse	{Player = "pl_Human1", Name = "af_P361_SunkenCityIncarnationAlreadyKilled"},
					QuestIsActive	{Player = "pl_Human1", Quest = "CoopEvilProphet"},
				},
				AND
				{
					AvatarFlagIsFalse	{Player = "pl_Human2", Name = "af_P361_SunkenCityIncarnationAlreadyKilled"},
					QuestIsActive	{Player = "pl_Human2", Quest = "CoopEvilProphet"},
				},
				AND
				{
					AvatarFlagIsFalse	{Player = "pl_Human3", Name = "af_P361_SunkenCityIncarnationAlreadyKilled"},
					QuestIsActive	{Player = "pl_Human3", Quest = "CoopEvilProphet"},
				},
			},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_IncarnationHasSpawned"},
		},
		GotoState = "MAIN",
	},
};

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
			AvatarFlagSetTrue	{Player = sPlayer, Name = "af_P361_SunkenCityIncarnationAlreadyKilled"},
			AvatarValueAdd	{Player = sPlayer, Name = "av_P333_KilledIncarnations", Value = 1},
			AvatarFlagSetTrue	{Name = "af_P361_IncarnationKilled"},
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
			FigureVanish	{Tag = "IncarnationGuards"},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1204, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1204, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1204, Amount = 1},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsFalse	{Name = "mf_GuardianSpawned"},
			OR
			{
				QuestIsSolved	{Player = "pl_Human1", Quest = "CoopMapQuestTheSunkenCity"},
				QuestIsSolved	{Player = "pl_Human2", Quest = "CoopMapQuestTheSunkenCity"},
				QuestIsSolved	{Player = "pl_Human3", Quest = "CoopMapQuestTheSunkenCity"},
			},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "Guardian", Level = 45, UnitId = 308, X = 178, Y = 135, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "GuardianDruid01", Level = 40, UnitId = 310, X = 178, Y = 137, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "GuardianDruid02", Level = 40, UnitId = 310, X = 178, Y = 133, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "GuardianTreant", Level = 40, UnitId = 527, X = 173, Y = 135, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "GuardianCat01", Level = 41, UnitId = 527, X = 173, Y = 137, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "GuardianCat02", Level = 41, UnitId = 527, X = 173, Y = 133, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "GuardianCat03", Level = 41, UnitId = 527, X = 181, Y = 136, Team = "tm_Human"},
			FigureNpcSpawn	{Tag = "GuardianCat04", Level = 41, UnitId = 527, X = 181, Y = 134, Team = "tm_Human"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsNotInCombat	{Tag = "Guardian"},
			OR
			{
				QuestIsSolved	{Player = "pl_Human1", Quest = "CoopMapQuestTheSunkenCity"},
				QuestIsSolved	{Player = "pl_Human2", Quest = "CoopMapQuestTheSunkenCity"},
				QuestIsSolved	{Player = "pl_Human3", Quest = "CoopMapQuestTheSunkenCity"},
			},
			OR
			{
				FigureIsInEntityRange	{Tag = "pl_Human1Avatar", TargetTag = "Guardian", Range = 15},
				FigureIsInEntityRange	{Tag = "pl_Human2Avatar", TargetTag = "Guardian", Range = 15},
				FigureIsInEntityRange	{Tag = "pl_Human3Avatar", TargetTag = "Guardian", Range = 15},
			},
		},
		Actions = 
		{
			FigureTeamTransfer	{Tag = "Guardian", Team = "tm_Enemy"},
			FigureTeamTransfer	{Tag = "GuardianDruid01", Team = "tm_Enemy"},
			FigureTeamTransfer	{Tag = "GuardianDruid02", Team = "tm_Enemy"},
			FigureTeamTransfer	{Tag = "GuardianCat01", Team = "tm_Enemy"},
			FigureTeamTransfer	{Tag = "GuardianCat02", Team = "tm_Enemy"},
			FigureTeamTransfer	{Tag = "GuardianCat03", Team = "tm_Enemy"},
			FigureTeamTransfer	{Tag = "GuardianCat04", Team = "tm_Enemy"},
			FigureTeamTransfer	{Tag = "GuardianCat05", Team = "tm_Enemy"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerIsExisting	{Player = "pl_Human1"},
			MapFlagIsTrue	{Name = "mf_IncarnationHasSpawned"},
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopMapQuestTheSunkenCity"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "Elf", Level = 10, UnitId = 310, X = 28, Y = 119, Team = "tm_Neutral"},
			FigureLookAtEntity	{Tag = "Elf", TargetTag = "pl_Human1Avatar"},
			FigureNpcSpawn	{Tag = "Guardian", Level = 45, UnitId = 308, X = 105, Y = 140, Team = "tm_Neutral"},
			MapFlagSetTrue	{Name = "mf_GuardianSpawned"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerIsExisting	{Player = "pl_Human2"},
			MapFlagIsTrue	{Name = "mf_IncarnationHasSpawned"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopMapQuestTheSunkenCity"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "Elf", Level = 10, UnitId = 310, X = 28, Y = 119, Team = "tm_Neutral"},
			FigureLookAtEntity	{Tag = "Elf", TargetTag = "pl_Human2Avatar"},
			FigureNpcSpawn	{Tag = "Guardian", Level = 45, UnitId = 308, X = 105, Y = 140, Team = "tm_Neutral"},
			MapFlagSetTrue	{Name = "mf_GuardianSpawned"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			PlayerIsExisting	{Player = "pl_Human3"},
			MapFlagIsTrue	{Name = "mf_IncarnationHasSpawned"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopMapQuestTheSunkenCity"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "Elf", Level = 15, UnitId = 310, X = 28, Y = 119, Team = "tm_Neutral"},
			FigureLookAtEntity	{Tag = "Elf", TargetTag = "pl_Human3Avatar"},
			FigureNpcSpawn	{Tag = "Guardian", Level = 45, UnitId = 308, X = 105, Y = 140, Team = "tm_Neutral"},
			MapFlagSetTrue	{Name = "mf_GuardianSpawned"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsNotInCombat	{Tag = "pl_Human1Avatar"},
			FigureIsNotInCombat	{Tag = "pl_Human2Avatar"},
			FigureIsNotInCombat	{Tag = "pl_Human3Avatar"},
			AND
			{
				OR
				{
					FigureIsInEntityRange	{Tag = "pl_Human1Avatar", TargetTag = "Elf", Range = 12},
					FigureIsInEntityRange	{Tag = "pl_Human2Avatar", TargetTag = "Elf", Range = 12},
					FigureIsInEntityRange	{Tag = "pl_Human3Avatar", TargetTag = "Elf", Range = 12},
				},
			},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Elf", TextTag = "Guardian1"},
			FigureOutcry	{Tag = "Elf", TextTag = "Guardian2"},
			FigureOutcry	{Tag = "Elf", TextTag = "Guardian3"},
			FigureOutcry	{Tag = "Elf", TextTag = "Guardian4"},
			QuestSetActive	{Player = "pl_Human1", Quest = "CoopMapQuestTheSunkenCity"},
			QuestSetActive	{Player = "pl_Human2", Quest = "CoopMapQuestTheSunkenCity"},
			QuestSetActive	{Player = "pl_Human3", Quest = "CoopMapQuestTheSunkenCity"},
			FogOfWarReveal	{FogOfWarId = default, X = 105, Y = 140, Range = 8, Height = default},
			FigureTeamTransfer	{Tag = "Elf", Team = "tm_Human"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_GuardianSpawned"},
			FigureIsNotInCombat	{Tag = "pl_Human1Avatar"},
			FigureIsNotInCombat	{Tag = "pl_Human2Avatar"},
			FigureIsNotInCombat	{Tag = "pl_Human3Avatar"},
			FigureIsDead	{Tag = "Village01Enemy15"},
			FigureIsDead	{Tag = "Village01Enemy16"},
			FigureIsDead	{Tag = "Village01Enemy17"},
			FigureIsDead	{Tag = "Village01Enemy18"},
			FigureIsDead	{Tag = "Village01Enemy19"},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Guardian", TextTag = "Guardian5"},
			FigureNpcSpawn	{Tag = "GuardianDruid01", Level = 40, UnitId = 310, X = 105, Y = 142, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "Elf02", Level = 15, UnitId = 310, X = 49, Y = 327, Team = "tm_Human"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_GuardianSpawned"},
			FigureIsNotInCombat	{Tag = "pl_Human1Avatar"},
			FigureIsNotInCombat	{Tag = "pl_Human2Avatar"},
			FigureIsNotInCombat	{Tag = "pl_Human3Avatar"},
			FigureIsDead	{Tag = "Village02Enemy28"},
			FigureIsDead	{Tag = "Village02Enemy29"},
			FigureIsDead	{Tag = "Village02Enemy30"},
			FigureIsDead	{Tag = "Village02Enemy31"},
			FigureIsDead	{Tag = "Village02Enemy32"},
			FigureIsDead	{Tag = "Village02Enemy33"},
			FigureIsDead	{Tag = "Village02Enemy34"},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Guardian", TextTag = "Guardian6"},
			FigureNpcSpawn	{Tag = "GuardianDruid02", Level = 40, UnitId = 310, X = 105, Y = 138, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "Elf03", Level = 15, UnitId = 310, X = 315, Y = 294, Team = "tm_Human"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_GuardianSpawned"},
			FigureIsNotInCombat	{Tag = "pl_Human1Avatar"},
			FigureIsNotInCombat	{Tag = "pl_Human2Avatar"},
			FigureIsNotInCombat	{Tag = "pl_Human3Avatar"},
			FigureIsDead	{Tag = "Village0Enemy34"},
			FigureIsDead	{Tag = "Village0Enemy38"},
			FigureIsDead	{Tag = "Village0Enemy39"},
			FigureIsDead	{Tag = "Village0Enemy40"},
			FigureIsDead	{Tag = "Village0Enemy41"},
			FigureIsDead	{Tag = "Village0Enemy42"},
			FigureIsDead	{Tag = "Village0Enemy43"},
			FigureIsDead	{Tag = "Village0Enemy44"},
			FigureIsDead	{Tag = "Village0Enemy45"},
			FigureIsDead	{Tag = "Village0Enemy45"},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Guardian", TextTag = "Guardian7"},
			FigureNpcSpawn	{Tag = "GuardianCat05", Level = 40, UnitId = 527, X = 110, Y = 140, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "Elf04", Level = 20, UnitId = 310, X = 309, Y = 77, Team = "tm_Human"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_GuardianSpawned"},
			MapFlagIsTrue	{Name = "mf_IncarnationHasSpawned"},
			FigureIsDead	{Tag = "IncarnationGuards"},
		},
		Actions = 
		{
			FigureOutcry	{Tag = "Guardian", TextTag = "Guardian8"},
			FigureNpcSpawn	{Tag = "GuardianCat01", Level = 41, UnitId = 527, X = 113, Y = 144, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "GuardianCat02", Level = 41, UnitId = 527, X = 113, Y = 142, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "GuardianCat03", Level = 41, UnitId = 527, X = 113, Y = 140, Team = "tm_Neutral"},
			FigureNpcSpawn	{Tag = "GuardianCat04", Level = 41, UnitId = 527, X = 113, Y = 138, Team = "tm_Neutral"},
			MapFlagSetTrue	{Name = "mf_GuardianMoves"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopMapQuestTheSunkenCity"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopMapQuestTheSunkenCity"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopMapQuestTheSunkenCity"},
			OR
			{
				AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 380, Amount = 1},
				AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 380, Amount = 1},
				AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 380, Amount = 1},
			},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 14, X = 104, Y = 141, Direction = 0, Tag = "Chest"},
			ObjectLootItemEquipmentAdd	{Tag = "Chest", DropChance = 100, ItemId = 1194},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_GuardianMoves"},
		},
		Actions = 
		{
			FigureTeamTransfer	{Tag = "Guardian", Team = "tm_Human"},
			FigureTeamTransfer	{Tag = "GuardianDruid01", Team = "tm_Human"},
			FigureTeamTransfer	{Tag = "GuardianDruid02", Team = "tm_Human"},
			FigureTeamTransfer	{Tag = "GuardianCat05", Team = "tm_Human"},
			FigureTeamTransfer	{Tag = "GuardianCat01", Team = "tm_Human"},
			FigureTeamTransfer	{Tag = "GuardianCat02", Team = "tm_Human"},
			FigureTeamTransfer	{Tag = "GuardianCat03", Team = "tm_Human"},
			FigureTeamTransfer	{Tag = "GuardianCat04", Team = "tm_Human"},
			FigureWalk	{Tag = "Guardian", X = 178, Y = 135},
			FigureWalk	{Tag = "GuardianCat05", X = 181, Y = 135},
			FigureWalk	{Tag = "GuardianCat01", X = 176, Y = 135},
			FigureWalk	{Tag = "GuardianCat02", X = 178, Y = 137},
			FigureWalk	{Tag = "GuardianCat03", X = 178, Y = 133},
			FigureWalk	{Tag = "GuardianCat04", X = 178, Y = 131},
			FigureFollowEntity	{Tag = "GuardianDruid01", TargetTag = "Guardian"},
			FigureFollowEntity	{Tag = "GuardianDruid02", TargetTag = "Guardian"},
			QuestSetSolved	{Player = "pl_Human1", Quest = "CoopMapQuestTheSunkenCity"},
			QuestSetSolved	{Player = "pl_Human2", Quest = "CoopMapQuestTheSunkenCity"},
			QuestSetSolved	{Player = "pl_Human3", Quest = "CoopMapQuestTheSunkenCity"},
		},
	},
};
