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
			
			EntityTimerStart	{Name = "et_P504_CastingTimer"},
			FigureAnimPlayLooped	{Tag = "default", File = "addon2/gfx/figures/demonic/figure_demonic_npc_mage_spellcast_loop.ska"},
			FigureHoldPosition {},
		},
	};

	OnEvent
	{
		EventName = "SpellEvent",
		Conditions = 
		{
			EntityTimerIsElapsed{Name = "et_P504_CastingTimer", Seconds = 5},
		},
		Actions = 
		{
			--FigureCastSpellToEntity	{Spell = 33, Power = 1, TargetTag = "WS_sharandal_01"},
			--FigureAnimPlayOnce	{Tag = "default", File = "addon2/gfx/figures/demonic/figure_demonic_npc_mage_spellcast_loop.ska"},
			--EffectStartAddon2	{Tag = "default", File = "Effect_Demonic_Mage_Magic_Shrandal"},
			EntityTimerStop		{Name = "et_P504_CastingTimer"},
			--EntityTimerStart	{Name = "et_P504_CastingTimer"},
		},
		GotoState = self,
	};
}