State
{
	StateName = "INIT",
	OnLeverEvent
	{
		Delay = 2,
		Lever = "MG_NecropolisGate_Switch_06",
		OnConditions = 
		{
		--		LeverIsOn	{},
		},
		Actions = 
		{
			MapFlagToggle	{Name = "mf_P502Torch2On"},	
			--MapFlagSetTrue	{Name = "mf_P502Torch2Toggle"},
			MapFlagToggle	{Name = "mf_P502Torch4On"},				
			--MapFlagSetTrue	{Name = "mf_P502Torch4Toggle"},
			MapFlagToggle	{Name = "mf_P502Torch6On"},				
			--MapFlagSetTrue	{Name = "mf_P502Torch6Toggle"},
			MapFlagSetTrue	{Name = "mf_P502_LeverStatusChanged"},	
		},
	};	



}