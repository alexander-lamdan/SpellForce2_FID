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
			-- dieses flag beim solven der Aya Befreiungs-Quest wieder auf false setzen!
			-- AvatarFlagSetTrue	{Player = "pl_Human1", Name = "af_P348_LiberatingAyaInProgress"},
			--QuestSetActive	{Player = "pl_Human1", Quest = "CoopMainQuests"},
			--QuestSetActive	{Player = "pl_Human1", Quest = "CoopBaseChapter_3"},
			--QuestSetActive	{Player = "pl_Human1", Quest = "CoopLiberateAya"},
			
			
		},
		GotoState = "MAIN",
	};
};



for i = 1, 3 do
	local sPlayerName = "pl_Human" .. i
	

	-- ********************************************************************
	-- solver der gesamtquest
	-- ********************************************************************
	OnOneTimeEvent
	{
		EventName = "Player"..i.."AyaLiberated",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopLiberateAya"},
			MapFlagIsTrue	{Name = "mf_MissionDone"}
		},
		Actions = 
		{
			QuestSetSolved		{Player = sPlayerName, Quest = "CoopLiberateAya"},
			QuestSetActive		{Player = sPlayerName, Quest = "CoopLiberateAyaSolved"},
			AvatarFlagSetFalse	{Player = "pl_Human1", Name = "af_P348_LiberatingAyaInProgress"},
			MapFlagSetTrue		{Name = "mf_FreedAya"}
		},
	}
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsSolved	{Player = sPlayerName, Quest = "CoopLiberateAya"},
		},
		Actions = 
		{
			GateSetOpen	{Tag  = "GateCity"},
			FigureVanish	{Tag = "Aya"},
			FigureTeamTransfer	{Tag  = "CultGuardian01", Team = "tm_Cult"},
			FigureTeamTransfer	{Tag  = "CultGuardian02", Team = "tm_Cult"},
		},
	}
end

State
{
	StateName = "MAIN",
	
	
	
	OnEvent
	{
		Conditions =
		{
			FigureIsInEntityRange	{Tag = "pl_Human1Avatar", TargetTag = "Teleport01", Range = 1},
			MapFlagIsTrue	  		{Name = "mf_TeleportEnabled"},
		},
		Actions =
		{
			FigureTeleport	{Tag   = "pl_Human1Avatar", X = 375.379, Y = 526.292},
			MapFlagSetTrue	{Name  = "mf_Ava01HasTeleported"},
			
--			FigureTeleport	{Tag = "pl_Human1Hero", X = 373.957, Y = 526.293},
--			FigureTeleport	{Tag = "pl_Human1Hero", X = 377.175, Y = 526.342},
--			FigureTeleport	{Tag = "pl_Human1Hero", X = 374.533, Y = 527.506},
--			FigureTeleport	{Tag = "pl_Human1Hero", X = 376.962, Y = 527.5},
--			FigureTeleport	{Tag = "pl_Human1Hero", X = 375.774, Y = 528.258},
		},
	},
	OnEvent
	{
		Conditions =
		{
			FigureIsInEntityRange	{Tag = "pl_Human2Avatar", TargetTag = "Teleport01", Range = 1},
			MapFlagIsTrue	  		{Name = "mf_TeleportEnabled"},
		},
		Actions =
		{
			FigureTeleport	{Tag   = "pl_Human2Avatar", X = 380.928, Y = 526.499},
			MapFlagSetTrue	{Name  = "mf_Ava02HasTeleported"},
			
--			FigureTeleport	{Tag = "pl_Human2Hero", X = 379.486, Y = 526.591},
--			FigureTeleport	{Tag = "pl_Human2Hero", X = 382.693, Y = 526.414},
--			FigureTeleport	{Tag = "pl_Human2Hero", X = 380.282, Y = 527.677},
--			FigureTeleport	{Tag = "pl_Human2Hero", X = 382.308, Y = 527.644},
--			FigureTeleport	{Tag = "pl_Human2Hero", X = 381.368, Y = 528.213},
		},
	},
	OnEvent
	{
		Conditions =
		{
			FigureIsInEntityRange	{Tag = "pl_Human3Avatar", TargetTag = "Teleport01", Range = 1},
			MapFlagIsTrue	  		{Name = "mf_TeleportEnabled"},
		},
		Actions =
		{
			FigureTeleport	{Tag   = "pl_Human3Avatar", X = 370.146, Y = 526.375},
			MapFlagSetTrue	{Name  = "mf_Ava03HasTeleported"},
			                                 
--			FigureTeleport	{Tag = "pl_Human3Hero", X = 371.719, Y = 526.352},
--			FigureTeleport	{Tag = "pl_Human3Hero", X = 368.602, Y = 526.144},
--			FigureTeleport	{Tag = "pl_Human3Hero", X = 371.491, Y = 527.795},
--			FigureTeleport	{Tag = "pl_Human3Hero", X = 369.21,  Y = 527.559},
--			FigureTeleport	{Tag = "pl_Human3Hero", X = 370.463, Y = 528.331},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead {Tag = "Mardagant"},
			
			FigureIsDead {Tag = "Gate02Guard01"},
			FigureIsDead {Tag = "Gate02Guard02"},
			FigureIsDead {Tag = "Gate02Guard03"},
			FigureIsDead {Tag = "Gate02Guard04"},
			FigureIsDead {Tag = "Gate02Guard05"},
			FigureIsDead {Tag = "Gate02Guard06"},
			FigureIsDead {Tag = "Gate02Guard07"},
			FigureIsDead {Tag = "Gate02Guard08"},
			
		},
		Actions = 
		{
			MapFlagSetTrue	   {Name = "mf_StartCutscene"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopMapQuestFireForge"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopMapQuestFireForge"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopMapQuestFireForge"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "Archeologist", Level = 8, UnitId = 593, X = 224, Y = 161, Team = "tm_Neutral"},
			ObjectSpawn	{ObjectId = 1209, X = 91, Y = 473, Direction = 0, Tag = "BeastAltar"},
			MapFlagSetTrue	{Name = "mf_ArcheoStart"},
			FogOfWarReveal	{FogOfWarId = default, X = 224, Y = 161, Range = 7, Height = default},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_ArcheoStart"},
			AND
			{
				OR
				{
					FigureIsInEntityRange	{Tag = "pl_Human1Avatar", TargetTag = "Archeologist", Range = 7},
					FigureIsInEntityRange	{Tag = "pl_Human2Avatar", TargetTag = "Archeologist", Range = 7},
					FigureIsInEntityRange	{Tag = "pl_Human3Avatar", TargetTag = "Archeologist", Range = 7},
				},
			},	
		},
		Actions =
		{
			FigureOutcry	{Tag = "Archeologist", TextTag = "Archeologist01"},
			FigureOutcry	{Tag = "Archeologist", TextTag = "Archeologist02"},
			FigureOutcry	{Tag = "Archeologist", TextTag = "Archeologist03"},
			FigureOutcry	{Tag = "Archeologist", TextTag = "Archeologist04"},
			FigureOutcry	{Tag = "Archeologist", TextTag = "Archeologist05"},
			FigureOutcry	{Tag = "Archeologist", TextTag = "Archeologist06"},
			QuestSetActive	{Player = "pl_Human1", Quest = "CoopMapQuestFireForge"},
			QuestSetActive	{Player = "pl_Human2", Quest = "CoopMapQuestFireForge"},
			QuestSetActive	{Player = "pl_Human3", Quest = "CoopMapQuestFireForge"},
			MapFlagSetTrue   {Name = "mf_AltarDone"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue   {Name = "mf_AltarDone"},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Archeologist", TextTag = "Archeologist07"},
			ObjectSpawn	{ObjectId = 1677, X = 212, Y = 160, Direction = 0, Tag = "LeverVillageGate"},
			FigureNpcSpawnToEntity	{Tag = "CultAltar01", Level = 15, UnitId = 1019, TargetTag = "BeastAltar", Team = "tm_Cult"},
			FigureNpcSpawnToEntity	{Tag = "CultAltar02", Level = 15, UnitId = 687, TargetTag = "BeastAltar", Team = "tm_Cult"},
			FigureNpcSpawnToEntity	{Tag = "CultAltar03", Level = 15, UnitId = 687, TargetTag = "BeastAltar", Team = "tm_Cult"},
			FigureNpcSpawnToEntity	{Tag = "CultAltar04", Level = 14, UnitId = 688, TargetTag = "BeastAltar", Team = "tm_Cult"},
			FigureNpcSpawnToEntity	{Tag = "CultAltar05", Level = 14, UnitId = 688, TargetTag = "BeastAltar", Team = "tm_Cult"},
			FigureNpcSpawnToEntity	{Tag = "CultAltar06", Level = 14, UnitId = 688, TargetTag = "BeastAltar", Team = "tm_Cult"},
			MapFlagSetTrue   {Name = "mf_GuardsDone"},
		},
	},
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverVillageGate",
		OnConditions = 
		{
		},
		Actions = 
		{
			EntityFlagSetTrue	{Name = "ef_ClickedOnVillageGate"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_ClickedOnVillageGate"},
		},
		Actions = 
		{
	 		FigureTeamTransfer	{Tag  = "Archeologist", Team = "tm_Human"},
			GateSetOpen	{Tag  = "VillageDoor2"},
			ObjectVanish	{Tag = "LeverVillageGate"},
		},
	},
	OnFollowEvent
	{
		Tag = "Archeologist",
		TargetTag = "pl_Human1Avatar",
		OnConditions = 
		{
			QuestIsActive	{Player = "pl_Human1", Quest = "CoopMapQuestFireForge"},
			FigureIsNotInCombat {Tag  = "pl_Human1Avatar"},
			MapFlagIsFalse	{Name = "mf_FollowPlayer2"},
			MapFlagIsFalse	{Name = "mf_FollowPlayer3"},
			MapFlagIsFalse	{Name = "mf_ArcheologistMetAltar"},
		},
		Actions = 
		{
			MapFlagSetTrue   {Name = "mf_FollowPlayer1"},
		},
	},
	OnFollowEvent
	{
		Tag = "Archeologist",
		TargetTag = "pl_Human2Avatar",
		OnConditions = 
		{
			QuestIsActive	{Player = "pl_Human2", Quest = "CoopMapQuestFireForge"},
			FigureIsNotInCombat {Tag  = "pl_Human2Avatar"},
			MapFlagIsFalse	{Name = "mf_FollowPlayer1"},
			MapFlagIsFalse	{Name = "mf_FollowPlayer3"},
			MapFlagIsFalse	{Name = "mf_ArcheologistMetAltar"},
		},
		Actions = 
		{
			MapFlagSetTrue   {Name = "mf_FollowPlayer2"},
		},
	},
	OnFollowEvent
	{
		Tag = "Archeologist",
		TargetTag = "pl_Human3Avatar",
		OnConditions = 
		{
			QuestIsActive	{Player = "pl_Human3", Quest = "CoopMapQuestFireForge"},
			FigureIsNotInCombat {Tag  = "pl_Human3Avatar"},
			MapFlagIsFalse	{Name = "mf_FollowPlayer1"},
			MapFlagIsFalse	{Name = "mf_FollowPlayer2"},
			MapFlagIsFalse	{Name = "mf_ArcheologistMetAltar"},
		},
		Actions = 
		{
			MapFlagSetTrue   {Name = "mf_FollowPlayer3"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue   {Name = "mf_GuardsDone"},
			AND
			{
				OR
				{
					AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 99, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 99, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 99, Amount = 1},
				},
			},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 14, X = 112, Y = 483, Direction = 0, Tag = "Chest01"},
			ObjectSpawn	{ObjectId = 14, X = 60, Y = 462, Direction = 0, Tag = "Chest02"},
			FigureLootItemEquipmentAdd	{Tag = "CultAltar01", DropChance = 100, ItemId = 1200},
			MapFlagSetTrue   {Name = "mf_OneStarReward"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag = "CultAltar01"},
			FigureIsDead	{Tag = "CultAltar02"},
			FigureIsDead	{Tag = "CultAltar03"},
			FigureIsDead	{Tag = "CultAltar04"},
			FigureIsDead	{Tag = "CultAltar05"},
			FigureIsDead	{Tag = "CultAltar06"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_AltarGuardsDead"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue   {Name = "mf_OneStarReward"},
			MapFlagIsTrue	{Name = "mf_AltarGuardsDead"},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 112, Y = 483, Direction = 0, Tag = "LeverChest01"},
			ObjectSpawn	{ObjectId = 1677, X = 60, Y = 462, Direction = 0, Tag = "LeverChest02"},
		},
	},
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverChest01",
		OnConditions = 
		{
		},
		Actions = 
		{
			EntityFlagSetTrue {Name = "ef_ClickedOnChest01"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_ClickedOnChest01"},
		},
		Actions = 
		{
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1141, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1141, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1141, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1145, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1145, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1145, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1146, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1146, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1146, Amount = 1},
			ObjectVanish	{Tag = "LeverChest01"},
		},
	},
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverChest02",
		OnConditions = 
		{
		},
		Actions = 
		{
			EntityFlagSetTrue {Name = "ef_ClickedOnChest02"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			EntityFlagIsTrue	{Name = "ef_ClickedOnChest02"},
		},
		Actions = 
		{
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1157, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1157, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1157, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1158, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1158, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1158, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 1163, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 1163, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 1163, Amount = 1},
			AvatarItemMiscTake	{Player = "pl_Human1", ItemId = 99, Amount = 999},
			AvatarItemMiscTake	{Player = "pl_Human2", ItemId = 99, Amount = 999},
			AvatarItemMiscTake	{Player = "pl_Human3", ItemId = 99, Amount = 999},
			ObjectVanish	{Tag = "LeverChest02"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_AltarGuardsDead"},
			FigureIsInEntityRange	{Tag = "Archeologist", TargetTag = "BeastAltar", Range = 9},
		},
		Actions = 
		{
			MapFlagSetTrue   {Name = "mf_ArcheologistMetAltar"},
	 		FigureTeamTransfer	{Tag  = "Archeologist", Team = "tm_Neutral"},
			FigureForcedWalkToEntity	{Tag = "Archeologist", TargetTag = "Archeologist"},
			FigureDirectionSetToEntity	{Tag = "Archeologist", TargetTag = "Archeologist"},
			FigureOutcry	{Tag = "Archeologist", TextTag = "Archeologist08"},
			MapTimerStart	{Name = "mt_AltarTimer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_AltarTimer", Seconds = 2},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Archeologist", TextTag = "Archeologist09"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_AltarTimer", Seconds = 5},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Archeologist", TextTag = "Archeologist10"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_AltarTimer", Seconds = 9},
			AND
			{
				OR
				{
					FigureIsInEntityRange	{Tag = "pl_Human1Avatar", TargetTag = "Archeologist", Range = 18},
					FigureIsInEntityRange	{Tag = "pl_Human2Avatar", TargetTag = "Archeologist", Range = 18},
					FigureIsInEntityRange	{Tag = "pl_Human3Avatar", TargetTag = "Archeologist", Range = 18},
				},
			},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Archeologist", TextTag = "Archeologist11"},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 949, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 949, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 949, Amount = 1},
			MapFlagSetTrue {Name = "mf_ArcheologistReward"},
			MapTimerStop {Name = "mt_AltarTimer"},
			QuestSetSolved 	{Player = "pl_Human1", Quest = "CoopMapQuestFireForge"},
			QuestSetSolved 	{Player = "pl_Human2", Quest = "CoopMapQuestFireForge"},
			QuestSetSolved 	{Player = "pl_Human3", Quest = "CoopMapQuestFireForge"},
		},
	},
};

