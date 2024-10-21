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
			LeverSetDisabled	{Tag = "MG_NecropolisGate_Switch_01"},
			LeverSetDisabled	{Tag = "MG_NecropolisGate_Switch_02"},
			LeverSetDisabled	{Tag = "MG_NecropolisGate_Switch_03"},
			LeverSetDisabled	{Tag = "MG_NecropolisGate_Switch_04"},
			LeverSetDisabled	{Tag = "MG_NecropolisGate_Switch_05"},
			LeverSetDisabled	{Tag = "MG_NecropolisGate_Switch_06"},
			LeverSetDisabled	{Tag = "MG_NecropolisGate_Switch_07"},	
		},		
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_P502_PuzzleInit"},				
			MapFlagIsFalse	{Name = "mf_P502Torch1On"},				
			MapFlagIsFalse	{Name = "mf_P502Torch2On"},				
			MapFlagIsFalse	{Name = "mf_P502Torch3On"},				
			MapFlagIsFalse	{Name = "mf_P502Torch4On"},				
			MapFlagIsFalse	{Name = "mf_P502Torch5On"},				
			MapFlagIsFalse	{Name = "mf_P502Torch6On"},				
			MapFlagIsFalse	{Name = "mf_P502Torch7On"},
			MapFlagIsFalse	{Name = "mf_P502_Guardian"},				
		},
		Actions =
		{
			MapFlagSetTrue	{Name = "mf_P502OpenNecropolisGate"},		
			MapFlagSetTrue {Name = "mf_P502_LeverStatusChanged"},
		},		
		
		GotoState = "NextPuzzleStart",
	},
}
	
State
{
	StateName = "NextPuzzleStart",
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_P502_LeverStatusChanged"},	-- name to be changed
			MapFlagIsFalse	{Name = "mf_P502Torch1On"},				
			MapFlagIsFalse	{Name = "mf_P502Torch2On"},				
			MapFlagIsFalse	{Name = "mf_P502Torch3On"},				
			MapFlagIsFalse	{Name = "mf_P502Torch4On"},				
			MapFlagIsFalse	{Name = "mf_P502Torch5On"},				
			MapFlagIsFalse	{Name = "mf_P502Torch6On"},				
			MapFlagIsFalse	{Name = "mf_P502Torch7On"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P502_LeverStatusChanged"},
		},		
		GotoState = "RespawnAllGardian",
	},
	
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_P502_LeverStatusChanged"},	-- name to be changed
			MapFlagIsFalse	{Name = "mf_P502Torch1On"},				
			MapFlagIsFalse	{Name = "mf_P502Torch2On"},				
			MapFlagIsFalse	{Name = "mf_P502Torch3On"},				
			MapFlagIsTrue	{Name = "mf_P502Torch4On"},				
			MapFlagIsFalse	{Name = "mf_P502Torch5On"},				
			MapFlagIsFalse	{Name = "mf_P502Torch6On"},				
			MapFlagIsFalse	{Name = "mf_P502Torch7On"},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P502_LeverStatusChanged"},
		},		
		GotoState = "PuzzleDone",
	},
	
	OnEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag = "Necropolis_Gardian_01"},
			FigureIsDead	{Tag = "Necropolis_Gardian_02"},
			FigureIsDead	{Tag = "Necropolis_Gardian_03"},
			FigureIsDead	{Tag = "Necropolis_Gardian_04"},
			FigureIsDead	{Tag = "Necropolis_Gardian_05"},
			FigureIsDead	{Tag = "Necropolis_Gardian_06"},
			FigureIsDead	{Tag = "Necropolis_Gardian_07"},
		},
		Actions =
		{
			--MapFlagSetFalse {Name = "mf_P502_LeverStatusChanged"},
		},		
		GotoState = "AllGardianKilled",
	},
	
	OnEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_P502_LeverStatusChanged"},	-- name to be changed
			OR
			{
				MapFlagIsTrue	{Name = "mf_P502Torch1On"},				
				MapFlagIsTrue	{Name = "mf_P502Torch2On"},				
				MapFlagIsTrue	{Name = "mf_P502Torch3On"},				
				MapFlagIsTrue	{Name = "mf_P502Torch5On"},				
				MapFlagIsTrue	{Name = "mf_P502Torch6On"},				
				MapFlagIsTrue	{Name = "mf_P502Torch7On"},
			},
		},
		Actions =
		{
			MapFlagSetFalse {Name = "mf_P502_LeverStatusChanged"},
			EntityValueSet	{Name = "ev_P502_GardianToBeRefreshed", Value = 1},
		},		
		GotoState = "RefreshGardianPresence",
	},
	
}
	

State
{
	StateName = "RespawnAllGardian",
	OnEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			FigureVanish {Tag = "Necropolis_Gardian_01"},
			FigureRespawnToEntity	{Tag = "Necropolis_Gardian_01" , TargetTag = "Necropolis_Gardian_Marker_01" },
			FigureVanish {Tag = "Necropolis_Gardian_02"},
			FigureRespawnToEntity	{Tag = "Necropolis_Gardian_02" , TargetTag = "Necropolis_Gardian_Marker_02" },	
			FigureVanish {Tag = "Necropolis_Gardian_03"},
			FigureRespawnToEntity	{Tag = "Necropolis_Gardian_03" , TargetTag = "Necropolis_Gardian_Marker_03" },	
			FigureVanish {Tag = "Necropolis_Gardian_04"},
			FigureRespawnToEntity	{Tag = "Necropolis_Gardian_04" , TargetTag = "Necropolis_Gardian_Marker_04" },	
			FigureVanish {Tag = "Necropolis_Gardian_05"},
			FigureRespawnToEntity	{Tag = "Necropolis_Gardian_05" , TargetTag = "Necropolis_Gardian_Marker_05" },	
			FigureVanish {Tag = "Necropolis_Gardian_06"},
			FigureRespawnToEntity	{Tag = "Necropolis_Gardian_06" , TargetTag = "Necropolis_Gardian_Marker_06" },	
			FigureVanish {Tag = "Necropolis_Gardian_07"},
			FigureRespawnToEntity	{Tag = "Necropolis_Gardian_07" , TargetTag = "Necropolis_Gardian_Marker_07" },
		},		
		GotoState = "NextPuzzleStart",
	},
}
	
State
{
	StateName = "PuzzleDone",
	OnEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			FigureVanish {Tag = "Necropolis_Gardian_01"},
			FigureVanish {Tag = "Necropolis_Gardian_02"},
			FigureVanish {Tag = "Necropolis_Gardian_03"},
			FigureVanish {Tag = "Necropolis_Gardian_04"},
			FigureVanish {Tag = "Necropolis_Gardian_05"},
			FigureVanish {Tag = "Necropolis_Gardian_06"},
			FigureVanish {Tag = "Necropolis_Gardian_07"},
			
			AvatarXPGive	{ Amount = 4000 },
			MapFlagSetTrue	{Name = "mf_P502_GuardianXPGiven"},
		},		
		GotoState = "PuzzleEnded",
	},
}

State
{
	StateName = "AllGardianKilled",
	OnEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			AvatarXPGive	{ Amount = 2000 },
			MapFlagSetTrue	{Name = "mf_P502_GuardianXPGiven"},
		},		
		GotoState = "PuzzleEnded",
	},
}
	

State
{
	StateName = "RefreshGardianPresence",
	
	--------------------------------------------------------------------------------------------------
	OnEvent
	{
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P502_GardianToBeRefreshed", Value = 1},
			MapFlagIsFalse	{Name = "mf_P502Torch1On"},
		},
		Actions =
		{
				FigureVanish {Tag = "Necropolis_Gardian_01"},
				EntityValueAdd	{Name = "ev_P502_GardianToBeRefreshed", Value = 1},
		},		
	},
	
	OnEvent
	{
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P502_GardianToBeRefreshed", Value = 1},
			MapFlagIsTrue	{Name = "mf_P502Torch1On"},
		},
		Actions =
		{
				FigureVanish {Tag = "Necropolis_Gardian_01"},
				FigureRespawnToEntity	{Tag = "Necropolis_Gardian_01" , TargetTag = "Necropolis_Gardian_Marker_01" },
				EntityValueAdd	{Name = "ev_P502_GardianToBeRefreshed", Value = 1},
		},		
	},
	--------------------------------------------------------------------------------------------------	
	
		OnEvent
	{
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P502_GardianToBeRefreshed", Value = 2},
			MapFlagIsFalse	{Name = "mf_P502Torch2On"},
		},
		Actions =
		{
				FigureVanish {Tag = "Necropolis_Gardian_02"},
				EntityValueAdd	{Name = "ev_P502_GardianToBeRefreshed", Value = 1},
		},		
	},
	
	OnEvent
	{
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P502_GardianToBeRefreshed", Value = 2},
			MapFlagIsTrue	{Name = "mf_P502Torch2On"},
		},
		Actions =
		{
				FigureVanish {Tag = "Necropolis_Gardian_02"},
				FigureRespawnToEntity	{Tag = "Necropolis_Gardian_02" , TargetTag = "Necropolis_Gardian_Marker_02" },
				EntityValueAdd	{Name = "ev_P502_GardianToBeRefreshed", Value = 1},
		},		
	},
	--------------------------------------------------------------------------------------------------
	
		OnEvent
	{
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P502_GardianToBeRefreshed", Value = 3},
			MapFlagIsFalse	{Name = "mf_P502Torch3On"},
		},
		Actions =
		{
				FigureVanish {Tag = "Necropolis_Gardian_03"},
				EntityValueAdd	{Name = "ev_P502_GardianToBeRefreshed", Value = 1},
		},		
	},
	
	OnEvent
	{
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P502_GardianToBeRefreshed", Value = 3},
			MapFlagIsTrue	{Name = "mf_P502Torch3On"},
		},
		Actions =
		{
				FigureVanish {Tag = "Necropolis_Gardian_03"},
				FigureRespawnToEntity	{Tag = "Necropolis_Gardian_03" , TargetTag = "Necropolis_Gardian_Marker_03" },
				EntityValueAdd	{Name = "ev_P502_GardianToBeRefreshed", Value = 1},
		},		
	},
	--------------------------------------------------------------------------------------------------
	
		OnEvent
	{
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P502_GardianToBeRefreshed", Value = 4},
			MapFlagIsFalse	{Name = "mf_P502Torch4On"},
		},
		Actions =
		{
				FigureVanish {Tag = "Necropolis_Gardian_04"},
				EntityValueAdd	{Name = "ev_P502_GardianToBeRefreshed", Value = 1},
		},		
	},
	
	OnEvent
	{
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P502_GardianToBeRefreshed", Value = 4},
			MapFlagIsTrue	{Name = "mf_P502Torch4On"},
		},
		Actions =
		{
				FigureVanish {Tag = "Necropolis_Gardian_04"},
				FigureRespawnToEntity	{Tag = "Necropolis_Gardian_04" , TargetTag = "Necropolis_Gardian_Marker_04" },
				EntityValueAdd	{Name = "ev_P502_GardianToBeRefreshed", Value = 1},
		},		
	},
	--------------------------------------------------------------------------------------------------
	
		OnEvent
	{
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P502_GardianToBeRefreshed", Value = 5},
			MapFlagIsFalse	{Name = "mf_P502Torch5On"},
		},
		Actions =
		{
				FigureVanish {Tag = "Necropolis_Gardian_05"},
				EntityValueAdd	{Name = "ev_P502_GardianToBeRefreshed", Value = 1},
		},		
	},
	
	OnEvent
	{
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P502_GardianToBeRefreshed", Value = 5},
			MapFlagIsTrue	{Name = "mf_P502Torch5On"},
		},
		Actions =
		{
				FigureVanish {Tag = "Necropolis_Gardian_05"},
				FigureRespawnToEntity	{Tag = "Necropolis_Gardian_05" , TargetTag = "Necropolis_Gardian_Marker_05" },
				EntityValueAdd	{Name = "ev_P502_GardianToBeRefreshed", Value = 1},
		},		
	},
	--------------------------------------------------------------------------------------------------
	
		OnEvent
	{
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P502_GardianToBeRefreshed", Value = 6},
			MapFlagIsFalse	{Name = "mf_P502Torch6On"},
		},
		Actions =
		{
				FigureVanish {Tag = "Necropolis_Gardian_06"},
				EntityValueAdd	{Name = "ev_P502_GardianToBeRefreshed", Value = 1},
		},		
	},
	
	OnEvent
	{
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P502_GardianToBeRefreshed", Value = 6},
			MapFlagIsTrue	{Name = "mf_P502Torch6On"},
		},
		Actions =
		{
				FigureVanish {Tag = "Necropolis_Gardian_06"},
				FigureRespawnToEntity	{Tag = "Necropolis_Gardian_06" , TargetTag = "Necropolis_Gardian_Marker_06" },
				EntityValueAdd	{Name = "ev_P502_GardianToBeRefreshed", Value = 1},
		},		
	},
	--------------------------------------------------------------------------------------------------
	
		OnEvent
	{
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P502_GardianToBeRefreshed", Value = 7},
			MapFlagIsFalse	{Name = "mf_P502Torch7On"},
		},
		Actions =
		{
				FigureVanish {Tag = "Necropolis_Gardian_07"},
				EntityValueAdd	{Name = "ev_P502_GardianToBeRefreshed", Value = 1},
		},		
		GotoState = "NextPuzzleStart",	
	},
	
	OnEvent
	{
		Conditions =
		{
			EntityValueIsEqual {Name = "ev_P502_GardianToBeRefreshed", Value = 7},
			MapFlagIsTrue	{Name = "mf_P502Torch7On"},
		},
		Actions =
		{
				FigureVanish {Tag = "Necropolis_Gardian_07"},
				FigureRespawnToEntity	{Tag = "Necropolis_Gardian_07" , TargetTag = "Necropolis_Gardian_Marker_07" },
				EntityValueSet	{Name = "ev_P502_GardianToBeRefreshed", Value = 0},
		},		
		GotoState = "NextPuzzleStart",	
	},
}
	
	
State
{
	StateName = "PuzzleEnded",
}

