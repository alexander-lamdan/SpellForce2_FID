--domPoint1, domPoint2 and domPoint3 are the 3 dompoints here. there are 2 teams with 2 players each in them.

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
		
		
		
		BuildingAbilityAdd	{Tag = "domPoint1", AbilityId = Ability.ImmuneProjectile},
		BuildingAbilityAdd	{Tag = "domPoint1", AbilityId = Ability.ImmunePhysical},
		
		BuildingAbilityAdd	{Tag = "domPoint2", AbilityId = Ability.ImmuneProjectile},
		BuildingAbilityAdd	{Tag = "domPoint2", AbilityId = Ability.ImmunePhysical},
		
		BuildingAbilityAdd	{Tag = "domPoint3", AbilityId = Ability.ImmuneProjectile},
		BuildingAbilityAdd	{Tag = "domPoint3", AbilityId = Ability.ImmunePhysical},
		
		BuildingAbilityAdd	{Tag = "domPoint1", AbilityId = Ability.Immortal},
		BuildingAbilityAdd	{Tag = "domPoint2", AbilityId = Ability.Immortal},
		BuildingAbilityAdd	{Tag = "domPoint3", AbilityId = Ability.Immortal},
		
		MapTimerStart	{Name = "mt_domPoint1Pts"},
		MapTimerStart	{Name = "mt_domPoint2Pts"},
		MapTimerStart	{Name = "mt_domPoint3Pts"},
		
		--SetDominationPointControl{Value = 1, Value = 1},
		--SetDominationTeamPoints{Value = 1, Amount = 0},
		--MapValueSet{Name = "mv_team1Points", Value = 1 },

		--MapValueSet{Name = "mv_team2Points", Value = 1 },
		VisualDisplayText {Text= "start2p3d"},
		
		

		
		},
		
	};
	
	OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "giveDomPoint1PtsTeam1",
			Conditions = 
			{
				MapTimerIsElapsed	{Name = "mt_domPoint1Pts", Seconds = 10},
				MapFlagIsTrue	{Name = "mf_team1HasPoint1"},
				
			

			},
			Actions = 
			{
			
			MapTimerStart	{Name = "mt_domPoint1Pts"},
			MapValueAdd	{Name = "mv_team1Points", Value = 1},
			VisualDisplayText {Text= "giveTeam1"},
			--SetDominationTeamPoints{Value = 0, Amount = 0},
				
			},
			
		};
		
		
		OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "giveDomPoint2PtsTeam1",
			Conditions = 
			{
				MapTimerIsElapsed	{Name = "mt_domPoint2Pts", Seconds = 10},
				MapFlagIsTrue {Name = "mf_team1HasPoint2"},
			

			},
			Actions = 
			{
			
			MapTimerStart	{Name = "mt_domPoint2Pts"},
			MapValueAdd	{Name = "mv_team1Points", Value = 1},
			VisualDisplayText {Text= "giveTeam1"},
			--SetDominationTeamPoints{Value = 1, Amount = 0},
				
			},
		};
		
		OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "giveDomPoint3PtsTeam1",
			Conditions = 
			{
				MapTimerIsElapsed	{Name = "mt_domPoint3Pts", Seconds = 10},
				MapFlagIsTrue {Name = "mf_team1HasPoint3"},
				
			

			},
			Actions = 
			{
			
			MapTimerStart	{Name = "mt_domPoint3Pts"},
			MapValueAdd	{Name = "mv_team1Points", Value = 1},
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
				MapTimerIsElapsed	{Name = "mt_domPoint1Pts", Seconds = 10},
				MapFlagIsTrue	{Name = "mf_team2HasPoint1"},
				
			

			},
			Actions = 
			{
			
			MapTimerStart	{Name = "mt_domPoint1Pts"},
			MapValueAdd	{Name = "mv_team2Points", Value = 1},
				VisualDisplayText {Text= "giveTeam2"},
				--SetDominationTeamPoints{Value = 1, Amount = 1},
			},
			
		};
		
		
		OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "giveDomPoint2PtsTeam2",
			Conditions = 
			{
				MapTimerIsElapsed	{Name = "mt_domPoint2Pts", Seconds = 10},
				MapFlagIsTrue {Name = "mf_team1HasPoint2"},
				--OR
			

			},
			Actions = 
			{
			
			MapTimerStart	{Name = "mt_domPoint2Pts"},
			MapValueAdd	{Name = "mv_team2Points", Value = 1},
			VisualDisplayText {Text= "giveTeam2"},

			--SetDominationTeamPoints{Value = 0, Amount = 1},
				
				
			},
		};
			
		OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "giveDomPoint3PtsTeam2",
			Conditions = 
			{
				MapTimerIsElapsed	{Name = "mt_domPoint3Pts", Seconds = 10},
				MapFlagIsTrue {Name = "mf_team2HasPoint3"},
				

			},
			Actions = 
			{
			
			MapTimerStart	{Name = "mt_domPoint3Pts"},
			MapValueAdd	{Name = "mv_team2Points", Value = 1},
			
			VisualDisplayText {Text= "giveTeam2"},
			--SetDominationTeamPoints{Value = 1, Amount = 1},

				
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
				FigureTeamIsInRangeToEntity	{Team = "tm_team1", Range = 30, TargetTag = "domPoint1"},
				FigureTeamIsNotInRangeToEntity	{Team = "tm_team2", Range = 30, TargetTag = "domPoint1"},				
				FigureTeamIsNotInRangeToEntity	{Team = "tm_Neutral", Range = 20, TargetTag = "domPoint1"},
				
				
			},
			Actions = 
			{
			--MapTimerStart	{Name = "centralCapturePoint"},
			
			
			MapFlagSetTrue	{Name = "mf_team1HasPoint1"},
			MapFlagSetFalse	{Name = "mf_team2HasPoint1"},
			--SetDominationPointControl{Value = 0, Value = 0},
			VisualDisplayText {Text= "dom1team1"},
			FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "domPoint1", Range = 20, Height = 100},
		
			},
			
		};
		
		
		OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "ownershipChangeToTeam2Point1",
			Conditions = 
			{
				MapFlagIsFalse {Name = "mf_team2HasPoint1"},
				
				FigureTeamIsInRangeToEntity	{Team = "tm_team2", Range = 30, TargetTag = "domPoint1"},
				FigureTeamIsNotInRangeToEntity	{Team = "tm_team1", Range = 30, TargetTag = "domPoint1"},
				FigureTeamIsNotInRangeToEntity	{Team = "tm_Neutral", Range = 20, TargetTag = "domPoint1"},
				
				

			},
			Actions = 
			{
			--MapTimerStart	{Name = "centralCapturePoint"},
			
			MapFlagSetTrue	{Name = "mf_team2HasPoint1"},
			MapFlagSetFalse	{Name = "mf_team1HasPoint1"},
			--SetDominationPointControl{Value = 0, Value = 1},
			VisualDisplayText {Text= "dom1team2"},
			
			
			},
			
		};
		
		
		
		
		OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "ownershipChangeToTeam1Point2",
			Conditions = 
			{
				--PlayerHasNotBuilding	{Player = "pl_Player 1", BuildingId = 84, UpgradeId = default, Amount = 1, OnlyCompleted = default},
				--PlayerHasNotBuilding	{Player = "pl_Player 2", BuildingId = 84, UpgradeId = default, Amount = 1, OnlyCompleted = default},
				MapFlagIsFalse {Name = "mf_team1HasPoint2"},
				
				FigureTeamIsInRangeToEntity	{Team = "tm_team1", Range = 30, TargetTag = "domPoint2"},				
				FigureTeamIsNotInRangeToEntity	{Team = "tm_team2", Range = 30, TargetTag = "domPoint2"},
				FigureTeamIsNotInRangeToEntity	{Team = "tm_Neutral", Range = 20, TargetTag = "domPoint2"},
				
				
				

			},
			Actions = 
			{
			--MapTimerStart	{Name = "centralCapturePoint"},
			
			
			MapFlagSetTrue	{Name = "mf_team1HasPoint2"},
			MapFlagSetFalse	{Name = "mf_team2HasPoint2"},
			--SetDominationPointControl{Value = 1, Value = 0},
			FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "domPoint2", Range = 20, Height = 100},
			VisualDisplayText {Text= "dom2team1"},
		
			},
			
		};
		
		
		OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "ownershipChangeToTeam2Point2",
			Conditions = 
			{
				MapFlagIsFalse {Name = "mf_team2HasPoint2"},
				
				
				FigureTeamIsInRangeToEntity	{Team = "tm_team2", Range = 30, TargetTag = "domPoint2"},
				FigureTeamIsNotInRangeToEntity	{Team = "tm_team1", Range = 30, TargetTag = "domPoint2"},
				FigureTeamIsNotInRangeToEntity	{Team = "tm_Neutral", Range = 20, TargetTag = "domPoint2"},
			
			},
			Actions = 
			{
			--MapTimerStart	{Name = "centralCapturePoint"},
			
			MapFlagSetTrue	{Name = "mf_team2HasPoint2"},
			MapFlagSetFalse	{Name = "mf_team1HasPoint2"},
			--SetDominationPointControl{Value = 1, Value = 1},
			VisualDisplayText {Text= "dom2team2"},
			--FigureOutcry	{TextTag = "Avatar1", Tag = "default"},
			},
			
		};
		
		
		
		OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "ownershipChangeToTeam1Point3",
			Conditions = 
			{
				--PlayerHasNotBuilding	{Player = "pl_Player 1", BuildingId = 84, UpgradeId = default, Amount = 1, OnlyCompleted = default},
				--PlayerHasNotBuilding	{Player = "pl_Player 2", BuildingId = 84, UpgradeId = default, Amount = 1, OnlyCompleted = default},
				MapFlagIsFalse {Name = "mf_team1HasPoint3"},
				
--				OR
	--			{
				FigureTeamIsInRangeToEntity	{Team = "tm_team1", Range = 30, TargetTag = "domPoint3"},
				FigureTeamIsNotInRangeToEntity	{Team = "tm_team2", Range = 30, TargetTag = "domPoint3"},
				
				FigureTeamIsNotInRangeToEntity	{Team = "tm_Neutral", Range = 20, TargetTag = "domPoint3"},
				
				
				

			},
			Actions = 
			{
			--MapTimerStart	{Name = "centralCapturePoint"},
			
			--SetDominationPointControl{Value = 2, Value = 0},
			MapFlagSetTrue	{Name = "mf_team1HasPoint3"},
			MapFlagSetFalse	{Name = "mf_team2HasPoint3"},
			FogOfWarRevealAtEntity	{FogOfWarId = 0, Tag = "domPoint3", Range = 20, Height = 100},
			VisualDisplayText {Text= "dom3team1"},
			},
			
		};
		
		
		OnEvent
		{
			--EventName = "GotoState_" .. sNextGestaltState,
			EventName = "ownershipChangeToTeam2Point3",
			Conditions = 
			{
				MapFlagIsFalse {Name = "mf_team2HasPoint3"},
				
				FigureTeamIsInRangeToEntity	{Team = "tm_team2", Range = 30, TargetTag = "domPoint3"},
				FigureTeamIsNotInRangeToEntity	{Team = "tm_team1", Range = 30, TargetTag = "domPoint3"},
				FigureTeamIsNotInRangeToEntity	{Team = "tm_Neutral", Range = 20, TargetTag = "domPoint3"},
				
			},
			Actions = 
			{
			--MapTimerStart	{Name = "centralCapturePoint"},
			
			MapFlagSetTrue	{Name = "mf_team2HasPoint3"},
			MapFlagSetFalse	{Name = "mf_team1HasPoint3"},
			--SetDominationPointControl{Value = 2, Value = 1},
			VisualDisplayText {Text= "dom3team2"},
			
			},
			
		};
		
		
		
		
		
		
}
