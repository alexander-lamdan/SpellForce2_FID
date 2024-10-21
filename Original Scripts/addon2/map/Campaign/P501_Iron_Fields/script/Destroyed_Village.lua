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
			MapFlagSetFalse {Name = "mf_P501_RightTurnRing"},
			MapFlagSetFalse {Name = "mf_P501_LeftTurnRing"},
			MapFlagSetFalse {Name = "mf_P501_RemoveRing"},
		},
		GotoState = "State01",	
	},
}

State
{
	StateName = "State01",
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_RightTurnRing"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P501_RightTurnRing"},
		},
		GotoState = "State02",
	};
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_LeftTurnRing"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P501_LeftTurnRing"},
		},
	};
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_RemoveRing"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P501_RemoveRing"},
		},
	};
}
	
	
State
{
	StateName = "State02",
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_RightTurnRing"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P501_RightTurnRing"},
		},
		GotoState = "State03",
	};
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_LeftTurnRing"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P501_LeftTurnRing"},
		},
		GotoState = "State01",
	};
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_RemoveRing"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P501_RemoveRing"},
		},
		GotoState = "State01",
	};
}

State
{
	StateName = "State03",
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_RightTurnRing"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P501_RightTurnRing"},
		},
	};
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_LeftTurnRing"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P501_LeftTurnRing"},
		},
		GotoState = "State04",
	};
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_RemoveRing"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P501_RemoveRing"},
		},
		GotoState = "State01",
	};
}


State
{
	StateName = "State04",
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_RightTurnRing"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P501_RightTurnRing"},
		},
		GotoState = "State05",
	};
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_LeftTurnRing"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P501_LeftTurnRing"},
		},
		GotoState = "State01",
	};
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_RemoveRing"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P501_RemoveRing"},
		},
		GotoState = "State01",
	};
}


State
{
	StateName = "State05",
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_RightTurnRing"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P501_RightTurnRing"},
		},
		GotoState = "State06",
	};
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_LeftTurnRing"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P501_LeftTurnRing"},
		},
		GotoState = "State01",
	};
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_RemoveRing"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P501_RemoveRing"},
		},
		GotoState = "State01",
	};
}


State
{
	StateName = "State06",
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_RightTurnRing"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P501_RightTurnRing"},
		},
		GotoState = "State03",
	};
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_LeftTurnRing"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P501_LeftTurnRing"},
		},
		GotoState = "State07",
	};
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_RemoveRing"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P501_RemoveRing"},
		},
		GotoState = "State01",
	};
}


State
{
	StateName = "State07",
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_RightTurnRing"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P501_RightTurnRing"},
		},
		GotoState = "State02",
	};
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_LeftTurnRing"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P501_LeftTurnRing"},
		},
		GotoState = "State08",
	};
	
	OnEvent
	{
		Conditions = 
		{
			MapFlagIsTrue {Name = "mf_P501_RemoveRing"},
		},
		Actions = 
		{
			MapFlagSetFalse {Name = "mf_P501_RemoveRing"},
		},
		GotoState = "State01",
	};
}


State
{
	StateName = "State08",
	OnOneTimeEvent
	{
		Conditions = 
		{},
		Actions = 
		{
			MapFlagSetTrue {Name = "mf_P501_ChestPuzzleComplete"},
		},
	}
}