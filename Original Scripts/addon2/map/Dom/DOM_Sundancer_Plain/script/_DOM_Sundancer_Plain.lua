--domPoint1, domPoint2 and domPoint3 are the 3 dompoints here. there are 2 teams with 2 players each in them.

local MaxPoints = 1000

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
				
		--MapTimerStart	{Name = "mt_Control_Point01Pts"},
		--MapTimerStart	{Name = "mt_Control_Point02Pts"},
		--MapTimerStart	{Name = "mt_Control_Point03Pts"},
		--MapTimerStart	{Name = "mt_Control_Point04Pts"},
		--MapTimerStart	{Name = "mt_Control_Point05Pts"},
		
		MapTimerStart	{Name = "mt_Control_NoPointTeam1"},
		MapTimerStart	{Name = "mt_Control_NoPointTeam2"},
		
		MapTimerStart	{Name = "mt_Delay_Timer"},
		
		
		--SetDominationPointControl{Value = 1, Value = 1},
		--SetDominationTeamPoints{Value = 1, Amount = 0},
		--MapValueSet{Name = "mv_team1Points", Value = 1 },

		--MapValueSet{Name = "mv_team2Points", Value = 1 },
		VisualDisplayText {Text= "start2p5d"},
		VisualTimerStart	{Seconds = 1800},	
		
		FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Control_Point01", Range = 15, Height = 100},
		FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Control_Point02", Range = 15, Height = 100},
		FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Control_Point03", Range = 15, Height = 100},
		FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Control_Point04", Range = 15, Height = 100},
		FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Control_Point05", Range = 15, Height = 100},
		},
		
	};
	
	
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_Delay_Timer", Seconds = 1},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_Main_Timer1"},
		},
		
	};
	
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_Delay_Timer", Seconds = 2},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_Main_Timer2"},
		},
		
	};
	
	OnOneTimeEvent
	{
		
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_Delay_Timer", Seconds = 3},
		},
		Actions = 
		{
			MapTimerStart	{Name = "mt_Main_Timer3"},
		},
		
	};

	
	-- MAIN Score control timer
	
	OnEvent
		{
			EventName = "MainTimer1",
			Conditions = 
			{
				MapTimerIsElapsed	{Name = "mt_Main_Timer1", Seconds = 4},
				VisualTimerIsActive	{},
				MapFlagIsFalse	{Name = "mf_gameover"},
			},
			Actions = 
			{
				--MapTimerStop	{Name = "mt_Main_Timer"},
				MapTimerStart	{Name = "mt_Main_Timer1"},	
				MapFlagSetTrue {Name = "mf_NoPoint_Team1_givepoint"},
				MapFlagSetTrue {Name = "mf_NoPoint_Team2_givepoint"},
				MapFlagSetTrue {Name = "mf_Point1_Team1_givepoint"},
				MapFlagSetTrue {Name = "mf_Point1_Team2_givepoint"},
					
			},
			
		};
	
		OnEvent
		{
			EventName = "MainTimer2",
			Conditions = 
			{
				MapTimerIsElapsed	{Name = "mt_Main_Timer2", Seconds = 4},
				VisualTimerIsActive	{},
				MapFlagIsFalse	{Name = "mf_gameover"},
			},
			Actions = 
			{
				MapTimerStart	{Name = "mt_Main_Timer2"},	
				MapFlagSetTrue {Name = "mf_Point2_Team1_givepoint"},
				MapFlagSetTrue {Name = "mf_Point2_Team2_givepoint"},
				MapFlagSetTrue {Name = "mf_Point3_Team1_givepoint"},
				MapFlagSetTrue {Name = "mf_Point3_Team2_givepoint"},
							
			},
			
		};
		
		OnEvent
		{
			EventName = "MainTimer3",
			Conditions = 
			{
				MapTimerIsElapsed	{Name = "mt_Main_Timer3", Seconds = 4},
				VisualTimerIsActive	{},
				MapFlagIsFalse	{Name = "mf_gameover"},
			},
			Actions = 
			{
				MapTimerStart	{Name = "mt_Main_Timer3"},	
				MapFlagSetTrue {Name = "mf_Point4_Team1_givepoint"},
				MapFlagSetTrue {Name = "mf_Point4_Team2_givepoint"},
				MapFlagSetTrue {Name = "mf_Point5_Team1_givepoint"},
				MapFlagSetTrue {Name = "mf_Point5_Team2_givepoint"},			
			},
			
		};
	
	-- resource to team1 (team has 0 node)
	
	OnEvent
		{
			EventName = "giveRestoTeam1",
			Conditions = 
			{
				VisualTimerIsActive	{},
				--MapTimerIsElapsed	{Name = "mt_Control_NoPointTeam1", Seconds = 4},
				MapFlagIsTrue {Name = "mf_NoPoint_Team1_givepoint"},
				MapValueIsGreaterOrEqual	{Name = "mv_team1Points", Value = 1 },
				MapFlagIsFalse	{Name = "mf_team1HasPoint1"},
				MapFlagIsFalse	{Name = "mf_team1HasPoint2"},
				MapFlagIsFalse	{Name = "mf_team1HasPoint3"},
				MapFlagIsFalse	{Name = "mf_team1HasPoint4"},
				MapFlagIsFalse	{Name = "mf_team1HasPoint5"},
				MapFlagIsFalse	{Name = "mf_gameover"},
			},
			Actions = 
			{
				MapFlagSetFalse {Name = "mf_NoPoint_Team1_givepoint"},
				--MapTimerStop	{Name = "mt_Control_NoPointTeam1"},
				TeamResourceStoneGive {Team = "1", Amount = 10}, 
				TeamResourceSilverGive {Team = "1", Amount = 10}, 
				TeamResourceLenyaGive {Team = "1", Amount = 10},	
				--MapTimerStart	{Name = "mt_Control_NoPointTeam1"},			
			},
			
		};
		
		-- resource to team2 (team has 0 node)
	OnEvent
		{
			EventName = "giveRestoTeam2",
			Conditions = 
			{
				VisualTimerIsActive	{},
				--MapTimerIsElapsed	{Name = "mt_Control_NoPointTeam2", Seconds = 4},
				MapFlagIsTrue {Name = "mf_NoPoint_Team2_givepoint"},
				MapValueIsGreaterOrEqual	{Name = "mv_team2Points", Value = 1 },
				MapFlagIsFalse	{Name = "mf_team2HasPoint1"},
				MapFlagIsFalse	{Name = "mf_team2HasPoint2"},
				MapFlagIsFalse	{Name = "mf_team2HasPoint3"},
				MapFlagIsFalse	{Name = "mf_team2HasPoint4"},
				MapFlagIsFalse	{Name = "mf_team2HasPoint5"},
				MapFlagIsFalse	{Name = "mf_gameover"},
			},
			Actions = 
			{
				MapFlagSetFalse {Name = "mf_NoPoint_Team2_givepoint"},
				--MapTimerStop	{Name = "mt_Control_NoPointTeam2"},
				TeamResourceStoneGive {Team = "2", Amount = 10}, 
				TeamResourceSilverGive {Team = "2", Amount = 10}, 
				TeamResourceLenyaGive {Team = "2", Amount = 10},
				--MapTimerStart	{Name = "mt_Control_NoPointTeam2"},		
			},
			
		};
		
	 --dom points		
		OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "giveDomPoint1PtsTeam1",
			Conditions = 
			{
				MapFlagIsTrue {Name = "mf_Point1_Team1_givepoint"},
				--MapTimerIsElapsed	{Name = "mt_Control_Point01Pts", Seconds = 4},
				MapFlagIsTrue	{Name = "mf_team1HasPoint1"},
				VisualTimerIsActive	{},
				MapFlagIsFalse	{Name = "mf_gameover"},
			},
			Actions = 
			{
			MapFlagSetFalse {Name = "mf_Point1_Team1_givepoint"},
			--MapTimerStop {Name = "mt_Control_Point01Pts"},
			MapValueAdd	{Name = "mv_team1Points", Value = 10},
			TeamResourceStoneGive {Team = "1", Amount = 20}, 
			TeamResourceSilverGive {Team = "1", Amount = 20}, 
			TeamResourceLenyaGive {Team = "1", Amount = 20}, 
			VisualDisplayText {Text= "giveTeam1"},
			--SetDominationTeamPoints{Value = 0, Amount = 0},
			--MapTimerStart	{Name = "mt_Control_Point01Pts"},
			},
			
		};
		
		OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "giveDomPoint2PtsTeam1",
			Conditions = 
			{
				MapFlagIsTrue {Name = "mf_Point2_Team1_givepoint"},
				--MapTimerIsElapsed	{Name = "mt_Control_Point02Pts", Seconds = 4},
				MapFlagIsTrue {Name = "mf_team1HasPoint2"},
				VisualTimerIsActive	{},
				MapFlagIsFalse	{Name = "mf_gameover"},
			},
			Actions = 
			{
			MapFlagSetFalse {Name = "mf_Point2_Team1_givepoint"},
			--MapTimerStop	{Name = "mt_Control_Point02Pts"},
			MapValueAdd	{Name = "mv_team1Points", Value = 10},
			TeamResourceStoneGive {Team = "1", Amount = 20}, 
			TeamResourceSilverGive {Team = "1", Amount = 20}, 
			TeamResourceLenyaGive {Team = "1", Amount = 20}, 
			VisualDisplayText {Text= "giveTeam1"},
			--SetDominationTeamPoints{Value = 1, Amount = 0},
			--MapTimerStart	{Name = "mt_Control_Point02Pts"},	
			},
		};
		
		OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "giveDomPoint3PtsTeam1",
			Conditions = 
			{
				MapFlagIsTrue {Name = "mf_Point3_Team1_givepoint"},
				--MapTimerIsElapsed	{Name = "mt_Control_Point03Pts", Seconds = 4},
				MapFlagIsTrue {Name = "mf_team1HasPoint3"},
				VisualTimerIsActive	{},
				MapFlagIsFalse	{Name = "mf_gameover"},

			},
			Actions = 
			{
			MapFlagSetFalse {Name = "mf_Point3_Team1_givepoint"},
			--MapTimerStop	{Name = "mt_Control_Point03Pts"},
			MapValueAdd	{Name = "mv_team1Points", Value = 10},
			TeamResourceStoneGive {Team = "1", Amount = 20}, 
			TeamResourceSilverGive {Team = "1", Amount = 20}, 
			TeamResourceLenyaGive {Team = "1", Amount = 20}, 
			VisualDisplayText {Text= "giveTeam1"},
			--SetDominationTeamPoints{Value = 0, Amount = 0},				
			--MapTimerStart	{Name = "mt_Control_Point03Pts"},
			},
			
			
		};
		
		OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "giveDomPoint4PtsTeam1",
			Conditions = 
			{
				--MapTimerIsElapsed	{Name = "mt_Control_Point04Pts", Seconds = 4},
				MapFlagIsTrue {Name = "mf_Point4_Team1_givepoint"},
				MapFlagIsTrue {Name = "mf_team1HasPoint4"},		
				VisualTimerIsActive	{},
				MapFlagIsFalse	{Name = "mf_gameover"},
			},
			Actions = 
			{
			MapFlagSetFalse {Name = "mf_Point4_Team1_givepoint"},
			--MapTimerStop	{Name = "mt_Control_Point04Pts"},
			MapValueAdd	{Name = "mv_team1Points", Value = 10},
			TeamResourceStoneGive {Team = "1", Amount = 20}, 
			TeamResourceSilverGive {Team = "1", Amount = 20}, 
			TeamResourceLenyaGive {Team = "1", Amount = 20}, 
			VisualDisplayText {Text= "giveTeam1"},
			--SetDominationTeamPoints{Value = 0, Amount = 0},	
			--MapTimerStart	{Name = "mt_Control_Point04Pts"},	
			
			},			
			
		};		
		
		OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "giveDomPoint5PtsTeam1",
			Conditions = 
			{
				MapFlagIsTrue {Name = "mf_Point5_Team1_givepoint"},
				--MapTimerIsElapsed	{Name = "mt_Control_Point05Pts", Seconds = 4},
				MapFlagIsTrue {Name = "mf_team1HasPoint5"},		
				VisualTimerIsActive	{},
				MapFlagIsFalse	{Name = "mf_gameover"},
			},
			Actions = 
			{
			MapFlagSetFalse {Name = "mf_Point5_Team1_givepoint"},
			--MapTimerStop	{Name = "mt_Control_Point05Pts"},
			MapValueAdd	{Name = "mv_team1Points", Value = 10},
			TeamResourceStoneGive {Team = "1", Amount = 20}, 
			TeamResourceSilverGive {Team = "1", Amount = 20}, 
			TeamResourceLenyaGive {Team = "1", Amount = 20}, 
			VisualDisplayText {Text= "giveTeam1"},
			--SetDominationTeamPoints{Value = 0, Amount = 0},			
			--MapTimerStart	{Name = "mt_Control_Point05Pts"},
			},			
			
		};
		
				
		OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "giveDomPoint1PtsTeam2",
			Conditions = 
			{
				MapFlagIsTrue {Name = "mf_Point1_Team2_givepoint"},
				--MapTimerIsElapsed	{Name = "mt_Control_Point01Pts", Seconds = 4},
				MapFlagIsTrue	{Name = "mf_team2HasPoint1"},			
				VisualTimerIsActive	{},
				MapFlagIsFalse	{Name = "mf_gameover"},
			},
			Actions = 
			{
			MapFlagSetFalse {Name = "mf_Point1_Team2_givepoint"},
			--MapTimerStop	{Name = "mt_Control_Point01Pts"},
			MapValueAdd	{Name = "mv_team2Points", Value = 10},
			TeamResourceStoneGive {Team = "2", Amount = 20}, 
			TeamResourceSilverGive {Team = "2", Amount = 20}, 
			TeamResourceLenyaGive {Team = "2", Amount = 20},
			VisualDisplayText {Text= "giveTeam2"},
			--SetDominationTeamPoints{Value = 1, Amount = 1},
			--MapTimerStart	{Name = "mt_Control_Point01Pts"},
			},
			
		};
			
			OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "giveDomPoint2PtsTeam2",
			Conditions = 
			{
				MapFlagIsTrue {Name = "mf_Point2_Team2_givepoint"},
				--MapTimerIsElapsed	{Name = "mt_Control_Point02Pts", Seconds = 4},
				MapFlagIsTrue {Name = "mf_team2HasPoint2"},
				VisualTimerIsActive	{},
				MapFlagIsFalse	{Name = "mf_gameover"},
			},
			Actions = 
			{
			MapFlagSetFalse {Name = "mf_Point2_Team2_givepoint"},
			--MapTimerStop	{Name = "mt_domPoint2Pts"},
			MapValueAdd	{Name = "mv_team2Points", Value = 10},
			TeamResourceStoneGive {Team = "2", Amount = 20}, 
			TeamResourceSilverGive {Team = "2", Amount = 20}, 
			TeamResourceLenyaGive {Team = "2", Amount = 20},
			VisualDisplayText {Text= "giveTeam2"},
			--SetDominationTeamPoints{Value = 0, Amount = 1},				
			--MapTimerStart	{Name = "mt_domPoint2Pts"},
				
			},
		};
			
		OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "giveDomPoint3PtsTeam2",
			Conditions = 
			{
				MapFlagIsTrue {Name = "mf_Point3_Team2_givepoint"},
				--MapTimerIsElapsed	{Name = "mt_Control_Point03Pts", Seconds = 4},
				MapFlagIsTrue {Name = "mf_team2HasPoint3"},				
				VisualTimerIsActive	{},
				MapFlagIsFalse	{Name = "mf_gameover"},
			},
			Actions = 
			{
			MapFlagSetFalse {Name = "mf_Point3_Team2_givepoint"},
			--MapTimerStop	{Name = "mt_Control_Point03Pts"},
			MapValueAdd	{Name = "mv_team2Points", Value = 10},
			TeamResourceStoneGive {Team = "2", Amount = 20}, 
			TeamResourceSilverGive {Team = "2", Amount = 20}, 
			TeamResourceLenyaGive {Team = "2", Amount = 20},
			VisualDisplayText {Text= "giveTeam2"},
			--SetDominationTeamPoints{Value = 1, Amount = 1},
			--MapTimerStart	{Name = "mt_Control_Point03Pts"},
				
			},			
			
		};		

		OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "giveDomPoint4PtsTeam2",
			Conditions = 
			{
				MapFlagIsTrue {Name = "mf_Point4_Team2_givepoint"},
				--MapTimerIsElapsed	{Name = "mt_Control_Point04Pts", Seconds = 4},
				MapFlagIsTrue {Name = "mf_team2HasPoint4"},
				VisualTimerIsActive	{},
				MapFlagIsFalse	{Name = "mf_gameover"},
			},
			Actions = 
			{
			MapFlagSetFalse {Name = "mf_Point4_Team2_givepoint"},
			--MapTimerStop	{Name = "mt_Control_Point04Pts"},
			MapValueAdd	{Name = "mv_team2Points", Value = 10},
			TeamResourceStoneGive {Team = "2", Amount = 20}, 
			TeamResourceSilverGive {Team = "2", Amount = 20}, 
			TeamResourceLenyaGive {Team = "2", Amount = 20},		
			VisualDisplayText {Text= "giveTeam2"},
			--SetDominationTeamPoints{Value = 1, Amount = 1},
			--MapTimerStart	{Name = "mt_Control_Point04Pts"},
				
			},			
			
		};
		
		OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "giveDomPoint5PtsTeam2",
			Conditions = 
			{
				MapFlagIsTrue {Name = "mf_Point5_Team2_givepoint"},
				--MapTimerIsElapsed	{Name = "mt_Control_Point05Pts", Seconds = 4},
				MapFlagIsTrue {Name = "mf_team2HasPoint5"},
				VisualTimerIsActive	{},
				MapFlagIsFalse	{Name = "mf_gameover"},
			},
			Actions = 
			{
			MapFlagSetFalse {Name = "mf_Point5_Team2_givepoint"},
			--MapTimerStop{Name = "mt_Control_Point05Pts"},
			MapValueAdd	{Name = "mv_team2Points", Value = 10},
			TeamResourceStoneGive {Team = "2", Amount = 20}, 
			TeamResourceSilverGive {Team = "2", Amount = 20}, 
			TeamResourceLenyaGive {Team = "2", Amount = 20},		
			VisualDisplayText {Text= "giveTeam2"},
			--SetDominationTeamPoints{Value = 1, Amount = 1},
			--MapTimerStart	{Name = "mt_Control_Point05Pts"},
			},			
			
		};
		
		OnOneTimeEvent --check if time is over and award victory to team with greater domination points. 
		{
		
			EventName = "Time_Up", 
			Conditions = 
			{
				VisualTimerIsNotActive {}, 
				OR
				{
					MapValueIsGreaterThanVariable	{Name = "mv_team1Points", Variable = "mv_team2Points"},
					MapValueIsEqualToVariable	{Name = "mv_team1Points", Variable = "mv_team2Points"},
				},
			},
			Actions =
			{ 
				TeamGameOver {Team = "2"},
			},
		};
			
			
		OnOneTimeEvent 
		{
		
			EventName = "Time_Up2", 
			Conditions = 
			{
				VisualTimerIsNotActive {}, 
				MapValueIsLessThanVariable	{Name = "mv_team1Points", Variable = "mv_team2Points"},

			},
			Actions =
			{ 
				TeamGameOver {Team = "1"},
			},
		};
		
		OnOneTimeEvent --check if any team has greater than 1000 dom points and award victory accordingly. 
		{
		
			EventName = "Team1PtsGreaterthan1000", 
			Conditions = 
			{				
				--MapValueIsGreaterThanVariable	{Name = "mv_team1Points", Variable = "MaxPoints"}			
				MapValueIsGreaterOrEqual	{Name = "mv_team1Points", Value = 10000 },
				VisualTimerIsActive	{},
			},
			Actions =
			{ 
				TeamGameOver {Team = "2"},
				MapFlagSetTrue	{Name = "mf_gameover"},
			},
		};
			
			
		OnOneTimeEvent  --check if any team has greater than 1000 dom points and award victory accordingly. 
		{
		
			EventName = "Team2PtsGreaterthan1000", 
			Conditions = 
			{				
				MapValueIsGreaterOrEqual	{Name = "mv_team2Points", Value = 10000 },
				VisualTimerIsActive	{},
			},
			Actions =
			{ 
				TeamGameOver {Team = "1"},
				MapFlagSetTrue	{Name = "mf_gameover"},
			},
		};
		
		--changing ownership of the dom points
		
		
		OnEvent
		{
			EventName = "ownershipChangeToTeam1Point1",
			Conditions = 
			{
			
				MapFlagIsFalse {Name = "mf_team1HasPoint1"},

				FigureTeamIsInRangeToEntity	{Team = "1", Range = 10, TargetTag = "Control_Point01"},
				FigureTeamIsNotInRangeToEntity	{Team = "2", Range = 10, TargetTag = "Control_Point01"},				
				--FigureTeamIsNotInRangeToEntity	{Team = "tm_Neutral", Range = 10, TargetTag = "Control_Point01"},				
				
			},
			Actions = 
			{
								
			MapFlagSetTrue	{Name = "mf_team1HasPoint1"},
			MapFlagSetFalse	{Name = "mf_team2HasPoint1"},
			VisualDisplayText {Text= "dom1team1"},
			
			ObjectVanish	{Tag = "Point1_Flag"},
			ObjectSpawn	{ObjectId = 1948, X = 174.746, Y = 170.261, Direction = 0, Tag = "Point1_Flag"},
			MinimapAlertSetToEntity	{Tag = "Control_Point01", Type = 2},
			EffectStart	{Tag = "Point1_Flag", File = "Effect_Spawn_Unit"},
				
			},
			
		};
		
		
		OnEvent
		{
			EventName = "ownershipChangeToTeam2Point1",
			Conditions = 
			{
				MapFlagIsFalse {Name = "mf_team2HasPoint1"},
				
				FigureTeamIsInRangeToEntity	{Team = "2", Range = 10, TargetTag = "Control_Point01"},
				FigureTeamIsNotInRangeToEntity	{Team = "1", Range = 10, TargetTag = "Control_Point01"},
				--FigureTeamIsNotInRangeToEntity	{Team = "tm_Neutral", Range = 10, TargetTag = "Control_Point01"},		
				

			},
			Actions = 
			{
			
			MapFlagSetTrue	{Name = "mf_team2HasPoint1"},
			MapFlagSetFalse	{Name = "mf_team1HasPoint1"},
			VisualDisplayText {Text= "dom1team2"},		
			
			ObjectVanish	{Tag = "Point1_Flag"},
			ObjectSpawn	{ObjectId = 1896, X = 174.746, Y = 170.261, Direction = 0, Tag = "Point1_Flag"},
			MinimapAlertSetToEntity	{Tag = "Control_Point01", Type = 2},
			EffectStart	{Tag = "Point1_Flag", File = "Effect_Spawn_Unit"},
			},
			
		};
				
		
		OnEvent
		{
			EventName = "ownershipChangeToTeam1Point2",
			Conditions = 
			{			
				MapFlagIsFalse {Name = "mf_team1HasPoint2"},
				
				FigureTeamIsInRangeToEntity	{Team = "1", Range = 10, TargetTag = "Control_Point02"},				
				FigureTeamIsNotInRangeToEntity	{Team = "2", Range = 10, TargetTag = "Control_Point02"},
				--FigureTeamIsNotInRangeToEntity	{Team = "tm_Neutral", Range = 15, TargetTag = "Control_Point02"},				

			},
			Actions = 
			{
				
			MapFlagSetTrue	{Name = "mf_team1HasPoint2"},
			MapFlagSetFalse	{Name = "mf_team2HasPoint2"},
			-- FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Control_Point02", Range = 10, Height = 100},
			VisualDisplayText {Text= "dom2team1"},
			
			ObjectVanish	{Tag = "Point2_Flag"},
			ObjectSpawn	{ObjectId = 1948, X = 209.12, Y = 137.936, Direction = 270, Tag = "Point2_Flag"},
			MinimapAlertSetToEntity	{Tag = "Control_Point02", Type = 2},
			EffectStart	{Tag = "Point2_Flag", File = "Effect_Spawn_Unit"},
			},
			
		};
		
		
		OnEvent
		{
			EventName = "ownershipChangeToTeam2Point2",
			Conditions = 
			{
				MapFlagIsFalse {Name = "mf_team2HasPoint2"},				
				
				FigureTeamIsInRangeToEntity	{Team = "2", Range = 10, TargetTag = "Control_Point02"},
				FigureTeamIsNotInRangeToEntity	{Team = "1", Range = 10, TargetTag = "Control_Point02"},
				--FigureTeamIsNotInRangeToEntity	{Team = "tm_Neutral", Range = 10, TargetTag = "Control_Point02"},
			
			},
			Actions = 
			{
			
			MapFlagSetTrue	{Name = "mf_team2HasPoint2"},
			MapFlagSetFalse	{Name = "mf_team1HasPoint2"},
			VisualDisplayText {Text= "dom2team2"},
			
			ObjectVanish	{Tag = "Point2_Flag"},
			ObjectSpawn	{ObjectId = 1896, X = 209.12, Y = 137.936, Direction = 270, Tag = "Point2_Flag"},
			MinimapAlertSetToEntity	{Tag = "Control_Point02", Type = 2},
			EffectStart	{Tag = "Point2_Flag", File = "Effect_Spawn_Unit"},
			},
			
		};
		
		
		
		OnEvent
		{
			EventName = "ownershipChangeToTeam1Point3",
			Conditions = 
			{
				MapFlagIsFalse {Name = "mf_team1HasPoint3"},

				FigureTeamIsInRangeToEntity	{Team = "1", Range = 10, TargetTag = "Control_Point03"},
				FigureTeamIsNotInRangeToEntity	{Team = "2", Range = 10, TargetTag = "Control_Point03"},				
	--			FigureTeamIsNotInRangeToEntity	{Team = "tm_Neutral", Range = 15, TargetTag = "Control_Point03"},			

			},
			Actions = 
			{
			MapFlagSetTrue	{Name = "mf_team1HasPoint3"},
			MapFlagSetFalse	{Name = "mf_team2HasPoint3"},
			-- FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Control_Point03", Range = 10, Height = 100},
			VisualDisplayText {Text= "dom3team1"},
			
			ObjectVanish	{Tag = "Point3_Flag"},
			ObjectSpawn	{ObjectId = 1948, X = 211.607, Y = 211.836, Direction = 0, Tag = "Point3_Flag"},
			MinimapAlertSetToEntity	{Tag = "Control_Point03", Type = 2},
			EffectStart	{Tag = "Point3_Flag", File = "Effect_Spawn_Unit"},
			},
			
		};
		
		
		OnEvent
		{		
			EventName = "ownershipChangeToTeam2Point3",
			Conditions = 
			{
				MapFlagIsFalse {Name = "mf_team2HasPoint3"},
				
				FigureTeamIsInRangeToEntity	{Team = "2", Range = 10, TargetTag = "Control_Point03"},
				FigureTeamIsNotInRangeToEntity	{Team = "1", Range = 10, TargetTag = "Control_Point03"},
				--FigureTeamIsNotInRangeToEntity	{Team = "tm_Neutral", Range = 10, TargetTag = "Control_Point03"},
				
			},
			Actions = 
			{
			
			MapFlagSetTrue	{Name = "mf_team2HasPoint3"},
			MapFlagSetFalse	{Name = "mf_team1HasPoint3"},
			VisualDisplayText {Text= "dom3team2"},
			
			ObjectVanish	{Tag = "Point3_Flag"},
			ObjectSpawn	{ObjectId = 1896, X = 211.607, Y = 211.836, Direction = 0, Tag = "Point3_Flag"},
			MinimapAlertSetToEntity	{Tag = "Control_Point03", Type = 2},
			EffectStart	{Tag = "Point3_Flag", File = "Effect_Spawn_Unit"},
			},
			
		};
		
		
		OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "ownershipChangeToTeam1Point4",
			Conditions = 
			{
				MapFlagIsFalse {Name = "mf_team1HasPoint4"},
				
				FigureTeamIsInRangeToEntity	{Team = "1", Range = 10, TargetTag = "Control_Point04"},
				FigureTeamIsNotInRangeToEntity	{Team = "2", Range = 10, TargetTag = "Control_Point04"},
				
				--FigureTeamIsNotInRangeToEntity	{Team = "tm_Neutral", Range = 10, TargetTag = "Control_Point04"},			

			},
			Actions = 
			{
	
			MapFlagSetTrue	{Name = "mf_team1HasPoint4"},
			MapFlagSetFalse	{Name = "mf_team2HasPoint4"},
			-- FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Control_Point04", Range = 10, Height = 100},
			VisualDisplayText {Text= "dom4team1"},
			
			ObjectVanish	{Tag = "Point4_Flag"},
			ObjectSpawn	{ObjectId = 1948, X = 136.78, Y = 136.304, Direction = 0, Tag = "Point4_Flag"},
			MinimapAlertSetToEntity	{Tag = "Control_Point04", Type = 2},
			EffectStart	{Tag = "Point4_Flag", File = "Effect_Spawn_Unit"},
			},
			
		};
		
		
		OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "ownershipChangeToTeam2Point4",
			Conditions = 
			{
				MapFlagIsFalse {Name = "mf_team2HasPoint4"},
				
				FigureTeamIsInRangeToEntity	{Team = "2", Range = 10, TargetTag = "Control_Point04"},
				FigureTeamIsNotInRangeToEntity	{Team = "1", Range = 10, TargetTag = "Control_Point04"},
				--FigureTeamIsNotInRangeToEntity	{Team = "tm_Neutral", Range = 10, TargetTag = "Control_Point04"},
				
			},
			Actions = 
			{
			
			MapFlagSetTrue	{Name = "mf_team2HasPoint4"},
			MapFlagSetFalse	{Name = "mf_team1HasPoint4"},
			VisualDisplayText {Text= "dom4team2"},
			
			ObjectVanish	{Tag = "Point4_Flag"},
			ObjectSpawn	{ObjectId = 1896, X = 136.78, Y = 136.304, Direction = 0, Tag = "Point4_Flag"},
			MinimapAlertSetToEntity	{Tag = "Control_Point04", Type = 2},
			EffectStart	{Tag = "Point4_Flag", File = "Effect_Spawn_Unit"},
			},
			
		};
		
		OnEvent
		{
			EventName = "ownershipChangeToTeam1Point5",
			Conditions = 
			{
				MapFlagIsFalse {Name = "mf_team1HasPoint5"},
				
				FigureTeamIsInRangeToEntity	{Team = "1", Range = 10, TargetTag = "Control_Point05"},
				FigureTeamIsNotInRangeToEntity	{Team = "2", Range = 10, TargetTag = "Control_Point05"},
				
				--FigureTeamIsNotInRangeToEntity	{Team = "tm_Neutral", Range = 10, TargetTag = "Control_Point05"},			

			},
			Actions = 
			{

			MapFlagSetTrue	{Name = "mf_team1HasPoint5"},
			MapFlagSetFalse	{Name = "mf_team2HasPoint5"},
			-- FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Control_Point05", Range = 10, Height = 100},
			VisualDisplayText {Text= "dom5team1"},
			
			ObjectVanish	{Tag = "Point5_Flag"},
			ObjectSpawn	{ObjectId = 1948, X = 137.865, Y = 209.341, Direction = 90, Tag = "Point5_Flag"},
			MinimapAlertSetToEntity	{Tag = "Control_Point05", Type = 2},
			EffectStart	{Tag = "Point5_Flag", File = "Effect_Spawn_Unit"},
			},
			
		};
		
		
		OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "ownershipChangeToTeam2Point5",
			Conditions = 
			{
				MapFlagIsFalse {Name = "mf_team2HasPoint5"},
				
				FigureTeamIsInRangeToEntity	{Team = "2", Range = 10, TargetTag = "Control_Point05"},
				FigureTeamIsNotInRangeToEntity	{Team = "1", Range = 10, TargetTag = "Control_Point05"},
				--FigureTeamIsNotInRangeToEntity	{Team = "tm_Neutral", Range = 10, TargetTag = "Control_Point05"},
				
			},
			Actions = 
			{
				
			MapFlagSetTrue	{Name = "mf_team2HasPoint5"},
			MapFlagSetFalse	{Name = "mf_team1HasPoint5"},
			VisualDisplayText {Text= "dom5team2"},
			
			ObjectVanish	{Tag = "Point5_Flag"},
			ObjectSpawn	{ObjectId = 1896, X = 137.865, Y = 209.341, Direction = 90, Tag = "Point5_Flag"},
			MinimapAlertSetToEntity	{Tag = "Control_Point05", Type = 2},
			EffectStart	{Tag = "Point5_Flag", File = "Effect_Spawn_Unit"},
			},
			
		};
		
			
		
}
