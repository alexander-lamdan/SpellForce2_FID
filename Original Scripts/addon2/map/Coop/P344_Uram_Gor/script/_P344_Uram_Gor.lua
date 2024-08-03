--State
--{
--	StateName = "INIT",
--	OnOneTimeEvent
--	{
--		GotoState = "CoopMain",
--		Conditions = 
--		{
--			QuestIsNotKnown	{Player = "pl_Human1", Quest = "CoopMainQuests"},
--		},
--		Actions = 
--		{
--			QuestSetActive	{Player = "pl_Human1", Quest = "CoopMainQuests"},
--			QuestSetActive	{Player = "pl_Human1", Quest = "CoopBaseChapter_3"},
--			QuestSetActive	{Player = "pl_Human1", Quest = "CoopSpyDocuments"},
--		},
--	},
--};


for i = 1, 3 do
	local sPlayerName = "pl_Human" .. i
	
	-- ********************************************************************
	-- solved, wenn die gegner platt sind
	-- ********************************************************************
	OnOneTimeEvent
	{
		EventName = "Spy1Found",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopSpyDocuments"},
			MapFlagIsTrue	{Name   = "mf_Spy1Found"},
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = sPlayerName, ItemId = Item.Misc.Dokument, Amount = 1},
			AvatarXPGive	{Player = sPlayerName, Amount = 150},
			AvatarFlagSetTrue   {Player = sPlayerName, Name = "af_P344_GotDocument01"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "Spy2Found",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopSpyDocuments"},
			MapFlagIsTrue	{Name   = "mf_Spy2Found"},
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = sPlayerName, ItemId = Item.Misc.Dokument, Amount = 1},
			AvatarXPGive	{Player = sPlayerName, Amount = 150},
			AvatarFlagSetTrue   {Player = sPlayerName, Name = "af_P344_GotDocument02"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "Spy3Found",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopSpyDocuments"},
			MapFlagIsTrue	{Name   = "mf_Spy3Found"},
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = sPlayerName, ItemId = Item.Misc.Dokument, Amount = 1},
			AvatarXPGive	{Player = sPlayerName, Amount = 150},
			AvatarFlagSetTrue   {Player = sPlayerName, Name = "af_P344_GotDocument03"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "Spy4Found",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopSpyDocuments"},
			MapFlagIsTrue	{Name   = "mf_Spy4Found"},
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = sPlayerName, ItemId = Item.Misc.Dokument, Amount = 1},
			AvatarXPGive	{Player = sPlayerName, Amount = 150},
			AvatarFlagSetTrue   {Player = sPlayerName, Name = "af_P344_GotDocument04"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "Spy5Found",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopSpyDocuments"},
			MapFlagIsTrue	{Name   = "mf_Spy5Found"},
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = sPlayerName, ItemId = Item.Misc.Dokument, Amount = 1},
			AvatarXPGive	{Player = sPlayerName, Amount = 150},
			AvatarFlagSetTrue   {Player = sPlayerName, Name = "af_P344_GotDocument05"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "Spy6Found",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopSpyDocuments"},
			MapFlagIsTrue	{Name   = "mf_Spy6Found"},
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = sPlayerName, ItemId = Item.Misc.Dokument, Amount = 1},
			AvatarXPGive	{Player = sPlayerName, Amount = 150},
			AvatarFlagSetTrue   {Player = sPlayerName, Name = "af_P344_GotDocument06"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "Spy7Found",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopSpyDocuments"},
			MapFlagIsTrue	{Name   = "mf_Spy7Found"},
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = sPlayerName, ItemId = Item.Misc.Dokument, Amount = 1},
			AvatarXPGive	{Player = sPlayerName, Amount = 150},
			AvatarFlagSetTrue   {Player = sPlayerName, Name = "af_P344_GotDocument07"},
		},
	};
	OnOneTimeEvent
	{
		EventName = "Spy8Found",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopSpyDocuments"},
			MapFlagIsTrue	{Name   = "mf_Spy8Found"},
		},
		Actions = 
		{
			AvatarItemMiscGive	{Player = sPlayerName, ItemId = Item.Misc.Dokument, Amount = 1},
			AvatarXPGive	{Player = sPlayerName, Amount = 150},
			AvatarFlagSetTrue   {Player = sPlayerName, Name = "af_P344_GotDocument08"},
		},
	};
	
	-- ********************************************************************
	-- solver der gesamtquest, sobald man mind. 12 Dokumente besitzt
	-- ********************************************************************
	OnOneTimeEvent
	{
		EventName = "Player"..i.."EnoughDocumentsCollected",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopSpyDocuments"},
			AvatarHasItemMisc	{Player = sPlayerName, ItemId = Item.Misc.Dokument, Amount = 24},
		},
		Actions = 
		{
			QuestSetSolved	{Player = sPlayerName, Quest = "CoopSpyDocuments"},
			QuestSetActive	{Player = sPlayerName, Quest = "CoopSpyDocumentsCollected"},
		},
	};
end



State
{
	StateName = "CoopMain",


	-- Seeker1 
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_DefeatedOrkCamp01"},
			OR
			{
				QuestIsActive	{Player = "pl_Human1", Quest = "CoopSpyDocuments"},
				QuestIsActive	{Player = "pl_Human2", Quest = "CoopSpyDocuments"},
				QuestIsActive	{Player = "pl_Human3", Quest = "CoopSpyDocuments"},
			},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_Seeker01Free"},
			ObjectVanish		{Tag = "SeekerCamp1"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_Seeker01Free"},
			FigureIsAlive {Tag = "OrcCamp01Seeker01"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "Seer01", Tag = "OrcCamp01Seeker01"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_Seeker01Free"},
			FigureIsAlive {Tag = "OrcCamp01Seeker02"},
			FigureIsDead  {Tag = "OrcCamp01Seeker01"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "Seer01", Tag = "OrcCamp01Seeker02"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_Seeker01Free"},
			FigureIsAlive {Tag = "OrcCamp01Seeker03"},
			FigureIsDead  {Tag = "OrcCamp01Seeker01"},
			FigureIsDead  {Tag = "OrcCamp01Seeker02"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "Seer01", Tag = "OrcCamp01Seeker03"},
		},
	},			
	-- Seeker 2
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_DefeatedOrkCamp02"},
			OR
			{
				QuestIsActive	{Player = "pl_Human1", Quest = "CoopSpyDocuments"},
				QuestIsActive	{Player = "pl_Human2", Quest = "CoopSpyDocuments"},
				QuestIsActive	{Player = "pl_Human3", Quest = "CoopSpyDocuments"},
			},

		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_Seeker02Free"},
			ObjectVanish		{Tag = "SeekerCamp2"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_Seeker02Free"},
			FigureIsAlive {Tag = "OrcCamp02Seeker01"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "Seer01", Tag = "OrcCamp02Seeker01"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_Seeker02Free"},
			FigureIsAlive {Tag = "OrcCamp02Seeker02"},
			FigureIsDead  {Tag = "OrcCamp02Seeker01"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "Seer01", Tag = "OrcCamp02Seeker02"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_Seeker02Free"},
			FigureIsAlive {Tag = "OrcCamp02Seeker03"},
			FigureIsDead  {Tag = "OrcCamp02Seeker01"},
			FigureIsDead  {Tag = "OrcCamp02Seeker02"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "Seer01", Tag = "OrcCamp02Seeker03"},
		},
	},
	-- Seeker 3
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue	{Name = "mf_DefeatedOrkCamp03"},
			OR
			{
				QuestIsActive	{Player = "pl_Human1", Quest = "CoopSpyDocuments"},
				QuestIsActive	{Player = "pl_Human2", Quest = "CoopSpyDocuments"},
				QuestIsActive	{Player = "pl_Human3", Quest = "CoopSpyDocuments"},
			},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_Seeker03Free"},
			ObjectVanish		{Tag = "SeekerCamp3"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue	{Name = "mf_Seeker03Free"},
			FigureIsAlive {Tag = "OrcCamp03Seeker01"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "Seer01", Tag = "OrcCamp03Seeker01"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_Seeker03Free"},
			FigureIsAlive {Tag = "OrcCamp03Seeker02"},
			FigureIsDead  {Tag = "OrcCamp03Seeker01"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "Seer01", Tag = "OrcCamp03Seeker02"},
		},
	},
	OnOneTimeEvent
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_Seeker03Free"},
			FigureIsAlive {Tag = "OrcCamp03Seeker03"},
			FigureIsDead  {Tag = "OrcCamp03Seeker01"},
			FigureIsDead  {Tag = "OrcCamp03Seeker02"},
		},
		Actions =
		{
			FigureOutcry	{TextTag = "Seer01", Tag = "OrcCamp03Seeker03"},
		},
	},			
};


