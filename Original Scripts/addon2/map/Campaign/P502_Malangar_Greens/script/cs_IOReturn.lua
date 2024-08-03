--************************************************************
--**
--**		Malangar Greens  :: Necropolis
--**
--************************************************************

local _tRenderList = CutsceneFigureRenderList{Tag = "pl_HumanAvatar"}
_tRenderList.tModFuncs =
{
	Add =
	{
		"'pl_HumanHeroCaine'",
		"'pl_HumanHeroIO'",
		"'pl_HumanHeroSariel'",
		"'pl_HumanHeroAntara'",
		"'Twiddle'",
		"'Cutscene_06_Druid'",
		"'Cutscene06_Ranger_01'",
		"'Cutscene06_Ranger_02'",
		"'Cutscene06_Ranger_03'",
		"'Cutscene06_Ranger_04'",
		"'Cutscene06_Ranger_05'",
		"'Cutscene06_Ranger_06'",
		"'Cutscene06_Ranger_07'",
		"'Cutscene06_Ranger_08'",
		"'Cutscene06_Ranger_09'",
		"'Cutscene06_Ranger_10'",
		"'Cutscene06_Ranger_11'",
		"'Cutscene06_Ranger_12'",
		"'Cutscene06_Druid_01'",
		"'Cutscene06_Druid_02'",
		"'Cutscene06_Druid_03'",
		"'Cutscene06_Druid_04'",
		"'Cutscene06_Druid_05'",	
		"'Surian_CS_Somthing_to_Fightfor'",
		"'Elf10_CS_Somthing_to_Fightfor'",
		--"'Elf04_CS_Somthing_to_Fightfor'",
		"'Elf09_CS_Somthing_to_Fightfor'",
		"'Elf07_CS_Somthing_to_Fightfor'",
		"'Demon06_CS_Somthing_to_Fightfor'",
		"'Demon03_CS_Somthing_to_Fightfor'",
		"'Demon01_CS_Somthing_to_Fightfor'",
		"'Demon07_CS_Somthing_to_Fightfor'",
		--"'Elf06_CS_Somthing_to_Fightfor'",
		--"'Elf05_Cs_Somthing_To_Fightfor'",
		"'Elf08_CS_Somthing_to_Fightfor'",
		--"'Elf03_CS_Somthing_to_Fightfor'",
		"'Demon02_CS_Somthing_to_Fightfor'",
		"'Demon04_CS_Somthing_to_Fightfor'",
		"'Demon05_CS_Somthing_to_Fightfor'",
		"'Elf01_CS_Somthing_to_Fightfor'",
		"'Elf11_CS_Somthing_to_Fightfor'",
		--"'Elf02_CS_Somthing_to_Fightfor'",
	}
}

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
			FigureVanish	{Tag = "Cutscene_06_Io"}, 
			FigureVanish	{Tag = "Cutscene_06_Caine"},
			FigureVanish	{Tag = "Cutscene_06_Antra"},
			FigureVanish	{Tag = "Cutscene_06_Sariel"},
			FigureVanish	{Tag = "Cutscene_06_Avatar"},
			FigureVanish	{Tag = "CS_Professor_Twiddle"},
			FigureVanish	{Tag = "Cutscene_06_Druid"},
			
			FigureVanish {Tag = "Cutscene06_Ranger_01"},
			FigureVanish {Tag = "Cutscene06_Ranger_02"},
			FigureVanish {Tag = "Cutscene06_Ranger_03"},
			FigureVanish {Tag = "Cutscene06_Ranger_04"},
			FigureVanish {Tag = "Cutscene06_Ranger_05"},
			FigureVanish {Tag = "Cutscene06_Ranger_06"},
			FigureVanish {Tag = "Cutscene06_Ranger_07"},
			FigureVanish {Tag = "Cutscene06_Ranger_08"},
			FigureVanish {Tag = "Cutscene06_Ranger_09"},
			FigureVanish {Tag = "Cutscene06_Ranger_10"},
			FigureVanish {Tag = "Cutscene06_Ranger_11"},
			FigureVanish {Tag = "Cutscene06_Ranger_12"},
			FigureVanish {Tag = "Cutscene06_Druid_01"},
			FigureVanish {Tag = "Cutscene06_Druid_02"},
			FigureVanish {Tag = "Cutscene06_Druid_03"},
			FigureVanish {Tag = "Cutscene06_Druid_04"},
			FigureVanish {Tag = "Cutscene06_Druid_05"},	
			
			FigureVanish {Tag = "Avatar02_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Avatar_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Io02_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Io_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Surian02_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Surian_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Elf10_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Elf04_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Elf09_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Elf07_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Demon06_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Demon03_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Demon01_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Demon07_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Elf06_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Elf05_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Elf08_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Elf03_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Demon02_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Demon04_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Demon05_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Elf01_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Elf11_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Elf02_CS_Somthing_to_Fightfor"},
		},
		GotoState = self,
	};



	OnCutsceneFigureRespawnEvent	-- 
	{
		Conditions =
		{	
				MapFlagIsTrue {Name = "mf_p502_StartSomethingToFightForCS"},
		},
		Actions =
		{
			_tRenderList,
			CutsceneBegin{},
			
			FigureTeleport {Tag = "Surian_CS_Somthing_to_Fightfor",X = 399.112, Y = 228.924},
			FigureLookAtDirection {Tag = "Surian_CS_Somthing_to_Fightfor", Direction = 296.975},
			FigureTeleport {Tag = "Surian_CS_Somthing_to_Fightfor",X = 399.112, Y = 228.924},
			FigureLookAtDirection {Tag = "Surian_CS_Somthing_to_Fightfor", Direction = 296.975},
			FigureTeleport {Tag = "pl_HumanAvatar",X = 385.288, Y = 219.64},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 119.358},
			FigureTeleport {Tag = "pl_HumanHeroIO",X = 393.444, Y = 216.274},
			FigureLookAtDirection {Tag = "pl_HumanHeroIO", Direction = 233.949},
			
			FigureTeleport {Tag = "Elf10_CS_Somthing_to_Fightfor" , X = 432.181, Y = 669.189},
			--FigureTeleport {Tag = "Elf04_CS_Somthing_to_Fightfor" , X = 432.544, Y = 664.534},
			FigureTeleport {Tag = "Elf09_CS_Somthing_to_Fightfor" , X = 432.383, Y = 661.391},
			FigureTeleport {Tag = "Elf07_CS_Somthing_to_Fightfor" , X = 432.38, Y = 657.601},
			FigureTeleport {Tag = "Demon07_CS_Somthing_to_Fightfor" , X = 435.284, Y = 654.726},
			--FigureTeleport {Tag = "Elf06_CS_Somthing_to_Fightfor" , X = 437.26, Y = 653.789},
			FigureTeleport {Tag = "Demon05_CS_Somthing_to_Fightfor" , X = 440.699, Y = 653.371},
			FigureTeleport {Tag = "Elf01_CS_Somthing_to_Fightfor" , X = 444.001, Y = 654.549},
			FigureTeleport {Tag = "Elf11_CS_Somthing_to_Fightfor" , X = 445.058, Y = 660.05},
			--FigureTeleport {Tag = "Elf02_CS_Somthing_to_Fightfor" , X = 442.072, Y = 659.551},
			FigureTeleport {Tag = "Demon02_CS_Somthing_to_Fightfor" , X = 442.4, Y = 662.457},
			--FigureTeleport {Tag = "Elf03_CS_Somthing_to_Fightfor" , X = 438.831, Y = 664.73},
			FigureTeleport {Tag = "Elf08_CS_Somthing_to_Fightfor" , X = 438.163, Y = 662.382},
			--FigureTeleport {Tag = "Elf05_CS_Somthing_to_Fightfor" , X = 437.15, Y = 658.958},
			FigureTeleport {Tag = "Demon01_CS_Somthing_to_Fightfor" , X = 436.249, Y = 667.829},
			FigureTeleport {Tag = "Demon03_CS_Somthing_to_Fightfor" , X = 435.979, Y = 663.179},
			FigureTeleport {Tag = "Demon04_CS_Somthing_to_Fightfor" , X = 439.48, Y = 657.433},
			FigureTeleport {Tag = "Demon06_CS_Somthing_to_Fightfor" , X = 434.137, Y = 658.685},

			CutsceneFigureWeaponsHide {Tag = "Twiddle"},
			CutsceneFigureWeaponsHide {Tag = "Cutscene_06_Druid"},
			--CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroIO"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroAntara"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanHeroSariel"},
			CutsceneFigureWeaponsHide {Tag = "pl_HumanAvatar"},

			EntityTimerStart {Name = "et_CStimer"},
		},
		Coop = false,
		Tags = _tRenderList,
		GotoState = "Cutscene01",
	},
}

State
{
	StateName = "Cutscene01",
	OnOneTimeEvent	
	{
		Conditions =
		{
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_06_Take_04", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IORETURNSURIAN01", Tag = "Surian_CS_Somthing_to_Fightfor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene02",
	},
};

State
{
	StateName = "Cutscene02",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone{},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_06_Take_08", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IORETURNAVATAR02", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene03",
	},
};

State
{
	StateName = "Cutscene03",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone{},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_06_Take_05", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IORETURNIO03", Tag = "pl_HumanHeroIO"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene04",
	},
};

State
{
	StateName = "Cutscene04",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone{},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_06_Take_06", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IORETURNSURIAN02", Tag = "Surian_CS_Somthing_to_Fightfor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene05",
	},
};

State
{
	StateName = "Cutscene05",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone{},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_06_Take_07", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneCombatOn {},
			FigureTeleport {Tag = "Surian_CS_Somthing_to_Fightfor",X = 428.292, Y = 648.001},
			FigureLookAtDirection {Tag = "Surian_CS_Somthing_to_Fightfor", Direction = 126.051},
			FigureTeleport {Tag = "pl_HumanHeroIO",X = 428.292, Y = 648.001},
			FigureLookAtDirection {Tag = "pl_HumanHeroIO", Direction = 126.051},
			FigureTeleport {Tag = "pl_HumanAvatar",X = 432.604, Y = 644.824},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 142.276},
			FigureTeleport {Tag = "Elf10_CS_Somthing_to_Fightfor" , X = 432.181, Y = 669.189},
			--FigureTeleport {Tag = "Elf04_CS_Somthing_to_Fightfor" , X = 432.544, Y = 664.534},
			FigureTeleport {Tag = "Elf09_CS_Somthing_to_Fightfor" , X = 432.383, Y = 661.391},
			FigureTeleport {Tag = "Elf07_CS_Somthing_to_Fightfor" , X = 432.38, Y = 657.601},
			FigureTeleport {Tag = "Demon07_CS_Somthing_to_Fightfor" , X = 435.284, Y = 654.726},
			--FigureTeleport {Tag = "Elf06_CS_Somthing_to_Fightfor" , X = 437.26, Y = 653.789},
			FigureTeleport {Tag = "Demon05_CS_Somthing_to_Fightfor" , X = 440.699, Y = 653.371},
			FigureTeleport {Tag = "Elf01_CS_Somthing_to_Fightfor" , X = 444.001, Y = 654.549},
			FigureTeleport {Tag = "Elf11_CS_Somthing_to_Fightfor" , X = 445.058, Y = 660.05},
			--FigureTeleport {Tag = "Elf02_CS_Somthing_to_Fightfor" , X = 442.072, Y = 659.551},
			FigureTeleport {Tag = "Demon02_CS_Somthing_to_Fightfor" , X = 442.4, Y = 662.457},
			--FigureTeleport {Tag = "Elf03_CS_Somthing_to_Fightfor" , X = 438.831, Y = 664.73},
			FigureTeleport {Tag = "Elf08_CS_Somthing_to_Fightfor" , X = 438.163, Y = 662.382},
			--FigureTeleport {Tag = "Elf05_CS_Somthing_to_Fightfor" , X = 437.15, Y = 658.958},
			FigureTeleport {Tag = "Demon01_CS_Somthing_to_Fightfor" , X = 436.249, Y = 667.829},
			FigureTeleport {Tag = "Demon03_CS_Somthing_to_Fightfor" , X = 435.979, Y = 663.179},
			FigureTeleport {Tag = "Demon04_CS_Somthing_to_Fightfor" , X = 439.48, Y = 657.433},
			FigureTeleport {Tag = "Demon06_CS_Somthing_to_Fightfor" , X = 434.137, Y = 658.685},
			
			
			FigureAbilityAdd {Tag = "Demon01_CS_Somthing_to_Fightfor", AbilityId = Ability.Immortal },
			FigureAbilityAdd {Tag = "Demon02_CS_Somthing_to_Fightfor", AbilityId = Ability.Immortal },
			FigureAbilityAdd {Tag = "Demon03_CS_Somthing_to_Fightfor", AbilityId = Ability.Immortal },
			FigureAbilityAdd {Tag = "Demon04_CS_Somthing_to_Fightfor", AbilityId = Ability.Immortal },
			FigureAbilityAdd {Tag = "Demon05_CS_Somthing_to_Fightfor", AbilityId = Ability.Immortal },
			FigureAbilityAdd {Tag = "Demon06_CS_Somthing_to_Fightfor", AbilityId = Ability.Immortal },
			FigureAbilityAdd {Tag = "Demon07_CS_Somthing_to_Fightfor", AbilityId = Ability.Immortal },
			FigureAbilityAdd {Tag = "Elf01_CS_Somthing_to_Fightfor", AbilityId = Ability.Immortal },
			--FigureAbilityAdd {Tag = "Elf02_CS_Somthing_to_Fightfor", AbilityId = Ability.Immortal },
			--FigureAbilityAdd {Tag = "Elf03_CS_Somthing_to_Fightfor", AbilityId = Ability.Immortal },
			--FigureAbilityAdd {Tag = "Elf04_CS_Somthing_to_Fightfor", AbilityId = Ability.Immortal },
			--FigureAbilityAdd {Tag = "Elf05_CS_Somthing_to_Fightfor", AbilityId = Ability.Immortal },
			--FigureAbilityAdd {Tag = "Elf06_CS_Somthing_to_Fightfor", AbilityId = Ability.Immortal },
			FigureAbilityAdd {Tag = "Elf07_CS_Somthing_to_Fightfor", AbilityId = Ability.Immortal },
			FigureAbilityAdd {Tag = "Elf08_CS_Somthing_to_Fightfor", AbilityId = Ability.Immortal },
			FigureAbilityAdd {Tag = "Elf09_CS_Somthing_to_Fightfor", AbilityId = Ability.Immortal },
			FigureAbilityAdd {Tag = "Elf10_CS_Somthing_to_Fightfor", AbilityId = Ability.Immortal },
			FigureAbilityAdd {Tag = "Elf11_CS_Somthing_to_Fightfor", AbilityId = Ability.Immortal },
			
			
			FigureTeamTransfer {Tag = "Demon01_CS_Somthing_to_Fightfor", Team = "tm_team2"},
			FigureTeamTransfer {Tag = "Demon02_CS_Somthing_to_Fightfor", Team = "tm_team2"},
			FigureTeamTransfer {Tag = "Demon03_CS_Somthing_to_Fightfor", Team = "tm_team2"},
			FigureTeamTransfer {Tag = "Demon04_CS_Somthing_to_Fightfor", Team = "tm_team2"},
			FigureTeamTransfer {Tag = "Demon05_CS_Somthing_to_Fightfor", Team = "tm_team2"},
			FigureTeamTransfer {Tag = "Demon06_CS_Somthing_to_Fightfor", Team = "tm_team2"},
			FigureTeamTransfer {Tag = "Demon07_CS_Somthing_to_Fightfor", Team = "tm_team2"},
			
			FigureTeamTransfer {Tag = "Elf01_CS_Somthing_to_Fightfor", Team = "tm_team1"},
			--FigureTeamTransfer {Tag = "Elf02_CS_Somthing_to_Fightfor", Team = "tm_team1"},
			--FigureTeamTransfer {Tag = "Elf03_CS_Somthing_to_Fightfor", Team = "tm_team1"},
			--FigureTeamTransfer {Tag = "Elf04_CS_Somthing_to_Fightfor", Team = "tm_team1"},
			--FigureTeamTransfer {Tag = "Elf05_CS_Somthing_to_Fightfor", Team = "tm_team1"},
			--FigureTeamTransfer {Tag = "Elf06_CS_Somthing_to_Fightfor", Team = "tm_team1"},
			FigureTeamTransfer {Tag = "Elf07_CS_Somthing_to_Fightfor", Team = "tm_team1"},
			FigureTeamTransfer {Tag = "Elf08_CS_Somthing_to_Fightfor", Team = "tm_team1"},
			FigureTeamTransfer {Tag = "Elf09_CS_Somthing_to_Fightfor", Team = "tm_team1"},
			FigureTeamTransfer {Tag = "Elf10_CS_Somthing_to_Fightfor", Team = "tm_team1"},
			FigureTeamTransfer {Tag = "Elf11_CS_Somthing_to_Fightfor", Team = "tm_team1"},
			
			
			FigureAttackEntity {Tag = "Elf01_CS_Somthing_to_Fightfor", TargetTag = "Demon05_CS_Somthing_to_Fightfor"},
			--FigureAttackEntity {Tag = "Elf02_CS_Somthing_to_Fightfor", TargetTag = "Demon02_CS_Somthing_to_Fightfor"},
			--FigureAttackEntity {Tag = "Elf03_CS_Somthing_to_Fightfor", TargetTag = "Demon01_CS_Somthing_to_Fightfor"},
			--FigureAttackEntity {Tag = "Elf04_CS_Somthing_to_Fightfor", TargetTag = "Demon05_CS_Somthing_to_Fightfor"},
			--FigureAttackEntity {Tag = "Elf05_CS_Somthing_to_Fightfor", TargetTag = "Demon03_CS_Somthing_to_Fightfor"},
			--FigureAttackEntity {Tag = "Elf06_CS_Somthing_to_Fightfor", TargetTag = "Demon07_CS_Somthing_to_Fightfor"},
			FigureAttackEntity {Tag = "Elf07_CS_Somthing_to_Fightfor", TargetTag = "Demon06_CS_Somthing_to_Fightfor"},
			FigureAttackEntity {Tag = "Elf08_CS_Somthing_to_Fightfor", TargetTag = "Demon04_CS_Somthing_to_Fightfor"},
			FigureAttackEntity {Tag = "Elf09_CS_Somthing_to_Fightfor", TargetTag = "Demon06_CS_Somthing_to_Fightfor"},
			FigureAttackEntity {Tag = "Elf10_CS_Somthing_to_Fightfor", TargetTag = "Demon01_CS_Somthing_to_Fightfor"},
			FigureAttackEntity {Tag = "Elf11_CS_Somthing_to_Fightfor", TargetTag = "Demon02_CS_Somthing_to_Fightfor"},
			
			--FigureAttackEntity {Tag = "Demon01_CS_Somthing_to_Fightfor", TargetTag = "Elf08_CS_Somthing_to_Fightfor"},
			--FigureAttackEntity {Tag = "Demon03_CS_Somthing_to_Fightfor", TargetTag = "Elf04_CS_Somthing_to_Fightfor"},
			--FigureAttackEntity {Tag = "Demon06_CS_Somthing_to_Fightfor", TargetTag = "Elf07_CS_Somthing_to_Fightfor"},
			--FigureAttackEntity {Tag = "Demon07_CS_Somthing_to_Fightfor", TargetTag = "Elf06_CS_Somthing_to_Fightfor"},
			--FigureAttackEntity {Tag = "Demon05_CS_Somthing_to_Fightfor", TargetTag = "Elf01_CS_Somthing_to_Fightfor"},
			--FigureAttackEntity {Tag = "Demon02_CS_Somthing_to_Fightfor", TargetTag = "Elf02_CS_Somthing_to_Fightfor"},
			--FigureAttackEntity {Tag = "Demon04_CS_Somthing_to_Fightfor", TargetTag = "Elf05_CS_Somthing_to_Fightfor"},
			
			
			--FigureAttackEntity {Tag = "Elf01_CS_Somthing_to_Fightfor", TargetTag = "Demon05_CS_Somthing_to_Fightfor"},
			--FigureAttackEntity {Tag = "Elf02_CS_Somthing_to_Fightfor", TargetTag = "Demon02_CS_Somthing_to_Fightfor"},
			--FigureAttackEntity {Tag = "Elf03_CS_Somthing_to_Fightfor", TargetTag = "Demon01_CS_Somthing_to_Fightfor"},
			--FigureAttackEntity {Tag = "Elf04_CS_Somthing_to_Fightfor", TargetTag = "Demon01_CS_Somthing_to_Fightfor"},
			--FigureAttackEntity {Tag = "Elf05_CS_Somthing_to_Fightfor", TargetTag = "Demon03_CS_Somthing_to_Fightfor"},
			--FigureAttackEntity {Tag = "Elf06_CS_Somthing_to_Fightfor", TargetTag = "Demon07_CS_Somthing_to_Fightfor"},
			--FigureAttackEntity {Tag = "Elf07_CS_Somthing_to_Fightfor", TargetTag = "Demon06_CS_Somthing_to_Fightfor"},
			--FigureAttackEntity {Tag = "Elf08_CS_Somthing_to_Fightfor", TargetTag = "Demon04_CS_Somthing_to_Fightfor"},
			--FigureAttackEntity {Tag = "Elf09_CS_Somthing_to_Fightfor", TargetTag = "Demon06_CS_Somthing_to_Fightfor"},
			--FigureAttackEntity {Tag = "Elf10_CS_Somthing_to_Fightfor", TargetTag = "Demon01_CS_Somthing_to_Fightfor"},
			--FigureAttackEntity {Tag = "Elf11_CS_Somthing_to_Fightfor", TargetTag = "Demon02_CS_Somthing_to_Fightfor"},
					
			FigureAttackEntity {Tag = "pl_HumanAvatar",TargetTag = "Demon07_CS_Somthing_to_Fightfor"},
			FigureAttackEntity {Tag = "pl_HumanHeroIO",TargetTag = "Demon05_CS_Somthing_to_Fightfor"},
			
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene06",
	},
};


State
{
	StateName = "Cutscene06",
	OnOneTimeEvent	
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer",Seconds = 4},
		},
		Actions =
		{
			FigureAbilityRemove	{Tag = "Demon01_CS_Somthing_to_Fightfor", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "Demon02_CS_Somthing_to_Fightfor", AbilityId = Ability.Immortal },
			FigureKill {Tag = "Demon01_CS_Somthing_to_Fightfor"},
			FigureKill {Tag = "Demon02_CS_Somthing_to_Fightfor"},
		},
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer",Seconds = 5},
		},
		Actions =
		{
			FigureAbilityRemove	{Tag = "Demon03_CS_Somthing_to_Fightfor", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "Demon04_CS_Somthing_to_Fightfor", AbilityId = Ability.Immortal },
			FigureKill {Tag = "Demon03_CS_Somthing_to_Fightfor"},
			FigureKill {Tag = "Demon04_CS_Somthing_to_Fightfor"},
		},
	},
	
	OnOneTimeEvent	
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer",Seconds = 6},
		},
		Actions =
		{
			FigureAbilityRemove	{Tag = "Demon05_CS_Somthing_to_Fightfor", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "Demon06_CS_Somthing_to_Fightfor", AbilityId = Ability.Immortal },
			FigureAbilityRemove	{Tag = "Demon07_CS_Somthing_to_Fightfor", AbilityId = Ability.Immortal },
			FigureKill {Tag = "Demon05_CS_Somthing_to_Fightfor"},
			FigureKill {Tag = "Demon06_CS_Somthing_to_Fightfor"},
			FigureKill {Tag = "Demon07_CS_Somthing_to_Fightfor"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene07",
	},
};

State
{
	StateName = "Cutscene07",
	OnOneTimeEvent	
	{
		Conditions =
		{
			EntityTimerIsElapsed {Name = "et_CStimer",Seconds = 4},
		},
		Actions =
		{
			CutsceneCombatOff {},
			FigureVanish {Tag = "Elf01_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Elf07_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Elf08_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Elf09_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Elf10_CS_Somthing_to_Fightfor"},
			FigureVanish {Tag = "Elf11_CS_Somthing_to_Fightfor"},
			
			CutsceneFigureTeleport {Tag = "pl_HumanHeroIO", X = 460.848, Y = 655.132},
			FigureLookAtDirection {Tag = "pl_HumanHeroIO", Direction = 91.6733},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroCaine", X = 459.868, Y = 652.687},
			FigureLookAtDirection {Tag = "pl_HumanHeroCaine", Direction = 131.78},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroAntara", X = 463.124, Y = 653.103},
			FigureLookAtDirection {Tag = "pl_HumanHeroAntara", Direction = 177.617},
			CutsceneFigureTeleport {Tag = "pl_HumanHeroSariel", X = 461.096, Y = 651.747},
			FigureLookAtDirection {Tag = "pl_HumanHeroSariel", Direction = 148.969},
			CutsceneFigureTeleport {Tag = "pl_HumanAvatar", X = 461.514, Y = 653.602},
			FigureLookAtDirection {Tag = "pl_HumanAvatar", Direction = 154.699},
			CutsceneFigureTeleport {Tag = "Twiddle", X = 461.966, Y = 656.813},
			FigureLookAtDirection {Tag = "Twiddle", Direction = 17.1887},
			CutsceneFigureTeleport {Tag = "Cutscene_06_Druid", X = 463.478, Y = 655.661},
			FigureLookAtDirection {Tag = "Cutscene_06_Druid", Direction = 284.552},
			CutsceneFigureTeleport {Tag = "Cutscene06_Druid_01", X = 470.79, Y = 667.647},
  		FigureLookAtDirection {Tag = "Cutscene06_Druid_01", Direction = 337.082},
  		CutsceneFigureTeleport {Tag = "Cutscene06_Druid_02", X = 473.931, Y = 664.58},
  		FigureLookAtDirection {Tag = "Cutscene06_Druid_02", Direction = 302.704},
  		CutsceneFigureTeleport {Tag = "Cutscene06_Druid_03", X = 473.707, Y = 662.525},
  		FigureLookAtDirection {Tag = "Cutscene06_Druid_03", Direction = 302.704},
  		CutsceneFigureTeleport {Tag = "Cutscene06_Druid_04", X = 468.684, Y = 659.471},
  		FigureLookAtDirection {Tag = "Cutscene06_Druid_04", Direction = 262.597},
  		CutsceneFigureTeleport {Tag = "Cutscene06_Druid_05", X = 473.218, Y = 658.317},
  		FigureLookAtDirection {Tag = "Cutscene06_Druid_05", Direction = 262.597},
  		CutsceneFigureTeleport {Tag = "Cutscene06_Ranger_01", X = 462.313, Y = 661.291},
  		FigureLookAtDirection {Tag = "Cutscene06_Ranger_01", Direction = 325.623},
  		CutsceneFigureTeleport {Tag = "Cutscene06_Ranger_02", X = 464.018, Y = 663.694},
  		FigureLookAtDirection {Tag = "Cutscene06_Ranger_02", Direction = 325.623},
  		CutsceneFigureTeleport {Tag = "Cutscene06_Ranger_03", X = 466.235, Y = 663.575},
  		FigureLookAtDirection {Tag = "Cutscene06_Ranger_03", Direction = 325.623},
  		CutsceneFigureTeleport {Tag = "Cutscene06_Ranger_04", X = 468.071, Y = 666.113},
  		FigureLookAtDirection {Tag = "Cutscene06_Ranger_04", Direction = 325.623},
  		CutsceneFigureTeleport {Tag = "Cutscene06_Ranger_05", X = 471.308, Y = 664.884},
  		FigureLookAtDirection {Tag = "Cutscene06_Ranger_05", Direction = 308.434},
  		CutsceneFigureTeleport {Tag = "Cutscene06_Ranger_06", X = 469.347, Y = 661.925},
  		FigureLookAtDirection {Tag = "Cutscene06_Ranger_06", Direction = 308.434},
  		CutsceneFigureTeleport {Tag = "Cutscene06_Ranger_07", X = 466.567, Y = 660.455},
  		FigureLookAtDirection {Tag = "Cutscene06_Ranger_07", Direction = 314.163},
  		CutsceneFigureTeleport {Tag = "Cutscene06_Ranger_08", X = 461.379, Y = 665.538},
  		FigureLookAtDirection {Tag = "Cutscene06_Ranger_08", Direction = 325.623},
			CutsceneFigureTeleport {Tag = "Cutscene06_Ranger_09", X = 472.18, Y = 659.501},
			FigureLookAtDirection {Tag = "Cutscene06_Ranger_09", Direction = 308.434},
			CutsceneFigureTeleport {Tag = "Cutscene06_Ranger_10", X = 469.619, Y = 652.963},
			FigureLookAtDirection {Tag = "Cutscene06_Ranger_10", Direction = 251.138},
			CutsceneFigureTeleport {Tag = "Cutscene06_Ranger_11", X = 471.922, Y = 653.153},
			FigureLookAtDirection {Tag = "Cutscene06_Ranger_11", Direction = 262.597},
			CutsceneFigureTeleport {Tag = "Cutscene06_Ranger_12", X = 468.629, Y = 654.697},
			FigureLookAtDirection {Tag = "Cutscene06_Ranger_12", Direction = 268.327},
			
			NoSpawnEffect{Spawn = FigureNpcSpawnToEntity {Tag = "AllElves", Level = 30, UnitId = 1761, TargetTag = "pl_HumanAvatar", Team = "tm_Neutral"}},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene08",
	},
};



State
{
	StateName = "Cutscene08",
	OnOneTimeEvent	
	{
		Conditions =
		{
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_06_Take_02", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IORETURNDRUID01", Tag = "Cutscene_06_Druid"},
			EntityTimerStart {Name = "et_CStimer"},
		},
		GotoState = "Cutscene09",
	},
};

State
{
	StateName = "Cutscene09",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},
		},
		Actions =
		{
			CutsceneSay {TextTag = "IORETURNAVATAR01", Tag = "pl_HumanAvatar"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene10",
	},	
};


State
{
	StateName = "Cutscene10",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
			--EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_06_Take_03", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IORETURNIO01", Tag = "pl_HumanHeroIO"},
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene11",
	},	
};


State
{
	StateName = "Cutscene11",
	OnOneTimeEvent	
	{
		Conditions =
		{			
			CutsceneSayIsDone {},
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 10},
		},
		Actions =
		{
			CameraTrackClear {},
			CameraTakeAddToTrack {File = "CS_06_Take_01", Tag = "default", TargetTag = "default"},
			CameraTrackPlay {},
			CutsceneSay {TextTag = "IORETURNELVES01", Tag = "AllElves"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene12",
	},	
};


State
{
	StateName = "Cutscene12",
	OnOneTimeEvent	
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CutsceneSay {TextTag = "IORETURNIO02", Tag = "pl_HumanHeroIO"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene13",
	},	
};

State
{
	StateName = "Cutscene13",
	OnOneTimeEvent
	{
		Conditions =
		{
			CutsceneSayIsDone {},
		},
		Actions =
		{
			CutsceneSay {TextTag = "IORETURNELVES02", Tag = "AllElves"},			
			EntityTimerStart {Name = "et_CStimer"},
		},	
		GotoState = "Cutscene14",
	},	
};

State
{
	StateName = "Cutscene14",
	OnCutsceneFigureDespawnEvent	-- 
	{
		Conditions =
		{
			--CutsceneSayIsDone {},	
			EntityTimerIsElapsed {Name = "et_CStimer", Seconds = 5},
		},
		Actions =
		{
			
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroIO"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroCaine"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroAntara"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanHeroSariel"},
			CutsceneFigureWeaponsShow {Tag = "pl_HumanAvatar"},
			CutsceneFigureWeaponsShow {Tag = "Twiddle"},
			CutsceneFigureWeaponsShow {Tag = "Cutscene_06_Druid"},
			FigureVanish {Tag = "AllElves"},

			EntityTimerStop	{Name = "et_CStimer"},			
			CameraTrackClear {},
			CameraStop {},
			CutsceneEnd	{},	
			FadeInEffectStart{},
			CutsceneFigureRenderAll {},
			MapFlagSetTrue {Name = "mf_p502_EndSomethingToFightForCS"},
	},	
		GotoState = "CutsceneEnd",
	},	
};

State
{
	StateName = "CutsceneEnd",
};