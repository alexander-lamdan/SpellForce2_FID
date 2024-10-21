-- für copy&paste:
-- SingleMapLoadEvent einladen
--dofile("addon2/script/TestCampaignSingleMapLoadEvents.lua")


local tActions

-- Iron Fields
if 401 == GetPlatformId() then
	tActions =
	{
	}
	
end

-- CampaignStarted flag immer auf true setzen:
table.insert(tActions, AvatarFlagSetTrue	{Name = "af_P501_CampaignStarted"})

-- und das event einfügen
OnOneTimeEvent
{
	EventName = "InitCampaignSingleMapLoadP" .. GetPlatformId(),
	Conditions = 
	{
		AvatarFlagIsFalse{Name = "af_P501_CampaignStarted"},
	},
	Actions = tActions,
}
