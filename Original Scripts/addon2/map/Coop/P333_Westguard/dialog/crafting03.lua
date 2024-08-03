local _uSM = GdsCreateStateMachine ("crafting03_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState4 = GdsCreateState (_uSM, "State_4")
_uState6 = GdsCreateState (_uSM, "State_6")
_uState18 = GdsCreateState (_uSM, "State_18")
_uState28 = GdsCreateState (_uSM, "State_28")
_uState30 = GdsCreateState (_uSM, "State_30")
_uState38 = GdsCreateState (_uSM, "State_38")
_uState40 = GdsCreateState (_uSM, "State_40")
_uState41 = GdsCreateState (_uSM, "State_41")
_uState44 = GdsCreateState (_uSM, "State_44")
_uState47 = GdsCreateState (_uSM, "State_47")
_uState49 = GdsCreateState (_uSM, "State_49")
_uState50 = GdsCreateState (_uSM, "State_50")
_uState56 = GdsCreateState (_uSM, "State_56")
_uState61 = GdsCreateState (_uSM, "State_61")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(CRAFTING03)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(CRAFTING03)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('crafting03', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "crafting03"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING03)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(CRAFTING03)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('crafting03', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("crafting03")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING03)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING03)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(CRAFTING03)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting03"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting03', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING03)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState4Trans1 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T1", "Dialog")
	_uState4Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 2))
	_uState4Trans1:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_004PC", "(Ring herstellen)", 1, 16777215))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 1, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState4Trans1 = nil

-- TO STATE: choice
_uState4Trans2 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T2", "Dialog")
	_uState4Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 2))
	_uState4Trans2:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_021PC", "(Amulett herstellen)", 2, 16777215))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 1, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState4Trans2 = nil

-- TO STATE: choice
_uState4Trans3 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T3", "Dialog")
	_uState4Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 2))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 0, 4))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CRAFTING03)', 1, 4))
	_uState4Trans3:AddAction (CScriptActionShowChoices())
	_uState4Trans3 = nil

-- TO STATE: choice
_uState4Trans4 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T4", "Dialog")
	_uState4Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_CreoInspected', 0, 2) ))
	_uState4Trans4:AddAction (CScriptActionSay("crafting03", "P333_DLG_CRAFTING03_003", "(An diesem Creo kann Schmuck hergestellt werden.)", 102, 16777215))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState4Trans4 = nil

-- TO STATE: choice
_uState4Trans5 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T5", "Dialog")
	_uState4Trans5:AddCondition (CScriptConditionValue('', 'mf_CreoInspected', 0, 2))
	_uState4Trans5:AddAction (CScriptActionSay("crafting03", "P333_DLG_CRAFTING03_001", "Dies ist ein Creo, eine Art Werkbank, welche die Former zum Herstellen von Ausrüstung verwendet haben.", 100, 16777215))
	_uState4Trans5:AddAction (CScriptActionSay("crafting03", "P333_DLG_CRAFTING03_002", "(An diesem Creo kann Schmuck hergestellt werden.)", 101, 16777215))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'mf_CreoInspected', 1, 4))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState4Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting03"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState4, _uBeginState, "State_4", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting03"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting03', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING03)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState6Trans1 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T1", "Dialog")
	_uState6Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 2))
	_uState6Trans1:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 339, 1, 1, 1))
	_uState6Trans1:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_006PC", "(Winderz (Stufe 18) )", 1, 16777215))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 1, 4))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState6Trans1 = nil

-- TO STATE: choice
_uState6Trans2 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T2", "Dialog")
	_uState6Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 2))
	_uState6Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1))
	_uState6Trans2:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_007PC", "(Iridiumerz (Stufe 20) )", 2, 16777215))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 1, 4))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState6Trans2 = nil

-- TO STATE: choice
_uState6Trans3 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T3", "Dialog")
	_uState6Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 2))
	_uState6Trans3:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1))
	_uState6Trans3:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_008PC", "(Lythaniumstaub (Stufe 24) )", 3, 16777215))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 1, 4))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState6Trans3 = nil

-- TO STATE: choice
_uState6Trans4 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T4", "Dialog")
	_uState6Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 2))
	_uState6Trans4:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1))
	_uState6Trans4:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_009PC", "(Adamantinumerz (Stufe 26) )", 4, 16777215))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 1, 4))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState6Trans4 = nil

-- TO STATE: choice
_uState6Trans5 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T5", "Dialog")
	_uState6Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 2))
	_uState6Trans5:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1))
	_uState6Trans5:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_010PC", "(Kristallstaub (Stufe 30) )", 5, 16777215))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 1, 4))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState6Trans5 = nil

-- TO STATE: choice
_uState6Trans6 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T6", "Dialog")
	_uState6Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 2))
	_uState6Trans6:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 339, 1, 1, 1) ))
	_uState6Trans6:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_011PC", "(Winderz (Stufe 18) )", 6, 16711680))
	_uState6Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 1, 4))
	_uState6Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState6Trans6 = nil

-- TO STATE: choice
_uState6Trans7 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T7", "Dialog")
	_uState6Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 2))
	_uState6Trans7:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1) ))
	_uState6Trans7:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_013PC", "(Iridiumerz (Stufe 20) )", 7, 16711680))
	_uState6Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 1, 4))
	_uState6Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState6Trans7 = nil

-- TO STATE: choice
_uState6Trans8 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T8", "Dialog")
	_uState6Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 2))
	_uState6Trans8:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1) ))
	_uState6Trans8:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_015PC", "(Lythaniumstaub (Stufe 24) )", 8, 16711680))
	_uState6Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 1, 4))
	_uState6Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState6Trans8 = nil

-- TO STATE: choice
_uState6Trans9 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T9", "Dialog")
	_uState6Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING03)', 0, 2))
	_uState6Trans9:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1) ))
	_uState6Trans9:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_017PC", "(Adamantinumerz (Stufe 26) )", 9, 16711680))
	_uState6Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING03)', 1, 4))
	_uState6Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState6Trans9 = nil

-- TO STATE: choice
_uState6Trans10 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T10", "Dialog")
	_uState6Trans10:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING03)', 0, 2))
	_uState6Trans10:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1) ))
	_uState6Trans10:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_019PC", "(Kristallstaub (Stufe 30) )", 10, 16711680))
	_uState6Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING03)', 1, 4))
	_uState6Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState6Trans10 = nil

-- TO STATE: choice
_uState6Trans11 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T11", "Dialog")
	_uState6Trans11:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 2))
	_uState6Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 0, 4))
	_uState6Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CRAFTING03)', 1, 4))
	_uState6Trans11:AddAction (CScriptActionShowChoices())
	_uState6Trans11 = nil

-- TO STATE: choice
_uState6Trans12 = GdsCreateTransition (_uState4, _uState6, "State_4", "State_6_T12", "Dialog")
	_uState6Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 1))
	_uState6Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_004PC", "(Ring herstellen)", 99, 16777215))
	_uState6Trans12:AddAction (CScriptActionSay("crafting03", "P333_DLG_CRAFTING03_005", "(Aus welchem Werkstoff soll der Ring hergestellt werden?)", 104, 16777215))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState6Trans12 = nil

-- TO STATE: choice
_uState6Trans13 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T13", "Dialog")
	_uState6Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 6))
	_uState6Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_011PC", "(Winderz (Stufe 18) )", 99, 16711680))
	_uState6Trans13:AddAction (CScriptActionSay("crafting03", "P333_DLG_CRAFTING03_012", "(Ihr besitzt kein Winderz.)", 111, 16777215))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING03)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING03)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState6Trans13 = nil

-- TO STATE: choice
_uState6Trans14 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T14", "Dialog")
	_uState6Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 7))
	_uState6Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_013PC", "(Iridiumerz (Stufe 20) )", 99, 16711680))
	_uState6Trans14:AddAction (CScriptActionSay("crafting03", "P333_DLG_CRAFTING03_014", "(Ihr besitzt kein Iridiumerz.)", 113, 16777215))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING03)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING03)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState6Trans14 = nil

-- TO STATE: choice
_uState6Trans15 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T15", "Dialog")
	_uState6Trans15:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 8))
	_uState6Trans15:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_015PC", "(Lythaniumstaub (Stufe 24) )", 99, 16711680))
	_uState6Trans15:AddAction (CScriptActionSay("crafting03", "P333_DLG_CRAFTING03_016", "(Ihr besitzt keinen Lythaniumstaub.)", 115, 16777215))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING03)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING03)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState6Trans15 = nil

-- TO STATE: choice
_uState6Trans16 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T16", "Dialog")
	_uState6Trans16:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 9))
	_uState6Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_017PC", "(Adamantinumerz (Stufe 26) )", 99, 16711680))
	_uState6Trans16:AddAction (CScriptActionSay("crafting03", "P333_DLG_CRAFTING03_018", "(Ihr besitzt kein Adamantinumerz.)", 117, 16777215))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING03)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING03)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState6Trans16 = nil

-- TO STATE: choice
_uState6Trans17 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T17", "Dialog")
	_uState6Trans17:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 10))
	_uState6Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_019PC", "(Kristallstaub (Stufe 30) )", 99, 16711680))
	_uState6Trans17:AddAction (CScriptActionSay("crafting03", "P333_DLG_CRAFTING03_020", "(Ihr besitzt keinen Kristallstaub.)", 119, 16777215))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING03)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING03)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState6Trans17 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting03"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState6, _uBeginState, "State_6", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting03"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting03', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING03)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState18Trans1 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T1", "Dialog")
	_uState18Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 2))
	_uState18Trans1:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 339, 1, 1, 1))
	_uState18Trans1:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_023PC", "(Winderz (Stufe 18) )", 1, 16777215))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 1, 4))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState18Trans1 = nil

-- TO STATE: choice
_uState18Trans2 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T2", "Dialog")
	_uState18Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 2))
	_uState18Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1))
	_uState18Trans2:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_024PC", "(Iridiumerz (Stufe 20) )", 2, 16777215))
	_uState18Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 1, 4))
	_uState18Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState18Trans2 = nil

-- TO STATE: choice
_uState18Trans3 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T3", "Dialog")
	_uState18Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 2))
	_uState18Trans3:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1))
	_uState18Trans3:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_025PC", "(Lythaniumstaub (Stufe 24) )", 3, 16777215))
	_uState18Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 1, 4))
	_uState18Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState18Trans3 = nil

-- TO STATE: choice
_uState18Trans4 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T4", "Dialog")
	_uState18Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 2))
	_uState18Trans4:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1))
	_uState18Trans4:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_026PC", "(Adamantinumerz (Stufe 26) )", 4, 16777215))
	_uState18Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 1, 4))
	_uState18Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState18Trans4 = nil

-- TO STATE: choice
_uState18Trans5 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T5", "Dialog")
	_uState18Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 2))
	_uState18Trans5:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 339, 1, 1, 1) ))
	_uState18Trans5:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_027PC", "(Winderz (Stufe 18) )", 5, 16711680))
	_uState18Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 1, 4))
	_uState18Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState18Trans5 = nil

-- TO STATE: choice
_uState18Trans6 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T6", "Dialog")
	_uState18Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 2))
	_uState18Trans6:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1) ))
	_uState18Trans6:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_029PC", "(Iridiumerz (Stufe 20) )", 6, 16711680))
	_uState18Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 1, 4))
	_uState18Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState18Trans6 = nil

-- TO STATE: choice
_uState18Trans7 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T7", "Dialog")
	_uState18Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 2))
	_uState18Trans7:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1) ))
	_uState18Trans7:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_031PC", "(Lythaniumstaub (Stufe 24) )", 7, 16711680))
	_uState18Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 1, 4))
	_uState18Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState18Trans7 = nil

-- TO STATE: choice
_uState18Trans8 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T8", "Dialog")
	_uState18Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 2))
	_uState18Trans8:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1) ))
	_uState18Trans8:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_033PC", "(Adamantinumerz (Stufe 26) )", 8, 16711680))
	_uState18Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 1, 4))
	_uState18Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState18Trans8 = nil

-- TO STATE: choice
_uState18Trans9 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T9", "Dialog")
	_uState18Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING03)', 0, 2))
	_uState18Trans9:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1) ))
	_uState18Trans9:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_035PC", "(Kristallstaub (Stufe 30) )", 9, 16711680))
	_uState18Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING03)', 1, 4))
	_uState18Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState18Trans9 = nil

-- TO STATE: choice
_uState18Trans10 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T10", "Dialog")
	_uState18Trans10:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING03)', 0, 2))
	_uState18Trans10:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1))
	_uState18Trans10:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_037PC", "(Kristallstaub (Stufe 30) )", 10, 16777215))
	_uState18Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING03)', 1, 4))
	_uState18Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState18Trans10 = nil

-- TO STATE: choice
_uState18Trans11 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T11", "Dialog")
	_uState18Trans11:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 2))
	_uState18Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 0, 4))
	_uState18Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CRAFTING03)', 1, 4))
	_uState18Trans11:AddAction (CScriptActionShowChoices())
	_uState18Trans11 = nil

-- TO STATE: choice
_uState18Trans12 = GdsCreateTransition (_uState4, _uState18, "State_4", "State_18_T12", "Dialog")
	_uState18Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 2))
	_uState18Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_021PC", "(Amulett herstellen)", 99, 16777215))
	_uState18Trans12:AddAction (CScriptActionSay("crafting03", "P333_DLG_CRAFTING03_022", "(Aus welchem Werkstoff soll das Amulett hergestellt werden?)", 121, 16777215))
	_uState18Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState18Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState18Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState18Trans12 = nil

-- TO STATE: choice
_uState18Trans13 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T13", "Dialog")
	_uState18Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 5))
	_uState18Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_027PC", "(Winderz (Stufe 18) )", 99, 16711680))
	_uState18Trans13:AddAction (CScriptActionSay("crafting03", "P333_DLG_CRAFTING03_028", "(Ihr besitzt kein Winderz.)", 127, 16777215))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING03)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING03)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState18Trans13 = nil

-- TO STATE: choice
_uState18Trans14 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T14", "Dialog")
	_uState18Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 6))
	_uState18Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_029PC", "(Iridiumerz (Stufe 20) )", 99, 16711680))
	_uState18Trans14:AddAction (CScriptActionSay("crafting03", "P333_DLG_CRAFTING03_030", "(Ihr besitzt kein Iridiumerz.)", 129, 16777215))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING03)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING03)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState18Trans14 = nil

-- TO STATE: choice
_uState18Trans15 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T15", "Dialog")
	_uState18Trans15:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 7))
	_uState18Trans15:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_031PC", "(Lythaniumstaub (Stufe 24) )", 99, 16711680))
	_uState18Trans15:AddAction (CScriptActionSay("crafting03", "P333_DLG_CRAFTING03_032", "(Ihr besitzt keinen Lythaniumstaub.)", 131, 16777215))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING03)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING03)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState18Trans15 = nil

-- TO STATE: choice
_uState18Trans16 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T16", "Dialog")
	_uState18Trans16:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 8))
	_uState18Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_033PC", "(Adamantinumerz (Stufe 26) )", 99, 16711680))
	_uState18Trans16:AddAction (CScriptActionSay("crafting03", "P333_DLG_CRAFTING03_034", "(Ihr besitzt kein Adamantinumerz.)", 133, 16777215))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING03)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING03)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState18Trans16 = nil

-- TO STATE: choice
_uState18Trans17 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T17", "Dialog")
	_uState18Trans17:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 9))
	_uState18Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_035PC", "(Kristallstaub (Stufe 30) )", 99, 16711680))
	_uState18Trans17:AddAction (CScriptActionSay("crafting03", "P333_DLG_CRAFTING03_036", "(Ihr besitzt keinen Kristallstaub.)", 135, 16777215))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING03)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING03)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState18Trans17 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting03"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState18, _uBeginState, "State_18", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting03"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting03', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING03)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState28Trans1 = GdsCreateTransition (_uState18, _uState28, "State_18", "State_28_T1", "Dialog")
	_uState28Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 10))
	_uState28Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_037PC", "(Kristallstaub (Stufe 30) )", 99, 16777215))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 343, 4))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING03)', 0, 4))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING03)', 0, 4))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 370, 4))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 30, 4))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState28Trans1 = nil

-- TO STATE: showchoice
_uState28Trans2 = GdsCreateTransition (_uState6, _uState28, "State_6", "State_28_T2", "Dialog")
	_uState28Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 1))
	_uState28Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_006PC", "(Winderz (Stufe 18) )", 99, 16777215))
	_uState28Trans2:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 339, 4))
	_uState28Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState28Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState28Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState28Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState28Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState28Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState28Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState28Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState28Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING03)', 0, 4))
	_uState28Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING03)', 0, 4))
	_uState28Trans2:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 361, 4))
	_uState28Trans2:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 18, 4))
	_uState28Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState28Trans2 = nil

-- TO STATE: showchoice
_uState28Trans3 = GdsCreateTransition (_uState6, _uState28, "State_6", "State_28_T3", "Dialog")
	_uState28Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 2))
	_uState28Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_007PC", "(Iridiumerz (Stufe 20) )", 99, 16777215))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 340, 4))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING03)', 0, 4))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING03)', 0, 4))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 362, 4))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 20, 4))
	_uState28Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState28Trans3 = nil

-- TO STATE: showchoice
_uState28Trans4 = GdsCreateTransition (_uState6, _uState28, "State_6", "State_28_T4", "Dialog")
	_uState28Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 3))
	_uState28Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_008PC", "(Lythaniumstaub (Stufe 24) )", 99, 16777215))
	_uState28Trans4:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 341, 4))
	_uState28Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState28Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState28Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState28Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState28Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState28Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState28Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState28Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState28Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING03)', 0, 4))
	_uState28Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING03)', 0, 4))
	_uState28Trans4:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 363, 4))
	_uState28Trans4:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 24, 4))
	_uState28Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState28Trans4 = nil

-- TO STATE: showchoice
_uState28Trans5 = GdsCreateTransition (_uState6, _uState28, "State_6", "State_28_T5", "Dialog")
	_uState28Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 4))
	_uState28Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_009PC", "(Adamantinumerz (Stufe 26) )", 99, 16777215))
	_uState28Trans5:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 342, 4))
	_uState28Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState28Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState28Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState28Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState28Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState28Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState28Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState28Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState28Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING03)', 0, 4))
	_uState28Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING03)', 0, 4))
	_uState28Trans5:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 364, 4))
	_uState28Trans5:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 26, 4))
	_uState28Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState28Trans5 = nil

-- TO STATE: showchoice
_uState28Trans6 = GdsCreateTransition (_uState6, _uState28, "State_6", "State_28_T6", "Dialog")
	_uState28Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 5))
	_uState28Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_010PC", "(Kristallstaub (Stufe 30) )", 99, 16777215))
	_uState28Trans6:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 343, 4))
	_uState28Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState28Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState28Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState28Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState28Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState28Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState28Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState28Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState28Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING03)', 0, 4))
	_uState28Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING03)', 0, 4))
	_uState28Trans6:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 365, 4))
	_uState28Trans6:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 30, 4))
	_uState28Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState28Trans6 = nil

-- TO STATE: showchoice
_uState28Trans7 = GdsCreateTransition (_uState18, _uState28, "State_18", "State_28_T7", "Dialog")
	_uState28Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 1))
	_uState28Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_023PC", "(Winderz (Stufe 18) )", 99, 16777215))
	_uState28Trans7:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 339, 4))
	_uState28Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState28Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState28Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState28Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState28Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState28Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState28Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState28Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState28Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING03)', 0, 4))
	_uState28Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING03)', 0, 4))
	_uState28Trans7:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 366, 4))
	_uState28Trans7:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 18, 4))
	_uState28Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState28Trans7 = nil

-- TO STATE: showchoice
_uState28Trans8 = GdsCreateTransition (_uState18, _uState28, "State_18", "State_28_T8", "Dialog")
	_uState28Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 2))
	_uState28Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_024PC", "(Iridiumerz (Stufe 20) )", 99, 16777215))
	_uState28Trans8:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 340, 4))
	_uState28Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState28Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState28Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState28Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState28Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState28Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState28Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState28Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState28Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING03)', 0, 4))
	_uState28Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING03)', 0, 4))
	_uState28Trans8:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 367, 4))
	_uState28Trans8:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 20, 4))
	_uState28Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState28Trans8 = nil

-- TO STATE: showchoice
_uState28Trans9 = GdsCreateTransition (_uState18, _uState28, "State_18", "State_28_T9", "Dialog")
	_uState28Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 3))
	_uState28Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_025PC", "(Lythaniumstaub (Stufe 24) )", 99, 16777215))
	_uState28Trans9:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 341, 4))
	_uState28Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState28Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState28Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState28Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState28Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState28Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState28Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState28Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState28Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING03)', 0, 4))
	_uState28Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING03)', 0, 4))
	_uState28Trans9:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 368, 4))
	_uState28Trans9:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 24, 4))
	_uState28Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState28Trans9 = nil

-- TO STATE: showchoice
_uState28Trans10 = GdsCreateTransition (_uState18, _uState28, "State_18", "State_28_T10", "Dialog")
	_uState28Trans10:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 4))
	_uState28Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_026PC", "(Adamantinumerz (Stufe 26) )", 99, 16777215))
	_uState28Trans10:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 342, 4))
	_uState28Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState28Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState28Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState28Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState28Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState28Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState28Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState28Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState28Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING03)', 0, 4))
	_uState28Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING03)', 0, 4))
	_uState28Trans10:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 369, 4))
	_uState28Trans10:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 26, 4))
	_uState28Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState28Trans10 = nil

-- TO STATE: showchoice
_uState28Trans11 = GdsCreateTransition (_uState30, _uState28, "State_30", "State_28_T11", "Dialog")
	_uState28Trans11:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 1))
	_uState28Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_039PC", "(Winterstille (weiß) )", 99, 16711680))
	_uState28Trans11:AddAction (CScriptActionSay("crafting03", "P333_DLG_CRAFTING03_040", "(Euch fehlt ein solcher Edelstein.)", 139, 16777215))
	_uState28Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState28Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState28Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState28Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState28Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState28Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState28Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState28Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState28Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState28Trans11 = nil

-- TO STATE: showchoice
_uState28Trans12 = GdsCreateTransition (_uState30, _uState28, "State_30", "State_28_T12", "Dialog")
	_uState28Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 2))
	_uState28Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_041PC", "(Nachtglanz (schwarz) )", 99, 16711680))
	_uState28Trans12:AddAction (CScriptActionSay("crafting03", "P333_DLG_CRAFTING03_042", "(Euch fehlt ein solcher Edelstein.)", 141, 16777215))
	_uState28Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState28Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState28Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState28Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState28Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState28Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState28Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState28Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState28Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState28Trans12 = nil

-- TO STATE: showchoice
_uState28Trans13 = GdsCreateTransition (_uState30, _uState28, "State_30", "State_28_T13", "Dialog")
	_uState28Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 3))
	_uState28Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_043PC", "(Sommerhauch (rot) )", 99, 16711680))
	_uState28Trans13:AddAction (CScriptActionSay("crafting03", "P333_DLG_CRAFTING03_044", "(Euch fehlt ein solcher Edelstein.)", 143, 16777215))
	_uState28Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState28Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState28Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState28Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState28Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState28Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState28Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState28Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState28Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState28Trans13 = nil

-- TO STATE: showchoice
_uState28Trans14 = GdsCreateTransition (_uState30, _uState28, "State_30", "State_28_T14", "Dialog")
	_uState28Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 4))
	_uState28Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_045PC", "(Frühlingslicht (grün) )", 99, 16711680))
	_uState28Trans14:AddAction (CScriptActionSay("crafting03", "P333_DLG_CRAFTING03_046", "(Euch fehlt ein solcher Edelstein.)", 145, 16777215))
	_uState28Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState28Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState28Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState28Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState28Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState28Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState28Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState28Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState28Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState28Trans14 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState28, _uState28, "State_28", "State_28", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting03"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState28, _uBeginState, "State_28", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting03"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting03', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING03)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState30Trans1 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T1", "Dialog")
	_uState30Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 2))
	_uState30Trans1:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 323, 1, 1, 1) ))
	_uState30Trans1:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_039PC", "(Winterstille (weiß) )", 1, 16711680))
	_uState30Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 1, 4))
	_uState30Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState30Trans1 = nil

-- TO STATE: choice
_uState30Trans2 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T2", "Dialog")
	_uState30Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 2))
	_uState30Trans2:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 324, 1, 1, 1) ))
	_uState30Trans2:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_041PC", "(Nachtglanz (schwarz) )", 2, 16711680))
	_uState30Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 1, 4))
	_uState30Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState30Trans2 = nil

-- TO STATE: choice
_uState30Trans3 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T3", "Dialog")
	_uState30Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 2))
	_uState30Trans3:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 325, 1, 1, 1) ))
	_uState30Trans3:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_043PC", "(Sommerhauch (rot) )", 3, 16711680))
	_uState30Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 1, 4))
	_uState30Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState30Trans3 = nil

-- TO STATE: choice
_uState30Trans4 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T4", "Dialog")
	_uState30Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 2))
	_uState30Trans4:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 326, 1, 1, 1) ))
	_uState30Trans4:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_045PC", "(Frühlingslicht (grün) )", 4, 16711680))
	_uState30Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 1, 4))
	_uState30Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState30Trans4 = nil

-- TO STATE: choice
_uState30Trans5 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T5", "Dialog")
	_uState30Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 2))
	_uState30Trans5:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 323, 1, 1, 1))
	_uState30Trans5:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_047PC", "(Winterstille (weiß) )", 5, 16777215))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 1, 4))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState30Trans5 = nil

-- TO STATE: choice
_uState30Trans6 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T6", "Dialog")
	_uState30Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 2))
	_uState30Trans6:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 324, 1, 1, 1))
	_uState30Trans6:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_048PC", "(Nachtglanz (schwarz) )", 6, 16777215))
	_uState30Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 1, 4))
	_uState30Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState30Trans6 = nil

-- TO STATE: choice
_uState30Trans7 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T7", "Dialog")
	_uState30Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 2))
	_uState30Trans7:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 325, 1, 1, 1))
	_uState30Trans7:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_049PC", "(Sommerhauch (rot) )", 7, 16777215))
	_uState30Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 1, 4))
	_uState30Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState30Trans7 = nil

-- TO STATE: choice
_uState30Trans8 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T8", "Dialog")
	_uState30Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 2))
	_uState30Trans8:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 326, 1, 1, 1))
	_uState30Trans8:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_050PC", "(Frühlingslicht (grün) )", 8, 16777215))
	_uState30Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 1, 4))
	_uState30Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState30Trans8 = nil

-- TO STATE: choice
_uState30Trans9 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T9", "Dialog")
	_uState30Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 2))
	_uState30Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 0, 4))
	_uState30Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CRAFTING03)', 1, 4))
	_uState30Trans9:AddAction (CScriptActionShowChoices())
	_uState30Trans9 = nil

-- TO STATE: choice
_uState30Trans10 = GdsCreateTransition (_uState28, _uState30, "State_28", "State_30_T10", "Dialog")
	_uState30Trans10:AddAction (CScriptActionSay("crafting03", "P333_DLG_CRAFTING03_038", "(Welcher Edelstein soll beim Herstellen verwendet werden?)", 137, 16777215))
	_uState30Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState30Trans10 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting03"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState30, _uBeginState, "State_30", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting03"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting03', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING03)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState38Trans1 = GdsCreateTransition (_uState30, _uState38, "State_30", "State_38_T1", "Dialog")
	_uState38Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 8))
	_uState38Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_050PC", "(Frühlingslicht (grün) )", 99, 16777215))
	_uState38Trans1:AddAction (CScriptActionValueModify('', 'mv_InternSuffix', 326, 4))
	_uState38Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState38Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState38Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState38Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState38Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState38Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState38Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState38Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState38Trans1:AddAction (CScriptActionValueModify('', 'mv_CraftingSuffix', 337, 4))
	_uState38Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState38Trans1 = nil

-- TO STATE: showchoice
_uState38Trans2 = GdsCreateTransition (_uState30, _uState38, "State_30", "State_38_T2", "Dialog")
	_uState38Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 5))
	_uState38Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_047PC", "(Winterstille (weiß) )", 99, 16777215))
	_uState38Trans2:AddAction (CScriptActionValueModify('', 'mv_InternSuffix', 323, 4))
	_uState38Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState38Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState38Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState38Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState38Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState38Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState38Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState38Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState38Trans2:AddAction (CScriptActionValueModify('', 'mv_CraftingSuffix', 334, 4))
	_uState38Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState38Trans2 = nil

-- TO STATE: showchoice
_uState38Trans3 = GdsCreateTransition (_uState30, _uState38, "State_30", "State_38_T3", "Dialog")
	_uState38Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 6))
	_uState38Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_048PC", "(Nachtglanz (schwarz) )", 99, 16777215))
	_uState38Trans3:AddAction (CScriptActionValueModify('', 'mv_InternSuffix', 324, 4))
	_uState38Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState38Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState38Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState38Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState38Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState38Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState38Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState38Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState38Trans3:AddAction (CScriptActionValueModify('', 'mv_CraftingSuffix', 335, 4))
	_uState38Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState38Trans3 = nil

-- TO STATE: showchoice
_uState38Trans4 = GdsCreateTransition (_uState30, _uState38, "State_30", "State_38_T4", "Dialog")
	_uState38Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 7))
	_uState38Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_049PC", "(Sommerhauch (rot) )", 99, 16777215))
	_uState38Trans4:AddAction (CScriptActionValueModify('', 'mv_InternSuffix', 325, 4))
	_uState38Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState38Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState38Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState38Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING03)', 0, 4))
	_uState38Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING03)', 0, 4))
	_uState38Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING03)', 0, 4))
	_uState38Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING03)', 0, 4))
	_uState38Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING03)', 0, 4))
	_uState38Trans4:AddAction (CScriptActionValueModify('', 'mv_CraftingSuffix', 336, 4))
	_uState38Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState38Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState38, _uState38, "State_38", "State_38", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting03"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState38, _uBeginState, "State_38", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting03"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting03', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING03)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState40Trans1 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T1", "Dialog")
	_uState40Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 2))
	_uState40Trans1:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_052PC", "(Für Magier)", 1, 16777215))
	_uState40Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 1, 4))
	_uState40Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState40Trans1 = nil

-- TO STATE: choice
_uState40Trans2 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T2", "Dialog")
	_uState40Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 2))
	_uState40Trans2:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_053PC", "(Für Kämpfer)", 2, 16777215))
	_uState40Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 1, 4))
	_uState40Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState40Trans2 = nil

-- TO STATE: choice
_uState40Trans3 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T3", "Dialog")
	_uState40Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 2))
	_uState40Trans3:AddAction (CScriptActionChoice("P333_DLG_CRAFTING03_054PC", "(Für Hybride)", 3, 16777215))
	_uState40Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 1, 4))
	_uState40Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState40Trans3 = nil

-- TO STATE: choice
_uState40Trans4 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T4", "Dialog")
	_uState40Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 2))
	_uState40Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 0, 4))
	_uState40Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CRAFTING03)', 1, 4))
	_uState40Trans4:AddAction (CScriptActionShowChoices())
	_uState40Trans4 = nil

-- TO STATE: choice
_uState40Trans5 = GdsCreateTransition (_uState38, _uState40, "State_38", "State_40_T5", "Dialog")
	_uState40Trans5:AddAction (CScriptActionSay("crafting03", "P333_DLG_CRAFTING03_051", "(Für Magier, Kämpfer oder Hybride?)", 150, 16777215))
	_uState40Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState40Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting03"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState40, _uBeginState, "State_40", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting03"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting03', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING03)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState41Trans1 = GdsCreateTransition (_uState40, _uState41, "State_40", "State_41_T1", "Dialog")
	_uState41Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 1))
	_uState41Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_052PC", "(Für Magier)", 99, 16777215))
	_uState41Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState41Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState41Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState41Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState41Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState41, _uState41, "State_41", "State_41", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting03"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState41, _uBeginState, "State_41", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting03"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting03', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING03)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState44Trans1 = GdsCreateTransition (_uState40, _uState44, "State_40", "State_44_T1", "Dialog")
	_uState44Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 2))
	_uState44Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_053PC", "(Für Kämpfer)", 99, 16777215))
	_uState44Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState44Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState44Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState44Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState44Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState44, _uState44, "State_44", "State_44", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting03"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState44, _uBeginState, "State_44", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting03"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting03', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING03)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState47Trans1 = GdsCreateTransition (_uState40, _uState47, "State_40", "State_47_T1", "Dialog")
	_uState47Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 3))
	_uState47Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING03_054PC", "(Für Hybride)", 99, 16777215))
	_uState47Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING03)', 0, 4))
	_uState47Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING03)', 0, 4))
	_uState47Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING03)', 0, 4))
	_uState47Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState47Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState47, _uState47, "State_47", "State_47", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting03"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState47, _uBeginState, "State_47", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting03"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting03', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING03)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: else
_uState49Trans1 = GdsCreateTransition (_uState47, _uState49, "State_47", "State_49_T1", "Dialog")
	_uState49Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_EnhancedCrafting03', 1, 2) ))
	_uState49Trans1:AddAction (CScriptActionValueModify('', 'mv_CraftingPrefix', 94, 4))
	_uState49Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState49Trans1 = nil

-- TO STATE: else
_uState49Trans2 = GdsCreateTransition (_uState41, _uState49, "State_41", "State_49_T2", "Dialog")
	_uState49Trans2:AddCondition (CScriptConditionValue('', 'mf_EnhancedCrafting03', 1, 2))
	_uState49Trans2:AddAction (CScriptActionValueModify('', 'mv_CraftingPrefix', 93, 4))
	_uState49Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState49Trans2 = nil

-- TO STATE: else
_uState49Trans3 = GdsCreateTransition (_uState41, _uState49, "State_41", "State_49_T3", "Dialog")
	_uState49Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_EnhancedCrafting03', 1, 2) ))
	_uState49Trans3:AddAction (CScriptActionValueModify('', 'mv_CraftingPrefix', 92, 4))
	_uState49Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState49Trans3 = nil

-- TO STATE: else
_uState49Trans4 = GdsCreateTransition (_uState44, _uState49, "State_44", "State_49_T4", "Dialog")
	_uState49Trans4:AddCondition (CScriptConditionValue('', 'mf_EnhancedCrafting03', 1, 2))
	_uState49Trans4:AddAction (CScriptActionValueModify('', 'mv_CraftingPrefix', 91, 4))
	_uState49Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState49Trans4 = nil

-- TO STATE: else
_uState49Trans5 = GdsCreateTransition (_uState44, _uState49, "State_44", "State_49_T5", "Dialog")
	_uState49Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_EnhancedCrafting03', 1, 2) ))
	_uState49Trans5:AddAction (CScriptActionValueModify('', 'mv_CraftingPrefix', 90, 4))
	_uState49Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState49Trans5 = nil

-- TO STATE: else
_uState49Trans6 = GdsCreateTransition (_uState47, _uState49, "State_47", "State_49_T6", "Dialog")
	_uState49Trans6:AddCondition (CScriptConditionValue('', 'mf_EnhancedCrafting03', 1, 2))
	_uState49Trans6:AddAction (CScriptActionValueModify('', 'mv_CraftingPrefix', 95, 4))
	_uState49Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState49Trans6 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState49, _uState49, "State_49", "State_49", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting03"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState49, _uBeginState, "State_49", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting03"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting03', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING03)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: label
_uState50Trans1 = GdsCreateTransition (_uState49, _uState50, "State_49", "State_50_T1", "Dialog")
	_uState50Trans1:AddAction (CScriptActionPlayerGiveVariableItemGeneric('pl_Human', 'mv_CraftingPrefix', 'mv_CraftingCreoID', 'mv_CraftingSuffix', 'mv_CraftingLevel', 1))
	_uState50Trans1:AddAction (CScriptActionSay("crafting03", "P333_DLG_CRAFTING03_055", "(Ihr formt den Schmuck.)", 154, 16777215))
	_uState50Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState50Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState50, _uState50, "State_50", "State_50", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting03"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState50, _uBeginState, "State_50", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting03"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting03', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING03)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: label
_uState56Trans1 = GdsCreateTransition (_uState50, _uState56, "State_50", "State_56_T1", "Dialog")
	_uState56Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 339, 2) ))
	_uState56Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 340, 2) ))
	_uState56Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 341, 2) ))
	_uState56Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 342, 2) ))
	_uState56Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 343, 1))
	_uState56Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState56Trans1 = nil

-- TO STATE: label
_uState56Trans2 = GdsCreateTransition (_uState50, _uState56, "State_50", "State_56_T2", "Dialog")
	_uState56Trans2:AddCondition (CScriptConditionValue('', 'mv_InternCreoID', 339, 2))
	_uState56Trans2:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 339, 1))
	_uState56Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState56Trans2 = nil

-- TO STATE: label
_uState56Trans3 = GdsCreateTransition (_uState50, _uState56, "State_50", "State_56_T3", "Dialog")
	_uState56Trans3:AddCondition (CScriptConditionValue('', 'mv_InternCreoID', 340, 2))
	_uState56Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 339, 2) ))
	_uState56Trans3:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 340, 1))
	_uState56Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState56Trans3 = nil

-- TO STATE: label
_uState56Trans4 = GdsCreateTransition (_uState50, _uState56, "State_50", "State_56_T4", "Dialog")
	_uState56Trans4:AddCondition (CScriptConditionValue('', 'mv_InternCreoID', 341, 2))
	_uState56Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 339, 2) ))
	_uState56Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 340, 2) ))
	_uState56Trans4:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 341, 1))
	_uState56Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState56Trans4 = nil

-- TO STATE: label
_uState56Trans5 = GdsCreateTransition (_uState50, _uState56, "State_50", "State_56_T5", "Dialog")
	_uState56Trans5:AddCondition (CScriptConditionValue('', 'mv_InternCreoID', 342, 2))
	_uState56Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 339, 2) ))
	_uState56Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 340, 2) ))
	_uState56Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 341, 2) ))
	_uState56Trans5:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 342, 1))
	_uState56Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState56Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState56, _uState56, "State_56", "State_56", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting03", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting03"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState56, _uBeginState, "State_56", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting03"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting03', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING03)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState61Trans1 = GdsCreateTransition (_uState56, _uState61, "State_56", "State_61_T1", "Dialog")
	_uState61Trans1:AddCondition (CScriptConditionValue('', 'mv_InternSuffix', 323, 2))
	_uState61Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 323, 1))
	_uState61Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting03"))
	_uState61Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(CRAFTING03)', 1, 4))
	_uState61Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState61Trans1 = nil

-- TO STATE: endconversation
_uState61Trans2 = GdsCreateTransition (_uState56, _uState61, "State_56", "State_61_T2", "Dialog")
	_uState61Trans2:AddCondition (CScriptConditionValue('', 'mv_InternSuffix', 324, 2))
	_uState61Trans2:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternSuffix', 323, 2) ))
	_uState61Trans2:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 324, 1))
	_uState61Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting03"))
	_uState61Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(CRAFTING03)', 1, 4))
	_uState61Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState61Trans2 = nil

-- TO STATE: endconversation
_uState61Trans3 = GdsCreateTransition (_uState56, _uState61, "State_56", "State_61_T3", "Dialog")
	_uState61Trans3:AddCondition (CScriptConditionValue('', 'mv_InternSuffix', 325, 2))
	_uState61Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternSuffix', 323, 2) ))
	_uState61Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternSuffix', 324, 2) ))
	_uState61Trans3:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 325, 1))
	_uState61Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting03"))
	_uState61Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(CRAFTING03)', 1, 4))
	_uState61Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState61Trans3 = nil

-- TO STATE: endconversation
_uState61Trans4 = GdsCreateTransition (_uState56, _uState61, "State_56", "State_61_T4", "Dialog")
	_uState61Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternSuffix', 323, 2) ))
	_uState61Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternSuffix', 324, 2) ))
	_uState61Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternSuffix', 325, 2) ))
	_uState61Trans4:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 326, 1))
	_uState61Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting03"))
	_uState61Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(CRAFTING03)', 1, 4))
	_uState61Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING03)', 1, 4))
	_uState61Trans4 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState61, _uState61, "State_61", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(CRAFTING03)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting03"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(CRAFTING03)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(CRAFTING03)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState61, _uState61, "State_61", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(CRAFTING03)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting03"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(CRAFTING03)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(CRAFTING03)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState61, _uState61, "State_61", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(CRAFTING03)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting03"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(CRAFTING03)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(CRAFTING03)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState61, _uState61, "State_61", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(CRAFTING03)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting03"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(CRAFTING03)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(CRAFTING03)', 1, 4))
	_uEndActions4 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState61, _uBeginState, "State_61", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(CRAFTING03)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(CRAFTING03)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting03', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING03)', 0, 4))
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
_uState30 = nil
_uState38 = nil
_uState40 = nil
_uState41 = nil
_uState44 = nil
_uState47 = nil
_uState49 = nil
_uState50 = nil
_uState56 = nil
_uState61 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("crafting03_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(CRAFTING03)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/smallshrine_BeginDialog.tak', 'pl_HumanAvatar', 'crafting03'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(CRAFTING03)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())

