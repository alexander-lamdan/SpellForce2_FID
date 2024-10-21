State
{
	StateName = "INIT",
	OnLeverEvent
	{
		Delay = 2,
		Lever = "MG_NecropolisGate_Switch_03",
		OnConditions = 
		{
		--		LeverIsOn	{},
		},
		Actions = 
		{
			MapFlagToggle	{Name = "mf_P502Torch3On"},	
			--MapFlagSetTrue	{Name = "mf_P502Torch3Toggle"},
			MapFlagToggle	{Name = "mf_P502Torch5On"},				
			--MapFlagSetTrue	{Name = "mf_P502Torch5Toggle"},
			MapFlagToggle	{Name = "mf_P502Torch6On"},				
			--MapFlagSetTrue	{Name = "mf_P502Torch6Toggle"},
			MapFlagSetTrue	{Name = "mf_P502_LeverStatusChanged"},		
		},
	};	



}