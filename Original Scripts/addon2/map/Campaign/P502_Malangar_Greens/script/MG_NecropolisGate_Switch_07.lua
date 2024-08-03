State
{
	StateName = "INIT",
	OnLeverEvent
	{
		Delay = 2,
		Lever = "MG_NecropolisGate_Switch_07",
		OnConditions = 
		{
		--		LeverIsOn	{},
		},
		Actions = 
		{
			MapFlagToggle	{Name = "mf_P502Torch5On"},	
			--MapFlagSetTrue	{Name = "mf_P502Torch5Toggle"},
			MapFlagToggle	{Name = "mf_P502Torch6On"},				
			--MapFlagSetTrue	{Name = "mf_P502Torch6Toggle"},
			MapFlagToggle	{Name = "mf_P502Torch7On"},				
			--MapFlagSetTrue	{Name = "mf_P502Torch7Toggle"},
			MapFlagSetTrue	{Name = "mf_P502_LeverStatusChanged"},		
		},
	};	



}