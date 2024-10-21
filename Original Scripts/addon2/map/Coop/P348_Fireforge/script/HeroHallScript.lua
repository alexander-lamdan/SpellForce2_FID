State
{
	StateName = "INIT",
	OnOneTimeEvent
	{
		Conditions = 
		{
			CoopPlayerIsNotPlaying {Player = "pl_Human1"},
		},
		Actions =
		{
			BuildingDestroy {Tag = "HeroHall1"},
			BuildingDestroy {Tag = "HeroHall11"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			CoopPlayerIsNotPlaying {Player = "pl_Human2"},
		},
		Actions =
		{
			BuildingDestroy {Tag = "HeroHall2"},
			BuildingDestroy {Tag = "HeroHall12"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			CoopPlayerIsNotPlaying {Player = "pl_Human3"},
		},
		Actions =
		{
			BuildingDestroy {Tag = "HeroHall3"},
			BuildingDestroy {Tag = "HeroHall13"},
		},
	},
	
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange 	{Tag = "pl_Human1Avatar", TargetTag = "HeroHall1", Range = 20},
		},
		Actions =
		{
			PlayerKitTransfer		{PlayerKit = "pk_Herohall1", Player = "pl_Human1"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange 	{Tag = "pl_Human2Avatar", TargetTag = "HeroHall2", Range = 20},
		},
		Actions =
		{
			PlayerKitTransfer		{PlayerKit = "pk_Herohall2", Player = "pl_Human2"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange 	{Tag = "pl_Human3Avatar", TargetTag = "HeroHall3", Range = 20},
		},
		Actions =
		{
			PlayerKitTransfer		{PlayerKit = "pk_Herohall3", Player = "pl_Human3"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange 	{Tag = "pl_Human1Avatar", TargetTag = "HeroHall11", Range = 20},
		},
		Actions =
		{
			PlayerKitTransfer		{PlayerKit = "pk_Herohall11", Player = "pl_Human1"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange 	{Tag = "pl_Human2Avatar", TargetTag = "HeroHall12", Range = 20},
		},
		Actions =
		{
			PlayerKitTransfer		{PlayerKit = "pk_Herohall12", Player = "pl_Human2"},
		},
	},
	OnOneTimeEvent
	{
		Conditions = 
		{
			FigureIsInEntityRange 	{Tag = "pl_Human3Avatar", TargetTag = "HeroHall13", Range = 20},
		},
		Actions =
		{
			PlayerKitTransfer		{PlayerKit = "pk_Herohall13", Player = "pl_Human3"},
		},
	},
};

