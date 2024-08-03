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
				
		MapTimerStart	{Name = "mt_Control_Point01Pts"},
		
		MapTimerStart	{Name = "mt_Control_NoPointTeam1"},
		MapTimerStart	{Name = "mt_Control_NoPointTeam2"},
		
		--SetDominationPointControl{Value = 1, Value = 1},
		--SetDominationTeamPoints{Value = 1, Amount = 0},
		--MapValueSet{Name = "mv_team1Points", Value = 1 },

		--MapValueSet{Name = "mv_team2Points", Value = 1 },
		VisualDisplayText {Text= "start2p1d"},
		VisualTimerStart	{Seconds = 1800},	
		
		FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Control_Point01", Range = 15, Height = 100},
		
		},
		
	};
	
	-- resource to team1 (team has 0 node)
	
	OnEvent
		{
			EventName = "giveRestoTeam1",
			Conditions = 
			{
				VisualTimerIsActive	{},
				MapTimerIsElapsed	{Name = "mt_Control_NoPointTeam1", Seconds = 4},
				MapValueIsGreaterOrEqual	{Name = "mv_team1Points", Value = 1 },
				MapFlagIsFalse	{Name = "mf_team1HasPoint1"},
				MapFlagIsFalse	{Name = "mf_gameover"},
			},
			Actions = 
			{
				MapTimerStart	{Name = "mt_Control_NoPointTeam1"},
				TeamResourceStoneGive {Team = "1", Amount = 10}, 
				TeamResourceSilverGive {Team = "1", Amount = 10}, 
				TeamResourceLenyaGive {Team = "1", Amount = 10},				
			},
			
		};
		
		-- resource to team2 (team has 0 node)
	OnEvent
		{
			EventName = "giveRestoTeam2",
			Conditions = 
			{
				VisualTimerIsActive	{},
				MapTimerIsElapsed	{Name = "mt_Control_NoPointTeam2", Seconds = 4},
				MapValueIsGreaterOrEqual	{Name = "mv_team2Points", Value = 1 },
				MapFlagIsFalse	{Name = "mf_team2HasPoint1"},
				MapFlagIsFalse	{Name = "mf_gameover"},
			},
			Actions = 
			{
				MapTimerStart	{Name = "mt_Control_NoPointTeam2"},
				TeamResourceStoneGive {Team = "2", Amount = 10}, 
				TeamResourceSilverGive {Team = "2", Amount = 10}, 
				TeamResourceLenyaGive {Team = "2", Amount = 10},				
			},
			
		};
		
	 --dom points	
		
		OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "giveDomPoint1PtsTeam1",
			Conditions = 
			{
				MapTimerIsElapsed	{Name = "mt_Control_Point01Pts", Seconds = 4},
				MapFlagIsTrue	{Name = "mf_team1HasPoint1"},
				VisualTimerIsActive	{},
				MapFlagIsFalse	{Name = "mf_gameover"},
			},
			Actions = 
			{
			
			MapTimerStart	{Name = "mt_Control_Point01Pts"},
			MapValueAdd	{Name = "mv_team1Points", Value = 10},
			TeamResourceStoneGive {Team = "1", Amount = 20}, 
			TeamResourceSilverGive {Team = "1", Amount = 20}, 
			TeamResourceLenyaGive {Team = "1", Amount = 20}, 
			VisualDisplayText {Text= "giveTeam1"},
			--SetDominationTeamPoints{Value = 0, Amount = 0},
				
			},
			
		};
		
				
		OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "giveDomPoint1PtsTeam2",
			Conditions = 
			{
				MapTimerIsElapsed	{Name = "mt_Control_Point01Pts", Seconds = 4},
				MapFlagIsTrue	{Name = "mf_team2HasPoint1"},			
				VisualTimerIsActive	{},
				MapFlagIsFalse	{Name = "mf_gameover"},
			},
			Actions = 
			{
			
			MapTimerStart	{Name = "mt_Control_Point01Pts"},
			MapValueAdd	{Name = "mv_team2Points", Value = 10},
			TeamResourceStoneGive {Team = "2", Amount = 20}, 
			TeamResourceSilverGive {Team = "2", Amount = 20}, 
			TeamResourceLenyaGive {Team = "2", Amount = 20},
				VisualDisplayText {Text= "giveTeam2"},
				--SetDominationTeamPoints{Value = 1, Amount = 1},
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
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "ownershipChangeToTeam1Point1",
			Conditions = 
			{
			
				MapFlagIsFalse {Name = "mf_team1HasPoint1"},
				
--				OR
	--			{
				FigureTeamIsInRangeToEntity	{Team = "1", Range = 15, TargetTag = "Control_Point01"},
				FigureTeamIsNotInRangeToEntity	{Team = "2", Range = 15, TargetTag = "Control_Point01"},				
				FigureTeamIsNotInRangeToEntity	{Team = "tm_Neutral", Range = 15, TargetTag = "Control_Point01"},
				
				
			},
			Actions = 
			{
			--MapTimerStart	{Name = "centralCapturePoint"},
						
			MapFlagSetTrue	{Name = "mf_team1HasPoint1"},
			MapFlagSetFalse	{Name = "mf_team2HasPoint1"},
			--SetDominationPointControl{Value = 0, Value = 0},
			VisualDisplayText {Text= "dom1team1"},
			-- FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "Control_Point01", Range = 15, Height = 100},
			
			ObjectVanish	{Tag = "Point1_Flag"},
			ObjectSpawn	{ObjectId = 1498, X = 357.521, Y = 370.209, Direction = 0, Tag = "Point1_Flag"},
			MinimapAlertSetToEntity	{Tag = "Control_Point01", Type = 2},
			EffectStart	{Tag = "Point1_Flag", File = "Effect_Spawn_Unit"},
			},
			
		};
		
		
		OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "ownershipChangeToTeam2Point1",
			Conditions = 
			{
				MapFlagIsFalse {Name = "mf_team2HasPoint1"},
				
				FigureTeamIsInRangeToEntity	{Team = "2", Range = 15, TargetTag = "Control_Point01"},
				FigureTeamIsNotInRangeToEntity	{Team = "1", Range = 15, TargetTag = "Control_Point01"},
				FigureTeamIsNotInRangeToEntity	{Team = "tm_Neutral", Range = 15, TargetTag = "Control_Point01"},
				
				

			},
			Actions = 
			{
			--MapTimerStart	{Name = "centralCapturePoint"},
			
			MapFlagSetTrue	{Name = "mf_team2HasPoint1"},
			MapFlagSetFalse	{Name = "mf_team1HasPoint1"},
			--SetDominationPointControl{Value = 0, Value = 1},
			VisualDisplayText {Text= "dom1team2"},
			
			ObjectVanish	{Tag = "Point1_Flag"},
			ObjectSpawn	{ObjectId = 1896, X = 357.521, Y = 370.209, Direction = 0, Tag = "Point1_Flag"},
			MinimapAlertSetToEntity	{Tag = "Control_Point01", Type = 2},
			EffectStart	{Tag = "Point1_Flag", File = "Effect_Spawn_Unit"},
			},
			
		};
				
		
}
