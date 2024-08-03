--------------------------------------------------
-------------Iron Field Tutorials-----------------
--------------------------------------------------



local MinimapMarker = 1
local buttonsize = 43

State
{
	StateName = "INIT",
	
		
	-------------------------------------------------------------------------------------------
	-- Blood Call
	-------------------------------------------------------------------------------------------		
	
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 62},
			MapFlagIsFalse {Name = "mf_P501_AntaraPointerShow"},
			FigureIsSelected {Tag = "pl_HumanHeroAntara"},
			FigureIsNotSelected {Tag = "pl_HumanAvatar"},
			MapFlagIsFalse {Name  = "mf_P501_AntaraSummoned"},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			TutorialUIPointerShow {Left = 53, Top = 145, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapFlagSetTrue {Name = "mf_P501_AntaraPointerShow"},
			-- MapFlagSetFalse {Name = "mf_P501_SummonPointerShow"},
			
		}
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 62},
			MapFlagIsFalse {Name = "mf_P501_AntaraPointerShow"},
			OR
			{
				AND
				{
					FigureIsSelected {Tag = "pl_HumanHeroAntara"},
					FigureIsSelected {Tag = "pl_HumanAvatar"},
				},
				FigureIsNotSelected {Tag = "pl_HumanHeroAntara"},
			},
			MapFlagIsFalse {Name  = "mf_P501_AntaraSummoned"},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			TutorialUIPointerShow {Left = 120, Top = 90, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
			MapFlagSetTrue {Name = "mf_P501_AntaraPointerShow"},
			-- MapFlagSetFalse {Name = "mf_P501_SummonPointerShow"},
			
		}
	},
	
	
	OnToggleEvent
	{
		
		OnConditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_AntaraPointerShow"},
			FigureIsSelected {Tag = "pl_HumanHeroAntara"},
			FigureIsNotSelected {Tag = "pl_HumanAvatar"},
			TutorialTaskTextIsOnScreen {Take = 62},
			MapFlagIsFalse {Name  = "mf_P501_AntaraSummoned"},
		},
		OnActions = 
		{
			TutorialUIPointerHide {},
			TutorialUIPointerShow {Left = 53, Top = 145, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
		},
		OffConditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_AntaraPointerShow"},
			OR
			{
				AND
				{
					FigureIsSelected {Tag = "pl_HumanHeroAntara"},
					FigureIsSelected {Tag = "pl_HumanAvatar"},
				},
				FigureIsNotSelected {Tag = "pl_HumanHeroAntara"},
			},
			TutorialTaskTextIsOnScreen {Take = 62},
			MapFlagIsFalse {Name  = "mf_P501_AntaraSummoned"},
		},
		OffActions = 
		{
			TutorialUIPointerHide {},
			TutorialUIPointerShow {Left = 120, Top = 90, Width = buttonsize, Height = buttonsize, File = "marker_icon_left_up"},
		},
	};
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P501_AntaraPointerShow"},
			TutorialTaskTextIsNotOnScreen {Take = 62},
			MapFlagIsTrue {Name  = "mf_P501_AntaraSummoned"},
		},
		Actions =
		{
			
			MapFlagSetFalse {Name = "mf_P501_AntaraPointerShow"},
			TutorialUIPointerHide {},
			MapTimerStart	{Name = "mt_P501_SummonMarkerOffTimer"},
		}
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_P501_SummonMarkerOffTimer", Seconds = 2},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			
		}
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_P501_SummonMarkerOffTimer", Seconds = 30},
		},
		Actions =
		{
			TutorialUIPointerHide {},
			MapTimerStop	{Name = "mt_P501_SummonMarkerOffTimer"},
		}
	},
	

}
