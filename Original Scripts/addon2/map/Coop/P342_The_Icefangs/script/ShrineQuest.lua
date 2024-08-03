for i = 1, 3 do
	local sPlayerName = "pl_Human" .. i
	
	-- ********************************************************************
	-- solved, wenn bei allen Schreinen gewesen
	-- ********************************************************************
	OnOneTimeEvent
	{
		EventName = "Player0"..i.."FoundIceShrine",
		Conditions = 
		{
			QuestIsActive	{Player = sPlayerName, Quest = "CoopHolyShrines"},
			MapFlagIsTrue   {Name   = "mf_FoundIceShrine"},
			AvatarFlagIsFalse {Player = sPlayerName, Name  = "af_P342_VisitedIcefangsShrine"},	
		},
		Actions = 
		{
			AvatarFlagSetTrue {Player = sPlayerName, Name  = "af_P342_VisitedIcefangsShrine"},	
			AvatarFlagSetTrue {Player = sPlayerName, Name  = "af_P342_FoundShrine"},	 
		},
	}
	OnOneTimeEvent
	{
		EventName = "Player0"..i.."FoundAllShrines",
		Conditions = 
		{
			QuestIsActive	 {Player = sPlayerName, Quest = "CoopHolyShrines"},
			AvatarFlagIsTrue {Player = sPlayerName, Name  = "af_P342_VisitedIcefangsShrine"},	
			AvatarFlagIsTrue {Player = sPlayerName, Name  = "af_P347_VisitedSundancerShrine"},	
			AvatarFlagIsTrue {Player = sPlayerName, Name  = "af_P350_VisitedIronheartShrine"},	
		},
		Actions = 
		{
			QuestSetSolved	{Player = sPlayerName, Quest = "CoopHolyShrines"},
			QuestSetActive	{Player = sPlayerName, Quest = "CoopHolyShrinesVisited"},
		},
	}
end
State
{
	StateName = "IceShrine"
};