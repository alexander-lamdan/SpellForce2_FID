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
		},
		--GotoState = "RunToWp01",
		GotoState = "Follow",
	};
};

State
{
	StateName = "Follow",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
			OR
			{
				MapFlagIsTrue {Name = "mf_HalicosSpawn"},
				QuestIsActive {Quest = "CoopLiberateAya", Player = "pl_Human1"},
				QuestIsActive {Quest = "CoopLiberateAya", Player = "pl_Human2"},
				QuestIsActive {Quest = "CoopLiberateAya", Player = "pl_Human3"},
			},
		},
		Actions = 
		{
			FigureOutcry	{Tag = default, TextTag = "Halicos01"},
			FigureOutcry	{Tag = default, TextTag = "Halicos02"},
			FigureOutcry	{Tag = default, TextTag = "Halicos03"},
			
		},
		DelayedActions = 
		{
		},
	};
	OnFollowEvent
	{
		Tag = "default",
		TargetTag = "pl_Human1Avatar",
		OnConditions = 
		{
			FigureIsNotInCombat	{Tag = "pl_Human1Avatar"},
			QuestIsActive		{Player = "pl_Human1", Quest = "CoopLiberateAya"},
			MapFlagIsFalse		{Name   = "mf_HalicosTalking"},
			MapFlagIsFalse		{Name   = "mf_Ava01HasTeleported"},
		},
		Actions = 
		{
		},
	};
	OnFollowEvent
	{
		Tag = "default",
		TargetTag = "pl_Human2Avatar",
		OnConditions = 
		{
			FigureIsNotInCombat	{Tag = "pl_Human2Avatar"},
			QuestIsNotActive	{Player = "pl_Human1", Quest = "CoopLiberateAya"},
			QuestIsActive		{Player = "pl_Human2", Quest = "CoopLiberateAya"},
			MapFlagIsFalse		{Name   = "mf_HalicosTalking"},
			MapFlagIsFalse		{Name   = "mf_Ava02HasTeleported"},
		},
		Actions = 
		{
		},
	};
	OnFollowEvent
	{     
		Tag = "default",
		TargetTag = "pl_Human3Avatar",
		OnConditions = 
		{     
			FigureIsNotInCombat	{Tag = "pl_Human3Avatar"},
			QuestIsNotActive	{Player = "pl_Human1", Quest = "CoopLiberateAya"},
			QuestIsNotActive	{Player = "pl_Human2", Quest = "CoopLiberateAya"},
			QuestIsActive		{Player = "pl_Human3", Quest = "CoopLiberateAya"},
			MapFlagIsFalse		{Name   = "mf_HalicosTalking"},
			MapFlagIsFalse		{Name   = "mf_Ava03HasTeleported"},
		},     
		Actions = 
		{     
		},     
	};
	 
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsInEntityRange	{Tag = "default", TargetTag = "CultGuardian01", Range = 20},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name   = "mf_HalicosTalking"},
			
			FigureOutcry {Tag = "default", TextTag = "Halicos04"},
			FigureOutcry {Tag = "default", TextTag = "Halicos05"},
			FigureOutcry {Tag = "default", TextTag = "Halicos06"},
			
			MapTimerStart	{Name = "mt_HalicosTalk01"},
			
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_HalicosTalk01", Seconds = 13},
		},
		Actions = 
		{
			FigureRunToEntity	{Tag = "default", TargetTag	= "CultGuardian01"},
			
			FigureOutcry {Tag = "default", TextTag = "Halicos07"},
			FigureOutcry {Tag = "CultGuardian01", TextTag = "Cultist01"},
			FigureOutcry {Tag = "default", TextTag = "Halicos08"},
			FigureOutcry {Tag = "CultGuardian01", TextTag = "Cultist02"},
			FigureOutcry {Tag = "default", TextTag = "Halicos10"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapTimerIsElapsed	{Name = "mt_HalicosTalk01", Seconds = 25},
		},
		Actions = 
		{
			GateSetOpen			{Tag  = "GateCity"},
			FigureTeamTransfer	{Tag  = "CultGuardian01", Team = "tm_Cult"},
			FigureTeamTransfer	{Tag  = "CultGuardian02", Team = "tm_Cult"},
			MapFlagSetFalse		{Name = "mf_HalicosTalking"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsDead	{Tag  = "CultGuardian01"}, 
			FigureIsDead	{Tag  = "CultGuardian02"}, 
			FigureIsDead	{Tag  = "CultGuardian03"}, 
			FigureIsDead	{Tag  = "CultGuardian04"}, 
			FigureIsDead	{Tag  = "CultGuardian05"}, 
			FigureIsDead	{Tag  = "CultGuardian06"}, 
			FigureIsDead	{Tag  = "CultGuardian07"}, 
			FigureIsDead	{Tag  = "CultGuardian08"}, 
			FigureIsDead	{Tag  = "CultGuardian09"}, 
			FigureIsDead	{Tag  = "CultGuardian10"}, 
			FigureIsDead	{Tag  = "CultGuardian11"}, 
			FigureIsDead	{Tag  = "CultGuardian12"}, 
			FigureIsDead	{Tag  = "CultGuardian13"}, 
		},
		Actions = 
		{
			FigureOutcry {Tag = "default", TextTag = "Halicos11"},
			FigureOutcry {Tag = "default", TextTag = "Halicos12"},
			FigureOutcry {Tag = "default", TextTag = "Halicos13"},
			FigureOutcry {Tag = "default", TextTag = "Halicos14"},

		},
	
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			FigureIsDead	{Tag  = "TeleporterBoss"}, 
		},
		Actions =
		{
			FigureOutcry 	{Tag  = "default", TextTag = "Halicos15"},
			ObjectChange	{Tag  = "Teleport01", ObjectId = 1432, X = 378.265, Y = 572.111},
			MapFlagSetTrue  {Name = "mf_TeleportEnabled"},
		},
	},
	
	
	OnOneTimeEvent
	{
		GotoState = "Teleport",
		Conditions =
		{
			MapFlagIsTrue	  		{Name = "mf_TeleportEnabled"},
			OR
			{
				MapFlagIsTrue	{Name  = "mf_Ava01HasTeleported"},
				MapFlagIsTrue	{Name  = "mf_Ava02HasTeleported"},
				MapFlagIsTrue	{Name  = "mf_Ava03HasTeleported"},
			}

		},
		Actions =
		{
		}
	},
};
State
{
	
	StateName = "Teleport",
	
	OnOneTimeEvent
	{
		Conditions =
		{
		},
		Actions =
		{
			FigureWalkToEntity	{Tag = "default", TargetTag = "Teleport01"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	  		{Name = "mf_TeleportEnabled"},
			FigureIsInEntityRange	{Tag = "default", TargetTag = "Teleport01", Range = 4},
		},
		Actions =
		{
			FigureTeleport		{Tag  = "default", X = 372, Y = 535},
			EntityTimerStart	{Name = "et_DelayDoor2"},
		--	MapFlagSetTrue		{Name = "mf_HalciosFollowModePart2"},
			FigureOutcry 		{Tag  = "default", TextTag = "Halicos16"},
			FigureOutcry 		{Tag  = "default", TextTag = "Halicos17"},
			FigureOutcry 		{Tag  = "default", TextTag = "Halicos18"},
			
		},
	},
	
	OnOneTimeEvent
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_DelayDoor2", Seconds = 5},
		},
		Actions =
		{
			MapFlagSetTrue		{Name = "mf_HalciosWalksToDoor"},		
		},
	},
	
	
	OnIdleGoHomeFake
	{
		X = 375.186,
		Y = 480.394,
		Range = 0.5,
		UpdateInterval = 0,
		Conditions = 
		{	
			MapFlagIsTrue		{Name = "mf_HalciosWalksToDoor"},
		},
		Actions = 
		{
		},
		HomeActions = 
		{
		},
		OneTimeHomeActions = 
		{
			EntityTimerStart	{Name = "et_MardagantTimer"},
			FigureOutcry 		{Tag  = "default", TextTag = "Halicos19"},
			FigureOutcry 		{Tag  = "Gate02Guard01", TextTag = "Cultist02"},
			FigureOutcry 		{Tag  = "Mardagant", TextTag = "Mardagant01"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{	
			EntityTimerIsElapsed	{Name = "et_MardagantTimer", Seconds = 8},
		},
		Actions = 
		{
			FigureOutcry	{Tag  = "default", TextTag = "Halicos20"},
			GateSetOpen		{Tag = "GateForge"},
			FigureRun	{X = 375, Y = 75},
		},
	},
	
};

