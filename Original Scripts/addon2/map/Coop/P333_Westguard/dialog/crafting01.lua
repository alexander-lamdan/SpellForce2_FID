local _uSM = GdsCreateStateMachine ("crafting01_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState4 = GdsCreateState (_uSM, "State_4")
_uState6 = GdsCreateState (_uSM, "State_6")
_uState18 = GdsCreateState (_uSM, "State_18")
_uState30 = GdsCreateState (_uSM, "State_30")
_uState40 = GdsCreateState (_uSM, "State_40")
_uState50 = GdsCreateState (_uSM, "State_50")
_uState58 = GdsCreateState (_uSM, "State_58")
_uState60 = GdsCreateState (_uSM, "State_60")
_uState69 = GdsCreateState (_uSM, "State_69")
_uState71 = GdsCreateState (_uSM, "State_71")
_uState72 = GdsCreateState (_uSM, "State_72")
_uState78 = GdsCreateState (_uSM, "State_78")
_uState83 = GdsCreateState (_uSM, "State_83")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(CRAFTING01)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(CRAFTING01)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('crafting01', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "crafting01"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING01)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(CRAFTING01)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('crafting01', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("crafting01")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING01)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING01)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(CRAFTING01)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting01"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting01', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING01)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState4Trans1 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T1", "Dialog")
	_uState4Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 2))
	_uState4Trans1:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_004PC", "(Dolch herstellen)", 1, 16777215))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 1, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState4Trans1 = nil

-- TO STATE: choice
_uState4Trans2 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T2", "Dialog")
	_uState4Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 2))
	_uState4Trans2:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_021PC", "(Einhandschwert herstellen)", 2, 16777215))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 1, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState4Trans2 = nil

-- TO STATE: choice
_uState4Trans3 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T3", "Dialog")
	_uState4Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 2))
	_uState4Trans3:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_038PC", "(Zweihandschwert herstellen)", 3, 16777215))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 1, 4))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState4Trans3 = nil

-- TO STATE: choice
_uState4Trans4 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T4", "Dialog")
	_uState4Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 2))
	_uState4Trans4:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_052PC", "(Zweihandaxt herstellen)", 4, 16777215))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 1, 4))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState4Trans4 = nil

-- TO STATE: choice
_uState4Trans5 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T5", "Dialog")
	_uState4Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 2))
	_uState4Trans5:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_066PC", "(Zweihandhammer herstellen)", 5, 16777215))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 1, 4))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState4Trans5 = nil

-- TO STATE: choice
_uState4Trans6 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T6", "Dialog")
	_uState4Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 2))
	_uState4Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 0, 4))
	_uState4Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CRAFTING01)', 1, 4))
	_uState4Trans6:AddAction (CScriptActionShowChoices())
	_uState4Trans6 = nil

-- TO STATE: choice
_uState4Trans7 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T7", "Dialog")
	_uState4Trans7:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_CreoInspected', 0, 2) ))
	_uState4Trans7:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_003", "(An diesem Creo können Nahkampfwaffen hergestellt werden.)", 102, 16777215))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState4Trans7 = nil

-- TO STATE: choice
_uState4Trans8 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T8", "Dialog")
	_uState4Trans8:AddCondition (CScriptConditionValue('', 'mf_CreoInspected', 0, 2))
	_uState4Trans8:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_001", "Dies ist ein Creo, eine Art Werkbank, welche die Former zum Herstellen von Ausrüstung verwendet haben.", 100, 16777215))
	_uState4Trans8:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_002", "(An diesem Creo können Nahkampfwaffen hergestellt werden.)", 101, 16777215))
	_uState4Trans8:AddAction (CScriptActionValueModify('', 'mf_CreoInspected', 1, 4))
	_uState4Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState4Trans8 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting01"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState4, _uBeginState, "State_4", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting01"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting01', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING01)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState6Trans1 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T1", "Dialog")
	_uState6Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 2))
	_uState6Trans1:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 339, 1, 1, 1))
	_uState6Trans1:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_006PC", "(Winderz (Stufe 18) )", 1, 16777215))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 1, 4))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState6Trans1 = nil

-- TO STATE: choice
_uState6Trans2 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T2", "Dialog")
	_uState6Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 2))
	_uState6Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1))
	_uState6Trans2:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_007PC", "(Iridiumerz (Stufe 20) )", 2, 16777215))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 1, 4))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState6Trans2 = nil

-- TO STATE: choice
_uState6Trans3 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T3", "Dialog")
	_uState6Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 2))
	_uState6Trans3:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1))
	_uState6Trans3:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_008PC", "(Lythaniumstaub (Stufe 24) )", 3, 16777215))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 1, 4))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState6Trans3 = nil

-- TO STATE: choice
_uState6Trans4 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T4", "Dialog")
	_uState6Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 2))
	_uState6Trans4:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1))
	_uState6Trans4:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_009PC", "(Adamantinumerz (Stufe 26) )", 4, 16777215))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 1, 4))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState6Trans4 = nil

-- TO STATE: choice
_uState6Trans5 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T5", "Dialog")
	_uState6Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 2))
	_uState6Trans5:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1))
	_uState6Trans5:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_010PC", "(Kristallstaub (Stufe 30) )", 5, 16777215))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 1, 4))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState6Trans5 = nil

-- TO STATE: choice
_uState6Trans6 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T6", "Dialog")
	_uState6Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 2))
	_uState6Trans6:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 339, 1, 1, 1) ))
	_uState6Trans6:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_011PC", "(Winderz (Stufe 18) )", 6, 16711680))
	_uState6Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 1, 4))
	_uState6Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState6Trans6 = nil

-- TO STATE: choice
_uState6Trans7 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T7", "Dialog")
	_uState6Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 2))
	_uState6Trans7:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1) ))
	_uState6Trans7:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_013PC", "(Iridiumerz (Stufe 20) )", 7, 16711680))
	_uState6Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 1, 4))
	_uState6Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState6Trans7 = nil

-- TO STATE: choice
_uState6Trans8 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T8", "Dialog")
	_uState6Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 2))
	_uState6Trans8:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1) ))
	_uState6Trans8:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_015PC", "(Lythaniumstaub (Stufe 24) )", 8, 16711680))
	_uState6Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 1, 4))
	_uState6Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState6Trans8 = nil

-- TO STATE: choice
_uState6Trans9 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T9", "Dialog")
	_uState6Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING01)', 0, 2))
	_uState6Trans9:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1) ))
	_uState6Trans9:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_017PC", "(Adamantinumerz (Stufe 26) )", 9, 16711680))
	_uState6Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING01)', 1, 4))
	_uState6Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState6Trans9 = nil

-- TO STATE: choice
_uState6Trans10 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T10", "Dialog")
	_uState6Trans10:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING01)', 0, 2))
	_uState6Trans10:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1) ))
	_uState6Trans10:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_019PC", "(Kristallstaub (Stufe 30) )", 10, 16711680))
	_uState6Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING01)', 1, 4))
	_uState6Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState6Trans10 = nil

-- TO STATE: choice
_uState6Trans11 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T11", "Dialog")
	_uState6Trans11:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 2))
	_uState6Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 0, 4))
	_uState6Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CRAFTING01)', 1, 4))
	_uState6Trans11:AddAction (CScriptActionShowChoices())
	_uState6Trans11 = nil

-- TO STATE: choice
_uState6Trans12 = GdsCreateTransition (_uState4, _uState6, "State_4", "State_6_T12", "Dialog")
	_uState6Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 1))
	_uState6Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_004PC", "(Dolch herstellen)", 99, 16777215))
	_uState6Trans12:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_005", "(Aus welchem Werkstoff soll der Dolch hergestellt werden?)", 104, 16777215))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState6Trans12 = nil

-- TO STATE: choice
_uState6Trans13 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T13", "Dialog")
	_uState6Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 6))
	_uState6Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_011PC", "(Winderz (Stufe 18) )", 99, 16711680))
	_uState6Trans13:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_012", "(Ihr besitzt kein Winderz.)", 111, 16777215))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING01)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING01)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState6Trans13 = nil

-- TO STATE: choice
_uState6Trans14 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T14", "Dialog")
	_uState6Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 7))
	_uState6Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_013PC", "(Iridiumerz (Stufe 20) )", 99, 16711680))
	_uState6Trans14:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_014", "(Ihr besitzt kein Iridiumerz.)", 113, 16777215))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING01)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING01)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState6Trans14 = nil

-- TO STATE: choice
_uState6Trans15 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T15", "Dialog")
	_uState6Trans15:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 8))
	_uState6Trans15:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_015PC", "(Lythaniumstaub (Stufe 24) )", 99, 16711680))
	_uState6Trans15:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_016", "(Ihr besitzt keinen Lythaniumstaub.)", 115, 16777215))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING01)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING01)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState6Trans15 = nil

-- TO STATE: choice
_uState6Trans16 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T16", "Dialog")
	_uState6Trans16:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 9))
	_uState6Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_017PC", "(Adamantinumerz (Stufe 26) )", 99, 16711680))
	_uState6Trans16:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_018", "(Ihr besitzt kein Adamantinumerz.)", 117, 16777215))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING01)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING01)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState6Trans16 = nil

-- TO STATE: choice
_uState6Trans17 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T17", "Dialog")
	_uState6Trans17:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 10))
	_uState6Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_019PC", "(Kristallstaub (Stufe 30) )", 99, 16711680))
	_uState6Trans17:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_020", "(Ihr besitzt keinen Kristallstaub.)", 119, 16777215))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING01)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING01)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState6Trans17 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting01"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState6, _uBeginState, "State_6", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting01"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting01', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING01)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState18Trans1 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T1", "Dialog")
	_uState18Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 2))
	_uState18Trans1:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 339, 1, 1, 1))
	_uState18Trans1:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_023PC", "(Winderz (Stufe 18) )", 1, 16777215))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 1, 4))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState18Trans1 = nil

-- TO STATE: choice
_uState18Trans2 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T2", "Dialog")
	_uState18Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 2))
	_uState18Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1))
	_uState18Trans2:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_024PC", "(Iridiumerz (Stufe 20) )", 2, 16777215))
	_uState18Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 1, 4))
	_uState18Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState18Trans2 = nil

-- TO STATE: choice
_uState18Trans3 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T3", "Dialog")
	_uState18Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 2))
	_uState18Trans3:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1))
	_uState18Trans3:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_025PC", "(Lythaniumstaub (Stufe 24) )", 3, 16777215))
	_uState18Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 1, 4))
	_uState18Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState18Trans3 = nil

-- TO STATE: choice
_uState18Trans4 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T4", "Dialog")
	_uState18Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 2))
	_uState18Trans4:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1))
	_uState18Trans4:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_026PC", "(Adamantinumerz (Stufe 26) )", 4, 16777215))
	_uState18Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 1, 4))
	_uState18Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState18Trans4 = nil

-- TO STATE: choice
_uState18Trans5 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T5", "Dialog")
	_uState18Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 2))
	_uState18Trans5:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1))
	_uState18Trans5:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_027PC", "(Kristallstaub (Stufe 30) )", 5, 16777215))
	_uState18Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 1, 4))
	_uState18Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState18Trans5 = nil

-- TO STATE: choice
_uState18Trans6 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T6", "Dialog")
	_uState18Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 2))
	_uState18Trans6:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 339, 1, 1, 1) ))
	_uState18Trans6:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_028PC", "(Winderz (Stufe 18) )", 6, 16711680))
	_uState18Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 1, 4))
	_uState18Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState18Trans6 = nil

-- TO STATE: choice
_uState18Trans7 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T7", "Dialog")
	_uState18Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 2))
	_uState18Trans7:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1) ))
	_uState18Trans7:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_030PC", "(Iridiumerz (Stufe 20) )", 7, 16711680))
	_uState18Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 1, 4))
	_uState18Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState18Trans7 = nil

-- TO STATE: choice
_uState18Trans8 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T8", "Dialog")
	_uState18Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 2))
	_uState18Trans8:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1) ))
	_uState18Trans8:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_032PC", "(Lythaniumstaub (Stufe 24) )", 8, 16711680))
	_uState18Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 1, 4))
	_uState18Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState18Trans8 = nil

-- TO STATE: choice
_uState18Trans9 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T9", "Dialog")
	_uState18Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING01)', 0, 2))
	_uState18Trans9:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1) ))
	_uState18Trans9:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_034PC", "(Adamantinumerz (Stufe 26) )", 9, 16711680))
	_uState18Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING01)', 1, 4))
	_uState18Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState18Trans9 = nil

-- TO STATE: choice
_uState18Trans10 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T10", "Dialog")
	_uState18Trans10:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING01)', 0, 2))
	_uState18Trans10:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1) ))
	_uState18Trans10:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_036PC", "(Kristallstaub (Stufe 30) )", 10, 16711680))
	_uState18Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING01)', 1, 4))
	_uState18Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState18Trans10 = nil

-- TO STATE: choice
_uState18Trans11 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T11", "Dialog")
	_uState18Trans11:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 2))
	_uState18Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 0, 4))
	_uState18Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CRAFTING01)', 1, 4))
	_uState18Trans11:AddAction (CScriptActionShowChoices())
	_uState18Trans11 = nil

-- TO STATE: choice
_uState18Trans12 = GdsCreateTransition (_uState4, _uState18, "State_4", "State_18_T12", "Dialog")
	_uState18Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 2))
	_uState18Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_021PC", "(Einhandschwert herstellen)", 99, 16777215))
	_uState18Trans12:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_022", "(Aus welchem Werkstoff soll das Schwert hergestellt werden?)", 121, 16777215))
	_uState18Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState18Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState18Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState18Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState18Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState18Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState18Trans12 = nil

-- TO STATE: choice
_uState18Trans13 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T13", "Dialog")
	_uState18Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 6))
	_uState18Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_028PC", "(Winderz (Stufe 18) )", 99, 16711680))
	_uState18Trans13:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_029", "(Ihr besitzt kein Winderz.)", 128, 16777215))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING01)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING01)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState18Trans13 = nil

-- TO STATE: choice
_uState18Trans14 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T14", "Dialog")
	_uState18Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 7))
	_uState18Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_030PC", "(Iridiumerz (Stufe 20) )", 99, 16711680))
	_uState18Trans14:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_031", "(Ihr besitzt kein Iridiumerz.)", 130, 16777215))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING01)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING01)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState18Trans14 = nil

-- TO STATE: choice
_uState18Trans15 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T15", "Dialog")
	_uState18Trans15:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 8))
	_uState18Trans15:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_032PC", "(Lythaniumstaub (Stufe 24) )", 99, 16711680))
	_uState18Trans15:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_033", "(Ihr besitzt keinen Lythaniumstaub.)", 132, 16777215))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING01)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING01)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState18Trans15 = nil

-- TO STATE: choice
_uState18Trans16 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T16", "Dialog")
	_uState18Trans16:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 9))
	_uState18Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_034PC", "(Adamantinumerz (Stufe 26) )", 99, 16711680))
	_uState18Trans16:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_035", "(Ihr besitzt kein Adamantinumerz.)", 134, 16777215))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING01)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING01)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState18Trans16 = nil

-- TO STATE: choice
_uState18Trans17 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T17", "Dialog")
	_uState18Trans17:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 10))
	_uState18Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_036PC", "(Kristallstaub (Stufe 30) )", 99, 16711680))
	_uState18Trans17:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_037", "(Ihr besitzt keinen Kristallstaub.)", 136, 16777215))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING01)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING01)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState18Trans17 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting01"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState18, _uBeginState, "State_18", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting01"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting01', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING01)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState30Trans1 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T1", "Dialog")
	_uState30Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 2))
	_uState30Trans1:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1))
	_uState30Trans1:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_040PC", "(Iridiumerz (Stufe 20) )", 1, 16777215))
	_uState30Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 1, 4))
	_uState30Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState30Trans1 = nil

-- TO STATE: choice
_uState30Trans2 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T2", "Dialog")
	_uState30Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 2))
	_uState30Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1))
	_uState30Trans2:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_041PC", "(Lythaniumstaub (Stufe 24) )", 2, 16777215))
	_uState30Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 1, 4))
	_uState30Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState30Trans2 = nil

-- TO STATE: choice
_uState30Trans3 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T3", "Dialog")
	_uState30Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 2))
	_uState30Trans3:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1))
	_uState30Trans3:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_042PC", "(Adamantinumerz (Stufe 26) )", 3, 16777215))
	_uState30Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 1, 4))
	_uState30Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState30Trans3 = nil

-- TO STATE: choice
_uState30Trans4 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T4", "Dialog")
	_uState30Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 2))
	_uState30Trans4:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1))
	_uState30Trans4:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_043PC", "(Kristallstaub (Stufe 30) )", 4, 16777215))
	_uState30Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 1, 4))
	_uState30Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState30Trans4 = nil

-- TO STATE: choice
_uState30Trans5 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T5", "Dialog")
	_uState30Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 2))
	_uState30Trans5:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1) ))
	_uState30Trans5:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_044PC", "(Iridiumerz (Stufe 20) )", 5, 16711680))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 1, 4))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState30Trans5 = nil

-- TO STATE: choice
_uState30Trans6 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T6", "Dialog")
	_uState30Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 2))
	_uState30Trans6:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1) ))
	_uState30Trans6:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_046PC", "(Lythaniumstaub (Stufe 24) )", 6, 16711680))
	_uState30Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 1, 4))
	_uState30Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState30Trans6 = nil

-- TO STATE: choice
_uState30Trans7 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T7", "Dialog")
	_uState30Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 2))
	_uState30Trans7:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1) ))
	_uState30Trans7:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_048PC", "(Adamantinumerz (Stufe 26) )", 7, 16711680))
	_uState30Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 1, 4))
	_uState30Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState30Trans7 = nil

-- TO STATE: choice
_uState30Trans8 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T8", "Dialog")
	_uState30Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 2))
	_uState30Trans8:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1) ))
	_uState30Trans8:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_050PC", "(Kristallstaub (Stufe 30) )", 8, 16711680))
	_uState30Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 1, 4))
	_uState30Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState30Trans8 = nil

-- TO STATE: choice
_uState30Trans9 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T9", "Dialog")
	_uState30Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 2))
	_uState30Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 0, 4))
	_uState30Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CRAFTING01)', 1, 4))
	_uState30Trans9:AddAction (CScriptActionShowChoices())
	_uState30Trans9 = nil

-- TO STATE: choice
_uState30Trans10 = GdsCreateTransition (_uState4, _uState30, "State_4", "State_30_T10", "Dialog")
	_uState30Trans10:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 3))
	_uState30Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_038PC", "(Zweihandschwert herstellen)", 99, 16777215))
	_uState30Trans10:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_039", "(Aus welchem Werkstoff soll das Schwert hergestellt werden?)", 138, 16777215))
	_uState30Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState30Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState30Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState30Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState30Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState30Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState30Trans10 = nil

-- TO STATE: choice
_uState30Trans11 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T11", "Dialog")
	_uState30Trans11:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 5))
	_uState30Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_044PC", "(Iridiumerz (Stufe 20) )", 99, 16711680))
	_uState30Trans11:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_045", "(Ihr besitzt kein Iridiumerz.)", 144, 16777215))
	_uState30Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState30Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState30Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState30Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState30Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState30Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState30Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState30Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState30Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState30Trans11 = nil

-- TO STATE: choice
_uState30Trans12 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T12", "Dialog")
	_uState30Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 6))
	_uState30Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_046PC", "(Lythaniumstaub (Stufe 24) )", 99, 16711680))
	_uState30Trans12:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_047", "(Ihr besitzt keinen Lythaniumstaub.)", 146, 16777215))
	_uState30Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState30Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState30Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState30Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState30Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState30Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState30Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState30Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState30Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState30Trans12 = nil

-- TO STATE: choice
_uState30Trans13 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T13", "Dialog")
	_uState30Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 7))
	_uState30Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_048PC", "(Adamantinumerz (Stufe 26) )", 99, 16711680))
	_uState30Trans13:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_049", "(Ihr besitzt kein Adamantinumerz.)", 148, 16777215))
	_uState30Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState30Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState30Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState30Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState30Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState30Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState30Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState30Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState30Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState30Trans13 = nil

-- TO STATE: choice
_uState30Trans14 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T14", "Dialog")
	_uState30Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 8))
	_uState30Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_050PC", "(Kristallstaub (Stufe 30) )", 99, 16711680))
	_uState30Trans14:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_051", "(Ihr besitzt keinen Kristallstaub.)", 150, 16777215))
	_uState30Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState30Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState30Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState30Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState30Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState30Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState30Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState30Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState30Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState30Trans14 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting01"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState30, _uBeginState, "State_30", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting01"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting01', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING01)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState40Trans1 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T1", "Dialog")
	_uState40Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 2))
	_uState40Trans1:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1))
	_uState40Trans1:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_054PC", "(Iridiumerz (Stufe 20) )", 1, 16777215))
	_uState40Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 1, 4))
	_uState40Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState40Trans1 = nil

-- TO STATE: choice
_uState40Trans2 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T2", "Dialog")
	_uState40Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 2))
	_uState40Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1))
	_uState40Trans2:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_055PC", "(Lythaniumstaub (Stufe 24) )", 2, 16777215))
	_uState40Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 1, 4))
	_uState40Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState40Trans2 = nil

-- TO STATE: choice
_uState40Trans3 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T3", "Dialog")
	_uState40Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 2))
	_uState40Trans3:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1))
	_uState40Trans3:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_056PC", "(Adamantinumerz (Stufe 26) )", 3, 16777215))
	_uState40Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 1, 4))
	_uState40Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState40Trans3 = nil

-- TO STATE: choice
_uState40Trans4 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T4", "Dialog")
	_uState40Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 2))
	_uState40Trans4:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1))
	_uState40Trans4:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_057PC", "(Kristallstaub (Stufe 30) )", 4, 16777215))
	_uState40Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 1, 4))
	_uState40Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState40Trans4 = nil

-- TO STATE: choice
_uState40Trans5 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T5", "Dialog")
	_uState40Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 2))
	_uState40Trans5:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1) ))
	_uState40Trans5:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_058PC", "(Iridiumerz (Stufe 20) )", 5, 16711680))
	_uState40Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 1, 4))
	_uState40Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState40Trans5 = nil

-- TO STATE: choice
_uState40Trans6 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T6", "Dialog")
	_uState40Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 2))
	_uState40Trans6:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1) ))
	_uState40Trans6:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_060PC", "(Lythaniumstaub (Stufe 24) )", 6, 16711680))
	_uState40Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 1, 4))
	_uState40Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState40Trans6 = nil

-- TO STATE: choice
_uState40Trans7 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T7", "Dialog")
	_uState40Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 2))
	_uState40Trans7:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1) ))
	_uState40Trans7:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_062PC", "(Adamantinumerz (Stufe 26) )", 7, 16711680))
	_uState40Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 1, 4))
	_uState40Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState40Trans7 = nil

-- TO STATE: choice
_uState40Trans8 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T8", "Dialog")
	_uState40Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 2))
	_uState40Trans8:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1) ))
	_uState40Trans8:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_064PC", "(Kristallstaub (Stufe 30) )", 8, 16711680))
	_uState40Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 1, 4))
	_uState40Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState40Trans8 = nil

-- TO STATE: choice
_uState40Trans9 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T9", "Dialog")
	_uState40Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 2))
	_uState40Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 0, 4))
	_uState40Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CRAFTING01)', 1, 4))
	_uState40Trans9:AddAction (CScriptActionShowChoices())
	_uState40Trans9 = nil

-- TO STATE: choice
_uState40Trans10 = GdsCreateTransition (_uState4, _uState40, "State_4", "State_40_T10", "Dialog")
	_uState40Trans10:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 4))
	_uState40Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_052PC", "(Zweihandaxt herstellen)", 99, 16777215))
	_uState40Trans10:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_053", "(Aus welchem Werkstoff soll die Axt hergestellt werden?)", 152, 16777215))
	_uState40Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState40Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState40Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState40Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState40Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState40Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState40Trans10 = nil

-- TO STATE: choice
_uState40Trans11 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T11", "Dialog")
	_uState40Trans11:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 5))
	_uState40Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_058PC", "(Iridiumerz (Stufe 20) )", 99, 16711680))
	_uState40Trans11:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_059", "(Ihr besitzt kein Iridiumerz.)", 158, 16777215))
	_uState40Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState40Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState40Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState40Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState40Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState40Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState40Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState40Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState40Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState40Trans11 = nil

-- TO STATE: choice
_uState40Trans12 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T12", "Dialog")
	_uState40Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 6))
	_uState40Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_060PC", "(Lythaniumstaub (Stufe 24) )", 99, 16711680))
	_uState40Trans12:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_061", "(Ihr besitzt keinen Lythaniumstaub.)", 160, 16777215))
	_uState40Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState40Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState40Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState40Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState40Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState40Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState40Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState40Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState40Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState40Trans12 = nil

-- TO STATE: choice
_uState40Trans13 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T13", "Dialog")
	_uState40Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 7))
	_uState40Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_062PC", "(Adamantinumerz (Stufe 26) )", 99, 16711680))
	_uState40Trans13:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_063", "(Ihr besitzt kein Adamantinumerz.)", 162, 16777215))
	_uState40Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState40Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState40Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState40Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState40Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState40Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState40Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState40Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState40Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState40Trans13 = nil

-- TO STATE: choice
_uState40Trans14 = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40_T14", "Dialog")
	_uState40Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 8))
	_uState40Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_064PC", "(Kristallstaub (Stufe 30) )", 99, 16711680))
	_uState40Trans14:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_065", "(Ihr besitzt keinen Kristallstaub.)", 164, 16777215))
	_uState40Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState40Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState40Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState40Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState40Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState40Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState40Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState40Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState40Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState40Trans14 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting01"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState40, _uBeginState, "State_40", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting01"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting01', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING01)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState50Trans1 = GdsCreateTransition (_uState50, _uState50, "State_50", "State_50_T1", "Dialog")
	_uState50Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 2))
	_uState50Trans1:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1))
	_uState50Trans1:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_068PC", "(Iridiumerz (Stufe 20) )", 1, 16777215))
	_uState50Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 1, 4))
	_uState50Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState50Trans1 = nil

-- TO STATE: choice
_uState50Trans2 = GdsCreateTransition (_uState50, _uState50, "State_50", "State_50_T2", "Dialog")
	_uState50Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 2))
	_uState50Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1))
	_uState50Trans2:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_069PC", "(Lythaniumstaub (Stufe 24) )", 2, 16777215))
	_uState50Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 1, 4))
	_uState50Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState50Trans2 = nil

-- TO STATE: choice
_uState50Trans3 = GdsCreateTransition (_uState50, _uState50, "State_50", "State_50_T3", "Dialog")
	_uState50Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 2))
	_uState50Trans3:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1))
	_uState50Trans3:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_070PC", "(Adamantinumerz (Stufe 26) )", 3, 16777215))
	_uState50Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 1, 4))
	_uState50Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState50Trans3 = nil

-- TO STATE: choice
_uState50Trans4 = GdsCreateTransition (_uState50, _uState50, "State_50", "State_50_T4", "Dialog")
	_uState50Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 2))
	_uState50Trans4:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1) ))
	_uState50Trans4:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_071PC", "(Iridiumerz (Stufe 20) )", 4, 16711680))
	_uState50Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 1, 4))
	_uState50Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState50Trans4 = nil

-- TO STATE: choice
_uState50Trans5 = GdsCreateTransition (_uState50, _uState50, "State_50", "State_50_T5", "Dialog")
	_uState50Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 2))
	_uState50Trans5:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1) ))
	_uState50Trans5:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_073PC", "(Lythaniumstaub (Stufe 24) )", 5, 16711680))
	_uState50Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 1, 4))
	_uState50Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState50Trans5 = nil

-- TO STATE: choice
_uState50Trans6 = GdsCreateTransition (_uState50, _uState50, "State_50", "State_50_T6", "Dialog")
	_uState50Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 2))
	_uState50Trans6:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1) ))
	_uState50Trans6:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_075PC", "(Adamantinumerz (Stufe 26) )", 6, 16711680))
	_uState50Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 1, 4))
	_uState50Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState50Trans6 = nil

-- TO STATE: choice
_uState50Trans7 = GdsCreateTransition (_uState50, _uState50, "State_50", "State_50_T7", "Dialog")
	_uState50Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 2))
	_uState50Trans7:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1) ))
	_uState50Trans7:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_077PC", "(Kristallstaub (Stufe 30) )", 7, 16711680))
	_uState50Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 1, 4))
	_uState50Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState50Trans7 = nil

-- TO STATE: choice
_uState50Trans8 = GdsCreateTransition (_uState50, _uState50, "State_50", "State_50_T8", "Dialog")
	_uState50Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 2))
	_uState50Trans8:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1))
	_uState50Trans8:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_079PC", "(Kristallstaub (Stufe 30) )", 8, 16777215))
	_uState50Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 1, 4))
	_uState50Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState50Trans8 = nil

-- TO STATE: choice
_uState50Trans9 = GdsCreateTransition (_uState50, _uState50, "State_50", "State_50_T9", "Dialog")
	_uState50Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 2))
	_uState50Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 0, 4))
	_uState50Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CRAFTING01)', 1, 4))
	_uState50Trans9:AddAction (CScriptActionShowChoices())
	_uState50Trans9 = nil

-- TO STATE: choice
_uState50Trans10 = GdsCreateTransition (_uState4, _uState50, "State_4", "State_50_T10", "Dialog")
	_uState50Trans10:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 5))
	_uState50Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_066PC", "(Zweihandhammer herstellen)", 99, 16777215))
	_uState50Trans10:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_067", "(Aus welchem Werkstoff soll der Hammer hergestellt werden?)", 166, 16777215))
	_uState50Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState50Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState50Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState50Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState50Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState50Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState50Trans10 = nil

-- TO STATE: choice
_uState50Trans11 = GdsCreateTransition (_uState50, _uState50, "State_50", "State_50_T11", "Dialog")
	_uState50Trans11:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 4))
	_uState50Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_071PC", "(Iridiumerz (Stufe 20) )", 99, 16711680))
	_uState50Trans11:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_072", "(Ihr besitzt kein Iridiumerz.)", 171, 16777215))
	_uState50Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState50Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState50Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState50Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState50Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState50Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState50Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState50Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState50Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState50Trans11 = nil

-- TO STATE: choice
_uState50Trans12 = GdsCreateTransition (_uState50, _uState50, "State_50", "State_50_T12", "Dialog")
	_uState50Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 5))
	_uState50Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_073PC", "(Lythaniumstaub (Stufe 24) )", 99, 16711680))
	_uState50Trans12:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_074", "(Ihr besitzt keinen Lythaniumstaub.)", 173, 16777215))
	_uState50Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState50Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState50Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState50Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState50Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState50Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState50Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState50Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState50Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState50Trans12 = nil

-- TO STATE: choice
_uState50Trans13 = GdsCreateTransition (_uState50, _uState50, "State_50", "State_50_T13", "Dialog")
	_uState50Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 6))
	_uState50Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_075PC", "(Adamantinumerz (Stufe 26) )", 99, 16711680))
	_uState50Trans13:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_076", "(Ihr besitzt kein Adamantinumerz.)", 175, 16777215))
	_uState50Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState50Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState50Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState50Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState50Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState50Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState50Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState50Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState50Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState50Trans13 = nil

-- TO STATE: choice
_uState50Trans14 = GdsCreateTransition (_uState50, _uState50, "State_50", "State_50_T14", "Dialog")
	_uState50Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 7))
	_uState50Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_077PC", "(Kristallstaub (Stufe 30) )", 99, 16711680))
	_uState50Trans14:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_078", "(Ihr besitzt keinen Kristallstaub.)", 177, 16777215))
	_uState50Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState50Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState50Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState50Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState50Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState50Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState50Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState50Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState50Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState50Trans14 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState50, _uState50, "State_50", "State_50", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting01"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState50, _uBeginState, "State_50", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting01"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting01', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING01)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState58Trans1 = GdsCreateTransition (_uState50, _uState58, "State_50", "State_58_T1", "Dialog")
	_uState58Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 8))
	_uState58Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_079PC", "(Kristallstaub (Stufe 30) )", 99, 16777215))
	_uState58Trans1:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 343, 4))
	_uState58Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans1:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 355, 4))
	_uState58Trans1:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 30, 4))
	_uState58Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans1 = nil

-- TO STATE: showchoice
_uState58Trans2 = GdsCreateTransition (_uState6, _uState58, "State_6", "State_58_T2", "Dialog")
	_uState58Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 1))
	_uState58Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_006PC", "(Winderz (Stufe 18) )", 99, 16777215))
	_uState58Trans2:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 339, 4))
	_uState58Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING01)', 0, 4))
	_uState58Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING01)', 0, 4))
	_uState58Trans2:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 356, 4))
	_uState58Trans2:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 18, 4))
	_uState58Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans2 = nil

-- TO STATE: showchoice
_uState58Trans3 = GdsCreateTransition (_uState6, _uState58, "State_6", "State_58_T3", "Dialog")
	_uState58Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 2))
	_uState58Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_007PC", "(Iridiumerz (Stufe 20) )", 99, 16777215))
	_uState58Trans3:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 340, 4))
	_uState58Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING01)', 0, 4))
	_uState58Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING01)', 0, 4))
	_uState58Trans3:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 357, 4))
	_uState58Trans3:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 20, 4))
	_uState58Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans3 = nil

-- TO STATE: showchoice
_uState58Trans4 = GdsCreateTransition (_uState6, _uState58, "State_6", "State_58_T4", "Dialog")
	_uState58Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 3))
	_uState58Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_008PC", "(Lythaniumstaub (Stufe 24) )", 99, 16777215))
	_uState58Trans4:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 341, 4))
	_uState58Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING01)', 0, 4))
	_uState58Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING01)', 0, 4))
	_uState58Trans4:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 358, 4))
	_uState58Trans4:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 24, 4))
	_uState58Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans4 = nil

-- TO STATE: showchoice
_uState58Trans5 = GdsCreateTransition (_uState6, _uState58, "State_6", "State_58_T5", "Dialog")
	_uState58Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 4))
	_uState58Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_009PC", "(Adamantinumerz (Stufe 26) )", 99, 16777215))
	_uState58Trans5:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 342, 4))
	_uState58Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING01)', 0, 4))
	_uState58Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING01)', 0, 4))
	_uState58Trans5:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 359, 4))
	_uState58Trans5:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 26, 4))
	_uState58Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans5 = nil

-- TO STATE: showchoice
_uState58Trans6 = GdsCreateTransition (_uState6, _uState58, "State_6", "State_58_T6", "Dialog")
	_uState58Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 5))
	_uState58Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_010PC", "(Kristallstaub (Stufe 30) )", 99, 16777215))
	_uState58Trans6:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 343, 4))
	_uState58Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING01)', 0, 4))
	_uState58Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING01)', 0, 4))
	_uState58Trans6:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 360, 4))
	_uState58Trans6:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 30, 4))
	_uState58Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans6 = nil

-- TO STATE: showchoice
_uState58Trans7 = GdsCreateTransition (_uState18, _uState58, "State_18", "State_58_T7", "Dialog")
	_uState58Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 1))
	_uState58Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_023PC", "(Winderz (Stufe 18) )", 99, 16777215))
	_uState58Trans7:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 339, 4))
	_uState58Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING01)', 0, 4))
	_uState58Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING01)', 0, 4))
	_uState58Trans7:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 339, 4))
	_uState58Trans7:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 18, 4))
	_uState58Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans7 = nil

-- TO STATE: showchoice
_uState58Trans8 = GdsCreateTransition (_uState18, _uState58, "State_18", "State_58_T8", "Dialog")
	_uState58Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 2))
	_uState58Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_024PC", "(Iridiumerz (Stufe 20) )", 99, 16777215))
	_uState58Trans8:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 340, 4))
	_uState58Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING01)', 0, 4))
	_uState58Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING01)', 0, 4))
	_uState58Trans8:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 340, 4))
	_uState58Trans8:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 20, 4))
	_uState58Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans8 = nil

-- TO STATE: showchoice
_uState58Trans9 = GdsCreateTransition (_uState18, _uState58, "State_18", "State_58_T9", "Dialog")
	_uState58Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 3))
	_uState58Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_025PC", "(Lythaniumstaub (Stufe 24) )", 99, 16777215))
	_uState58Trans9:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 341, 4))
	_uState58Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING01)', 0, 4))
	_uState58Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING01)', 0, 4))
	_uState58Trans9:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 341, 4))
	_uState58Trans9:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 24, 4))
	_uState58Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans9 = nil

-- TO STATE: showchoice
_uState58Trans10 = GdsCreateTransition (_uState18, _uState58, "State_18", "State_58_T10", "Dialog")
	_uState58Trans10:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 4))
	_uState58Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_026PC", "(Adamantinumerz (Stufe 26) )", 99, 16777215))
	_uState58Trans10:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 342, 4))
	_uState58Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING01)', 0, 4))
	_uState58Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING01)', 0, 4))
	_uState58Trans10:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 342, 4))
	_uState58Trans10:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 26, 4))
	_uState58Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans10 = nil

-- TO STATE: showchoice
_uState58Trans11 = GdsCreateTransition (_uState18, _uState58, "State_18", "State_58_T11", "Dialog")
	_uState58Trans11:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 5))
	_uState58Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_027PC", "(Kristallstaub (Stufe 30) )", 99, 16777215))
	_uState58Trans11:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 343, 4))
	_uState58Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING01)', 0, 4))
	_uState58Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING01)', 0, 4))
	_uState58Trans11:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 343, 4))
	_uState58Trans11:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 30, 4))
	_uState58Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans11 = nil

-- TO STATE: showchoice
_uState58Trans12 = GdsCreateTransition (_uState30, _uState58, "State_30", "State_58_T12", "Dialog")
	_uState58Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 1))
	_uState58Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_040PC", "(Iridiumerz (Stufe 20) )", 99, 16777215))
	_uState58Trans12:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 340, 4))
	_uState58Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans12:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 344, 4))
	_uState58Trans12:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 20, 4))
	_uState58Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans12 = nil

-- TO STATE: showchoice
_uState58Trans13 = GdsCreateTransition (_uState30, _uState58, "State_30", "State_58_T13", "Dialog")
	_uState58Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 2))
	_uState58Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_041PC", "(Lythaniumstaub (Stufe 24) )", 99, 16777215))
	_uState58Trans13:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 341, 4))
	_uState58Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans13:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 345, 4))
	_uState58Trans13:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 24, 4))
	_uState58Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans13 = nil

-- TO STATE: showchoice
_uState58Trans14 = GdsCreateTransition (_uState30, _uState58, "State_30", "State_58_T14", "Dialog")
	_uState58Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 3))
	_uState58Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_042PC", "(Adamantinumerz (Stufe 26) )", 99, 16777215))
	_uState58Trans14:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 342, 4))
	_uState58Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans14:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 346, 4))
	_uState58Trans14:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 26, 4))
	_uState58Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans14 = nil

-- TO STATE: showchoice
_uState58Trans15 = GdsCreateTransition (_uState30, _uState58, "State_30", "State_58_T15", "Dialog")
	_uState58Trans15:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 4))
	_uState58Trans15:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_043PC", "(Kristallstaub (Stufe 30) )", 99, 16777215))
	_uState58Trans15:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 343, 4))
	_uState58Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans15:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 347, 4))
	_uState58Trans15:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 30, 4))
	_uState58Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans15 = nil

-- TO STATE: showchoice
_uState58Trans16 = GdsCreateTransition (_uState40, _uState58, "State_40", "State_58_T16", "Dialog")
	_uState58Trans16:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 1))
	_uState58Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_054PC", "(Iridiumerz (Stufe 20) )", 99, 16777215))
	_uState58Trans16:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 340, 4))
	_uState58Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans16:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 348, 4))
	_uState58Trans16:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 20, 4))
	_uState58Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans16 = nil

-- TO STATE: showchoice
_uState58Trans17 = GdsCreateTransition (_uState40, _uState58, "State_40", "State_58_T17", "Dialog")
	_uState58Trans17:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 2))
	_uState58Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_055PC", "(Lythaniumstaub (Stufe 24) )", 99, 16777215))
	_uState58Trans17:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 341, 4))
	_uState58Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans17:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 349, 4))
	_uState58Trans17:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 24, 4))
	_uState58Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans17 = nil

-- TO STATE: showchoice
_uState58Trans18 = GdsCreateTransition (_uState40, _uState58, "State_40", "State_58_T18", "Dialog")
	_uState58Trans18:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 3))
	_uState58Trans18:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_056PC", "(Adamantinumerz (Stufe 26) )", 99, 16777215))
	_uState58Trans18:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 342, 4))
	_uState58Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans18:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 350, 4))
	_uState58Trans18:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 26, 4))
	_uState58Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans18 = nil

-- TO STATE: showchoice
_uState58Trans19 = GdsCreateTransition (_uState40, _uState58, "State_40", "State_58_T19", "Dialog")
	_uState58Trans19:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 4))
	_uState58Trans19:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_057PC", "(Kristallstaub (Stufe 30) )", 99, 16777215))
	_uState58Trans19:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 343, 4))
	_uState58Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans19:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 351, 4))
	_uState58Trans19:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 30, 4))
	_uState58Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans19 = nil

-- TO STATE: showchoice
_uState58Trans20 = GdsCreateTransition (_uState50, _uState58, "State_50", "State_58_T20", "Dialog")
	_uState58Trans20:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 1))
	_uState58Trans20:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_068PC", "(Iridiumerz (Stufe 20) )", 99, 16777215))
	_uState58Trans20:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 340, 4))
	_uState58Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans20:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 352, 4))
	_uState58Trans20:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 20, 4))
	_uState58Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans20 = nil

-- TO STATE: showchoice
_uState58Trans21 = GdsCreateTransition (_uState50, _uState58, "State_50", "State_58_T21", "Dialog")
	_uState58Trans21:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 2))
	_uState58Trans21:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_069PC", "(Lythaniumstaub (Stufe 24) )", 99, 16777215))
	_uState58Trans21:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 341, 4))
	_uState58Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans21:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 353, 4))
	_uState58Trans21:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 24, 4))
	_uState58Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans21 = nil

-- TO STATE: showchoice
_uState58Trans22 = GdsCreateTransition (_uState50, _uState58, "State_50", "State_58_T22", "Dialog")
	_uState58Trans22:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 3))
	_uState58Trans22:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_070PC", "(Adamantinumerz (Stufe 26) )", 99, 16777215))
	_uState58Trans22:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 342, 4))
	_uState58Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans22:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 354, 4))
	_uState58Trans22:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 26, 4))
	_uState58Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans22 = nil

-- TO STATE: showchoice
_uState58Trans23 = GdsCreateTransition (_uState60, _uState58, "State_60", "State_58_T23", "Dialog")
	_uState58Trans23:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 1))
	_uState58Trans23:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_081PC", "(Winterstille (weiß) )", 99, 16711680))
	_uState58Trans23:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_082", "(Euch fehlt ein solcher Edelstein.)", 181, 16777215))
	_uState58Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans23 = nil

-- TO STATE: showchoice
_uState58Trans24 = GdsCreateTransition (_uState60, _uState58, "State_60", "State_58_T24", "Dialog")
	_uState58Trans24:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 2))
	_uState58Trans24:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_083PC", "(Nachtglanz (schwarz) )", 99, 16711680))
	_uState58Trans24:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_084", "(Euch fehlt ein solcher Edelstein.)", 183, 16777215))
	_uState58Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans24 = nil

-- TO STATE: showchoice
_uState58Trans25 = GdsCreateTransition (_uState60, _uState58, "State_60", "State_58_T25", "Dialog")
	_uState58Trans25:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 3))
	_uState58Trans25:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_085PC", "(Sommerhauch (rot) )", 99, 16711680))
	_uState58Trans25:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_086", "(Euch fehlt ein solcher Edelstein.)", 185, 16777215))
	_uState58Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans25 = nil

-- TO STATE: showchoice
_uState58Trans26 = GdsCreateTransition (_uState60, _uState58, "State_60", "State_58_T26", "Dialog")
	_uState58Trans26:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 4))
	_uState58Trans26:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_087PC", "(Frühlingslicht (grün) )", 99, 16711680))
	_uState58Trans26:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_088", "(Euch fehlt ein solcher Edelstein.)", 187, 16777215))
	_uState58Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState58Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState58Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState58Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState58Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState58Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState58Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState58Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState58Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState58Trans26 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState58, _uState58, "State_58", "State_58", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting01"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState58, _uBeginState, "State_58", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting01"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting01', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING01)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState60Trans1 = GdsCreateTransition (_uState60, _uState60, "State_60", "State_60_T1", "Dialog")
	_uState60Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 2))
	_uState60Trans1:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 323, 1, 1, 1) ))
	_uState60Trans1:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_081PC", "(Winterstille (weiß) )", 1, 16711680))
	_uState60Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 1, 4))
	_uState60Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState60Trans1 = nil

-- TO STATE: choice
_uState60Trans2 = GdsCreateTransition (_uState60, _uState60, "State_60", "State_60_T2", "Dialog")
	_uState60Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 2))
	_uState60Trans2:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 324, 1, 1, 1) ))
	_uState60Trans2:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_083PC", "(Nachtglanz (schwarz) )", 2, 16711680))
	_uState60Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 1, 4))
	_uState60Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState60Trans2 = nil

-- TO STATE: choice
_uState60Trans3 = GdsCreateTransition (_uState60, _uState60, "State_60", "State_60_T3", "Dialog")
	_uState60Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 2))
	_uState60Trans3:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 325, 1, 1, 1) ))
	_uState60Trans3:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_085PC", "(Sommerhauch (rot) )", 3, 16711680))
	_uState60Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 1, 4))
	_uState60Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState60Trans3 = nil

-- TO STATE: choice
_uState60Trans4 = GdsCreateTransition (_uState60, _uState60, "State_60", "State_60_T4", "Dialog")
	_uState60Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 2))
	_uState60Trans4:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 326, 1, 1, 1) ))
	_uState60Trans4:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_087PC", "(Frühlingslicht (grün) )", 4, 16711680))
	_uState60Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 1, 4))
	_uState60Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState60Trans4 = nil

-- TO STATE: choice
_uState60Trans5 = GdsCreateTransition (_uState60, _uState60, "State_60", "State_60_T5", "Dialog")
	_uState60Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 2))
	_uState60Trans5:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 323, 1, 1, 1))
	_uState60Trans5:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_089PC", "(Winterstille (weiß) )", 5, 16777215))
	_uState60Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 1, 4))
	_uState60Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState60Trans5 = nil

-- TO STATE: choice
_uState60Trans6 = GdsCreateTransition (_uState60, _uState60, "State_60", "State_60_T6", "Dialog")
	_uState60Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 2))
	_uState60Trans6:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 324, 1, 1, 1))
	_uState60Trans6:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_090PC", "(Nachtglanz (schwarz) )", 6, 16777215))
	_uState60Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 1, 4))
	_uState60Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState60Trans6 = nil

-- TO STATE: choice
_uState60Trans7 = GdsCreateTransition (_uState60, _uState60, "State_60", "State_60_T7", "Dialog")
	_uState60Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 2))
	_uState60Trans7:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 325, 1, 1, 1))
	_uState60Trans7:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_091PC", "(Sommerhauch (rot) )", 7, 16777215))
	_uState60Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 1, 4))
	_uState60Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState60Trans7 = nil

-- TO STATE: choice
_uState60Trans8 = GdsCreateTransition (_uState60, _uState60, "State_60", "State_60_T8", "Dialog")
	_uState60Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 2))
	_uState60Trans8:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 326, 1, 1, 1))
	_uState60Trans8:AddAction (CScriptActionChoice("P333_DLG_CRAFTING01_092PC", "(Frühlingslicht (grün) )", 8, 16777215))
	_uState60Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 1, 4))
	_uState60Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState60Trans8 = nil

-- TO STATE: choice
_uState60Trans9 = GdsCreateTransition (_uState60, _uState60, "State_60", "State_60_T9", "Dialog")
	_uState60Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 2))
	_uState60Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 0, 4))
	_uState60Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CRAFTING01)', 1, 4))
	_uState60Trans9:AddAction (CScriptActionShowChoices())
	_uState60Trans9 = nil

-- TO STATE: choice
_uState60Trans10 = GdsCreateTransition (_uState58, _uState60, "State_58", "State_60_T10", "Dialog")
	_uState60Trans10:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_080", "(Welcher Edelstein soll beim Herstellen verwendet werden?)", 179, 16777215))
	_uState60Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState60Trans10 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState60, _uState60, "State_60", "State_60", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting01"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState60, _uBeginState, "State_60", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting01"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting01', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING01)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: label
_uState69Trans1 = GdsCreateTransition (_uState60, _uState69, "State_60", "State_69_T1", "Dialog")
	_uState69Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 8))
	_uState69Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_092PC", "(Frühlingslicht (grün) )", 99, 16777215))
	_uState69Trans1:AddAction (CScriptActionValueModify('', 'mv_InternSuffix', 326, 4))
	_uState69Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState69Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState69Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState69Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState69Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState69Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState69Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState69Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState69Trans1:AddAction (CScriptActionValueModify('', 'mv_CraftingSuffix', 333, 4))
	_uState69Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState69Trans1 = nil

-- TO STATE: label
_uState69Trans2 = GdsCreateTransition (_uState60, _uState69, "State_60", "State_69_T2", "Dialog")
	_uState69Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 5))
	_uState69Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_089PC", "(Winterstille (weiß) )", 99, 16777215))
	_uState69Trans2:AddAction (CScriptActionValueModify('', 'mv_InternSuffix', 323, 4))
	_uState69Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState69Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState69Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState69Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState69Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState69Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState69Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState69Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState69Trans2:AddAction (CScriptActionValueModify('', 'mv_CraftingSuffix', 330, 4))
	_uState69Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState69Trans2 = nil

-- TO STATE: label
_uState69Trans3 = GdsCreateTransition (_uState60, _uState69, "State_60", "State_69_T3", "Dialog")
	_uState69Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 6))
	_uState69Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_090PC", "(Nachtglanz (schwarz) )", 99, 16777215))
	_uState69Trans3:AddAction (CScriptActionValueModify('', 'mv_InternSuffix', 324, 4))
	_uState69Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState69Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState69Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState69Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState69Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState69Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState69Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState69Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState69Trans3:AddAction (CScriptActionValueModify('', 'mv_CraftingSuffix', 331, 4))
	_uState69Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState69Trans3 = nil

-- TO STATE: label
_uState69Trans4 = GdsCreateTransition (_uState60, _uState69, "State_60", "State_69_T4", "Dialog")
	_uState69Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 7))
	_uState69Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING01_091PC", "(Sommerhauch (rot) )", 99, 16777215))
	_uState69Trans4:AddAction (CScriptActionValueModify('', 'mv_InternSuffix', 325, 4))
	_uState69Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING01)', 0, 4))
	_uState69Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING01)', 0, 4))
	_uState69Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING01)', 0, 4))
	_uState69Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING01)', 0, 4))
	_uState69Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING01)', 0, 4))
	_uState69Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING01)', 0, 4))
	_uState69Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING01)', 0, 4))
	_uState69Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING01)', 0, 4))
	_uState69Trans4:AddAction (CScriptActionValueModify('', 'mv_CraftingSuffix', 332, 4))
	_uState69Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState69Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState69, _uState69, "State_69", "State_69", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting01"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState69, _uBeginState, "State_69", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting01"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting01', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING01)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: else
_uState71Trans1 = GdsCreateTransition (_uState69, _uState71, "State_69", "State_71_T1", "Dialog")
	_uState71Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_EnhancedCrafting01', 1, 2) ))
	_uState71Trans1:AddAction (CScriptActionValueModify('', 'mv_CraftingPrefix', 84, 4))
	_uState71Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState71Trans1 = nil

-- TO STATE: else
_uState71Trans2 = GdsCreateTransition (_uState69, _uState71, "State_69", "State_71_T2", "Dialog")
	_uState71Trans2:AddCondition (CScriptConditionValue('', 'mf_EnhancedCrafting01', 1, 2))
	_uState71Trans2:AddAction (CScriptActionValueModify('', 'mv_CraftingPrefix', 85, 4))
	_uState71Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState71Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState71, _uState71, "State_71", "State_71", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting01"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState71, _uBeginState, "State_71", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting01"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting01', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING01)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: label
_uState72Trans1 = GdsCreateTransition (_uState71, _uState72, "State_71", "State_72_T1", "Dialog")
	_uState72Trans1:AddAction (CScriptActionPlayerGiveVariableItemGeneric('pl_Human', 'mv_CraftingPrefix', 'mv_CraftingCreoID', 'mv_CraftingSuffix', 'mv_CraftingLevel', 1))
	_uState72Trans1:AddAction (CScriptActionSay("crafting01", "P333_DLG_CRAFTING01_093", "(Ihr formt den Stab.)", 192, 16777215))
	_uState72Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState72Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState72, _uState72, "State_72", "State_72", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting01"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState72, _uBeginState, "State_72", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting01"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting01', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING01)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: label
_uState78Trans1 = GdsCreateTransition (_uState72, _uState78, "State_72", "State_78_T1", "Dialog")
	_uState78Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 339, 2) ))
	_uState78Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 340, 2) ))
	_uState78Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 341, 2) ))
	_uState78Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 342, 2) ))
	_uState78Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 343, 1))
	_uState78Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState78Trans1 = nil

-- TO STATE: label
_uState78Trans2 = GdsCreateTransition (_uState72, _uState78, "State_72", "State_78_T2", "Dialog")
	_uState78Trans2:AddCondition (CScriptConditionValue('', 'mv_InternCreoID', 339, 2))
	_uState78Trans2:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 339, 1))
	_uState78Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState78Trans2 = nil

-- TO STATE: label
_uState78Trans3 = GdsCreateTransition (_uState72, _uState78, "State_72", "State_78_T3", "Dialog")
	_uState78Trans3:AddCondition (CScriptConditionValue('', 'mv_InternCreoID', 340, 2))
	_uState78Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 339, 2) ))
	_uState78Trans3:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 340, 1))
	_uState78Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState78Trans3 = nil

-- TO STATE: label
_uState78Trans4 = GdsCreateTransition (_uState72, _uState78, "State_72", "State_78_T4", "Dialog")
	_uState78Trans4:AddCondition (CScriptConditionValue('', 'mv_InternCreoID', 341, 2))
	_uState78Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 339, 2) ))
	_uState78Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 340, 2) ))
	_uState78Trans4:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 341, 1))
	_uState78Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState78Trans4 = nil

-- TO STATE: label
_uState78Trans5 = GdsCreateTransition (_uState72, _uState78, "State_72", "State_78_T5", "Dialog")
	_uState78Trans5:AddCondition (CScriptConditionValue('', 'mv_InternCreoID', 342, 2))
	_uState78Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 339, 2) ))
	_uState78Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 340, 2) ))
	_uState78Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 341, 2) ))
	_uState78Trans5:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 342, 1))
	_uState78Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState78Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState78, _uState78, "State_78", "State_78", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting01", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting01"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState78, _uBeginState, "State_78", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting01"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting01', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING01)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState83Trans1 = GdsCreateTransition (_uState78, _uState83, "State_78", "State_83_T1", "Dialog")
	_uState83Trans1:AddCondition (CScriptConditionValue('', 'mv_InternSuffix', 323, 2))
	_uState83Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 323, 1))
	_uState83Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting01"))
	_uState83Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(CRAFTING01)', 1, 4))
	_uState83Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState83Trans1 = nil

-- TO STATE: endconversation
_uState83Trans2 = GdsCreateTransition (_uState78, _uState83, "State_78", "State_83_T2", "Dialog")
	_uState83Trans2:AddCondition (CScriptConditionValue('', 'mv_InternSuffix', 324, 2))
	_uState83Trans2:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternSuffix', 323, 2) ))
	_uState83Trans2:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 324, 1))
	_uState83Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting01"))
	_uState83Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(CRAFTING01)', 1, 4))
	_uState83Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState83Trans2 = nil

-- TO STATE: endconversation
_uState83Trans3 = GdsCreateTransition (_uState78, _uState83, "State_78", "State_83_T3", "Dialog")
	_uState83Trans3:AddCondition (CScriptConditionValue('', 'mv_InternSuffix', 325, 2))
	_uState83Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternSuffix', 323, 2) ))
	_uState83Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternSuffix', 324, 2) ))
	_uState83Trans3:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 325, 1))
	_uState83Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting01"))
	_uState83Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(CRAFTING01)', 1, 4))
	_uState83Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState83Trans3 = nil

-- TO STATE: endconversation
_uState83Trans4 = GdsCreateTransition (_uState78, _uState83, "State_78", "State_83_T4", "Dialog")
	_uState83Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternSuffix', 323, 2) ))
	_uState83Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternSuffix', 324, 2) ))
	_uState83Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternSuffix', 325, 2) ))
	_uState83Trans4:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 326, 1))
	_uState83Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting01"))
	_uState83Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(CRAFTING01)', 1, 4))
	_uState83Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING01)', 1, 4))
	_uState83Trans4 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState83, _uState83, "State_83", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(CRAFTING01)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting01"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(CRAFTING01)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(CRAFTING01)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState83, _uState83, "State_83", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(CRAFTING01)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting01"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(CRAFTING01)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(CRAFTING01)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState83, _uState83, "State_83", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(CRAFTING01)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting01"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(CRAFTING01)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(CRAFTING01)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState83, _uState83, "State_83", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(CRAFTING01)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting01"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(CRAFTING01)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(CRAFTING01)', 1, 4))
	_uEndActions4 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState83, _uBeginState, "State_83", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(CRAFTING01)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(CRAFTING01)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting01', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING01)', 0, 4))
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
_uState30 = nil
_uState40 = nil
_uState50 = nil
_uState58 = nil
_uState60 = nil
_uState69 = nil
_uState71 = nil
_uState72 = nil
_uState78 = nil
_uState83 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("crafting01_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(CRAFTING01)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/smallshrine_BeginDialog.tak', 'pl_HumanAvatar', 'crafting01'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(CRAFTING01)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())

