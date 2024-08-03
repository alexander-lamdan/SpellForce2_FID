State
{
	StateName = "INIT",
	
	OnFigureSpawnOnlyWhenEvent
	{
		Conditions = 
		{
		},
		Actions = 
		{
			EntityTimerStart	{Name = "et_P504_CastingTimer"},
			FigureHoldPosition {},
		},
		NoSpawnEffect = true,
	};

--	OnEvent
--	{
		--EventName = "SpellEvent",
		--Conditions = 
		--{
--			EntityTimerIsElapsed{Name = "et_P504_CastingTimer", Seconds = 5},
		--},
		--Actions = 
		--{
			--FigureCastSpellToEntity	{Spell = 86, Power = 1, TargetTag = "WS_sharandal_01"},
			--FigureAnimPlayOnce	{Tag = "default", File = "addon2/gfx/figures/demonic/figure_demonic_npc_grand_master_combatmagic_2.ska"},
--			EntityTimerStart	{Name = "et_P504_CastingTimer"},
	--	},
		--GotoState = self,
	--};
}