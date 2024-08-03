State
{
	StateName = "INIT",

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------- Hero Handling Reset ------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	OnOneTimeEvent
	{
		Conditions = 
		{
			
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_MapStartCheckOnly"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			-- only check this at map start!!!
			EntityTimerIsNotElapsed	{Name = "et_MapStartCheckOnly", Seconds = 0.3},

			-- did the player start recruiting heroes OR adventurers 
			-- AND
			-- the first one isn't alive?
			OR
			{
				AND
				{
					AvatarFlagIsTrue	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
					FigureIsDead	{Tag = "pl_HumanCoopAdventurer1"},
				},
				AND
				{
					AvatarFlagIsTrue	{Name = "af_P333_PlayerIsRecruitingHeroes"},
					FigureIsDead	{Tag = "pl_HumanCoopWarrior"},
				},
			},
		},
		Actions = 
		{
			-- then assume that the player chose to wipe heroes when he imported his SF2 Coop Avatar to Addon Coop
	
			-- not recruiting		
			AvatarFlagSetFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagSetFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
    
    		-- no groups (?) recruited yet
			AvatarFlagSetFalse	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
			AvatarFlagSetFalse	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			AvatarFlagSetFalse	{Name = "af_P333_ShaikanHeroGroupRecriuted"},
    
    		-- no dialogues should be active
			AvatarFlagSetFalse	{Name = "af_P333_Level1EnableDialog"},
			AvatarFlagSetFalse	{Name = "af_P333_Level5EnableDialog"},
			AvatarFlagSetFalse	{Name = "af_P333_Level8EnableDialog"},
			AvatarFlagSetFalse	{Name = "af_P333_Level11EnableDialog"},
			AvatarFlagSetFalse	{Name = "af_P333_Level13EnableDialog"},
    
    		-- and none of the NPCs have been recruited
			AvatarFlagSetFalse	{Name = "af_P333_Level1Recruited"},
			AvatarFlagSetFalse	{Name = "af_P333_Level5Recruited"},
			AvatarFlagSetFalse	{Name = "af_P333_Level8Recruited"},
			AvatarFlagSetFalse	{Name = "af_P333_Level11Recruited"},
			AvatarFlagSetFalse	{Name = "af_P333_Level13Recruited"},
			
			-- this flag is just to see wether this event has triggered or not (might be useful for debugging)
			AvatarFlagSetTrue	{Name = "af_P333_HeroTransferHasBeenReset"},
			
			DebugMessage	{Message = "Note: the Player has chosen in the menu to wipe all Heroes. The script variables have been reset. The Avatar can now recruit new Heroes again.", Caption = "Hero Transfer Reset"},
			
			EntityTimerStart	{Name = "et_P333_Delay"},
		},
	};
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Der Spieler muss die Dialoge wieder angeboten bekommen
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsKnown {Quest = "CoopHonorMarks"},
			AvatarFlagIsTrue {Name = "af_P333_HeroTransferHasBeenReset"},
			EntityTimerIsElapsed {Name = "et_P333_Delay", Seconds = 1},
		},
		Actions =
		{
			DebugMessage	{Message = "Note: Dialog Enable after Hero-Import Reset"},
			DialogSetEnabled {Tag = "Hero_Adventurer1"},
			DialogSetEnabled {Tag = "Hero_Warrior"},

			DialogSetEnabled {Tag = "Hero_WarriorShaikan"},
		},
	},
	-- Shaikan Hero Dialog nur anschalten wenn Avatar Level 15 ist!
	--OnOneTimeEvent
	--{
	--	Conditions = 
	--	{
	--		AvatarHasLevel	{Level = 15},
	--		QuestIsKnown {Quest = "CoopHonorMarks"},
	--		AvatarFlagIsTrue {Name = "af_P333_HeroTransferHasBeenReset"},
	--		EntityTimerIsElapsed {Name = "et_P333_Delay", Seconds = 1},
	--	},
	--	Actions =
	--	{
	--		DebugMessage	{Message = "Note: Shaikan Hero Dialog also enabled!"},
	--		DialogSetEnabled {Tag = "Hero_WarriorShaikan"},
	--	}
	--},

	OnOneTimeEvent
	{
		Conditions = 
		{
			
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Name = "af_P333_NewLoaded"},
			DialogSetDisabled {Tag = "Hero_WarriorShaikan"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
		},
		Actions = 
		{
			DialogSetEnabled {Tag = "Hero_WarriorShaikan"},
			DialogSetEnabled	{Tag = "Hero_Adventurer1"},
			DialogSetEnabled	{Tag = "Hero_Warrior"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			AvatarFlagIsTrue {Name = "af_P333_TalkedToHeroWarriorShaikan"},
			AvatarFlagIsFalse	{Name = "af_P333_Level1Recruited"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
			AvatarIsNotTalking {},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "Hero_WarriorShaikan"},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroWarriorRecruited"},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroGroupRecruited"},
			FigureVanish	{Tag = "Hero_WarriorShaikan"},
			PlayerHeroAdd	{HeroId = 169},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer5", TargetTag = "pl_HumanAvatar", Direction = 0},
			
			-- Mal zur Sicherheit alle anderen Dialoge aus, damit der Spieler nicht noch die anderen Helden holen kann
			DialogSetDisabled {Tag = "Hero_Adventurer1"},
			DialogSetDisabled {Tag = "Hero_Adventurer2"},
			DialogSetDisabled {Tag = "Hero_Adventurer3"},
			DialogSetDisabled {Tag = "Hero_Adventurer4"},
			DialogSetDisabled {Tag = "Hero_Adventurer5"},
			                  
			DialogSetDisabled {Tag = "Hero_Warrior"},
			DialogSetDisabled {Tag = "Hero_Healer"},
			DialogSetDisabled {Tag = "Hero_Mage"},
			DialogSetDisabled {Tag = "Hero_Assassin"},
			DialogSetDisabled {Tag = "Hero_Archer"},
			
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue {Name = "af_P333_ShaikanHeroGroupRecruited"},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "Hero_Adventurer1"},
			DialogSetDisabled	{Tag = "Hero_Adventurer2"},
			DialogSetDisabled	{Tag = "Hero_Adventurer3"},
			DialogSetDisabled	{Tag = "Hero_Adventurer4"},
			DialogSetDisabled	{Tag = "Hero_Adventurer5"},
			                  
			DialogSetDisabled {Tag = "Hero_Warrior"},
			DialogSetDisabled {Tag = "Hero_Healer"},
			DialogSetDisabled {Tag = "Hero_Mage"},
			DialogSetDisabled {Tag = "Hero_Assassin"},
			DialogSetDisabled {Tag = "Hero_Archer"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				AvatarFlagIsTrue	{Name = "af_P333_LyaJoined"},
				AvatarFlagIsTrue	{Name = "af_P333_BorJoined"},
			},
		},
		Actions =
		{
			DialogSetDisabled	{Tag = "Hero_Adventurer1"},
			DialogSetDisabled	{Tag = "Hero_Adventurer2"},
			DialogSetDisabled	{Tag = "Hero_Adventurer3"},
			DialogSetDisabled	{Tag = "Hero_Adventurer4"},
			DialogSetDisabled	{Tag = "Hero_Adventurer5"},                  
			DialogSetDisabled	{Tag = "Hero_Warrior"},
			DialogSetDisabled	{Tag = "Hero_Healer"},
			DialogSetDisabled	{Tag = "Hero_Mage"},
			DialogSetDisabled	{Tag = "Hero_Assassin"},
			DialogSetDisabled	{Tag = "Hero_Archer"},
			DialogSetDisabled	{Tag = "Hero_WarriorShaikan"},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarHasLevel {Level = 5},
			AvatarFlagIsFalse {Name = "af_P333_ShaikanHeroMageRecruited"},
			AvatarFlagIsFalse	{Name = "af_P333_GameHeroesRecruiting"},
			AvatarFlagIsTrue	{Name = "af_P333_ShaikanHeroWarriorRecruited"},
			FigureIsInRangeToEntity	{Tag = "HeroShaikan_Mage", TargetTag = "pl_HumanAvatar", Range = 2},
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroMageRecruited"},
			FigureVanish	{Tag = "HeroShaikan_Mage"},
			PlayerHeroAdd	{HeroId = 167},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer3", TargetTag = "pl_HumanAvatar", Direction = 0},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
		},
	},
	OnEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarHasLevel {Level = 8},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroHealerRecruited"},
			AvatarFlagIsFalse	{Name = "af_P333_GameHeroesRecruiting"},
			AvatarFlagIsTrue	{Name = "af_P333_ShaikanHeroMageRecruited"},
			FigureIsInRangeToEntity	{Tag = "HeroShaikan_Healer", TargetTag = "pl_HumanAvatar", Range = 2},
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroHealerRecruited"},
			FigureVanish	{Tag = "HeroShaikan_Healer"},
			PlayerHeroAdd	{HeroId = 168},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer4", TargetTag = "pl_HumanAvatar", Direction = 0},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
		},
	},
	OnEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarHasLevel {Level = 11},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroMeleeRecruited"},
			AvatarFlagIsFalse	{Name = "af_P333_GameHeroesRecruiting"},
			AvatarFlagIsTrue	{Name = "af_P333_ShaikanHeroHealerRecruited"},
			FigureIsInRangeToEntity	{Tag = "HeroShaikan_Melee", TargetTag = "pl_HumanAvatar", Range = 2},
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroMeleeRecruited"},
			FigureVanish	{Tag = "HeroShaikan_Melee"},
			PlayerHeroAdd	{HeroId = 165},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer1", TargetTag = "pl_HumanAvatar", Direction = 0},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarHasLevel {Level = 13},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroHealer2Recruited"},
			AvatarFlagIsFalse	{Name = "af_P333_GameHeroesRecruiting"},
			AvatarFlagIsTrue {Name = "af_P333_ShaikanHeroMeleeRecruited"},
			FigureIsInRangeToEntity	{Tag = "HeroShaikan_Healer2", TargetTag = "pl_HumanAvatar", Range = 2},
		},
		Actions = 
		{
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroHealer2Recruited"},
			AvatarFlagSetFalse	{Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			FigureVanish	{Tag = "HeroShaikan_Healer2"},
			PlayerHeroAdd	{HeroId = 166},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer2", TargetTag = "pl_HumanAvatar", Direction = 0},
			QuestSetSolved	{Quest = "CoopHeroes"},
			QuestSetSolved	{Quest = "CoopHeroesGainRespect"},
			QuestSetSolved	{Quest = "CoopHeroesHero2"},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			OR
			{
				AvatarFlagIsTrue	{Name = "af_P333_ShaikanHeroGroupRecruited"},
				AvatarFlagIsTrue	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
				AvatarFlagIsTrue	{Name = "af_P333_PlayerIsRecruitingHeroes"},
				AvatarFlagIsTrue	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
				AvatarFlagIsTrue	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			},
		},
		Actions = 
		{
			ObjectVanish	{Tag = "LeverLya"},
			ObjectVanish	{Tag = "LeverBor"},
			ObjectVanish	{Tag = "LeverShae"},
			ObjectVanish	{Tag = "LeverMordecay"},
			ObjectVanish	{Tag = "LeverJared"},
			ObjectVanish	{Tag = "LeverWind"},
			ObjectVanish	{Tag = "LeverWhisper"},
			ObjectVanish	{Tag = "LeverYasha"},
			ObjectVanish	{Tag = "LeverCaine"},
			ObjectVanish	{Tag = "LeverAdventurer1"},
			ObjectVanish	{Tag = "LeverAdventurer2"},
			ObjectVanish	{Tag = "LeverAdventurer3"},
			ObjectVanish	{Tag = "LeverAdventurer4"},
			ObjectVanish	{Tag = "LeverAdventurer5"},
			ObjectVanish	{Tag = "LeverShaikanHeroMelee"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer2"},
			ObjectVanish	{Tag = "LeverShaikanHeroMage"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer"},
			ObjectVanish	{Tag = "LeverShaikanHeroWarrior"},
			ObjectVanish	{Tag = "LeverHero_Warrior"},
			ObjectVanish	{Tag = "LeverHero_Healer"},
			ObjectVanish	{Tag = "LeverHero_Mage"},
			ObjectVanish	{Tag = "LeverHero_Assassin"},
			ObjectVanish	{Tag = "LeverHero_Archer"},
		},
	};
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagIsFalse	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			AvatarHasLevel	{Level = 1},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 388, Y = 304, Direction = 0, Tag = "LeverLya"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverLya",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd	{HeroId = 9},
			FigureHeroSpawnToEntity	{Tag = "HeroLya", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Lya"},
			AvatarFlagSetTrue	{Name = "af_P333_LyaJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_GameHeroesRecruiting"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "LeverLya"},
			ObjectVanish	{Tag = "LeverBor"},
			ObjectVanish	{Tag = "LeverShae"},
			ObjectVanish	{Tag = "LeverMordecay"},
			ObjectVanish	{Tag = "LeverJared"},
			ObjectVanish	{Tag = "LeverWind"},
			ObjectVanish	{Tag = "LeverWhisper"},
			ObjectVanish	{Tag = "LeverYasha"},
			ObjectVanish	{Tag = "LeverCaine"},
			ObjectVanish	{Tag = "LeverAdventurer1"},
			ObjectVanish	{Tag = "LeverAdventurer2"},
			ObjectVanish	{Tag = "LeverAdventurer3"},
			ObjectVanish	{Tag = "LeverAdventurer4"},
			ObjectVanish	{Tag = "LeverAdventurer5"},
			ObjectVanish	{Tag = "LeverShaikanHeroMelee"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer2"},
			ObjectVanish	{Tag = "LeverShaikanHeroMage"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer"},
			ObjectVanish	{Tag = "LeverShaikanHeroWarrior"},
			ObjectVanish	{Tag = "LeverHero_Warrior"},
			ObjectVanish	{Tag = "LeverHero_Healer"},
			ObjectVanish	{Tag = "LeverHero_Mage"},
			ObjectVanish	{Tag = "LeverHero_Assassin"},
			ObjectVanish	{Tag = "LeverHero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagIsFalse	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			AvatarHasLevel	{Level = 1},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 385, Y = 302, Direction = 0, Tag = "LeverBor"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverBor",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd	{HeroId = 8},
			FigureHeroSpawnToEntity	{Tag = "HeroBor", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Bor"},
			AvatarFlagSetTrue	{Name = "af_P333_BorJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_GameHeroesRecruiting"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "LeverLya"},
			ObjectVanish	{Tag = "LeverBor"},
			ObjectVanish	{Tag = "LeverShae"},
			ObjectVanish	{Tag = "LeverMordecay"},
			ObjectVanish	{Tag = "LeverJared"},
			ObjectVanish	{Tag = "LeverWind"},
			ObjectVanish	{Tag = "LeverWhisper"},
			ObjectVanish	{Tag = "LeverYasha"},
			ObjectVanish	{Tag = "LeverCaine"},
			ObjectVanish	{Tag = "LeverAdventurer1"},
			ObjectVanish	{Tag = "LeverAdventurer2"},
			ObjectVanish	{Tag = "LeverAdventurer3"},
			ObjectVanish	{Tag = "LeverAdventurer4"},
			ObjectVanish	{Tag = "LeverAdventurer5"},
			ObjectVanish	{Tag = "LeverShaikanHeroMelee"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer2"},
			ObjectVanish	{Tag = "LeverShaikanHeroMage"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer"},
			ObjectVanish	{Tag = "LeverShaikanHeroWarrior"},
			ObjectVanish	{Tag = "LeverHero_Warrior"},
			ObjectVanish	{Tag = "LeverHero_Healer"},
			ObjectVanish	{Tag = "LeverHero_Mage"},
			ObjectVanish	{Tag = "LeverHero_Assassin"},
			ObjectVanish	{Tag = "LeverHero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagIsFalse	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			AvatarHasLevel	{Level = 1},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 382, Y = 299, Direction = 0, Tag = "LeverShae"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverShae",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd	{HeroId = 11},
			FigureHeroSpawnToEntity	{Tag = "HeroShae", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Shae"},
			AvatarFlagSetTrue	{Name = "af_P333_ShaeJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_GameHeroesRecruiting"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "LeverLya"},
			ObjectVanish	{Tag = "LeverBor"},
			ObjectVanish	{Tag = "LeverShae"},
			ObjectVanish	{Tag = "LeverMordecay"},
			ObjectVanish	{Tag = "LeverJared"},
			ObjectVanish	{Tag = "LeverWind"},
			ObjectVanish	{Tag = "LeverWhisper"},
			ObjectVanish	{Tag = "LeverYasha"},
			ObjectVanish	{Tag = "LeverCaine"},
			ObjectVanish	{Tag = "LeverAdventurer1"},
			ObjectVanish	{Tag = "LeverAdventurer2"},
			ObjectVanish	{Tag = "LeverAdventurer3"},
			ObjectVanish	{Tag = "LeverAdventurer4"},
			ObjectVanish	{Tag = "LeverAdventurer5"},
			ObjectVanish	{Tag = "LeverShaikanHeroMelee"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer2"},
			ObjectVanish	{Tag = "LeverShaikanHeroMage"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer"},
			ObjectVanish	{Tag = "LeverShaikanHeroWarrior"},
			ObjectVanish	{Tag = "LeverHero_Warrior"},
			ObjectVanish	{Tag = "LeverHero_Healer"},
			ObjectVanish	{Tag = "LeverHero_Mage"},
			ObjectVanish	{Tag = "LeverHero_Assassin"},
			ObjectVanish	{Tag = "LeverHero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagIsFalse	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			AvatarHasLevel {Level = 1},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 381, Y = 295, Direction = 0, Tag = "LeverMordecay"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverMordecay",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 10},
			FigureHeroSpawnToEntity	{Tag = "HeroMordecay", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Mordecay"},
			AvatarFlagSetTrue	{Name = "af_P333_MordecayJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_GameHeroesRecruiting"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "LeverLya"},
			ObjectVanish	{Tag = "LeverBor"},
			ObjectVanish	{Tag = "LeverShae"},
			ObjectVanish	{Tag = "LeverMordecay"},
			ObjectVanish	{Tag = "LeverJared"},
			ObjectVanish	{Tag = "LeverWind"},
			ObjectVanish	{Tag = "LeverWhisper"},
			ObjectVanish	{Tag = "LeverYasha"},
			ObjectVanish	{Tag = "LeverCaine"},
			ObjectVanish	{Tag = "LeverAdventurer1"},
			ObjectVanish	{Tag = "LeverAdventurer2"},
			ObjectVanish	{Tag = "LeverAdventurer3"},
			ObjectVanish	{Tag = "LeverAdventurer4"},
			ObjectVanish	{Tag = "LeverAdventurer5"},
			ObjectVanish	{Tag = "LeverShaikanHeroMelee"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer2"},
			ObjectVanish	{Tag = "LeverShaikanHeroMage"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer"},
			ObjectVanish	{Tag = "LeverShaikanHeroWarrior"},
			ObjectVanish	{Tag = "LeverHero_Warrior"},
			ObjectVanish	{Tag = "LeverHero_Healer"},
			ObjectVanish	{Tag = "LeverHero_Mage"},
			ObjectVanish	{Tag = "LeverHero_Assassin"},
			ObjectVanish	{Tag = "LeverHero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagIsFalse	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			AvatarHasLevel {Level = 1},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 404, Y = 288, Direction = 0, Tag = "LeverJared"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverJared",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 20},
			FigureHeroSpawnToEntity	{Tag = "HeroJared", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Jared"},
			AvatarFlagSetTrue	{Name = "af_P333_JaredJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_GameHeroesRecruiting"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "LeverLya"},
			ObjectVanish	{Tag = "LeverBor"},
			ObjectVanish	{Tag = "LeverShae"},
			ObjectVanish	{Tag = "LeverMordecay"},
			ObjectVanish	{Tag = "LeverJared"},
			ObjectVanish	{Tag = "LeverWind"},
			ObjectVanish	{Tag = "LeverWhisper"},
			ObjectVanish	{Tag = "LeverYasha"},
			ObjectVanish	{Tag = "LeverCaine"},
			ObjectVanish	{Tag = "LeverAdventurer1"},
			ObjectVanish	{Tag = "LeverAdventurer2"},
			ObjectVanish	{Tag = "LeverAdventurer3"},
			ObjectVanish	{Tag = "LeverAdventurer4"},
			ObjectVanish	{Tag = "LeverAdventurer5"},
			ObjectVanish	{Tag = "LeverShaikanHeroMelee"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer2"},
			ObjectVanish	{Tag = "LeverShaikanHeroMage"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer"},
			ObjectVanish	{Tag = "LeverShaikanHeroWarrior"},
			ObjectVanish	{Tag = "LeverHero_Warrior"},
			ObjectVanish	{Tag = "LeverHero_Healer"},
			ObjectVanish	{Tag = "LeverHero_Mage"},
			ObjectVanish	{Tag = "LeverHero_Assassin"},
			ObjectVanish	{Tag = "LeverHero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagIsFalse	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			AvatarHasLevel {Level = 1},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 400, Y = 288, Direction = 0, Tag = "LeverWind"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverWind",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 108},
			FigureHeroSpawnToEntity	{Tag = "HeroWind", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Wind"},
			AvatarFlagSetTrue	{Name = "af_P333_WindJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_GameHeroesRecruiting"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "LeverLya"},
			ObjectVanish	{Tag = "LeverBor"},
			ObjectVanish	{Tag = "LeverShae"},
			ObjectVanish	{Tag = "LeverMordecay"},
			ObjectVanish	{Tag = "LeverJared"},
			ObjectVanish	{Tag = "LeverWind"},
			ObjectVanish	{Tag = "LeverWhisper"},
			ObjectVanish	{Tag = "LeverYasha"},
			ObjectVanish	{Tag = "LeverCaine"},
			ObjectVanish	{Tag = "LeverAdventurer1"},
			ObjectVanish	{Tag = "LeverAdventurer2"},
			ObjectVanish	{Tag = "LeverAdventurer3"},
			ObjectVanish	{Tag = "LeverAdventurer4"},
			ObjectVanish	{Tag = "LeverAdventurer5"},
			ObjectVanish	{Tag = "LeverShaikanHeroMelee"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer2"},
			ObjectVanish	{Tag = "LeverShaikanHeroMage"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer"},
			ObjectVanish	{Tag = "LeverShaikanHeroWarrior"},
			ObjectVanish	{Tag = "LeverHero_Warrior"},
			ObjectVanish	{Tag = "LeverHero_Healer"},
			ObjectVanish	{Tag = "LeverHero_Mage"},
			ObjectVanish	{Tag = "LeverHero_Assassin"},
			ObjectVanish	{Tag = "LeverHero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagIsFalse	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			AvatarHasLevel {Level = 1},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 396, Y = 288, Direction = 0, Tag = "LeverWhisper"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverWhisper",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 107},
			FigureHeroSpawnToEntity	{Tag = "HeroWhisper", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Whisper"},
			AvatarFlagSetTrue	{Name = "af_P333_WhisperJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_GameHeroesRecruiting"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "LeverLya"},
			ObjectVanish	{Tag = "LeverBor"},
			ObjectVanish	{Tag = "LeverShae"},
			ObjectVanish	{Tag = "LeverMordecay"},
			ObjectVanish	{Tag = "LeverJared"},
			ObjectVanish	{Tag = "LeverWind"},
			ObjectVanish	{Tag = "LeverWhisper"},
			ObjectVanish	{Tag = "LeverYasha"},
			ObjectVanish	{Tag = "LeverCaine"},
			ObjectVanish	{Tag = "LeverAdventurer1"},
			ObjectVanish	{Tag = "LeverAdventurer2"},
			ObjectVanish	{Tag = "LeverAdventurer3"},
			ObjectVanish	{Tag = "LeverAdventurer4"},
			ObjectVanish	{Tag = "LeverAdventurer5"},
			ObjectVanish	{Tag = "LeverShaikanHeroMelee"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer2"},
			ObjectVanish	{Tag = "LeverShaikanHeroMage"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer"},
			ObjectVanish	{Tag = "LeverShaikanHeroWarrior"},
			ObjectVanish	{Tag = "LeverHero_Warrior"},
			ObjectVanish	{Tag = "LeverHero_Healer"},
			ObjectVanish	{Tag = "LeverHero_Mage"},
			ObjectVanish	{Tag = "LeverHero_Assassin"},
			ObjectVanish	{Tag = "LeverHero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagIsFalse	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			AvatarHasLevel {Level = 1},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 388, Y = 288, Direction = 0, Tag = "LeverYasha"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverYasha",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 110},
			FigureHeroSpawnToEntity	{Tag = "HeroYasha", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Yasha"},
			AvatarFlagSetTrue	{Name = "af_P333_YashaJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_GameHeroesRecruiting"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "LeverLya"},
			ObjectVanish	{Tag = "LeverBor"},
			ObjectVanish	{Tag = "LeverShae"},
			ObjectVanish	{Tag = "LeverMordecay"},
			ObjectVanish	{Tag = "LeverJared"},
			ObjectVanish	{Tag = "LeverWind"},
			ObjectVanish	{Tag = "LeverWhisper"},
			ObjectVanish	{Tag = "LeverYasha"},
			ObjectVanish	{Tag = "LeverCaine"},
			ObjectVanish	{Tag = "LeverAdventurer1"},
			ObjectVanish	{Tag = "LeverAdventurer2"},
			ObjectVanish	{Tag = "LeverAdventurer3"},
			ObjectVanish	{Tag = "LeverAdventurer4"},
			ObjectVanish	{Tag = "LeverAdventurer5"},
			ObjectVanish	{Tag = "LeverShaikanHeroMelee"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer2"},
			ObjectVanish	{Tag = "LeverShaikanHeroMage"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer"},
			ObjectVanish	{Tag = "LeverShaikanHeroWarrior"},
			ObjectVanish	{Tag = "LeverHero_Warrior"},
			ObjectVanish	{Tag = "LeverHero_Healer"},
			ObjectVanish	{Tag = "LeverHero_Mage"},
			ObjectVanish	{Tag = "LeverHero_Assassin"},
			ObjectVanish	{Tag = "LeverHero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagIsFalse	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			AvatarHasLevel {Level = 1},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 392, Y = 288, Direction = 0, Tag = "LeverCaine"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverCaine",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 109},
			FigureHeroSpawnToEntity	{Tag = "HeroCaine", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Caine"},
			AvatarFlagSetTrue	{Name = "af_P333_CaineJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_GameHeroesRecruiting"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "LeverLya"},
			ObjectVanish	{Tag = "LeverBor"},
			ObjectVanish	{Tag = "LeverShae"},
			ObjectVanish	{Tag = "LeverMordecay"},
			ObjectVanish	{Tag = "LeverJared"},
			ObjectVanish	{Tag = "LeverWind"},
			ObjectVanish	{Tag = "LeverWhisper"},
			ObjectVanish	{Tag = "LeverYasha"},
			ObjectVanish	{Tag = "LeverCaine"},
			ObjectVanish	{Tag = "LeverAdventurer1"},
			ObjectVanish	{Tag = "LeverAdventurer2"},
			ObjectVanish	{Tag = "LeverAdventurer3"},
			ObjectVanish	{Tag = "LeverAdventurer4"},
			ObjectVanish	{Tag = "LeverAdventurer5"},
			ObjectVanish	{Tag = "LeverShaikanHeroMelee"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer2"},
			ObjectVanish	{Tag = "LeverShaikanHeroMage"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer"},
			ObjectVanish	{Tag = "LeverShaikanHeroWarrior"},
			ObjectVanish	{Tag = "LeverHero_Warrior"},
			ObjectVanish	{Tag = "LeverHero_Healer"},
			ObjectVanish	{Tag = "LeverHero_Mage"},
			ObjectVanish	{Tag = "LeverHero_Assassin"},
			ObjectVanish	{Tag = "LeverHero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagIsFalse	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			AvatarHasLevel {Level = 1},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Adventurer1", Direction = 0, Tag = "LeverAdventurer1"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverAdventurer1",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAdventurer1},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer1", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Adventurer1"},
			AvatarFlagSetTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_Adventurer1Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_GameHeroesRecruiting"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "LeverLya"},
			ObjectVanish	{Tag = "LeverBor"},
			ObjectVanish	{Tag = "LeverShae"},
			ObjectVanish	{Tag = "LeverMordecay"},
			ObjectVanish	{Tag = "LeverJared"},
			ObjectVanish	{Tag = "LeverWind"},
			ObjectVanish	{Tag = "LeverWhisper"},
			ObjectVanish	{Tag = "LeverYasha"},
			ObjectVanish	{Tag = "LeverCaine"},
			ObjectVanish	{Tag = "LeverAdventurer1"},
			ObjectVanish	{Tag = "LeverAdventurer2"},
			ObjectVanish	{Tag = "LeverAdventurer3"},
			ObjectVanish	{Tag = "LeverAdventurer4"},
			ObjectVanish	{Tag = "LeverAdventurer5"},
			ObjectVanish	{Tag = "LeverShaikanHeroMelee"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer2"},
			ObjectVanish	{Tag = "LeverShaikanHeroMage"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer"},
			ObjectVanish	{Tag = "LeverShaikanHeroWarrior"},
			ObjectVanish	{Tag = "LeverHero_Warrior"},
			ObjectVanish	{Tag = "LeverHero_Healer"},
			ObjectVanish	{Tag = "LeverHero_Mage"},
			ObjectVanish	{Tag = "LeverHero_Assassin"},
			ObjectVanish	{Tag = "LeverHero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagIsFalse	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			AvatarHasLevel {Level = 1},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Adventurer2", Direction = 0, Tag = "LeverAdventurer2"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverAdventurer2",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAdventurer2},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer2", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Adventurer2"},
			AvatarFlagSetTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_Adventurer2Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_GameHeroesRecruiting"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "LeverLya"},
			ObjectVanish	{Tag = "LeverBor"},
			ObjectVanish	{Tag = "LeverShae"},
			ObjectVanish	{Tag = "LeverMordecay"},
			ObjectVanish	{Tag = "LeverJared"},
			ObjectVanish	{Tag = "LeverWind"},
			ObjectVanish	{Tag = "LeverWhisper"},
			ObjectVanish	{Tag = "LeverYasha"},
			ObjectVanish	{Tag = "LeverCaine"},
			ObjectVanish	{Tag = "LeverAdventurer1"},
			ObjectVanish	{Tag = "LeverAdventurer2"},
			ObjectVanish	{Tag = "LeverAdventurer3"},
			ObjectVanish	{Tag = "LeverAdventurer4"},
			ObjectVanish	{Tag = "LeverAdventurer5"},
			ObjectVanish	{Tag = "LeverShaikanHeroMelee"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer2"},
			ObjectVanish	{Tag = "LeverShaikanHeroMage"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer"},
			ObjectVanish	{Tag = "LeverShaikanHeroWarrior"},
			ObjectVanish	{Tag = "LeverHero_Warrior"},
			ObjectVanish	{Tag = "LeverHero_Healer"},
			ObjectVanish	{Tag = "LeverHero_Mage"},
			ObjectVanish	{Tag = "LeverHero_Assassin"},
			ObjectVanish	{Tag = "LeverHero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagIsFalse	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			AvatarHasLevel {Level = 1},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Adventurer3", Direction = 0, Tag = "LeverAdventurer3"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverAdventurer3",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAdventurer3},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer3", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Adventurer3"},
			AvatarFlagSetTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_Adventurer3Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_GameHeroesRecruiting"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "LeverLya"},
			ObjectVanish	{Tag = "LeverBor"},
			ObjectVanish	{Tag = "LeverShae"},
			ObjectVanish	{Tag = "LeverMordecay"},
			ObjectVanish	{Tag = "LeverJared"},
			ObjectVanish	{Tag = "LeverWind"},
			ObjectVanish	{Tag = "LeverWhisper"},
			ObjectVanish	{Tag = "LeverYasha"},
			ObjectVanish	{Tag = "LeverCaine"},
			ObjectVanish	{Tag = "LeverAdventurer1"},
			ObjectVanish	{Tag = "LeverAdventurer2"},
			ObjectVanish	{Tag = "LeverAdventurer3"},
			ObjectVanish	{Tag = "LeverAdventurer4"},
			ObjectVanish	{Tag = "LeverAdventurer5"},
			ObjectVanish	{Tag = "LeverShaikanHeroMelee"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer2"},
			ObjectVanish	{Tag = "LeverShaikanHeroMage"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer"},
			ObjectVanish	{Tag = "LeverShaikanHeroWarrior"},
			ObjectVanish	{Tag = "LeverHero_Warrior"},
			ObjectVanish	{Tag = "LeverHero_Healer"},
			ObjectVanish	{Tag = "LeverHero_Mage"},
			ObjectVanish	{Tag = "LeverHero_Assassin"},
			ObjectVanish	{Tag = "LeverHero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagIsFalse	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			AvatarHasLevel {Level = 1},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Adventurer4", Direction = 0, Tag = "LeverAdventurer4"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverAdventurer4",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAdventurer4},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer4", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Adventurer4"},
			AvatarFlagSetTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_Adventurer4Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_GameHeroesRecruiting"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "LeverLya"},
			ObjectVanish	{Tag = "LeverBor"},
			ObjectVanish	{Tag = "LeverShae"},
			ObjectVanish	{Tag = "LeverMordecay"},
			ObjectVanish	{Tag = "LeverJared"},
			ObjectVanish	{Tag = "LeverWind"},
			ObjectVanish	{Tag = "LeverWhisper"},
			ObjectVanish	{Tag = "LeverYasha"},
			ObjectVanish	{Tag = "LeverCaine"},
			ObjectVanish	{Tag = "LeverAdventurer1"},
			ObjectVanish	{Tag = "LeverAdventurer2"},
			ObjectVanish	{Tag = "LeverAdventurer3"},
			ObjectVanish	{Tag = "LeverAdventurer4"},
			ObjectVanish	{Tag = "LeverAdventurer5"},
			ObjectVanish	{Tag = "LeverShaikanHeroMelee"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer2"},
			ObjectVanish	{Tag = "LeverShaikanHeroMage"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer"},
			ObjectVanish	{Tag = "LeverShaikanHeroWarrior"},
			ObjectVanish	{Tag = "LeverHero_Warrior"},
			ObjectVanish	{Tag = "LeverHero_Healer"},
			ObjectVanish	{Tag = "LeverHero_Mage"},
			ObjectVanish	{Tag = "LeverHero_Assassin"},
			ObjectVanish	{Tag = "LeverHero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagIsFalse	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			AvatarHasLevel {Level = 1},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Adventurer5", Direction = 0, Tag = "LeverAdventurer5"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverAdventurer5",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAdventurer5},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer5", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Adventurer5"},
			AvatarFlagSetTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_Adventurer5Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_GameHeroesRecruiting"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "LeverLya"},
			ObjectVanish	{Tag = "LeverBor"},
			ObjectVanish	{Tag = "LeverShae"},
			ObjectVanish	{Tag = "LeverMordecay"},
			ObjectVanish	{Tag = "LeverJared"},
			ObjectVanish	{Tag = "LeverWind"},
			ObjectVanish	{Tag = "LeverWhisper"},
			ObjectVanish	{Tag = "LeverYasha"},
			ObjectVanish	{Tag = "LeverCaine"},
			ObjectVanish	{Tag = "LeverAdventurer1"},
			ObjectVanish	{Tag = "LeverAdventurer2"},
			ObjectVanish	{Tag = "LeverAdventurer3"},
			ObjectVanish	{Tag = "LeverAdventurer4"},
			ObjectVanish	{Tag = "LeverAdventurer5"},
			ObjectVanish	{Tag = "LeverShaikanHeroMelee"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer2"},
			ObjectVanish	{Tag = "LeverShaikanHeroMage"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer"},
			ObjectVanish	{Tag = "LeverShaikanHeroWarrior"},
			ObjectVanish	{Tag = "LeverHero_Warrior"},
			ObjectVanish	{Tag = "LeverHero_Healer"},
			ObjectVanish	{Tag = "LeverHero_Mage"},
			ObjectVanish	{Tag = "LeverHero_Assassin"},
			ObjectVanish	{Tag = "LeverHero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagIsFalse	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			AvatarHasLevel {Level = 1},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Warrior", Direction = 0, Tag = "LeverHero_Warrior"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverHero_Warrior",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopWarrior},
			FigureHeroSpawnToEntity	{Tag = "CoopWarrior", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Warrior"},
			AvatarFlagSetTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_WarriorJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_GameHeroesRecruiting"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "LeverLya"},
			ObjectVanish	{Tag = "LeverBor"},
			ObjectVanish	{Tag = "LeverShae"},
			ObjectVanish	{Tag = "LeverMordecay"},
			ObjectVanish	{Tag = "LeverJared"},
			ObjectVanish	{Tag = "LeverWind"},
			ObjectVanish	{Tag = "LeverWhisper"},
			ObjectVanish	{Tag = "LeverYasha"},
			ObjectVanish	{Tag = "LeverCaine"},
			ObjectVanish	{Tag = "LeverAdventurer1"},
			ObjectVanish	{Tag = "LeverAdventurer2"},
			ObjectVanish	{Tag = "LeverAdventurer3"},
			ObjectVanish	{Tag = "LeverAdventurer4"},
			ObjectVanish	{Tag = "LeverAdventurer5"},
			ObjectVanish	{Tag = "LeverShaikanHeroMelee"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer2"},
			ObjectVanish	{Tag = "LeverShaikanHeroMage"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer"},
			ObjectVanish	{Tag = "LeverShaikanHeroWarrior"},
			ObjectVanish	{Tag = "LeverHero_Warrior"},
			ObjectVanish	{Tag = "LeverHero_Healer"},
			ObjectVanish	{Tag = "LeverHero_Mage"},
			ObjectVanish	{Tag = "LeverHero_Assassin"},
			ObjectVanish	{Tag = "LeverHero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagIsFalse	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			AvatarHasLevel {Level = 1},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Healer", Direction = 0, Tag = "LeverHero_Healer"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverHero_Healer",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopHealer},
			FigureHeroSpawnToEntity	{Tag = "CoopHealer", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Healer"},
			AvatarFlagSetTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_HealerJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_GameHeroesRecruiting"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "LeverLya"},
			ObjectVanish	{Tag = "LeverBor"},
			ObjectVanish	{Tag = "LeverShae"},
			ObjectVanish	{Tag = "LeverMordecay"},
			ObjectVanish	{Tag = "LeverJared"},
			ObjectVanish	{Tag = "LeverWind"},
			ObjectVanish	{Tag = "LeverWhisper"},
			ObjectVanish	{Tag = "LeverYasha"},
			ObjectVanish	{Tag = "LeverCaine"},
			ObjectVanish	{Tag = "LeverAdventurer1"},
			ObjectVanish	{Tag = "LeverAdventurer2"},
			ObjectVanish	{Tag = "LeverAdventurer3"},
			ObjectVanish	{Tag = "LeverAdventurer4"},
			ObjectVanish	{Tag = "LeverAdventurer5"},
			ObjectVanish	{Tag = "LeverShaikanHeroMelee"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer2"},
			ObjectVanish	{Tag = "LeverShaikanHeroMage"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer"},
			ObjectVanish	{Tag = "LeverShaikanHeroWarrior"},
			ObjectVanish	{Tag = "LeverHero_Warrior"},
			ObjectVanish	{Tag = "LeverHero_Healer"},
			ObjectVanish	{Tag = "LeverHero_Mage"},
			ObjectVanish	{Tag = "LeverHero_Assassin"},
			ObjectVanish	{Tag = "LeverHero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagIsFalse	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			AvatarHasLevel {Level = 1},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Mage", Direction = 0, Tag = "LeverHero_Mage"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverHero_Mage",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopMage},
			FigureHeroSpawnToEntity	{Tag = "CoopMage", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Mage"},
			AvatarFlagSetTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_MageJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_GameHeroesRecruiting"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "LeverLya"},
			ObjectVanish	{Tag = "LeverBor"},
			ObjectVanish	{Tag = "LeverShae"},
			ObjectVanish	{Tag = "LeverMordecay"},
			ObjectVanish	{Tag = "LeverJared"},
			ObjectVanish	{Tag = "LeverWind"},
			ObjectVanish	{Tag = "LeverWhisper"},
			ObjectVanish	{Tag = "LeverYasha"},
			ObjectVanish	{Tag = "LeverCaine"},
			ObjectVanish	{Tag = "LeverAdventurer1"},
			ObjectVanish	{Tag = "LeverAdventurer2"},
			ObjectVanish	{Tag = "LeverAdventurer3"},
			ObjectVanish	{Tag = "LeverAdventurer4"},
			ObjectVanish	{Tag = "LeverAdventurer5"},
			ObjectVanish	{Tag = "LeverShaikanHeroMelee"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer2"},
			ObjectVanish	{Tag = "LeverShaikanHeroMage"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer"},
			ObjectVanish	{Tag = "LeverShaikanHeroWarrior"},
			ObjectVanish	{Tag = "LeverHero_Warrior"},
			ObjectVanish	{Tag = "LeverHero_Healer"},
			ObjectVanish	{Tag = "LeverHero_Mage"},
			ObjectVanish	{Tag = "LeverHero_Assassin"},
			ObjectVanish	{Tag = "LeverHero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagIsFalse	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			AvatarHasLevel {Level = 1},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Assassin", Direction = 0, Tag = "LeverHero_Assassin"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverHero_Assassin",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAssassin},
			FigureHeroSpawnToEntity	{Tag = "CoopAssassin", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Assassin"},
			AvatarFlagSetTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_AssassinJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_GameHeroesRecruiting"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "LeverLya"},
			ObjectVanish	{Tag = "LeverBor"},
			ObjectVanish	{Tag = "LeverShae"},
			ObjectVanish	{Tag = "LeverMordecay"},
			ObjectVanish	{Tag = "LeverJared"},
			ObjectVanish	{Tag = "LeverWind"},
			ObjectVanish	{Tag = "LeverWhisper"},
			ObjectVanish	{Tag = "LeverYasha"},
			ObjectVanish	{Tag = "LeverCaine"},
			ObjectVanish	{Tag = "LeverAdventurer1"},
			ObjectVanish	{Tag = "LeverAdventurer2"},
			ObjectVanish	{Tag = "LeverAdventurer3"},
			ObjectVanish	{Tag = "LeverAdventurer4"},
			ObjectVanish	{Tag = "LeverAdventurer5"},
			ObjectVanish	{Tag = "LeverShaikanHeroMelee"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer2"},
			ObjectVanish	{Tag = "LeverShaikanHeroMage"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer"},
			ObjectVanish	{Tag = "LeverShaikanHeroWarrior"},
			ObjectVanish	{Tag = "LeverHero_Warrior"},
			ObjectVanish	{Tag = "LeverHero_Healer"},
			ObjectVanish	{Tag = "LeverHero_Mage"},
			ObjectVanish	{Tag = "LeverHero_Assassin"},
			ObjectVanish	{Tag = "LeverHero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagIsFalse	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			AvatarHasLevel {Level = 1},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Archer", Direction = 0, Tag = "LeverHero_Archer"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverHero_Archer",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopArcher},
			FigureHeroSpawnToEntity	{Tag = "CoopArcher", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Archer"},
			AvatarFlagSetTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_ArcherJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_GameHeroesRecruiting"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "LeverLya"},
			ObjectVanish	{Tag = "LeverBor"},
			ObjectVanish	{Tag = "LeverShae"},
			ObjectVanish	{Tag = "LeverMordecay"},
			ObjectVanish	{Tag = "LeverJared"},
			ObjectVanish	{Tag = "LeverWind"},
			ObjectVanish	{Tag = "LeverWhisper"},
			ObjectVanish	{Tag = "LeverYasha"},
			ObjectVanish	{Tag = "LeverCaine"},
			ObjectVanish	{Tag = "LeverAdventurer1"},
			ObjectVanish	{Tag = "LeverAdventurer2"},
			ObjectVanish	{Tag = "LeverAdventurer3"},
			ObjectVanish	{Tag = "LeverAdventurer4"},
			ObjectVanish	{Tag = "LeverAdventurer5"},
			ObjectVanish	{Tag = "LeverShaikanHeroMelee"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer2"},
			ObjectVanish	{Tag = "LeverShaikanHeroMage"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer"},
			ObjectVanish	{Tag = "LeverShaikanHeroWarrior"},
			ObjectVanish	{Tag = "LeverHero_Warrior"},
			ObjectVanish	{Tag = "LeverHero_Healer"},
			ObjectVanish	{Tag = "LeverHero_Mage"},
			ObjectVanish	{Tag = "LeverHero_Assassin"},
			ObjectVanish	{Tag = "LeverHero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagIsFalse	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			AvatarHasLevel	{Level = 1},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "HeroShaikan_Melee", Direction = 0, Tag = "LeverShaikanHeroMelee"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverShaikanHeroMelee",
		OnConditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "HeroShaikan_Melee"},
			PlayerHeroAdd	{HeroId = 165},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer1", TargetTag = "pl_HumanAvatar", Direction = 0},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroMeleeJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_GameHeroesRecruiting"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "LeverLya"},
			ObjectVanish	{Tag = "LeverBor"},
			ObjectVanish	{Tag = "LeverShae"},
			ObjectVanish	{Tag = "LeverMordecay"},
			ObjectVanish	{Tag = "LeverJared"},
			ObjectVanish	{Tag = "LeverWind"},
			ObjectVanish	{Tag = "LeverWhisper"},
			ObjectVanish	{Tag = "LeverYasha"},
			ObjectVanish	{Tag = "LeverCaine"},
			ObjectVanish	{Tag = "LeverAdventurer1"},
			ObjectVanish	{Tag = "LeverAdventurer2"},
			ObjectVanish	{Tag = "LeverAdventurer3"},
			ObjectVanish	{Tag = "LeverAdventurer4"},
			ObjectVanish	{Tag = "LeverAdventurer5"},
			ObjectVanish	{Tag = "LeverShaikanHeroMelee"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer2"},
			ObjectVanish	{Tag = "LeverShaikanHeroMage"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer"},
			ObjectVanish	{Tag = "LeverShaikanHeroWarrior"},
			ObjectVanish	{Tag = "LeverHero_Warrior"},
			ObjectVanish	{Tag = "LeverHero_Healer"},
			ObjectVanish	{Tag = "LeverHero_Mage"},
			ObjectVanish	{Tag = "LeverHero_Assassin"},
			ObjectVanish	{Tag = "LeverHero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagIsFalse	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			AvatarHasLevel	{Level = 1},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "HeroShaikan_Healer2", Direction = 0, Tag = "LeverShaikanHeroHealer2"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverShaikanHeroHealer2",
		OnConditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "HeroShaikan_Healer2"},
			PlayerHeroAdd	{HeroId = 166},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer2", TargetTag = "pl_HumanAvatar", Direction = 0},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroHealer2Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_GameHeroesRecruiting"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "LeverLya"},
			ObjectVanish	{Tag = "LeverBor"},
			ObjectVanish	{Tag = "LeverShae"},
			ObjectVanish	{Tag = "LeverMordecay"},
			ObjectVanish	{Tag = "LeverJared"},
			ObjectVanish	{Tag = "LeverWind"},
			ObjectVanish	{Tag = "LeverWhisper"},
			ObjectVanish	{Tag = "LeverYasha"},
			ObjectVanish	{Tag = "LeverCaine"},
			ObjectVanish	{Tag = "LeverAdventurer1"},
			ObjectVanish	{Tag = "LeverAdventurer2"},
			ObjectVanish	{Tag = "LeverAdventurer3"},
			ObjectVanish	{Tag = "LeverAdventurer4"},
			ObjectVanish	{Tag = "LeverAdventurer5"},
			ObjectVanish	{Tag = "LeverShaikanHeroMelee"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer2"},
			ObjectVanish	{Tag = "LeverShaikanHeroMage"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer"},
			ObjectVanish	{Tag = "LeverShaikanHeroWarrior"},
			ObjectVanish	{Tag = "LeverHero_Warrior"},
			ObjectVanish	{Tag = "LeverHero_Healer"},
			ObjectVanish	{Tag = "LeverHero_Mage"},
			ObjectVanish	{Tag = "LeverHero_Assassin"},
			ObjectVanish	{Tag = "LeverHero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagIsFalse	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			AvatarHasLevel	{Level = 1},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "HeroShaikan_Mage", Direction = 0, Tag = "LeverShaikanHeroMage"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverShaikanHeroMage",
		OnConditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "HeroShaikan_Mage"},
			PlayerHeroAdd	{HeroId = 167},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer3", TargetTag = "pl_HumanAvatar", Direction = 0},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroMageJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_GameHeroesRecruiting"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "LeverLya"},
			ObjectVanish	{Tag = "LeverBor"},
			ObjectVanish	{Tag = "LeverShae"},
			ObjectVanish	{Tag = "LeverMordecay"},
			ObjectVanish	{Tag = "LeverJared"},
			ObjectVanish	{Tag = "LeverWind"},
			ObjectVanish	{Tag = "LeverWhisper"},
			ObjectVanish	{Tag = "LeverYasha"},
			ObjectVanish	{Tag = "LeverCaine"},
			ObjectVanish	{Tag = "LeverAdventurer1"},
			ObjectVanish	{Tag = "LeverAdventurer2"},
			ObjectVanish	{Tag = "LeverAdventurer3"},
			ObjectVanish	{Tag = "LeverAdventurer4"},
			ObjectVanish	{Tag = "LeverAdventurer5"},
			ObjectVanish	{Tag = "LeverShaikanHeroMelee"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer2"},
			ObjectVanish	{Tag = "LeverShaikanHeroMage"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer"},
			ObjectVanish	{Tag = "LeverShaikanHeroWarrior"},
			ObjectVanish	{Tag = "LeverHero_Warrior"},
			ObjectVanish	{Tag = "LeverHero_Healer"},
			ObjectVanish	{Tag = "LeverHero_Mage"},
			ObjectVanish	{Tag = "LeverHero_Assassin"},
			ObjectVanish	{Tag = "LeverHero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagIsFalse	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			AvatarHasLevel	{Level = 1},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "HeroShaikan_Healer", Direction = 0, Tag = "LeverShaikanHeroHealer"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverShaikanHeroHealer",
		OnConditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "HeroShaikan_Healer"},
			PlayerHeroAdd	{HeroId = 168},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer4", TargetTag = "pl_HumanAvatar", Direction = 0},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroHealerJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_GameHeroesRecruiting"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "LeverLya"},
			ObjectVanish	{Tag = "LeverBor"},
			ObjectVanish	{Tag = "LeverShae"},
			ObjectVanish	{Tag = "LeverMordecay"},
			ObjectVanish	{Tag = "LeverJared"},
			ObjectVanish	{Tag = "LeverWind"},
			ObjectVanish	{Tag = "LeverWhisper"},
			ObjectVanish	{Tag = "LeverYasha"},
			ObjectVanish	{Tag = "LeverCaine"},
			ObjectVanish	{Tag = "LeverAdventurer1"},
			ObjectVanish	{Tag = "LeverAdventurer2"},
			ObjectVanish	{Tag = "LeverAdventurer3"},
			ObjectVanish	{Tag = "LeverAdventurer4"},
			ObjectVanish	{Tag = "LeverAdventurer5"},
			ObjectVanish	{Tag = "LeverShaikanHeroMelee"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer2"},
			ObjectVanish	{Tag = "LeverShaikanHeroMage"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer"},
			ObjectVanish	{Tag = "LeverShaikanHeroWarrior"},
			ObjectVanish	{Tag = "LeverHero_Warrior"},
			ObjectVanish	{Tag = "LeverHero_Healer"},
			ObjectVanish	{Tag = "LeverHero_Mage"},
			ObjectVanish	{Tag = "LeverHero_Assassin"},
			ObjectVanish	{Tag = "LeverHero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHonorMarks"},
			AvatarFlagIsFalse	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsFalse	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
			AvatarFlagIsFalse	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroGroupTransferToPlayer"},
			AvatarHasLevel	{Level = 1},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_WarriorShaikan", Direction = 0, Tag = "LeverShaikanHeroWarrior"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "LeverShaikanHeroWarrior",
		OnConditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "Hero_WarriorShaikan"},
			PlayerHeroAdd	{HeroId = 169},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer5", TargetTag = "pl_HumanAvatar", Direction = 0},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroWarriorJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_GameHeroesRecruiting"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "LeverLya"},
			ObjectVanish	{Tag = "LeverBor"},
			ObjectVanish	{Tag = "LeverShae"},
			ObjectVanish	{Tag = "LeverMordecay"},
			ObjectVanish	{Tag = "LeverJared"},
			ObjectVanish	{Tag = "LeverWind"},
			ObjectVanish	{Tag = "LeverWhisper"},
			ObjectVanish	{Tag = "LeverYasha"},
			ObjectVanish	{Tag = "LeverCaine"},
			ObjectVanish	{Tag = "LeverAdventurer1"},
			ObjectVanish	{Tag = "LeverAdventurer2"},
			ObjectVanish	{Tag = "LeverAdventurer3"},
			ObjectVanish	{Tag = "LeverAdventurer4"},
			ObjectVanish	{Tag = "LeverAdventurer5"},
			ObjectVanish	{Tag = "LeverShaikanHeroMelee"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer2"},
			ObjectVanish	{Tag = "LeverShaikanHeroMage"},
			ObjectVanish	{Tag = "LeverShaikanHeroHealer"},
			ObjectVanish	{Tag = "LeverShaikanHeroWarrior"},
			ObjectVanish	{Tag = "LeverHero_Warrior"},
			ObjectVanish	{Tag = "LeverHero_Healer"},
			ObjectVanish	{Tag = "LeverHero_Mage"},
			ObjectVanish	{Tag = "LeverHero_Assassin"},
			ObjectVanish	{Tag = "LeverHero_Archer"},
		},
	},
-----------------------------------------------------------------------------------------------------------------------------------------------
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_LyaJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarHasLevel {Level = 5},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 388, Y = 304, Direction = 0, Tag = "Lever5Lya"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever5Lya",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 9},
			FigureHeroSpawnToEntity	{Tag = "HeroLya", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Lya"},
			AvatarFlagSetTrue	{Name = "af_P333_LyaJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_SecondHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever5Lya"},
			ObjectVanish	{Tag = "Lever5Bor"},
			ObjectVanish	{Tag = "Lever5Shae"},
			ObjectVanish	{Tag = "Lever5Mordecay"},
			ObjectVanish	{Tag = "Lever5Jared"},
			ObjectVanish	{Tag = "Lever5Wind"},
			ObjectVanish	{Tag = "Lever5Whisper"},
			ObjectVanish	{Tag = "Lever5Yasha"},
			ObjectVanish	{Tag = "Lever5Caine"},
			ObjectVanish	{Tag = "Lever5Adventurer1"},
			ObjectVanish	{Tag = "Lever5Adventurer2"},
			ObjectVanish	{Tag = "Lever5Adventurer3"},
			ObjectVanish	{Tag = "Lever5Adventurer4"},
			ObjectVanish	{Tag = "Lever5Adventurer5"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5Hero_Warrior"},
			ObjectVanish	{Tag = "Lever5Hero_Healer"},
			ObjectVanish	{Tag = "Lever5Hero_Mage"},
			ObjectVanish	{Tag = "Lever5Hero_Assassin"},
			ObjectVanish	{Tag = "Lever5Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_BorJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarHasLevel {Level = 5},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 385, Y = 302, Direction = 0, Tag = "Lever5Bor"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever5Bor",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 8},
			FigureHeroSpawnToEntity	{Tag = "HeroBor", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Bor"},
			AvatarFlagSetTrue	{Name = "af_P333_BorJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_SecondHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever5Lya"},
			ObjectVanish	{Tag = "Lever5Bor"},
			ObjectVanish	{Tag = "Lever5Shae"},
			ObjectVanish	{Tag = "Lever5Mordecay"},
			ObjectVanish	{Tag = "Lever5Jared"},
			ObjectVanish	{Tag = "Lever5Wind"},
			ObjectVanish	{Tag = "Lever5Whisper"},
			ObjectVanish	{Tag = "Lever5Yasha"},
			ObjectVanish	{Tag = "Lever5Caine"},
			ObjectVanish	{Tag = "Lever5Adventurer1"},
			ObjectVanish	{Tag = "Lever5Adventurer2"},
			ObjectVanish	{Tag = "Lever5Adventurer3"},
			ObjectVanish	{Tag = "Lever5Adventurer4"},
			ObjectVanish	{Tag = "Lever5Adventurer5"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5Hero_Warrior"},
			ObjectVanish	{Tag = "Lever5Hero_Healer"},
			ObjectVanish	{Tag = "Lever5Hero_Mage"},
			ObjectVanish	{Tag = "Lever5Hero_Assassin"},
			ObjectVanish	{Tag = "Lever5Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaeJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarHasLevel {Level = 5},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 382, Y = 299, Direction = 0, Tag = "Lever5Shae"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever5Shae",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 11},
			FigureHeroSpawnToEntity	{Tag = "HeroShae", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Shae"},
			AvatarFlagSetTrue	{Name = "af_P333_ShaeJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_SecondHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever5Lya"},
			ObjectVanish	{Tag = "Lever5Bor"},
			ObjectVanish	{Tag = "Lever5Shae"},
			ObjectVanish	{Tag = "Lever5Mordecay"},
			ObjectVanish	{Tag = "Lever5Jared"},
			ObjectVanish	{Tag = "Lever5Wind"},
			ObjectVanish	{Tag = "Lever5Whisper"},
			ObjectVanish	{Tag = "Lever5Yasha"},
			ObjectVanish	{Tag = "Lever5Caine"},
			ObjectVanish	{Tag = "Lever5Adventurer1"},
			ObjectVanish	{Tag = "Lever5Adventurer2"},
			ObjectVanish	{Tag = "Lever5Adventurer3"},
			ObjectVanish	{Tag = "Lever5Adventurer4"},
			ObjectVanish	{Tag = "Lever5Adventurer5"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5Hero_Warrior"},
			ObjectVanish	{Tag = "Lever5Hero_Healer"},
			ObjectVanish	{Tag = "Lever5Hero_Mage"},
			ObjectVanish	{Tag = "Lever5Hero_Assassin"},
			ObjectVanish	{Tag = "Lever5Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_MordecayJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarHasLevel {Level = 5},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 381, Y = 295, Direction = 0, Tag = "Lever5Mordecay"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever5Mordecay",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 10},
			FigureHeroSpawnToEntity	{Tag = "HeroMordecay", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Mordecay"},
			AvatarFlagSetTrue	{Name = "af_P333_MordecayJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_SecondHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever5Lya"},
			ObjectVanish	{Tag = "Lever5Bor"},
			ObjectVanish	{Tag = "Lever5Shae"},
			ObjectVanish	{Tag = "Lever5Mordecay"},
			ObjectVanish	{Tag = "Lever5Jared"},
			ObjectVanish	{Tag = "Lever5Wind"},
			ObjectVanish	{Tag = "Lever5Whisper"},
			ObjectVanish	{Tag = "Lever5Yasha"},
			ObjectVanish	{Tag = "Lever5Caine"},
			ObjectVanish	{Tag = "Lever5Adventurer1"},
			ObjectVanish	{Tag = "Lever5Adventurer2"},
			ObjectVanish	{Tag = "Lever5Adventurer3"},
			ObjectVanish	{Tag = "Lever5Adventurer4"},
			ObjectVanish	{Tag = "Lever5Adventurer5"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5Hero_Warrior"},
			ObjectVanish	{Tag = "Lever5Hero_Healer"},
			ObjectVanish	{Tag = "Lever5Hero_Mage"},
			ObjectVanish	{Tag = "Lever5Hero_Assassin"},
			ObjectVanish	{Tag = "Lever5Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_JaredJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarHasLevel {Level = 5},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 404, Y = 288, Direction = 0, Tag = "Lever5Jared"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever5Jared",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 20},
			FigureHeroSpawnToEntity	{Tag = "HeroJared", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Jared"},
			AvatarFlagSetTrue	{Name = "af_P333_JaredJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_SecondHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever5Lya"},
			ObjectVanish	{Tag = "Lever5Bor"},
			ObjectVanish	{Tag = "Lever5Shae"},
			ObjectVanish	{Tag = "Lever5Mordecay"},
			ObjectVanish	{Tag = "Lever5Jared"},
			ObjectVanish	{Tag = "Lever5Wind"},
			ObjectVanish	{Tag = "Lever5Whisper"},
			ObjectVanish	{Tag = "Lever5Yasha"},
			ObjectVanish	{Tag = "Lever5Caine"},
			ObjectVanish	{Tag = "Lever5Adventurer1"},
			ObjectVanish	{Tag = "Lever5Adventurer2"},
			ObjectVanish	{Tag = "Lever5Adventurer3"},
			ObjectVanish	{Tag = "Lever5Adventurer4"},
			ObjectVanish	{Tag = "Lever5Adventurer5"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5Hero_Warrior"},
			ObjectVanish	{Tag = "Lever5Hero_Healer"},
			ObjectVanish	{Tag = "Lever5Hero_Mage"},
			ObjectVanish	{Tag = "Lever5Hero_Assassin"},
			ObjectVanish	{Tag = "Lever5Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_WindJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarHasLevel {Level = 5},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 400, Y = 288, Direction = 0, Tag = "Lever5Wind"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever5Wind",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 108},
			FigureHeroSpawnToEntity	{Tag = "HeroWind", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Wind"},
			AvatarFlagSetTrue	{Name = "af_P333_WindJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_SecondHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever5Lya"},
			ObjectVanish	{Tag = "Lever5Bor"},
			ObjectVanish	{Tag = "Lever5Shae"},
			ObjectVanish	{Tag = "Lever5Mordecay"},
			ObjectVanish	{Tag = "Lever5Jared"},
			ObjectVanish	{Tag = "Lever5Wind"},
			ObjectVanish	{Tag = "Lever5Whisper"},
			ObjectVanish	{Tag = "Lever5Yasha"},
			ObjectVanish	{Tag = "Lever5Caine"},
			ObjectVanish	{Tag = "Lever5Adventurer1"},
			ObjectVanish	{Tag = "Lever5Adventurer2"},
			ObjectVanish	{Tag = "Lever5Adventurer3"},
			ObjectVanish	{Tag = "Lever5Adventurer4"},
			ObjectVanish	{Tag = "Lever5Adventurer5"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5Hero_Warrior"},
			ObjectVanish	{Tag = "Lever5Hero_Healer"},
			ObjectVanish	{Tag = "Lever5Hero_Mage"},
			ObjectVanish	{Tag = "Lever5Hero_Assassin"},
			ObjectVanish	{Tag = "Lever5Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_WhisperJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarHasLevel {Level = 5},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 396, Y = 288, Direction = 0, Tag = "Lever5Whisper"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever5Whisper",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 107},
			FigureHeroSpawnToEntity	{Tag = "HeroWhisper", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Whisper"},
			AvatarFlagSetTrue	{Name = "af_P333_WhisperJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_SecondHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever5Lya"},
			ObjectVanish	{Tag = "Lever5Bor"},
			ObjectVanish	{Tag = "Lever5Shae"},
			ObjectVanish	{Tag = "Lever5Mordecay"},
			ObjectVanish	{Tag = "Lever5Jared"},
			ObjectVanish	{Tag = "Lever5Wind"},
			ObjectVanish	{Tag = "Lever5Whisper"},
			ObjectVanish	{Tag = "Lever5Yasha"},
			ObjectVanish	{Tag = "Lever5Caine"},
			ObjectVanish	{Tag = "Lever5Adventurer1"},
			ObjectVanish	{Tag = "Lever5Adventurer2"},
			ObjectVanish	{Tag = "Lever5Adventurer3"},
			ObjectVanish	{Tag = "Lever5Adventurer4"},
			ObjectVanish	{Tag = "Lever5Adventurer5"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5Hero_Warrior"},
			ObjectVanish	{Tag = "Lever5Hero_Healer"},
			ObjectVanish	{Tag = "Lever5Hero_Mage"},
			ObjectVanish	{Tag = "Lever5Hero_Assassin"},
			ObjectVanish	{Tag = "Lever5Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_YashaJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarHasLevel {Level = 5},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 388, Y = 288, Direction = 0, Tag = "Lever5Yasha"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever5Yasha",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 110},
			FigureHeroSpawnToEntity	{Tag = "HeroYasha", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Yasha"},
			AvatarFlagSetTrue	{Name = "af_P333_YashaJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_SecondHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever5Lya"},
			ObjectVanish	{Tag = "Lever5Bor"},
			ObjectVanish	{Tag = "Lever5Shae"},
			ObjectVanish	{Tag = "Lever5Mordecay"},
			ObjectVanish	{Tag = "Lever5Jared"},
			ObjectVanish	{Tag = "Lever5Wind"},
			ObjectVanish	{Tag = "Lever5Whisper"},
			ObjectVanish	{Tag = "Lever5Yasha"},
			ObjectVanish	{Tag = "Lever5Caine"},
			ObjectVanish	{Tag = "Lever5Adventurer1"},
			ObjectVanish	{Tag = "Lever5Adventurer2"},
			ObjectVanish	{Tag = "Lever5Adventurer3"},
			ObjectVanish	{Tag = "Lever5Adventurer4"},
			ObjectVanish	{Tag = "Lever5Adventurer5"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5Hero_Warrior"},
			ObjectVanish	{Tag = "Lever5Hero_Healer"},
			ObjectVanish	{Tag = "Lever5Hero_Mage"},
			ObjectVanish	{Tag = "Lever5Hero_Assassin"},
			ObjectVanish	{Tag = "Lever5Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_CaineJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarHasLevel {Level = 5},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 392, Y = 288, Direction = 0, Tag = "Lever5Caine"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever5Caine",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 109},
			FigureHeroSpawnToEntity	{Tag = "HeroCaine", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Caine"},
			AvatarFlagSetTrue	{Name = "af_P333_CaineJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_SecondHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever5Lya"},
			ObjectVanish	{Tag = "Lever5Bor"},
			ObjectVanish	{Tag = "Lever5Shae"},
			ObjectVanish	{Tag = "Lever5Mordecay"},
			ObjectVanish	{Tag = "Lever5Jared"},
			ObjectVanish	{Tag = "Lever5Wind"},
			ObjectVanish	{Tag = "Lever5Whisper"},
			ObjectVanish	{Tag = "Lever5Yasha"},
			ObjectVanish	{Tag = "Lever5Caine"},
			ObjectVanish	{Tag = "Lever5Adventurer1"},
			ObjectVanish	{Tag = "Lever5Adventurer2"},
			ObjectVanish	{Tag = "Lever5Adventurer3"},
			ObjectVanish	{Tag = "Lever5Adventurer4"},
			ObjectVanish	{Tag = "Lever5Adventurer5"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5Hero_Warrior"},
			ObjectVanish	{Tag = "Lever5Hero_Healer"},
			ObjectVanish	{Tag = "Lever5Hero_Mage"},
			ObjectVanish	{Tag = "Lever5Hero_Assassin"},
			ObjectVanish	{Tag = "Lever5Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_Adventurer1Joined"},
			AvatarFlagIsFalse	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarHasLevel {Level = 5},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Adventurer1", Direction = 0, Tag = "Lever5Adventurer1"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever5Adventurer1",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAdventurer1},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer1", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Adventurer1"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_Adventurer1Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_SecondHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever5Lya"},
			ObjectVanish	{Tag = "Lever5Bor"},
			ObjectVanish	{Tag = "Lever5Shae"},
			ObjectVanish	{Tag = "Lever5Mordecay"},
			ObjectVanish	{Tag = "Lever5Jared"},
			ObjectVanish	{Tag = "Lever5Wind"},
			ObjectVanish	{Tag = "Lever5Whisper"},
			ObjectVanish	{Tag = "Lever5Yasha"},
			ObjectVanish	{Tag = "Lever5Caine"},
			ObjectVanish	{Tag = "Lever5Adventurer1"},
			ObjectVanish	{Tag = "Lever5Adventurer2"},
			ObjectVanish	{Tag = "Lever5Adventurer3"},
			ObjectVanish	{Tag = "Lever5Adventurer4"},
			ObjectVanish	{Tag = "Lever5Adventurer5"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5Hero_Warrior"},
			ObjectVanish	{Tag = "Lever5Hero_Healer"},
			ObjectVanish	{Tag = "Lever5Hero_Mage"},
			ObjectVanish	{Tag = "Lever5Hero_Assassin"},
			ObjectVanish	{Tag = "Lever5Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_Adventurer2Joined"},
			AvatarFlagIsFalse	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarHasLevel {Level = 5},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Adventurer2", Direction = 0, Tag = "Lever5Adventurer2"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever5Adventurer2",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAdventurer2},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer2", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Adventurer2"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_Adventurer2Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_SecondHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever5Lya"},
			ObjectVanish	{Tag = "Lever5Bor"},
			ObjectVanish	{Tag = "Lever5Shae"},
			ObjectVanish	{Tag = "Lever5Mordecay"},
			ObjectVanish	{Tag = "Lever5Jared"},
			ObjectVanish	{Tag = "Lever5Wind"},
			ObjectVanish	{Tag = "Lever5Whisper"},
			ObjectVanish	{Tag = "Lever5Yasha"},
			ObjectVanish	{Tag = "Lever5Caine"},
			ObjectVanish	{Tag = "Lever5Adventurer1"},
			ObjectVanish	{Tag = "Lever5Adventurer2"},
			ObjectVanish	{Tag = "Lever5Adventurer3"},
			ObjectVanish	{Tag = "Lever5Adventurer4"},
			ObjectVanish	{Tag = "Lever5Adventurer5"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5Hero_Warrior"},
			ObjectVanish	{Tag = "Lever5Hero_Healer"},
			ObjectVanish	{Tag = "Lever5Hero_Mage"},
			ObjectVanish	{Tag = "Lever5Hero_Assassin"},
			ObjectVanish	{Tag = "Lever5Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_Adventurer3Joined"},
			AvatarFlagIsFalse	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarHasLevel {Level = 5},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Adventurer3", Direction = 0, Tag = "Lever5Adventurer3"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever5Adventurer3",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAdventurer3},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer3", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Adventurer3"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_Adventurer3Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_SecondHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever5Lya"},
			ObjectVanish	{Tag = "Lever5Bor"},
			ObjectVanish	{Tag = "Lever5Shae"},
			ObjectVanish	{Tag = "Lever5Mordecay"},
			ObjectVanish	{Tag = "Lever5Jared"},
			ObjectVanish	{Tag = "Lever5Wind"},
			ObjectVanish	{Tag = "Lever5Whisper"},
			ObjectVanish	{Tag = "Lever5Yasha"},
			ObjectVanish	{Tag = "Lever5Caine"},
			ObjectVanish	{Tag = "Lever5Adventurer1"},
			ObjectVanish	{Tag = "Lever5Adventurer2"},
			ObjectVanish	{Tag = "Lever5Adventurer3"},
			ObjectVanish	{Tag = "Lever5Adventurer4"},
			ObjectVanish	{Tag = "Lever5Adventurer5"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5Hero_Warrior"},
			ObjectVanish	{Tag = "Lever5Hero_Healer"},
			ObjectVanish	{Tag = "Lever5Hero_Mage"},
			ObjectVanish	{Tag = "Lever5Hero_Assassin"},
			ObjectVanish	{Tag = "Lever5Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_Adventurer4Joined"},
			AvatarFlagIsFalse	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarHasLevel {Level = 5},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Adventurer4", Direction = 0, Tag = "Lever5Adventurer4"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever5Adventurer4",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAdventurer4},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer4", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Adventurer4"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_Adventurer4Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_SecondHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever5Lya"},
			ObjectVanish	{Tag = "Lever5Bor"},
			ObjectVanish	{Tag = "Lever5Shae"},
			ObjectVanish	{Tag = "Lever5Mordecay"},
			ObjectVanish	{Tag = "Lever5Jared"},
			ObjectVanish	{Tag = "Lever5Wind"},
			ObjectVanish	{Tag = "Lever5Whisper"},
			ObjectVanish	{Tag = "Lever5Yasha"},
			ObjectVanish	{Tag = "Lever5Caine"},
			ObjectVanish	{Tag = "Lever5Adventurer1"},
			ObjectVanish	{Tag = "Lever5Adventurer2"},
			ObjectVanish	{Tag = "Lever5Adventurer3"},
			ObjectVanish	{Tag = "Lever5Adventurer4"},
			ObjectVanish	{Tag = "Lever5Adventurer5"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5Hero_Warrior"},
			ObjectVanish	{Tag = "Lever5Hero_Healer"},
			ObjectVanish	{Tag = "Lever5Hero_Mage"},
			ObjectVanish	{Tag = "Lever5Hero_Assassin"},
			ObjectVanish	{Tag = "Lever5Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_Adventurer5Joined"},
			AvatarFlagIsFalse	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarHasLevel {Level = 5},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Adventurer5", Direction = 0, Tag = "Lever5Adventurer5"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever5Adventurer5",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAdventurer5},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer5", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Adventurer5"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_Adventurer5Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_SecondHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever5Lya"},
			ObjectVanish	{Tag = "Lever5Bor"},
			ObjectVanish	{Tag = "Lever5Shae"},
			ObjectVanish	{Tag = "Lever5Mordecay"},
			ObjectVanish	{Tag = "Lever5Jared"},
			ObjectVanish	{Tag = "Lever5Wind"},
			ObjectVanish	{Tag = "Lever5Whisper"},
			ObjectVanish	{Tag = "Lever5Yasha"},
			ObjectVanish	{Tag = "Lever5Caine"},
			ObjectVanish	{Tag = "Lever5Adventurer1"},
			ObjectVanish	{Tag = "Lever5Adventurer2"},
			ObjectVanish	{Tag = "Lever5Adventurer3"},
			ObjectVanish	{Tag = "Lever5Adventurer4"},
			ObjectVanish	{Tag = "Lever5Adventurer5"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5Hero_Warrior"},
			ObjectVanish	{Tag = "Lever5Hero_Healer"},
			ObjectVanish	{Tag = "Lever5Hero_Mage"},
			ObjectVanish	{Tag = "Lever5Hero_Assassin"},
			ObjectVanish	{Tag = "Lever5Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_WarriorJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarHasLevel {Level = 5},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Warrior", Direction = 0, Tag = "Lever5Hero_Warrior"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever5Hero_Warrior",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopWarrior},
			FigureHeroSpawnToEntity	{Tag = "CoopWarrior", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Warrior"},
			AvatarFlagSetTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_WarriorJoined"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever5Lya"},
			ObjectVanish	{Tag = "Lever5Bor"},
			ObjectVanish	{Tag = "Lever5Shae"},
			ObjectVanish	{Tag = "Lever5Mordecay"},
			ObjectVanish	{Tag = "Lever5Jared"},
			ObjectVanish	{Tag = "Lever5Wind"},
			ObjectVanish	{Tag = "Lever5Whisper"},
			ObjectVanish	{Tag = "Lever5Yasha"},
			ObjectVanish	{Tag = "Lever5Caine"},
			ObjectVanish	{Tag = "Lever5Adventurer1"},
			ObjectVanish	{Tag = "Lever5Adventurer2"},
			ObjectVanish	{Tag = "Lever5Adventurer3"},
			ObjectVanish	{Tag = "Lever5Adventurer4"},
			ObjectVanish	{Tag = "Lever5Adventurer5"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5Hero_Warrior"},
			ObjectVanish	{Tag = "Lever5Hero_Healer"},
			ObjectVanish	{Tag = "Lever5Hero_Mage"},
			ObjectVanish	{Tag = "Lever5Hero_Assassin"},
			ObjectVanish	{Tag = "Lever5Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_HealerJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarHasLevel {Level = 5},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Healer", Direction = 0, Tag = "Lever5Hero_Healer"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever5Hero_Healer",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopHealer},
			FigureHeroSpawnToEntity	{Tag = "CoopHealer", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Healer"},
			AvatarFlagSetTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_HealerJoined"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever5Lya"},
			ObjectVanish	{Tag = "Lever5Bor"},
			ObjectVanish	{Tag = "Lever5Shae"},
			ObjectVanish	{Tag = "Lever5Mordecay"},
			ObjectVanish	{Tag = "Lever5Jared"},
			ObjectVanish	{Tag = "Lever5Wind"},
			ObjectVanish	{Tag = "Lever5Whisper"},
			ObjectVanish	{Tag = "Lever5Yasha"},
			ObjectVanish	{Tag = "Lever5Caine"},
			ObjectVanish	{Tag = "Lever5Adventurer1"},
			ObjectVanish	{Tag = "Lever5Adventurer2"},
			ObjectVanish	{Tag = "Lever5Adventurer3"},
			ObjectVanish	{Tag = "Lever5Adventurer4"},
			ObjectVanish	{Tag = "Lever5Adventurer5"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5Hero_Warrior"},
			ObjectVanish	{Tag = "Lever5Hero_Healer"},
			ObjectVanish	{Tag = "Lever5Hero_Mage"},
			ObjectVanish	{Tag = "Lever5Hero_Assassin"},
			ObjectVanish	{Tag = "Lever5Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_MageJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarHasLevel {Level = 5},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Mage", Direction = 0, Tag = "Lever5Hero_Mage"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever5Hero_Mage",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopMage},
			FigureHeroSpawnToEntity	{Tag = "CoopMage", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Mage"},
			AvatarFlagSetTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_MageJoined"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever5Lya"},
			ObjectVanish	{Tag = "Lever5Bor"},
			ObjectVanish	{Tag = "Lever5Shae"},
			ObjectVanish	{Tag = "Lever5Mordecay"},
			ObjectVanish	{Tag = "Lever5Jared"},
			ObjectVanish	{Tag = "Lever5Wind"},
			ObjectVanish	{Tag = "Lever5Whisper"},
			ObjectVanish	{Tag = "Lever5Yasha"},
			ObjectVanish	{Tag = "Lever5Caine"},
			ObjectVanish	{Tag = "Lever5Adventurer1"},
			ObjectVanish	{Tag = "Lever5Adventurer2"},
			ObjectVanish	{Tag = "Lever5Adventurer3"},
			ObjectVanish	{Tag = "Lever5Adventurer4"},
			ObjectVanish	{Tag = "Lever5Adventurer5"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5Hero_Warrior"},
			ObjectVanish	{Tag = "Lever5Hero_Healer"},
			ObjectVanish	{Tag = "Lever5Hero_Mage"},
			ObjectVanish	{Tag = "Lever5Hero_Assassin"},
			ObjectVanish	{Tag = "Lever5Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_AssassinJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarHasLevel {Level = 5},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Assassin", Direction = 0, Tag = "Lever5Hero_Assassin"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever5Hero_Assassin",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAssassin},
			FigureHeroSpawnToEntity	{Tag = "CoopAssassin", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Assassin"},
			AvatarFlagSetTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_AssassinJoined"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever5Lya"},
			ObjectVanish	{Tag = "Lever5Bor"},
			ObjectVanish	{Tag = "Lever5Shae"},
			ObjectVanish	{Tag = "Lever5Mordecay"},
			ObjectVanish	{Tag = "Lever5Jared"},
			ObjectVanish	{Tag = "Lever5Wind"},
			ObjectVanish	{Tag = "Lever5Whisper"},
			ObjectVanish	{Tag = "Lever5Yasha"},
			ObjectVanish	{Tag = "Lever5Caine"},
			ObjectVanish	{Tag = "Lever5Adventurer1"},
			ObjectVanish	{Tag = "Lever5Adventurer2"},
			ObjectVanish	{Tag = "Lever5Adventurer3"},
			ObjectVanish	{Tag = "Lever5Adventurer4"},
			ObjectVanish	{Tag = "Lever5Adventurer5"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5Hero_Warrior"},
			ObjectVanish	{Tag = "Lever5Hero_Healer"},
			ObjectVanish	{Tag = "Lever5Hero_Mage"},
			ObjectVanish	{Tag = "Lever5Hero_Assassin"},
			ObjectVanish	{Tag = "Lever5Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_ArcherJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarHasLevel {Level = 5},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Archer", Direction = 0, Tag = "Lever5Hero_Archer"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever5Hero_Archer",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopArcher},
			FigureHeroSpawnToEntity	{Tag = "CoopArcher", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Archer"},
			AvatarFlagSetTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_ArcherJoined"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever5Lya"},
			ObjectVanish	{Tag = "Lever5Bor"},
			ObjectVanish	{Tag = "Lever5Shae"},
			ObjectVanish	{Tag = "Lever5Mordecay"},
			ObjectVanish	{Tag = "Lever5Jared"},
			ObjectVanish	{Tag = "Lever5Wind"},
			ObjectVanish	{Tag = "Lever5Whisper"},
			ObjectVanish	{Tag = "Lever5Yasha"},
			ObjectVanish	{Tag = "Lever5Caine"},
			ObjectVanish	{Tag = "Lever5Adventurer1"},
			ObjectVanish	{Tag = "Lever5Adventurer2"},
			ObjectVanish	{Tag = "Lever5Adventurer3"},
			ObjectVanish	{Tag = "Lever5Adventurer4"},
			ObjectVanish	{Tag = "Lever5Adventurer5"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5Hero_Warrior"},
			ObjectVanish	{Tag = "Lever5Hero_Healer"},
			ObjectVanish	{Tag = "Lever5Hero_Mage"},
			ObjectVanish	{Tag = "Lever5Hero_Assassin"},
			ObjectVanish	{Tag = "Lever5Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroMeleeJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarHasLevel {Level = 5},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "HeroShaikan_Melee", Direction = 0, Tag = "Lever5ShaikanHeroMelee"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever5ShaikanHeroMelee",
		OnConditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "HeroShaikan_Melee"},
			PlayerHeroAdd	{HeroId = 165},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer1", TargetTag = "pl_HumanAvatar", Direction = 0},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroMeleeJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_SecondHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever5Lya"},
			ObjectVanish	{Tag = "Lever5Bor"},
			ObjectVanish	{Tag = "Lever5Shae"},
			ObjectVanish	{Tag = "Lever5Mordecay"},
			ObjectVanish	{Tag = "Lever5Jared"},
			ObjectVanish	{Tag = "Lever5Wind"},
			ObjectVanish	{Tag = "Lever5Whisper"},
			ObjectVanish	{Tag = "Lever5Yasha"},
			ObjectVanish	{Tag = "Lever5Caine"},
			ObjectVanish	{Tag = "Lever5Adventurer1"},
			ObjectVanish	{Tag = "Lever5Adventurer2"},
			ObjectVanish	{Tag = "Lever5Adventurer3"},
			ObjectVanish	{Tag = "Lever5Adventurer4"},
			ObjectVanish	{Tag = "Lever5Adventurer5"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5Hero_Warrior"},
			ObjectVanish	{Tag = "Lever5Hero_Healer"},
			ObjectVanish	{Tag = "Lever5Hero_Mage"},
			ObjectVanish	{Tag = "Lever5Hero_Assassin"},
			ObjectVanish	{Tag = "Lever5Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroHealer2Joined"},
			AvatarFlagIsFalse	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarHasLevel {Level = 5},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "HeroShaikan_Healer2", Direction = 0, Tag = "Lever5ShaikanHeroHealer2"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever5ShaikanHeroHealer2",
		OnConditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "HeroShaikan_Healer2"},
			PlayerHeroAdd	{HeroId = 166},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer2", TargetTag = "pl_HumanAvatar", Direction = 0},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroHealer2Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_SecondHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever5Lya"},
			ObjectVanish	{Tag = "Lever5Bor"},
			ObjectVanish	{Tag = "Lever5Shae"},
			ObjectVanish	{Tag = "Lever5Mordecay"},
			ObjectVanish	{Tag = "Lever5Jared"},
			ObjectVanish	{Tag = "Lever5Wind"},
			ObjectVanish	{Tag = "Lever5Whisper"},
			ObjectVanish	{Tag = "Lever5Yasha"},
			ObjectVanish	{Tag = "Lever5Caine"},
			ObjectVanish	{Tag = "Lever5Adventurer1"},
			ObjectVanish	{Tag = "Lever5Adventurer2"},
			ObjectVanish	{Tag = "Lever5Adventurer3"},
			ObjectVanish	{Tag = "Lever5Adventurer4"},
			ObjectVanish	{Tag = "Lever5Adventurer5"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5Hero_Warrior"},
			ObjectVanish	{Tag = "Lever5Hero_Healer"},
			ObjectVanish	{Tag = "Lever5Hero_Mage"},
			ObjectVanish	{Tag = "Lever5Hero_Assassin"},
			ObjectVanish	{Tag = "Lever5Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroMageJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarHasLevel {Level = 5},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "HeroShaikan_Mage", Direction = 0, Tag = "Lever5ShaikanHeroMage"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever5ShaikanHeroMage",
		OnConditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "HeroShaikan_Mage"},
			PlayerHeroAdd	{HeroId = 167},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer3", TargetTag = "pl_HumanAvatar", Direction = 0},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroMageJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_SecondHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever5Lya"},
			ObjectVanish	{Tag = "Lever5Bor"},
			ObjectVanish	{Tag = "Lever5Shae"},
			ObjectVanish	{Tag = "Lever5Mordecay"},
			ObjectVanish	{Tag = "Lever5Jared"},
			ObjectVanish	{Tag = "Lever5Wind"},
			ObjectVanish	{Tag = "Lever5Whisper"},
			ObjectVanish	{Tag = "Lever5Yasha"},
			ObjectVanish	{Tag = "Lever5Caine"},
			ObjectVanish	{Tag = "Lever5Adventurer1"},
			ObjectVanish	{Tag = "Lever5Adventurer2"},
			ObjectVanish	{Tag = "Lever5Adventurer3"},
			ObjectVanish	{Tag = "Lever5Adventurer4"},
			ObjectVanish	{Tag = "Lever5Adventurer5"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5Hero_Warrior"},
			ObjectVanish	{Tag = "Lever5Hero_Healer"},
			ObjectVanish	{Tag = "Lever5Hero_Mage"},
			ObjectVanish	{Tag = "Lever5Hero_Assassin"},
			ObjectVanish	{Tag = "Lever5Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroHealerJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarHasLevel {Level = 5},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "HeroShaikan_Healer", Direction = 0, Tag = "Lever5ShaikanHeroHealer"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever5ShaikanHeroHealer",
		OnConditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "HeroShaikan_Healer"},
			PlayerHeroAdd	{HeroId = 168},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer4", TargetTag = "pl_HumanAvatar", Direction = 0},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroHealerJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_SecondHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever5Lya"},
			ObjectVanish	{Tag = "Lever5Bor"},
			ObjectVanish	{Tag = "Lever5Shae"},
			ObjectVanish	{Tag = "Lever5Mordecay"},
			ObjectVanish	{Tag = "Lever5Jared"},
			ObjectVanish	{Tag = "Lever5Wind"},
			ObjectVanish	{Tag = "Lever5Whisper"},
			ObjectVanish	{Tag = "Lever5Yasha"},
			ObjectVanish	{Tag = "Lever5Caine"},
			ObjectVanish	{Tag = "Lever5Adventurer1"},
			ObjectVanish	{Tag = "Lever5Adventurer2"},
			ObjectVanish	{Tag = "Lever5Adventurer3"},
			ObjectVanish	{Tag = "Lever5Adventurer4"},
			ObjectVanish	{Tag = "Lever5Adventurer5"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5Hero_Warrior"},
			ObjectVanish	{Tag = "Lever5Hero_Healer"},
			ObjectVanish	{Tag = "Lever5Hero_Mage"},
			ObjectVanish	{Tag = "Lever5Hero_Assassin"},
			ObjectVanish	{Tag = "Lever5Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroWarriorJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_SecondHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FirstHeroJoined"},
			AvatarHasLevel {Level = 5},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_WarriorShaikan", Direction = 0, Tag = "Lever5ShaikanHeroWarrior"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever5ShaikanHeroWarrior",
		OnConditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "Hero_WarriorShaikan"},
			PlayerHeroAdd	{HeroId = 169},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer5", TargetTag = "pl_HumanAvatar", Direction = 0},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroWarriorJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_SecondHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever5Lya"},
			ObjectVanish	{Tag = "Lever5Bor"},
			ObjectVanish	{Tag = "Lever5Shae"},
			ObjectVanish	{Tag = "Lever5Mordecay"},
			ObjectVanish	{Tag = "Lever5Jared"},
			ObjectVanish	{Tag = "Lever5Wind"},
			ObjectVanish	{Tag = "Lever5Whisper"},
			ObjectVanish	{Tag = "Lever5Yasha"},
			ObjectVanish	{Tag = "Lever5Caine"},
			ObjectVanish	{Tag = "Lever5Adventurer1"},
			ObjectVanish	{Tag = "Lever5Adventurer2"},
			ObjectVanish	{Tag = "Lever5Adventurer3"},
			ObjectVanish	{Tag = "Lever5Adventurer4"},
			ObjectVanish	{Tag = "Lever5Adventurer5"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever5ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever5Hero_Warrior"},
			ObjectVanish	{Tag = "Lever5Hero_Healer"},
			ObjectVanish	{Tag = "Lever5Hero_Mage"},
			ObjectVanish	{Tag = "Lever5Hero_Assassin"},
			ObjectVanish	{Tag = "Lever5Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_LyaJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarHasLevel {Level = 8},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 388, Y = 304, Direction = 0, Tag = "Lever8Lya"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever8Lya",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 9},
			FigureHeroSpawnToEntity	{Tag = "HeroLya", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Lya"},
			AvatarFlagSetTrue	{Name = "af_P333_LyaJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_ThirdHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever8Lya"},
			ObjectVanish	{Tag = "Lever8Bor"},
			ObjectVanish	{Tag = "Lever8Shae"},
			ObjectVanish	{Tag = "Lever8Mordecay"},
			ObjectVanish	{Tag = "Lever8Jared"},
			ObjectVanish	{Tag = "Lever8Wind"},
			ObjectVanish	{Tag = "Lever8Whisper"},
			ObjectVanish	{Tag = "Lever8Yasha"},
			ObjectVanish	{Tag = "Lever8Caine"},
			ObjectVanish	{Tag = "Lever8Adventurer1"},
			ObjectVanish	{Tag = "Lever8Adventurer2"},
			ObjectVanish	{Tag = "Lever8Adventurer3"},
			ObjectVanish	{Tag = "Lever8Adventurer4"},
			ObjectVanish	{Tag = "Lever8Adventurer5"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever8Hero_Warrior"},
			ObjectVanish	{Tag = "Lever8Hero_Healer"},
			ObjectVanish	{Tag = "Lever8Hero_Mage"},
			ObjectVanish	{Tag = "Lever8Hero_Assassin"},
			ObjectVanish	{Tag = "Lever8Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_BorJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarHasLevel {Level = 8},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 385, Y = 302, Direction = 0, Tag = "Lever8Bor"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever8Bor",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 8},
			FigureHeroSpawnToEntity	{Tag = "HeroBor", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Bor"},
			AvatarFlagSetTrue	{Name = "af_P333_BorJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_ThirdHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever8Lya"},
			ObjectVanish	{Tag = "Lever8Bor"},
			ObjectVanish	{Tag = "Lever8Shae"},
			ObjectVanish	{Tag = "Lever8Mordecay"},
			ObjectVanish	{Tag = "Lever8Jared"},
			ObjectVanish	{Tag = "Lever8Wind"},
			ObjectVanish	{Tag = "Lever8Whisper"},
			ObjectVanish	{Tag = "Lever8Yasha"},
			ObjectVanish	{Tag = "Lever8Caine"},
			ObjectVanish	{Tag = "Lever8Adventurer1"},
			ObjectVanish	{Tag = "Lever8Adventurer2"},
			ObjectVanish	{Tag = "Lever8Adventurer3"},
			ObjectVanish	{Tag = "Lever8Adventurer4"},
			ObjectVanish	{Tag = "Lever8Adventurer5"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever8Hero_Warrior"},
			ObjectVanish	{Tag = "Lever8Hero_Healer"},
			ObjectVanish	{Tag = "Lever8Hero_Mage"},
			ObjectVanish	{Tag = "Lever8Hero_Assassin"},
			ObjectVanish	{Tag = "Lever8Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaeJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarHasLevel {Level = 8},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 382, Y = 299, Direction = 0, Tag = "Lever8Shae"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever8Shae",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 11},
			FigureHeroSpawnToEntity	{Tag = "HeroShae", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Shae"},
			AvatarFlagSetTrue	{Name = "af_P333_ShaeJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_ThirdHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever8Lya"},
			ObjectVanish	{Tag = "Lever8Bor"},
			ObjectVanish	{Tag = "Lever8Shae"},
			ObjectVanish	{Tag = "Lever8Mordecay"},
			ObjectVanish	{Tag = "Lever8Jared"},
			ObjectVanish	{Tag = "Lever8Wind"},
			ObjectVanish	{Tag = "Lever8Whisper"},
			ObjectVanish	{Tag = "Lever8Yasha"},
			ObjectVanish	{Tag = "Lever8Caine"},
			ObjectVanish	{Tag = "Lever8Adventurer1"},
			ObjectVanish	{Tag = "Lever8Adventurer2"},
			ObjectVanish	{Tag = "Lever8Adventurer3"},
			ObjectVanish	{Tag = "Lever8Adventurer4"},
			ObjectVanish	{Tag = "Lever8Adventurer5"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever8Hero_Warrior"},
			ObjectVanish	{Tag = "Lever8Hero_Healer"},
			ObjectVanish	{Tag = "Lever8Hero_Mage"},
			ObjectVanish	{Tag = "Lever8Hero_Assassin"},
			ObjectVanish	{Tag = "Lever8Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_MordecayJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarHasLevel {Level = 8},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 381, Y = 295, Direction = 0, Tag = "Lever8Mordecay"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever8Mordecay",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 10},
			FigureHeroSpawnToEntity	{Tag = "HeroMordecay", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Mordecay"},
			AvatarFlagSetTrue	{Name = "af_P333_MordecayJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_ThirdHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever8Lya"},
			ObjectVanish	{Tag = "Lever8Bor"},
			ObjectVanish	{Tag = "Lever8Shae"},
			ObjectVanish	{Tag = "Lever8Mordecay"},
			ObjectVanish	{Tag = "Lever8Jared"},
			ObjectVanish	{Tag = "Lever8Wind"},
			ObjectVanish	{Tag = "Lever8Whisper"},
			ObjectVanish	{Tag = "Lever8Yasha"},
			ObjectVanish	{Tag = "Lever8Caine"},
			ObjectVanish	{Tag = "Lever8Adventurer1"},
			ObjectVanish	{Tag = "Lever8Adventurer2"},
			ObjectVanish	{Tag = "Lever8Adventurer3"},
			ObjectVanish	{Tag = "Lever8Adventurer4"},
			ObjectVanish	{Tag = "Lever8Adventurer5"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever8Hero_Warrior"},
			ObjectVanish	{Tag = "Lever8Hero_Healer"},
			ObjectVanish	{Tag = "Lever8Hero_Mage"},
			ObjectVanish	{Tag = "Lever8Hero_Assassin"},
			ObjectVanish	{Tag = "Lever8Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_JaredJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarHasLevel {Level = 8},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 404, Y = 288, Direction = 0, Tag = "Lever8Jared"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever8Jared",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 20},
			FigureHeroSpawnToEntity	{Tag = "HeroJared", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Jared"},
			AvatarFlagSetTrue	{Name = "af_P333_JaredJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_ThirdHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever8Lya"},
			ObjectVanish	{Tag = "Lever8Bor"},
			ObjectVanish	{Tag = "Lever8Shae"},
			ObjectVanish	{Tag = "Lever8Mordecay"},
			ObjectVanish	{Tag = "Lever8Jared"},
			ObjectVanish	{Tag = "Lever8Wind"},
			ObjectVanish	{Tag = "Lever8Whisper"},
			ObjectVanish	{Tag = "Lever8Yasha"},
			ObjectVanish	{Tag = "Lever8Caine"},
			ObjectVanish	{Tag = "Lever8Adventurer1"},
			ObjectVanish	{Tag = "Lever8Adventurer2"},
			ObjectVanish	{Tag = "Lever8Adventurer3"},
			ObjectVanish	{Tag = "Lever8Adventurer4"},
			ObjectVanish	{Tag = "Lever8Adventurer5"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever8Hero_Warrior"},
			ObjectVanish	{Tag = "Lever8Hero_Healer"},
			ObjectVanish	{Tag = "Lever8Hero_Mage"},
			ObjectVanish	{Tag = "Lever8Hero_Assassin"},
			ObjectVanish	{Tag = "Lever8Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_WindJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarHasLevel {Level = 8},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 400, Y = 288, Direction = 0, Tag = "Lever8Wind"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever8Wind",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 108},
			FigureHeroSpawnToEntity	{Tag = "HeroWind", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Wind"},
			AvatarFlagSetTrue	{Name = "af_P333_WindJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_ThirdHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever8Lya"},
			ObjectVanish	{Tag = "Lever8Bor"},
			ObjectVanish	{Tag = "Lever8Shae"},
			ObjectVanish	{Tag = "Lever8Mordecay"},
			ObjectVanish	{Tag = "Lever8Jared"},
			ObjectVanish	{Tag = "Lever8Wind"},
			ObjectVanish	{Tag = "Lever8Whisper"},
			ObjectVanish	{Tag = "Lever8Yasha"},
			ObjectVanish	{Tag = "Lever8Caine"},
			ObjectVanish	{Tag = "Lever8Adventurer1"},
			ObjectVanish	{Tag = "Lever8Adventurer2"},
			ObjectVanish	{Tag = "Lever8Adventurer3"},
			ObjectVanish	{Tag = "Lever8Adventurer4"},
			ObjectVanish	{Tag = "Lever8Adventurer5"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever8Hero_Warrior"},
			ObjectVanish	{Tag = "Lever8Hero_Healer"},
			ObjectVanish	{Tag = "Lever8Hero_Mage"},
			ObjectVanish	{Tag = "Lever8Hero_Assassin"},
			ObjectVanish	{Tag = "Lever8Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_WhisperJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarHasLevel {Level = 8},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 396, Y = 288, Direction = 0, Tag = "Lever8Whisper"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever8Whisper",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 107},
			FigureHeroSpawnToEntity	{Tag = "HeroWhisper", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Whisper"},
			AvatarFlagSetTrue	{Name = "af_P333_WhisperJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_ThirdHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever8Lya"},
			ObjectVanish	{Tag = "Lever8Bor"},
			ObjectVanish	{Tag = "Lever8Shae"},
			ObjectVanish	{Tag = "Lever8Mordecay"},
			ObjectVanish	{Tag = "Lever8Jared"},
			ObjectVanish	{Tag = "Lever8Wind"},
			ObjectVanish	{Tag = "Lever8Whisper"},
			ObjectVanish	{Tag = "Lever8Yasha"},
			ObjectVanish	{Tag = "Lever8Caine"},
			ObjectVanish	{Tag = "Lever8Adventurer1"},
			ObjectVanish	{Tag = "Lever8Adventurer2"},
			ObjectVanish	{Tag = "Lever8Adventurer3"},
			ObjectVanish	{Tag = "Lever8Adventurer4"},
			ObjectVanish	{Tag = "Lever8Adventurer5"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever8Hero_Warrior"},
			ObjectVanish	{Tag = "Lever8Hero_Healer"},
			ObjectVanish	{Tag = "Lever8Hero_Mage"},
			ObjectVanish	{Tag = "Lever8Hero_Assassin"},
			ObjectVanish	{Tag = "Lever8Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_YashaJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarHasLevel {Level = 8},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 388, Y = 288, Direction = 0, Tag = "Lever8Yasha"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever8Yasha",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 110},
			FigureHeroSpawnToEntity	{Tag = "HeroYasha", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Yasha"},
			AvatarFlagSetTrue	{Name = "af_P333_YashaJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_ThirdHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever8Lya"},
			ObjectVanish	{Tag = "Lever8Bor"},
			ObjectVanish	{Tag = "Lever8Shae"},
			ObjectVanish	{Tag = "Lever8Mordecay"},
			ObjectVanish	{Tag = "Lever8Jared"},
			ObjectVanish	{Tag = "Lever8Wind"},
			ObjectVanish	{Tag = "Lever8Whisper"},
			ObjectVanish	{Tag = "Lever8Yasha"},
			ObjectVanish	{Tag = "Lever8Caine"},
			ObjectVanish	{Tag = "Lever8Adventurer1"},
			ObjectVanish	{Tag = "Lever8Adventurer2"},
			ObjectVanish	{Tag = "Lever8Adventurer3"},
			ObjectVanish	{Tag = "Lever8Adventurer4"},
			ObjectVanish	{Tag = "Lever8Adventurer5"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever8Hero_Warrior"},
			ObjectVanish	{Tag = "Lever8Hero_Healer"},
			ObjectVanish	{Tag = "Lever8Hero_Mage"},
			ObjectVanish	{Tag = "Lever8Hero_Assassin"},
			ObjectVanish	{Tag = "Lever8Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_CaineJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarHasLevel {Level = 8},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 392, Y = 288, Direction = 0, Tag = "Lever8Caine"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever8Caine",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 109},
			FigureHeroSpawnToEntity	{Tag = "HeroCaine", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Caine"},
			AvatarFlagSetTrue	{Name = "af_P333_CaineJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_ThirdHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever8Lya"},
			ObjectVanish	{Tag = "Lever8Bor"},
			ObjectVanish	{Tag = "Lever8Shae"},
			ObjectVanish	{Tag = "Lever8Mordecay"},
			ObjectVanish	{Tag = "Lever8Jared"},
			ObjectVanish	{Tag = "Lever8Wind"},
			ObjectVanish	{Tag = "Lever8Whisper"},
			ObjectVanish	{Tag = "Lever8Yasha"},
			ObjectVanish	{Tag = "Lever8Caine"},
			ObjectVanish	{Tag = "Lever8Adventurer1"},
			ObjectVanish	{Tag = "Lever8Adventurer2"},
			ObjectVanish	{Tag = "Lever8Adventurer3"},
			ObjectVanish	{Tag = "Lever8Adventurer4"},
			ObjectVanish	{Tag = "Lever8Adventurer5"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever8Hero_Warrior"},
			ObjectVanish	{Tag = "Lever8Hero_Healer"},
			ObjectVanish	{Tag = "Lever8Hero_Mage"},
			ObjectVanish	{Tag = "Lever8Hero_Assassin"},
			ObjectVanish	{Tag = "Lever8Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_Adventurer1Joined"},
			AvatarFlagIsFalse	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarHasLevel {Level = 8},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Adventurer1", Direction = 0, Tag = "Lever8Adventurer1"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever8Adventurer1",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAdventurer1},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer1", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Adventurer1"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_Adventurer1Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_ThirdHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever8Lya"},
			ObjectVanish	{Tag = "Lever8Bor"},
			ObjectVanish	{Tag = "Lever8Shae"},
			ObjectVanish	{Tag = "Lever8Mordecay"},
			ObjectVanish	{Tag = "Lever8Jared"},
			ObjectVanish	{Tag = "Lever8Wind"},
			ObjectVanish	{Tag = "Lever8Whisper"},
			ObjectVanish	{Tag = "Lever8Yasha"},
			ObjectVanish	{Tag = "Lever8Caine"},
			ObjectVanish	{Tag = "Lever8Adventurer1"},
			ObjectVanish	{Tag = "Lever8Adventurer2"},
			ObjectVanish	{Tag = "Lever8Adventurer3"},
			ObjectVanish	{Tag = "Lever8Adventurer4"},
			ObjectVanish	{Tag = "Lever8Adventurer5"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever8Hero_Warrior"},
			ObjectVanish	{Tag = "Lever8Hero_Healer"},
			ObjectVanish	{Tag = "Lever8Hero_Mage"},
			ObjectVanish	{Tag = "Lever8Hero_Assassin"},
			ObjectVanish	{Tag = "Lever8Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_Adventurer2Joined"},
			AvatarFlagIsFalse	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarHasLevel {Level = 8},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Adventurer2", Direction = 0, Tag = "Lever8Adventurer2"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever8Adventurer2",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAdventurer2},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer2", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Adventurer2"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_Adventurer2Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_ThirdHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever8Lya"},
			ObjectVanish	{Tag = "Lever8Bor"},
			ObjectVanish	{Tag = "Lever8Shae"},
			ObjectVanish	{Tag = "Lever8Mordecay"},
			ObjectVanish	{Tag = "Lever8Jared"},
			ObjectVanish	{Tag = "Lever8Wind"},
			ObjectVanish	{Tag = "Lever8Whisper"},
			ObjectVanish	{Tag = "Lever8Yasha"},
			ObjectVanish	{Tag = "Lever8Caine"},
			ObjectVanish	{Tag = "Lever8Adventurer1"},
			ObjectVanish	{Tag = "Lever8Adventurer2"},
			ObjectVanish	{Tag = "Lever8Adventurer3"},
			ObjectVanish	{Tag = "Lever8Adventurer4"},
			ObjectVanish	{Tag = "Lever8Adventurer5"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever8Hero_Warrior"},
			ObjectVanish	{Tag = "Lever8Hero_Healer"},
			ObjectVanish	{Tag = "Lever8Hero_Mage"},
			ObjectVanish	{Tag = "Lever8Hero_Assassin"},
			ObjectVanish	{Tag = "Lever8Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_Adventurer3Joined"},
			AvatarFlagIsFalse	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarHasLevel {Level = 8},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Adventurer3", Direction = 0, Tag = "Lever8Adventurer3"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever8Adventurer3",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAdventurer3},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer3", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Adventurer3"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_Adventurer3Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_ThirdHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever8Lya"},
			ObjectVanish	{Tag = "Lever8Bor"},
			ObjectVanish	{Tag = "Lever8Shae"},
			ObjectVanish	{Tag = "Lever8Mordecay"},
			ObjectVanish	{Tag = "Lever8Jared"},
			ObjectVanish	{Tag = "Lever8Wind"},
			ObjectVanish	{Tag = "Lever8Whisper"},
			ObjectVanish	{Tag = "Lever8Yasha"},
			ObjectVanish	{Tag = "Lever8Caine"},
			ObjectVanish	{Tag = "Lever8Adventurer1"},
			ObjectVanish	{Tag = "Lever8Adventurer2"},
			ObjectVanish	{Tag = "Lever8Adventurer3"},
			ObjectVanish	{Tag = "Lever8Adventurer4"},
			ObjectVanish	{Tag = "Lever8Adventurer5"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever8Hero_Warrior"},
			ObjectVanish	{Tag = "Lever8Hero_Healer"},
			ObjectVanish	{Tag = "Lever8Hero_Mage"},
			ObjectVanish	{Tag = "Lever8Hero_Assassin"},
			ObjectVanish	{Tag = "Lever8Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_Adventurer4Joined"},
			AvatarFlagIsFalse	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarHasLevel {Level = 8},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Adventurer4", Direction = 0, Tag = "Lever8Adventurer4"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever8Adventurer4",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAdventurer4},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer4", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Adventurer4"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_Adventurer4Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_ThirdHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever8Lya"},
			ObjectVanish	{Tag = "Lever8Bor"},
			ObjectVanish	{Tag = "Lever8Shae"},
			ObjectVanish	{Tag = "Lever8Mordecay"},
			ObjectVanish	{Tag = "Lever8Jared"},
			ObjectVanish	{Tag = "Lever8Wind"},
			ObjectVanish	{Tag = "Lever8Whisper"},
			ObjectVanish	{Tag = "Lever8Yasha"},
			ObjectVanish	{Tag = "Lever8Caine"},
			ObjectVanish	{Tag = "Lever8Adventurer1"},
			ObjectVanish	{Tag = "Lever8Adventurer2"},
			ObjectVanish	{Tag = "Lever8Adventurer3"},
			ObjectVanish	{Tag = "Lever8Adventurer4"},
			ObjectVanish	{Tag = "Lever8Adventurer5"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever8Hero_Warrior"},
			ObjectVanish	{Tag = "Lever8Hero_Healer"},
			ObjectVanish	{Tag = "Lever8Hero_Mage"},
			ObjectVanish	{Tag = "Lever8Hero_Assassin"},
			ObjectVanish	{Tag = "Lever8Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_Adventurer5Joined"},
			AvatarFlagIsFalse	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarHasLevel {Level = 8},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Adventurer5", Direction = 0, Tag = "Lever8Adventurer5"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever8Adventurer5",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAdventurer5},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer5", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Adventurer5"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_Adventurer5Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_ThirdHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever8Lya"},
			ObjectVanish	{Tag = "Lever8Bor"},
			ObjectVanish	{Tag = "Lever8Shae"},
			ObjectVanish	{Tag = "Lever8Mordecay"},
			ObjectVanish	{Tag = "Lever8Jared"},
			ObjectVanish	{Tag = "Lever8Wind"},
			ObjectVanish	{Tag = "Lever8Whisper"},
			ObjectVanish	{Tag = "Lever8Yasha"},
			ObjectVanish	{Tag = "Lever8Caine"},
			ObjectVanish	{Tag = "Lever8Adventurer1"},
			ObjectVanish	{Tag = "Lever8Adventurer2"},
			ObjectVanish	{Tag = "Lever8Adventurer3"},
			ObjectVanish	{Tag = "Lever8Adventurer4"},
			ObjectVanish	{Tag = "Lever8Adventurer5"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever8Hero_Warrior"},
			ObjectVanish	{Tag = "Lever8Hero_Healer"},
			ObjectVanish	{Tag = "Lever8Hero_Mage"},
			ObjectVanish	{Tag = "Lever8Hero_Assassin"},
			ObjectVanish	{Tag = "Lever8Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_WarriorJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarHasLevel {Level = 8},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Warrior", Direction = 0, Tag = "Lever8Hero_Warrior"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever8Hero_Warrior",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopWarrior},
			FigureHeroSpawnToEntity	{Tag = "CoopWarrior", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Warrior"},
			AvatarFlagSetTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_WarriorJoined"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever8Lya"},
			ObjectVanish	{Tag = "Lever8Bor"},
			ObjectVanish	{Tag = "Lever8Shae"},
			ObjectVanish	{Tag = "Lever8Mordecay"},
			ObjectVanish	{Tag = "Lever8Jared"},
			ObjectVanish	{Tag = "Lever8Wind"},
			ObjectVanish	{Tag = "Lever8Whisper"},
			ObjectVanish	{Tag = "Lever8Yasha"},
			ObjectVanish	{Tag = "Lever8Caine"},
			ObjectVanish	{Tag = "Lever8Adventurer1"},
			ObjectVanish	{Tag = "Lever8Adventurer2"},
			ObjectVanish	{Tag = "Lever8Adventurer3"},
			ObjectVanish	{Tag = "Lever8Adventurer4"},
			ObjectVanish	{Tag = "Lever8Adventurer5"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever8Hero_Warrior"},
			ObjectVanish	{Tag = "Lever8Hero_Healer"},
			ObjectVanish	{Tag = "Lever8Hero_Mage"},
			ObjectVanish	{Tag = "Lever8Hero_Assassin"},
			ObjectVanish	{Tag = "Lever8Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_HealerJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarHasLevel {Level = 8},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Healer", Direction = 0, Tag = "Lever8Hero_Healer"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever8Hero_Healer",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopHealer},
			FigureHeroSpawnToEntity	{Tag = "CoopHealer", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Healer"},
			AvatarFlagSetTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_HealerJoined"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever8Lya"},
			ObjectVanish	{Tag = "Lever8Bor"},
			ObjectVanish	{Tag = "Lever8Shae"},
			ObjectVanish	{Tag = "Lever8Mordecay"},
			ObjectVanish	{Tag = "Lever8Jared"},
			ObjectVanish	{Tag = "Lever8Wind"},
			ObjectVanish	{Tag = "Lever8Whisper"},
			ObjectVanish	{Tag = "Lever8Yasha"},
			ObjectVanish	{Tag = "Lever8Caine"},
			ObjectVanish	{Tag = "Lever8Adventurer1"},
			ObjectVanish	{Tag = "Lever8Adventurer2"},
			ObjectVanish	{Tag = "Lever8Adventurer3"},
			ObjectVanish	{Tag = "Lever8Adventurer4"},
			ObjectVanish	{Tag = "Lever8Adventurer5"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever8Hero_Warrior"},
			ObjectVanish	{Tag = "Lever8Hero_Healer"},
			ObjectVanish	{Tag = "Lever8Hero_Mage"},
			ObjectVanish	{Tag = "Lever8Hero_Assassin"},
			ObjectVanish	{Tag = "Lever8Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_MageJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarHasLevel {Level = 8},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Mage", Direction = 0, Tag = "Lever8Hero_Mage"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever8Hero_Mage",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopMage},
			FigureHeroSpawnToEntity	{Tag = "CoopMage", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Mage"},
			AvatarFlagSetTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_MageJoined"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever8Lya"},
			ObjectVanish	{Tag = "Lever8Bor"},
			ObjectVanish	{Tag = "Lever8Shae"},
			ObjectVanish	{Tag = "Lever8Mordecay"},
			ObjectVanish	{Tag = "Lever8Jared"},
			ObjectVanish	{Tag = "Lever8Wind"},
			ObjectVanish	{Tag = "Lever8Whisper"},
			ObjectVanish	{Tag = "Lever8Yasha"},
			ObjectVanish	{Tag = "Lever8Caine"},
			ObjectVanish	{Tag = "Lever8Adventurer1"},
			ObjectVanish	{Tag = "Lever8Adventurer2"},
			ObjectVanish	{Tag = "Lever8Adventurer3"},
			ObjectVanish	{Tag = "Lever8Adventurer4"},
			ObjectVanish	{Tag = "Lever8Adventurer5"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever8Hero_Warrior"},
			ObjectVanish	{Tag = "Lever8Hero_Healer"},
			ObjectVanish	{Tag = "Lever8Hero_Mage"},
			ObjectVanish	{Tag = "Lever8Hero_Assassin"},
			ObjectVanish	{Tag = "Lever8Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_AssassinJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarHasLevel {Level = 8},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Assassin", Direction = 0, Tag = "Lever8Hero_Assassin"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever8Hero_Assassin",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAssassin},
			FigureHeroSpawnToEntity	{Tag = "CoopAssassin", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Assassin"},
			AvatarFlagSetTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_AssassinJoined"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever8Lya"},
			ObjectVanish	{Tag = "Lever8Bor"},
			ObjectVanish	{Tag = "Lever8Shae"},
			ObjectVanish	{Tag = "Lever8Mordecay"},
			ObjectVanish	{Tag = "Lever8Jared"},
			ObjectVanish	{Tag = "Lever8Wind"},
			ObjectVanish	{Tag = "Lever8Whisper"},
			ObjectVanish	{Tag = "Lever8Yasha"},
			ObjectVanish	{Tag = "Lever8Caine"},
			ObjectVanish	{Tag = "Lever8Adventurer1"},
			ObjectVanish	{Tag = "Lever8Adventurer2"},
			ObjectVanish	{Tag = "Lever8Adventurer3"},
			ObjectVanish	{Tag = "Lever8Adventurer4"},
			ObjectVanish	{Tag = "Lever8Adventurer5"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever8Hero_Warrior"},
			ObjectVanish	{Tag = "Lever8Hero_Healer"},
			ObjectVanish	{Tag = "Lever8Hero_Mage"},
			ObjectVanish	{Tag = "Lever8Hero_Assassin"},
			ObjectVanish	{Tag = "Lever8Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_ArcherJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarHasLevel {Level = 8},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Archer", Direction = 0, Tag = "Lever8Hero_Archer"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever8Hero_Archer",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopArcher},
			FigureHeroSpawnToEntity	{Tag = "CoopArcher", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Archer"},
			AvatarFlagSetTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_ArcherJoined"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever8Lya"},
			ObjectVanish	{Tag = "Lever8Bor"},
			ObjectVanish	{Tag = "Lever8Shae"},
			ObjectVanish	{Tag = "Lever8Mordecay"},
			ObjectVanish	{Tag = "Lever8Jared"},
			ObjectVanish	{Tag = "Lever8Wind"},
			ObjectVanish	{Tag = "Lever8Whisper"},
			ObjectVanish	{Tag = "Lever8Yasha"},
			ObjectVanish	{Tag = "Lever8Caine"},
			ObjectVanish	{Tag = "Lever8Adventurer1"},
			ObjectVanish	{Tag = "Lever8Adventurer2"},
			ObjectVanish	{Tag = "Lever8Adventurer3"},
			ObjectVanish	{Tag = "Lever8Adventurer4"},
			ObjectVanish	{Tag = "Lever8Adventurer5"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever8Hero_Warrior"},
			ObjectVanish	{Tag = "Lever8Hero_Healer"},
			ObjectVanish	{Tag = "Lever8Hero_Mage"},
			ObjectVanish	{Tag = "Lever8Hero_Assassin"},
			ObjectVanish	{Tag = "Lever8Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroMeleeJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarHasLevel {Level = 8},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "HeroShaikan_Melee", Direction = 0, Tag = "Lever8ShaikanHeroMelee"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever8ShaikanHeroMelee",
		OnConditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "HeroShaikan_Melee"},
			PlayerHeroAdd	{HeroId = 165},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer1", TargetTag = "pl_HumanAvatar", Direction = 0},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroMeleeJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_ThirdHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever8Lya"},
			ObjectVanish	{Tag = "Lever8Bor"},
			ObjectVanish	{Tag = "Lever8Shae"},
			ObjectVanish	{Tag = "Lever8Mordecay"},
			ObjectVanish	{Tag = "Lever8Jared"},
			ObjectVanish	{Tag = "Lever8Wind"},
			ObjectVanish	{Tag = "Lever8Whisper"},
			ObjectVanish	{Tag = "Lever8Yasha"},
			ObjectVanish	{Tag = "Lever8Caine"},
			ObjectVanish	{Tag = "Lever8Adventurer1"},
			ObjectVanish	{Tag = "Lever8Adventurer2"},
			ObjectVanish	{Tag = "Lever8Adventurer3"},
			ObjectVanish	{Tag = "Lever8Adventurer4"},
			ObjectVanish	{Tag = "Lever8Adventurer5"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever8Hero_Warrior"},
			ObjectVanish	{Tag = "Lever8Hero_Healer"},
			ObjectVanish	{Tag = "Lever8Hero_Mage"},
			ObjectVanish	{Tag = "Lever8Hero_Assassin"},
			ObjectVanish	{Tag = "Lever8Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroHealer2Joined"},
			AvatarFlagIsFalse	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarHasLevel {Level = 8},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "HeroShaikan_Healer2", Direction = 0, Tag = "Lever8ShaikanHeroHealer2"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever8ShaikanHeroHealer2",
		OnConditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "HeroShaikan_Healer2"},
			PlayerHeroAdd	{HeroId = 166},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer2", TargetTag = "pl_HumanAvatar", Direction = 0},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroHealer2Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_ThirdHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever8Lya"},
			ObjectVanish	{Tag = "Lever8Bor"},
			ObjectVanish	{Tag = "Lever8Shae"},
			ObjectVanish	{Tag = "Lever8Mordecay"},
			ObjectVanish	{Tag = "Lever8Jared"},
			ObjectVanish	{Tag = "Lever8Wind"},
			ObjectVanish	{Tag = "Lever8Whisper"},
			ObjectVanish	{Tag = "Lever8Yasha"},
			ObjectVanish	{Tag = "Lever8Caine"},
			ObjectVanish	{Tag = "Lever8Adventurer1"},
			ObjectVanish	{Tag = "Lever8Adventurer2"},
			ObjectVanish	{Tag = "Lever8Adventurer3"},
			ObjectVanish	{Tag = "Lever8Adventurer4"},
			ObjectVanish	{Tag = "Lever8Adventurer5"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever8Hero_Warrior"},
			ObjectVanish	{Tag = "Lever8Hero_Healer"},
			ObjectVanish	{Tag = "Lever8Hero_Mage"},
			ObjectVanish	{Tag = "Lever8Hero_Assassin"},
			ObjectVanish	{Tag = "Lever8Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroMageJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarHasLevel {Level = 8},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "HeroShaikan_Mage", Direction = 0, Tag = "Lever8ShaikanHeroMage"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever8ShaikanHeroMage",
		OnConditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "HeroShaikan_Mage"},
			PlayerHeroAdd	{HeroId = 167},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer3", TargetTag = "pl_HumanAvatar", Direction = 0},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroMageJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_ThirdHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever8Lya"},
			ObjectVanish	{Tag = "Lever8Bor"},
			ObjectVanish	{Tag = "Lever8Shae"},
			ObjectVanish	{Tag = "Lever8Mordecay"},
			ObjectVanish	{Tag = "Lever8Jared"},
			ObjectVanish	{Tag = "Lever8Wind"},
			ObjectVanish	{Tag = "Lever8Whisper"},
			ObjectVanish	{Tag = "Lever8Yasha"},
			ObjectVanish	{Tag = "Lever8Caine"},
			ObjectVanish	{Tag = "Lever8Adventurer1"},
			ObjectVanish	{Tag = "Lever8Adventurer2"},
			ObjectVanish	{Tag = "Lever8Adventurer3"},
			ObjectVanish	{Tag = "Lever8Adventurer4"},
			ObjectVanish	{Tag = "Lever8Adventurer5"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever8Hero_Warrior"},
			ObjectVanish	{Tag = "Lever8Hero_Healer"},
			ObjectVanish	{Tag = "Lever8Hero_Mage"},
			ObjectVanish	{Tag = "Lever8Hero_Assassin"},
			ObjectVanish	{Tag = "Lever8Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroHealerJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarHasLevel {Level = 8},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "HeroShaikan_Healer", Direction = 0, Tag = "Lever8ShaikanHeroHealer"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever8ShaikanHeroHealer",
		OnConditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "HeroShaikan_Healer"},
			PlayerHeroAdd	{HeroId = 168},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer4", TargetTag = "pl_HumanAvatar", Direction = 0},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroHealerJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_ThirdHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever8Lya"},
			ObjectVanish	{Tag = "Lever8Bor"},
			ObjectVanish	{Tag = "Lever8Shae"},
			ObjectVanish	{Tag = "Lever8Mordecay"},
			ObjectVanish	{Tag = "Lever8Jared"},
			ObjectVanish	{Tag = "Lever8Wind"},
			ObjectVanish	{Tag = "Lever8Whisper"},
			ObjectVanish	{Tag = "Lever8Yasha"},
			ObjectVanish	{Tag = "Lever8Caine"},
			ObjectVanish	{Tag = "Lever8Adventurer1"},
			ObjectVanish	{Tag = "Lever8Adventurer2"},
			ObjectVanish	{Tag = "Lever8Adventurer3"},
			ObjectVanish	{Tag = "Lever8Adventurer4"},
			ObjectVanish	{Tag = "Lever8Adventurer5"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever8Hero_Warrior"},
			ObjectVanish	{Tag = "Lever8Hero_Healer"},
			ObjectVanish	{Tag = "Lever8Hero_Mage"},
			ObjectVanish	{Tag = "Lever8Hero_Assassin"},
			ObjectVanish	{Tag = "Lever8Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroWarriorJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_ThirdHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_SecondHeroJoined"},
			AvatarHasLevel {Level = 8},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_WarriorShaikan", Direction = 0, Tag = "Lever8ShaikanHeroWarrior"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever8ShaikanHeroWarrior",
		OnConditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "Hero_WarriorShaikan"},
			PlayerHeroAdd	{HeroId = 169},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer5", TargetTag = "pl_HumanAvatar", Direction = 0},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroWarriorJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_ThirdHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever8Lya"},
			ObjectVanish	{Tag = "Lever8Bor"},
			ObjectVanish	{Tag = "Lever8Shae"},
			ObjectVanish	{Tag = "Lever8Mordecay"},
			ObjectVanish	{Tag = "Lever8Jared"},
			ObjectVanish	{Tag = "Lever8Wind"},
			ObjectVanish	{Tag = "Lever8Whisper"},
			ObjectVanish	{Tag = "Lever8Yasha"},
			ObjectVanish	{Tag = "Lever8Caine"},
			ObjectVanish	{Tag = "Lever8Adventurer1"},
			ObjectVanish	{Tag = "Lever8Adventurer2"},
			ObjectVanish	{Tag = "Lever8Adventurer3"},
			ObjectVanish	{Tag = "Lever8Adventurer4"},
			ObjectVanish	{Tag = "Lever8Adventurer5"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever8ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever8Hero_Warrior"},
			ObjectVanish	{Tag = "Lever8Hero_Healer"},
			ObjectVanish	{Tag = "Lever8Hero_Mage"},
			ObjectVanish	{Tag = "Lever8Hero_Assassin"},
			ObjectVanish	{Tag = "Lever8Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_LyaJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarHasLevel {Level = 11},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 388, Y = 304, Direction = 0, Tag = "Lever11Lya"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever11Lya",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 9},
			FigureHeroSpawnToEntity	{Tag = "HeroLya", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Lya"},
			AvatarFlagSetTrue	{Name = "af_P333_LyaJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FourthHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever11Lya"},
			ObjectVanish	{Tag = "Lever11Bor"},
			ObjectVanish	{Tag = "Lever11Shae"},
			ObjectVanish	{Tag = "Lever11Mordecay"},
			ObjectVanish	{Tag = "Lever11Jared"},
			ObjectVanish	{Tag = "Lever11Wind"},
			ObjectVanish	{Tag = "Lever11Whisper"},
			ObjectVanish	{Tag = "Lever11Yasha"},
			ObjectVanish	{Tag = "Lever11Caine"},
			ObjectVanish	{Tag = "Lever11Adventurer1"},
			ObjectVanish	{Tag = "Lever11Adventurer2"},
			ObjectVanish	{Tag = "Lever11Adventurer3"},
			ObjectVanish	{Tag = "Lever11Adventurer4"},
			ObjectVanish	{Tag = "Lever11Adventurer5"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever11Hero_Warrior"},
			ObjectVanish	{Tag = "Lever11Hero_Healer"},
			ObjectVanish	{Tag = "Lever11Hero_Mage"},
			ObjectVanish	{Tag = "Lever11Hero_Assassin"},
			ObjectVanish	{Tag = "Lever11Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_BorJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarHasLevel {Level = 11},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 385, Y = 302, Direction = 0, Tag = "Lever11Bor"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever11Bor",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 8},
			FigureHeroSpawnToEntity	{Tag = "HeroBor", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Bor"},
			AvatarFlagSetTrue	{Name = "af_P333_BorJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FourthHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever11Lya"},
			ObjectVanish	{Tag = "Lever11Bor"},
			ObjectVanish	{Tag = "Lever11Shae"},
			ObjectVanish	{Tag = "Lever11Mordecay"},
			ObjectVanish	{Tag = "Lever11Jared"},
			ObjectVanish	{Tag = "Lever11Wind"},
			ObjectVanish	{Tag = "Lever11Whisper"},
			ObjectVanish	{Tag = "Lever11Yasha"},
			ObjectVanish	{Tag = "Lever11Caine"},
			ObjectVanish	{Tag = "Lever11Adventurer1"},
			ObjectVanish	{Tag = "Lever11Adventurer2"},
			ObjectVanish	{Tag = "Lever11Adventurer3"},
			ObjectVanish	{Tag = "Lever11Adventurer4"},
			ObjectVanish	{Tag = "Lever11Adventurer5"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever11Hero_Warrior"},
			ObjectVanish	{Tag = "Lever11Hero_Healer"},
			ObjectVanish	{Tag = "Lever11Hero_Mage"},
			ObjectVanish	{Tag = "Lever11Hero_Assassin"},
			ObjectVanish	{Tag = "Lever11Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaeJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarHasLevel {Level = 11},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 382, Y = 299, Direction = 0, Tag = "Lever11Shae"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever11Shae",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 11},
			FigureHeroSpawnToEntity	{Tag = "HeroShae", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Shae"},
			AvatarFlagSetTrue	{Name = "af_P333_ShaeJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FourthHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever11Lya"},
			ObjectVanish	{Tag = "Lever11Bor"},
			ObjectVanish	{Tag = "Lever11Shae"},
			ObjectVanish	{Tag = "Lever11Mordecay"},
			ObjectVanish	{Tag = "Lever11Jared"},
			ObjectVanish	{Tag = "Lever11Wind"},
			ObjectVanish	{Tag = "Lever11Whisper"},
			ObjectVanish	{Tag = "Lever11Yasha"},
			ObjectVanish	{Tag = "Lever11Caine"},
			ObjectVanish	{Tag = "Lever11Adventurer1"},
			ObjectVanish	{Tag = "Lever11Adventurer2"},
			ObjectVanish	{Tag = "Lever11Adventurer3"},
			ObjectVanish	{Tag = "Lever11Adventurer4"},
			ObjectVanish	{Tag = "Lever11Adventurer5"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever11Hero_Warrior"},
			ObjectVanish	{Tag = "Lever11Hero_Healer"},
			ObjectVanish	{Tag = "Lever11Hero_Mage"},
			ObjectVanish	{Tag = "Lever11Hero_Assassin"},
			ObjectVanish	{Tag = "Lever11Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_MordecayJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarHasLevel {Level = 11},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 381, Y = 295, Direction = 0, Tag = "Lever11Mordecay"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever11Mordecay",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 10},
			FigureHeroSpawnToEntity	{Tag = "HeroMordecay", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Mordecay"},
			AvatarFlagSetTrue	{Name = "af_P333_MordecayJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FourthHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever11Lya"},
			ObjectVanish	{Tag = "Lever11Bor"},
			ObjectVanish	{Tag = "Lever11Shae"},
			ObjectVanish	{Tag = "Lever11Mordecay"},
			ObjectVanish	{Tag = "Lever11Jared"},
			ObjectVanish	{Tag = "Lever11Wind"},
			ObjectVanish	{Tag = "Lever11Whisper"},
			ObjectVanish	{Tag = "Lever11Yasha"},
			ObjectVanish	{Tag = "Lever11Caine"},
			ObjectVanish	{Tag = "Lever11Adventurer1"},
			ObjectVanish	{Tag = "Lever11Adventurer2"},
			ObjectVanish	{Tag = "Lever11Adventurer3"},
			ObjectVanish	{Tag = "Lever11Adventurer4"},
			ObjectVanish	{Tag = "Lever11Adventurer5"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever11Hero_Warrior"},
			ObjectVanish	{Tag = "Lever11Hero_Healer"},
			ObjectVanish	{Tag = "Lever11Hero_Mage"},
			ObjectVanish	{Tag = "Lever11Hero_Assassin"},
			ObjectVanish	{Tag = "Lever11Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_JaredJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarHasLevel {Level = 11},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 404, Y = 288, Direction = 0, Tag = "Lever11Jared"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever11Jared",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 20},
			FigureHeroSpawnToEntity	{Tag = "HeroJared", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Jared"},
			AvatarFlagSetTrue	{Name = "af_P333_JaredJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FourthHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever11Lya"},
			ObjectVanish	{Tag = "Lever11Bor"},
			ObjectVanish	{Tag = "Lever11Shae"},
			ObjectVanish	{Tag = "Lever11Mordecay"},
			ObjectVanish	{Tag = "Lever11Jared"},
			ObjectVanish	{Tag = "Lever11Wind"},
			ObjectVanish	{Tag = "Lever11Whisper"},
			ObjectVanish	{Tag = "Lever11Yasha"},
			ObjectVanish	{Tag = "Lever11Caine"},
			ObjectVanish	{Tag = "Lever11Adventurer1"},
			ObjectVanish	{Tag = "Lever11Adventurer2"},
			ObjectVanish	{Tag = "Lever11Adventurer3"},
			ObjectVanish	{Tag = "Lever11Adventurer4"},
			ObjectVanish	{Tag = "Lever11Adventurer5"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever11Hero_Warrior"},
			ObjectVanish	{Tag = "Lever11Hero_Healer"},
			ObjectVanish	{Tag = "Lever11Hero_Mage"},
			ObjectVanish	{Tag = "Lever11Hero_Assassin"},
			ObjectVanish	{Tag = "Lever11Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_WindJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarHasLevel {Level = 11},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 400, Y = 288, Direction = 0, Tag = "Lever11Wind"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever11Wind",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 108},
			FigureHeroSpawnToEntity	{Tag = "HeroWind", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Wind"},
			AvatarFlagSetTrue	{Name = "af_P333_WindJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FourthHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever11Lya"},
			ObjectVanish	{Tag = "Lever11Bor"},
			ObjectVanish	{Tag = "Lever11Shae"},
			ObjectVanish	{Tag = "Lever11Mordecay"},
			ObjectVanish	{Tag = "Lever11Jared"},
			ObjectVanish	{Tag = "Lever11Wind"},
			ObjectVanish	{Tag = "Lever11Whisper"},
			ObjectVanish	{Tag = "Lever11Yasha"},
			ObjectVanish	{Tag = "Lever11Caine"},
			ObjectVanish	{Tag = "Lever11Adventurer1"},
			ObjectVanish	{Tag = "Lever11Adventurer2"},
			ObjectVanish	{Tag = "Lever11Adventurer3"},
			ObjectVanish	{Tag = "Lever11Adventurer4"},
			ObjectVanish	{Tag = "Lever11Adventurer5"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever11Hero_Warrior"},
			ObjectVanish	{Tag = "Lever11Hero_Healer"},
			ObjectVanish	{Tag = "Lever11Hero_Mage"},
			ObjectVanish	{Tag = "Lever11Hero_Assassin"},
			ObjectVanish	{Tag = "Lever11Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_WhisperJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarHasLevel {Level = 11},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 396, Y = 288, Direction = 0, Tag = "Lever11Whisper"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever11Whisper",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 107},
			FigureHeroSpawnToEntity	{Tag = "HeroWhisper", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Whisper"},
			AvatarFlagSetTrue	{Name = "af_P333_WhisperJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FourthHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever11Lya"},
			ObjectVanish	{Tag = "Lever11Bor"},
			ObjectVanish	{Tag = "Lever11Shae"},
			ObjectVanish	{Tag = "Lever11Mordecay"},
			ObjectVanish	{Tag = "Lever11Jared"},
			ObjectVanish	{Tag = "Lever11Wind"},
			ObjectVanish	{Tag = "Lever11Whisper"},
			ObjectVanish	{Tag = "Lever11Yasha"},
			ObjectVanish	{Tag = "Lever11Caine"},
			ObjectVanish	{Tag = "Lever11Adventurer1"},
			ObjectVanish	{Tag = "Lever11Adventurer2"},
			ObjectVanish	{Tag = "Lever11Adventurer3"},
			ObjectVanish	{Tag = "Lever11Adventurer4"},
			ObjectVanish	{Tag = "Lever11Adventurer5"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever11Hero_Warrior"},
			ObjectVanish	{Tag = "Lever11Hero_Healer"},
			ObjectVanish	{Tag = "Lever11Hero_Mage"},
			ObjectVanish	{Tag = "Lever11Hero_Assassin"},
			ObjectVanish	{Tag = "Lever11Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_YashaJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarHasLevel {Level = 11},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 388, Y = 288, Direction = 0, Tag = "Lever11Yasha"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever11Yasha",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 110},
			FigureHeroSpawnToEntity	{Tag = "HeroYasha", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Yasha"},
			AvatarFlagSetTrue	{Name = "af_P333_YashaJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FourthHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever11Lya"},
			ObjectVanish	{Tag = "Lever11Bor"},
			ObjectVanish	{Tag = "Lever11Shae"},
			ObjectVanish	{Tag = "Lever11Mordecay"},
			ObjectVanish	{Tag = "Lever11Jared"},
			ObjectVanish	{Tag = "Lever11Wind"},
			ObjectVanish	{Tag = "Lever11Whisper"},
			ObjectVanish	{Tag = "Lever11Yasha"},
			ObjectVanish	{Tag = "Lever11Caine"},
			ObjectVanish	{Tag = "Lever11Adventurer1"},
			ObjectVanish	{Tag = "Lever11Adventurer2"},
			ObjectVanish	{Tag = "Lever11Adventurer3"},
			ObjectVanish	{Tag = "Lever11Adventurer4"},
			ObjectVanish	{Tag = "Lever11Adventurer5"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever11Hero_Warrior"},
			ObjectVanish	{Tag = "Lever11Hero_Healer"},
			ObjectVanish	{Tag = "Lever11Hero_Mage"},
			ObjectVanish	{Tag = "Lever11Hero_Assassin"},
			ObjectVanish	{Tag = "Lever11Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_CaineJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarHasLevel {Level = 11},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 392, Y = 288, Direction = 0, Tag = "Lever11Caine"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever11Caine",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 109},
			FigureHeroSpawnToEntity	{Tag = "HeroCaine", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Caine"},
			AvatarFlagSetTrue	{Name = "af_P333_CaineJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FourthHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever11Lya"},
			ObjectVanish	{Tag = "Lever11Bor"},
			ObjectVanish	{Tag = "Lever11Shae"},
			ObjectVanish	{Tag = "Lever11Mordecay"},
			ObjectVanish	{Tag = "Lever11Jared"},
			ObjectVanish	{Tag = "Lever11Wind"},
			ObjectVanish	{Tag = "Lever11Whisper"},
			ObjectVanish	{Tag = "Lever11Yasha"},
			ObjectVanish	{Tag = "Lever11Caine"},
			ObjectVanish	{Tag = "Lever11Adventurer1"},
			ObjectVanish	{Tag = "Lever11Adventurer2"},
			ObjectVanish	{Tag = "Lever11Adventurer3"},
			ObjectVanish	{Tag = "Lever11Adventurer4"},
			ObjectVanish	{Tag = "Lever11Adventurer5"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever11Hero_Warrior"},
			ObjectVanish	{Tag = "Lever11Hero_Healer"},
			ObjectVanish	{Tag = "Lever11Hero_Mage"},
			ObjectVanish	{Tag = "Lever11Hero_Assassin"},
			ObjectVanish	{Tag = "Lever11Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_Adventurer1Joined"},
			AvatarFlagIsFalse	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarHasLevel	{Level = 11},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Adventurer1", Direction = 0, Tag = "Lever11Adventurer1"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever11Adventurer1",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAdventurer1},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer1", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Adventurer1"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_Adventurer1Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_FourthHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever11Lya"},
			ObjectVanish	{Tag = "Lever11Bor"},
			ObjectVanish	{Tag = "Lever11Shae"},
			ObjectVanish	{Tag = "Lever11Mordecay"},
			ObjectVanish	{Tag = "Lever11Jared"},
			ObjectVanish	{Tag = "Lever11Wind"},
			ObjectVanish	{Tag = "Lever11Whisper"},
			ObjectVanish	{Tag = "Lever11Yasha"},
			ObjectVanish	{Tag = "Lever11Caine"},
			ObjectVanish	{Tag = "Lever11Adventurer1"},
			ObjectVanish	{Tag = "Lever11Adventurer2"},
			ObjectVanish	{Tag = "Lever11Adventurer3"},
			ObjectVanish	{Tag = "Lever11Adventurer4"},
			ObjectVanish	{Tag = "Lever11Adventurer5"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever11Hero_Warrior"},
			ObjectVanish	{Tag = "Lever11Hero_Healer"},
			ObjectVanish	{Tag = "Lever11Hero_Mage"},
			ObjectVanish	{Tag = "Lever11Hero_Assassin"},
			ObjectVanish	{Tag = "Lever11Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_Adventurer2Joined"},
			AvatarFlagIsFalse	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarHasLevel	{Level = 11},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Adventurer2", Direction = 0, Tag = "Lever11Adventurer2"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever11Adventurer2",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAdventurer2},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer2", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Adventurer2"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_Adventurer2Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_FourthHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever11Lya"},
			ObjectVanish	{Tag = "Lever11Bor"},
			ObjectVanish	{Tag = "Lever11Shae"},
			ObjectVanish	{Tag = "Lever11Mordecay"},
			ObjectVanish	{Tag = "Lever11Jared"},
			ObjectVanish	{Tag = "Lever11Wind"},
			ObjectVanish	{Tag = "Lever11Whisper"},
			ObjectVanish	{Tag = "Lever11Yasha"},
			ObjectVanish	{Tag = "Lever11Caine"},
			ObjectVanish	{Tag = "Lever11Adventurer1"},
			ObjectVanish	{Tag = "Lever11Adventurer2"},
			ObjectVanish	{Tag = "Lever11Adventurer3"},
			ObjectVanish	{Tag = "Lever11Adventurer4"},
			ObjectVanish	{Tag = "Lever11Adventurer5"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever11Hero_Warrior"},
			ObjectVanish	{Tag = "Lever11Hero_Healer"},
			ObjectVanish	{Tag = "Lever11Hero_Mage"},
			ObjectVanish	{Tag = "Lever11Hero_Assassin"},
			ObjectVanish	{Tag = "Lever11Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_Adventurer3Joined"},
			AvatarFlagIsFalse	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarHasLevel {Level = 11},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Adventurer3", Direction = 0, Tag = "Lever11Adventurer3"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever11Adventurer3",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAdventurer3},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer3", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Adventurer3"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_Adventurer3Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_FourthHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever11Lya"},
			ObjectVanish	{Tag = "Lever11Bor"},
			ObjectVanish	{Tag = "Lever11Shae"},
			ObjectVanish	{Tag = "Lever11Mordecay"},
			ObjectVanish	{Tag = "Lever11Jared"},
			ObjectVanish	{Tag = "Lever11Wind"},
			ObjectVanish	{Tag = "Lever11Whisper"},
			ObjectVanish	{Tag = "Lever11Yasha"},
			ObjectVanish	{Tag = "Lever11Caine"},
			ObjectVanish	{Tag = "Lever11Adventurer1"},
			ObjectVanish	{Tag = "Lever11Adventurer2"},
			ObjectVanish	{Tag = "Lever11Adventurer3"},
			ObjectVanish	{Tag = "Lever11Adventurer4"},
			ObjectVanish	{Tag = "Lever11Adventurer5"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever11Hero_Warrior"},
			ObjectVanish	{Tag = "Lever11Hero_Healer"},
			ObjectVanish	{Tag = "Lever11Hero_Mage"},
			ObjectVanish	{Tag = "Lever11Hero_Assassin"},
			ObjectVanish	{Tag = "Lever11Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_Adventurer4Joined"},
			AvatarFlagIsFalse	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarHasLevel {Level = 11},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Adventurer4", Direction = 0, Tag = "Lever11Adventurer4"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever11Adventurer4",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAdventurer4},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer4", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Adventurer4"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_Adventurer4Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_FourthHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever11Lya"},
			ObjectVanish	{Tag = "Lever11Bor"},
			ObjectVanish	{Tag = "Lever11Shae"},
			ObjectVanish	{Tag = "Lever11Mordecay"},
			ObjectVanish	{Tag = "Lever11Jared"},
			ObjectVanish	{Tag = "Lever11Wind"},
			ObjectVanish	{Tag = "Lever11Whisper"},
			ObjectVanish	{Tag = "Lever11Yasha"},
			ObjectVanish	{Tag = "Lever11Caine"},
			ObjectVanish	{Tag = "Lever11Adventurer1"},
			ObjectVanish	{Tag = "Lever11Adventurer2"},
			ObjectVanish	{Tag = "Lever11Adventurer3"},
			ObjectVanish	{Tag = "Lever11Adventurer4"},
			ObjectVanish	{Tag = "Lever11Adventurer5"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever11Hero_Warrior"},
			ObjectVanish	{Tag = "Lever11Hero_Healer"},
			ObjectVanish	{Tag = "Lever11Hero_Mage"},
			ObjectVanish	{Tag = "Lever11Hero_Assassin"},
			ObjectVanish	{Tag = "Lever11Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_Adventurer5Joined"},
			AvatarFlagIsFalse	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarHasLevel {Level = 11},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Adventurer5", Direction = 0, Tag = "Lever11Adventurer5"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever11Adventurer5",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAdventurer5},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer5", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Adventurer5"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_Adventurer5Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_FourthHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever11Lya"},
			ObjectVanish	{Tag = "Lever11Bor"},
			ObjectVanish	{Tag = "Lever11Shae"},
			ObjectVanish	{Tag = "Lever11Mordecay"},
			ObjectVanish	{Tag = "Lever11Jared"},
			ObjectVanish	{Tag = "Lever11Wind"},
			ObjectVanish	{Tag = "Lever11Whisper"},
			ObjectVanish	{Tag = "Lever11Yasha"},
			ObjectVanish	{Tag = "Lever11Caine"},
			ObjectVanish	{Tag = "Lever11Adventurer1"},
			ObjectVanish	{Tag = "Lever11Adventurer2"},
			ObjectVanish	{Tag = "Lever11Adventurer3"},
			ObjectVanish	{Tag = "Lever11Adventurer4"},
			ObjectVanish	{Tag = "Lever11Adventurer5"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever11Hero_Warrior"},
			ObjectVanish	{Tag = "Lever11Hero_Healer"},
			ObjectVanish	{Tag = "Lever11Hero_Mage"},
			ObjectVanish	{Tag = "Lever11Hero_Assassin"},
			ObjectVanish	{Tag = "Lever11Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_WarriorJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarHasLevel {Level = 11},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Warrior", Direction = 0, Tag = "Lever11Hero_Warrior"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever11Hero_Warrior",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopWarrior},
			FigureHeroSpawnToEntity	{Tag = "CoopWarrior", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Warrior"},
			AvatarFlagSetTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_WarriorJoined"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever11Lya"},
			ObjectVanish	{Tag = "Lever11Bor"},
			ObjectVanish	{Tag = "Lever11Shae"},
			ObjectVanish	{Tag = "Lever11Mordecay"},
			ObjectVanish	{Tag = "Lever11Jared"},
			ObjectVanish	{Tag = "Lever11Wind"},
			ObjectVanish	{Tag = "Lever11Whisper"},
			ObjectVanish	{Tag = "Lever11Yasha"},
			ObjectVanish	{Tag = "Lever11Caine"},
			ObjectVanish	{Tag = "Lever11Adventurer1"},
			ObjectVanish	{Tag = "Lever11Adventurer2"},
			ObjectVanish	{Tag = "Lever11Adventurer3"},
			ObjectVanish	{Tag = "Lever11Adventurer4"},
			ObjectVanish	{Tag = "Lever11Adventurer5"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever11Hero_Warrior"},
			ObjectVanish	{Tag = "Lever11Hero_Healer"},
			ObjectVanish	{Tag = "Lever11Hero_Mage"},
			ObjectVanish	{Tag = "Lever11Hero_Assassin"},
			ObjectVanish	{Tag = "Lever11Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_HealerJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarHasLevel {Level = 11},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Healer", Direction = 0, Tag = "Lever11Hero_Healer"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever11Hero_Healer",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopHealer},
			FigureHeroSpawnToEntity	{Tag = "CoopHealer", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Healer"},
			AvatarFlagSetTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_HealerJoined"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever11Lya"},
			ObjectVanish	{Tag = "Lever11Bor"},
			ObjectVanish	{Tag = "Lever11Shae"},
			ObjectVanish	{Tag = "Lever11Mordecay"},
			ObjectVanish	{Tag = "Lever11Jared"},
			ObjectVanish	{Tag = "Lever11Wind"},
			ObjectVanish	{Tag = "Lever11Whisper"},
			ObjectVanish	{Tag = "Lever11Yasha"},
			ObjectVanish	{Tag = "Lever11Caine"},
			ObjectVanish	{Tag = "Lever11Adventurer1"},
			ObjectVanish	{Tag = "Lever11Adventurer2"},
			ObjectVanish	{Tag = "Lever11Adventurer3"},
			ObjectVanish	{Tag = "Lever11Adventurer4"},
			ObjectVanish	{Tag = "Lever11Adventurer5"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever11Hero_Warrior"},
			ObjectVanish	{Tag = "Lever11Hero_Healer"},
			ObjectVanish	{Tag = "Lever11Hero_Mage"},
			ObjectVanish	{Tag = "Lever11Hero_Assassin"},
			ObjectVanish	{Tag = "Lever11Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_MageJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarHasLevel {Level = 11},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Mage", Direction = 0, Tag = "Lever11Hero_Mage"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever11Hero_Mage",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopMage},
			FigureHeroSpawnToEntity	{Tag = "CoopMage", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Mage"},
			AvatarFlagSetTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_MageJoined"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever11Lya"},
			ObjectVanish	{Tag = "Lever11Bor"},
			ObjectVanish	{Tag = "Lever11Shae"},
			ObjectVanish	{Tag = "Lever11Mordecay"},
			ObjectVanish	{Tag = "Lever11Jared"},
			ObjectVanish	{Tag = "Lever11Wind"},
			ObjectVanish	{Tag = "Lever11Whisper"},
			ObjectVanish	{Tag = "Lever11Yasha"},
			ObjectVanish	{Tag = "Lever11Caine"},
			ObjectVanish	{Tag = "Lever11Adventurer1"},
			ObjectVanish	{Tag = "Lever11Adventurer2"},
			ObjectVanish	{Tag = "Lever11Adventurer3"},
			ObjectVanish	{Tag = "Lever11Adventurer4"},
			ObjectVanish	{Tag = "Lever11Adventurer5"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever11Hero_Warrior"},
			ObjectVanish	{Tag = "Lever11Hero_Healer"},
			ObjectVanish	{Tag = "Lever11Hero_Mage"},
			ObjectVanish	{Tag = "Lever11Hero_Assassin"},
			ObjectVanish	{Tag = "Lever11Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_AssassinJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarHasLevel {Level = 11},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Assassin", Direction = 0, Tag = "Lever11Hero_Assassin"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever11Hero_Assassin",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAssassin},
			FigureHeroSpawnToEntity	{Tag = "CoopAssassin", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Assassin"},
			AvatarFlagSetTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_AssassinJoined"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever11Lya"},
			ObjectVanish	{Tag = "Lever11Bor"},
			ObjectVanish	{Tag = "Lever11Shae"},
			ObjectVanish	{Tag = "Lever11Mordecay"},
			ObjectVanish	{Tag = "Lever11Jared"},
			ObjectVanish	{Tag = "Lever11Wind"},
			ObjectVanish	{Tag = "Lever11Whisper"},
			ObjectVanish	{Tag = "Lever11Yasha"},
			ObjectVanish	{Tag = "Lever11Caine"},
			ObjectVanish	{Tag = "Lever11Adventurer1"},
			ObjectVanish	{Tag = "Lever11Adventurer2"},
			ObjectVanish	{Tag = "Lever11Adventurer3"},
			ObjectVanish	{Tag = "Lever11Adventurer4"},
			ObjectVanish	{Tag = "Lever11Adventurer5"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever11Hero_Warrior"},
			ObjectVanish	{Tag = "Lever11Hero_Healer"},
			ObjectVanish	{Tag = "Lever11Hero_Mage"},
			ObjectVanish	{Tag = "Lever11Hero_Assassin"},
			ObjectVanish	{Tag = "Lever11Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_ArcherJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarHasLevel {Level = 11},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Archer", Direction = 0, Tag = "Lever11Hero_Archer"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever11Hero_Archer",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopArcher},
			FigureHeroSpawnToEntity	{Tag = "CoopArcher", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Archer"},
			AvatarFlagSetTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_ArcherJoined"},
			QuestSetSolved	{Quest = "CoopHeroesTalkToFirst"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever11Lya"},
			ObjectVanish	{Tag = "Lever11Bor"},
			ObjectVanish	{Tag = "Lever11Shae"},
			ObjectVanish	{Tag = "Lever11Mordecay"},
			ObjectVanish	{Tag = "Lever11Jared"},
			ObjectVanish	{Tag = "Lever11Wind"},
			ObjectVanish	{Tag = "Lever11Whisper"},
			ObjectVanish	{Tag = "Lever11Yasha"},
			ObjectVanish	{Tag = "Lever11Caine"},
			ObjectVanish	{Tag = "Lever11Adventurer1"},
			ObjectVanish	{Tag = "Lever11Adventurer2"},
			ObjectVanish	{Tag = "Lever11Adventurer3"},
			ObjectVanish	{Tag = "Lever11Adventurer4"},
			ObjectVanish	{Tag = "Lever11Adventurer5"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever11Hero_Warrior"},
			ObjectVanish	{Tag = "Lever11Hero_Healer"},
			ObjectVanish	{Tag = "Lever11Hero_Mage"},
			ObjectVanish	{Tag = "Lever11Hero_Assassin"},
			ObjectVanish	{Tag = "Lever11Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroMeleeJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarHasLevel {Level = 11},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "HeroShaikan_Melee", Direction = 0, Tag = "Lever11ShaikanHeroMelee"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever11ShaikanHeroMelee",
		OnConditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "HeroShaikan_Melee"},
			PlayerHeroAdd	{HeroId = 165},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer1", TargetTag = "pl_HumanAvatar", Direction = 0},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroMeleeJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FourthHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever11Lya"},
			ObjectVanish	{Tag = "Lever11Bor"},
			ObjectVanish	{Tag = "Lever11Shae"},
			ObjectVanish	{Tag = "Lever11Mordecay"},
			ObjectVanish	{Tag = "Lever11Jared"},
			ObjectVanish	{Tag = "Lever11Wind"},
			ObjectVanish	{Tag = "Lever11Whisper"},
			ObjectVanish	{Tag = "Lever11Yasha"},
			ObjectVanish	{Tag = "Lever11Caine"},
			ObjectVanish	{Tag = "Lever11Adventurer1"},
			ObjectVanish	{Tag = "Lever11Adventurer2"},
			ObjectVanish	{Tag = "Lever11Adventurer3"},
			ObjectVanish	{Tag = "Lever11Adventurer4"},
			ObjectVanish	{Tag = "Lever11Adventurer5"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever11Hero_Warrior"},
			ObjectVanish	{Tag = "Lever11Hero_Healer"},
			ObjectVanish	{Tag = "Lever11Hero_Mage"},
			ObjectVanish	{Tag = "Lever11Hero_Assassin"},
			ObjectVanish	{Tag = "Lever11Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroHealer2Joined"},
			AvatarFlagIsFalse	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarHasLevel {Level = 11},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "HeroShaikan_Healer2", Direction = 0, Tag = "Lever11ShaikanHeroHealer2"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever11ShaikanHeroHealer2",
		OnConditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "HeroShaikan_Healer2"},
			PlayerHeroAdd	{HeroId = 166},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer2", TargetTag = "pl_HumanAvatar", Direction = 0},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroHealer2Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_FourthHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever11Lya"},
			ObjectVanish	{Tag = "Lever11Bor"},
			ObjectVanish	{Tag = "Lever11Shae"},
			ObjectVanish	{Tag = "Lever11Mordecay"},
			ObjectVanish	{Tag = "Lever11Jared"},
			ObjectVanish	{Tag = "Lever11Wind"},
			ObjectVanish	{Tag = "Lever11Whisper"},
			ObjectVanish	{Tag = "Lever11Yasha"},
			ObjectVanish	{Tag = "Lever11Caine"},
			ObjectVanish	{Tag = "Lever11Adventurer1"},
			ObjectVanish	{Tag = "Lever11Adventurer2"},
			ObjectVanish	{Tag = "Lever11Adventurer3"},
			ObjectVanish	{Tag = "Lever11Adventurer4"},
			ObjectVanish	{Tag = "Lever11Adventurer5"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever11Hero_Warrior"},
			ObjectVanish	{Tag = "Lever11Hero_Healer"},
			ObjectVanish	{Tag = "Lever11Hero_Mage"},
			ObjectVanish	{Tag = "Lever11Hero_Assassin"},
			ObjectVanish	{Tag = "Lever11Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroMageJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarHasLevel {Level = 11},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "HeroShaikan_Mage", Direction = 0, Tag = "Lever11ShaikanHeroMage"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever11ShaikanHeroMage",
		OnConditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "HeroShaikan_Mage"},
			PlayerHeroAdd	{HeroId = 167},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer3", TargetTag = "pl_HumanAvatar", Direction = 0},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroMageJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FourthHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever11Lya"},
			ObjectVanish	{Tag = "Lever11Bor"},
			ObjectVanish	{Tag = "Lever11Shae"},
			ObjectVanish	{Tag = "Lever11Mordecay"},
			ObjectVanish	{Tag = "Lever11Jared"},
			ObjectVanish	{Tag = "Lever11Wind"},
			ObjectVanish	{Tag = "Lever11Whisper"},
			ObjectVanish	{Tag = "Lever11Yasha"},
			ObjectVanish	{Tag = "Lever11Caine"},
			ObjectVanish	{Tag = "Lever11Adventurer1"},
			ObjectVanish	{Tag = "Lever11Adventurer2"},
			ObjectVanish	{Tag = "Lever11Adventurer3"},
			ObjectVanish	{Tag = "Lever11Adventurer4"},
			ObjectVanish	{Tag = "Lever11Adventurer5"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever11Hero_Warrior"},
			ObjectVanish	{Tag = "Lever11Hero_Healer"},
			ObjectVanish	{Tag = "Lever11Hero_Mage"},
			ObjectVanish	{Tag = "Lever11Hero_Assassin"},
			ObjectVanish	{Tag = "Lever11Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroHealerJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarHasLevel	{Level = 11},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "HeroShaikan_Healer", Direction = 0, Tag = "Lever11ShaikanHeroHealer"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever11ShaikanHeroHealer",
		OnConditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "HeroShaikan_Healer"},
			PlayerHeroAdd	{HeroId = 168},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer4", TargetTag = "pl_HumanAvatar", Direction = 0},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroHealerJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FourthHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever11Lya"},
			ObjectVanish	{Tag = "Lever11Bor"},
			ObjectVanish	{Tag = "Lever11Shae"},
			ObjectVanish	{Tag = "Lever11Mordecay"},
			ObjectVanish	{Tag = "Lever11Jared"},
			ObjectVanish	{Tag = "Lever11Wind"},
			ObjectVanish	{Tag = "Lever11Whisper"},
			ObjectVanish	{Tag = "Lever11Yasha"},
			ObjectVanish	{Tag = "Lever11Caine"},
			ObjectVanish	{Tag = "Lever11Adventurer1"},
			ObjectVanish	{Tag = "Lever11Adventurer2"},
			ObjectVanish	{Tag = "Lever11Adventurer3"},
			ObjectVanish	{Tag = "Lever11Adventurer4"},
			ObjectVanish	{Tag = "Lever11Adventurer5"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever11Hero_Warrior"},
			ObjectVanish	{Tag = "Lever11Hero_Healer"},
			ObjectVanish	{Tag = "Lever11Hero_Mage"},
			ObjectVanish	{Tag = "Lever11Hero_Assassin"},
			ObjectVanish	{Tag = "Lever11Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroWarriorJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FourthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_ThirdHeroJoined"},
			AvatarHasLevel	{Level = 11},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_WarriorShaikan", Direction = 0, Tag = "Lever11ShaikanHeroWarrior"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever11ShaikanHeroWarrior",
		OnConditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "Hero_WarriorShaikan"},
			PlayerHeroAdd	{HeroId = 169},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer5", TargetTag = "pl_HumanAvatar", Direction = 0},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroWarriorJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FourthHeroJoined"},
			QuestSetInactive	{Quest = "CoopHeroesHero2"},
			QuestSetActive	{Quest = "CoopHeroesGainRespect"},
			ObjectVanish	{Tag = "Lever11Lya"},
			ObjectVanish	{Tag = "Lever11Bor"},
			ObjectVanish	{Tag = "Lever11Shae"},
			ObjectVanish	{Tag = "Lever11Mordecay"},
			ObjectVanish	{Tag = "Lever11Jared"},
			ObjectVanish	{Tag = "Lever11Wind"},
			ObjectVanish	{Tag = "Lever11Whisper"},
			ObjectVanish	{Tag = "Lever11Yasha"},
			ObjectVanish	{Tag = "Lever11Caine"},
			ObjectVanish	{Tag = "Lever11Adventurer1"},
			ObjectVanish	{Tag = "Lever11Adventurer2"},
			ObjectVanish	{Tag = "Lever11Adventurer3"},
			ObjectVanish	{Tag = "Lever11Adventurer4"},
			ObjectVanish	{Tag = "Lever11Adventurer5"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever11ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever11Hero_Warrior"},
			ObjectVanish	{Tag = "Lever11Hero_Healer"},
			ObjectVanish	{Tag = "Lever11Hero_Mage"},
			ObjectVanish	{Tag = "Lever11Hero_Assassin"},
			ObjectVanish	{Tag = "Lever11Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_LyaJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FifthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarHasLevel {Level = 13},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 388, Y = 304, Direction = 0, Tag = "Lever13Lya"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever13Lya",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 9},
			FigureHeroSpawnToEntity	{Tag = "HeroLya", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Lya"},
			AvatarFlagSetTrue	{Name = "af_P333_LyaJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FifthHeroJoined"},
			QuestSetSolved	{Quest = "CoopHeroes"},
			QuestSetSolved	{Quest = "CoopHeroesGainRespect"},
			QuestSetSolved	{Quest = "CoopHeroesHero2"},
			ObjectVanish	{Tag = "Lever13Lya"},
			ObjectVanish	{Tag = "Lever13Bor"},
			ObjectVanish	{Tag = "Lever13Shae"},
			ObjectVanish	{Tag = "Lever13Mordecay"},
			ObjectVanish	{Tag = "Lever13Jared"},
			ObjectVanish	{Tag = "Lever13Wind"},
			ObjectVanish	{Tag = "Lever13Whisper"},
			ObjectVanish	{Tag = "Lever13Yasha"},
			ObjectVanish	{Tag = "Lever13Caine"},
			ObjectVanish	{Tag = "Lever13Adventurer1"},
			ObjectVanish	{Tag = "Lever13Adventurer2"},
			ObjectVanish	{Tag = "Lever13Adventurer3"},
			ObjectVanish	{Tag = "Lever13Adventurer4"},
			ObjectVanish	{Tag = "Lever13Adventurer5"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever13Hero_Warrior"},
			ObjectVanish	{Tag = "Lever13Hero_Healer"},
			ObjectVanish	{Tag = "Lever13Hero_Mage"},
			ObjectVanish	{Tag = "Lever13Hero_Assassin"},
			ObjectVanish	{Tag = "Lever13Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_BorJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FifthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarHasLevel {Level = 13},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 385, Y = 302, Direction = 0, Tag = "Lever13Bor"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever13Bor",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 8},
			FigureHeroSpawnToEntity	{Tag = "HeroBor", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Bor"},
			AvatarFlagSetTrue	{Name = "af_P333_BorJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FifthHeroJoined"},
			QuestSetSolved	{Quest = "CoopHeroes"},
			QuestSetSolved	{Quest = "CoopHeroesGainRespect"},
			QuestSetSolved	{Quest = "CoopHeroesHero2"},
			ObjectVanish	{Tag = "Lever13Lya"},
			ObjectVanish	{Tag = "Lever13Bor"},
			ObjectVanish	{Tag = "Lever13Shae"},
			ObjectVanish	{Tag = "Lever13Mordecay"},
			ObjectVanish	{Tag = "Lever13Jared"},
			ObjectVanish	{Tag = "Lever13Wind"},
			ObjectVanish	{Tag = "Lever13Whisper"},
			ObjectVanish	{Tag = "Lever13Yasha"},
			ObjectVanish	{Tag = "Lever13Caine"},
			ObjectVanish	{Tag = "Lever13Adventurer1"},
			ObjectVanish	{Tag = "Lever13Adventurer2"},
			ObjectVanish	{Tag = "Lever13Adventurer3"},
			ObjectVanish	{Tag = "Lever13Adventurer4"},
			ObjectVanish	{Tag = "Lever13Adventurer5"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever13Hero_Warrior"},
			ObjectVanish	{Tag = "Lever13Hero_Healer"},
			ObjectVanish	{Tag = "Lever13Hero_Mage"},
			ObjectVanish	{Tag = "Lever13Hero_Assassin"},
			ObjectVanish	{Tag = "Lever13Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaeJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FifthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarHasLevel {Level = 13},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 382, Y = 299, Direction = 0, Tag = "Lever13Shae"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever13Shae",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 11},
			FigureHeroSpawnToEntity	{Tag = "HeroShae", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Shae"},
			AvatarFlagSetTrue	{Name = "af_P333_ShaeJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FifthHeroJoined"},
			QuestSetSolved	{Quest = "CoopHeroes"},
			QuestSetSolved	{Quest = "CoopHeroesGainRespect"},
			QuestSetSolved	{Quest = "CoopHeroesHero2"},
			ObjectVanish	{Tag = "Lever13Lya"},
			ObjectVanish	{Tag = "Lever13Bor"},
			ObjectVanish	{Tag = "Lever13Shae"},
			ObjectVanish	{Tag = "Lever13Mordecay"},
			ObjectVanish	{Tag = "Lever13Jared"},
			ObjectVanish	{Tag = "Lever13Wind"},
			ObjectVanish	{Tag = "Lever13Whisper"},
			ObjectVanish	{Tag = "Lever13Yasha"},
			ObjectVanish	{Tag = "Lever13Caine"},
			ObjectVanish	{Tag = "Lever13Adventurer1"},
			ObjectVanish	{Tag = "Lever13Adventurer2"},
			ObjectVanish	{Tag = "Lever13Adventurer3"},
			ObjectVanish	{Tag = "Lever13Adventurer4"},
			ObjectVanish	{Tag = "Lever13Adventurer5"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever13Hero_Warrior"},
			ObjectVanish	{Tag = "Lever13Hero_Healer"},
			ObjectVanish	{Tag = "Lever13Hero_Mage"},
			ObjectVanish	{Tag = "Lever13Hero_Assassin"},
			ObjectVanish	{Tag = "Lever13Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_MordecayJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FifthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarHasLevel {Level = 13},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 381, Y = 295, Direction = 0, Tag = "Lever13Mordecay"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever13Mordecay",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 10},
			FigureHeroSpawnToEntity	{Tag = "HeroMordecay", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Mordecay"},
			AvatarFlagSetTrue	{Name = "af_P333_MordecayJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FifthHeroJoined"},
			QuestSetSolved	{Quest = "CoopHeroes"},
			QuestSetSolved	{Quest = "CoopHeroesGainRespect"},
			QuestSetSolved	{Quest = "CoopHeroesHero2"},
			ObjectVanish	{Tag = "Lever13Lya"},
			ObjectVanish	{Tag = "Lever13Bor"},
			ObjectVanish	{Tag = "Lever13Shae"},
			ObjectVanish	{Tag = "Lever13Mordecay"},
			ObjectVanish	{Tag = "Lever13Jared"},
			ObjectVanish	{Tag = "Lever13Wind"},
			ObjectVanish	{Tag = "Lever13Whisper"},
			ObjectVanish	{Tag = "Lever13Yasha"},
			ObjectVanish	{Tag = "Lever13Caine"},
			ObjectVanish	{Tag = "Lever13Adventurer1"},
			ObjectVanish	{Tag = "Lever13Adventurer2"},
			ObjectVanish	{Tag = "Lever13Adventurer3"},
			ObjectVanish	{Tag = "Lever13Adventurer4"},
			ObjectVanish	{Tag = "Lever13Adventurer5"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever13Hero_Warrior"},
			ObjectVanish	{Tag = "Lever13Hero_Healer"},
			ObjectVanish	{Tag = "Lever13Hero_Mage"},
			ObjectVanish	{Tag = "Lever13Hero_Assassin"},
			ObjectVanish	{Tag = "Lever13Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_JaredJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FifthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarHasLevel {Level = 13},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 404, Y = 288, Direction = 0, Tag = "Lever13Jared"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever13Jared",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 20},
			FigureHeroSpawnToEntity	{Tag = "HeroJared", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Jared"},
			AvatarFlagSetTrue	{Name = "af_P333_JaredJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FifthHeroJoined"},
			QuestSetSolved	{Quest = "CoopHeroes"},
			QuestSetSolved	{Quest = "CoopHeroesGainRespect"},
			QuestSetSolved	{Quest = "CoopHeroesHero2"},
			ObjectVanish	{Tag = "Lever13Lya"},
			ObjectVanish	{Tag = "Lever13Bor"},
			ObjectVanish	{Tag = "Lever13Shae"},
			ObjectVanish	{Tag = "Lever13Mordecay"},
			ObjectVanish	{Tag = "Lever13Jared"},
			ObjectVanish	{Tag = "Lever13Wind"},
			ObjectVanish	{Tag = "Lever13Whisper"},
			ObjectVanish	{Tag = "Lever13Yasha"},
			ObjectVanish	{Tag = "Lever13Caine"},
			ObjectVanish	{Tag = "Lever13Adventurer1"},
			ObjectVanish	{Tag = "Lever13Adventurer2"},
			ObjectVanish	{Tag = "Lever13Adventurer3"},
			ObjectVanish	{Tag = "Lever13Adventurer4"},
			ObjectVanish	{Tag = "Lever13Adventurer5"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever13Hero_Warrior"},
			ObjectVanish	{Tag = "Lever13Hero_Healer"},
			ObjectVanish	{Tag = "Lever13Hero_Mage"},
			ObjectVanish	{Tag = "Lever13Hero_Assassin"},
			ObjectVanish	{Tag = "Lever13Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_WindJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FifthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarHasLevel {Level = 13},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 400, Y = 288, Direction = 0, Tag = "Lever13Wind"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever13Wind",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 108},
			FigureHeroSpawnToEntity	{Tag = "HeroWind", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Wind"},
			AvatarFlagSetTrue	{Name = "af_P333_WindJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FifthHeroJoined"},
			QuestSetSolved	{Quest = "CoopHeroes"},
			QuestSetSolved	{Quest = "CoopHeroesGainRespect"},
			QuestSetSolved	{Quest = "CoopHeroesHero2"},
			ObjectVanish	{Tag = "Lever13Lya"},
			ObjectVanish	{Tag = "Lever13Bor"},
			ObjectVanish	{Tag = "Lever13Shae"},
			ObjectVanish	{Tag = "Lever13Mordecay"},
			ObjectVanish	{Tag = "Lever13Jared"},
			ObjectVanish	{Tag = "Lever13Wind"},
			ObjectVanish	{Tag = "Lever13Whisper"},
			ObjectVanish	{Tag = "Lever13Yasha"},
			ObjectVanish	{Tag = "Lever13Caine"},
			ObjectVanish	{Tag = "Lever13Adventurer1"},
			ObjectVanish	{Tag = "Lever13Adventurer2"},
			ObjectVanish	{Tag = "Lever13Adventurer3"},
			ObjectVanish	{Tag = "Lever13Adventurer4"},
			ObjectVanish	{Tag = "Lever13Adventurer5"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever13Hero_Warrior"},
			ObjectVanish	{Tag = "Lever13Hero_Healer"},
			ObjectVanish	{Tag = "Lever13Hero_Mage"},
			ObjectVanish	{Tag = "Lever13Hero_Assassin"},
			ObjectVanish	{Tag = "Lever13Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_WhisperJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FifthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarHasLevel {Level = 13},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 396, Y = 288, Direction = 0, Tag = "Lever13Whisper"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever13Whisper",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 107},
			FigureHeroSpawnToEntity	{Tag = "HeroWhisper", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Whisper"},
			AvatarFlagSetTrue	{Name = "af_P333_WhisperJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FifthHeroJoined"},
			QuestSetSolved	{Quest = "CoopHeroes"},
			QuestSetSolved	{Quest = "CoopHeroesGainRespect"},
			QuestSetSolved	{Quest = "CoopHeroesHero2"},
			ObjectVanish	{Tag = "Lever13Lya"},
			ObjectVanish	{Tag = "Lever13Bor"},
			ObjectVanish	{Tag = "Lever13Shae"},
			ObjectVanish	{Tag = "Lever13Mordecay"},
			ObjectVanish	{Tag = "Lever13Jared"},
			ObjectVanish	{Tag = "Lever13Wind"},
			ObjectVanish	{Tag = "Lever13Whisper"},
			ObjectVanish	{Tag = "Lever13Yasha"},
			ObjectVanish	{Tag = "Lever13Caine"},
			ObjectVanish	{Tag = "Lever13Adventurer1"},
			ObjectVanish	{Tag = "Lever13Adventurer2"},
			ObjectVanish	{Tag = "Lever13Adventurer3"},
			ObjectVanish	{Tag = "Lever13Adventurer4"},
			ObjectVanish	{Tag = "Lever13Adventurer5"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever13Hero_Warrior"},
			ObjectVanish	{Tag = "Lever13Hero_Healer"},
			ObjectVanish	{Tag = "Lever13Hero_Mage"},
			ObjectVanish	{Tag = "Lever13Hero_Assassin"},
			ObjectVanish	{Tag = "Lever13Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_YashaJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FifthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarHasLevel {Level = 13},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 388, Y = 288, Direction = 0, Tag = "Lever13Yasha"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever13Yasha",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 110},
			FigureHeroSpawnToEntity	{Tag = "HeroYasha", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Yasha"},
			AvatarFlagSetTrue	{Name = "af_P333_YashaJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FifthHeroJoined"},
			QuestSetSolved	{Quest = "CoopHeroes"},
			QuestSetSolved	{Quest = "CoopHeroesGainRespect"},
			QuestSetSolved	{Quest = "CoopHeroesHero2"},
			ObjectVanish	{Tag = "Lever13Lya"},
			ObjectVanish	{Tag = "Lever13Bor"},
			ObjectVanish	{Tag = "Lever13Shae"},
			ObjectVanish	{Tag = "Lever13Mordecay"},
			ObjectVanish	{Tag = "Lever13Jared"},
			ObjectVanish	{Tag = "Lever13Wind"},
			ObjectVanish	{Tag = "Lever13Whisper"},
			ObjectVanish	{Tag = "Lever13Yasha"},
			ObjectVanish	{Tag = "Lever13Caine"},
			ObjectVanish	{Tag = "Lever13Adventurer1"},
			ObjectVanish	{Tag = "Lever13Adventurer2"},
			ObjectVanish	{Tag = "Lever13Adventurer3"},
			ObjectVanish	{Tag = "Lever13Adventurer4"},
			ObjectVanish	{Tag = "Lever13Adventurer5"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever13Hero_Warrior"},
			ObjectVanish	{Tag = "Lever13Hero_Healer"},
			ObjectVanish	{Tag = "Lever13Hero_Mage"},
			ObjectVanish	{Tag = "Lever13Hero_Assassin"},
			ObjectVanish	{Tag = "Lever13Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_CaineJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FifthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarHasLevel {Level = 13},
		},
		Actions = 
		{
			ObjectSpawn	{ObjectId = 1677, X = 392, Y = 288, Direction = 0, Tag = "Lever13Caine"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever13Caine",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = 109},
			FigureHeroSpawnToEntity	{Tag = "HeroCaine", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Caine"},
			AvatarFlagSetTrue	{Name = "af_P333_CaineJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FifthHeroJoined"},
			QuestSetSolved	{Quest = "CoopHeroes"},
			QuestSetSolved	{Quest = "CoopHeroesGainRespect"},
			QuestSetSolved	{Quest = "CoopHeroesHero2"},
			ObjectVanish	{Tag = "Lever13Lya"},
			ObjectVanish	{Tag = "Lever13Bor"},
			ObjectVanish	{Tag = "Lever13Shae"},
			ObjectVanish	{Tag = "Lever13Mordecay"},
			ObjectVanish	{Tag = "Lever13Jared"},
			ObjectVanish	{Tag = "Lever13Wind"},
			ObjectVanish	{Tag = "Lever13Whisper"},
			ObjectVanish	{Tag = "Lever13Yasha"},
			ObjectVanish	{Tag = "Lever13Caine"},
			ObjectVanish	{Tag = "Lever13Adventurer1"},
			ObjectVanish	{Tag = "Lever13Adventurer2"},
			ObjectVanish	{Tag = "Lever13Adventurer3"},
			ObjectVanish	{Tag = "Lever13Adventurer4"},
			ObjectVanish	{Tag = "Lever13Adventurer5"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever13Hero_Warrior"},
			ObjectVanish	{Tag = "Lever13Hero_Healer"},
			ObjectVanish	{Tag = "Lever13Hero_Mage"},
			ObjectVanish	{Tag = "Lever13Hero_Assassin"},
			ObjectVanish	{Tag = "Lever13Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_Adventurer1Joined"},
			AvatarFlagIsFalse	{Name = "af_P333_FifthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarHasLevel {Level = 13},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Adventurer1", Direction = 0, Tag = "Lever13Adventurer1"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever13Adventurer1",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAdventurer1},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer1", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Adventurer1"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_Adventurer1Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_FifthHeroJoined"},
			QuestSetSolved	{Quest = "CoopHeroes"},
			QuestSetSolved	{Quest = "CoopHeroesGainRespect"},
			QuestSetSolved	{Quest = "CoopHeroesHero2"},
			ObjectVanish	{Tag = "Lever13Lya"},
			ObjectVanish	{Tag = "Lever13Bor"},
			ObjectVanish	{Tag = "Lever13Shae"},
			ObjectVanish	{Tag = "Lever13Mordecay"},
			ObjectVanish	{Tag = "Lever13Jared"},
			ObjectVanish	{Tag = "Lever13Wind"},
			ObjectVanish	{Tag = "Lever13Whisper"},
			ObjectVanish	{Tag = "Lever13Yasha"},
			ObjectVanish	{Tag = "Lever13Caine"},
			ObjectVanish	{Tag = "Lever13Adventurer1"},
			ObjectVanish	{Tag = "Lever13Adventurer2"},
			ObjectVanish	{Tag = "Lever13Adventurer3"},
			ObjectVanish	{Tag = "Lever13Adventurer4"},
			ObjectVanish	{Tag = "Lever13Adventurer5"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever13Hero_Warrior"},
			ObjectVanish	{Tag = "Lever13Hero_Healer"},
			ObjectVanish	{Tag = "Lever13Hero_Mage"},
			ObjectVanish	{Tag = "Lever13Hero_Assassin"},
			ObjectVanish	{Tag = "Lever13Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_Adventurer2Joined"},
			AvatarFlagIsFalse	{Name = "af_P333_FifthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarHasLevel {Level = 13},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Adventurer2", Direction = 0, Tag = "Lever13Adventurer2"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever13Adventurer2",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAdventurer2},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer2", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Adventurer2"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_Adventurer2Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_FifthHeroJoined"},
			QuestSetSolved	{Quest = "CoopHeroes"},
			QuestSetSolved	{Quest = "CoopHeroesGainRespect"},
			QuestSetSolved	{Quest = "CoopHeroesHero2"},
			ObjectVanish	{Tag = "Lever13Lya"},
			ObjectVanish	{Tag = "Lever13Bor"},
			ObjectVanish	{Tag = "Lever13Shae"},
			ObjectVanish	{Tag = "Lever13Mordecay"},
			ObjectVanish	{Tag = "Lever13Jared"},
			ObjectVanish	{Tag = "Lever13Wind"},
			ObjectVanish	{Tag = "Lever13Whisper"},
			ObjectVanish	{Tag = "Lever13Yasha"},
			ObjectVanish	{Tag = "Lever13Caine"},
			ObjectVanish	{Tag = "Lever13Adventurer1"},
			ObjectVanish	{Tag = "Lever13Adventurer2"},
			ObjectVanish	{Tag = "Lever13Adventurer3"},
			ObjectVanish	{Tag = "Lever13Adventurer4"},
			ObjectVanish	{Tag = "Lever13Adventurer5"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever13Hero_Warrior"},
			ObjectVanish	{Tag = "Lever13Hero_Healer"},
			ObjectVanish	{Tag = "Lever13Hero_Mage"},
			ObjectVanish	{Tag = "Lever13Hero_Assassin"},
			ObjectVanish	{Tag = "Lever13Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_Adventurer3Joined"},
			AvatarFlagIsFalse	{Name = "af_P333_FifthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarHasLevel {Level = 13},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Adventurer3", Direction = 0, Tag = "Lever13Adventurer3"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever13Adventurer3",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAdventurer3},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer3", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Adventurer3"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_Adventurer3Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_FifthHeroJoined"},
			QuestSetSolved	{Quest = "CoopHeroes"},
			QuestSetSolved	{Quest = "CoopHeroesGainRespect"},
			QuestSetSolved	{Quest = "CoopHeroesHero2"},
			ObjectVanish	{Tag = "Lever13Lya"},
			ObjectVanish	{Tag = "Lever13Bor"},
			ObjectVanish	{Tag = "Lever13Shae"},
			ObjectVanish	{Tag = "Lever13Mordecay"},
			ObjectVanish	{Tag = "Lever13Jared"},
			ObjectVanish	{Tag = "Lever13Wind"},
			ObjectVanish	{Tag = "Lever13Whisper"},
			ObjectVanish	{Tag = "Lever13Yasha"},
			ObjectVanish	{Tag = "Lever13Caine"},
			ObjectVanish	{Tag = "Lever13Adventurer1"},
			ObjectVanish	{Tag = "Lever13Adventurer2"},
			ObjectVanish	{Tag = "Lever13Adventurer3"},
			ObjectVanish	{Tag = "Lever13Adventurer4"},
			ObjectVanish	{Tag = "Lever13Adventurer5"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever13Hero_Warrior"},
			ObjectVanish	{Tag = "Lever13Hero_Healer"},
			ObjectVanish	{Tag = "Lever13Hero_Mage"},
			ObjectVanish	{Tag = "Lever13Hero_Assassin"},
			ObjectVanish	{Tag = "Lever13Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_Adventurer4Joined"},
			AvatarFlagIsFalse	{Name = "af_P333_FifthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarHasLevel {Level = 13},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Adventurer4", Direction = 0, Tag = "Lever13Adventurer4"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever13Adventurer4",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAdventurer4},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer4", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Adventurer4"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_Adventurer4Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_FifthHeroJoined"},
			QuestSetSolved	{Quest = "CoopHeroes"},
			QuestSetSolved	{Quest = "CoopHeroesGainRespect"},
			QuestSetSolved	{Quest = "CoopHeroesHero2"},
			ObjectVanish	{Tag = "Lever13Lya"},
			ObjectVanish	{Tag = "Lever13Bor"},
			ObjectVanish	{Tag = "Lever13Shae"},
			ObjectVanish	{Tag = "Lever13Mordecay"},
			ObjectVanish	{Tag = "Lever13Jared"},
			ObjectVanish	{Tag = "Lever13Wind"},
			ObjectVanish	{Tag = "Lever13Whisper"},
			ObjectVanish	{Tag = "Lever13Yasha"},
			ObjectVanish	{Tag = "Lever13Caine"},
			ObjectVanish	{Tag = "Lever13Adventurer1"},
			ObjectVanish	{Tag = "Lever13Adventurer2"},
			ObjectVanish	{Tag = "Lever13Adventurer3"},
			ObjectVanish	{Tag = "Lever13Adventurer4"},
			ObjectVanish	{Tag = "Lever13Adventurer5"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever13Hero_Warrior"},
			ObjectVanish	{Tag = "Lever13Hero_Healer"},
			ObjectVanish	{Tag = "Lever13Hero_Mage"},
			ObjectVanish	{Tag = "Lever13Hero_Assassin"},
			ObjectVanish	{Tag = "Lever13Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_Adventurer5Joined"},
			AvatarFlagIsFalse	{Name = "af_P333_FifthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarHasLevel {Level = 13},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Adventurer5", Direction = 0, Tag = "Lever13Adventurer5"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever13Adventurer5",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAdventurer5},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer5", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Adventurer5"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_Adventurer5Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_FifthHeroJoined"},
			QuestSetSolved	{Quest = "CoopHeroes"},
			QuestSetSolved	{Quest = "CoopHeroesGainRespect"},
			QuestSetSolved	{Quest = "CoopHeroesHero2"},
			ObjectVanish	{Tag = "Lever13Lya"},
			ObjectVanish	{Tag = "Lever13Bor"},
			ObjectVanish	{Tag = "Lever13Shae"},
			ObjectVanish	{Tag = "Lever13Mordecay"},
			ObjectVanish	{Tag = "Lever13Jared"},
			ObjectVanish	{Tag = "Lever13Wind"},
			ObjectVanish	{Tag = "Lever13Whisper"},
			ObjectVanish	{Tag = "Lever13Yasha"},
			ObjectVanish	{Tag = "Lever13Caine"},
			ObjectVanish	{Tag = "Lever13Adventurer1"},
			ObjectVanish	{Tag = "Lever13Adventurer2"},
			ObjectVanish	{Tag = "Lever13Adventurer3"},
			ObjectVanish	{Tag = "Lever13Adventurer4"},
			ObjectVanish	{Tag = "Lever13Adventurer5"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever13Hero_Warrior"},
			ObjectVanish	{Tag = "Lever13Hero_Healer"},
			ObjectVanish	{Tag = "Lever13Hero_Mage"},
			ObjectVanish	{Tag = "Lever13Hero_Assassin"},
			ObjectVanish	{Tag = "Lever13Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_WarriorJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FifthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarHasLevel {Level = 13},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Warrior", Direction = 0, Tag = "Lever13Hero_Warrior"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever13Hero_Warrior",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopWarrior},
			FigureHeroSpawnToEntity	{Tag = "CoopWarrior", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Warrior"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_WarriorJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FifthHeroJoined"},
			QuestSetSolved	{Quest = "CoopHeroes"},
			QuestSetSolved	{Quest = "CoopHeroesGainRespect"},
			QuestSetSolved	{Quest = "CoopHeroesHero2"},
			ObjectVanish	{Tag = "Lever13Lya"},
			ObjectVanish	{Tag = "Lever13Bor"},
			ObjectVanish	{Tag = "Lever13Shae"},
			ObjectVanish	{Tag = "Lever13Mordecay"},
			ObjectVanish	{Tag = "Lever13Jared"},
			ObjectVanish	{Tag = "Lever13Wind"},
			ObjectVanish	{Tag = "Lever13Whisper"},
			ObjectVanish	{Tag = "Lever13Yasha"},
			ObjectVanish	{Tag = "Lever13Caine"},
			ObjectVanish	{Tag = "Lever13Adventurer1"},
			ObjectVanish	{Tag = "Lever13Adventurer2"},
			ObjectVanish	{Tag = "Lever13Adventurer3"},
			ObjectVanish	{Tag = "Lever13Adventurer4"},
			ObjectVanish	{Tag = "Lever13Adventurer5"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever13Hero_Warrior"},
			ObjectVanish	{Tag = "Lever13Hero_Healer"},
			ObjectVanish	{Tag = "Lever13Hero_Mage"},
			ObjectVanish	{Tag = "Lever13Hero_Assassin"},
			ObjectVanish	{Tag = "Lever13Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_HealerJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FifthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarHasLevel {Level = 13},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Healer", Direction = 0, Tag = "Lever13Hero_Healer"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever13Hero_Healer",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopHealer},
			FigureHeroSpawnToEntity	{Tag = "CoopHealer", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Healer"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_HealerJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FifthHeroJoined"},
			QuestSetSolved	{Quest = "CoopHeroes"},
			QuestSetSolved	{Quest = "CoopHeroesGainRespect"},
			QuestSetSolved	{Quest = "CoopHeroesHero2"},
			ObjectVanish	{Tag = "Lever13Lya"},
			ObjectVanish	{Tag = "Lever13Bor"},
			ObjectVanish	{Tag = "Lever13Shae"},
			ObjectVanish	{Tag = "Lever13Mordecay"},
			ObjectVanish	{Tag = "Lever13Jared"},
			ObjectVanish	{Tag = "Lever13Wind"},
			ObjectVanish	{Tag = "Lever13Whisper"},
			ObjectVanish	{Tag = "Lever13Yasha"},
			ObjectVanish	{Tag = "Lever13Caine"},
			ObjectVanish	{Tag = "Lever13Adventurer1"},
			ObjectVanish	{Tag = "Lever13Adventurer2"},
			ObjectVanish	{Tag = "Lever13Adventurer3"},
			ObjectVanish	{Tag = "Lever13Adventurer4"},
			ObjectVanish	{Tag = "Lever13Adventurer5"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever13Hero_Warrior"},
			ObjectVanish	{Tag = "Lever13Hero_Healer"},
			ObjectVanish	{Tag = "Lever13Hero_Mage"},
			ObjectVanish	{Tag = "Lever13Hero_Assassin"},
			ObjectVanish	{Tag = "Lever13Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_MageJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FifthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarHasLevel {Level = 13},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Mage", Direction = 0, Tag = "Lever13Hero_Mage"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever13Hero_Mage",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopMage},
			FigureHeroSpawnToEntity	{Tag = "CoopMage", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Mage"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_MageJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FifthHeroJoined"},
			QuestSetSolved	{Quest = "CoopHeroes"},
			QuestSetSolved	{Quest = "CoopHeroesGainRespect"},
			QuestSetSolved	{Quest = "CoopHeroesHero2"},
			ObjectVanish	{Tag = "Lever13Lya"},
			ObjectVanish	{Tag = "Lever13Bor"},
			ObjectVanish	{Tag = "Lever13Shae"},
			ObjectVanish	{Tag = "Lever13Mordecay"},
			ObjectVanish	{Tag = "Lever13Jared"},
			ObjectVanish	{Tag = "Lever13Wind"},
			ObjectVanish	{Tag = "Lever13Whisper"},
			ObjectVanish	{Tag = "Lever13Yasha"},
			ObjectVanish	{Tag = "Lever13Caine"},
			ObjectVanish	{Tag = "Lever13Adventurer1"},
			ObjectVanish	{Tag = "Lever13Adventurer2"},
			ObjectVanish	{Tag = "Lever13Adventurer3"},
			ObjectVanish	{Tag = "Lever13Adventurer4"},
			ObjectVanish	{Tag = "Lever13Adventurer5"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever13Hero_Warrior"},
			ObjectVanish	{Tag = "Lever13Hero_Healer"},
			ObjectVanish	{Tag = "Lever13Hero_Mage"},
			ObjectVanish	{Tag = "Lever13Hero_Assassin"},
			ObjectVanish	{Tag = "Lever13Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_AssassinJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FifthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarHasLevel {Level = 13},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Assassin", Direction = 0, Tag = "Lever13Hero_Assassin"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever13Hero_Assassin",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopAssassin},
			FigureHeroSpawnToEntity	{Tag = "CoopAssassin", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Assassin"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_AssassinJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FifthHeroJoined"},
			QuestSetSolved	{Quest = "CoopHeroes"},
			QuestSetSolved	{Quest = "CoopHeroesGainRespect"},
			QuestSetSolved	{Quest = "CoopHeroesHero2"},
			ObjectVanish	{Tag = "Lever13Lya"},
			ObjectVanish	{Tag = "Lever13Bor"},
			ObjectVanish	{Tag = "Lever13Shae"},
			ObjectVanish	{Tag = "Lever13Mordecay"},
			ObjectVanish	{Tag = "Lever13Jared"},
			ObjectVanish	{Tag = "Lever13Wind"},
			ObjectVanish	{Tag = "Lever13Whisper"},
			ObjectVanish	{Tag = "Lever13Yasha"},
			ObjectVanish	{Tag = "Lever13Caine"},
			ObjectVanish	{Tag = "Lever13Adventurer1"},
			ObjectVanish	{Tag = "Lever13Adventurer2"},
			ObjectVanish	{Tag = "Lever13Adventurer3"},
			ObjectVanish	{Tag = "Lever13Adventurer4"},
			ObjectVanish	{Tag = "Lever13Adventurer5"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever13Hero_Warrior"},
			ObjectVanish	{Tag = "Lever13Hero_Healer"},
			ObjectVanish	{Tag = "Lever13Hero_Mage"},
			ObjectVanish	{Tag = "Lever13Hero_Assassin"},
			ObjectVanish	{Tag = "Lever13Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_Hero_ArcherJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FifthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarHasLevel {Level = 13},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_Archer", Direction = 0, Tag = "Lever13Hero_Archer"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever13Hero_Archer",
		OnConditions = 
		{
		},
		Actions = 
		{
			PlayerHeroAdd {HeroId = Hero.CoopArcher},
			FigureHeroSpawnToEntity	{Tag = "CoopArcher", TargetTag = "pl_HumanAvatar", Direction = 0},
			FigureVanish	{Tag = "Hero_Archer"},
			AvatarFlagSetTrue	{Name = "af_P333_Hero_ArcherJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FifthHeroJoined"},
			QuestSetSolved	{Quest = "CoopHeroes"},
			QuestSetSolved	{Quest = "CoopHeroesGainRespect"},
			QuestSetSolved	{Quest = "CoopHeroesHero2"},
			ObjectVanish	{Tag = "Lever13Lya"},
			ObjectVanish	{Tag = "Lever13Bor"},
			ObjectVanish	{Tag = "Lever13Shae"},
			ObjectVanish	{Tag = "Lever13Mordecay"},
			ObjectVanish	{Tag = "Lever13Jared"},
			ObjectVanish	{Tag = "Lever13Wind"},
			ObjectVanish	{Tag = "Lever13Whisper"},
			ObjectVanish	{Tag = "Lever13Yasha"},
			ObjectVanish	{Tag = "Lever13Caine"},
			ObjectVanish	{Tag = "Lever13Adventurer1"},
			ObjectVanish	{Tag = "Lever13Adventurer2"},
			ObjectVanish	{Tag = "Lever13Adventurer3"},
			ObjectVanish	{Tag = "Lever13Adventurer4"},
			ObjectVanish	{Tag = "Lever13Adventurer5"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever13Hero_Warrior"},
			ObjectVanish	{Tag = "Lever13Hero_Healer"},
			ObjectVanish	{Tag = "Lever13Hero_Mage"},
			ObjectVanish	{Tag = "Lever13Hero_Assassin"},
			ObjectVanish	{Tag = "Lever13Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroMeleeJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FifthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarHasLevel {Level = 13},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "HeroShaikan_Melee", Direction = 0, Tag = "Lever13ShaikanHeroMelee"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever13ShaikanHeroMelee",
		OnConditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "HeroShaikan_Melee"},
			PlayerHeroAdd	{HeroId = 165},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer1", TargetTag = "pl_HumanAvatar", Direction = 0},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroMeleeJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FifthHeroJoined"},
			QuestSetSolved	{Quest = "CoopHeroes"},
			QuestSetSolved	{Quest = "CoopHeroesGainRespect"},
			QuestSetSolved	{Quest = "CoopHeroesHero2"},
			ObjectVanish	{Tag = "Lever13Lya"},
			ObjectVanish	{Tag = "Lever13Bor"},
			ObjectVanish	{Tag = "Lever13Shae"},
			ObjectVanish	{Tag = "Lever13Mordecay"},
			ObjectVanish	{Tag = "Lever13Jared"},
			ObjectVanish	{Tag = "Lever13Wind"},
			ObjectVanish	{Tag = "Lever13Whisper"},
			ObjectVanish	{Tag = "Lever13Yasha"},
			ObjectVanish	{Tag = "Lever13Caine"},
			ObjectVanish	{Tag = "Lever13Adventurer1"},
			ObjectVanish	{Tag = "Lever13Adventurer2"},
			ObjectVanish	{Tag = "Lever13Adventurer3"},
			ObjectVanish	{Tag = "Lever13Adventurer4"},
			ObjectVanish	{Tag = "Lever13Adventurer5"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever13Hero_Warrior"},
			ObjectVanish	{Tag = "Lever13Hero_Healer"},
			ObjectVanish	{Tag = "Lever13Hero_Mage"},
			ObjectVanish	{Tag = "Lever13Hero_Assassin"},
			ObjectVanish	{Tag = "Lever13Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroHealer2Joined"},
			AvatarFlagIsFalse	{Name = "af_P333_FifthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarHasLevel {Level = 13},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "HeroShaikan_Healer2", Direction = 0, Tag = "Lever13ShaikanHeroHealer2"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever13ShaikanHeroHealer2",
		OnConditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "HeroShaikan_Healer2"},
			PlayerHeroAdd	{HeroId = 166},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer2", TargetTag = "pl_HumanAvatar", Direction = 0},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroHealer2Joined"},
			AvatarFlagSetTrue	{Name = "af_P333_FifthHeroJoined"},
			QuestSetSolved	{Quest = "CoopHeroes"},
			QuestSetSolved	{Quest = "CoopHeroesGainRespect"},
			QuestSetSolved	{Quest = "CoopHeroesHero2"},
			ObjectVanish	{Tag = "Lever13Lya"},
			ObjectVanish	{Tag = "Lever13Bor"},
			ObjectVanish	{Tag = "Lever13Shae"},
			ObjectVanish	{Tag = "Lever13Mordecay"},
			ObjectVanish	{Tag = "Lever13Jared"},
			ObjectVanish	{Tag = "Lever13Wind"},
			ObjectVanish	{Tag = "Lever13Whisper"},
			ObjectVanish	{Tag = "Lever13Yasha"},
			ObjectVanish	{Tag = "Lever13Caine"},
			ObjectVanish	{Tag = "Lever13Adventurer1"},
			ObjectVanish	{Tag = "Lever13Adventurer2"},
			ObjectVanish	{Tag = "Lever13Adventurer3"},
			ObjectVanish	{Tag = "Lever13Adventurer4"},
			ObjectVanish	{Tag = "Lever13Adventurer5"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever13Hero_Warrior"},
			ObjectVanish	{Tag = "Lever13Hero_Healer"},
			ObjectVanish	{Tag = "Lever13Hero_Mage"},
			ObjectVanish	{Tag = "Lever13Hero_Assassin"},
			ObjectVanish	{Tag = "Lever13Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroMageJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FifthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarHasLevel {Level = 13},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "HeroShaikan_Mage", Direction = 0, Tag = "Lever13ShaikanHeroMage"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever13ShaikanHeroMage",
		OnConditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "HeroShaikan_Mage"},
			PlayerHeroAdd	{HeroId = 167},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer3", TargetTag = "pl_HumanAvatar", Direction = 0},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroMageJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FifthHeroJoined"},
			QuestSetSolved	{Quest = "CoopHeroes"},
			QuestSetSolved	{Quest = "CoopHeroesGainRespect"},
			QuestSetSolved	{Quest = "CoopHeroesHero2"},
			ObjectVanish	{Tag = "Lever13Lya"},
			ObjectVanish	{Tag = "Lever13Bor"},
			ObjectVanish	{Tag = "Lever13Shae"},
			ObjectVanish	{Tag = "Lever13Mordecay"},
			ObjectVanish	{Tag = "Lever13Jared"},
			ObjectVanish	{Tag = "Lever13Wind"},
			ObjectVanish	{Tag = "Lever13Whisper"},
			ObjectVanish	{Tag = "Lever13Yasha"},
			ObjectVanish	{Tag = "Lever13Caine"},
			ObjectVanish	{Tag = "Lever13Adventurer1"},
			ObjectVanish	{Tag = "Lever13Adventurer2"},
			ObjectVanish	{Tag = "Lever13Adventurer3"},
			ObjectVanish	{Tag = "Lever13Adventurer4"},
			ObjectVanish	{Tag = "Lever13Adventurer5"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever13Hero_Warrior"},
			ObjectVanish	{Tag = "Lever13Hero_Healer"},
			ObjectVanish	{Tag = "Lever13Hero_Mage"},
			ObjectVanish	{Tag = "Lever13Hero_Assassin"},
			ObjectVanish	{Tag = "Lever13Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroHealerJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FifthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarHasLevel {Level = 13},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "HeroShaikan_Healer", Direction = 0, Tag = "Lever13ShaikanHeroHealer"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever13ShaikanHeroHealer",
		OnConditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "HeroShaikan_Healer"},
			PlayerHeroAdd	{HeroId = 168},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer4", TargetTag = "pl_HumanAvatar", Direction = 0},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroHealerJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FifthHeroJoined"},
			QuestSetSolved	{Quest = "CoopHeroes"},
			QuestSetSolved	{Quest = "CoopHeroesGainRespect"},
			QuestSetSolved	{Quest = "CoopHeroesHero2"},
			ObjectVanish	{Tag = "Lever13Lya"},
			ObjectVanish	{Tag = "Lever13Bor"},
			ObjectVanish	{Tag = "Lever13Shae"},
			ObjectVanish	{Tag = "Lever13Mordecay"},
			ObjectVanish	{Tag = "Lever13Jared"},
			ObjectVanish	{Tag = "Lever13Wind"},
			ObjectVanish	{Tag = "Lever13Whisper"},
			ObjectVanish	{Tag = "Lever13Yasha"},
			ObjectVanish	{Tag = "Lever13Caine"},
			ObjectVanish	{Tag = "Lever13Adventurer1"},
			ObjectVanish	{Tag = "Lever13Adventurer2"},
			ObjectVanish	{Tag = "Lever13Adventurer3"},
			ObjectVanish	{Tag = "Lever13Adventurer4"},
			ObjectVanish	{Tag = "Lever13Adventurer5"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever13Hero_Warrior"},
			ObjectVanish	{Tag = "Lever13Hero_Healer"},
			ObjectVanish	{Tag = "Lever13Hero_Mage"},
			ObjectVanish	{Tag = "Lever13Hero_Assassin"},
			ObjectVanish	{Tag = "Lever13Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			AvatarFlagIsFalse	{Name = "af_P333_ShaikanHeroWarriorJoined"},
			AvatarFlagIsFalse	{Name = "af_P333_FifthHeroJoined"},
			AvatarFlagIsTrue	{Name = "af_P333_FourthHeroJoined"},
			AvatarHasLevel {Level = 13},
		},
		Actions = 
		{
			ObjectSpawnToEntity	{ObjectId = 1677, TargetTag = "Hero_WarriorShaikan", Direction = 0, Tag = "Lever13ShaikanHeroWarrior"},
		},
	};
	OnLeverEvent
	{
		Delay = 5,
		Lever = "Lever13ShaikanHeroWarrior",
		OnConditions = 
		{
		},
		Actions = 
		{
			FigureVanish	{Tag = "Hero_WarriorShaikan"},
			PlayerHeroAdd	{HeroId = 169},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer5", TargetTag = "pl_HumanAvatar", Direction = 0},
			AvatarFlagSetTrue	{Name = "af_P333_ShaikanHeroWarriorJoined"},
			AvatarFlagSetTrue	{Name = "af_P333_FifthHeroJoined"},
			QuestSetSolved	{Quest = "CoopHeroes"},
			QuestSetSolved	{Quest = "CoopHeroesGainRespect"},
			QuestSetSolved	{Quest = "CoopHeroesHero2"},
			ObjectVanish	{Tag = "Lever13Lya"},
			ObjectVanish	{Tag = "Lever13Bor"},
			ObjectVanish	{Tag = "Lever13Shae"},
			ObjectVanish	{Tag = "Lever13Mordecay"},
			ObjectVanish	{Tag = "Lever13Jared"},
			ObjectVanish	{Tag = "Lever13Wind"},
			ObjectVanish	{Tag = "Lever13Whisper"},
			ObjectVanish	{Tag = "Lever13Yasha"},
			ObjectVanish	{Tag = "Lever13Caine"},
			ObjectVanish	{Tag = "Lever13Adventurer1"},
			ObjectVanish	{Tag = "Lever13Adventurer2"},
			ObjectVanish	{Tag = "Lever13Adventurer3"},
			ObjectVanish	{Tag = "Lever13Adventurer4"},
			ObjectVanish	{Tag = "Lever13Adventurer5"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMelee"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer2"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroMage"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroHealer"},
			ObjectVanish	{Tag = "Lever13ShaikanHeroWarrior"},
			ObjectVanish	{Tag = "Lever13Hero_Warrior"},
			ObjectVanish	{Tag = "Lever13Hero_Healer"},
			ObjectVanish	{Tag = "Lever13Hero_Mage"},
			ObjectVanish	{Tag = "Lever13Hero_Assassin"},
			ObjectVanish	{Tag = "Lever13Hero_Archer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AvatarFlagIsTrue	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
				AvatarFlagIsTrue	{Name = "af_P333_PlayerIsRecruitingHeroes"},
				AvatarFlagIsTrue	{Name = "af_P333_AdventerurHeroGroupRecriuted"},
				AvatarFlagIsTrue	{Name = "af_P333_WarriorHeroGroupRecriuted"},
			},
		},
		Actions =
		{
			DialogSetDisabled	{Tag = "Hero_WarriorShaikan"},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P333_GameHeroesRecruiting"},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "Hero_Adventurer1"},
			DialogSetDisabled	{Tag = "Hero_Adventurer2"},
			DialogSetDisabled	{Tag = "Hero_Adventurer3"},
			DialogSetDisabled	{Tag = "Hero_Adventurer4"},
			DialogSetDisabled	{Tag = "Hero_Adventurer5"},
			
			DialogSetDisabled	{Tag = "Hero_Warrior"},
			DialogSetDisabled	{Tag = "Hero_Healer"},
			DialogSetDisabled	{Tag = "Hero_Mage"},
			DialogSetDisabled	{Tag = "Hero_Assassin"},
			DialogSetDisabled	{Tag = "Hero_Archer"},

			DialogSetDisabled {Tag = "Hero_WarriorShaikan"},
		},
	};
	OnEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P333_PlayerIsRecruitingAdventurers"},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "Hero_Adventurer1"},
			DialogSetDisabled	{Tag = "Hero_Adventurer2"},
			DialogSetDisabled	{Tag = "Hero_Adventurer3"},
			DialogSetDisabled	{Tag = "Hero_Adventurer4"},
			DialogSetDisabled	{Tag = "Hero_Adventurer5"},
			
			DialogSetDisabled	{Tag = "Hero_Warrior"},
			DialogSetDisabled	{Tag = "Hero_Healer"},
			DialogSetDisabled	{Tag = "Hero_Mage"},
			DialogSetDisabled	{Tag = "Hero_Assassin"},
			DialogSetDisabled	{Tag = "Hero_Archer"},

			DialogSetDisabled {Tag = "Hero_WarriorShaikan"},
		},
		GotoState = "Adventurers",
	};
	OnEvent
	{
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P333_PlayerIsRecruitingHeroes"},
		},
		Actions = 
		{
			DialogSetDisabled	{Tag = "Hero_Adventurer1"},
			DialogSetDisabled	{Tag = "Hero_Adventurer2"},
			DialogSetDisabled	{Tag = "Hero_Adventurer3"},
			DialogSetDisabled	{Tag = "Hero_Adventurer4"},
			DialogSetDisabled	{Tag = "Hero_Adventurer5"},
			
			DialogSetDisabled	{Tag = "Hero_Warrior"},
			DialogSetDisabled	{Tag = "Hero_Healer"},
			DialogSetDisabled	{Tag = "Hero_Mage"},
			DialogSetDisabled	{Tag = "Hero_Assassin"},
			DialogSetDisabled	{Tag = "Hero_Archer"},

			DialogSetDisabled {Tag = "Hero_WarriorShaikan"},
		},
		GotoState = "Heroes",
	};
}

State
{
	StateName = "Adventurers",

	OnOneTimeEvent
	{
		EventName = "EnableDialogAdventurerLevel5",
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			FigureIsAlive	{Tag = "Hero_Adventurer2"},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Hero_Adventurer2"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "EnableDialogAdventurerLevel8",
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			FigureIsAlive	{Tag = "Hero_Adventurer3"},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Hero_Adventurer3"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "EnableDialogAdventurerLevel11",
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			FigureIsAlive	{Tag = "Hero_Adventurer4"},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Hero_Adventurer4"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "EnableDialogAdventurerLevel13",
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			FigureIsAlive	{Tag = "Hero_Adventurer5"},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Hero_Adventurer5"},
			MapFlagSetTrue	{Name = "mf_P333_DialogAdventurerLevel13"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "RecruitAdventurerLevel1",
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P333_Level1TransferToPlayer"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			AvatarFlagSetFalse	{Name = "af_P333_Level1TransferToPlayer"},
			AvatarFlagSetTrue	{Name = "af_P333_Level1Recruited"},
			AvatarFlagSetTrue	{Name = "af_P333_Level1Adventurer"},
			FigureVanish	{Tag = "Hero_Adventurer1"},
			PlayerHeroAdd	{HeroId = Hero.CoopAdventurer1},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer1", TargetTag = "pl_HumanAvatar", Direction = 0},
		},
	};
	OnOneTimeEvent
	{
		EventName = "RecruitAdventurerLevel5",
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P333_Level5TransferToPlayer"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			AvatarFlagSetFalse	{Name = "af_P333_Level5TransferToPlayer"},
			AvatarFlagSetTrue	{Name = "af_P333_Level5Recruited"},
			AvatarFlagSetTrue	{Name = "af_P333_Level5Adventurer"},
			FigureVanish	{Tag = "Hero_Adventurer2"},
			PlayerHeroAdd	{HeroId = Hero.CoopAdventurer2},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer2", TargetTag = "pl_HumanAvatar", Direction = 0},
		},
	};
	OnOneTimeEvent
	{
		EventName = "RecruitAdventurerLevel8",
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P333_Level8TransferToPlayer"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			AvatarFlagSetFalse	{Name = "af_P333_Level8TransferToPlayer"},
			AvatarFlagSetTrue	{Name = "af_P333_Level8Recruited"},
			AvatarFlagSetTrue	{Name = "af_P333_Level8Adventurer"},
			FigureVanish	{Tag = "Hero_Adventurer3"},
			PlayerHeroAdd	{HeroId = Hero.CoopAdventurer3},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer3", TargetTag = "pl_HumanAvatar", Direction = 0},
		},
	};
	OnOneTimeEvent
	{
		EventName = "RecruitAdventurerLevel11",
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P333_Level11TransferToPlayer"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			AvatarFlagSetFalse	{Name = "af_P333_Level11TransferToPlayer"},
			AvatarFlagSetTrue	{Name = "af_P333_Level11Recruited"},
			AvatarFlagSetTrue	{Name = "af_P333_Level11Adventurer"},
			FigureVanish	{Tag = "Hero_Adventurer4"},
			PlayerHeroAdd	{HeroId = Hero.CoopAdventurer4},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer4", TargetTag = "pl_HumanAvatar", Direction = 0},
		},
	};
	OnOneTimeEvent
	{
		EventName = "RecruitAdventurerLevel13",
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P333_Level13TransferToPlayer"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			AvatarFlagSetFalse	{Name = "af_P333_Level13TransferToPlayer"},
			AvatarFlagSetTrue	{Name = "af_P333_Level13Recruited"},
			AvatarFlagSetTrue	{Name = "af_P333_Level13Adventurer"},
			FigureVanish	{Tag = "Hero_Adventurer5"},
			PlayerHeroAdd	{HeroId = Hero.CoopAdventurer5},
			FigureHeroSpawnToEntity	{Tag = "CoopAdventurer5", TargetTag = "pl_HumanAvatar", Direction = 0},
		},
	};
	OnOneTimeEvent
	{
		EventName = "RecruitedAll",
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P333_Level13Recruited"},
		},
		Actions = 
		{
		},
		GotoState = "Ende",
	};
};

State
{
	StateName = "Heroes",

	OnOneTimeEvent
	{
		EventName = "EnableDialogHeroLevel5",
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			FigureIsAlive	{Tag = "Hero_Healer"},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Hero_Healer"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "EnableDialogHeroLevel8",
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			FigureIsAlive	{Tag = "Hero_Mage"},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Hero_Mage"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "EnableDialogHeroLevel11",
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			FigureIsAlive	{Tag = "Hero_Assassin"},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Hero_Assassin"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "EnableDialogHeroLevel13",
		Conditions = 
		{
			QuestIsActive	{Quest = "CoopHeroesHero2"},
			FigureIsAlive	{Tag = "Hero_Archer"},
		},
		Actions = 
		{
			DialogSetEnabled	{Tag = "Hero_Archer"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "RecruitHeroLevel1",
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P333_Level1TransferToPlayer"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			AvatarFlagSetFalse	{Name = "af_P333_Level1TransferToPlayer"},
			AvatarFlagSetTrue	{Name = "af_P333_Level1Recruited"},
			AvatarFlagSetTrue	{Name = "af_P333_Level1Warrior"},
			FigureVanish	{Tag = "Hero_Warrior"},
			PlayerHeroAdd	{HeroId = Hero.CoopWarrior},
			FigureHeroSpawnToEntity	{Tag = "CoopWarrior", TargetTag = "pl_HumanAvatar", Direction = 0},
		},
	};
	OnOneTimeEvent
	{
		EventName = "RecruitHeroLevel5",
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P333_Level5TransferToPlayer"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			AvatarFlagSetFalse	{Name = "af_P333_Level5TransferToPlayer"},
			AvatarFlagSetTrue	{Name = "af_P333_Level5Recruited"},
			AvatarFlagSetTrue	{Name = "af_P333_Level5Healer"},
			FigureVanish	{Tag = "Hero_Healer"},
			PlayerHeroAdd	{HeroId = Hero.CoopHealer},
			FigureHeroSpawnToEntity	{Tag = "CoopHealer", TargetTag = "pl_HumanAvatar", Direction = 0},
		},
	};
	OnOneTimeEvent
	{
		EventName = "RecruitHeroLevel8",
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P333_Level8TransferToPlayer"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			AvatarFlagSetFalse	{Name = "af_P333_Level8TransferToPlayer"},
			AvatarFlagSetTrue	{Name = "af_P333_Level8Recruited"},
			AvatarFlagSetTrue	{Name = "af_P333_Level8Mage"},
			FigureVanish	{Tag = "Hero_Mage"},
			PlayerHeroAdd	{HeroId = Hero.CoopMage},
			FigureHeroSpawnToEntity	{Tag = "CoopMage", TargetTag = "pl_HumanAvatar", Direction = 0},
		},
	};
	OnOneTimeEvent
	{
		EventName = "RecruitHeroLevel11",
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P333_Level11TransferToPlayer"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			AvatarFlagSetFalse	{Name = "af_P333_Level11TransferToPlayer"},
			AvatarFlagSetTrue	{Name = "af_P333_Level11Recruited"},
			AvatarFlagSetTrue	{Name = "af_P333_Level11Assassin"},
			FigureVanish	{Tag = "Hero_Assassin"},
			PlayerHeroAdd	{HeroId = Hero.CoopAssassin},
			FigureHeroSpawnToEntity	{Tag = "CoopAssassin", TargetTag = "pl_HumanAvatar", Direction = 0},
		},
	};
	OnOneTimeEvent
	{
		EventName = "RecruitHeroLevel13",
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P333_PlayerIsRecruitingHeroes"},
			AvatarFlagIsTrue	{Name = "af_P333_Level13TransferToPlayer"},
			AvatarIsNotTalking	{},
			GameInterfaceIsVisible	{},
		},
		Actions = 
		{
			AvatarFlagSetFalse	{Name = "af_P333_Level13TransferToPlayer"},
			AvatarFlagSetTrue	{Name = "af_P333_Level13Recruited"},
			AvatarFlagSetTrue	{Name = "af_P333_Level13Archer"},
			FigureVanish	{Tag = "Hero_Archer"},
			PlayerHeroAdd	{HeroId = Hero.CoopArcher},
			FigureHeroSpawnToEntity	{Tag = "CoopArcher", TargetTag = "pl_HumanAvatar", Direction = 0},
		},
	};
	OnOneTimeEvent
	{
		EventName = "RecruitedAll",
		Conditions = 
		{
			AvatarFlagIsTrue	{Name = "af_P333_Level13Recruited"},
		},
		Actions = 
		{
		},
		GotoState = "Ende",
	};
};

State
{
	StateName = "Ende",
};