local _uSM = GdsCreateStateMachine ("huldik_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState3 = GdsCreateState (_uSM, "State_3")
_uState5 = GdsCreateState (_uSM, "State_5")
_uState8 = GdsCreateState (_uSM, "State_8")
_uState10 = GdsCreateState (_uSM, "State_10")
_uState13 = GdsCreateState (_uSM, "State_13")
_uState15 = GdsCreateState (_uSM, "State_15")
_uState18 = GdsCreateState (_uSM, "State_18")
_uState20 = GdsCreateState (_uSM, "State_20")
_uState24 = GdsCreateState (_uSM, "State_24")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('huldik'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(HULDIK)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(HULDIK)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('huldik', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("huldik", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "huldik"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HULDIK)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(HULDIK)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('huldik', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("huldik")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HULDIK)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HULDIK)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(HULDIK)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "huldik"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('huldik', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HULDIK)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState3Trans1 = GdsCreateTransition (_uState1, _uState3, "State_1", "State_3_T1", "Dialog")
	_uState3Trans1:AddCondition (CScriptConditionValue('', 'mf_P503_GotHuldikIngredients', 1, 2))
	_uState3Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P503_RaznakDead', 1, 2) ))
	_uState3Trans1:AddAction (CScriptActionSay("huldik", "P503_DLG_HULDIK_017", "Finally, you're back!", 116, 16777215))
	_uState3Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P503_DLG_HULDIK_018PC", "And with the required Ingredients no less.", 117, 16777215))
	_uState3Trans1:AddAction (CScriptActionSay("huldik", "P503_DLG_HULDIK_019", "Well, well, well. Let's see if your hands are as quick as your mouth! Now don't worry, I happen to know that one of your kind has done this once before, in the Fireforge, I've heard.", 118, 16777215))
	_uState3Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P503_DLG_HULDIK_020PC", "Ok, what do I do?", 119, 16777215))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState3Trans1 = nil

-- TO STATE: elseif
_uState3Trans2 = GdsCreateTransition (_uState5, _uState3, "State_5", "State_3_T2", "Dialog")
	_uState3Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 2))
	_uState3Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P503_DLG_HULDIK_023PC", "Could you repeat that please?", 99, 16777215))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HULDIK)', 0, 4))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HULDIK)', 0, 4))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState3Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "huldik"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState3, _uBeginState, "State_3", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "huldik"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('huldik', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HULDIK)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState5Trans1 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T1", "Dialog")
	_uState5Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(HULDIK)', 0, 2))
	_uState5Trans1:AddAction (CScriptActionChoice("P503_DLG_HULDIK_022PC", "Alright, continue.", 1, 16777215))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HULDIK)', 1, 4))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState5Trans1 = nil

-- TO STATE: choice
_uState5Trans2 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T2", "Dialog")
	_uState5Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(HULDIK)', 0, 2))
	_uState5Trans2:AddAction (CScriptActionChoice("P503_DLG_HULDIK_023PC", "Could you repeat that please?", 2, 16777215))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HULDIK)', 1, 4))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState5Trans2 = nil

-- TO STATE: choice
_uState5Trans3 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T3", "Dialog")
	_uState5Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 2))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 0, 4))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(HULDIK)', 1, 4))
	_uState5Trans3:AddAction (CScriptActionShowChoices())
	_uState5Trans3 = nil

-- TO STATE: choice
_uState5Trans4 = GdsCreateTransition (_uState3, _uState5, "State_3", "State_5_T4", "Dialog")
	_uState5Trans4:AddAction (CScriptActionSay("huldik", "P503_DLG_HULDIK_021", "The forge has three flames. These are controlled by levers on each side of the forge. Each lever operates the heat for it's own flame.  Each heat level has a different color, so you can distinguish bwtween them easily.", 120, 16777215))
	_uState5Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState5Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "huldik"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState5, _uBeginState, "State_5", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "huldik"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('huldik', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HULDIK)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState8Trans1 = GdsCreateTransition (_uState1, _uState8, "State_1", "State_8_T1", "Dialog")
	_uState8Trans1:AddCondition (CScriptConditionValue('', 'mf_P503_HuldikPhaseTwo', 1, 2))
	_uState8Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P503_RaznakDead', 1, 2) ))
	_uState8Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P503_GotHuldikIngredients', 1, 2) ))
	_uState8Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState8Trans1 = nil

-- TO STATE: elseif
_uState8Trans2 = GdsCreateTransition (_uState5, _uState8, "State_5", "State_8_T2", "Dialog")
	_uState8Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 1))
	_uState8Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P503_DLG_HULDIK_022PC", "Alright, continue.", 99, 16777215))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'mf_P503_HuldikPhaseTwo', 1, 4))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HULDIK)', 0, 4))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HULDIK)', 0, 4))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState8Trans2 = nil

-- TO STATE: elseif
_uState8Trans3 = GdsCreateTransition (_uState10, _uState8, "State_10", "State_8_T3", "Dialog")
	_uState8Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 2))
	_uState8Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P503_DLG_HULDIK_026PC", "Could you explain about the heat levels again?", 99, 16777215))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HULDIK)', 0, 4))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HULDIK)', 0, 4))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState8Trans3 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState8, _uState8, "State_8", "State_8", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "huldik"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState8, _uBeginState, "State_8", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "huldik"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('huldik', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HULDIK)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState10Trans1 = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10_T1", "Dialog")
	_uState10Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(HULDIK)', 0, 2))
	_uState10Trans1:AddAction (CScriptActionChoice("P503_DLG_HULDIK_025PC", "Certainly, anything else?", 1, 16777215))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HULDIK)', 1, 4))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState10Trans1 = nil

-- TO STATE: choice
_uState10Trans2 = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10_T2", "Dialog")
	_uState10Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(HULDIK)', 0, 2))
	_uState10Trans2:AddAction (CScriptActionChoice("P503_DLG_HULDIK_026PC", "Could you explain about the heat levels again?", 2, 16777215))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HULDIK)', 1, 4))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState10Trans2 = nil

-- TO STATE: choice
_uState10Trans3 = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10_T3", "Dialog")
	_uState10Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 2))
	_uState10Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 0, 4))
	_uState10Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(HULDIK)', 1, 4))
	_uState10Trans3:AddAction (CScriptActionShowChoices())
	_uState10Trans3 = nil

-- TO STATE: choice
_uState10Trans4 = GdsCreateTransition (_uState8, _uState10, "State_8", "State_10_T4", "Dialog")
	_uState10Trans4:AddAction (CScriptActionSay("huldik", "P503_DLG_HULDIK_024", "There are three phases to the forging process. When I tell you which heat level I need, your job is to set that heat level as fast as you can. Understand?", 123, 16777215))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState10Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "huldik"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState10, _uBeginState, "State_10", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "huldik"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('huldik', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HULDIK)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState13Trans1 = GdsCreateTransition (_uState1, _uState13, "State_1", "State_13_T1", "Dialog")
	_uState13Trans1:AddCondition (CScriptConditionValue('', 'mf_P503_HuldikPhaseThree', 1, 2))
	_uState13Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P503_RaznakDead', 1, 2) ))
	_uState13Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P503_GotHuldikIngredients', 1, 2) ))
	_uState13Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P503_HuldikPhaseTwo', 1, 2) ))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState13Trans1 = nil

-- TO STATE: elseif
_uState13Trans2 = GdsCreateTransition (_uState10, _uState13, "State_10", "State_13_T2", "Dialog")
	_uState13Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 1))
	_uState13Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P503_DLG_HULDIK_025PC", "Certainly, anything else?", 99, 16777215))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'mf_P503_HuldikPhaseThree', 1, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'mf_P503_HuldikPhaseTwo', 0, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HULDIK)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HULDIK)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState13Trans2 = nil

-- TO STATE: elseif
_uState13Trans3 = GdsCreateTransition (_uState15, _uState13, "State_15", "State_13_T3", "Dialog")
	_uState13Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 2))
	_uState13Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P503_DLG_HULDIK_029PC", "Could you repeat the flame colors for the first and second phase?", 99, 16777215))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HULDIK)', 0, 4))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HULDIK)', 0, 4))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState13Trans3 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState13, _uState13, "State_13", "State_13", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "huldik"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState13, _uBeginState, "State_13", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "huldik"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('huldik', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HULDIK)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState15Trans1 = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15_T1", "Dialog")
	_uState15Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(HULDIK)', 0, 2))
	_uState15Trans1:AddAction (CScriptActionChoice("P503_DLG_HULDIK_028PC", "And in the third phase?", 1, 16777215))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HULDIK)', 1, 4))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState15Trans1 = nil

-- TO STATE: choice
_uState15Trans2 = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15_T2", "Dialog")
	_uState15Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(HULDIK)', 0, 2))
	_uState15Trans2:AddAction (CScriptActionChoice("P503_DLG_HULDIK_029PC", "Could you repeat the flame colors for the first and second phase?", 2, 16777215))
	_uState15Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HULDIK)', 1, 4))
	_uState15Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState15Trans2 = nil

-- TO STATE: choice
_uState15Trans3 = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15_T3", "Dialog")
	_uState15Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 2))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 0, 4))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(HULDIK)', 1, 4))
	_uState15Trans3:AddAction (CScriptActionShowChoices())
	_uState15Trans3 = nil

-- TO STATE: choice
_uState15Trans4 = GdsCreateTransition (_uState13, _uState15, "State_13", "State_15_T4", "Dialog")
	_uState15Trans4:AddAction (CScriptActionSay("huldik", "P503_DLG_HULDIK_027", "In the first phase I need green heat from all three flames. In the second phase I need blue on the left, green in the middle, and red on the right.", 126, 16777215))
	_uState15Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState15Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "huldik"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState15, _uBeginState, "State_15", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "huldik"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('huldik', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HULDIK)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState18Trans1 = GdsCreateTransition (_uState1, _uState18, "State_1", "State_18_T1", "Dialog")
	_uState18Trans1:AddCondition (CScriptConditionValue('', 'mf_P503_HuldikPhaseFour', 1, 2))
	_uState18Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P503_RaznakDead', 1, 2) ))
	_uState18Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P503_GotHuldikIngredients', 1, 2) ))
	_uState18Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P503_HuldikPhaseTwo', 1, 2) ))
	_uState18Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P503_HuldikPhaseThree', 1, 2) ))
	_uState18Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState18Trans1 = nil

-- TO STATE: elseif
_uState18Trans2 = GdsCreateTransition (_uState15, _uState18, "State_15", "State_18_T2", "Dialog")
	_uState18Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 1))
	_uState18Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P503_DLG_HULDIK_028PC", "And in the third phase?", 99, 16777215))
	_uState18Trans2:AddAction (CScriptActionValueModify('', 'mf_P503_HuldikPhaseFour', 1, 4))
	_uState18Trans2:AddAction (CScriptActionValueModify('', 'mf_P503_HuldikPhaseThree', 0, 4))
	_uState18Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HULDIK)', 0, 4))
	_uState18Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HULDIK)', 0, 4))
	_uState18Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState18Trans2 = nil

-- TO STATE: elseif
_uState18Trans3 = GdsCreateTransition (_uState20, _uState18, "State_20", "State_18_T3", "Dialog")
	_uState18Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 2))
	_uState18Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P503_DLG_HULDIK_033PC", "What did you need for phase three again?", 99, 16777215))
	_uState18Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HULDIK)', 0, 4))
	_uState18Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HULDIK)', 0, 4))
	_uState18Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState18Trans3 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState18, _uState18, "State_18", "State_18", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "huldik"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState18, _uBeginState, "State_18", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "huldik"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('huldik', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HULDIK)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState20Trans1 = GdsCreateTransition (_uState20, _uState20, "State_20", "State_20_T1", "Dialog")
	_uState20Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(HULDIK)', 0, 2))
	_uState20Trans1:AddAction (CScriptActionChoice("P503_DLG_HULDIK_031PC", "I'll do my best.", 1, 16777215))
	_uState20Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HULDIK)', 1, 4))
	_uState20Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState20Trans1 = nil

-- TO STATE: choice
_uState20Trans2 = GdsCreateTransition (_uState20, _uState20, "State_20", "State_20_T2", "Dialog")
	_uState20Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(HULDIK)', 0, 2))
	_uState20Trans2:AddAction (CScriptActionChoice("P503_DLG_HULDIK_033PC", "What did you need for phase three again?", 2, 16777215))
	_uState20Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HULDIK)', 1, 4))
	_uState20Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState20Trans2 = nil

-- TO STATE: choice
_uState20Trans3 = GdsCreateTransition (_uState20, _uState20, "State_20", "State_20_T3", "Dialog")
	_uState20Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 2))
	_uState20Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 0, 4))
	_uState20Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(HULDIK)', 1, 4))
	_uState20Trans3:AddAction (CScriptActionShowChoices())
	_uState20Trans3 = nil

-- TO STATE: choice
_uState20Trans4 = GdsCreateTransition (_uState18, _uState20, "State_18", "State_20_T4", "Dialog")
	_uState20Trans4:AddAction (CScriptActionSay("huldik", "P503_DLG_HULDIK_030", "For phase three I need red on the left, yellow in the middle, and green on the right.", 129, 16777215))
	_uState20Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState20Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState20, _uState20, "State_20", "State_20", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "huldik"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState20, _uBeginState, "State_20", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "huldik"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('huldik', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HULDIK)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState24Trans1 = GdsCreateTransition (_uState1, _uState24, "State_1", "State_24_T1", "Dialog")
	_uState24Trans1:AddCondition (CScriptConditionValue('', 'mf_P503_RaznakDead', 1, 2))
	_uState24Trans1:AddAction (CScriptActionSay("huldik", "P503_DLG_HULDIK_001", "By Niethalf's Hammer! It was about time someone finally did something. I was getting hot hiding down there in the forge!", 100, 16777215))
	_uState24Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P503_DLG_HULDIK_002PC", "I see that dwarven gratitude is well in tact.", 101, 16777215))
	_uState24Trans1:AddAction (CScriptActionSay("huldik", "P503_DLG_HULDIK_003", "I must admit, you did me a rather big favor, Shaikan.", 102, 16777215))
	_uState24Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P503_DLG_HULDIK_004PC", "Then I ask for a service in return, Master Dwarf, and I don't have much time!", 103, 16777215))
	_uState24Trans1:AddAction (CScriptActionSay("huldik", "P503_DLG_HULDIK_005", "Hehe, you certainly don't mince words. I like that. So what can old Huldik do for you?", 104, 16777215))
	_uState24Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P503_DLG_HULDIK_006PC", "I have this broken gear made of moonsilver. It must be repaired right away. Do you know of a smith who make the repair?", 105, 16777215))
	_uState24Trans1:AddAction (CScriptActionSay("huldik", "P503_DLG_HULDIK_007", "Ha! There was never a dwarf born, more deserving of Niethalf's Honor than me!", 106, 16777215))
	_uState24Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P503_DLG_HULDIK_008PC", "What does that mean?", 107, 16777215))
	_uState24Trans1:AddAction (CScriptActionSay("huldik", "P503_DLG_HULDIK_009", "It means you're luckier than you know.  But I'm going to need three bars of moonsilver.", 108, 16777215))
	_uState24Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P503_DLG_HULDIK_010PC", "Three whole bars?  It's just one little gear.", 109, 16777215))
	_uState24Trans1:AddAction (CScriptActionSay("huldik", "P503_DLG_HULDIK_011", "Who's the Master Smith here, you or me?", 110, 16777215))
	_uState24Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P503_DLG_HULDIK_012PC", "Alright, three bars it is.", 111, 16777215))
	_uState24Trans1:AddAction (CScriptActionSay("huldik", "P503_DLG_HULDIK_013", "And a bottle of Royal Water and you'll need a pair of smithing gloves to your protect your delicate fingers.", 112, 16777215))
	_uState24Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P503_DLG_HULDIK_014PC", "You expect me to help in the forging?", 113, 16777215))
	_uState24Trans1:AddAction (CScriptActionSay("huldik", "P503_DLG_HULDIK_015", "Well, I'll be doing the actual smithing, but I'll need you to keep the fires burning properly. Normally my assistants would be in charge of regulating the heat. However, you may have noticed our slight demon problem and", 114, 16777215))
	_uState24Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P503_DLG_HULDIK_016PC", "Alright then, first the ingredients.", 115, 16777215))
	_uState24Trans1:AddAction (CScriptActionDialogEnable("huldik", 0))
	_uState24Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "huldik"))
	_uState24Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(HULDIK)', 1, 4))
	_uState24Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState24Trans1 = nil

-- TO STATE: endconversation
_uState24Trans2 = GdsCreateTransition (_uState20, _uState24, "State_20", "State_24_T2", "Dialog")
	_uState24Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 1))
	_uState24Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P503_DLG_HULDIK_031PC", "I'll do my best.", 99, 16777215))
	_uState24Trans2:AddAction (CScriptActionSay("huldik", "P503_DLG_HULDIK_032", "I hope so, Shaikan, I certainly hope so.", 131, 16777215))
	_uState24Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HULDIK)', 0, 4))
	_uState24Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HULDIK)', 0, 4))
	_uState24Trans2:AddAction (CScriptActionDialogEnable("huldik", 0))
	_uState24Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "huldik"))
	_uState24Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(HULDIK)', 1, 4))
	_uState24Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState24Trans2 = nil

-- TO STATE: endconversation
_uState24Trans3 = GdsCreateTransition (_uState1, _uState24, "State_1", "State_24_T3", "Dialog")
	_uState24Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P503_RaznakDead', 1, 2) ))
	_uState24Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P503_GotHuldikIngredients', 1, 2) ))
	_uState24Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P503_HuldikPhaseTwo', 1, 2) ))
	_uState24Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P503_HuldikPhaseThree', 1, 2) ))
	_uState24Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P503_HuldikPhaseFour', 1, 2) ))
	_uState24Trans3:AddAction (CScriptActionDialogEnable("huldik", 0))
	_uState24Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "huldik"))
	_uState24Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(HULDIK)', 1, 4))
	_uState24Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HULDIK)', 1, 4))
	_uState24Trans3 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState24, _uState24, "State_24", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(HULDIK)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "huldik"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P503_HuldikIngredientsQuest', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P503_RaznakDead', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(HULDIK)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HULDIK)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState24, _uState24, "State_24", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(HULDIK)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "huldik"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P503_IgniteForge', 1, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(HULDIK)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HULDIK)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState24, _uState24, "State_24", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(HULDIK)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "huldik"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P503_HuldikIngredientsQuest', 1, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P503_RaznakDead', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(HULDIK)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HULDIK)', 1, 4))
	_uEndActions3 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState24, _uBeginState, "State_24", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(HULDIK)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HULDIK)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('huldik', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HULDIK)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState3 = nil
_uState5 = nil
_uState8 = nil
_uState10 = nil
_uState13 = nil
_uState15 = nil
_uState18 = nil
_uState20 = nil
_uState24 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("huldik_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(HULDIK)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'huldik'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(HULDIK)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'huldik'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'huldik', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'huldik'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'huldik', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'huldik'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'huldik', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'huldik'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'huldik', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'huldik'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'huldik', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'huldik'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'huldik', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'huldik'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'huldik', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'huldik'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'huldik', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'huldik'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'huldik', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'huldik'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'huldik', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'huldik'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'huldik', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'huldik', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'huldik'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'huldik', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'huldik', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'huldik'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'huldik', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'huldik', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'huldik'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[130]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[130]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 130))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'huldik', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[132]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[132]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 132))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'huldik', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[131]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[131]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 131))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'huldik'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "huldik", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'huldik', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
