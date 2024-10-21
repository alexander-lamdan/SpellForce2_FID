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
			PlayerKitTransfer		{PlayerKit = "pk_HeroHall1", Player = "pl_Human1"},
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
			PlayerKitTransfer		{PlayerKit = "pk_HeroHall2", Player = "pl_Human2"},
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
			PlayerKitTransfer		{PlayerKit = "pk_HeroHall3", Player = "pl_Human3"},
		},
	},
	
	---------------------------------------------------------------------------------
	OnOneTimeEvent
	{
		Conditions = 
		{
			CoopPlayerIsNotPlaying {Player = "pl_Human1"},
		},
		Actions =
		{
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
			BuildingDestroy {Tag = "HeroHall13"},
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
			PlayerKitTransfer		{PlayerKit = "pk_HeroHall11", Player = "pl_Human1"},
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
			PlayerKitTransfer		{PlayerKit = "pk_HeroHall12", Player = "pl_Human2"},
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
			PlayerKitTransfer		{PlayerKit = "pk_HeroHall13", Player = "pl_Human3"},
		},
	},
};

