LOADSCRIPTLIST = true

State
{
	StateName = "INIT",


	OnOneTimeEvent
	{
		EventName = "enable Jandrim Dialog (fix for Bug 28751: solving CoopConjureNiethalfSolved too early)",
		Conditions = 
		{
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Name = "af_P333_JandrimDialogEnabled"},
			--AvatarFlagSetTrue	{Name = "af_P333_AnderhallDialogEnabled"},
			--AvatarFlagSetTrue	{Name = "af_P333_YliaDialogEnabled"},
			--AvatarFlagSetTrue	{Name = "af_P333_MersadionDialogEnabled"},
			DialogSetEnabled	{Tag = "Halicos"},
		},
	},
	OnOneTimeEvent
	{
		EventName = "crafting",
		Conditions = 
		{
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 2347, X = 409, Y = 355, Direction = 90, Tag = "crafting01"},
			ObjectSpawn	{ObjectId = 2347, X = 409, Y = 359, Direction = 90, Tag = "crafting03"},	
			ObjectSpawn	{ObjectId = 2347, X = 396, Y = 352, Direction = 270, Tag = "crafting02"},
			ObjectSpawn	{ObjectId = 2347, X = 396, Y = 355, Direction = 270, Tag = "crafting04"},
			MapFlagSetTrue	{Name = "mf_P333_Crafting"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "conjure Kor",
		Conditions = 
		{
			QuestIsSolved	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_KorJoined"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "ChieftainKor", Level = 1, UnitId = 142, X = 378, Y = 294, Team = "tm_Neutral"},
			FigureDirectionSetToEntity	{TargetTag = "Halicos", Tag = "ChieftainKor"},
			MapFlagSetTrue	{Name = "mf_P333_KorSpawned"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P333_KorSpawned"},
			FigureIsInRangeToEntity	{Tag = "ChieftainKor", TargetTag = "pl_HumanAvatar", Range = 3},
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 26},
			FigureHeroSpawnToEntity	{Tag = "Kor", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "ChieftainKor"},
			AvatarFlagSetTrue	{Name = "af_P333_KorJoined"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "conjure Song",
		Conditions = 
		{
			QuestIsSolved	{Quest = "CoopProphet"},
			AvatarFlagIsFalse	{Name = "af_P333_NightSongJoined"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "Song", Level = 5, UnitId = 276, X = 413, Y = 301, Team = "tm_Neutral"},
			FigureDirectionSetToEntity	{TargetTag = "Halicos", Tag = "Song"},
			MapFlagSetTrue	{Name = "mf_P333_SongSpawned"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P333_SongSpawned"},
			FigureIsInRangeToEntity	{Tag = "Song", TargetTag = "pl_HumanAvatar", Range = 3},
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 25},
			FigureHeroSpawnToEntity	{Tag = "Nightsong", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Song"},
			AvatarFlagSetTrue	{Name = "af_P333_NightSongJoined"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsFalse	{Name = "af_P333_NightSongGranted"},
			AvatarHasLevel	{Level = 29},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Ylia", Range = 3},
		},
		Actions = 
		{
			FigureAbilityAdd	{Tag = "Nightsong", AbilityId = 456},
			AvatarFlagSetTrue	{Name = "af_P333_NightSongGranted"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "conjure Lya",
		Conditions = 
		{
			AvatarHasLevel {Level = 1},
			AvatarFlagIsFalse	{Name = "af_P333_LyaJoined"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "Lya", Level = 5, UnitId = 877, X = 388, Y = 304, Team = "tm_Neutral"},
			FigureDirectionSetToEntity	{TargetTag = "Halicos", Tag = "Lya"},
			MapFlagSetTrue	{Name = "mf_P333_LyaSpawned"},
		},
	},
	OnOneTimeEvent
	{
		EventName = "conjure Bor",
		Conditions = 
		{
			AvatarHasLevel {Level = 1},
			AvatarFlagIsFalse	{Name = "af_P333_BorJoined"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "Bor", Level = 5, UnitId = 879, X = 385, Y = 302, Team = "tm_Neutral"},
			FigureDirectionSetToEntity	{TargetTag = "Halicos", Tag = "Bor"},
			MapFlagSetTrue	{Name = "mf_P333_BorSpawned"},
		},
	},
	OnOneTimeEvent
	{
		EventName = "conjure Shae",
		Conditions = 
		{
			AvatarHasLevel {Level = 1},
			AvatarFlagIsFalse	{Name = "af_P333_ShaeJoined"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "Shae", Level = 5, UnitId = 1237, X = 382, Y = 299, Team = "tm_Neutral"},
			FigureDirectionSetToEntity	{TargetTag = "Halicos", Tag = "Shae"},
			MapFlagSetTrue	{Name = "mf_P333_ShaeSpawned"},
		},
	},
	OnOneTimeEvent
	{
		EventName = "conjure Mordecay",
		Conditions = 
		{
			AvatarHasLevel {Level = 1},
			AvatarFlagIsFalse	{Name = "af_P333_MordecayJoined"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "Mordecay", Level = 5, UnitId = 1339, X = 381, Y = 295, Team = "tm_Neutral"},
			FigureDirectionSetToEntity	{TargetTag = "Halicos", Tag = "Mordecay"},
			MapFlagSetTrue	{Name = "mf_P333_MordecaySpawned"},
		},
	},
	OnOneTimeEvent
	{
		EventName = "conjure Jared",
		Conditions = 
		{
			AvatarHasLevel {Level = 1},
			AvatarFlagIsFalse	{Name = "af_P333_JaredJoined"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "Jared", Level = 5, UnitId = 878, X = 404, Y = 288, Team = "tm_Neutral"},
			FigureDirectionSetToEntity	{TargetTag = "Halicos", Tag = "Jared"},
			MapFlagSetTrue	{Name = "mf_P333_JaredSpawned"},
		},
	},
	OnOneTimeEvent
	{
		EventName = "conjure Wind",
		Conditions = 
		{
			AvatarHasLevel {Level = 1},
			AvatarFlagIsFalse	{Name = "af_P333_WindJoined"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "Wind", Level = 5, UnitId = 1166, X = 400, Y = 288, Team = "tm_Neutral"},
			FigureDirectionSetToEntity	{TargetTag = "Halicos", Tag = "Wind"},
			MapFlagSetTrue	{Name = "mf_P333_WindSpawned"},
		},
	},
	OnOneTimeEvent
	{
		EventName = "conjure Whisper",
		Conditions = 
		{
			AvatarHasLevel {Level = 1},
			AvatarFlagIsFalse	{Name = "af_P333_WhisperJoined"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "Whisper", Level = 5, UnitId = 1167, X = 396, Y = 288, Team = "tm_Neutral"},
			FigureDirectionSetToEntity	{TargetTag = "Halicos", Tag = "Whisper"},
			MapFlagSetTrue	{Name = "mf_P333_WhisperSpawned"},
		},
	},
	OnOneTimeEvent
	{
		EventName = "conjure Yasha",
		Conditions = 
		{
			AvatarHasLevel {Level = 1},
			AvatarFlagIsFalse	{Name = "af_P333_YashaJoined"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "Yasha", Level = 5, UnitId = 1056, X = 388, Y = 288, Team = "tm_Neutral"},
			FigureDirectionSetToEntity	{TargetTag = "Halicos", Tag = "Yasha"},
			MapFlagSetTrue	{Name = "mf_P333_YashaSpawned"},
		},
	},
	OnOneTimeEvent
	{
		EventName = "conjure Caine",
		Conditions = 
		{
			AvatarHasLevel {Level = 1},
			AvatarFlagIsFalse	{Name = "af_P333_CaineJoined"},
		},
		Actions = 
		{
			FigureNpcSpawn	{Tag = "Caine", Level = 5, UnitId = 1049, X = 392, Y = 288, Team = "tm_Neutral"},
			FigureDirectionSetToEntity	{TargetTag = "Halicos", Tag = "Caine"},
			MapFlagSetTrue	{Name = "mf_P333_CaineSpawned"},
		},
	},
	OnOneTimeEvent
	{
		EventName = "conjure Aya",
		Conditions = 
		{
			QuestIsSolved	{Quest = "CoopLiberateAya"},
		},
		Actions = 
		{
			FigureNpcSpawnToEntity	{Tag = "Aya", Level = 1, UnitId = 575, TargetTag = "Halicos", Team = "tm_Neutral"},
			FigureDirectionSetToEntity	{TargetTag = "pl_HumanAvatar", Tag = "Aya"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsFalse	{Name = "af_P333_AyaRewardGiven"},
			FigureIsInRangeToEntity	{Tag = "Aya", TargetTag = "pl_HumanAvatar", Range = 4},
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Name = "af_P333_AyaRewards"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "conjure Iris",
		Conditions = 
		{
			QuestIsSolved	{Quest = "CoopWifeIris"},
		},
		Actions = 
		{
			FigureNpcSpawnToEntity	{Tag = "Iris", Level = 1, UnitId = 1021, TargetTag = "verwalterutrecht", Team = "tm_Neutral"},
			FigureDirectionSetToEntity	{TargetTag = "pl_HumanAvatar", Tag = "Iris"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsFalse	{Name = "af_P333_IrisRewardGiven"},
			FigureIsInRangeToEntity	{Tag = "Iris", TargetTag = "pl_HumanAvatar", Range = 5},
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Name = "af_P333_IrisRewards"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsFalse	{Name = "af_P333_JandrimRing"},
			AvatarHasItemMisc	{ItemId = 342, Amount = 5},
			AvatarHasItemMisc	{ItemId = 340, Amount = 5},
			FigureIsInRangeToEntity	{Tag = "pl_HumanAvatar", TargetTag = "Jandrim_Windhammer", Range = 4},
		},
		Actions = 
		{
			AvatarItemGenericGive	{PrefixId = 59, ItemId = 289, SuffixId = 270, Level = 22, Amount = 1},
			AvatarItemMiscTake	{ItemId = 342, Amount = 5},
			AvatarItemMiscTake	{ItemId = 340, Amount = 5},
			AvatarFlagSetTrue	{Name = "af_P333_JandrimRing"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotKnown	{Quest = "CoopMainQuests"},
		},
		Actions = 
		{
			QuestSetActive	{Quest = "CoopMainQuests"},
			QuestSetActive	{Quest = "CoopHeroes"},
			QuestSetActive	{Quest = "CoopHeroesTalkToFirst"},
			AvatarFlagSetTrue	{Name = "af_P333_JandrimDialogEnabled"},
			AvatarFlagSetTrue	{Name = "af_P333_JandrimDialogTypeSideQuest"},
		},
	};

	------------------------------------------------------------------------
	-- Anderhall Dialog anschalten solange seine Quest aktiv ist
	------------------------------------------------------------------------
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P333_AnderhallDialogEnabled"},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Anderhall"},
			DialogTypeSetSideQuest	{Tag = "Anderhall"},
		},
	};

	------------------------------------------------------------------------
	-- Jandrim Dialog anschalten solange seine Quest aktiv ist
	------------------------------------------------------------------------
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				AND
				{
					AvatarFlagIsTrue	{Name = "af_P333_JandrimDialogEnabled"},
					AvatarFlagIsTrue	{Name = "af_P333_JandrimDialogTypeSideQuest"},
				},
				QuestIsActive	{Quest = "CoopBaseJandrimsCraft"},
			},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Jandrim_Windhammer"},
			DialogTypeSetSideQuest	{Tag = "Jandrim_Windhammer"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P333_JandrimDialogEnabled"},
			AvatarFlagIsTrue	{Name = "af_P333_JandrimDialogTypeMainQuest"},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Jandrim_Windhammer"},
			DialogTypeSetMainQuest	{Tag = "Jandrim_Windhammer"},
		},
	};

	------------------------------------------------------------------------
	-- Ylia Dialog anschalten solange ihre Quest aktiv ist
	------------------------------------------------------------------------
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				AND
				{
					AvatarFlagIsTrue	{Name = "af_P333_YliaDialogEnabled"},
					AvatarFlagIsTrue	{Name = "af_P333_YliaDialogTypeSideQuest"},
				},
				QuestIsKnown	{Quest = "CoopBaseChapter_2"},
			},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Ylia"},
			DialogTypeSetSideQuest	{Tag = "Ylia"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				AND
				{
					AvatarFlagIsTrue	{Name = "af_P333_YliaDialogEnabled"},
					AvatarFlagIsTrue	{Name = "af_P333_YliaDialogTypeMainQuest"},
				},
				QuestIsActive	{Quest = "CoopTalkToYlia"},
			},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Ylia"},
			DialogTypeSetMainQuest	{Tag = "Ylia"},
		},
	};

	------------------------------------------------------------------------
	-- Mersadion Dialog anschalten solange seine Quest aktiv ist
	------------------------------------------------------------------------
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				AvatarFlagIsTrue	{Name = "af_P333_MersadionDialogEnabled"},
				QuestIsActive	{Quest = "CoopTalkToMersadion"},
			},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Odin"},
			DialogTypeSetSideQuest	{Tag = "Odin"},
		},
	};


	------------------------------------------------------------------------
	-- Utrecht Dialog abschalten wenn seine Quests durch sind
	------------------------------------------------------------------------
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P333_UtrechtDialogDisabled"},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "VerwalterUtrecht"},
		},
	};

	------------------------------------------------------------------------
	-- Halicos Dialog abschalten wenn seine Quests durch sind
	------------------------------------------------------------------------
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P333_HalicosDialogDisabled"},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "Halicos"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsFalse	{Name = "af_P333_HalicosDialogDisabled"},
			AvatarFlagIsTrue	{Name = "af_P333_HalicosDialogTypeMainQuest"},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Halicos"},
			DialogTypeSetMainQuest	{Tag = "Halicos"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsFalse	{Name = "af_P333_HalicosDialogDisabled"},
			AvatarFlagIsTrue	{Name = "af_P333_HalicosDialogTypeSideQuest"},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Halicos"},
			DialogTypeSetSideQuest	{Tag = "Halicos"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				AvatarFlagIsTrue	{Name = "af_P333_ShaikanHeroWarriorRecruited"},
				AvatarFlagIsTrue	{Name = "af_P333_ShaikanHeroWarriorJoined"},
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "Hero_WarriorShaikan"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				AvatarFlagIsTrue	{Name = "af_P333_ShaikanHeroMageRecruited"},
				AvatarFlagIsTrue	{Name = "af_P333_ShaikanHeroMageJoined"},
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "HeroShaikan_Mage"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				AvatarFlagIsTrue	{Name = "af_P333_ShaikanHeroHealerRecruited"},
				AvatarFlagIsTrue	{Name = "af_P333_ShaikanHeroHealerJoined"},
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "HeroShaikan_Healer"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				AvatarFlagIsTrue	{Name = "af_P333_ShaikanHeroMeleeRecruited"},
				AvatarFlagIsTrue	{Name = "af_P333_ShaikanHeroMeleeJoined"},
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "HeroShaikan_Melee"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				AvatarFlagIsTrue	{Name = "af_P333_ShaikanHeroHealer2Recruited"},
				AvatarFlagIsTrue	{Name = "af_P333_ShaikanHeroHealer2Joined"},
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "HeroShaikan_Healer2"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "VanishHeroLevel1",
		Conditions = 
		{
			OR
			{
				AvatarFlagIsTrue	{Name = "af_P333_Level1Warrior"},
				AvatarFlagIsTrue	{Name = "af_P333_Hero_WarriorJoined"},
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "Hero_Warrior"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "VanishHeroLevel5",
		Conditions = 
		{
			OR
			{
				AvatarFlagIsTrue	{Name = "af_P333_Level5Healer"},
				AvatarFlagIsTrue	{Name = "af_P333_Hero_HealerJoined"},
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "Hero_Healer"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "VanishHeroLevel8",
		Conditions = 
		{
			OR
			{
				AvatarFlagIsTrue	{Name = "af_P333_Level8Mage"},
				AvatarFlagIsTrue	{Name = "af_P333_Hero_MageJoined"},
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "Hero_Mage"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "VanishHeroLevel11",
		Conditions = 
		{
			OR
			{
				AvatarFlagIsTrue	{Name = "af_P333_Level11Assassin"},
				AvatarFlagIsTrue	{Name = "af_P333_Hero_AssassinJoined"},
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "Hero_Assassin"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "VanishHeroLevel13",
		Conditions = 
		{
			OR
			{
				AvatarFlagIsTrue	{Name = "af_P333_Level13Archer"},
				AvatarFlagIsTrue	{Name = "af_P333_Hero_ArcherJoined"},
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "Hero_Archer"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "VanishAdventurerLevel1",
		Conditions = 
		{
			OR
			{
				AvatarFlagIsTrue	{Name = "af_P333_Level1Adventurer"},
				AvatarFlagIsTrue	{Name = "af_P333_Hero_Adventurer1Joined"},
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "Hero_Adventurer1"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "VanishAdventurerLevel5",
		Conditions = 
		{
			OR
			{
				AvatarFlagIsTrue	{Name = "af_P333_Level5Adventurer"},
				AvatarFlagIsTrue	{Name = "af_P333_Hero_Adventurer2Joined"},
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "Hero_Adventurer2"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "VanishAdventurerLevel8",
		Conditions = 
		{
			OR
			{
				AvatarFlagIsTrue	{Name = "af_P333_Level8Adventurer"},
				AvatarFlagIsTrue	{Name = "af_P333_Hero_Adventurer3Joined"},
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "Hero_Adventurer3"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "VanishAdventurerLevel11",
		Conditions = 
		{
			OR
			{
				AvatarFlagIsTrue	{Name = "af_P333_Level11Adventurer"},
				AvatarFlagIsTrue	{Name = "af_P333_Hero_Adventurer4Joined"},
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "Hero_Adventurer4"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "VanishAdventurerLevel13",
		Conditions = 
		{
			OR
			{
				AvatarFlagIsTrue	{Name = "af_P333_Level13Adventurer"},
				AvatarFlagIsTrue	{Name = "af_P333_Hero_Adventurer5Joined"},
			},
		},
		Actions = 
		{
			FigureVanish	{Tag = "Hero_Adventurer5"},
		},
	};
};
