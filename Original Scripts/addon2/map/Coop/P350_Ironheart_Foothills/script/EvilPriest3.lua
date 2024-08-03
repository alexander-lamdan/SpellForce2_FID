sAlignment = "Evil"
if sAlignment == "Evil" then
	OnOneTimeEvent
	{
		EventName = "PriestAttacks",
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_PriestAttacksOrVanishes", Seconds = 12},
		},
		Actions = 
		{
			FigureTeamTransfer	{Tag = "default", Team = "tm_Enemy"},
		},
		GotoState = "END",
	}
else
	OnOneTimeEvent
	{
		EventName = "PriestVanishEffectStarts",
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_PriestAttacksOrVanishes", Seconds = 10},
		},
		Actions = 
		{
			EffectStart	{Tag = "default", File = "Effect_DeSpawn_Unit"},
		},
	}
	OnOneTimeEvent
	{
		EventName = "PriestVanishes",
		Conditions = 
		{
			EntityTimerIsElapsed {Name = "et_PriestAttacksOrVanishes", Seconds = 12},
		},
		Actions = 
		{
			FigureVanish	{Tag = "default"},
		},
		GotoState = "END",
	}
end

State
{
	StateName = "MAIN",

	OnFigureSpawnOnlyWhenEvent
	{
		X = GetEntityX(),
		Y = GetEntityY(),
		Conditions = 
		{
			MapTimerIsElapsed {Name = "mt_Evoke" .. GetScriptTag(), Seconds = 5},
		},
		Actions = 
		{
			EffectStop	{Tag = sAlignment .. "Grave" .. string.sub(GetScriptTag(), -1)},
		},
		DelayedActions = 
		{
			FigureOutcry	{TextTag = sAlignment .. "Priest01", Tag = "default"},
			FigureOutcry	{TextTag = sAlignment .. "Priest02", Tag = "default"},
			EntityTimerStart	{Name = "et_PriestAttacksOrVanishes"},
		},
	};
	
};

State
{
	StateName = "END",
};