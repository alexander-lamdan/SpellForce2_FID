--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")

State
{
	StateName = "QuestBook",
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P504_CanGiveHQ"},
		},
		Actions =
		{
			QuestSetActive {Quest = "WOS_DESTINY"},
			QuestSetActive {Quest = "WOS_LIBERTY"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_p504_SharandalDemise"},
			FigureIsDead{Tag = "WS_sharandal_01"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P504_EggQuest"},
			QuestSetActive {Quest = "WOS_GUINEAPIG"},			
			MapFlagSetTrue {Name = "mf_P504_Start_Teleport_Cut"},
			MapTimerStart {Name = "mt_P504_CutScene_Timer"},
		},
		GotoState = self,
	};
	
 OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue{Name = "mf_P504_SharandalSacrifice"},
		},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P504_EggQuest"},
			QuestSetActive {Quest = "WOS_GUINEAPIG"},
			MapFlagSetTrue {Name = "mf_P504_Start_Teleport_Cut"},
			MapTimerStart {Name = "mt_P504_CutScene_Timer"},
		},
		GotoState = self,
	};
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P504_EggQuestDone"},
		},
		Actions = 
		{
			QuestSetSolved {Quest = "WOS_GUINEAPIG"},			
		},
		GotoState = self,
	};
}
