State
{
	StateName = "INIT",
	OnLeverEvent
	{
		Delay = 2,
		Lever = "MG_NecropolisGate_Switch_01",
		OnConditions = 
		{
		--		LeverIsOn	{},
		},
		Actions = 
		{
			MapFlagToggle	{Name = "mf_P502Torch1On"},	
			--MapFlagSetTrue	{Name = "mf_P502Torch1Toggle"},
			MapFlagToggle	{Name = "mf_P502Torch2On"},				
			--MapFlagSetTrue	{Name = "mf_P502Torch2Toggle"},
			MapFlagToggle	{Name = "mf_P502Torch3On"},				
			--MapFlagSetTrue	{Name = "mf_P502Torch3Toggle"},
			MapFlagSetTrue	{Name = "mf_P502_LeverStatusChanged"},	
		},
	};	



}