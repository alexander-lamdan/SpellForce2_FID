
-----------------------------------------------------------------
-- WARNUNG !!!!!
-- die Reihenfolge der Events hier ist ganz wichtig !!!!!!!!!
-----------------------------------------------------------------

State
{
	StateName = "INIT",

	OnEvent
	{
		EventName = "Init",
		Conditions = 
		{
		},
		Actions = 
		{
			--MapFlagSetTrue	{Name = "mf_HeroAbility_AddAfterMapChange"},
		},
		GotoState = "HeroAbilities",
	};
};

tAbilities =
{
	--Whisper	= {461, 473},
	--Wind	= {461, 343},
	--Caine	= {461, 153},
	--Yasha	= {461, 400},
	--Mordecay	= {279},
	Whisper	= {327, 473},
	Wind	= {225, 343},
	Caine	= {397, 153},
	Yasha	= {350, 400},
	Mordecay	= {279},
}

for sHero, tAbility in pairs(tAbilities) do
	-- Abilities each Hero ALWAYS has ...
	local iAbilityId = tAbility[1]
	
	OnEvent
	{
		EventName = "HeroAbility1_GiveToHero" .. sHero,
		Conditions = 
		{
			FigureHasNotAbility	{Tag = "pl_HumanHero" .. sHero, AbilityId = iAbilityId},
			--OR
			--{
			--	MapFlagIsTrue	{Name = "mf_HeroAbility_AddAfterMapChange"},
			--	MapFlagIsTrue	{Name = "mf_HeroAbility_AddAfterDeathOf" .. sHero},
			--},
			FigureIsAlive	{Tag = "pl_HumanHero" .. sHero},
		},
		Actions = 
		{
			DebugMessage	{Caption = "Hero Ability (re-)added (after Death or Mapchange)", Message = "Giving primary Ability " .. iAbilityId .. " to Hero " .. sHero .. ". This MessageBox is brought to you by Zwergenthaler Bartfrei!"},
			--FigureAbilityRemove	{Tag = "pl_HumanHero" .. sHero, AbilityId = iAbilityId},	-- um evtl. Dopplungen zu vermeiden!
			FigureAbilityAdd	{Tag = "pl_HumanHero" .. sHero, AbilityId = iAbilityId},
		},
	};
	
	local sTextTag1 = sHero .. "JoinsGroup"
	local sTextTag2 = sHero .. "JoinsAbility"
	if tOutcryText[sTextTag1] and tOutcryText[sTextTag2] then
		OnOneTimeEvent
		{
			EventName = "HeroAbility1_FirstTimeHeroJoined" .. sHero,
			Conditions = 
			{
				AvatarFlagIsFalse	{Name = "af_P400_Hero" .. sHero .. "HasJoinedTheGroup"},
				FigureIsAlive	{Tag = "pl_HumanHero" .. sHero},
			},
			Actions = 
			{
				AvatarFlagSetTrue	{Name = "af_P400_Hero" .. sHero .. "HasJoinedTheGroup"},
				NoSpawnEffect{Spawn = FigureNpcSpawnToEntity	{Tag = "_HeroAbilityNoteOutcry", Level = 30, UnitId = 1448, TargetTag = "pl_HumanAvatar", Team = "tm_Neutral"}},
				FigureOutcry	{Tag = "_HeroAbilityNoteOutcry", TextTag = sTextTag1},
				FigureOutcry	{Tag = "_HeroAbilityNoteOutcry", TextTag = sTextTag2},
				FigureVanish	{Tag = "_HeroAbilityNoteOutcry"},
			},
		};
	end

	--if DEBUG then
	--	OnEvent
	--	{
	--		EventName = "HeroAbility1_GiveToHero" .. sHero,
	--		Conditions = 
	--		{
	--			MapFlagIsTrue	{Name = "mf_HeroAbility_AddAfterDeathOf" .. sHero},
	--			FigureIsAlive	{Tag = "pl_HumanHero" .. sHero},
	--		},
	--		Actions = 
	--		{
	--			--DebugMessage	{Caption = "Hero Ability (re-)added", Message = "Giving primary Ability " .. iAbilityId .. " to Hero " .. sHero .. ". This MessageBox is brought to you by Zwergenthaler Bartfrei!"},
	--		},
	--	};
	--end


	-- Abilities Hero gets after completing his/her Hero Quest
	iAbilityId = tAbility[2]
	if iAbilityId then
		OnEvent
		{
			EventName = "HeroAbility2_GiveToHero" .. sHero,
			Conditions = 
			{
				AvatarFlagIsTrue	{Name = "af_P400_GiveHeroAbilityTo" .. sHero},
				FigureHasNotAbility	{Tag = "pl_HumanHero" .. sHero, AbilityId = iAbilityId},
				--OR
				--{
				--	MapFlagIsTrue	{Name = "mf_HeroAbility_AddAfterMapChange"},
				--	MapFlagIsTrue	{Name = "mf_HeroAbility_AddAfterDeathOf" .. sHero},
				--},
				FigureIsAlive	{Tag = "pl_HumanHero" .. sHero},
			},
			Actions = 
			{
				DebugMessage	{Caption = "Hero Ability (re-)added (after Death or Mapchange)", Message = "Giving secondary Ability " .. iAbilityId .. " to Hero " .. sHero .. ". This MessageBox is brought to you by Zwergenthaler Bartfrei!"},
				--FigureAbilityRemove	{Tag = "pl_HumanHero" .. sHero, AbilityId = iAbilityId},	-- um evtl. Dopplungen zu vermeiden!
				FigureAbilityAdd	{Tag = "pl_HumanHero" .. sHero, AbilityId = iAbilityId},
			},
		};

		OnOneTimeEvent
		{
			EventName = "HeroAbility2_FirstTimeGiveToHero" .. sHero .. "_SPAWN",
			Conditions = 
			{
				AvatarFlagIsTrue	{Name = "af_P400_GiveHeroAbilityTo" .. sHero},
				AvatarFlagIsFalse	{Name = "af_P400_FirstTimeGiveHeroAbilityTo" .. sHero},
				FigureIsDead	{Tag = "pl_HumanHero" .. sHero},
				FigureIsAlive	{Tag = "pl_HumanAvatar"},
			},
			Actions = 
			{
				FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "Hero" .. sHero, TargetTag = "pl_HumanAvatar", Direction = 0},
			},
		};
		OnOneTimeEvent
		{
			EventName = "HeroAbility2_FirstTimeGiveToHero" .. sHero .. "_SPAWN",
			Conditions = 
			{
				AvatarFlagIsTrue	{Name = "af_P400_GiveHeroAbilityTo" .. sHero},
				AvatarFlagIsFalse	{Name = "af_P400_FirstTimeGiveHeroAbilityTo" .. sHero},
				FigureIsDead	{Tag = "pl_HumanHero" .. sHero},
				FigureIsDead	{Tag = "pl_HumanAvatar"},
			},
			Actions = 
			{
				FigureHeroSpawnToEntity	{Player = "pl_Human", Tag = "Hero" .. sHero, TargetTag = "pl_HumanAvatar_DEAD", Direction = 0},
			},
		};
		
		local sTextTag = sHero .. "GainsNewAbility"
		if tOutcryText[sTextTag] then
			OnOneTimeEvent
			{
				EventName = "HeroAbility2_FirstTimeGiveToHero" .. sHero,
				Conditions = 
				{
					AvatarFlagIsTrue	{Name = "af_P400_GiveHeroAbilityTo" .. sHero},
					AvatarFlagIsFalse	{Name = "af_P400_FirstTimeGiveHeroAbilityTo" .. sHero},
				},
				Actions = 
				{
					AvatarFlagSetTrue	{Name = "af_P400_FirstTimeGiveHeroAbilityTo" .. sHero},
					DebugMessage	{Caption = "New Hero Ability " .. iAbilityId .. " gained!", Message = "Hero " .. sHero .. " gained a new ability since his/her HeroQuest was completed. This MessageBox is brought to you by Zwerg-Online - rasende Zwerge in rosa Unterhosen!"},
					FigureAbilityAdd	{Tag = "pl_HumanHero" .. sHero, AbilityId = iAbilityId},
					
					NoSpawnEffect{Spawn = FigureNpcSpawnToEntity	{Tag = "_HeroAbilityNoteOutcry", Level = 30, UnitId = 1448, TargetTag = "pl_HumanAvatar", Team = "tm_Neutral"}},
					FigureOutcry	{Tag = "_HeroAbilityNoteOutcry", TextTag = sTextTag},
					FigureVanish	{Tag = "_HeroAbilityNoteOutcry"},
				},
			};
		end

		--if DEBUG then
		--	OnEvent
		--	{
		--		EventName = "HeroAbility2_GiveToHero" .. sHero,
		--		Conditions = 
		--		{
		--			AvatarFlagIsTrue	{Name = "af_P400_GiveHeroAbilityTo" .. sHero},
		--			MapFlagIsTrue	{Name = "mf_HeroAbility_AddAfterDeathOf" .. sHero},
		--			FigureIsAlive	{Tag = "pl_HumanHero" .. sHero},
		--		},
		--		Actions = 
		--		{
		--			DebugMessage	{Caption = "Hero Ability (re-)added", Message = "Giving secondary Ability " .. iAbilityId .. " to Hero " .. sHero .. ". This MessageBox is brought to you by Zwergenthaler Bartfrei!"},
		--		},
		--	};
		--end
	end


--	-- die Reihenfolge dieser zwei events ist wichtig!
--	OnEvent
--	{
--		EventName = "HeroAbility_Hero" .. sHero .. "_IsAliveAgain",
--		Conditions = 
--		{
--			MapFlagIsTrue	{Name = "mf_HeroAbility_AddAfterDeathOf" .. sHero},
--			FigureIsAlive	{Tag = "pl_HumanHero" .. sHero},
--		},
--		Actions = 
--		{
--			MapFlagSetFalse	{Name = "mf_HeroAbility_AddAfterDeathOf" .. sHero},
--			--DebugMessage	{Caption = "Hero Abilities", Message = "Hero " .. sHero .. " was resurrected, setting DeadFlag to FALSE again."},
--		},
--	};
--	OnEvent
--	{
--		EventName = "HeroAbility_Hero" .. sHero .. "_HasDied",
--		Conditions = 
--		{
--			MapFlagIsFalse	{Name = "mf_HeroAbility_AddAfterDeathOf" .. sHero},
--			FigureIsDead	{Tag = "pl_HumanHero" .. sHero},
--		},
--		Actions = 
--		{
--			MapFlagSetTrue	{Name = "mf_HeroAbility_AddAfterDeathOf" .. sHero},
--			--DebugMessage	{Caption = "Hero Abilities", Message = "Hero " .. sHero .. " has died, setting DeadFlag to TRUE."},
--		},
--	};
end

State
{
	StateName = "HeroAbilities",
	
	--OnEvent
	--{
	--	EventName = "HeroAbilitiesGivenAfterMapChange",
	--	Conditions = 
	--	{
	--		MapFlagIsTrue	{Name = "mf_HeroAbility_AddAfterMapChange"},
	--	},
	--	Actions = 
	--	{
	--		MapFlagSetFalse	{Name = "mf_HeroAbility_AddAfterMapChange"},
	--		DebugMessage	{Caption = "Hero Abilities given after MapChange", Message = "Player travelled between maps, all heroes were given their abilities again."},
	--	},
	--};
};
