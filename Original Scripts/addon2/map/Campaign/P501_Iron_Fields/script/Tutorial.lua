---------------------------------
-------------P501----------------
---------------------------------


local MinimapMarker = 1
local buttonsize = 43


State
{
	StateName = "INIT",
	
			--MapFlagIsTrue {Name = "mf_P501_Tutorial"},
			--MapFlagIsTrue {Name = "mf_P501_EndIntroCS"},
			--MapFlagIsFalse {Name = "mf_P501_MapTravelledOnce"},
			--AvatarFlagIsTrue	{Player = "default", Name = "af_P500_TutorialRequested"},

-------------------------------------------------------------------------------------------
-- Journey stone
-------------------------------------------------------------------------------------------
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_P501_MapTravelledOnce"},
			--MapFlagIsTrue {Name = "mf_P501_Tutorial"},
			AvatarFlagIsTrue	{Player = "default", Name = "af_P500_TutorialRequested"},
			OR	
			{
				FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 5, X = 72, Y = 600},
				FigureIsInRange	{Tag = "pl_HumanHeroAntara", Range = 5, X = 72, Y = 600},
			},
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial214"},
			TutorialInfoTextShow {TextTag = "Tutorial215"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			AvatarFlagIsTrue	{Player = "default", Name = "af_P500_TutorialRequested"},
			OR	
			{
				FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 5, X = 72, Y = 600},
				FigureIsInRange	{Tag = "pl_HumanHeroAntara", Range = 5, X = 72, Y = 600},
			},
		},
		Actions =
		{
			--DebugMessage	{Caption = "default", Message = "avatarflagtrue"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_P501_MapTravelledOnce"},

			OR	
			{
				FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 5, X = 72, Y = 600},
				FigureIsInRange	{Tag = "pl_HumanHeroAntara", Range = 5, X = 72, Y = 600},
			},
		},
		Actions =
		{
			--DebugMessage	{Caption = "default", Message = "travelledoncefalse"},
		},
	},
	
-------------------------------------------------------------------------------------------
-- Merchant tutorial
-------------------------------------------------------------------------------------------
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_P501_MapTravelledOnce"},
			--MapFlagIsTrue {Name = "mf_P501_Tutorial"},
			AvatarFlagIsTrue	{Player = "default", Name = "af_P500_TutorialRequested"},
			OR	
			{
				FigureIsInRange	{Tag = "pl_HumanAvatar", Range = 6, X = 152, Y = 576},
				FigureIsInRange	{Tag = "pl_HumanHeroAntara", Range = 6, X = 152, Y = 576},
			},
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial211"},
			TutorialInfoTextShow {TextTag = "Tutorial212"},
		},
	},

-------------------------------------------------------------------------------------------
-- New Ability
-------------------------------------------------------------------------------------------

	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P501_EndFastCS"},
			MapFlagIsFalse {Name = "mf_P501_MapTravelledOnce"},
			--MapFlagIsTrue {Name = "mf_P501_Tutorial"},
			AvatarFlagIsTrue	{Player = "default", Name = "af_P500_TutorialRequested"},
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial12"},
		},
	},

-------------------------------------------------------------------------------------------
-- Blood Summon
-------------------------------------------------------------------------------------------

	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsFalse {Name = "mf_P501_MapTravelledOnce"},
			--MapFlagIsTrue {Name = "mf_P501_Tutorial"},
			AvatarFlagIsTrue	{Player = "default", Name = "af_P500_TutorialRequested"},
			MapFlagIsTrue {Name  = "mf_P501_StartSummonTut"},
			FigureIsAlive {Tag = "pl_HumanHeroAntara"},
			FigureIsNotInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "pl_HumanHeroAntara", Range = 3},
			MapFlagIsFalse {Name = "mf_P501_SummonDone"},
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial61"},
			TutorialTaskTextShow {TextTag = "Tutorial62"},
		},
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInEntityRange {Tag = "pl_HumanAvatar", TargetTag = "pl_HumanHeroAntara", Range = 6},
			MapFlagIsFalse {Name = "mf_P501_MapTravelledOnce"},
			--MapFlagIsTrue {Name = "mf_P501_Tutorial"},
			AvatarFlagIsTrue	{Player = "default", Name = "af_P500_TutorialRequested"},
			MapFlagIsTrue {Name  = "mf_P501_StartSummonTut"},
		},
		Actions =
		{
			MapFlagSetTrue {Name = "mf_P501_SummonDone"},
			TutorialTaskSetSolved {Take = 62},
			MapFlagSetTrue {Name  = "mf_P501_AntaraSummoned"},
		},
	},
	
--------------------------------------------------------------------------------------------------
-- Repair building
--------------------------------------------------------------------------------------------------
	OnOneTimeEvent
	{
		Conditions =
		{
			QuestIsActive {Quest = "IF_SUPPLY_POST"},
			MapFlagIsFalse {Name = "mf_P501_MapTravelledOnce"},
			--MapFlagIsTrue {Name = "mf_P501_Tutorial"},
			AvatarFlagIsTrue	{Player = "default", Name = "af_P500_TutorialRequested"},
		},
		Actions =
		{
			 MapTimerStart	{Name = "mt_P501_BuildingRepairDelay"},
		},
	},

	OnOneTimeEvent
	{
		Conditions =
		{
			MapTimerIsElapsed	{Name = "mt_P501_BuildingRepairDelay", Seconds = 13},
		},
		Actions =
		{
			MapTimerStop	{Name = "mt_P501_BuildingRepairDelay"},
			TutorialInfoTextShow {TextTag = "Tutorial205"},
		},
	},


	
	
}