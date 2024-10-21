local _uSM = GdsCreateStateMachine ("crafting02_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState4 = GdsCreateState (_uSM, "State_4")
_uState6 = GdsCreateState (_uSM, "State_6")
_uState18 = GdsCreateState (_uSM, "State_18")
_uState28 = GdsCreateState (_uSM, "State_28")
_uState38 = GdsCreateState (_uSM, "State_38")
_uState46 = GdsCreateState (_uSM, "State_46")
_uState48 = GdsCreateState (_uSM, "State_48")
_uState57 = GdsCreateState (_uSM, "State_57")
_uState59 = GdsCreateState (_uSM, "State_59")
_uState60 = GdsCreateState (_uSM, "State_60")
_uState66 = GdsCreateState (_uSM, "State_66")
_uState71 = GdsCreateState (_uSM, "State_71")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(CRAFTING02)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(CRAFTING02)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('crafting02', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "crafting02"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING02)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(CRAFTING02)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('crafting02', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("crafting02")
		_uRenderOnly:Add("Uland")
		_uRenderOnly:Add("Ur_Dragon")
		_uRenderOnly:Add("RenderInDialog01")
		_uRenderOnly:Add("RenderInDialog02")
		_uRenderOnly:Add("RenderInDialog03")
		_uRenderOnly:Add("RenderInDialog04")
		_uRenderOnly:Add("RenderInDialog05")
		_uRenderOnly:Add("RenderInDialog06")
		_uRenderOnly:Add("RenderInDialog07")
		_uRenderOnly:Add("RenderInDialog08")
		_uRenderOnly:Add("RenderInDialog09")
		_uRenderOnly:Add("RenderInDialog10")
	_uStateBeginDelayTrans:AddAction (_uRenderOnly)
	-- reset all choice onetime flags upon dialog begin
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING02)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING02)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(CRAFTING02)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting02"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting02', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING02)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState4Trans1 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T1", "Dialog")
	_uState4Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 2))
	_uState4Trans1:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_004PC", "(Bogen herstellen)", 1, 16777215))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 1, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState4Trans1 = nil

-- TO STATE: choice
_uState4Trans2 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T2", "Dialog")
	_uState4Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 2))
	_uState4Trans2:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_021PC", "(Langbogen herstellen)", 2, 16777215))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 1, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState4Trans2 = nil

-- TO STATE: choice
_uState4Trans3 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T3", "Dialog")
	_uState4Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 2))
	_uState4Trans3:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_035PC", "(Schnellbogen herstellen)", 3, 16777215))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 1, 4))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState4Trans3 = nil

-- TO STATE: choice
_uState4Trans4 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T4", "Dialog")
	_uState4Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 2))
	_uState4Trans4:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_049PC", "(Schwere Armbrust herstellen)", 4, 16777215))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 1, 4))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState4Trans4 = nil

-- TO STATE: choice
_uState4Trans5 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T5", "Dialog")
	_uState4Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 2))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 0, 4))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CRAFTING02)', 1, 4))
	_uState4Trans5:AddAction (CScriptActionShowChoices())
	_uState4Trans5 = nil

-- TO STATE: choice
_uState4Trans6 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T6", "Dialog")
	_uState4Trans6:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_CreoInspected', 0, 2) ))
	_uState4Trans6:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_003", "(An diesem Creo können Fernkampfwaffen hergestellt werden.)", 102, 16777215))
	_uState4Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState4Trans6 = nil

-- TO STATE: choice
_uState4Trans7 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T7", "Dialog")
	_uState4Trans7:AddCondition (CScriptConditionValue('', 'mf_CreoInspected', 0, 2))
	_uState4Trans7:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_001", "Dies ist ein Creo, eine Art Werkbank, welche die Former zum Herstellen von Ausrüstung verwendet haben.", 100, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_002", "(An diesem Creo können Fernkampfwaffen hergestellt werden.)", 101, 16777215))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'mf_CreoInspected', 1, 4))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState4Trans7 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting02"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState4, _uBeginState, "State_4", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting02"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting02', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING02)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState6Trans1 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T1", "Dialog")
	_uState6Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 2))
	_uState6Trans1:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 339, 1, 1, 1))
	_uState6Trans1:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_006PC", "(Winderz (Stufe 18) )", 1, 16777215))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 1, 4))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState6Trans1 = nil

-- TO STATE: choice
_uState6Trans2 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T2", "Dialog")
	_uState6Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 2))
	_uState6Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1))
	_uState6Trans2:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_007PC", "(Iridiumerz (Stufe 20) )", 2, 16777215))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 1, 4))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState6Trans2 = nil

-- TO STATE: choice
_uState6Trans3 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T3", "Dialog")
	_uState6Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 2))
	_uState6Trans3:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1))
	_uState6Trans3:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_008PC", "(Lythaniumstaub (Stufe 24) )", 3, 16777215))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 1, 4))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState6Trans3 = nil

-- TO STATE: choice
_uState6Trans4 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T4", "Dialog")
	_uState6Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 2))
	_uState6Trans4:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1))
	_uState6Trans4:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_009PC", "(Adamantinumerz (Stufe 26) )", 4, 16777215))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 1, 4))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState6Trans4 = nil

-- TO STATE: choice
_uState6Trans5 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T5", "Dialog")
	_uState6Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 2))
	_uState6Trans5:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1))
	_uState6Trans5:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_010PC", "(Kristallstaub (Stufe 30) )", 5, 16777215))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 1, 4))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState6Trans5 = nil

-- TO STATE: choice
_uState6Trans6 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T6", "Dialog")
	_uState6Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 2))
	_uState6Trans6:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 339, 1, 1, 1) ))
	_uState6Trans6:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_011PC", "(Winderz (Stufe 18) )", 6, 16711680))
	_uState6Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 1, 4))
	_uState6Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState6Trans6 = nil

-- TO STATE: choice
_uState6Trans7 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T7", "Dialog")
	_uState6Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 2))
	_uState6Trans7:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1) ))
	_uState6Trans7:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_013PC", "(Iridiumerz (Stufe 20) )", 7, 16711680))
	_uState6Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 1, 4))
	_uState6Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState6Trans7 = nil

-- TO STATE: choice
_uState6Trans8 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T8", "Dialog")
	_uState6Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 2))
	_uState6Trans8:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1) ))
	_uState6Trans8:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_015PC", "(Lythaniumstaub (Stufe 24) )", 8, 16711680))
	_uState6Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 1, 4))
	_uState6Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState6Trans8 = nil

-- TO STATE: choice
_uState6Trans9 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T9", "Dialog")
	_uState6Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING02)', 0, 2))
	_uState6Trans9:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1) ))
	_uState6Trans9:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_017PC", "(Adamantinumerz (Stufe 26) )", 9, 16711680))
	_uState6Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING02)', 1, 4))
	_uState6Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState6Trans9 = nil

-- TO STATE: choice
_uState6Trans10 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T10", "Dialog")
	_uState6Trans10:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING02)', 0, 2))
	_uState6Trans10:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1) ))
	_uState6Trans10:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_019PC", "(Kristallstaub (Stufe 30) )", 10, 16711680))
	_uState6Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING02)', 1, 4))
	_uState6Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState6Trans10 = nil

-- TO STATE: choice
_uState6Trans11 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T11", "Dialog")
	_uState6Trans11:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 2))
	_uState6Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 0, 4))
	_uState6Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CRAFTING02)', 1, 4))
	_uState6Trans11:AddAction (CScriptActionShowChoices())
	_uState6Trans11 = nil

-- TO STATE: choice
_uState6Trans12 = GdsCreateTransition (_uState4, _uState6, "State_4", "State_6_T12", "Dialog")
	_uState6Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 1))
	_uState6Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_004PC", "(Bogen herstellen)", 99, 16777215))
	_uState6Trans12:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_005", "(Aus welchem Werkstoff soll der Bogen hergestellt werden?)", 104, 16777215))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState6Trans12 = nil

-- TO STATE: choice
_uState6Trans13 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T13", "Dialog")
	_uState6Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 6))
	_uState6Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_011PC", "(Winderz (Stufe 18) )", 99, 16711680))
	_uState6Trans13:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_012", "(Ihr besitzt kein Winderz.)", 111, 16777215))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING02)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING02)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState6Trans13 = nil

-- TO STATE: choice
_uState6Trans14 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T14", "Dialog")
	_uState6Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 7))
	_uState6Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_013PC", "(Iridiumerz (Stufe 20) )", 99, 16711680))
	_uState6Trans14:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_014", "(Ihr besitzt kein Iridiumerz.)", 113, 16777215))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING02)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING02)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState6Trans14 = nil

-- TO STATE: choice
_uState6Trans15 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T15", "Dialog")
	_uState6Trans15:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 8))
	_uState6Trans15:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_015PC", "(Lythaniumstaub (Stufe 24) )", 99, 16711680))
	_uState6Trans15:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_016", "(Ihr besitzt keinen Lythaniumstaub.)", 115, 16777215))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING02)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING02)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState6Trans15 = nil

-- TO STATE: choice
_uState6Trans16 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T16", "Dialog")
	_uState6Trans16:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 9))
	_uState6Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_017PC", "(Adamantinumerz (Stufe 26) )", 99, 16711680))
	_uState6Trans16:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_018", "(Ihr besitzt kein Adamantinumerz.)", 117, 16777215))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING02)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING02)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState6Trans16 = nil

-- TO STATE: choice
_uState6Trans17 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T17", "Dialog")
	_uState6Trans17:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 10))
	_uState6Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_019PC", "(Kristallstaub (Stufe 30) )", 99, 16711680))
	_uState6Trans17:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_020", "(Ihr besitzt keinen Kristallstaub.)", 119, 16777215))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING02)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING02)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState6Trans17 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting02"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState6, _uBeginState, "State_6", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting02"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting02', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING02)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState18Trans1 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T1", "Dialog")
	_uState18Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 2))
	_uState18Trans1:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1))
	_uState18Trans1:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_023PC", "(Iridiumerz (Stufe 20) )", 1, 16777215))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 1, 4))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState18Trans1 = nil

-- TO STATE: choice
_uState18Trans2 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T2", "Dialog")
	_uState18Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 2))
	_uState18Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1))
	_uState18Trans2:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_024PC", "(Lythaniumstaub (Stufe 24) )", 2, 16777215))
	_uState18Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 1, 4))
	_uState18Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState18Trans2 = nil

-- TO STATE: choice
_uState18Trans3 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T3", "Dialog")
	_uState18Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 2))
	_uState18Trans3:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1))
	_uState18Trans3:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_025PC", "(Adamantinumerz (Stufe 26) )", 3, 16777215))
	_uState18Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 1, 4))
	_uState18Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState18Trans3 = nil

-- TO STATE: choice
_uState18Trans4 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T4", "Dialog")
	_uState18Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 2))
	_uState18Trans4:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1))
	_uState18Trans4:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_026PC", "(Kristallstaub (Stufe 30) )", 4, 16777215))
	_uState18Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 1, 4))
	_uState18Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState18Trans4 = nil

-- TO STATE: choice
_uState18Trans5 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T5", "Dialog")
	_uState18Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 2))
	_uState18Trans5:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1) ))
	_uState18Trans5:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_027PC", "(Iridiumerz (Stufe 20) )", 5, 16711680))
	_uState18Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 1, 4))
	_uState18Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState18Trans5 = nil

-- TO STATE: choice
_uState18Trans6 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T6", "Dialog")
	_uState18Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 2))
	_uState18Trans6:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1) ))
	_uState18Trans6:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_029PC", "(Lythaniumstaub (Stufe 24) )", 6, 16711680))
	_uState18Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 1, 4))
	_uState18Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState18Trans6 = nil

-- TO STATE: choice
_uState18Trans7 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T7", "Dialog")
	_uState18Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 2))
	_uState18Trans7:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1) ))
	_uState18Trans7:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_031PC", "(Adamantinumerz (Stufe 26) )", 7, 16711680))
	_uState18Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 1, 4))
	_uState18Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState18Trans7 = nil

-- TO STATE: choice
_uState18Trans8 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T8", "Dialog")
	_uState18Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 2))
	_uState18Trans8:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1) ))
	_uState18Trans8:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_033PC", "(Kristallstaub (Stufe 30) )", 8, 16711680))
	_uState18Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 1, 4))
	_uState18Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState18Trans8 = nil

-- TO STATE: choice
_uState18Trans9 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T9", "Dialog")
	_uState18Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 2))
	_uState18Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 0, 4))
	_uState18Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CRAFTING02)', 1, 4))
	_uState18Trans9:AddAction (CScriptActionShowChoices())
	_uState18Trans9 = nil

-- TO STATE: choice
_uState18Trans10 = GdsCreateTransition (_uState4, _uState18, "State_4", "State_18_T10", "Dialog")
	_uState18Trans10:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 2))
	_uState18Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_021PC", "(Langbogen herstellen)", 99, 16777215))
	_uState18Trans10:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_022", "(Aus welchem Werkstoff soll der Langbogen hergestellt werden?)", 121, 16777215))
	_uState18Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState18Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState18Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState18Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState18Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState18Trans10 = nil

-- TO STATE: choice
_uState18Trans11 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T11", "Dialog")
	_uState18Trans11:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 5))
	_uState18Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_027PC", "(Iridiumerz (Stufe 20) )", 99, 16711680))
	_uState18Trans11:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_028", "(Ihr besitzt kein Iridiumerz.)", 127, 16777215))
	_uState18Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState18Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState18Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState18Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState18Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState18Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState18Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState18Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState18Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState18Trans11 = nil

-- TO STATE: choice
_uState18Trans12 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T12", "Dialog")
	_uState18Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 6))
	_uState18Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_029PC", "(Lythaniumstaub (Stufe 24) )", 99, 16711680))
	_uState18Trans12:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_030", "(Ihr besitzt keinen Lythaniumstaub.)", 129, 16777215))
	_uState18Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState18Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState18Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState18Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState18Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState18Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState18Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState18Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState18Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState18Trans12 = nil

-- TO STATE: choice
_uState18Trans13 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T13", "Dialog")
	_uState18Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 7))
	_uState18Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_031PC", "(Adamantinumerz (Stufe 26) )", 99, 16711680))
	_uState18Trans13:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_032", "(Ihr besitzt kein Adamantinumerz.)", 131, 16777215))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState18Trans13 = nil

-- TO STATE: choice
_uState18Trans14 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T14", "Dialog")
	_uState18Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 8))
	_uState18Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_033PC", "(Kristallstaub (Stufe 30) )", 99, 16711680))
	_uState18Trans14:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_034", "(Ihr besitzt keinen Kristallstaub.)", 133, 16777215))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState18Trans14 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting02"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState18, _uBeginState, "State_18", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting02"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting02', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING02)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState28Trans1 = GdsCreateTransition (_uState28, _uState28, "State_28", "State_28_T1", "Dialog")
	_uState28Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 2))
	_uState28Trans1:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1))
	_uState28Trans1:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_037PC", "(Iridiumerz (Stufe 20) )", 1, 16777215))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 1, 4))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState28Trans1 = nil

-- TO STATE: choice
_uState28Trans2 = GdsCreateTransition (_uState28, _uState28, "State_28", "State_28_T2", "Dialog")
	_uState28Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 2))
	_uState28Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1))
	_uState28Trans2:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_038PC", "(Lythaniumstaub (Stufe 24) )", 2, 16777215))
	_uState28Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 1, 4))
	_uState28Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState28Trans2 = nil

-- TO STATE: choice
_uState28Trans3 = GdsCreateTransition (_uState28, _uState28, "State_28", "State_28_T3", "Dialog")
	_uState28Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 2))
	_uState28Trans3:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1))
	_uState28Trans3:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_039PC", "(Adamantinumerz (Stufe 26) )", 3, 16777215))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 1, 4))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState28Trans3 = nil

-- TO STATE: choice
_uState28Trans4 = GdsCreateTransition (_uState28, _uState28, "State_28", "State_28_T4", "Dialog")
	_uState28Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 2))
	_uState28Trans4:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1))
	_uState28Trans4:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_040PC", "(Kristallstaub (Stufe 30) )", 4, 16777215))
	_uState28Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 1, 4))
	_uState28Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState28Trans4 = nil

-- TO STATE: choice
_uState28Trans5 = GdsCreateTransition (_uState28, _uState28, "State_28", "State_28_T5", "Dialog")
	_uState28Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 2))
	_uState28Trans5:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1) ))
	_uState28Trans5:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_041PC", "(Iridiumerz (Stufe 20) )", 5, 16711680))
	_uState28Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 1, 4))
	_uState28Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState28Trans5 = nil

-- TO STATE: choice
_uState28Trans6 = GdsCreateTransition (_uState28, _uState28, "State_28", "State_28_T6", "Dialog")
	_uState28Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 2))
	_uState28Trans6:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1) ))
	_uState28Trans6:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_043PC", "(Lythaniumstaub (Stufe 24) )", 6, 16711680))
	_uState28Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 1, 4))
	_uState28Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState28Trans6 = nil

-- TO STATE: choice
_uState28Trans7 = GdsCreateTransition (_uState28, _uState28, "State_28", "State_28_T7", "Dialog")
	_uState28Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 2))
	_uState28Trans7:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1) ))
	_uState28Trans7:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_045PC", "(Adamantinumerz (Stufe 26) )", 7, 16711680))
	_uState28Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 1, 4))
	_uState28Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState28Trans7 = nil

-- TO STATE: choice
_uState28Trans8 = GdsCreateTransition (_uState28, _uState28, "State_28", "State_28_T8", "Dialog")
	_uState28Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 2))
	_uState28Trans8:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1) ))
	_uState28Trans8:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_047PC", "(Kristallstaub (Stufe 30) )", 8, 16711680))
	_uState28Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 1, 4))
	_uState28Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState28Trans8 = nil

-- TO STATE: choice
_uState28Trans9 = GdsCreateTransition (_uState28, _uState28, "State_28", "State_28_T9", "Dialog")
	_uState28Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 2))
	_uState28Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 0, 4))
	_uState28Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CRAFTING02)', 1, 4))
	_uState28Trans9:AddAction (CScriptActionShowChoices())
	_uState28Trans9 = nil

-- TO STATE: choice
_uState28Trans10 = GdsCreateTransition (_uState4, _uState28, "State_4", "State_28_T10", "Dialog")
	_uState28Trans10:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 3))
	_uState28Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_035PC", "(Schnellbogen herstellen)", 99, 16777215))
	_uState28Trans10:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_036", "(Aus welchem Werkstoff soll der Schnellbogen hergestellt werden?)", 135, 16777215))
	_uState28Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState28Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState28Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState28Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState28Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState28Trans10 = nil

-- TO STATE: choice
_uState28Trans11 = GdsCreateTransition (_uState28, _uState28, "State_28", "State_28_T11", "Dialog")
	_uState28Trans11:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 5))
	_uState28Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_041PC", "(Iridiumerz (Stufe 20) )", 99, 16711680))
	_uState28Trans11:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_042", "(Ihr besitzt kein Iridiumerz.)", 141, 16777215))
	_uState28Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState28Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState28Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState28Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState28Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState28Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState28Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState28Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState28Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState28Trans11 = nil

-- TO STATE: choice
_uState28Trans12 = GdsCreateTransition (_uState28, _uState28, "State_28", "State_28_T12", "Dialog")
	_uState28Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 6))
	_uState28Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_043PC", "(Lythaniumstaub (Stufe 24) )", 99, 16711680))
	_uState28Trans12:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_044", "(Ihr besitzt keinen Lythaniumstaub.)", 143, 16777215))
	_uState28Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState28Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState28Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState28Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState28Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState28Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState28Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState28Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState28Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState28Trans12 = nil

-- TO STATE: choice
_uState28Trans13 = GdsCreateTransition (_uState28, _uState28, "State_28", "State_28_T13", "Dialog")
	_uState28Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 7))
	_uState28Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_045PC", "(Adamantinumerz (Stufe 26) )", 99, 16711680))
	_uState28Trans13:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_046", "(Ihr besitzt kein Adamantinumerz.)", 145, 16777215))
	_uState28Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState28Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState28Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState28Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState28Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState28Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState28Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState28Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState28Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState28Trans13 = nil

-- TO STATE: choice
_uState28Trans14 = GdsCreateTransition (_uState28, _uState28, "State_28", "State_28_T14", "Dialog")
	_uState28Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 8))
	_uState28Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_047PC", "(Kristallstaub (Stufe 30) )", 99, 16711680))
	_uState28Trans14:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_048", "(Ihr besitzt keinen Kristallstaub.)", 147, 16777215))
	_uState28Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState28Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState28Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState28Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState28Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState28Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState28Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState28Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState28Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState28Trans14 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState28, _uState28, "State_28", "State_28", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting02"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState28, _uBeginState, "State_28", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting02"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting02', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING02)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState38Trans1 = GdsCreateTransition (_uState38, _uState38, "State_38", "State_38_T1", "Dialog")
	_uState38Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 2))
	_uState38Trans1:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1))
	_uState38Trans1:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_051PC", "(Iridiumerz (Stufe 20) )", 1, 16777215))
	_uState38Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 1, 4))
	_uState38Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState38Trans1 = nil

-- TO STATE: choice
_uState38Trans2 = GdsCreateTransition (_uState38, _uState38, "State_38", "State_38_T2", "Dialog")
	_uState38Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 2))
	_uState38Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1))
	_uState38Trans2:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_052PC", "(Lythaniumstaub (Stufe 24) )", 2, 16777215))
	_uState38Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 1, 4))
	_uState38Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState38Trans2 = nil

-- TO STATE: choice
_uState38Trans3 = GdsCreateTransition (_uState38, _uState38, "State_38", "State_38_T3", "Dialog")
	_uState38Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 2))
	_uState38Trans3:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1))
	_uState38Trans3:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_053PC", "(Adamantinumerz (Stufe 26) )", 3, 16777215))
	_uState38Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 1, 4))
	_uState38Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState38Trans3 = nil

-- TO STATE: choice
_uState38Trans4 = GdsCreateTransition (_uState38, _uState38, "State_38", "State_38_T4", "Dialog")
	_uState38Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 2))
	_uState38Trans4:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1) ))
	_uState38Trans4:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_054PC", "(Iridiumerz (Stufe 20) )", 4, 16711680))
	_uState38Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 1, 4))
	_uState38Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState38Trans4 = nil

-- TO STATE: choice
_uState38Trans5 = GdsCreateTransition (_uState38, _uState38, "State_38", "State_38_T5", "Dialog")
	_uState38Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 2))
	_uState38Trans5:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1) ))
	_uState38Trans5:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_056PC", "(Lythaniumstaub (Stufe 24) )", 5, 16711680))
	_uState38Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 1, 4))
	_uState38Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState38Trans5 = nil

-- TO STATE: choice
_uState38Trans6 = GdsCreateTransition (_uState38, _uState38, "State_38", "State_38_T6", "Dialog")
	_uState38Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 2))
	_uState38Trans6:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1) ))
	_uState38Trans6:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_058PC", "(Adamantinumerz (Stufe 26) )", 6, 16711680))
	_uState38Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 1, 4))
	_uState38Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState38Trans6 = nil

-- TO STATE: choice
_uState38Trans7 = GdsCreateTransition (_uState38, _uState38, "State_38", "State_38_T7", "Dialog")
	_uState38Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 2))
	_uState38Trans7:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1) ))
	_uState38Trans7:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_060PC", "(Kristallstaub (Stufe 30) )", 7, 16711680))
	_uState38Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 1, 4))
	_uState38Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState38Trans7 = nil

-- TO STATE: choice
_uState38Trans8 = GdsCreateTransition (_uState38, _uState38, "State_38", "State_38_T8", "Dialog")
	_uState38Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 2))
	_uState38Trans8:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1))
	_uState38Trans8:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_062PC", "(Kristallstaub (Stufe 30) )", 8, 16777215))
	_uState38Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 1, 4))
	_uState38Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState38Trans8 = nil

-- TO STATE: choice
_uState38Trans9 = GdsCreateTransition (_uState38, _uState38, "State_38", "State_38_T9", "Dialog")
	_uState38Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 2))
	_uState38Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 0, 4))
	_uState38Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CRAFTING02)', 1, 4))
	_uState38Trans9:AddAction (CScriptActionShowChoices())
	_uState38Trans9 = nil

-- TO STATE: choice
_uState38Trans10 = GdsCreateTransition (_uState4, _uState38, "State_4", "State_38_T10", "Dialog")
	_uState38Trans10:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 4))
	_uState38Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_049PC", "(Schwere Armbrust herstellen)", 99, 16777215))
	_uState38Trans10:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_050", "(Aus welchem Werkstoff soll die Armbrust hergestellt werden?)", 149, 16777215))
	_uState38Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState38Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState38Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState38Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState38Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState38Trans10 = nil

-- TO STATE: choice
_uState38Trans11 = GdsCreateTransition (_uState38, _uState38, "State_38", "State_38_T11", "Dialog")
	_uState38Trans11:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 4))
	_uState38Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_054PC", "(Iridiumerz (Stufe 20) )", 99, 16711680))
	_uState38Trans11:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_055", "(Ihr besitzt kein Iridiumerz.)", 154, 16777215))
	_uState38Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState38Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState38Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState38Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState38Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState38Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState38Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState38Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState38Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState38Trans11 = nil

-- TO STATE: choice
_uState38Trans12 = GdsCreateTransition (_uState38, _uState38, "State_38", "State_38_T12", "Dialog")
	_uState38Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 5))
	_uState38Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_056PC", "(Lythaniumstaub (Stufe 24) )", 99, 16711680))
	_uState38Trans12:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_057", "(Ihr besitzt keinen Lythaniumstaub.)", 156, 16777215))
	_uState38Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState38Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState38Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState38Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState38Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState38Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState38Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState38Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState38Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState38Trans12 = nil

-- TO STATE: choice
_uState38Trans13 = GdsCreateTransition (_uState38, _uState38, "State_38", "State_38_T13", "Dialog")
	_uState38Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 6))
	_uState38Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_058PC", "(Adamantinumerz (Stufe 26) )", 99, 16711680))
	_uState38Trans13:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_059", "(Ihr besitzt kein Adamantinumerz.)", 158, 16777215))
	_uState38Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState38Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState38Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState38Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState38Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState38Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState38Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState38Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState38Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState38Trans13 = nil

-- TO STATE: choice
_uState38Trans14 = GdsCreateTransition (_uState38, _uState38, "State_38", "State_38_T14", "Dialog")
	_uState38Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 7))
	_uState38Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_060PC", "(Kristallstaub (Stufe 30) )", 99, 16711680))
	_uState38Trans14:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_061", "(Ihr besitzt keinen Kristallstaub.)", 160, 16777215))
	_uState38Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState38Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState38Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState38Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState38Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState38Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState38Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState38Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState38Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState38Trans14 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState38, _uState38, "State_38", "State_38", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting02"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState38, _uBeginState, "State_38", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting02"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting02', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING02)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState46Trans1 = GdsCreateTransition (_uState38, _uState46, "State_38", "State_46_T1", "Dialog")
	_uState46Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 8))
	_uState46Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_062PC", "(Kristallstaub (Stufe 30) )", 99, 16777215))
	_uState46Trans1:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 343, 4))
	_uState46Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState46Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState46Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState46Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState46Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState46Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState46Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState46Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState46Trans1:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 338, 4))
	_uState46Trans1:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 30, 4))
	_uState46Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState46Trans1 = nil

-- TO STATE: showchoice
_uState46Trans2 = GdsCreateTransition (_uState6, _uState46, "State_6", "State_46_T2", "Dialog")
	_uState46Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 1))
	_uState46Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_006PC", "(Winderz (Stufe 18) )", 99, 16777215))
	_uState46Trans2:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 339, 4))
	_uState46Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState46Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState46Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState46Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState46Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState46Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState46Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState46Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState46Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING02)', 0, 4))
	_uState46Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING02)', 0, 4))
	_uState46Trans2:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 322, 4))
	_uState46Trans2:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 18, 4))
	_uState46Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState46Trans2 = nil

-- TO STATE: showchoice
_uState46Trans3 = GdsCreateTransition (_uState6, _uState46, "State_6", "State_46_T3", "Dialog")
	_uState46Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 2))
	_uState46Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_007PC", "(Iridiumerz (Stufe 20) )", 99, 16777215))
	_uState46Trans3:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 340, 4))
	_uState46Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState46Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState46Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState46Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState46Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState46Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState46Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState46Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState46Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING02)', 0, 4))
	_uState46Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING02)', 0, 4))
	_uState46Trans3:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 323, 4))
	_uState46Trans3:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 20, 4))
	_uState46Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState46Trans3 = nil

-- TO STATE: showchoice
_uState46Trans4 = GdsCreateTransition (_uState6, _uState46, "State_6", "State_46_T4", "Dialog")
	_uState46Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 3))
	_uState46Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_008PC", "(Lythaniumstaub (Stufe 24) )", 99, 16777215))
	_uState46Trans4:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 341, 4))
	_uState46Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState46Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState46Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState46Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState46Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState46Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState46Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState46Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState46Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING02)', 0, 4))
	_uState46Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING02)', 0, 4))
	_uState46Trans4:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 324, 4))
	_uState46Trans4:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 24, 4))
	_uState46Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState46Trans4 = nil

-- TO STATE: showchoice
_uState46Trans5 = GdsCreateTransition (_uState6, _uState46, "State_6", "State_46_T5", "Dialog")
	_uState46Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 4))
	_uState46Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_009PC", "(Adamantinumerz (Stufe 26) )", 99, 16777215))
	_uState46Trans5:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 342, 4))
	_uState46Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState46Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState46Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState46Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState46Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState46Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState46Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState46Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState46Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING02)', 0, 4))
	_uState46Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING02)', 0, 4))
	_uState46Trans5:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 325, 4))
	_uState46Trans5:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 26, 4))
	_uState46Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState46Trans5 = nil

-- TO STATE: showchoice
_uState46Trans6 = GdsCreateTransition (_uState6, _uState46, "State_6", "State_46_T6", "Dialog")
	_uState46Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 5))
	_uState46Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_010PC", "(Kristallstaub (Stufe 30) )", 99, 16777215))
	_uState46Trans6:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 343, 4))
	_uState46Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState46Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState46Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState46Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState46Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState46Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState46Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState46Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState46Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING02)', 0, 4))
	_uState46Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING02)', 0, 4))
	_uState46Trans6:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 326, 4))
	_uState46Trans6:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 30, 4))
	_uState46Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState46Trans6 = nil

-- TO STATE: showchoice
_uState46Trans7 = GdsCreateTransition (_uState18, _uState46, "State_18", "State_46_T7", "Dialog")
	_uState46Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 1))
	_uState46Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_023PC", "(Iridiumerz (Stufe 20) )", 99, 16777215))
	_uState46Trans7:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 340, 4))
	_uState46Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState46Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState46Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState46Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState46Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState46Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState46Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState46Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState46Trans7:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 327, 4))
	_uState46Trans7:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 20, 4))
	_uState46Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState46Trans7 = nil

-- TO STATE: showchoice
_uState46Trans8 = GdsCreateTransition (_uState18, _uState46, "State_18", "State_46_T8", "Dialog")
	_uState46Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 2))
	_uState46Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_024PC", "(Lythaniumstaub (Stufe 24) )", 99, 16777215))
	_uState46Trans8:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 341, 4))
	_uState46Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState46Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState46Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState46Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState46Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState46Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState46Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState46Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState46Trans8:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 328, 4))
	_uState46Trans8:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 24, 4))
	_uState46Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState46Trans8 = nil

-- TO STATE: showchoice
_uState46Trans9 = GdsCreateTransition (_uState18, _uState46, "State_18", "State_46_T9", "Dialog")
	_uState46Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 3))
	_uState46Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_025PC", "(Adamantinumerz (Stufe 26) )", 99, 16777215))
	_uState46Trans9:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 342, 4))
	_uState46Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState46Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState46Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState46Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState46Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState46Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState46Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState46Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState46Trans9:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 329, 4))
	_uState46Trans9:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 26, 4))
	_uState46Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState46Trans9 = nil

-- TO STATE: showchoice
_uState46Trans10 = GdsCreateTransition (_uState18, _uState46, "State_18", "State_46_T10", "Dialog")
	_uState46Trans10:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 4))
	_uState46Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_026PC", "(Kristallstaub (Stufe 30) )", 99, 16777215))
	_uState46Trans10:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 343, 4))
	_uState46Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState46Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState46Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState46Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState46Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState46Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState46Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState46Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState46Trans10:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 330, 4))
	_uState46Trans10:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 30, 4))
	_uState46Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState46Trans10 = nil

-- TO STATE: showchoice
_uState46Trans11 = GdsCreateTransition (_uState28, _uState46, "State_28", "State_46_T11", "Dialog")
	_uState46Trans11:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 1))
	_uState46Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_037PC", "(Iridiumerz (Stufe 20) )", 99, 16777215))
	_uState46Trans11:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 340, 4))
	_uState46Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState46Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState46Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState46Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState46Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState46Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState46Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState46Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState46Trans11:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 331, 4))
	_uState46Trans11:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 20, 4))
	_uState46Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState46Trans11 = nil

-- TO STATE: showchoice
_uState46Trans12 = GdsCreateTransition (_uState28, _uState46, "State_28", "State_46_T12", "Dialog")
	_uState46Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 2))
	_uState46Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_038PC", "(Lythaniumstaub (Stufe 24) )", 99, 16777215))
	_uState46Trans12:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 341, 4))
	_uState46Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState46Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState46Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState46Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState46Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState46Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState46Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState46Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState46Trans12:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 332, 4))
	_uState46Trans12:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 24, 4))
	_uState46Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState46Trans12 = nil

-- TO STATE: showchoice
_uState46Trans13 = GdsCreateTransition (_uState28, _uState46, "State_28", "State_46_T13", "Dialog")
	_uState46Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 3))
	_uState46Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_039PC", "(Adamantinumerz (Stufe 26) )", 99, 16777215))
	_uState46Trans13:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 342, 4))
	_uState46Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState46Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState46Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState46Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState46Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState46Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState46Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState46Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState46Trans13:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 333, 4))
	_uState46Trans13:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 26, 4))
	_uState46Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState46Trans13 = nil

-- TO STATE: showchoice
_uState46Trans14 = GdsCreateTransition (_uState28, _uState46, "State_28", "State_46_T14", "Dialog")
	_uState46Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 4))
	_uState46Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_040PC", "(Kristallstaub (Stufe 30) )", 99, 16777215))
	_uState46Trans14:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 343, 4))
	_uState46Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState46Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState46Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState46Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState46Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState46Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState46Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState46Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState46Trans14:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 334, 4))
	_uState46Trans14:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 30, 4))
	_uState46Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState46Trans14 = nil

-- TO STATE: showchoice
_uState46Trans15 = GdsCreateTransition (_uState38, _uState46, "State_38", "State_46_T15", "Dialog")
	_uState46Trans15:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 1))
	_uState46Trans15:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_051PC", "(Iridiumerz (Stufe 20) )", 99, 16777215))
	_uState46Trans15:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 340, 4))
	_uState46Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState46Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState46Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState46Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState46Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState46Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState46Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState46Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState46Trans15:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 335, 4))
	_uState46Trans15:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 20, 4))
	_uState46Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState46Trans15 = nil

-- TO STATE: showchoice
_uState46Trans16 = GdsCreateTransition (_uState38, _uState46, "State_38", "State_46_T16", "Dialog")
	_uState46Trans16:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 2))
	_uState46Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_052PC", "(Lythaniumstaub (Stufe 24) )", 99, 16777215))
	_uState46Trans16:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 341, 4))
	_uState46Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState46Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState46Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState46Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState46Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState46Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState46Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState46Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState46Trans16:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 336, 4))
	_uState46Trans16:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 24, 4))
	_uState46Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState46Trans16 = nil

-- TO STATE: showchoice
_uState46Trans17 = GdsCreateTransition (_uState38, _uState46, "State_38", "State_46_T17", "Dialog")
	_uState46Trans17:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 3))
	_uState46Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_053PC", "(Adamantinumerz (Stufe 26) )", 99, 16777215))
	_uState46Trans17:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 342, 4))
	_uState46Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState46Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState46Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState46Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState46Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState46Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState46Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState46Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState46Trans17:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 337, 4))
	_uState46Trans17:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 26, 4))
	_uState46Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState46Trans17 = nil

-- TO STATE: showchoice
_uState46Trans18 = GdsCreateTransition (_uState48, _uState46, "State_48", "State_46_T18", "Dialog")
	_uState46Trans18:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 1))
	_uState46Trans18:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_064PC", "(Winterstille (weiß) )", 99, 16711680))
	_uState46Trans18:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_065", "(Euch fehlt ein solcher Edelstein.)", 164, 16777215))
	_uState46Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState46Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState46Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState46Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState46Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState46Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState46Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState46Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState46Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState46Trans18 = nil

-- TO STATE: showchoice
_uState46Trans19 = GdsCreateTransition (_uState48, _uState46, "State_48", "State_46_T19", "Dialog")
	_uState46Trans19:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 2))
	_uState46Trans19:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_066PC", "(Nachtglanz (schwarz) )", 99, 16711680))
	_uState46Trans19:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_067", "(Euch fehlt ein solcher Edelstein.)", 166, 16777215))
	_uState46Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState46Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState46Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState46Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState46Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState46Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState46Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState46Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState46Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState46Trans19 = nil

-- TO STATE: showchoice
_uState46Trans20 = GdsCreateTransition (_uState48, _uState46, "State_48", "State_46_T20", "Dialog")
	_uState46Trans20:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 3))
	_uState46Trans20:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_068PC", "(Sommerhauch (rot) )", 99, 16711680))
	_uState46Trans20:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_069", "(Euch fehlt ein solcher Edelstein.)", 168, 16777215))
	_uState46Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState46Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState46Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState46Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState46Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState46Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState46Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState46Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState46Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState46Trans20 = nil

-- TO STATE: showchoice
_uState46Trans21 = GdsCreateTransition (_uState48, _uState46, "State_48", "State_46_T21", "Dialog")
	_uState46Trans21:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 4))
	_uState46Trans21:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_070PC", "(Frühlingslicht (grün) )", 99, 16711680))
	_uState46Trans21:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_071", "(Euch fehlt ein solcher Edelstein.)", 170, 16777215))
	_uState46Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState46Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState46Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState46Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState46Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState46Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState46Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState46Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState46Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState46Trans21 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState46, _uState46, "State_46", "State_46", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting02"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState46, _uBeginState, "State_46", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting02"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting02', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING02)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState48Trans1 = GdsCreateTransition (_uState48, _uState48, "State_48", "State_48_T1", "Dialog")
	_uState48Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 2))
	_uState48Trans1:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 323, 1, 1, 1) ))
	_uState48Trans1:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_064PC", "(Winterstille (weiß) )", 1, 16711680))
	_uState48Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 1, 4))
	_uState48Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState48Trans1 = nil

-- TO STATE: choice
_uState48Trans2 = GdsCreateTransition (_uState48, _uState48, "State_48", "State_48_T2", "Dialog")
	_uState48Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 2))
	_uState48Trans2:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 324, 1, 1, 1) ))
	_uState48Trans2:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_066PC", "(Nachtglanz (schwarz) )", 2, 16711680))
	_uState48Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 1, 4))
	_uState48Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState48Trans2 = nil

-- TO STATE: choice
_uState48Trans3 = GdsCreateTransition (_uState48, _uState48, "State_48", "State_48_T3", "Dialog")
	_uState48Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 2))
	_uState48Trans3:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 325, 1, 1, 1) ))
	_uState48Trans3:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_068PC", "(Sommerhauch (rot) )", 3, 16711680))
	_uState48Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 1, 4))
	_uState48Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState48Trans3 = nil

-- TO STATE: choice
_uState48Trans4 = GdsCreateTransition (_uState48, _uState48, "State_48", "State_48_T4", "Dialog")
	_uState48Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 2))
	_uState48Trans4:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 326, 1, 1, 1) ))
	_uState48Trans4:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_070PC", "(Frühlingslicht (grün) )", 4, 16711680))
	_uState48Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 1, 4))
	_uState48Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState48Trans4 = nil

-- TO STATE: choice
_uState48Trans5 = GdsCreateTransition (_uState48, _uState48, "State_48", "State_48_T5", "Dialog")
	_uState48Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 2))
	_uState48Trans5:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 323, 1, 1, 1))
	_uState48Trans5:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_072PC", "(Winterstille (weiß) )", 5, 16777215))
	_uState48Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 1, 4))
	_uState48Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState48Trans5 = nil

-- TO STATE: choice
_uState48Trans6 = GdsCreateTransition (_uState48, _uState48, "State_48", "State_48_T6", "Dialog")
	_uState48Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 2))
	_uState48Trans6:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 324, 1, 1, 1))
	_uState48Trans6:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_073PC", "(Nachtglanz (schwarz) )", 6, 16777215))
	_uState48Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 1, 4))
	_uState48Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState48Trans6 = nil

-- TO STATE: choice
_uState48Trans7 = GdsCreateTransition (_uState48, _uState48, "State_48", "State_48_T7", "Dialog")
	_uState48Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 2))
	_uState48Trans7:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 325, 1, 1, 1))
	_uState48Trans7:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_074PC", "(Sommerhauch (rot) )", 7, 16777215))
	_uState48Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 1, 4))
	_uState48Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState48Trans7 = nil

-- TO STATE: choice
_uState48Trans8 = GdsCreateTransition (_uState48, _uState48, "State_48", "State_48_T8", "Dialog")
	_uState48Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 2))
	_uState48Trans8:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 326, 1, 1, 1))
	_uState48Trans8:AddAction (CScriptActionChoice("P333_DLG_CRAFTING02_075PC", "(Frühlingslicht (grün) )", 8, 16777215))
	_uState48Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 1, 4))
	_uState48Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState48Trans8 = nil

-- TO STATE: choice
_uState48Trans9 = GdsCreateTransition (_uState48, _uState48, "State_48", "State_48_T9", "Dialog")
	_uState48Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 2))
	_uState48Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 0, 4))
	_uState48Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CRAFTING02)', 1, 4))
	_uState48Trans9:AddAction (CScriptActionShowChoices())
	_uState48Trans9 = nil

-- TO STATE: choice
_uState48Trans10 = GdsCreateTransition (_uState46, _uState48, "State_46", "State_48_T10", "Dialog")
	_uState48Trans10:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_063", "(Welcher Edelstein soll beim Herstellen verwendet werden?)", 162, 16777215))
	_uState48Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState48Trans10 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState48, _uState48, "State_48", "State_48", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting02"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState48, _uBeginState, "State_48", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting02"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting02', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING02)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: label
_uState57Trans1 = GdsCreateTransition (_uState48, _uState57, "State_48", "State_57_T1", "Dialog")
	_uState57Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 8))
	_uState57Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_075PC", "(Frühlingslicht (grün) )", 99, 16777215))
	_uState57Trans1:AddAction (CScriptActionValueModify('', 'mv_InternSuffix', 326, 4))
	_uState57Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState57Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState57Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState57Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState57Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState57Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState57Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState57Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState57Trans1:AddAction (CScriptActionValueModify('', 'mv_CraftingSuffix', 333, 4))
	_uState57Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState57Trans1 = nil

-- TO STATE: label
_uState57Trans2 = GdsCreateTransition (_uState48, _uState57, "State_48", "State_57_T2", "Dialog")
	_uState57Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 5))
	_uState57Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_072PC", "(Winterstille (weiß) )", 99, 16777215))
	_uState57Trans2:AddAction (CScriptActionValueModify('', 'mv_InternSuffix', 323, 4))
	_uState57Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState57Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState57Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState57Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState57Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState57Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState57Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState57Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState57Trans2:AddAction (CScriptActionValueModify('', 'mv_CraftingSuffix', 330, 4))
	_uState57Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState57Trans2 = nil

-- TO STATE: label
_uState57Trans3 = GdsCreateTransition (_uState48, _uState57, "State_48", "State_57_T3", "Dialog")
	_uState57Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 6))
	_uState57Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_073PC", "(Nachtglanz (schwarz) )", 99, 16777215))
	_uState57Trans3:AddAction (CScriptActionValueModify('', 'mv_InternSuffix', 324, 4))
	_uState57Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState57Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState57Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState57Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState57Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState57Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState57Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState57Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState57Trans3:AddAction (CScriptActionValueModify('', 'mv_CraftingSuffix', 331, 4))
	_uState57Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState57Trans3 = nil

-- TO STATE: label
_uState57Trans4 = GdsCreateTransition (_uState48, _uState57, "State_48", "State_57_T4", "Dialog")
	_uState57Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 7))
	_uState57Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING02_074PC", "(Sommerhauch (rot) )", 99, 16777215))
	_uState57Trans4:AddAction (CScriptActionValueModify('', 'mv_InternSuffix', 325, 4))
	_uState57Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING02)', 0, 4))
	_uState57Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING02)', 0, 4))
	_uState57Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING02)', 0, 4))
	_uState57Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING02)', 0, 4))
	_uState57Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING02)', 0, 4))
	_uState57Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING02)', 0, 4))
	_uState57Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING02)', 0, 4))
	_uState57Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING02)', 0, 4))
	_uState57Trans4:AddAction (CScriptActionValueModify('', 'mv_CraftingSuffix', 332, 4))
	_uState57Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState57Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState57, _uState57, "State_57", "State_57", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting02"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState57, _uBeginState, "State_57", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting02"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting02', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING02)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: else
_uState59Trans1 = GdsCreateTransition (_uState57, _uState59, "State_57", "State_59_T1", "Dialog")
	_uState59Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_EnhancedCrafting02', 1, 2) ))
	_uState59Trans1:AddAction (CScriptActionValueModify('', 'mv_CraftingPrefix', 84, 4))
	_uState59Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState59Trans1 = nil

-- TO STATE: else
_uState59Trans2 = GdsCreateTransition (_uState57, _uState59, "State_57", "State_59_T2", "Dialog")
	_uState59Trans2:AddCondition (CScriptConditionValue('', 'mf_EnhancedCrafting02', 1, 2))
	_uState59Trans2:AddAction (CScriptActionValueModify('', 'mv_CraftingPrefix', 85, 4))
	_uState59Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState59Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState59, _uState59, "State_59", "State_59", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting02"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState59, _uBeginState, "State_59", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting02"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting02', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING02)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: label
_uState60Trans1 = GdsCreateTransition (_uState59, _uState60, "State_59", "State_60_T1", "Dialog")
	_uState60Trans1:AddAction (CScriptActionPlayerGiveVariableItemGeneric('pl_Human', 'mv_CraftingPrefix', 'mv_CraftingCreoID', 'mv_CraftingSuffix', 'mv_CraftingLevel', 1))
	_uState60Trans1:AddAction (CScriptActionSay("crafting02", "P333_DLG_CRAFTING02_076", "(Ihr formt die Waffe.)", 175, 16777215))
	_uState60Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState60Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState60, _uState60, "State_60", "State_60", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting02"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState60, _uBeginState, "State_60", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting02"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting02', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING02)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: label
_uState66Trans1 = GdsCreateTransition (_uState60, _uState66, "State_60", "State_66_T1", "Dialog")
	_uState66Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 339, 2) ))
	_uState66Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 340, 2) ))
	_uState66Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 341, 2) ))
	_uState66Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 342, 2) ))
	_uState66Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 343, 1))
	_uState66Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState66Trans1 = nil

-- TO STATE: label
_uState66Trans2 = GdsCreateTransition (_uState60, _uState66, "State_60", "State_66_T2", "Dialog")
	_uState66Trans2:AddCondition (CScriptConditionValue('', 'mv_InternCreoID', 339, 2))
	_uState66Trans2:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 339, 1))
	_uState66Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState66Trans2 = nil

-- TO STATE: label
_uState66Trans3 = GdsCreateTransition (_uState60, _uState66, "State_60", "State_66_T3", "Dialog")
	_uState66Trans3:AddCondition (CScriptConditionValue('', 'mv_InternCreoID', 340, 2))
	_uState66Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 339, 2) ))
	_uState66Trans3:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 340, 1))
	_uState66Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState66Trans3 = nil

-- TO STATE: label
_uState66Trans4 = GdsCreateTransition (_uState60, _uState66, "State_60", "State_66_T4", "Dialog")
	_uState66Trans4:AddCondition (CScriptConditionValue('', 'mv_InternCreoID', 341, 2))
	_uState66Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 339, 2) ))
	_uState66Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 340, 2) ))
	_uState66Trans4:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 341, 1))
	_uState66Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState66Trans4 = nil

-- TO STATE: label
_uState66Trans5 = GdsCreateTransition (_uState60, _uState66, "State_60", "State_66_T5", "Dialog")
	_uState66Trans5:AddCondition (CScriptConditionValue('', 'mv_InternCreoID', 342, 2))
	_uState66Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 339, 2) ))
	_uState66Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 340, 2) ))
	_uState66Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 341, 2) ))
	_uState66Trans5:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 342, 1))
	_uState66Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState66Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState66, _uState66, "State_66", "State_66", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting02", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting02"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState66, _uBeginState, "State_66", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting02"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting02', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING02)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState71Trans1 = GdsCreateTransition (_uState66, _uState71, "State_66", "State_71_T1", "Dialog")
	_uState71Trans1:AddCondition (CScriptConditionValue('', 'mv_InternSuffix', 323, 2))
	_uState71Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 323, 1))
	_uState71Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting02"))
	_uState71Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(CRAFTING02)', 1, 4))
	_uState71Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState71Trans1 = nil

-- TO STATE: endconversation
_uState71Trans2 = GdsCreateTransition (_uState66, _uState71, "State_66", "State_71_T2", "Dialog")
	_uState71Trans2:AddCondition (CScriptConditionValue('', 'mv_InternSuffix', 324, 2))
	_uState71Trans2:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternSuffix', 323, 2) ))
	_uState71Trans2:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 324, 1))
	_uState71Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting02"))
	_uState71Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(CRAFTING02)', 1, 4))
	_uState71Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState71Trans2 = nil

-- TO STATE: endconversation
_uState71Trans3 = GdsCreateTransition (_uState66, _uState71, "State_66", "State_71_T3", "Dialog")
	_uState71Trans3:AddCondition (CScriptConditionValue('', 'mv_InternSuffix', 325, 2))
	_uState71Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternSuffix', 323, 2) ))
	_uState71Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternSuffix', 324, 2) ))
	_uState71Trans3:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 325, 1))
	_uState71Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting02"))
	_uState71Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(CRAFTING02)', 1, 4))
	_uState71Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState71Trans3 = nil

-- TO STATE: endconversation
_uState71Trans4 = GdsCreateTransition (_uState66, _uState71, "State_66", "State_71_T4", "Dialog")
	_uState71Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternSuffix', 323, 2) ))
	_uState71Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternSuffix', 324, 2) ))
	_uState71Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternSuffix', 325, 2) ))
	_uState71Trans4:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 326, 1))
	_uState71Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting02"))
	_uState71Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(CRAFTING02)', 1, 4))
	_uState71Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING02)', 1, 4))
	_uState71Trans4 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState71, _uState71, "State_71", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(CRAFTING02)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting02"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(CRAFTING02)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(CRAFTING02)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState71, _uState71, "State_71", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(CRAFTING02)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting02"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(CRAFTING02)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(CRAFTING02)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState71, _uState71, "State_71", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(CRAFTING02)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting02"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(CRAFTING02)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(CRAFTING02)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState71, _uState71, "State_71", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(CRAFTING02)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting02"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(CRAFTING02)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(CRAFTING02)', 1, 4))
	_uEndActions4 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState71, _uBeginState, "State_71", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(CRAFTING02)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(CRAFTING02)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting02', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING02)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState4 = nil
_uState6 = nil
_uState18 = nil
_uState28 = nil
_uState38 = nil
_uState46 = nil
_uState48 = nil
_uState57 = nil
_uState59 = nil
_uState60 = nil
_uState66 = nil
_uState71 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("crafting02_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(CRAFTING02)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/smallshrine_BeginDialog.tak', 'pl_HumanAvatar', 'crafting02'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(CRAFTING02)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())

