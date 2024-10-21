State
{
	StateName = "INIT",
-------------------------
-- Cutscene 01 Niethalf
-------------------------

	-- Niethalf Spawn
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P353_Judgement_Stones_01_SOUND_Play_Niethalf_Spawn"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/ui_unit_spawned", X = 360.008, Y = 22, Z = 353.473, MaxRange = 50, FallOffRange = 10}, -- 2.3s
		},
	},
	-- Prophet Despawn
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P353_Judgement_Stones_01_SOUND_Play_Prophet_Despawn"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "04_spells/fx_despawn_unit", X = 362.886, Y = 21.5, Z = 355.804, MaxRange = 50, FallOffRange = 10}, -- 3.4s
		},
	},
	-- Zerbo Attack
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P353_Judgement_Stones_01_SOUND_Play_Zerbo_Attack"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "03_creeps/creep_jaguar_att3", X = 359.501, Y = 21.5, Z = 356.032, MaxRange = 50, FallOffRange = 10}, -- 0.8s
		},
	},
	-- Niethalf Hit
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P353_Judgement_Stones_01_SOUND_Play_Niethalf_Hit"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "09_combat/unit_defender_die1", X = 360.008, Y = 22, Z = 353.473, MaxRange = 50, FallOffRange = 10}, -- 2.2s
		},
	},
	-- Niethalf Vanish
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P353_Judgement_Stones_01_SOUND_Play_Niethalf_Vanish"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "04_spells/fx_god_vanishing", X = 360.008, Y = 22, Z = 353.473, MaxRange = 50, FallOffRange = 10}, -- 4.9s
		},
	},
-------------------------
-- Cutscene 02 Zerbo Down
-------------------------

	-- keine Soundeffekte
	
-------------------------
-- Cutscene 03 Naugron Defeated
-------------------------

	-- Pick Up Mirror
	OnOneTimeEvent	
	{
		Conditions =
		{
			MapFlagIsTrue {Name = "mf_P313_Crater_03_SOUND_Play_Pick_Up_Mirror"},
		},
		Actions =
		{
			SoundAmbientPlayOnce {File = "07_ui/ui_got_item", X = 170.497, Y = 22, Z = 262.886, MaxRange = 50, FallOffRange = 10}, -- 2.3s
		},
	},

};