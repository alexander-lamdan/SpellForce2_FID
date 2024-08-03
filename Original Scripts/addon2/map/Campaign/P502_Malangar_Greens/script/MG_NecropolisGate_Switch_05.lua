State
{
	StateName = "INIT",
	OnLeverEvent
	{
		Delay = 2,
		Lever = "MG_NecropolisGate_Switch_05",
		OnConditions = 
		{
		--		LeverIsOn	{},
		},
		Actions = 
		{
			MapFlagToggle	{Name = "mf_P502Torch3On"},	
			--MapFlagSetTrue	{Name = "mf_P502Torch3Toggle"},
			MapFlagToggle	{Name = "mf_P502Torch4On"},				
			--MapFlagSetTrue	{Name = "mf_P502Torch4Toggle"},
			MapFlagToggle	{Name = "mf_P502Torch5On"},				
			--MapFlagSetTrue	{Name = "mf_P502Torch5Toggle"},
			MapFlagSetTrue	{Name = "mf_P502_LeverStatusChanged"},	
		},
	};	
}