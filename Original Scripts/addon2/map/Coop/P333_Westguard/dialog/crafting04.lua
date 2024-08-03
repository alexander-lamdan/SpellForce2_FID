local _uSM = GdsCreateStateMachine ("crafting04_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState4 = GdsCreateState (_uSM, "State_4")
_uState6 = GdsCreateState (_uSM, "State_6")
_uState18 = GdsCreateState (_uSM, "State_18")
_uState30 = GdsCreateState (_uSM, "State_30")
_uState42 = GdsCreateState (_uSM, "State_42")
_uState52 = GdsCreateState (_uSM, "State_52")
_uState54 = GdsCreateState (_uSM, "State_54")
_uState63 = GdsCreateState (_uSM, "State_63")
_uState65 = GdsCreateState (_uSM, "State_65")
_uState66 = GdsCreateState (_uSM, "State_66")
_uState72 = GdsCreateState (_uSM, "State_72")
_uState77 = GdsCreateState (_uSM, "State_77")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(CRAFTING04)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(CRAFTING04)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('crafting04', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "crafting04"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING04)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(CRAFTING04)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('crafting04', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("crafting04")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(CRAFTING04)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting04"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting04', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING04)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState4Trans1 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T1", "Dialog")
	_uState4Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 2))
	_uState4Trans1:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_004PC", "(Weißmagierstab herstellen)", 1, 16777215))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 1, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState4Trans1 = nil

-- TO STATE: choice
_uState4Trans2 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T2", "Dialog")
	_uState4Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 2))
	_uState4Trans2:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_021PC", "(Mentalmagierstab herstellen)", 2, 16777215))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 1, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState4Trans2 = nil

-- TO STATE: choice
_uState4Trans3 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T3", "Dialog")
	_uState4Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 2))
	_uState4Trans3:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_038PC", "(Schwarzmagierstab herstellen)", 3, 16777215))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 1, 4))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState4Trans3 = nil

-- TO STATE: choice
_uState4Trans4 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T4", "Dialog")
	_uState4Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 2))
	_uState4Trans4:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_055PC", "(Elementarmagierstab herstellen)", 4, 16777215))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 1, 4))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState4Trans4 = nil

-- TO STATE: choice
_uState4Trans5 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T5", "Dialog")
	_uState4Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 2))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 0, 4))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CRAFTING04)', 1, 4))
	_uState4Trans5:AddAction (CScriptActionShowChoices())
	_uState4Trans5 = nil

-- TO STATE: choice
_uState4Trans6 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T6", "Dialog")
	_uState4Trans6:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_CreoInspected', 0, 2) ))
	_uState4Trans6:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_003", "(An diesem Creo können Magierstäbe hergestellt werden.)", 102, 16777215))
	_uState4Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState4Trans6 = nil

-- TO STATE: choice
_uState4Trans7 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T7", "Dialog")
	_uState4Trans7:AddCondition (CScriptConditionValue('', 'mf_CreoInspected', 0, 2))
	_uState4Trans7:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_001", "Dies ist ein Creo, eine Art Werkbank, welche die Former zum Herstellen von Ausrüstung verwendet haben.", 100, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_002", "(An diesem Creo können Magierstäbe hergestellt werden.)", 101, 16777215))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'mf_CreoInspected', 1, 4))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState4Trans7 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting04"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState4, _uBeginState, "State_4", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting04"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting04', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING04)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState6Trans1 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T1", "Dialog")
	_uState6Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 2))
	_uState6Trans1:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 339, 1, 1, 1))
	_uState6Trans1:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_006PC", "(Winderz (Stufe 18) )", 1, 16777215))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 1, 4))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState6Trans1 = nil

-- TO STATE: choice
_uState6Trans2 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T2", "Dialog")
	_uState6Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 2))
	_uState6Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1))
	_uState6Trans2:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_007PC", "(Iridiumerz (Stufe 20) )", 2, 16777215))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 1, 4))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState6Trans2 = nil

-- TO STATE: choice
_uState6Trans3 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T3", "Dialog")
	_uState6Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 2))
	_uState6Trans3:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1))
	_uState6Trans3:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_008PC", "(Lythaniumstaub (Stufe 24) )", 3, 16777215))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 1, 4))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState6Trans3 = nil

-- TO STATE: choice
_uState6Trans4 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T4", "Dialog")
	_uState6Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 2))
	_uState6Trans4:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1))
	_uState6Trans4:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_009PC", "(Adamantinumerz (Stufe 26) )", 4, 16777215))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 1, 4))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState6Trans4 = nil

-- TO STATE: choice
_uState6Trans5 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T5", "Dialog")
	_uState6Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 2))
	_uState6Trans5:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1))
	_uState6Trans5:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_010PC", "(Kristallstaub (Stufe 30) )", 5, 16777215))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 1, 4))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState6Trans5 = nil

-- TO STATE: choice
_uState6Trans6 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T6", "Dialog")
	_uState6Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 2))
	_uState6Trans6:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 339, 1, 1, 1) ))
	_uState6Trans6:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_011PC", "(Winderz (Stufe 18) )", 6, 16711680))
	_uState6Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 1, 4))
	_uState6Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState6Trans6 = nil

-- TO STATE: choice
_uState6Trans7 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T7", "Dialog")
	_uState6Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 2))
	_uState6Trans7:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1) ))
	_uState6Trans7:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_013PC", "(Iridiumerz (Stufe 20) )", 7, 16711680))
	_uState6Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 1, 4))
	_uState6Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState6Trans7 = nil

-- TO STATE: choice
_uState6Trans8 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T8", "Dialog")
	_uState6Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 2))
	_uState6Trans8:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1) ))
	_uState6Trans8:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_015PC", "(Lythaniumstaub (Stufe 24) )", 8, 16711680))
	_uState6Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 1, 4))
	_uState6Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState6Trans8 = nil

-- TO STATE: choice
_uState6Trans9 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T9", "Dialog")
	_uState6Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 2))
	_uState6Trans9:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1) ))
	_uState6Trans9:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_017PC", "(Adamantinumerz (Stufe 26) )", 9, 16711680))
	_uState6Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 1, 4))
	_uState6Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState6Trans9 = nil

-- TO STATE: choice
_uState6Trans10 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T10", "Dialog")
	_uState6Trans10:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 2))
	_uState6Trans10:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1) ))
	_uState6Trans10:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_019PC", "(Kristallstaub (Stufe 30) )", 10, 16711680))
	_uState6Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 1, 4))
	_uState6Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState6Trans10 = nil

-- TO STATE: choice
_uState6Trans11 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T11", "Dialog")
	_uState6Trans11:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 2))
	_uState6Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 0, 4))
	_uState6Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CRAFTING04)', 1, 4))
	_uState6Trans11:AddAction (CScriptActionShowChoices())
	_uState6Trans11 = nil

-- TO STATE: choice
_uState6Trans12 = GdsCreateTransition (_uState4, _uState6, "State_4", "State_6_T12", "Dialog")
	_uState6Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 1))
	_uState6Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_004PC", "(Weißmagierstab herstellen)", 99, 16777215))
	_uState6Trans12:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_005", "(Aus welchem Werkstoff soll der Stab hergestellt werden?)", 104, 16777215))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState6Trans12 = nil

-- TO STATE: choice
_uState6Trans13 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T13", "Dialog")
	_uState6Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 6))
	_uState6Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_011PC", "(Winderz (Stufe 18) )", 99, 16711680))
	_uState6Trans13:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_012", "(Ihr besitzt kein Winderz.)", 111, 16777215))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState6Trans13 = nil

-- TO STATE: choice
_uState6Trans14 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T14", "Dialog")
	_uState6Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 7))
	_uState6Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_013PC", "(Iridiumerz (Stufe 20) )", 99, 16711680))
	_uState6Trans14:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_014", "(Ihr besitzt kein Iridiumerz.)", 113, 16777215))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState6Trans14 = nil

-- TO STATE: choice
_uState6Trans15 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T15", "Dialog")
	_uState6Trans15:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 8))
	_uState6Trans15:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_015PC", "(Lythaniumstaub (Stufe 24) )", 99, 16711680))
	_uState6Trans15:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_016", "(Ihr besitzt keinen Lythaniumstaub.)", 115, 16777215))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState6Trans15 = nil

-- TO STATE: choice
_uState6Trans16 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T16", "Dialog")
	_uState6Trans16:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 9))
	_uState6Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_017PC", "(Adamantinumerz (Stufe 26) )", 99, 16711680))
	_uState6Trans16:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_018", "(Ihr besitzt kein Adamantinumerz.)", 117, 16777215))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState6Trans16 = nil

-- TO STATE: choice
_uState6Trans17 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T17", "Dialog")
	_uState6Trans17:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 10))
	_uState6Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_019PC", "(Kristallstaub (Stufe 30) )", 99, 16711680))
	_uState6Trans17:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_020", "(Ihr besitzt keinen Kristallstaub.)", 119, 16777215))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState6Trans17 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting04"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState6, _uBeginState, "State_6", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting04"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting04', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING04)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState18Trans1 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T1", "Dialog")
	_uState18Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 2))
	_uState18Trans1:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 339, 1, 1, 1))
	_uState18Trans1:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_023PC", "(Winderz (Stufe 18) )", 1, 16777215))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 1, 4))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState18Trans1 = nil

-- TO STATE: choice
_uState18Trans2 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T2", "Dialog")
	_uState18Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 2))
	_uState18Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1))
	_uState18Trans2:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_024PC", "(Iridiumerz (Stufe 20) )", 2, 16777215))
	_uState18Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 1, 4))
	_uState18Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState18Trans2 = nil

-- TO STATE: choice
_uState18Trans3 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T3", "Dialog")
	_uState18Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 2))
	_uState18Trans3:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1))
	_uState18Trans3:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_025PC", "(Lythaniumstaub (Stufe 24) )", 3, 16777215))
	_uState18Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 1, 4))
	_uState18Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState18Trans3 = nil

-- TO STATE: choice
_uState18Trans4 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T4", "Dialog")
	_uState18Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 2))
	_uState18Trans4:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1))
	_uState18Trans4:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_026PC", "(Adamantinumerz (Stufe 26) )", 4, 16777215))
	_uState18Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 1, 4))
	_uState18Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState18Trans4 = nil

-- TO STATE: choice
_uState18Trans5 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T5", "Dialog")
	_uState18Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 2))
	_uState18Trans5:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1))
	_uState18Trans5:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_027PC", "(Kristallstaub (Stufe 30) )", 5, 16777215))
	_uState18Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 1, 4))
	_uState18Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState18Trans5 = nil

-- TO STATE: choice
_uState18Trans6 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T6", "Dialog")
	_uState18Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 2))
	_uState18Trans6:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 339, 1, 1, 1) ))
	_uState18Trans6:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_028PC", "(Winderz (Stufe 18) )", 6, 16711680))
	_uState18Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 1, 4))
	_uState18Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState18Trans6 = nil

-- TO STATE: choice
_uState18Trans7 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T7", "Dialog")
	_uState18Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 2))
	_uState18Trans7:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1) ))
	_uState18Trans7:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_030PC", "(Iridiumerz (Stufe 20) )", 7, 16711680))
	_uState18Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 1, 4))
	_uState18Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState18Trans7 = nil

-- TO STATE: choice
_uState18Trans8 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T8", "Dialog")
	_uState18Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 2))
	_uState18Trans8:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1) ))
	_uState18Trans8:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_032PC", "(Lythaniumstaub (Stufe 24) )", 8, 16711680))
	_uState18Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 1, 4))
	_uState18Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState18Trans8 = nil

-- TO STATE: choice
_uState18Trans9 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T9", "Dialog")
	_uState18Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 2))
	_uState18Trans9:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1) ))
	_uState18Trans9:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_034PC", "(Adamantinumerz (Stufe 26) )", 9, 16711680))
	_uState18Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 1, 4))
	_uState18Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState18Trans9 = nil

-- TO STATE: choice
_uState18Trans10 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T10", "Dialog")
	_uState18Trans10:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 2))
	_uState18Trans10:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1) ))
	_uState18Trans10:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_036PC", "(Kristallstaub (Stufe 30) )", 10, 16711680))
	_uState18Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 1, 4))
	_uState18Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState18Trans10 = nil

-- TO STATE: choice
_uState18Trans11 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T11", "Dialog")
	_uState18Trans11:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 2))
	_uState18Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 0, 4))
	_uState18Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CRAFTING04)', 1, 4))
	_uState18Trans11:AddAction (CScriptActionShowChoices())
	_uState18Trans11 = nil

-- TO STATE: choice
_uState18Trans12 = GdsCreateTransition (_uState4, _uState18, "State_4", "State_18_T12", "Dialog")
	_uState18Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 2))
	_uState18Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_021PC", "(Mentalmagierstab herstellen)", 99, 16777215))
	_uState18Trans12:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_022", "(Aus welchem Werkstoff soll der Stab hergestellt werden?)", 121, 16777215))
	_uState18Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState18Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState18Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState18Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState18Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState18Trans12 = nil

-- TO STATE: choice
_uState18Trans13 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T13", "Dialog")
	_uState18Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 6))
	_uState18Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_028PC", "(Winderz (Stufe 18) )", 99, 16711680))
	_uState18Trans13:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_029", "(Ihr besitzt kein Winderz.)", 128, 16777215))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState18Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState18Trans13 = nil

-- TO STATE: choice
_uState18Trans14 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T14", "Dialog")
	_uState18Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 7))
	_uState18Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_030PC", "(Iridiumerz (Stufe 20) )", 99, 16711680))
	_uState18Trans14:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_031", "(Ihr besitzt kein Iridiumerz.)", 130, 16777215))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState18Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState18Trans14 = nil

-- TO STATE: choice
_uState18Trans15 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T15", "Dialog")
	_uState18Trans15:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 8))
	_uState18Trans15:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_032PC", "(Lythaniumstaub (Stufe 24) )", 99, 16711680))
	_uState18Trans15:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_033", "(Ihr besitzt keinen Lythaniumstaub.)", 132, 16777215))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState18Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState18Trans15 = nil

-- TO STATE: choice
_uState18Trans16 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T16", "Dialog")
	_uState18Trans16:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 9))
	_uState18Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_034PC", "(Adamantinumerz (Stufe 26) )", 99, 16711680))
	_uState18Trans16:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_035", "(Ihr besitzt kein Adamantinumerz.)", 134, 16777215))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState18Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState18Trans16 = nil

-- TO STATE: choice
_uState18Trans17 = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18_T17", "Dialog")
	_uState18Trans17:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 10))
	_uState18Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_036PC", "(Kristallstaub (Stufe 30) )", 99, 16711680))
	_uState18Trans17:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_037", "(Ihr besitzt keinen Kristallstaub.)", 136, 16777215))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState18Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState18Trans17 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting04"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState18, _uBeginState, "State_18", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting04"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting04', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING04)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState30Trans1 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T1", "Dialog")
	_uState30Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 2))
	_uState30Trans1:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 339, 1, 1, 1))
	_uState30Trans1:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_040PC", "(Winderz (Stufe 18) )", 1, 16777215))
	_uState30Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 1, 4))
	_uState30Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState30Trans1 = nil

-- TO STATE: choice
_uState30Trans2 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T2", "Dialog")
	_uState30Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 2))
	_uState30Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1))
	_uState30Trans2:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_041PC", "(Iridiumerz (Stufe 20) )", 2, 16777215))
	_uState30Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 1, 4))
	_uState30Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState30Trans2 = nil

-- TO STATE: choice
_uState30Trans3 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T3", "Dialog")
	_uState30Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 2))
	_uState30Trans3:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1))
	_uState30Trans3:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_042PC", "(Lythaniumstaub (Stufe 24) )", 3, 16777215))
	_uState30Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 1, 4))
	_uState30Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState30Trans3 = nil

-- TO STATE: choice
_uState30Trans4 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T4", "Dialog")
	_uState30Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 2))
	_uState30Trans4:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1))
	_uState30Trans4:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_043PC", "(Adamantinumerz (Stufe 26) )", 4, 16777215))
	_uState30Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 1, 4))
	_uState30Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState30Trans4 = nil

-- TO STATE: choice
_uState30Trans5 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T5", "Dialog")
	_uState30Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 2))
	_uState30Trans5:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1))
	_uState30Trans5:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_044PC", "(Kristallstaub (Stufe 30) )", 5, 16777215))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 1, 4))
	_uState30Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState30Trans5 = nil

-- TO STATE: choice
_uState30Trans6 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T6", "Dialog")
	_uState30Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 2))
	_uState30Trans6:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 339, 1, 1, 1) ))
	_uState30Trans6:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_045PC", "(Winderz (Stufe 18) )", 6, 16711680))
	_uState30Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 1, 4))
	_uState30Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState30Trans6 = nil

-- TO STATE: choice
_uState30Trans7 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T7", "Dialog")
	_uState30Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 2))
	_uState30Trans7:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1) ))
	_uState30Trans7:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_047PC", "(Iridiumerz (Stufe 20) )", 7, 16711680))
	_uState30Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 1, 4))
	_uState30Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState30Trans7 = nil

-- TO STATE: choice
_uState30Trans8 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T8", "Dialog")
	_uState30Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 2))
	_uState30Trans8:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1) ))
	_uState30Trans8:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_049PC", "(Lythaniumstaub (Stufe 24) )", 8, 16711680))
	_uState30Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 1, 4))
	_uState30Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState30Trans8 = nil

-- TO STATE: choice
_uState30Trans9 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T9", "Dialog")
	_uState30Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 2))
	_uState30Trans9:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1) ))
	_uState30Trans9:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_051PC", "(Adamantinumerz (Stufe 26) )", 9, 16711680))
	_uState30Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 1, 4))
	_uState30Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState30Trans9 = nil

-- TO STATE: choice
_uState30Trans10 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T10", "Dialog")
	_uState30Trans10:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 2))
	_uState30Trans10:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1) ))
	_uState30Trans10:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_053PC", "(Kristallstaub (Stufe 30) )", 10, 16711680))
	_uState30Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 1, 4))
	_uState30Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState30Trans10 = nil

-- TO STATE: choice
_uState30Trans11 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T11", "Dialog")
	_uState30Trans11:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 2))
	_uState30Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 0, 4))
	_uState30Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CRAFTING04)', 1, 4))
	_uState30Trans11:AddAction (CScriptActionShowChoices())
	_uState30Trans11 = nil

-- TO STATE: choice
_uState30Trans12 = GdsCreateTransition (_uState4, _uState30, "State_4", "State_30_T12", "Dialog")
	_uState30Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 3))
	_uState30Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_038PC", "(Schwarzmagierstab herstellen)", 99, 16777215))
	_uState30Trans12:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_039", "(Aus welchem Werkstoff soll der Stab hergestellt werden?)", 138, 16777215))
	_uState30Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState30Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState30Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState30Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState30Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState30Trans12 = nil

-- TO STATE: choice
_uState30Trans13 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T13", "Dialog")
	_uState30Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 6))
	_uState30Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_045PC", "(Winderz (Stufe 18) )", 99, 16711680))
	_uState30Trans13:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_046", "(Ihr besitzt kein Winderz.)", 145, 16777215))
	_uState30Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState30Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState30Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState30Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState30Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState30Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState30Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState30Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState30Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState30Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState30Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState30Trans13 = nil

-- TO STATE: choice
_uState30Trans14 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T14", "Dialog")
	_uState30Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 7))
	_uState30Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_047PC", "(Iridiumerz (Stufe 20) )", 99, 16711680))
	_uState30Trans14:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_048", "(Ihr besitzt kein Iridiumerz.)", 147, 16777215))
	_uState30Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState30Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState30Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState30Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState30Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState30Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState30Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState30Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState30Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState30Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState30Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState30Trans14 = nil

-- TO STATE: choice
_uState30Trans15 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T15", "Dialog")
	_uState30Trans15:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 8))
	_uState30Trans15:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_049PC", "(Lythaniumstaub (Stufe 24) )", 99, 16711680))
	_uState30Trans15:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_050", "(Ihr besitzt keinen Lythaniumstaub.)", 149, 16777215))
	_uState30Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState30Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState30Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState30Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState30Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState30Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState30Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState30Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState30Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState30Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState30Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState30Trans15 = nil

-- TO STATE: choice
_uState30Trans16 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T16", "Dialog")
	_uState30Trans16:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 9))
	_uState30Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_051PC", "(Adamantinumerz (Stufe 26) )", 99, 16711680))
	_uState30Trans16:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_052", "(Ihr besitzt kein Adamantinumerz.)", 151, 16777215))
	_uState30Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState30Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState30Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState30Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState30Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState30Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState30Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState30Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState30Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState30Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState30Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState30Trans16 = nil

-- TO STATE: choice
_uState30Trans17 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T17", "Dialog")
	_uState30Trans17:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 10))
	_uState30Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_053PC", "(Kristallstaub (Stufe 30) )", 99, 16711680))
	_uState30Trans17:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_054", "(Ihr besitzt keinen Kristallstaub.)", 153, 16777215))
	_uState30Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState30Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState30Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState30Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState30Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState30Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState30Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState30Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState30Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState30Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState30Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState30Trans17 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting04"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState30, _uBeginState, "State_30", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting04"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting04', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING04)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState42Trans1 = GdsCreateTransition (_uState42, _uState42, "State_42", "State_42_T1", "Dialog")
	_uState42Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 2))
	_uState42Trans1:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 339, 1, 1, 1))
	_uState42Trans1:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_057PC", "(Winderz (Stufe 18) )", 1, 16777215))
	_uState42Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 1, 4))
	_uState42Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState42Trans1 = nil

-- TO STATE: choice
_uState42Trans2 = GdsCreateTransition (_uState42, _uState42, "State_42", "State_42_T2", "Dialog")
	_uState42Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 2))
	_uState42Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1))
	_uState42Trans2:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_058PC", "(Iridiumerz (Stufe 20) )", 2, 16777215))
	_uState42Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 1, 4))
	_uState42Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState42Trans2 = nil

-- TO STATE: choice
_uState42Trans3 = GdsCreateTransition (_uState42, _uState42, "State_42", "State_42_T3", "Dialog")
	_uState42Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 2))
	_uState42Trans3:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1))
	_uState42Trans3:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_059PC", "(Lythaniumstaub (Stufe 24) )", 3, 16777215))
	_uState42Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 1, 4))
	_uState42Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState42Trans3 = nil

-- TO STATE: choice
_uState42Trans4 = GdsCreateTransition (_uState42, _uState42, "State_42", "State_42_T4", "Dialog")
	_uState42Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 2))
	_uState42Trans4:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1))
	_uState42Trans4:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_060PC", "(Adamantinumerz (Stufe 26) )", 4, 16777215))
	_uState42Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 1, 4))
	_uState42Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState42Trans4 = nil

-- TO STATE: choice
_uState42Trans5 = GdsCreateTransition (_uState42, _uState42, "State_42", "State_42_T5", "Dialog")
	_uState42Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 2))
	_uState42Trans5:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 339, 1, 1, 1) ))
	_uState42Trans5:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_061PC", "(Winderz (Stufe 18) )", 5, 16711680))
	_uState42Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 1, 4))
	_uState42Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState42Trans5 = nil

-- TO STATE: choice
_uState42Trans6 = GdsCreateTransition (_uState42, _uState42, "State_42", "State_42_T6", "Dialog")
	_uState42Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 2))
	_uState42Trans6:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 340, 1, 1, 1) ))
	_uState42Trans6:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_063PC", "(Iridiumerz (Stufe 20) )", 6, 16711680))
	_uState42Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 1, 4))
	_uState42Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState42Trans6 = nil

-- TO STATE: choice
_uState42Trans7 = GdsCreateTransition (_uState42, _uState42, "State_42", "State_42_T7", "Dialog")
	_uState42Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 2))
	_uState42Trans7:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 341, 1, 1, 1) ))
	_uState42Trans7:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_065PC", "(Lythaniumstaub (Stufe 24) )", 7, 16711680))
	_uState42Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 1, 4))
	_uState42Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState42Trans7 = nil

-- TO STATE: choice
_uState42Trans8 = GdsCreateTransition (_uState42, _uState42, "State_42", "State_42_T8", "Dialog")
	_uState42Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 2))
	_uState42Trans8:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 342, 1, 1, 1) ))
	_uState42Trans8:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_067PC", "(Adamantinumerz (Stufe 26) )", 8, 16711680))
	_uState42Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 1, 4))
	_uState42Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState42Trans8 = nil

-- TO STATE: choice
_uState42Trans9 = GdsCreateTransition (_uState42, _uState42, "State_42", "State_42_T9", "Dialog")
	_uState42Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 2))
	_uState42Trans9:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1) ))
	_uState42Trans9:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_069PC", "(Kristallstaub (Stufe 30) )", 9, 16711680))
	_uState42Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 1, 4))
	_uState42Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState42Trans9 = nil

-- TO STATE: choice
_uState42Trans10 = GdsCreateTransition (_uState42, _uState42, "State_42", "State_42_T10", "Dialog")
	_uState42Trans10:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 2))
	_uState42Trans10:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 343, 1, 1, 1))
	_uState42Trans10:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_071PC", "(Kristallstaub (Stufe 30) )", 10, 16777215))
	_uState42Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 1, 4))
	_uState42Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState42Trans10 = nil

-- TO STATE: choice
_uState42Trans11 = GdsCreateTransition (_uState42, _uState42, "State_42", "State_42_T11", "Dialog")
	_uState42Trans11:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 2))
	_uState42Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 0, 4))
	_uState42Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CRAFTING04)', 1, 4))
	_uState42Trans11:AddAction (CScriptActionShowChoices())
	_uState42Trans11 = nil

-- TO STATE: choice
_uState42Trans12 = GdsCreateTransition (_uState4, _uState42, "State_4", "State_42_T12", "Dialog")
	_uState42Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 4))
	_uState42Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_055PC", "(Elementarmagierstab herstellen)", 99, 16777215))
	_uState42Trans12:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_056", "(Aus welchem Werkstoff soll der Stab hergestellt werden?)", 155, 16777215))
	_uState42Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState42Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState42Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState42Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState42Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState42Trans12 = nil

-- TO STATE: choice
_uState42Trans13 = GdsCreateTransition (_uState42, _uState42, "State_42", "State_42_T13", "Dialog")
	_uState42Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 5))
	_uState42Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_061PC", "(Winderz (Stufe 18) )", 99, 16711680))
	_uState42Trans13:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_062", "(Ihr besitzt kein Winderz.)", 161, 16777215))
	_uState42Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState42Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState42Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState42Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState42Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState42Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState42Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState42Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState42Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState42Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState42Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState42Trans13 = nil

-- TO STATE: choice
_uState42Trans14 = GdsCreateTransition (_uState42, _uState42, "State_42", "State_42_T14", "Dialog")
	_uState42Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 6))
	_uState42Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_063PC", "(Iridiumerz (Stufe 20) )", 99, 16711680))
	_uState42Trans14:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_064", "(Ihr besitzt kein Iridiumerz.)", 163, 16777215))
	_uState42Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState42Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState42Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState42Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState42Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState42Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState42Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState42Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState42Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState42Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState42Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState42Trans14 = nil

-- TO STATE: choice
_uState42Trans15 = GdsCreateTransition (_uState42, _uState42, "State_42", "State_42_T15", "Dialog")
	_uState42Trans15:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 7))
	_uState42Trans15:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_065PC", "(Lythaniumstaub (Stufe 24) )", 99, 16711680))
	_uState42Trans15:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_066", "(Ihr besitzt keinen Lythaniumstaub.)", 165, 16777215))
	_uState42Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState42Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState42Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState42Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState42Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState42Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState42Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState42Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState42Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState42Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState42Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState42Trans15 = nil

-- TO STATE: choice
_uState42Trans16 = GdsCreateTransition (_uState42, _uState42, "State_42", "State_42_T16", "Dialog")
	_uState42Trans16:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 8))
	_uState42Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_067PC", "(Adamantinumerz (Stufe 26) )", 99, 16711680))
	_uState42Trans16:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_068", "(Ihr besitzt kein Adamantinumerz.)", 167, 16777215))
	_uState42Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState42Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState42Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState42Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState42Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState42Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState42Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState42Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState42Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState42Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState42Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState42Trans16 = nil

-- TO STATE: choice
_uState42Trans17 = GdsCreateTransition (_uState42, _uState42, "State_42", "State_42_T17", "Dialog")
	_uState42Trans17:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 9))
	_uState42Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_069PC", "(Kristallstaub (Stufe 30) )", 99, 16711680))
	_uState42Trans17:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_070", "(Ihr besitzt keinen Kristallstaub.)", 169, 16777215))
	_uState42Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState42Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState42Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState42Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState42Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState42Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState42Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState42Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState42Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState42Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState42Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState42Trans17 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState42, _uState42, "State_42", "State_42", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting04"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState42, _uBeginState, "State_42", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting04"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting04', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING04)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState52Trans1 = GdsCreateTransition (_uState42, _uState52, "State_42", "State_52_T1", "Dialog")
	_uState52Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 10))
	_uState52Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_071PC", "(Kristallstaub (Stufe 30) )", 99, 16777215))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 343, 4))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 391, 4))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 30, 4))
	_uState52Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState52Trans1 = nil

-- TO STATE: showchoice
_uState52Trans2 = GdsCreateTransition (_uState6, _uState52, "State_6", "State_52_T2", "Dialog")
	_uState52Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 1))
	_uState52Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_006PC", "(Winderz (Stufe 18) )", 99, 16777215))
	_uState52Trans2:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 339, 4))
	_uState52Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState52Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState52Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState52Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState52Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState52Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState52Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState52Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState52Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState52Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState52Trans2:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 372, 4))
	_uState52Trans2:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 18, 4))
	_uState52Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState52Trans2 = nil

-- TO STATE: showchoice
_uState52Trans3 = GdsCreateTransition (_uState6, _uState52, "State_6", "State_52_T3", "Dialog")
	_uState52Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 2))
	_uState52Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_007PC", "(Iridiumerz (Stufe 20) )", 99, 16777215))
	_uState52Trans3:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 340, 4))
	_uState52Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState52Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState52Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState52Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState52Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState52Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState52Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState52Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState52Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState52Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState52Trans3:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 373, 4))
	_uState52Trans3:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 20, 4))
	_uState52Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState52Trans3 = nil

-- TO STATE: showchoice
_uState52Trans4 = GdsCreateTransition (_uState6, _uState52, "State_6", "State_52_T4", "Dialog")
	_uState52Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 3))
	_uState52Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_008PC", "(Lythaniumstaub (Stufe 24) )", 99, 16777215))
	_uState52Trans4:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 341, 4))
	_uState52Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState52Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState52Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState52Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState52Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState52Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState52Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState52Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState52Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState52Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState52Trans4:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 374, 4))
	_uState52Trans4:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 24, 4))
	_uState52Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState52Trans4 = nil

-- TO STATE: showchoice
_uState52Trans5 = GdsCreateTransition (_uState6, _uState52, "State_6", "State_52_T5", "Dialog")
	_uState52Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 4))
	_uState52Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_009PC", "(Adamantinumerz (Stufe 26) )", 99, 16777215))
	_uState52Trans5:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 342, 4))
	_uState52Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState52Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState52Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState52Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState52Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState52Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState52Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState52Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState52Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState52Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState52Trans5:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 375, 4))
	_uState52Trans5:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 26, 4))
	_uState52Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState52Trans5 = nil

-- TO STATE: showchoice
_uState52Trans6 = GdsCreateTransition (_uState6, _uState52, "State_6", "State_52_T6", "Dialog")
	_uState52Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 5))
	_uState52Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_010PC", "(Kristallstaub (Stufe 30) )", 99, 16777215))
	_uState52Trans6:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 343, 4))
	_uState52Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState52Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState52Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState52Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState52Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState52Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState52Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState52Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState52Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState52Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState52Trans6:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 376, 4))
	_uState52Trans6:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 30, 4))
	_uState52Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState52Trans6 = nil

-- TO STATE: showchoice
_uState52Trans7 = GdsCreateTransition (_uState18, _uState52, "State_18", "State_52_T7", "Dialog")
	_uState52Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 1))
	_uState52Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_023PC", "(Winderz (Stufe 18) )", 99, 16777215))
	_uState52Trans7:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 339, 4))
	_uState52Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState52Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState52Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState52Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState52Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState52Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState52Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState52Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState52Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState52Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState52Trans7:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 382, 4))
	_uState52Trans7:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 18, 4))
	_uState52Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState52Trans7 = nil

-- TO STATE: showchoice
_uState52Trans8 = GdsCreateTransition (_uState18, _uState52, "State_18", "State_52_T8", "Dialog")
	_uState52Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 2))
	_uState52Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_024PC", "(Iridiumerz (Stufe 20) )", 99, 16777215))
	_uState52Trans8:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 340, 4))
	_uState52Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState52Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState52Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState52Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState52Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState52Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState52Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState52Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState52Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState52Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState52Trans8:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 383, 4))
	_uState52Trans8:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 20, 4))
	_uState52Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState52Trans8 = nil

-- TO STATE: showchoice
_uState52Trans9 = GdsCreateTransition (_uState18, _uState52, "State_18", "State_52_T9", "Dialog")
	_uState52Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 3))
	_uState52Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_025PC", "(Lythaniumstaub (Stufe 24) )", 99, 16777215))
	_uState52Trans9:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 341, 4))
	_uState52Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState52Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState52Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState52Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState52Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState52Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState52Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState52Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState52Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState52Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState52Trans9:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 384, 4))
	_uState52Trans9:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 24, 4))
	_uState52Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState52Trans9 = nil

-- TO STATE: showchoice
_uState52Trans10 = GdsCreateTransition (_uState18, _uState52, "State_18", "State_52_T10", "Dialog")
	_uState52Trans10:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 4))
	_uState52Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_026PC", "(Adamantinumerz (Stufe 26) )", 99, 16777215))
	_uState52Trans10:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 342, 4))
	_uState52Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState52Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState52Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState52Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState52Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState52Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState52Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState52Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState52Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState52Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState52Trans10:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 385, 4))
	_uState52Trans10:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 26, 4))
	_uState52Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState52Trans10 = nil

-- TO STATE: showchoice
_uState52Trans11 = GdsCreateTransition (_uState18, _uState52, "State_18", "State_52_T11", "Dialog")
	_uState52Trans11:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 5))
	_uState52Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_027PC", "(Kristallstaub (Stufe 30) )", 99, 16777215))
	_uState52Trans11:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 343, 4))
	_uState52Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState52Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState52Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState52Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState52Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState52Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState52Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState52Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState52Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState52Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState52Trans11:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 386, 4))
	_uState52Trans11:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 30, 4))
	_uState52Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState52Trans11 = nil

-- TO STATE: showchoice
_uState52Trans12 = GdsCreateTransition (_uState30, _uState52, "State_30", "State_52_T12", "Dialog")
	_uState52Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 1))
	_uState52Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_040PC", "(Winderz (Stufe 18) )", 99, 16777215))
	_uState52Trans12:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 339, 4))
	_uState52Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState52Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState52Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState52Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState52Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState52Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState52Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState52Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState52Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState52Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState52Trans12:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 377, 4))
	_uState52Trans12:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 18, 4))
	_uState52Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState52Trans12 = nil

-- TO STATE: showchoice
_uState52Trans13 = GdsCreateTransition (_uState30, _uState52, "State_30", "State_52_T13", "Dialog")
	_uState52Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 2))
	_uState52Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_041PC", "(Iridiumerz (Stufe 20) )", 99, 16777215))
	_uState52Trans13:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 340, 4))
	_uState52Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState52Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState52Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState52Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState52Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState52Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState52Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState52Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState52Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState52Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState52Trans13:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 378, 4))
	_uState52Trans13:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 20, 4))
	_uState52Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState52Trans13 = nil

-- TO STATE: showchoice
_uState52Trans14 = GdsCreateTransition (_uState30, _uState52, "State_30", "State_52_T14", "Dialog")
	_uState52Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 3))
	_uState52Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_042PC", "(Lythaniumstaub (Stufe 24) )", 99, 16777215))
	_uState52Trans14:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 341, 4))
	_uState52Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState52Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState52Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState52Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState52Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState52Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState52Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState52Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState52Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState52Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState52Trans14:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 379, 4))
	_uState52Trans14:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 24, 4))
	_uState52Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState52Trans14 = nil

-- TO STATE: showchoice
_uState52Trans15 = GdsCreateTransition (_uState30, _uState52, "State_30", "State_52_T15", "Dialog")
	_uState52Trans15:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 4))
	_uState52Trans15:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_043PC", "(Adamantinumerz (Stufe 26) )", 99, 16777215))
	_uState52Trans15:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 342, 4))
	_uState52Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState52Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState52Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState52Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState52Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState52Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState52Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState52Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState52Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState52Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState52Trans15:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 380, 4))
	_uState52Trans15:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 26, 4))
	_uState52Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState52Trans15 = nil

-- TO STATE: showchoice
_uState52Trans16 = GdsCreateTransition (_uState30, _uState52, "State_30", "State_52_T16", "Dialog")
	_uState52Trans16:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 5))
	_uState52Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_044PC", "(Kristallstaub (Stufe 30) )", 99, 16777215))
	_uState52Trans16:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 343, 4))
	_uState52Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState52Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState52Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState52Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState52Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState52Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState52Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState52Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState52Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState52Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState52Trans16:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 381, 4))
	_uState52Trans16:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 30, 4))
	_uState52Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState52Trans16 = nil

-- TO STATE: showchoice
_uState52Trans17 = GdsCreateTransition (_uState42, _uState52, "State_42", "State_52_T17", "Dialog")
	_uState52Trans17:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 1))
	_uState52Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_057PC", "(Winderz (Stufe 18) )", 99, 16777215))
	_uState52Trans17:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 339, 4))
	_uState52Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState52Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState52Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState52Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState52Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState52Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState52Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState52Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState52Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState52Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState52Trans17:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 387, 4))
	_uState52Trans17:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 18, 4))
	_uState52Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState52Trans17 = nil

-- TO STATE: showchoice
_uState52Trans18 = GdsCreateTransition (_uState42, _uState52, "State_42", "State_52_T18", "Dialog")
	_uState52Trans18:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 2))
	_uState52Trans18:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_058PC", "(Iridiumerz (Stufe 20) )", 99, 16777215))
	_uState52Trans18:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 340, 4))
	_uState52Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState52Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState52Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState52Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState52Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState52Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState52Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState52Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState52Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState52Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState52Trans18:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 388, 4))
	_uState52Trans18:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 20, 4))
	_uState52Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState52Trans18 = nil

-- TO STATE: showchoice
_uState52Trans19 = GdsCreateTransition (_uState42, _uState52, "State_42", "State_52_T19", "Dialog")
	_uState52Trans19:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 3))
	_uState52Trans19:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_059PC", "(Lythaniumstaub (Stufe 24) )", 99, 16777215))
	_uState52Trans19:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 341, 4))
	_uState52Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState52Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState52Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState52Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState52Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState52Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState52Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState52Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState52Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState52Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState52Trans19:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 389, 4))
	_uState52Trans19:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 24, 4))
	_uState52Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState52Trans19 = nil

-- TO STATE: showchoice
_uState52Trans20 = GdsCreateTransition (_uState42, _uState52, "State_42", "State_52_T20", "Dialog")
	_uState52Trans20:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 4))
	_uState52Trans20:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_060PC", "(Adamantinumerz (Stufe 26) )", 99, 16777215))
	_uState52Trans20:AddAction (CScriptActionValueModify('', 'mv_InternCreoID', 342, 4))
	_uState52Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState52Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState52Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState52Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState52Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState52Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState52Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState52Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState52Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(CRAFTING04)', 0, 4))
	_uState52Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(CRAFTING04)', 0, 4))
	_uState52Trans20:AddAction (CScriptActionValueModify('', 'mv_CraftingCreoID', 390, 4))
	_uState52Trans20:AddAction (CScriptActionValueModify('', 'mv_CraftingLevel', 26, 4))
	_uState52Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState52Trans20 = nil

-- TO STATE: showchoice
_uState52Trans21 = GdsCreateTransition (_uState54, _uState52, "State_54", "State_52_T21", "Dialog")
	_uState52Trans21:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 1))
	_uState52Trans21:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_073PC", "(Winterstille (weiß) )", 99, 16711680))
	_uState52Trans21:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_074", "(Euch fehlt ein solcher Edelstein.)", 173, 16777215))
	_uState52Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState52Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState52Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState52Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState52Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState52Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState52Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState52Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState52Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState52Trans21 = nil

-- TO STATE: showchoice
_uState52Trans22 = GdsCreateTransition (_uState54, _uState52, "State_54", "State_52_T22", "Dialog")
	_uState52Trans22:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 2))
	_uState52Trans22:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_075PC", "(Nachtglanz (schwarz) )", 99, 16711680))
	_uState52Trans22:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_076", "(Euch fehlt ein solcher Edelstein.)", 175, 16777215))
	_uState52Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState52Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState52Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState52Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState52Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState52Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState52Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState52Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState52Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState52Trans22 = nil

-- TO STATE: showchoice
_uState52Trans23 = GdsCreateTransition (_uState54, _uState52, "State_54", "State_52_T23", "Dialog")
	_uState52Trans23:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 3))
	_uState52Trans23:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_077PC", "(Sommerhauch (rot) )", 99, 16711680))
	_uState52Trans23:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_078", "(Euch fehlt ein solcher Edelstein.)", 177, 16777215))
	_uState52Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState52Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState52Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState52Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState52Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState52Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState52Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState52Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState52Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState52Trans23 = nil

-- TO STATE: showchoice
_uState52Trans24 = GdsCreateTransition (_uState54, _uState52, "State_54", "State_52_T24", "Dialog")
	_uState52Trans24:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 4))
	_uState52Trans24:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_079PC", "(Frühlingslicht (grün) )", 99, 16711680))
	_uState52Trans24:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_080", "(Euch fehlt ein solcher Edelstein.)", 179, 16777215))
	_uState52Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState52Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState52Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState52Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState52Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState52Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState52Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState52Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState52Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState52Trans24 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState52, _uState52, "State_52", "State_52", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting04"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState52, _uBeginState, "State_52", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting04"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting04', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING04)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState54Trans1 = GdsCreateTransition (_uState54, _uState54, "State_54", "State_54_T1", "Dialog")
	_uState54Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 2))
	_uState54Trans1:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 323, 1, 1, 1) ))
	_uState54Trans1:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_073PC", "(Winterstille (weiß) )", 1, 16711680))
	_uState54Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 1, 4))
	_uState54Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState54Trans1 = nil

-- TO STATE: choice
_uState54Trans2 = GdsCreateTransition (_uState54, _uState54, "State_54", "State_54_T2", "Dialog")
	_uState54Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 2))
	_uState54Trans2:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 324, 1, 1, 1) ))
	_uState54Trans2:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_075PC", "(Nachtglanz (schwarz) )", 2, 16711680))
	_uState54Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 1, 4))
	_uState54Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState54Trans2 = nil

-- TO STATE: choice
_uState54Trans3 = GdsCreateTransition (_uState54, _uState54, "State_54", "State_54_T3", "Dialog")
	_uState54Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 2))
	_uState54Trans3:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 325, 1, 1, 1) ))
	_uState54Trans3:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_077PC", "(Sommerhauch (rot) )", 3, 16711680))
	_uState54Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 1, 4))
	_uState54Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState54Trans3 = nil

-- TO STATE: choice
_uState54Trans4 = GdsCreateTransition (_uState54, _uState54, "State_54", "State_54_T4", "Dialog")
	_uState54Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 2))
	_uState54Trans4:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasItem('pl_Human', 3, 326, 1, 1, 1) ))
	_uState54Trans4:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_079PC", "(Frühlingslicht (grün) )", 4, 16711680))
	_uState54Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 1, 4))
	_uState54Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState54Trans4 = nil

-- TO STATE: choice
_uState54Trans5 = GdsCreateTransition (_uState54, _uState54, "State_54", "State_54_T5", "Dialog")
	_uState54Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 2))
	_uState54Trans5:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 323, 1, 1, 1))
	_uState54Trans5:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_081PC", "(Winterstille (weiß) )", 5, 16777215))
	_uState54Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 1, 4))
	_uState54Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState54Trans5 = nil

-- TO STATE: choice
_uState54Trans6 = GdsCreateTransition (_uState54, _uState54, "State_54", "State_54_T6", "Dialog")
	_uState54Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 2))
	_uState54Trans6:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 324, 1, 1, 1))
	_uState54Trans6:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_082PC", "(Nachtglanz (schwarz) )", 6, 16777215))
	_uState54Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 1, 4))
	_uState54Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState54Trans6 = nil

-- TO STATE: choice
_uState54Trans7 = GdsCreateTransition (_uState54, _uState54, "State_54", "State_54_T7", "Dialog")
	_uState54Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 2))
	_uState54Trans7:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 325, 1, 1, 1))
	_uState54Trans7:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_083PC", "(Sommerhauch (rot) )", 7, 16777215))
	_uState54Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 1, 4))
	_uState54Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState54Trans7 = nil

-- TO STATE: choice
_uState54Trans8 = GdsCreateTransition (_uState54, _uState54, "State_54", "State_54_T8", "Dialog")
	_uState54Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 2))
	_uState54Trans8:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 326, 1, 1, 1))
	_uState54Trans8:AddAction (CScriptActionChoice("P333_DLG_CRAFTING04_084PC", "(Frühlingslicht (grün) )", 8, 16777215))
	_uState54Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 1, 4))
	_uState54Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState54Trans8 = nil

-- TO STATE: choice
_uState54Trans9 = GdsCreateTransition (_uState54, _uState54, "State_54", "State_54_T9", "Dialog")
	_uState54Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 2))
	_uState54Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 0, 4))
	_uState54Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(CRAFTING04)', 1, 4))
	_uState54Trans9:AddAction (CScriptActionShowChoices())
	_uState54Trans9 = nil

-- TO STATE: choice
_uState54Trans10 = GdsCreateTransition (_uState52, _uState54, "State_52", "State_54_T10", "Dialog")
	_uState54Trans10:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_072", "(Welcher Edelstein soll beim Herstellen verwendet werden?)", 171, 16777215))
	_uState54Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState54Trans10 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState54, _uState54, "State_54", "State_54", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting04"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState54, _uBeginState, "State_54", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting04"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting04', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING04)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: label
_uState63Trans1 = GdsCreateTransition (_uState54, _uState63, "State_54", "State_63_T1", "Dialog")
	_uState63Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 8))
	_uState63Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_084PC", "(Frühlingslicht (grün) )", 99, 16777215))
	_uState63Trans1:AddAction (CScriptActionValueModify('', 'mv_InternSuffix', 326, 4))
	_uState63Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState63Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState63Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState63Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState63Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState63Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState63Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState63Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState63Trans1:AddAction (CScriptActionValueModify('', 'mv_CraftingSuffix', 341, 4))
	_uState63Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState63Trans1 = nil

-- TO STATE: label
_uState63Trans2 = GdsCreateTransition (_uState54, _uState63, "State_54", "State_63_T2", "Dialog")
	_uState63Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 5))
	_uState63Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_081PC", "(Winterstille (weiß) )", 99, 16777215))
	_uState63Trans2:AddAction (CScriptActionValueModify('', 'mv_InternSuffix', 323, 4))
	_uState63Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState63Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState63Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState63Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState63Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState63Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState63Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState63Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState63Trans2:AddAction (CScriptActionValueModify('', 'mv_CraftingSuffix', 338, 4))
	_uState63Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState63Trans2 = nil

-- TO STATE: label
_uState63Trans3 = GdsCreateTransition (_uState54, _uState63, "State_54", "State_63_T3", "Dialog")
	_uState63Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 6))
	_uState63Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_082PC", "(Nachtglanz (schwarz) )", 99, 16777215))
	_uState63Trans3:AddAction (CScriptActionValueModify('', 'mv_InternSuffix', 324, 4))
	_uState63Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState63Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState63Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState63Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState63Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState63Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState63Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState63Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState63Trans3:AddAction (CScriptActionValueModify('', 'mv_CraftingSuffix', 339, 4))
	_uState63Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState63Trans3 = nil

-- TO STATE: label
_uState63Trans4 = GdsCreateTransition (_uState54, _uState63, "State_54", "State_63_T4", "Dialog")
	_uState63Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 7))
	_uState63Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_CRAFTING04_083PC", "(Sommerhauch (rot) )", 99, 16777215))
	_uState63Trans4:AddAction (CScriptActionValueModify('', 'mv_InternSuffix', 325, 4))
	_uState63Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(CRAFTING04)', 0, 4))
	_uState63Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(CRAFTING04)', 0, 4))
	_uState63Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(CRAFTING04)', 0, 4))
	_uState63Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(CRAFTING04)', 0, 4))
	_uState63Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(CRAFTING04)', 0, 4))
	_uState63Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(CRAFTING04)', 0, 4))
	_uState63Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(CRAFTING04)', 0, 4))
	_uState63Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(CRAFTING04)', 0, 4))
	_uState63Trans4:AddAction (CScriptActionValueModify('', 'mv_CraftingSuffix', 340, 4))
	_uState63Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState63Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState63, _uState63, "State_63", "State_63", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting04"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState63, _uBeginState, "State_63", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting04"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting04', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING04)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: else
_uState65Trans1 = GdsCreateTransition (_uState63, _uState65, "State_63", "State_65_T1", "Dialog")
	_uState65Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_EnhancedCrafting04', 1, 2) ))
	_uState65Trans1:AddAction (CScriptActionValueModify('', 'mv_CraftingPrefix', 86, 4))
	_uState65Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState65Trans1 = nil

-- TO STATE: else
_uState65Trans2 = GdsCreateTransition (_uState63, _uState65, "State_63", "State_65_T2", "Dialog")
	_uState65Trans2:AddCondition (CScriptConditionValue('', 'mf_EnhancedCrafting04', 1, 2))
	_uState65Trans2:AddAction (CScriptActionValueModify('', 'mv_CraftingPrefix', 87, 4))
	_uState65Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState65Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState65, _uState65, "State_65", "State_65", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting04"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState65, _uBeginState, "State_65", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting04"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting04', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING04)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: label
_uState66Trans1 = GdsCreateTransition (_uState65, _uState66, "State_65", "State_66_T1", "Dialog")
	_uState66Trans1:AddAction (CScriptActionPlayerGiveVariableItemGeneric('pl_Human', 'mv_CraftingPrefix', 'mv_CraftingCreoID', 'mv_CraftingSuffix', 'mv_CraftingLevel', 1))
	_uState66Trans1:AddAction (CScriptActionSay("crafting04", "P333_DLG_CRAFTING04_085", "(Ihr formt den Stab.)", 184, 16777215))
	_uState66Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState66Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState66, _uState66, "State_66", "State_66", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting04"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState66, _uBeginState, "State_66", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting04"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting04', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING04)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: label
_uState72Trans1 = GdsCreateTransition (_uState66, _uState72, "State_66", "State_72_T1", "Dialog")
	_uState72Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 339, 2) ))
	_uState72Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 340, 2) ))
	_uState72Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 341, 2) ))
	_uState72Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 342, 2) ))
	_uState72Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 343, 1))
	_uState72Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState72Trans1 = nil

-- TO STATE: label
_uState72Trans2 = GdsCreateTransition (_uState66, _uState72, "State_66", "State_72_T2", "Dialog")
	_uState72Trans2:AddCondition (CScriptConditionValue('', 'mv_InternCreoID', 339, 2))
	_uState72Trans2:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 339, 1))
	_uState72Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState72Trans2 = nil

-- TO STATE: label
_uState72Trans3 = GdsCreateTransition (_uState66, _uState72, "State_66", "State_72_T3", "Dialog")
	_uState72Trans3:AddCondition (CScriptConditionValue('', 'mv_InternCreoID', 340, 2))
	_uState72Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 339, 2) ))
	_uState72Trans3:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 340, 1))
	_uState72Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState72Trans3 = nil

-- TO STATE: label
_uState72Trans4 = GdsCreateTransition (_uState66, _uState72, "State_66", "State_72_T4", "Dialog")
	_uState72Trans4:AddCondition (CScriptConditionValue('', 'mv_InternCreoID', 341, 2))
	_uState72Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 339, 2) ))
	_uState72Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 340, 2) ))
	_uState72Trans4:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 341, 1))
	_uState72Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState72Trans4 = nil

-- TO STATE: label
_uState72Trans5 = GdsCreateTransition (_uState66, _uState72, "State_66", "State_72_T5", "Dialog")
	_uState72Trans5:AddCondition (CScriptConditionValue('', 'mv_InternCreoID', 342, 2))
	_uState72Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 339, 2) ))
	_uState72Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 340, 2) ))
	_uState72Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternCreoID', 341, 2) ))
	_uState72Trans5:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 342, 1))
	_uState72Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState72Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState72, _uState72, "State_72", "State_72", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "crafting04", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting04"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState72, _uBeginState, "State_72", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting04"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting04', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING04)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState77Trans1 = GdsCreateTransition (_uState72, _uState77, "State_72", "State_77_T1", "Dialog")
	_uState77Trans1:AddCondition (CScriptConditionValue('', 'mv_InternSuffix', 323, 2))
	_uState77Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 323, 1))
	_uState77Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting04"))
	_uState77Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(CRAFTING04)', 1, 4))
	_uState77Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState77Trans1 = nil

-- TO STATE: endconversation
_uState77Trans2 = GdsCreateTransition (_uState72, _uState77, "State_72", "State_77_T2", "Dialog")
	_uState77Trans2:AddCondition (CScriptConditionValue('', 'mv_InternSuffix', 324, 2))
	_uState77Trans2:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternSuffix', 323, 2) ))
	_uState77Trans2:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 324, 1))
	_uState77Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting04"))
	_uState77Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(CRAFTING04)', 1, 4))
	_uState77Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState77Trans2 = nil

-- TO STATE: endconversation
_uState77Trans3 = GdsCreateTransition (_uState72, _uState77, "State_72", "State_77_T3", "Dialog")
	_uState77Trans3:AddCondition (CScriptConditionValue('', 'mv_InternSuffix', 325, 2))
	_uState77Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternSuffix', 323, 2) ))
	_uState77Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternSuffix', 324, 2) ))
	_uState77Trans3:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 325, 1))
	_uState77Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting04"))
	_uState77Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(CRAFTING04)', 1, 4))
	_uState77Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState77Trans3 = nil

-- TO STATE: endconversation
_uState77Trans4 = GdsCreateTransition (_uState72, _uState77, "State_72", "State_77_T4", "Dialog")
	_uState77Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternSuffix', 323, 2) ))
	_uState77Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternSuffix', 324, 2) ))
	_uState77Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mv_InternSuffix', 325, 2) ))
	_uState77Trans4:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 326, 1))
	_uState77Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "crafting04"))
	_uState77Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(CRAFTING04)', 1, 4))
	_uState77Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(CRAFTING04)', 1, 4))
	_uState77Trans4 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState77, _uState77, "State_77", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(CRAFTING04)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting04"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(CRAFTING04)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(CRAFTING04)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState77, _uState77, "State_77", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(CRAFTING04)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting04"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(CRAFTING04)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(CRAFTING04)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState77, _uState77, "State_77", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(CRAFTING04)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting04"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(CRAFTING04)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(CRAFTING04)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState77, _uState77, "State_77", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(CRAFTING04)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "crafting04"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(CRAFTING04)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(CRAFTING04)', 1, 4))
	_uEndActions4 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState77, _uBeginState, "State_77", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(CRAFTING04)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(CRAFTING04)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('crafting04', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(CRAFTING04)', 0, 4))
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
_uState42 = nil
_uState52 = nil
_uState54 = nil
_uState63 = nil
_uState65 = nil
_uState66 = nil
_uState72 = nil
_uState77 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("crafting04_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(CRAFTING04)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/smallshrine_BeginDialog.tak', 'pl_HumanAvatar', 'crafting04'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(CRAFTING04)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())

