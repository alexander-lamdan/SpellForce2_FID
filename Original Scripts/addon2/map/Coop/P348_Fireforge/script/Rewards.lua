State
{
	StateName = "INIT",

	-- FreedAya wird im Plattformscript gesetzt	
	
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopLiberateAya"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopLiberateAya"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopLiberateAya"},
			FigureIsDead	{Tag = "CultGuardian01"},
			FigureIsDead	{Tag = "CultGuardian02"},
			FigureIsDead	{Tag = "CultGuardian03"},
			FigureIsDead	{Tag = "CultGuardian04"},
			FigureIsDead	{Tag = "CultGuardian05"},
			FigureIsDead	{Tag = "CultGuardian06"},
			FigureIsDead	{Tag = "CultGuardian07"},  
			FigureIsDead	{Tag = "CultGuardian08"},
			FigureIsDead	{Tag = "CultGuardian09"},
			FigureIsDead	{Tag = "CultGuardian10"},
			FigureIsDead	{Tag = "CultGuardian11"},
			FigureIsDead	{Tag = "CultGuardian12"},
			FigureIsDead	{Tag = "CultGuardian13"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_GotInCity"},
		},
	},	
	
		OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopLiberateAya"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopLiberateAya"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopLiberateAya"},
			FigureIsDead	{Tag = "IceGuardian01"},
			FigureIsDead	{Tag = "IceGuardian02"},
			FigureIsDead	{Tag = "IceGuardian03"},
			FigureIsDead	{Tag = "IceGuardian04"},
			FigureIsDead	{Tag = "IceGuardian05"},
			FigureIsDead	{Tag = "IceGuardian06"},
			FigureIsDead	{Tag = "IceGuardian07"},  
			FigureIsDead	{Tag = "IceGuardian08"},
			FigureIsDead	{Tag = "IceGuardian09"},
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_IceGuardians"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopLiberateAya"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopLiberateAya"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopLiberateAya"},
			FigureIsDead	{Tag = "Necromancer01"},
			FigureIsDead	{Tag = "NecroGuard01"},
			FigureIsDead	{Tag = "NecroGuard02"},
			FigureIsDead	{Tag = "NecroGuard03"},
			FigureIsDead	{Tag = "NecroGuard04"},
			FigureIsDead	{Tag = "NecroGuard05"},
			FigureIsDead	{Tag = "NecroGuard06"},  
			FigureIsDead	{Tag = "NecroGuard07"},
			FigureIsDead	{Tag = "NecroGuard08"},
			FigureIsDead	{Tag = "NecroGuard09"},
			FigureIsDead	{Tag = "NecroGuard10"},
			
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_KilledNecromancer"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			QuestIsNotSolved	{Player = "pl_Human1", Quest = "CoopLiberateAya"},
			QuestIsNotSolved	{Player = "pl_Human2", Quest = "CoopLiberateAya"},
			QuestIsNotSolved	{Player = "pl_Human3", Quest = "CoopLiberateAya"},
			FigureIsDead	{Tag = "TeleporterBoss"},
			FigureIsDead	{Tag = "TeleportGuard01"},
			FigureIsDead	{Tag = "TeleportGuard02"},
			FigureIsDead	{Tag = "TeleportGuard03"},
			FigureIsDead	{Tag = "TeleportGuard04"},
			FigureIsDead	{Tag = "TeleportGuard05"},
			FigureIsDead	{Tag = "TeleportGuard06"},  
			
		},
		Actions = 
		{
			MapFlagSetTrue	{Name = "mf_KilledPortalGuardian"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_ArcheologistReward"},			
		},
		Actions = 
		{
			AvatarXPGive	{Player = "pl_Human1", Amount = 150},
			AvatarXPGive	{Player = "pl_Human2", Amount = 150},
			AvatarXPGive	{Player = "pl_Human3", Amount = 150},
		},
	},
};
