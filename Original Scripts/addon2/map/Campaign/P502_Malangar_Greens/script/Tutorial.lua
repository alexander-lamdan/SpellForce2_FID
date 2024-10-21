---------------------------------
-------------P502----------------
---------------------------------


local MinimapMarker = 1
local buttonsize = 43


State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions =
		{
			--MapFlagIsTrue {Name = "mf_P502_Tutorial"},
			MapFlagIsTrue {Name = "mf_p502_StartTutorial"},
		},
		Actions =
		{
			EntityTimerStart	{Name = "et_TutorialBegins"},
		},
		GotoState = "TutorialRunning",
	},
	
}

State
{
	StateName = "TutorialRunning",
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed	{Name = "et_TutorialBegins", Seconds = 2},
		},
		Actions =
		{
			TutorialTaskTextShow {TextTag = "Tutorial1"},
			MapValueSet	{Name = "mv_P502_Marker", Value = 1},
			EntityTimerStop {Name = "et_TutorialBegins"},
		},
	},
	
	OnOneTimeEvent
	{
		GotoState = "Block2",
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 1},
			MapFlagIsFalse	{Name = "mf_P502_Surian"},
		}, 
		Actions =
		{
			TutorialTaskSetSolved {Take = 1},
		},
	},
}

State
{
	StateName = "Block2",
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsNotOnScreen {Take = 1},
			TutorialTextIsFinished {Take = 1},
		},
		Actions =
		{
			TutorialInfoTextShow {TextTag = "Tutorial2"},
			TutorialTaskTextShow {TextTag = "Tutorial3"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			TutorialTaskTextIsOnScreen {Take = 3},
			MapFlagIsTrue {Name = "mf_P502_Surian"},
		},
		Actions =
		{
			TutorialTaskSetSolved {Take = 3},
			MapFlagSetTrue {Name = "mf_P502_TutShown"},
			MapFlagSetTrue {Name = "mf_p502_DragonRidingTutFinished"},
		},
	},
}
