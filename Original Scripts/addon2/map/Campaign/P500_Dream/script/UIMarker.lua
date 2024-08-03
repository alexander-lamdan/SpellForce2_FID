--------------------------------------------------
-------------Dream Tutorials-----------------
--------------------------------------------------
--MapFlagIsTrue	{Name = "mf_P500_WideScreen"},


local MinimapMarker = 1
local buttonsize = 43

State
{
	StateName = "INIT",
	
	-- Marker Log
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 1},
			TutorialTextIsFinished {Take = 1},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 846, Top = 27, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 1},
		}
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 1},
			TutorialTextIsFinished {Take = 2},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 2},
		}
	},
	
	-- Avatar select early out
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 3},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 2},
			ObjectVanish	{Tag = "DR_TutorialEffect01"},
		}
	},
	
	-- Avatar select effect on
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 2},
			TutorialTaskTextIsOnScreen {Take = 3},
		},
		Actions =
		{
			ObjectSpawnToEntity	{ObjectId = 1336, TargetTag = "pl_HumanAvatar", Direction = 0, Tag = "DR_TutorialEffect01"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 2},
		}
	},
	
	-- Avatar select effect off 
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 2},
			FigureIsSelected	{Tag = "pl_HumanAvatar"},
		},
		Actions =
		{
			ObjectVanish	{Tag = "DR_TutorialEffect01"},
			MapValueSet	{Name = "mv_P500_Marker", Value = 3},
		}
	},
	
	-- WInfo window - when player skip the info
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 5},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 3},
			TutorialUIPointerHide {},
		}
	},
	-- Inforamtion window on left bottom (arrow) on / Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 3},
			TutorialTaskTextIsOnScreen {Take = 5},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 150, Top = 521, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 3},
		}
	},
	
	-- Inforamtion window on left bottom (arrow) on / non Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 3},
			TutorialTaskTextIsOnScreen {Take = 5},
			MapFlagIsFalse {Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 200, Top = 521, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 3},
		}
	},
	
	--Inforamtion window on left bottom (arrow) off
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 3},
			TutorialTaskTextIsNotOnScreen {Take = 5},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 4},
		}
	},
	
	-- Minimap - when player skip the info
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 9},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 4},
			TutorialUIPointerHide {},
		}
	},
	-- Minimap arrow on / Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 4},
			TutorialTaskTextIsOnScreen {Take = 9},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 810, Top = 521, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_down"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 4},
		}
	},
	
	-- Minimap arrow on / non Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 4},
			TutorialTaskTextIsOnScreen {Take = 9},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 765, Top = 521, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_down"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 4},
		}
	},
	-- Minimap arrow off
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 4},
			TutorialTaskTextIsNotOnScreen {Take = 9},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 5},
		}
	},
	
	-- Avatar icon select - when player skip the info
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 11},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 5},
			TutorialUIPointerHide {},
		}
	},
	-- Avatar icon select arrow on
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 5},
			TutorialTaskTextIsOnScreen {Take = 11},
		},
		Actions =
		{
			TutorialUIPointerShow { Left = 58, Top = 94, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 5},
		}
	},
	-- Avatar icon select arrow off
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 5},
			TutorialStateIsSet	{TutorialState = AvatarPortraitButtonClicked},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 6},
		}
	},
	
	-- When player skip and previous marker clear
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 25},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 6},
			TutorialUIPointerHide {},
		}
	},
	-- Level up cross icon marker / Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 6},
			TutorialTaskTextIsOnScreen {Take = 25},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 910, Top = 90, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 6},
		}
	},
	-- Level up cross icon marker / non Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 6},
			TutorialTaskTextIsOnScreen {Take = 25},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 890, Top = 90, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 6},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 6},
			DialogEquipmentIsVisible {},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P500_PlusMarkerDeleteable"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 6},
			DialogInventoryIsNotVisible {},
			EntityFlagIsTrue {Name = "ef_P500_PlusMarkerDeleteable"},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 7},
		}
	},
	--
	-- Text skip before skilltree tuto
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AvatarHasSkill {Skill = 75}, -- Magic skill 
				AvatarHasSkill {Skill = 6}, -- Combat skill
				TutorialTaskTextIsOnScreen {Take = 27},
			}
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 7},
			TutorialUIPointerHide {},
		}
	},
	-- Combat Shaikan and magic trees pointer blinking / Wide
	OnToggleEvent
	{
		OnConditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 7},
			TutorialTaskTextIsOnScreen {Take = 27},
			DialogSkillTreeIsVisible	{},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		OnActions =
		{
			EntityTimerStart {Name = "et_P500_Blink"},
			TutorialUIPointerShow {Left = 370, Top = 160, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
		},
		OffConditions =
		{
			DialogSkillTreeIsNotVisible	{},
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 7},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		OffActions =
		{
			TutorialUIPointerHide {},
			EntityTimerStop {Name = "et_P500_Blink"},
		}
	},
	
	-- Combat Shaikan and magic trees pointer blinking / non Wide
	OnToggleEvent
	{
		OnConditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 7},
			TutorialTaskTextIsOnScreen {Take = 27},
			DialogSkillTreeIsVisible	{},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		OnActions =
		{
			EntityTimerStart {Name = "et_P500_Blink"},
			TutorialUIPointerShow {Left = 495, Top = 160, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
		},
		OffConditions =
		{
			DialogSkillTreeIsNotVisible	{},
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 7},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		OffActions =
		{
			TutorialUIPointerHide {},
			EntityTimerStop {Name = "et_P500_Blink"},
		}
	},
	-- toggle / Wide
	OnToggleEvent
	{
		OnConditions =
		{
			EntityTimerIsElapsed {Name = "et_P500_Blink", Seconds = 2},
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 7},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		OnActions =
		{
			TutorialUIPointerShow {Left = 510, Top = 160, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 7},
		},
		OffConditions =
		{
			EntityTimerIsElapsed {Name = "et_P500_Blink", Seconds = 4},
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 7},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		OffActions =
		{
			TutorialUIPointerShow {Left = 370, Top = 160, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			EntityTimerStart {Name = "et_P500_Blink"},
		},
	},
	
	-- toggle / non Wide
	OnToggleEvent
	{
		OnConditions =
		{
			EntityTimerIsElapsed {Name = "et_P500_Blink", Seconds = 2},
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 7},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		OnActions =
		{
			TutorialUIPointerShow {Left = 680, Top = 160, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 7},
		},
		OffConditions =
		{
			EntityTimerIsElapsed {Name = "et_P500_Blink", Seconds = 4},
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 7},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		OffActions =
		{
			TutorialUIPointerShow {Left = 495, Top = 160, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			EntityTimerStart {Name = "et_P500_Blink"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AND
				{
					MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 7},
					TutorialTaskTextIsOnScreen {Take = 31},
				},
				DialogSkillTreeIsNotVisible	{},
			},
			
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 8},
			TutorialUIPointerHide {},
			EntityTimerStop {Name = "et_P500_Blink"},
		}
	},
	
	--Text skip before skillpoint assign tuto
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 31},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 8},
			TutorialUIPointerHide {},
		}
	},
	-- Point assigment marker combat or magic / Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 8},
			TutorialTaskTextIsOnScreen {Take = 31},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 440, Top = 234, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 8},
		}
	},
	
	-- Point assigment marker combat or magic / non Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 8},
			TutorialTaskTextIsOnScreen {Take = 31},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 585, Top = 234, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 8},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 8},
			HeroHasNoSkillPointsLeft {Hero = 0},
			OR
			{
				AvatarHasSkill {Skill = 75}, -- Magic basic skill
				AvatarHasSkill {Skill = 6} -- Combat basic skill
			}
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 9},
		}
	},
	
		-- Early Out, when player close the skilltree
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 31},
			DialogSkillTreeIsNotVisible	{},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 9},
			TutorialUIPointerHide {},
		}
	},

	
	
		-- Early Out, when player skip text
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 33},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 9},
			TutorialUIPointerHide {},
		}
	},
	-- Early out, when player close the skilltree
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 9},
			DialogEquipmentIsNotVisible	{},
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},

	--  Health marker / Wide 
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 9},
			TutorialTaskTextIsOnScreen {Take = 33},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 80, Top = 448, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 9},
			EntityTimerStart {Name = "et_P500_ManaLive"},
		}
	},
	--  Health marker / non Wide 
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 9},
			TutorialTaskTextIsOnScreen {Take = 33},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 100, Top = 448, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 9},
			EntityTimerStart {Name = "et_P500_ManaLive"},
		}
	},
	-- manna mark / Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P500_ManaLive", Seconds = 3},
			DialogEquipmentIsVisible {},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 160, Top = 448, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			EntityTimerStop {Name = "et_P500_ManaLive"},
			EntityFlagSetTrue {Name = "ef_ManaMarkerEarlyOut"}
		},
	},
	-- manna mark / non Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_P500_ManaLive", Seconds = 3},
			DialogEquipmentIsVisible {},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 205, Top = 448, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			EntityTimerStop {Name = "et_P500_ManaLive"},
			EntityFlagSetTrue {Name = "ef_ManaMarkerEarlyOut"}
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 9},
			TutorialTaskTextIsNotOnScreen {Take = 33},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 10},
		}
	},
	-- Early out, player close the equipmnet window
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 9},
			DialogEquipmentIsNotVisible	{},
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, when the player opens the equipmentw again
	OnOneTimeEvent
	{
		Conditions =
		{
			DialogEquipmentIsNotVisible	{},
			EntityFlagIsTrue {Name = "ef_ManaMarkerEarlyOut"}
		},
		Actions =
		{
			TutorialUIPointerHide {},
		},
	},
	-- Early Out, when next text is on screen
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 34},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 10},
			TutorialUIPointerHide {},
		}
	},
	-- Close the equipment window
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 10},
			TutorialTaskTextIsOnScreen {Take = 34},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 50, Top = 26, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 10},
			EntityTimerStop {Name = "et_P500_ManaLive"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 10},
			DialogEquipmentIsNotVisible	{},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 11},
		}
	},
	---
	-- Early Out, when player skip the prev tuto info
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 64},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 11},
			TutorialUIPointerHide {},
		}
	},
	-- Marker Questbook
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 11},
			TutorialTaskTextIsOnScreen {Take = 64},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 94, Top = 26, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 11},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 11},
			DialogQuestBookIsVisible {},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 12},
		}
	},
	-- Early Out, when player skip the tuto info
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 66},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 12},
			TutorialUIPointerHide {},
		}
	},
	-- Marker Quesbook/Quest details / Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 12},
			TutorialTaskTextIsOnScreen {Take = 66},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 140, Top = 275, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 12},
		}
	},
	-- Marker Quesbook/Quest details / non Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 12},
			TutorialTaskTextIsOnScreen {Take = 66},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 190, Top = 275, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 12},
		}
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 12},
			DialogQuestBookDescriptionIsVisible	{},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 13},
		}
	},
	-- Early Out, when player close the questbook
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 12},
			DialogQuestBookIsNotVisible	{},
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, when player skip the tuto info
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 67},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 13},
			TutorialUIPointerHide {},
		}
	},
	-- Quest Minimapmarker 
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 13},
			TutorialTaskTextIsOnScreen {Take = 67},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 884, Top = 606, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 13},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 13},
			TutorialTaskTextIsNotOnScreen {Take = 67},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 14},
		}
	},
	
	-- Early Out,when the player skip the tuto info
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 69},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 14},
			TutorialUIPointerHide {},
		}
	},
	-- quest book close
	-- Early Out, when new text is on screen
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 68},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 14},
			TutorialUIPointerHide {},
		}
	},
	-- Close the quest book window
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 14},
			TutorialTaskTextIsOnScreen {Take = 68},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 94, Top = 26, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 14},
			EntityTimerStop {Name = "et_P500_ManaLive"},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 14},
			DialogQuestBookIsNotVisible	{},
			DialogQuestBookDescriptionIsNotVisible	{},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 15},
		}
	},
	--------------------------------------------------------
	-- Resurrect
	--------------------------------------------------------
	-- if player resurrected Antara earlier
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 15},
			MapFlagIsTrue	{Name = "mf_P500_ResurrectTutorialStarted"},
			FigureIsAlive {Tag = "pl_HumanHeroAntara"},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 15},
			MapValueSet	{Name = "mv_P500_Marker", Value = 16},
		}
	},
	
	-- Dying marker
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 15},
			MapFlagIsTrue	{Name = "mf_P500_ResurrectTutorialStarted"},
			FigureIsDead {Tag = "pl_HumanHeroAntara"},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			ObjectSpawnToEntity	{ObjectId = 1336, TargetTag = "pl_HumanHeroAntara_DEAD", Direction = 0, Tag = "DR_TutorialEffect03"},
			TutorialUIPointerShow {Left = 115, Top = 95, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 15},
		}
	},
	
	OnToggleEvent
	{
		
		OnConditions = 
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 15},
			FigureIsSelected {Tag = "pl_HumanHeroAntara_DEAD"},
		},
		OnActions = 
		{
			TutorialUIPointerHide {},
			TutorialUIPointerShow {Left = 53, Top = 145, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
		},
		OffConditions = 
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 15},
			FigureIsNotSelected {Tag = "pl_HumanHeroAntara_DEAD"},
		},
		OffActions = 
		{
			TutorialUIPointerHide {},
			TutorialUIPointerShow {Left = 115, Top = 95, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 15},
			FigureIsAlive {Tag = "pl_HumanHeroAntara"},
		},
		Actions =
		{
			ObjectVanish	{Tag = "DR_TutorialEffect03"},
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 16},
		}
	},
	
	-----------------------------------------------------
	-- Loot and inventory
	-----------------------------------------------------
	-- Early Out, new task is on screen - prev ui hide
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 43},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 16},
			TutorialUIPointerHide {},
		}
	},
	-- Marker Lootwindow / wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 16},
			TutorialTaskTextIsOnScreen {Take = 43},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 900, Top = 220, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 16},
		}
	},
	-- Marker Lootwindow / non wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 16},
			TutorialTaskTextIsOnScreen {Take = 43},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 880, Top = 210, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 16},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 16},
			AvatarHasItemEquipment {ItemId = 1282, Amount = 1},
			AvatarHasItemEquipment {ItemId = 490, Amount = 1},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 17},
		}
	},
	
	-- Early Out, when player close the loot before  pick up
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 16},
			DialogLootIsNotVisible	{},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 17},
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, earlier ui hide if palyer skip the info
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 44},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 17},
			TutorialUIPointerHide {},
		}
	},
	-- Bag mrker
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 17},
			TutorialTaskTextIsOnScreen {Take = 44},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 50, Top = 30, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 17},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 17},
			DialogEquipmentIsVisible {},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 18},
		}
	},
	-- Early Out, when new text on screen - old uimarker off
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 45},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 18},
			TutorialUIPointerHide {},
		}
	},
	-- Inventory Marker block / Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 18},
			TutorialTaskTextIsOnScreen {Take = 45},
			DialogEquipmentIsVisible {},
			EntityFlagIsFalse {Name = "ef_P500_ClearInventoryMarkers"},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 240, Top = 220, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			EntityTimerStart {Name = "et_P500_InventoryButtons"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 18},
		}
	},
	-- Inventory Marker block / non Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 18},
			TutorialTaskTextIsOnScreen {Take = 45},
			DialogEquipmentIsVisible {},
			EntityFlagIsFalse {Name = "ef_P500_ClearInventoryMarkers"},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 310, Top = 220, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			EntityTimerStart {Name = "et_P500_InventoryButtons"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 18},
		}
	},
	-- Early out, when player close the inventory
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 18},
			DialogEquipmentIsNotVisible	{},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P500_ClearInventoryMarkers"},
			TutorialUIPointerHide {},
		}
	},
	-- inventory 2 mark / Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 18},
			DialogEquipmentIsVisible {},
			EntityTimerIsElapsed {Name = "et_P500_InventoryButtons", Seconds = 2},
			EntityFlagIsFalse {Name = "ef_P500_ClearInventoryMarkers"},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 240, Top = 289, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
		},
	},
	-- inventory 2 mark / non Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 18},
			DialogEquipmentIsVisible {},
			EntityTimerIsElapsed {Name = "et_P500_InventoryButtons", Seconds = 2},
			EntityFlagIsFalse {Name = "ef_P500_ClearInventoryMarkers"},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 310, Top = 289, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
		},
	},
	-- inventory 3 / Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 18},
			DialogEquipmentIsVisible {},
			EntityTimerIsElapsed {Name = "et_P500_InventoryButtons", Seconds = 4},
			EntityFlagIsFalse {Name = "ef_P500_ClearInventoryMarkers"},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 240, Top = 338, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
		},
	},
	-- inventory 3 / non Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 18},
			DialogEquipmentIsVisible {},
			EntityTimerIsElapsed {Name = "et_P500_InventoryButtons", Seconds = 4},
			EntityFlagIsFalse {Name = "ef_P500_ClearInventoryMarkers"},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 310, Top = 338, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
		},
	},
	-- wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 18},
			DialogEquipmentIsVisible {},
			EntityTimerIsElapsed {Name = "et_P500_InventoryButtons", Seconds = 6},
			EntityFlagIsFalse {Name = "ef_P500_ClearInventoryMarkers"},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 240, Top = 220, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
		},
	},
	-- non wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 18},
			DialogEquipmentIsVisible {},
			EntityTimerIsElapsed {Name = "et_P500_InventoryButtons", Seconds = 6},
			EntityFlagIsFalse {Name = "ef_P500_ClearInventoryMarkers"},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 310, Top = 220, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 18},
			TutorialTaskTextIsNotOnScreen {Take = 46},
			TutorialTaskTextIsNotOnScreen {Take = 45},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 19},
			EntityFlagSetTrue {Name = "ef_P500_ClearInventoryMarkers"},
			EntityTimerStop {Name = "et_P500_InventoryButtons"},
		}
	},
	-- Early Out, when player skip the info
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 47},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 19},
			TutorialUIPointerHide {},
		}
	},
	-- Inventory slot marker / Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 19},
			DialogEquipmentIsVisible {},
			TutorialTaskTextIsOnScreen {Take = 47},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 300, Top = 217, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 19},
		}
	},
	-- Inventory slot marker / non Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 19},
			DialogEquipmentIsVisible {},
			TutorialTaskTextIsOnScreen {Take = 47},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 400, Top = 217, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 19},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 19},
			DialogInventoryIsNotVisible {},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 19},
		}
	},
	-- Early out, if the player close the inventory
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 19},
			DialogInventoryIsNotVisible	{},
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, when the player skip the info
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 49},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 20},
			TutorialUIPointerHide {},
		}
	},
	-- Weapon marker - new / Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 20},
			TutorialTaskTextIsOnScreen {Take = 49},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 340, Top = 217, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 20},
		}
	},
	
	-- Weapon marker - new / non Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 20},
			TutorialTaskTextIsOnScreen {Take = 49},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 452, Top = 217, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 20},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 20},
			TutorialTaskTextIsNotOnScreen {Take = 49},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 21},
		}
	},
	-- Early out, when player close the inventory
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 20},
			DialogInventoryIsNotVisible	{},
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, hen the player skip the info
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 51},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 21},
			TutorialUIPointerHide {},
		}
	},
	-- Hand slot marker / Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 21},
			TutorialTaskTextIsOnScreen {Take = 51},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 110, Top = 417, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 21},
		}
	},
	-- Hand slot marker / non Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 21},
			TutorialTaskTextIsOnScreen {Take = 51},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 145, Top = 417, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 21},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 21},
			OR
			{
				AvatarHasItemEquipped {ItemId = 1282},
				AvatarHasItemEquipped {ItemId = 490},
			},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 22},
		}
	},
	-- Early out, when player closed the inventory
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 21},
			DialogInventoryIsNotVisible	{},
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},

	
---------------------------------------
------- Spell markeres start
---------------------------------------	
		-- Early Out, tasktext is on screen
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 72},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 22},
			TutorialUIPointerHide {},
		}
	},
	-- Marker SpellMemory
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 22},
			TutorialTaskTextIsOnScreen {Take = 72},
			DialogEquipmentIsNotVisible	{},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			TutorialUIPointerShow { Left = 50, Top = 20, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 22},
		}
	},
	-- toggle / Wide
	OnToggleEvent
	{
		OnConditions = 
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 22},
			DialogEquipmentIsVisible	{},
			DialogSpellBookIsNotVisible {},
			TutorialTaskTextIsOnScreen {Take = 72},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		OnActions = 
		{
			TutorialUIPointerHide {},
			TutorialUIPointerShow { Left = 245, Top = 280, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapFlagSetTrue	{Name = "mf_P500_SpellTutoEquipWindowOpened"},
		},
		OffConditions = 
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 22},
			DialogEquipmentIsNotVisible	{},
			DialogSpellBookIsNotVisible {},
			TutorialTaskTextIsOnScreen {Take = 72},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		OffActions = 
		{
			TutorialUIPointerHide {},
			TutorialUIPointerShow {Left = 50, Top = 20, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapFlagSetTrue	{Name = "mf_P500_SpellTutoEquipWindowOpened"},
		},
	};
	
	-- toggle / non Wide
	OnToggleEvent
	{
		OnConditions = 
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 22},
			DialogEquipmentIsVisible	{},
			DialogSpellBookIsNotVisible {},
			TutorialTaskTextIsOnScreen {Take = 72},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		OnActions = 
		{
			TutorialUIPointerHide {},
			TutorialUIPointerShow { Left = 320, Top = 280, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapFlagSetTrue	{Name = "mf_P500_SpellTutoEquipWindowOpened"},
		},
		OffConditions = 
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 22},
			DialogEquipmentIsNotVisible	{},
			DialogSpellBookIsNotVisible {},
			TutorialTaskTextIsOnScreen {Take = 72},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		OffActions = 
		{
			TutorialUIPointerHide {},
			TutorialUIPointerShow {Left = 50, Top = 20, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapFlagSetTrue	{Name = "mf_P500_SpellTutoEquipWindowOpened"},
		},
	};
	
	-- ui hide when task is ok
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 22},
			TutorialTaskTextIsNotOnScreen {Take = 72},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 23},
		}
	},
	
	-- ui hide when player close the Equipments
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 22},
			DialogEquipmentIsNotVisible	{},
			MapFlagIsTrue	{Name = "mf_P500_SpellTutoEquipWindowOpened"},

		},
		Actions =
		{
			--TutorialUIPointerHide {},
			--MapValueSet	{Name = "mv_P500_Marker", Value = 23},
		}
	},
	
	------------------------------------
	-- Spell marker end
	--------------------------------------
	
	-------------------------------------
	-- Click and fight
	--------------------------------------
	-- Early Out 
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 39},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 230},
		}
	},
	
	-- enemy unit select marker on
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 39},
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 230},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 230},
			ObjectSpawnToEntity	{ObjectId = 1336, TargetTag = "DR_BridgeWarrior1", Direction = 0, Tag = "DR_TutorialEffect020"},
		}
	},
	
	-- early out - figure dead earlier
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 230},
			FigureIsDead	{Tag = "DR_BridgeWarrior1"},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 23},
			ObjectVanish	{Tag = "DR_TutorialEffect020"},
		}
	},
	
	-- task solve out
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 40},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 23},
			ObjectVanish	{Tag = "DR_TutorialEffect020"},
		}
	},

	--  Click'n'Fight
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 23},
			TutorialTaskTextIsOnScreen {Take = 40},
			FigureIsSelected	{Tag = "DR_BridgeWarrior1"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 53, Top = 145, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 23},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AND
				{
					MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 23},
					TutorialTaskTextIsNotOnScreen {Take = 40},
				},
				AND 
				{
					MapFlagIsTrue	{Name = "mf_P500_ClickAndFightDone"},
					MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 23},
				},
				AND
				{
					FigureIsNotSelected	{Tag = "DR_BridgeWarrior1"},
					MapFlagIsTrue	{Name = "mf_P500_BridgeWarriorCreated"},
					MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 23},
				},
				AND
				{
					FigureIsDead {Tag = "DR_BridgeWarrior1"},
					MapFlagIsTrue	{Name = "mf_P500_BridgeWarriorCreated"},
					MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 23},
				}
			}
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 33},
		}
	},
	
	-------------------------------------
	-- Click and fight end
	--------------------------------------
	
	
	-------------------------------------
	-- BUILD start
	-------------------------------------
	
	-- Early Out
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 100},
		},
		Actions =
		{
			--MapValueSet	{Name = "mv_P500_Marker", Value = 33},
			TutorialUIPointerHide {},
		}
	},
	-- Silver in upper menubar
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 33},
			TutorialTaskTextIsOnScreen {Take = 100},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 350, Top = 26, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 33},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 33},
			PlayerHasResourceSilver {Amount = 50},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 34},
		}
	},
	-- Early Out, text skip
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 103},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 34},
			TutorialUIPointerHide {},
		}
	},
	-- Normal craftsmen create ikon marker / Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 34},
			TutorialTaskTextIsOnScreen {Take = 103},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 344, Top = 668, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 34},
		}
	},
	-- Normal craftsmen create ikon marker / non Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 34},
			TutorialTaskTextIsOnScreen {Take = 103},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 315, Top = 668, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 34},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 34},
			TutorialTaskTextIsNotOnScreen {Take = 103},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 35},
		}
	},
	-- Early out, HQ deselect
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 34},
			BuildingIsNotSelected {BuildingId = Building.RTS.RealmHeadquarter},
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, new text
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 104},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 35},
			TutorialUIPointerHide {},
		}
	},
	-- Special craftmen  / Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 35},
			TutorialTaskTextIsOnScreen {Take = 104},
			EntityFlagIsFalse {Name = "ef_P500_ClearWorkerMarkers"},
			MapFlagIsTrue {Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 400, Top = 668, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			EntityTimerStart {Name = "et_P500_WorkerButtons"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 35},
		}
	},
	-- Special 1 craftmen  / non Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 35},
			TutorialTaskTextIsOnScreen {Take = 104},
			EntityFlagIsFalse {Name = "ef_P500_ClearWorkerMarkers"},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 365, Top = 668, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			EntityTimerStart {Name = "et_P500_WorkerButtons"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 35},
		}
	},
	-- Early out, HQ deselect
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 34},
			BuildingIsNotSelected {BuildingId = Building.RTS.RealmHeadquarter},
		},
		Actions =
		{
			EntityFlagSetTrue {Name = "ef_P500_HQDeselected"},
			TutorialUIPointerHide {},
		}
	},
	-- spec cr men 2 / Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 35},
			EntityTimerIsElapsed {Name = "et_P500_WorkerButtons", Seconds = 2},
			EntityFlagIsFalse {Name = "ef_P500_HQDeselected"},
			EntityFlagIsFalse {Name = "ef_P500_ClearWorkerMarkers"},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 450, Top = 668, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
		},
	},
	-- spec cr men 2 / non Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 35},
			EntityTimerIsElapsed {Name = "et_P500_WorkerButtons", Seconds = 2},
			EntityFlagIsFalse {Name = "ef_P500_HQDeselected"},
			EntityFlagIsFalse {Name = "ef_P500_ClearWorkerMarkers"},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 425, Top = 668, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
		},
	},
	-- spec cr men 3 / Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 35},
			EntityTimerIsElapsed {Name = "et_P500_WorkerButtons", Seconds = 4},
			EntityFlagIsFalse {Name = "ef_P500_HQDeselected"},
			EntityFlagIsFalse {Name = "ef_P500_ClearWorkerMarkers"},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 500, Top = 668, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
		},
	},
	-- spec cr men 3 / non Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 35},
			EntityTimerIsElapsed {Name = "et_P500_WorkerButtons", Seconds = 4},
			EntityFlagIsFalse {Name = "ef_P500_HQDeselected"},
			EntityFlagIsFalse {Name = "ef_P500_ClearWorkerMarkers"},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 485, Top = 668, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 35},
			TutorialTaskTextIsNotOnScreen {Take = 104},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 36},
			EntityFlagSetTrue {Name = "ef_P500_ClearInventoryMarkers"}
		}
	},
	-- Early Out, new text
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 105},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 36},
			TutorialUIPointerHide {},
		}
	},
	-- Stone craftmen / Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 36},
			TutorialTaskTextIsOnScreen {Take = 105},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 400, Top = 668, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 36},
		}
	},
	-- Stone craftmen / non Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 36},
			TutorialTaskTextIsOnScreen {Take = 105},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 365, Top = 668, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 36},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 36},
			-- 
			PlayerHasUnitAmount {Amount = 10, UnitId = 69},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 37},
		}
	},
	-- Early out, HQ deselect
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 36},
			BuildingIsNotSelected {BuildingId = Building.RTS.RealmHeadquarter},
		},
		Actions =
		{
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, new text
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 109},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 37},
			TutorialUIPointerHide {},
		}
	},
	-- Allowed bulidings
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 37},
			TutorialTaskTextIsOnScreen {Take = 109},
			PlayerUnitIsInGroup {Group = 0, UnitId = 69, Amount = 1},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 738, Top = 608, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 37},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 37},
			OR
			{
				PlayerUnitIsNotInGroup {Group = 0, UnitId = 69, Amount = 1},
				TutorialTaskTextIsNotOnScreen {Take = 109},
			}

		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 38},
		}
	},
	-- Early Out, new text
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 112},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 38},
			TutorialUIPointerHide {},
		}
	},
	-- Blacksmith build / Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 38},
			TutorialTaskTextIsOnScreen {Take = 112},
			PlayerUnitIsInGroup {Group = 0, UnitId = 69, Amount = 1},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 610, Top = 608, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 38},
		}
	},
	-- Blacksmith build / non Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 38},
			TutorialTaskTextIsOnScreen {Take = 112},
			PlayerUnitIsInGroup {Group = 0, UnitId = 69, Amount = 1},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 650, Top = 608, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 38},
		}
	},
	--- new toggle / Wide
	OnToggleEvent
	{
		OnConditions = 
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 38},
			TutorialTaskTextIsOnScreen {Take = 112},
			PlayerUnitIsInGroup {Group = 0, UnitId = 69, Amount = 1},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		OnActions = 
		{
			TutorialUIPointerShow {Left = 610, Top = 608, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
		},
		OffConditions = 
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 38},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
			OR
			{
				PlayerUnitIsNotInGroup {Group = 0, UnitId = 69, Amount = 1},
				TutorialTaskTextIsNotOnScreen {Take = 112},
			}
		},
		OffActions = 
		{
			TutorialUIPointerHide {},
		},
	};
	--- new toggle / non Wide
	OnToggleEvent
	{
		OnConditions = 
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 38},
			TutorialTaskTextIsOnScreen {Take = 112},
			PlayerUnitIsInGroup {Group = 0, UnitId = 69, Amount = 1},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		OnActions = 
		{
			TutorialUIPointerShow {Left = 650, Top = 608, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
		},
		OffConditions = 
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 38},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
			OR
			{
				PlayerUnitIsNotInGroup {Group = 0, UnitId = 69, Amount = 1},
				TutorialTaskTextIsNotOnScreen {Take = 112},
			}
		},
		OffActions = 
		{
			TutorialUIPointerHide {},
		},
	};

	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 38},
			TutorialTaskTextIsNotOnScreen {Take = 112},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 39},
		}
	},
	-- Early Out, new text
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 116},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 39},
			TutorialUIPointerHide {},
		}
	},
	-- 5 Soldier production / Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 39},
			TutorialTaskTextIsOnScreen {Take = 116},
			BuildingIsSelected {BuildingId = Building.RTS.RealmHeadquarter},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 344, Top = 608, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 39},
		}
	},
	-- 5 Soldier production / non Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 39},
			TutorialTaskTextIsOnScreen {Take = 116},
			BuildingIsSelected {BuildingId = Building.RTS.RealmHeadquarter},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 315, Top = 608, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 39},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 39},
			OR
			{
				TutorialTaskTextIsNotOnScreen {Take = 116},
				BuildingIsNotSelected {BuildingId = Building.RTS.RealmHeadquarter},
			}
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 40},
		}
	},
	-- Early Out, new text-----------------------------------------------------
	
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 121},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 40},
			TutorialUIPointerHide {},
		}
	},
	-- Upgrade blacksmith / Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 40},
			TutorialTaskTextIsOnScreen {Take = 121},
			BuildingIsSelected {BuildingId = Building.RTS.RealmHeadquarter},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 344, Top = 608, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 40},
		}
	},
	-- Upgrade blacksmith / non Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 40},
			TutorialTaskTextIsOnScreen {Take = 121},
			BuildingIsSelected {BuildingId = Building.RTS.RealmHeadquarter},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 344, Top = 608, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 40},
		}
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			OR
			{
				AND
				{
					MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 40},
					TutorialTaskTextIsNotOnScreen {Take = 121},
				},
				AND
				{
					MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 40},
					PlayerHasUnitAmount	{UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
				},
			}
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 41},
		}
	},
	-- Early Out, HQ deselect
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 40},
			BuildingIsNotSelected {BuildingId = Building.RTS.RealmHeadquarter},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 41},
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, new text
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 122},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 41},
			TutorialUIPointerHide {},
		}
	},
	-- Blacksmith upgrade icon marker / Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 41},
			TutorialTaskTextIsOnScreen {Take = 122},
			BuildingIsSelected {BuildingId = Building.RTS.RealmBlacksmith},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 665, Top = 669, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 41},
		}
	},
	-- Blacksmith upgrade icon marker / non Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 41},
			TutorialTaskTextIsOnScreen {Take = 122},
			BuildingIsSelected {BuildingId = Building.RTS.RealmBlacksmith},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 705, Top = 669, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 41},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 41},
			OR
			{
				TutorialTaskTextIsNotOnScreen {Take = 122},
				BuildingIsNotSelected {BuildingId = Building.RTS.RealmBlacksmith},
			}
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 42},
		}
	},
	-- Early Out, new text
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 124},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 42},
			TutorialUIPointerHide {},
		}
	},
	-- Unit limit
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 42},
			TutorialTaskTextIsOnScreen {Take = 124},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 550, Top = 25, Width = buttonsize, Height = buttonsize, File = "marker_icon_right_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 42},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 42},
			TutorialTaskTextIsNotOnScreen {Take = 124},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 43},
		}
	},
	-- Early Out, new text
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 127},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 43},
			TutorialUIPointerHide {},
		}
	},
	-- Idle Worker / Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 43},
			TutorialTaskTextIsOnScreen {Take = 127},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 206, Top = 645, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 43},
		}
	},
	-- Idle Worker / non Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 43},
			TutorialTaskTextIsOnScreen {Take = 127},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 270, Top = 645, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 43},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 43},
			TutorialTaskTextIsNotOnScreen {Take = 127},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 44},
		}
	},
	-- Early Out, new text
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 129},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 44},
			TutorialUIPointerHide {},
		}
	},
	-- Farm building / Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 44},
			TutorialTaskTextIsOnScreen {Take = 129},
			PlayerUnitIsInGroup {Group = 0, UnitId = 69, Amount = 1},
			MapFlagIsTrue	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 564, Top = 608, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 44},
		}
	},
	-- Farm building / non Wide
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 44},
			TutorialTaskTextIsOnScreen {Take = 129},
			PlayerUnitIsInGroup {Group = 0, UnitId = 69, Amount = 1},
			MapFlagIsFalse	{Name = "mf_P500_WideScreen"},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 600, Top = 608, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 44},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 44},
			OR
			{
				PlayerUnitIsNotInGroup {Group = 0, UnitId = 69, Amount = 1},
				TutorialTaskTextIsNotOnScreen {Take = 129},
			}

		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 45},
		}
	},
	-- Early Out, new text
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 121},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 46},
			TutorialUIPointerHide {},
		}
	},
	-- Early Out, new text
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 133},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 46},
			TutorialUIPointerHide {},
		}
	},
	-- Group select button marker
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 46},
			TutorialTaskTextIsOnScreen {Take = 133},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 441, Top = 45, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 46},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 46},
			TutorialTaskTextIsNotOnScreen {Take = 133},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 47},
		}
	},
	-- Early Out, new text
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 136},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 48},
			TutorialUIPointerHide {},
		}
	},
	-- Group select crossbowman
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 48},
			TutorialTaskTextIsOnScreen {Take = 136},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 490, Top = 45, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 48},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 48},
			OR
			{
				PlayerUnitIsInGroup {Group = 1, UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
				PlayerUnitIsInGroup {Group = 2, UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
				PlayerUnitIsInGroup {Group = 3, UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
				PlayerUnitIsInGroup {Group = 4, UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
				PlayerUnitIsInGroup {Group = 5, UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
				PlayerUnitIsInGroup {Group = 6, UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
				PlayerUnitIsInGroup {Group = 7, UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
				PlayerUnitIsInGroup {Group = 8, UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
				PlayerUnitIsInGroup {Group = 9, UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
				PlayerUnitIsInGroup {Group = 10, UnitId = Unit.RTS.RealmCrossbowman, Amount = 5},
			}
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 49},
		}
	},
	-- Early Out,new text
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 139},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 49},
			TutorialUIPointerHide {},
		}
	},
	--Strongest opponent
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 49},
			TutorialTaskTextIsOnScreen {Take = 139},
		},
		Actions =
		{
			TutorialUIPointerShow {Left = 204, Top = 521, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_down"},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 49},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 49},
			TutorialTaskTextIsNotOnScreen {Take = 139},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 50},
		}
	},
	-- Early Out, new text
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 140},
		},
		Actions =
		{
			MapValueSet	{Name = "mv_P500_Marker", Value = 50},
			TutorialUIPointerHide {},
		}
	},
	
			--  Tab and Click'n'Fight
	OnOneTimeEvent
	{
		Conditions =
		{
			MapValueIsEqual	{Name = "mv_P500_Marker", Value = 50},
			TutorialTaskTextIsOnScreen {Take = 140},
			OR
			{
				FigureIsSelected	{Tag = "LastTuztorialArmy1"},
				FigureIsSelected	{Tag = "LastTuztorialArmy2"},
				FigureIsSelected	{Tag = "LastTuztorialArmy3"},
				FigureIsSelected	{Tag = "LastTuztorialArmy4"},
				FigureIsSelected	{Tag = "LastTuztorialArmy5"},
				FigureIsSelected	{Tag = "LastTuztorialArmy6"},
				FigureIsSelected	{Tag = "LastTuztorialArmy7"},
			}
		},
		Actions =
		{
			--TutorialUIPointerShow {Left = 53, Top = 145, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_MarkerShown", Value = 50},
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
				MapValueIsEqual	{Name = "mv_P500_MarkerShown", Value = 50},
				TutorialTaskTextIsNotOnScreen {Take = 140},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapValueSet	{Name = "mv_P500_Marker", Value = 51},
		}
	},
	
}
