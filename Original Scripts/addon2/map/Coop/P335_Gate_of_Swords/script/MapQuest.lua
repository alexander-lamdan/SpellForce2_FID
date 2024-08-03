State
{
	StateName = "INIT",
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotSolved 	{Player = "pl_Human1", Quest = "CoopMapQuestGateOfSwords"},
			QuestIsNotSolved 	{Player = "pl_Human2", Quest = "CoopMapQuestGateOfSwords"},
			QuestIsNotSolved 	{Player = "pl_Human3", Quest = "CoopMapQuestGateOfSwords"},	
		},
		Actions =
		{
			FigureNpcSpawnToEntity	{Tag = "Morca", Level = 3, UnitId = 661, TargetTag = "MustSurvive1", Team = "tm_Human"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				FigureIsInEntityRange	{Tag = "pl_Human1Avatar", TargetTag = "Morca", Range = 10},
				FigureIsInEntityRange	{Tag = "pl_Human2Avatar", TargetTag = "Morca", Range = 10},
				FigureIsInEntityRange	{Tag = "pl_Human3Avatar", TargetTag = "Morca", Range = 10},
			},
		},
		Actions =
		{
			FigureOutcry	{Tag = "Morca", TextTag = "Bandits1"},
			FigureOutcry	{Tag = "Morca", TextTag = "Bandits2"},
			FigureOutcry	{Tag = "Morca", TextTag = "Bandits3"},
			MapFlagSetTrue	{Name = "mf_MorcaShaman"},
			QuestSetActive 	{Player = "pl_Human1", Quest = "CoopMapQuestGateOfSwords"},
			QuestSetActive 	{Player = "pl_Human2", Quest = "CoopMapQuestGateOfSwords"},
			QuestSetActive 	{Player = "pl_Human3", Quest = "CoopMapQuestGateOfSwords"},
		},
	},
	OnOneTimeEvent
	{

		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_MorcaShaman"},
			CoopPlayerIsPlaying	{Player = "pl_Human1"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "Bandit01", Level = 8, UnitId = 914, X = 154, Y = 553, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Bandit0A", Level = 5, UnitId = 964, X = 154, Y = 553, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Bandit0B", Level = 5, UnitId = 965, X = 154, Y = 553, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Bandit0C", Level = 5, UnitId = 965, X = 154, Y = 553, Team = "tm_Enemy"},

			FigureNpcSpawnToEntity	{Tag = "Bandit02", Level = 5, UnitId = 964, TargetTag = "StoneGod", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "Bandit03", Level = 5, UnitId = 965, TargetTag = "StoneGod", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "Bandit04", Level = 5, UnitId = 965, TargetTag = "StoneGod", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "Bandit05", Level = 5, UnitId = 914, TargetTag = "StoneGod", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "Bandit06", Level = 5, UnitId = 914, TargetTag = "StoneGod", Team = "tm_Enemy"},
			MapFlagSetTrue	{Name = "mf_BanditsRevealed"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_MorcaShaman"},
			CoopPlayerIsNotPlaying 	{Player = "pl_Human1"},
			CoopPlayerIsPlaying 	{Player = "pl_Human2"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "Bandit01", Level = 8, UnitId = 914, X = 154, Y = 553, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Bandit0A", Level = 5, UnitId = 964, X = 154, Y = 553, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Bandit0B", Level = 5, UnitId = 965, X = 154, Y = 553, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Bandit0C", Level = 5, UnitId = 965, X = 154, Y = 553, Team = "tm_Enemy"},

			FigureNpcSpawnToEntity	{Tag = "Bandit02", Level = 5, UnitId = 964, TargetTag = "StoneGod", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "Bandit03", Level = 5, UnitId = 965, TargetTag = "StoneGod", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "Bandit04", Level = 5, UnitId = 965, TargetTag = "StoneGod", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "Bandit05", Level = 5, UnitId = 914, TargetTag = "StoneGod", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "Bandit06", Level = 5, UnitId = 914, TargetTag = "StoneGod", Team = "tm_Enemy"},
			MapFlagSetTrue {Name = "mf_BanditsRevealed"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_MorcaShaman"},
			CoopPlayerIsNotPlaying 	{Player = "pl_Human1"},
			CoopPlayerIsNotPlaying 	{Player = "pl_Human2"},
			CoopPlayerIsPlaying 	{Player = "pl_Human3"},
		},
		Actions =
		{
			FigureNpcSpawn	{Tag = "Bandit01", Level = 8, UnitId = 914, X = 154, Y = 553, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Bandit0A", Level = 5, UnitId = 964, X = 154, Y = 553, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Bandit0B", Level = 5, UnitId = 965, X = 154, Y = 553, Team = "tm_Enemy"},
			FigureNpcSpawn	{Tag = "Bandit0C", Level = 5, UnitId = 965, X = 154, Y = 553, Team = "tm_Enemy"},

			FigureNpcSpawnToEntity	{Tag = "Bandit02", Level = 5, UnitId = 964, TargetTag = "StoneGod", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "Bandit03", Level = 5, UnitId = 965, TargetTag = "StoneGod", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "Bandit04", Level = 5, UnitId = 965, TargetTag = "StoneGod", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "Bandit05", Level = 5, UnitId = 914, TargetTag = "StoneGod", Team = "tm_Enemy"},
			FigureNpcSpawnToEntity	{Tag = "Bandit06", Level = 5, UnitId = 914, TargetTag = "StoneGod", Team = "tm_Enemy"},
			MapFlagSetTrue {Name = "mf_BanditsRevealed"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_BanditsRevealed"},
		},
		Actions =
		{
			FigureLootItemMiscAdd	{Tag = "Bandit01", DropChance = 100, ItemId = 248},
			FigureLootItemEquipmentAdd	{Tag = "Bandit01", DropChance = 100, ItemId = 308},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_BanditsRevealed"},
			AND
			{
				OR
				{
					FigureIsInEntityRange	{Tag = "Morca", TargetTag = "pl_Human1Avatar", Range = 6},
					FigureIsInEntityRange	{Tag = "Morca", TargetTag = "pl_Human2Avatar", Range = 6},
					FigureIsInEntityRange	{Tag = "Morca", TargetTag = "pl_Human3Avatar", Range = 6},
				},
			},
			AND
			{	
				OR
				{
					AvatarHasItemMisc	{Player = "pl_Human1", ItemId = 248, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human2", ItemId = 248, Amount = 1},
					AvatarHasItemMisc	{Player = "pl_Human3", ItemId = 248, Amount = 1},
				},	
			},
		},
		Actions =
		{
			AvatarItemMiscTake {Player = "pl_Human1", ItemId = 248, Amount = 999},	
			AvatarItemMiscTake {Player = "pl_Human2", ItemId = 248, Amount = 999},	
			AvatarItemMiscTake {Player = "pl_Human3", ItemId = 248, Amount = 999},	
			FigureOutcry	{Tag = "Morca", TextTag = "Bandits4"},
			AvatarItemEquipmentGive	{Player = "pl_Human1", ItemId = 438, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human2", ItemId = 438, Amount = 1},
			AvatarItemEquipmentGive	{Player = "pl_Human3", ItemId = 438, Amount = 1},
			MapFlagSetTrue {Name = "mf_MorcaShamanReward"},
			QuestSetSolved 	{Player = "pl_Human1", Quest = "CoopMapQuestGateOfSwords"},
			QuestSetSolved 	{Player = "pl_Human2", Quest = "CoopMapQuestGateOfSwords"},
			QuestSetSolved 	{Player = "pl_Human3", Quest = "CoopMapQuestGateOfSwords"},
		},
	},
	
};
