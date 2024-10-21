State
{
	StateName = "INIT",
	
	---------------------------------------------------------------
	-- Nameless waves -> outpost attack, randomized attackers
	----------------------------------------------------------------
		
	-- If the player built first blacksimth building, the timer will start
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			--PlayerHasBuilding {BuildingId = Building.RTS.RealmBlacksmith, Amount = 1, OnlyCompleted = true},
			MapFlagIsTrue {Name = "mf_P501_WaveStarter1"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P501_BaseWaveRun"},
			MapFlagSetTrue {Name = "mf_P501_FirstBaseWave"},
			MapTimerStart {Name = "mt_P501_BaseWaveTimer"},
			
		--  AITroupSizeSet	{Player = "pl_Demon", Size = 15},
  	--  AIConstructionOffensiveSet	{Player = "pl_Demon", Percent = 70},
  	--  AIAttackFrequencySet	{Player = "pl_Demon", Minutes = 3},
  	--  AIEnemyAdd	{Player = "pl_Demon", Tag = "tm_Team1"},
  	--  AIEnemyAdd	{Player = "pl_Demon", Tag = "pl_Player1"},	
		},
	};
		
	-- If the player killed the tower - the spawner is off
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			OR
			{
				BuildingIsDead {Tag = "Iron_Field_Tower_1"},
				BuildingIsDead {Tag = "Iron_Field_Tower_2"},
			},	
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P501_BaseWaveRun"},
			MapTimerStop {Name = "mt_P501_BaseWaveTimer"},
			
		},
	};
	
	-- Instant first wave  
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P501_FirstBaseWave"},
		},
		Actions = 
		{
			NoSpawnEffect { Spawn = FigureRtsKitSpawnWithTag	{Tag = "IF_FirstInvaderDaemon_01", UnitId = 195, Level = 3, X = 330, Y = 300, PlayerKit = "pk_kit2"},},
			FigureTeamTransfer	{Tag = "IF_FirstInvaderDaemon_01", Team = "tm_Team2"},
			
			NoSpawnEffect { Spawn = FigureRtsKitSpawnWithTag	{Tag = "IF_FirstInvaderDaemon_02", UnitId = 195, Level = 3, X = 329, Y = 301, PlayerKit = "pk_kit2"},},
			FigureTeamTransfer	{Tag = "IF_FirstInvaderDaemon_02", Team = "tm_Team2"},
			
			FigureRunToEntity	{Tag = "IF_FirstInvaderDaemon_01", TargetTag = "BabaHouse"},
			FigureRunToEntity	{Tag = "IF_FirstInvaderDaemon_02", TargetTag = "BabaHouse"},
			
			MapFlagSetTrue {Name = "mf_P501_BaseWaveTest"},
			
		},
	};
			
	-- Spawn timer and randomize
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P501_BaseWaveRun"},
			MapTimerIsElapsed	{Name = "mt_P501_BaseWaveTimer", Seconds = 100},
		},
		Actions = 
		{
			MapTimerStop	{Name = "mt_P501_BaseWaveTimer"},			
			MapValueRandomize	{Name = "mv_P501_SpawnDaemon", MinValue = 1, MaxValue = 3},
			MapFlagSetTrue	{Name = "mf_P501_BaseSpawnEvent"},	
		},
	};
	
	-- When the attackers are dead, the respawn timer will be restarted
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P501_BaseWaveRun"},
			MapFlagIsTrue	{Name = "mf_P501_DaemonsAlive"},
			FigureIsDead{Tag = "IF_InvaderDaemon_01"},
			FigureIsDead{Tag = "IF_InvaderDaemon_02"},
			FigureIsDead{Tag = "IF_InvaderDaemon_03"},
			FigureIsDead{Tag = "IF_InvaderDaemon_04"},
			FigureIsDead{Tag = "IF_InvaderDaemon_05"},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P501_DaemonsAlive"},
			MapTimerStart {Name = "mt_P501_BaseWaveTimer"},
		},
	};
	
	-- Daemon spawn -> Type 1
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_BaseSpawnEvent"},
			MapValueIsEqual	{Name = "mv_P501_SpawnDaemon", Value = 1 },
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P501_BaseSpawnEvent"},

			NoSpawnEffect { Spawn = FigureRtsKitSpawnWithTag	{Tag = "IF_InvaderDaemon_01", UnitId = 190, Level = 3, X = 460, Y = 220, PlayerKit = "pk_kit2"},},
			FigureTeamTransfer	{Tag = "IF_InvaderDaemon_01", Team = "tm_Team2"},

			NoSpawnEffect { Spawn = FigureRtsKitSpawnWithTag	{Tag = "IF_InvaderDaemon_02", UnitId = 190, Level = 4, X = 458, Y = 218, PlayerKit = "pk_kit2"},},
			FigureTeamTransfer	{Tag = "IF_InvaderDaemon_02", Team = "tm_Team2"},

			NoSpawnEffect { Spawn = FigureRtsKitSpawnWithTag	{Tag = "IF_InvaderDaemon_03", UnitId = 195, Level = 3, X = 456, Y = 216, PlayerKit = "pk_kit2"},},
			FigureTeamTransfer	{Tag = "IF_InvaderDaemon_03", Team = "tm_Team2"},
			
			NoSpawnEffect { Spawn = FigureRtsKitSpawnWithTag	{Tag = "IF_InvaderDaemon_04", UnitId = 195, Level = 4, X = 454, Y = 214, PlayerKit = "pk_kit2"},},
			FigureTeamTransfer	{Tag = "IF_InvaderDaemon_04", Team = "tm_Team2"},
			
			NoSpawnEffect { Spawn = FigureRtsKitSpawnWithTag	{Tag = "IF_InvaderDaemon_05", UnitId = 195, Level = 3, X = 452, Y = 212, PlayerKit = "pk_kit2"},},
			FigureTeamTransfer	{Tag = "IF_InvaderDaemon_05", Team = "tm_Team2"},
			
			MapTimerStart {Name = "mt_P501_DaemonsMoveTimer"},
			MapFlagSetTrue	{Name = "mf_P501_DaemonsAlive"},

		},
	};
	
	-- Daemon spawn -> Type 2
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_BaseSpawnEvent"},
			MapValueIsEqual	{Name = "mv_P501_SpawnDaemon", Value = 2 },
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P501_BaseSpawnEvent"},
						
			NoSpawnEffect { Spawn = FigureRtsKitSpawnWithTag	{Tag = "IF_InvaderDaemon_01", UnitId = 189, Level = 3, X = 460, Y = 220, PlayerKit = "pk_kit2"},},
			FigureTeamTransfer	{Tag = "IF_InvaderDaemon_01", Team = "tm_Team2"},

			NoSpawnEffect { Spawn = FigureRtsKitSpawnWithTag	{Tag = "IF_InvaderDaemon_02", UnitId = 189, Level = 4, X = 458, Y = 218, PlayerKit = "pk_kit2"},},
			FigureTeamTransfer	{Tag = "IF_InvaderDaemon_02", Team = "tm_Team2"},

			NoSpawnEffect { Spawn = FigureRtsKitSpawnWithTag	{Tag = "IF_InvaderDaemon_03", UnitId = 189, Level = 3, X = 456, Y = 216, PlayerKit = "pk_kit2"},},
			FigureTeamTransfer	{Tag = "IF_InvaderDaemon_03", Team = "tm_Team2"},
			
			NoSpawnEffect { Spawn = FigureRtsKitSpawnWithTag	{Tag = "IF_InvaderDaemon_04", UnitId = 195, Level = 4, X = 454, Y = 214, PlayerKit = "pk_kit2"},},
			FigureTeamTransfer	{Tag = "IF_InvaderDaemon_04", Team = "tm_Team2"},
		
			NoSpawnEffect { Spawn = FigureRtsKitSpawnWithTag	{Tag = "IF_InvaderDaemon_05", UnitId = 195, Level = 3, X = 452, Y = 212, PlayerKit = "pk_kit2"},},
			FigureTeamTransfer	{Tag = "IF_InvaderDaemon_05", Team = "tm_Team2"},
			
			MapTimerStart {Name = "mt_P501_DaemonsMoveTimer"},
			MapFlagSetTrue	{Name = "mf_P501_DaemonsAlive"},

		},
		
	};
	
	-- Daemon spawn -> Type 3
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_BaseSpawnEvent"},
			MapValueIsEqual	{Name = "mv_P501_SpawnDaemon", Value = 3 },
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P501_BaseSpawnEvent"},
						
			NoSpawnEffect { Spawn = FigureRtsKitSpawnWithTag	{Tag = "IF_InvaderDaemon_01", UnitId = 189, Level = 3, X = 460, Y = 220, PlayerKit = "pk_kit2"},},
			FigureTeamTransfer	{Tag = "IF_InvaderDaemon_01", Team = "tm_Team2"},

			NoSpawnEffect { Spawn = FigureRtsKitSpawnWithTag	{Tag = "IF_InvaderDaemon_02", UnitId = 189, Level = 4, X = 458, Y = 218, PlayerKit = "pk_kit2"},},
			FigureTeamTransfer	{Tag = "IF_InvaderDaemon_02", Team = "tm_Team2"},

			NoSpawnEffect { Spawn = FigureRtsKitSpawnWithTag	{Tag = "IF_InvaderDaemon_03", UnitId = 191, Level = 3, X = 456, Y = 216, PlayerKit = "pk_kit2"},},
			FigureTeamTransfer	{Tag = "IF_InvaderDaemon_03", Team = "tm_Team2"},
			
			NoSpawnEffect { Spawn = FigureRtsKitSpawnWithTag	{Tag = "IF_InvaderDaemon_04", UnitId = 195, Level = 4, X = 454, Y = 214, PlayerKit = "pk_kit2"},},
			FigureTeamTransfer	{Tag = "IF_InvaderDaemon_04", Team = "tm_Team2"},
			
			NoSpawnEffect { Spawn = FigureRtsKitSpawnWithTag	{Tag = "IF_InvaderDaemon_05", UnitId = 195, Level = 3, X = 452, Y = 212, PlayerKit = "pk_kit2"},},
			FigureTeamTransfer	{Tag = "IF_InvaderDaemon_05", Team = "tm_Team2"},
			
			MapTimerStart {Name = "mt_P501_DaemonsMoveTimer"},
			MapFlagSetTrue	{Name = "mf_P501_DaemonsAlive"},
			
		},
	};
	
	-- Daemons Move to Player Base
	
	OnEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P501_DaemonsMoveTimer", Seconds = 1},
			MapFlagIsFalse	{Name = "mf_P501_Daemon1MoveDone"},
		},
		Actions = 
		{
			FigureRunToEntity	{Tag = "IF_InvaderDaemon_01", TargetTag = "BabaHouse"},
			MapFlagSetTrue	{Name = "mf_P501_Daemon1MoveDone"},
			
		},
		
	};
	
	OnEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P501_DaemonsMoveTimer", Seconds = 2},
			MapFlagIsFalse	{Name = "mf_P501_Daemon2MoveDone"},
		},
		Actions = 
		{
			FigureRunToEntity	{Tag = "IF_InvaderDaemon_02", TargetTag = "BabaHouse"},
			MapFlagSetTrue	{Name = "mf_P501_Daemon2MoveDone"},
		
		},
		
	};
	
	OnEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P501_DaemonsMoveTimer", Seconds = 3},
			MapFlagIsFalse	{Name = "mf_P501_Daemon3MoveDone"},
		},
		Actions = 
		{
			FigureRunToEntity	{Tag = "IF_InvaderDaemon_03", TargetTag = "BabaHouse"},
			MapFlagSetTrue	{Name = "mf_P501_Daemon3MoveDone"},
	
		},
		
	};
	
	OnEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P501_DaemonsMoveTimer", Seconds = 4},
			MapFlagIsFalse	{Name = "mf_P501_Daemon4MoveDone"},
		},
		Actions = 
		{
			FigureRunToEntity	{Tag = "IF_InvaderDaemon_04", TargetTag = "BabaHouse"},
			MapFlagSetTrue	{Name = "mf_P501_Daemon4MoveDone"},
		},
		
	};
	
	OnEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_P501_DaemonsMoveTimer", Seconds = 5},
		},
		Actions = 
		{
			MapTimerStop {Name = "mt_P501_DaemonsMoveTimer"},
			FigureRunToEntity	{Tag = "IF_InvaderDaemon_05", TargetTag = "BabaHouse"},
			MapFlagSetFalse	{Name = "mf_P501_Daemon1MoveDone"},
			MapFlagSetFalse	{Name = "mf_P501_Daemon2MoveDone"},
			MapFlagSetFalse	{Name = "mf_P501_Daemon3MoveDone"},
			MapFlagSetFalse	{Name = "mf_P501_Daemon4MoveDone"},
			MapFlagSetTrue	{Name = "mf_P501_NamelessForceClosing"},
			
		},
		
	};
			
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_P501_NamelessForceClosing"},
			OR
			{
				FigureIsInRange	{Tag = "IF_InvaderDaemon_01", Range = 13 , X = 464, Y = 424},
				FigureIsInRange	{Tag = "IF_InvaderDaemon_03", Range = 13 , X = 464, Y = 424},
				FigureIsInRange	{Tag = "IF_InvaderDaemon_05", Range = 13 , X = 464, Y = 424},
			},
		},
		Actions = 
		{
			MapFlagSetFalse	{Name = "mf_P501_NamelessForceClosing"},
			NoSpawnEffect{Spawn = FigureNpcSpawnToEntity {Tag = "Soldier", Level = 15, UnitId = 311, TargetTag = "pl_HumanAvatar", Team = "tm_Neutral"}},
			FigureOutcry {TextTag = "Enemy_Assault1", Tag = "Soldier"},
			FigureVanish {Tag = "Soldier"},
		},
		
	};	
					
};