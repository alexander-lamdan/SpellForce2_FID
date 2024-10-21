dofile(GetScriptPath().."Constant.lua")



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
			FogOfWarReveal {X = 138, Y = 232, Range = 40},
			FogOfWarReveal {X = 239, Y = 232, Range = 40},
			FogOfWarReveal {X = 238, Y = 135, Range = 40},
			FogOfWarReveal {X = 138, Y = 140, Range = 40},	
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = AllWon},
			AvatarIsNotTalking {},
		},
		Actions =
		{
			TutorialCameraCenterOnEntity {Tag = "GraveSpot"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P465_Chest"},
		},
		Actions =
		{
			ObjectSpawnToEntity {ObjectId = 1272, TargetTag = "pl_HumanAvatar", Tag = "Chest", Direction = 0},
			ObjectLootItemEquipmentAdd {Tag = "Chest", ItemId = 1115},
			ObjectLootItemEquipmentAdd {Tag = "Chest", ItemId = 1116},
			ObjectLootItemEquipmentAdd {Tag = "Chest", ItemId = 1117},
		},
	},
	-- Solange der Spieler kämpft hat Marune keinen Dialog
	OnToggleEvent
	{
		OnConditions =
		{
			MapFlagIsTrue {Name = "mf_P465_ArenaFightRunning"},
		},
		OnActions =
		{
			DialogSetDisabled {Tag = "Marune"},
			ObjectVanish {Tag = "FirstSilver"},
			ObjectVanish {Tag = "SecondSilver"},
			ObjectVanish {Tag = "ThirdSilver"},
			ObjectVanish {Tag = "FourthSilver"},
			ObjectVanish {Tag = "FifthSilver"},
			ObjectVanish {Tag = "FirstLenya"},
			ObjectVanish {Tag = "SecondLenya"},
			ObjectVanish {Tag = "ThirdLenya"},
			ObjectVanish {Tag = "FourthLenya"},
			ObjectVanish {Tag = "FifthLenya"},
			ObjectSpawn {Direction = 0, ObjectId = 2474, X = 214, Y = 198, Tag = "FirstSilver"},
			ObjectSpawn {Direction = 0, ObjectId = 2474, X = 257, Y = 167, Tag = "SecondSilver"},
			ObjectSpawn {Direction = 0, ObjectId = 2474, X = 226, Y = 147, Tag = "ThirdSilver"},
			ObjectSpawn {Direction = 0, ObjectId = 2474, X = 173, Y = 135, Tag = "FourthSilver"},
			ObjectSpawn {Direction = 0, ObjectId = 2474, X = 120, Y = 170, Tag = "FifthSilver"},
			ObjectSpawn {Direction = 0, ObjectId = 2475, X = 154, Y = 212, Tag = "FirstLenya"},
			ObjectSpawn {Direction = 0, ObjectId = 2475, X = 200, Y = 210, Tag = "SecondLenya"},
			ObjectSpawn {Direction = 0, ObjectId = 2475, X = 207, Y = 147, Tag = "ThirdLenya"},
			ObjectSpawn {Direction = 0, ObjectId = 2475, X = 187, Y = 107, Tag = "FourthLenya"},
			ObjectSpawn {Direction = 0, ObjectId = 2475, X = 247, Y = 180, Tag = "FifthLenya"},
			MapValueSet {Name = "mv_P465_GatheredSilver", Value = 0},
			MapValueSet {Name = "mv_P465_GatheredLenya", Value = 0},
		},
		OffConditions =
		{
			MapFlagIsFalse {Name = "mf_P465_ArenaFightRunning"},
			AvatarValueIsNotEqual {Name = "av_P465_ArenaState", Value = AllWon}
		},
		OffActions =
		{
			DialogSetEnabled {Tag = "Marune"},
			-- Wenn kein Kampf läuft dürfen auch die Hilfseinheiten nicht mehr da sein
			FigureVanish {Tag = "GraveYardWB1"},
			FigureVanish {Tag = "GraveYardWB2"},
			FigureVanish {Tag = "GraveYardWB3"},
			FigureVanish {Tag = "GraveYardWB4"},
			FigureVanish {Tag = "GraveYardWB5"},
			FigureVanish {Tag = "GraveYardWOB1"},
			FigureVanish {Tag = "GraveYardWOB2"},
			FigureVanish {Tag = "GraveYardWOB3"},
			FigureVanish {Tag = "GraveYardWOB4"},
			FigureVanish {Tag = "GraveYardWOB5"},
			FigureVanish {Tag = "SilverSurfer"},
			FigureVanish {Tag = "LenyaSurfer"},
		},
	},
	-- Wenn alles gewonnen ist gibt es die Belohnung
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = AllWon},
		},
		Actions = 
		{
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			
		},
		Actions =
		{
			
			--Initalisierung der Effekte
			EffectStart {Tag = "HealEffect", File = "Effect_Heal_Hit"},
			EffectStart {Tag = "ManaEffect", File = "Effect_Meditate_Hit"},
			-- Laternen an
			EffectStart {Tag = "HealMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker05", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker05", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker1", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker2", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker3", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker4", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker5", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker05", File = "Effect_Misc_ElvenLantern01"},
			
			MapTimerStart {Name = "mt_P465_EffectLoop"},
			MapTimerStart {Name = "mt_P465_Delay"},
			MapValueSet {Name = "mv_P465_Charges", Value = charges},
		}
	},
	-- Immer wieder den Effekt starten, damit es gut aussieht
	OnEvent
	{
		Conditions =
		{
			MapTimerIsElapsed {Name = "mt_P465_EffectLoop", Seconds = 2},
			MapTimerIsElapsed {Name = "mt_P465_Delay", Seconds = recastTimeBuffStepTrigger},
		},
		Actions =
		{
			MapTimerStart {Name = "mt_P465_EffectLoop"},
			EffectStart {Tag = "HealEffect", File = "Effect_Heal_Hit"},
			EffectStart {Tag = "ManaEffect", File = "Effect_Meditate_Hit"},
		},
	},
	-- Immer wenn der Spieler in den Healkreis tritt wird er geheilt, wenn er nicht zu schnell dort ist
	OnEvent
	{
		Conditions =
		{
			PlayerFigureIsInRangeToEntity {TargetTag = "HealEffect", Range = 7},
			MapTimerIsElapsed {Name = "mt_P465_Delay", Seconds = recastTimeBuffStepTrigger},
			MapValueIsGreater {Name = "mv_P465_Charges", Value = 0},
		},
		Actions =
		{
			FigureHealthAdd {Tag = "pl_HumanAvatar", Percent = restoreHealth},
			FigureHealthAdd {Tag = "pl_HumanCoopWarrior_AddOn1", Percent = restoreHealth},
			FigureHealthAdd {Tag = "pl_HumanCoopHealer_AddOn1", Percent = restoreHealth},
			FigureHealthAdd {Tag = "pl_HumanCoopMage_AddOn1", Percent = restoreHealth},
			FigureHealthAdd {Tag = "pl_HumanCoopArcher_AddOn1", Percent = restoreHealth},
			FigureHealthAdd {Tag = "pl_HumanCoopAssassin_AddOn1", Percent = restoreHealth},
			FigureHealthAdd {Tag = "pl_HumanCoopAdventurer1_AddOn1", Percent = restoreHealth},
			FigureHealthAdd {Tag = "pl_HumanCoopAdventurer2_AddOn1", Percent = restoreHealth},
			FigureHealthAdd {Tag = "pl_HumanCoopAdventurer3_AddOn1", Percent = restoreHealth},
			FigureHealthAdd {Tag = "pl_HumanCoopAdventurer4_AddOn1", Percent = restoreHealth},
			FigureHealthAdd {Tag = "pl_HumanCoopAdventurer5_AddOn1", Percent = restoreHealth},
			FigureHealthAdd {Tag = "pl_HumanCoopWarrior", Percent = restoreHealth},
			FigureHealthAdd {Tag = "pl_HumanCoopHealer", Percent = restoreHealth},
			FigureHealthAdd {Tag = "pl_HumanCoopArcher", Percent = restoreHealth},
			FigureHealthAdd {Tag = "pl_HumanCoopMage", Percent = restoreHealth},
			FigureHealthAdd {Tag = "pl_HumanCoopAssasin", Percent = restoreHealth},
			FigureHealthAdd {Tag = "pl_HumanCoopAdventurer1", Percent = restoreHealth},
			FigureHealthAdd {Tag = "pl_HumanCoopAdventurer2", Percent = restoreHealth},
			FigureHealthAdd {Tag = "pl_HumanCoopAdventurer3", Percent = restoreHealth},
			FigureHealthAdd {Tag = "pl_HumanCoopAdventurer4", Percent = restoreHealth},
			FigureHealthAdd {Tag = "pl_HumanCoopAdventurer5", Percent = restoreHealth},
			MapValueDecrease {Name = "mv_P465_Charges", Value = 1},
			MapTimerStart {Name = "mt_P465_Delay"},
		},
	},
	-- Immer wenn der Spieler in den Manakreis tritt wird er geheilt, wenn er nicht zu schnell dort ist
	OnEvent
	{
		Conditions =
		{
			PlayerFigureIsInRangeToEntity {TargetTag = "ManaEffect", Range = 7},
			MapTimerIsElapsed {Name = "mt_P465_Delay", Seconds = recastTimeBuffStepTrigger},
			MapValueIsGreater {Name = "mv_P465_Charges", Value = 0},
		},
		Actions =
		{
			FigureManaAdd {Tag = "pl_HumanAvatar", Percent = restoreMana},
			FigureManaAdd {Tag = "pl_HumanCoopWarrior_AddOn1", Percent = restoreMana},
			FigureManaAdd {Tag = "pl_HumanCoopHealer_AddOn1", Percent = restoreMana},
			FigureManaAdd {Tag = "pl_HumanCoopMage_AddOn1", Percent = restoreMana},
			FigureManaAdd {Tag = "pl_HumanCoopArcher_AddOn1", Percent = restoreMana},
			FigureManaAdd {Tag = "pl_HumanCoopAssassin_AddOn1", Percent = restoreMana},
			FigureManaAdd {Tag = "pl_HumanCoopAdventurer1_AddOn1", Percent = restoreMana},
			FigureManaAdd {Tag = "pl_HumanCoopAdventurer2_AddOn1", Percent = restoreMana},
			FigureManaAdd {Tag = "pl_HumanCoopAdventurer3_AddOn1", Percent = restoreMana},
			FigureManaAdd {Tag = "pl_HumanCoopAdventurer4_AddOn1", Percent = restoreMana},
			FigureManaAdd {Tag = "pl_HumanCoopAdventurer5_AddOn1", Percent = restoreMana},
			FigureManaAdd {Tag = "pl_HumanCoopWarrior", Percent = restoreMana},
			FigureManaAdd {Tag = "pl_HumanCoopHealer", Percent = restoreMana},
			FigureManaAdd {Tag = "pl_HumanCoopArcher", Percent = restoreMana},
			FigureManaAdd {Tag = "pl_HumanCoopMage", Percent = restoreMana},
			FigureManaAdd {Tag = "pl_HumanCoopAssasin", Percent = restoreMana},
			FigureManaAdd {Tag = "pl_HumanCoopAdventurer1", Percent = restoreMana},
			FigureManaAdd {Tag = "pl_HumanCoopAdventurer2", Percent = restoreMana},
			FigureManaAdd {Tag = "pl_HumanCoopAdventurer3", Percent = restoreMana},
			FigureManaAdd {Tag = "pl_HumanCoopAdventurer4", Percent = restoreMana},
			FigureManaAdd {Tag = "pl_HumanCoopAdventurer5", Percent = restoreMana},
			MapValueDecrease {Name = "mv_P465_Charges", Value = 1},
			MapTimerStart {Name = "mt_P465_Delay"},
		},
	},
	-- Die Marker auschalten
	OnEvent
	{
		Conditions =
		{
			MapValueIsEqual {Name = "mv_P465_Charges", Value = 4},
			MapFlagIsFalse {Name = "mf_P465_LaternOneOff"},
		},
		Actions =
		{
			EffectStop {Tag = "HealMarker01"},
			EffectStop {Tag = "ManaMarker01"},
			EffectStop {Tag = "Spellmarker1"},
			EffectStop {Tag = "GraveyardMarker01"},
			MapFlagSetTrue {Name = "mf_P465_LaternOneOff"},

		},
	},
	OnEvent
	{
		Conditions =
		{
			MapValueIsEqual {Name = "mv_P465_Charges", Value = 3},
			MapFlagIsFalse {Name = "mf_P465_LaternTwoOff"},
		},
		Actions =
		{
			EffectStop {Tag = "HealMarker02"},
			EffectStop {Tag = "ManaMarker02"},
			EffectStop {Tag = "Spellmarker2"},
			EffectStop {Tag = "GraveyardMarker02"},
			MapFlagSetTrue {Name = "mf_P465_LaternTwoOff"},

		},
	},
	OnEvent
	{
		Conditions =
		{
			MapValueIsEqual {Name = "mv_P465_Charges", Value = 2},
			MapFlagIsFalse {Name = "mf_P465_LaternThreeOff"},
		},
		Actions =
		{
			EffectStop {Tag = "HealMarker03"},
			EffectStop {Tag = "ManaMarker03"},
			EffectStop {Tag = "Spellmarker3"},
			EffectStop {Tag = "GraveyardMarker03"},
			MapFlagSetTrue {Name = "mf_P465_LaternThreeOff"},

		},
	},
	OnEvent
	{
		Conditions =
		{
			MapValueIsEqual {Name = "mv_P465_Charges", Value = 1},
			MapFlagIsFalse {Name = "mf_P465_LaternFourOff"},
		},
		Actions =
		{
			EffectStop {Tag = "HealMarker04"},
			EffectStop {Tag = "ManaMarker04"},
			EffectStop {Tag = "Spellmarker4"},
			EffectStop {Tag = "GraveyardMarker04"},
			MapFlagSetTrue {Name = "mf_P465_LaternFourOff"},

		},
	},
	OnEvent
	{
		Conditions =
		{
			MapValueIsEqual {Name = "mv_P465_Charges", Value = 0},
			MapFlagIsFalse {Name = "mf_P465_LaternFiveOff"},
		},
		Actions =
		{
			EffectStop {Tag = "HealMarker05"},
			EffectStop {Tag = "ManaMarker05"},
			EffectStop {Tag = "Spellmarker5"},
			EffectStop {Tag = "GraveyardMarker05"},
			MapFlagSetTrue {Name = "mf_P465_LaternFiveOff"},

		},
	},
	
	-- Hilfsobjekte Spawnen für den Spieler
	OnEvent
	{
		Conditions =
		{
			PlayerFigureIsInRangeToEntity {TargetTag = "FirstSilver", Range = 4},
			EntityIsExisting {Tag = "FirstSilver"},
		},
		Actions =
		{
			ObjectVanish {Tag = "FirstSilver"},
			MapValueIncrease {Name = "mv_P465_GatheredSilver"}
		},
	},
	OnEvent
	{
		Conditions =
		{
			PlayerFigureIsInRangeToEntity {TargetTag = "SecondSilver", Range = 4},
			EntityIsExisting {Tag = "SecondSilver"},
		},
		Actions =
		{
			ObjectVanish {Tag = "SecondSilver"},
			MapValueIncrease {Name = "mv_P465_GatheredSilver"}
		},
	},
	OnEvent
	{
		Conditions =
		{
			PlayerFigureIsInRangeToEntity {TargetTag = "ThirdSilver", Range = 4},
			EntityIsExisting {Tag = "ThirdSilver"},
		},
		Actions =
		{
			ObjectVanish {Tag = "ThirdSilver"},
			MapValueIncrease {Name = "mv_P465_GatheredSilver"}
		},
	},
	OnEvent
	{
		Conditions =
		{
			PlayerFigureIsInRangeToEntity {TargetTag = "FourthSilver", Range = 4},
			EntityIsExisting {Tag = "FourthSilver"},
		},
		Actions =
		{
			ObjectVanish {Tag = "FourthSilver"},
			MapValueIncrease {Name = "mv_P465_GatheredSilver"}
		},
	},
	OnEvent
	{
		Conditions =
		{
			PlayerFigureIsInRangeToEntity {TargetTag = "FifthSilver", Range = 4},
			EntityIsExisting {Tag = "FifthSilver"},
		},
		Actions =
		{
			ObjectVanish {Tag = "FifthSilver"},
			MapValueIncrease {Name = "mv_P465_GatheredSilver"}
		},
	},
	OnEvent
	{
		Conditions =
		{
			PlayerFigureIsInRangeToEntity {TargetTag = "FirstLenya", Range = 4},
			EntityIsExisting {Tag = "FirstLenya"},
		},
		Actions =
		{
			ObjectVanish {Tag = "FirstLenya"},
			MapValueIncrease {Name = "mv_P465_GatheredLenya"}
		},
	},
	OnEvent
	{
		Conditions =
		{
			PlayerFigureIsInRangeToEntity {TargetTag = "SecondLenya", Range = 4},
			EntityIsExisting {Tag = "SecondLenya"},
		},
		Actions =
		{
			ObjectVanish {Tag = "SecondLenya"},
			MapValueIncrease {Name = "mv_P465_GatheredLenya"}
		},
	},
	OnEvent
	{
		Conditions =
		{
			PlayerFigureIsInRangeToEntity {TargetTag = "ThirdLenya", Range = 4},
			EntityIsExisting {Tag = "ThirdLenya"},
		},
		Actions =
		{
			ObjectVanish {Tag = "ThirdLenya"},
			MapValueIncrease {Name = "mv_P465_GatheredLenya"}
		},
	},
	OnEvent
	{
		Conditions =
		{
			PlayerFigureIsInRangeToEntity {TargetTag = "FourthLenya", Range = 4},
			EntityIsExisting {Tag = "FourthLenya"},
		},
		Actions =
		{
			ObjectVanish {Tag = "FourthLenya"},
			MapValueIncrease {Name = "mv_P465_GatheredLenya"}
		},
	},
	OnEvent
	{
		Conditions =
		{
			PlayerFigureIsInRangeToEntity {TargetTag = "FifthLenya", Range = 4},
			EntityIsExisting {Tag = "FifthLenya"},
		},
		Actions =
		{
			ObjectVanish {Tag = "FifthLenya"},
			MapValueIncrease {Name = "mv_P465_GatheredLenya"}
		},
	},
	-- Bosse tot, dann Runde ändern
	OnEvent
	{
		Conditions =
		{
			AvatarHasItemMisc {ItemId = 403, Amount = 1},
			AvatarHasNotItemMisc {ItemId = 404, Amount = 1},
			AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = Choice2a},
			FigureIsDead {Tag = "Boss01"},
			FigureIsDead {Tag = "Boss01Add1"},
			FigureIsDead {Tag = "Boss01Add2"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P465_ArenaFightRunning"},
			MapFlagSetFalse {Name = "mf_P465_LaternOneOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternTwoOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternThreeOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternFourOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternFiveOff"},
			MapValueSet {Name = "mv_P465_Charges", Value = 5},
			AvatarValueSet {Name = "av_P465_ArenaState", Value = Choice2b},
			-- Laternen an
			EffectStart {Tag = "HealMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker05", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker05", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker1", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker2", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker3", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker4", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker5", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker05", File = "Effect_Misc_ElvenLantern01"},			
		},
	},
	OnEvent
	{
		Conditions =
		{
			AvatarHasItemMisc {ItemId = 404, Amount = 1},
			AvatarHasNotItemMisc {ItemId = 405, Amount = 1},
			AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = Choice2b},
			FigureIsDead {Tag = "Boss02"},
			FigureIsDead {Tag = "Boss02Add1"},
			FigureIsDead {Tag = "Boss02Add2"},
			FigureIsDead {Tag = "Boss02Add3"},
			FigureIsDead {Tag = "Boss02Add4"},
			FigureIsDead {Tag = "Boss02Add5"},
			FigureIsDead {Tag = "Boss02Add6"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P465_ArenaFightRunning"},
			MapFlagSetFalse {Name = "mf_P465_LaternOneOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternTwoOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternThreeOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternFourOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternFiveOff"},
			MapValueSet {Name = "mv_P465_Charges", Value = 5},
			AvatarValueSet {Name = "av_P465_ArenaState", Value = Choice2c},
			-- Laternen an
			EffectStart {Tag = "HealMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker05", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker05", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker1", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker2", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker3", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker4", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker5", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker05", File = "Effect_Misc_ElvenLantern01"},		
		},
	},
	OnEvent
	{
		Conditions =
		{
			AvatarHasItemMisc {ItemId = 405, Amount = 1},
			AvatarHasNotItemMisc {ItemId = 406, Amount = 1},
			AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = Choice2c},
			FigureIsDead {Tag = "Boss03"},
			FigureIsDead {Tag = "Boss03Add1"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P465_ArenaFightRunning"},
			MapFlagSetFalse {Name = "mf_P465_LaternOneOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternTwoOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternThreeOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternFourOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternFiveOff"},
			MapValueSet {Name = "mv_P465_Charges", Value = 5},
			AvatarValueSet {Name = "av_P465_ArenaState", Value = Choice2d},
			-- Laternen an
			EffectStart {Tag = "HealMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker05", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker05", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker1", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker2", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker3", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker4", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker5", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker05", File = "Effect_Misc_ElvenLantern01"},		
		},
	},
	OnEvent
	{
		Conditions =
		{
			AvatarHasItemMisc {ItemId = 406, Amount = 1},
			AvatarHasNotItemMisc {ItemId = 407, Amount = 1},
			AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = Choice2d},
			FigureIsDead {Tag = "Boss04"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P465_ArenaFightRunning"},
			MapFlagSetFalse {Name = "mf_P465_LaternOneOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternTwoOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternThreeOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternFourOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternFiveOff"},
			MapValueSet {Name = "mv_P465_Charges", Value = 5},
			AvatarValueSet {Name = "av_P465_ArenaState", Value = Choice2e},
			-- Laternen an
			EffectStart {Tag = "HealMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker05", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker05", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker1", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker2", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker3", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker4", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker5", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker05", File = "Effect_Misc_ElvenLantern01"},		
		},
	},
	OnEvent
	{
		Conditions =
		{
			AvatarHasItemMisc {ItemId = 407, Amount = 1},
			AvatarHasNotItemMisc {ItemId = 408, Amount = 1},
			AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = Choice2e},
			FigureIsDead {Tag = "Boss05"},
			FigureIsDead {Tag = "Boss05Add1"},
			FigureIsDead {Tag = "Boss05Add2"},
			FigureIsDead {Tag = "Boss05Add3"},
			FigureIsDead {Tag = "Boss05Add4"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P465_ArenaFightRunning"},
			MapFlagSetFalse {Name = "mf_P465_LaternOneOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternTwoOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternThreeOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternFourOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternFiveOff"},
			MapValueSet {Name = "mv_P465_Charges", Value = 5},
			AvatarValueSet {Name = "av_P465_ArenaState", Value = Choice2f},
			-- Laternen an
			EffectStart {Tag = "HealMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker05", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker05", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker1", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker2", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker3", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker4", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker5", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker05", File = "Effect_Misc_ElvenLantern01"},		
		},
	},
	OnEvent
	{
		Conditions =
		{
			AvatarHasItemMisc {ItemId = 408, Amount = 1},
			AvatarHasNotItemMisc {ItemId = 409, Amount = 1},
			AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = Choice2f},
			FigureIsDead {Tag = "Boss06"},
			FigureIsDead {Tag = "Boss06Add1"},
			FigureIsDead {Tag = "Boss06Add2"},
			FigureIsDead {Tag = "Boss06Add3"},
			FigureIsDead {Tag = "Boss06Add4"},
			FigureIsDead {Tag = "Boss06Add5"},
			FigureIsDead {Tag = "Boss06Add6"},
			FigureIsDead {Tag = "Boss06Add7"},
			FigureIsDead {Tag = "Boss06Add8"},
			FigureIsDead {Tag = "Boss06Add9"},
			FigureIsDead {Tag = "Boss06Add10"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P465_ArenaFightRunning"},
			MapFlagSetFalse {Name = "mf_P465_LaternOneOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternTwoOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternThreeOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternFourOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternFiveOff"},
			MapValueSet {Name = "mv_P465_Charges", Value = 5},
			AvatarValueSet {Name = "av_P465_ArenaState", Value = Choice2g},
			-- Laternen an
			EffectStart {Tag = "HealMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker05", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker05", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker1", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker2", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker3", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker4", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker5", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker05", File = "Effect_Misc_ElvenLantern01"},		
		},
	},
	OnEvent
	{
		Conditions =
		{
			AvatarHasItemMisc {ItemId = 409, Amount = 1},
			AvatarHasNotItemMisc {ItemId = 410, Amount = 1},
			AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = Choice2g},
			FigureIsDead {Tag = "Boss07"},
			FigureIsDead {Tag = "Boss07Add1"},
			FigureIsDead {Tag = "Boss07Add2"},
			FigureIsDead {Tag = "Boss07Add3"},
			FigureIsDead {Tag = "Boss07Add4"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P465_ArenaFightRunning"},
			MapFlagSetFalse {Name = "mf_P465_LaternOneOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternTwoOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternThreeOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternFourOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternFiveOff"},
			MapValueSet {Name = "mv_P465_Charges", Value = 5},
			AvatarValueSet {Name = "av_P465_ArenaState", Value = Choice2h},
			-- Laternen an
			EffectStart {Tag = "HealMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker05", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker05", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker1", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker2", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker3", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker4", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker5", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker05", File = "Effect_Misc_ElvenLantern01"},		
		},
	},
	OnEvent
	{
		Conditions =
		{
			AvatarHasItemMisc {ItemId = 410, Amount = 1},
			AvatarHasNotItemMisc {ItemId = 411, Amount = 1},
			AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = Choice2h},
			FigureIsDead {Tag = "Boss08"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P465_ArenaFightRunning"},
			MapFlagSetFalse {Name = "mf_P465_LaternOneOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternTwoOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternThreeOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternFourOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternFiveOff"},
			MapValueSet {Name = "mv_P465_Charges", Value = 5},
			AvatarValueSet {Name = "av_P465_ArenaState", Value = Choice2i},
			-- Laternen an
			EffectStart {Tag = "HealMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker05", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker05", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker1", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker2", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker3", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker4", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker5", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker05", File = "Effect_Misc_ElvenLantern01"},	
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc {ItemId = 411, Amount = 1},
			AvatarHasItemMisc {ItemId = 412, Amount = 1},
			AvatarValueIsEqual {Name = "av_P465_ArenaState", Value = Choice2i},
			FigureIsDead {Tag = "Boss09"},
			FigureIsDead {Tag = "Boss09Add1"},
			FigureIsDead {Tag = "Boss09Add2"},
			FigureIsDead {Tag = "Boss09Add3"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P465_ArenaFightRunning"},
			MapFlagSetFalse {Name = "mf_P465_LaternOneOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternTwoOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternThreeOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternFourOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternFiveOff"},
			MapValueSet {Name = "mv_P465_Charges", Value = 5},
			AvatarValueSet {Name = "av_P465_ArenaState", Value = Choice2j},
			-- Laternen an
			EffectStart {Tag = "HealMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker05", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker05", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker1", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker2", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker3", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker4", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker5", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker05", File = "Effect_Misc_ElvenLantern01"},		
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead {Tag = "Boss10"},
			FigureIsDead {Tag = "Boss10Add1"},
			FigureIsDead {Tag = "Boss10Add2"},
			FigureIsDead {Tag = "Boss10Add3"},
			FigureIsDead {Tag = "Boss10Add4"},
			FigureIsDead {Tag = "Boss10Add5"},
			FigureIsDead {Tag = "Boss10Add6"},
			FigureIsDead {Tag = "Boss10Add7"},
			MapFlagIsTrue {Name = "mf_P465_Boss10Spawned"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P465_ArenaFightRunning"},
			MapFlagSetFalse {Name = "mf_P465_LaternOneOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternTwoOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternThreeOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternFourOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternFiveOff"},
			MapValueSet {Name = "mv_P465_Charges", Value = 5},
			AvatarValueSet {Name = "av_P465_ArenaState", Value = Choice2k},
			-- Laternen an
			EffectStart {Tag = "HealMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "HealMarker05", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "ManaMarker05", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker1", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker2", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker3", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker4", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "Spellmarker5", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker01", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker02", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker03", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker04", File = "Effect_Misc_ElvenLantern01"},
			EffectStart {Tag = "GraveyardMarker05", File = "Effect_Misc_ElvenLantern01"},		
		},
	},
	-- Gucken ob die einzelnen Gruppen tot sind
	OnToggleEvent
	{
		OnConditions =
		{
			FigureIsAlive {Tag = "GraveYardWB1"},
			FigureIsAlive {Tag = "GraveYardWB1a"},
			FigureIsAlive {Tag = "GraveYardWB1b"},
			FigureIsAlive {Tag = "GraveYardWB1c"},
		},
		OnActions =
		{
			MapValueDecrease {Name = "mv_P465_Charges", Value = 1},
			MapFlagSetTrue {Name = "mf_P465_WBGroup1Spawned"},
		},
		OffConditions =
		{
			FigureIsDead {Tag = "GraveYardWB1"},
			FigureIsDead {Tag = "GraveYardWB1a"},
			FigureIsDead {Tag = "GraveYardWB1b"},
			FigureIsDead {Tag = "GraveYardWB1c"},
		},
		OffActions =
		{
			MapFlagSetFalse {Name = "mf_P465_WBGroup1Spawned"},
		},
	},
	OnToggleEvent
	{
		OnConditions =
		{
			FigureIsAlive {Tag = "GraveYardWOB1"},
			FigureIsAlive {Tag = "GraveYardWOB1a"},
			FigureIsAlive {Tag = "GraveYardWOB1b"},
		},
		OnActions =
		{
			MapValueDecrease {Name = "mv_P465_Charges", Value = 1},
			MapFlagSetTrue {Name = "mf_P465_WOBGroup1Spawned"},
		},
		OffConditions =
		{
			FigureIsDead {Tag = "GraveYardWOB1"},
			FigureIsDead {Tag = "GraveYardWOB1a"},
			FigureIsDead {Tag = "GraveYardWOB1b"},
		},
		OffActions =
		{
			MapFlagSetFalse {Name = "mf_P465_WOBGroup1Spawned"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarHasItemMisc {ItemId = 403, Amount = 1},
			FigureIsDead {Tag = "Boss01"},
			FigureIsDead {Tag = "Boss01Add1"},
			FigureIsDead {Tag = "Boss01Add2"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P465_ArenaFightRunning"},
			MapFlagSetFalse {Name = "mf_P465_LaternOneOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternTwoOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternThreeOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternFourOff"},
			MapFlagSetFalse {Name = "mf_P465_LaternFiveOff"},
			MapValueSet {Name = "mv_P465_Charges", Value = 5},
			
		},
	},
	-- Gruppe zwei
	-- Gucken ob die einzelnen Gruppen tot sind
	OnToggleEvent
	{
		OnConditions =
		{
			FigureIsAlive {Tag = "GraveYardWB2"},
			FigureIsAlive {Tag = "GraveYardWB2a"},
			FigureIsAlive {Tag = "GraveYardWB2b"},
			FigureIsAlive {Tag = "GraveYardWB2c"},
		},
		OnActions =
		{
			MapValueDecrease {Name = "mv_P465_Charges", Value = 1},
			MapFlagSetTrue {Name = "mf_P465_WBGroup2Spawned"},
		},
		OffConditions =
		{
			FigureIsDead {Tag = "GraveYardWB2"},
			FigureIsDead {Tag = "GraveYardWB2a"},
			FigureIsDead {Tag = "GraveYardWB2b"},
			FigureIsDead {Tag = "GraveYardWB2c"},
		},
		OffActions =
		{
			MapFlagSetFalse {Name = "mf_P465_WBGroup2Spawned"},
		},
	},
	OnToggleEvent
	{
		OnConditions =
		{
			FigureIsAlive {Tag = "GraveYardWOB2"},
			FigureIsAlive {Tag = "GraveYardWOB2a"},
			FigureIsAlive {Tag = "GraveYardWOB2b"},
		},
		OnActions =
		{
			MapValueDecrease {Name = "mv_P465_Charges", Value = 1},
			MapFlagSetTrue {Name = "mf_P465_WOBGroup2Spawned"},
		},
		OffConditions =
		{
			FigureIsDead {Tag = "GraveYardWOB2"},
			FigureIsDead {Tag = "GraveYardWOB2a"},
			FigureIsDead {Tag = "GraveYardWOB2b"},
		},
		OffActions =
		{
			MapFlagSetFalse {Name = "mf_P465_WOBGroup2Spawned"},
		},
	},
	-- Gruppe drei
	-- Gucken ob die einzelnen Gruppen tot sind
	OnToggleEvent
	{
		OnConditions =
		{
			FigureIsAlive {Tag = "GraveYardWB3"},
			FigureIsAlive {Tag = "GraveYardWB3a"},
			FigureIsAlive {Tag = "GraveYardWB3b"},
			FigureIsAlive {Tag = "GraveYardWB3c"},
		},
		OnActions =
		{
			MapValueDecrease {Name = "mv_P465_Charges", Value = 1},
			MapFlagSetTrue {Name = "mf_P465_WBGroup3Spawned"},
		},
		OffConditions =
		{
			FigureIsDead {Tag = "GraveYardWB3"},
			FigureIsDead {Tag = "GraveYardWB3a"},
			FigureIsDead {Tag = "GraveYardWB3b"},
			FigureIsDead {Tag = "GraveYardWB3c"},
		},
		OffActions =
		{
			MapFlagSetFalse {Name = "mf_P465_WBGroup3Spawned"},
		},
	},
	OnToggleEvent
	{
		OnConditions =
		{
			FigureIsAlive {Tag = "GraveYardWOB3"},
			FigureIsAlive {Tag = "GraveYardWOB3a"},
			FigureIsAlive {Tag = "GraveYardWOB3b"},
		},
		OnActions =
		{
			MapValueDecrease {Name = "mv_P465_Charges", Value = 1},
			MapFlagSetTrue {Name = "mf_P465_WOBGroup3Spawned"},
		},
		OffConditions =
		{
			FigureIsDead {Tag = "GraveYardWOB3"},
			FigureIsDead {Tag = "GraveYardWOB3a"},
			FigureIsDead {Tag = "GraveYardWOB3b"},
		},
		OffActions =
		{
			MapFlagSetFalse {Name = "mf_P465_WOBGroup3Spawned"},
		},
	},
	-- Gruppe 4
	OnToggleEvent
	{
		OnConditions =
		{
			FigureIsAlive {Tag = "GraveYardWB4"},
			FigureIsAlive {Tag = "GraveYardWB4a"},
			FigureIsAlive {Tag = "GraveYardWB4b"},
			FigureIsAlive {Tag = "GraveYardWB4c"},
		},
		OnActions =
		{
			MapValueDecrease {Name = "mv_P465_Charges", Value = 1},
			MapFlagSetTrue {Name = "mf_P465_WBGroup4Spawned"},
		},
		OffConditions =
		{
			FigureIsDead {Tag = "GraveYardWB4"},
			FigureIsDead {Tag = "GraveYardWB4a"},
			FigureIsDead {Tag = "GraveYardWB4b"},
			FigureIsDead {Tag = "GraveYardWB4c"},
		},
		OffActions =
		{
			MapFlagSetFalse {Name = "mf_P465_WBGroup4Spawned"},
		},
	},
	OnToggleEvent
	{
		OnConditions =
		{
			FigureIsAlive {Tag = "GraveYardWOB4"},
			FigureIsAlive {Tag = "GraveYardWOB4a"},
			FigureIsAlive {Tag = "GraveYardWOB4b"},
		},
		OnActions =
		{
			MapValueDecrease {Name = "mv_P465_Charges", Value = 1},
			MapFlagSetTrue {Name = "mf_P465_WOBGroup4Spawned"},
		},
		OffConditions =
		{
			FigureIsDead {Tag = "GraveYardWOB4"},
			FigureIsDead {Tag = "GraveYardWOB4a"},
			FigureIsDead {Tag = "GraveYardWOB4b"},
		},
		OffActions =
		{
			MapFlagSetFalse {Name = "mf_P465_WOBGroup4Spawned"},
		},
	},
	-- Gruppe 5
	OnToggleEvent
	{
		OnConditions =
		{
			FigureIsAlive {Tag = "GraveYardWB5"},
			FigureIsAlive {Tag = "GraveYardWB5a"},
			FigureIsAlive {Tag = "GraveYardWB5b"},
			FigureIsAlive {Tag = "GraveYardWB5c"},
		},
		OnActions =
		{
			MapValueDecrease {Name = "mv_P465_Charges", Value = 1},
			MapFlagSetTrue {Name = "mf_P465_WBGroup5Spawned"},
		},
		OffConditions =
		{
			FigureIsDead {Tag = "GraveYardWB5"},
			FigureIsDead {Tag = "GraveYardWB5a"},
			FigureIsDead {Tag = "GraveYardWB5b"},
			FigureIsDead {Tag = "GraveYardWB5c"},
		},
		OffActions =
		{
			MapFlagSetFalse {Name = "mf_P465_WBGroup5Spawned"},
		},
	},
	OnToggleEvent
	{
		OnConditions =
		{
			FigureIsAlive {Tag = "GraveYardWOB5"},
			FigureIsAlive {Tag = "GraveYardWOB5a"},
			FigureIsAlive {Tag = "GraveYardWOB5b"},
		},
		OnActions =
		{
			MapValueDecrease {Name = "mv_P465_Charges", Value = 1},
			MapFlagSetTrue {Name = "mf_P465_WOBGroup5Spawned"},
		},
		OffConditions =
		{
			FigureIsDead {Tag = "GraveYardWOB5"},
			FigureIsDead {Tag = "GraveYardWOB5a"},
			FigureIsDead {Tag = "GraveYardWOB5b"},
		},
		OffActions =
		{
			MapFlagSetFalse {Name = "mf_P465_WOBGroup5Spawned"},
		},
	},
	
	
	-- Loot
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P465_Boss1Spawned"},
			FigureIsDead {Tag = "Boss01"}
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P465_Boss1Spawned"},
			
			ObjectSpawnToEntity {ObjectId = 1272, TargetTag = "Boss01_Dead", Tag = "LootChest", Direction = 0},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1050},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1062},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1098},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1086},
		},
	},
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P465_Boss2Spawned"},
			FigureIsDead {Tag = "Boss02"}
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P465_Boss2Spawned"},
			
			ObjectSpawnToEntity {ObjectId = 1272, TargetTag = "Boss02_Dead", Tag = "LootChest", Direction = 0},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1025},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1051},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1042},
			ObjectSpawnToEntity {ObjectId = 1272, TargetTag = "Boss02_Dead", Tag = "LootChest2", Direction = 0},
			ObjectLootItemEquipmentAdd {Tag = "LootChest2", ItemId = 1082},
			ObjectLootItemEquipmentAdd {Tag = "LootChest2", ItemId = 1090},
			ObjectLootItemEquipmentAdd {Tag = "LootChest2", ItemId = 1094},
			ObjectSpawnToEntity {ObjectId = 1272, TargetTag = "Boss02_Dead", Tag = "LootChest3", Direction = 0},
			ObjectLootItemEquipmentAdd {Tag = "LootChest3", ItemId = 1043},
			ObjectLootItemEquipmentAdd {Tag = "LootChest3", ItemId = 1070},
			ObjectLootItemEquipmentAdd {Tag = "LootChest3", ItemId = 1102},
		},
	},
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P465_Boss3Spawned"},
			FigureIsDead {Tag = "Boss03"}
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P465_Boss3Spawned"},
			
			ObjectSpawnToEntity {ObjectId = 1272, TargetTag = "Boss03_Dead", Tag = "LootChest", Direction = 0},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1107},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1075},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1071},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1099},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1111},
		},
	},
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P465_Boss4Spawned"},
			FigureIsDead {Tag = "Boss04"}
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P465_Boss4Spawned"},
			
			ObjectSpawnToEntity {ObjectId = 1272, TargetTag = "Boss04_Dead", Tag = "LootChest", Direction = 0},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1053},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1052},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1045},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1044},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1083},
			ObjectSpawnToEntity {ObjectId = 1272, TargetTag = "Boss04_Dead", Tag = "LootChest2", Direction = 0},
			ObjectLootItemEquipmentAdd {Tag = "LootChest2", ItemId = 1091},
			ObjectLootItemEquipmentAdd {Tag = "LootChest2", ItemId = 1095},
			ObjectLootItemEquipmentAdd {Tag = "LootChest2", ItemId = 1087},
			ObjectLootItemEquipmentAdd {Tag = "LootChest2", ItemId = 1067},
		},
	},
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P465_Boss5Spawned"},
			FigureIsDead {Tag = "Boss05"}
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P465_Boss5Spawned"},
			
			ObjectSpawnToEntity {ObjectId = 1272, TargetTag = "Boss05_Dead", Tag = "LootChest", Direction = 0},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1068},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1112},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1060},
			ObjectSpawnToEntity {ObjectId = 1272, TargetTag = "Boss05_Dead", Tag = "LootChest2", Direction = 0},
			ObjectLootItemEquipmentAdd {Tag = "LootChest2", ItemId = 1104},
			ObjectLootItemEquipmentAdd {Tag = "LootChest2", ItemId = 1088},
			ObjectLootItemEquipmentAdd {Tag = "LootChest2", ItemId = 1096},
			
		},
	},
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P465_Boss6Spawned"},
			FigureIsDead {Tag = "Boss06"}
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P465_Boss6Spawned"},
			ObjectSpawnToEntity {ObjectId = 1272, TargetTag = "Boss06_Dead", Tag = "LootChest", Direction = 0},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1055},
		},
	},
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P465_Boss7Spawned"},
			FigureIsDead {Tag = "Boss07"}
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P465_Boss7Spawned"},
			
			ObjectSpawnToEntity {ObjectId = 1272, TargetTag = "Boss07_Dead", Tag = "LootChest", Direction = 0},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1084},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1092},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1100},
		},
	},
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P465_Boss8Spawned"},
			FigureIsDead {Tag = "Boss08"}
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P465_Boss8Spawned"},
			
			ObjectSpawnToEntity {ObjectId = 1272, TargetTag = "Boss08_Dead", Tag = "LootChest", Direction = 0},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1048},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1073},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1101},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1093},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1089},
			ObjectSpawnToEntity {ObjectId = 1272, TargetTag = "Boss08_Dead", Tag = "LootChest2", Direction = 0},
			ObjectLootItemEquipmentAdd {Tag = "LootChest2", ItemId = 1056},
		},
	},
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P465_Boss9Spawned"},
			FigureIsDead {Tag = "Boss09"}
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P465_Boss9Spawned"},
			
			ObjectSpawnToEntity {ObjectId = 1272, TargetTag = "Boss09_Dead", Tag = "LootChest", Direction = 0},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1029},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1057},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1049},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1065},
			ObjectLootItemEquipmentAdd {Tag = "LootChest", ItemId = 1085},
			ObjectSpawnToEntity {ObjectId = 1272, TargetTag = "Boss09_Dead", Tag = "LootChest2", Direction = 0},
			ObjectLootItemEquipmentAdd {Tag = "LootChest2", ItemId = 1097},
			ObjectLootItemEquipmentAdd {Tag = "LootChest2", ItemId = 1105},
			ObjectLootItemEquipmentAdd {Tag = "LootChest2", ItemId = 1113},
			ObjectLootItemEquipmentAdd {Tag = "LootChest2", ItemId = 1069},
		},
	},
	
};

