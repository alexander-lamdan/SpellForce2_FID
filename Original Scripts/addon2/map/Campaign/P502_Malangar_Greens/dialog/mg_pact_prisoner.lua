local _uSM = GdsCreateStateMachine ("mg_pact_prisoner_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState6 = GdsCreateState (_uSM, "State_6")
_uState8 = GdsCreateState (_uSM, "State_8")
_uState10 = GdsCreateState (_uSM, "State_10")
_uState15 = GdsCreateState (_uSM, "State_15")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('mg_pact_prisoner'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(MG_PACT_PRISONER)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(MG_PACT_PRISONER)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('mg_pact_prisoner', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("mg_pact_prisoner", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "mg_pact_prisoner"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MG_PACT_PRISONER)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(MG_PACT_PRISONER)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('mg_pact_prisoner', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("mg_pact_prisoner")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MG_PACT_PRISONER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MG_PACT_PRISONER)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(MG_PACT_PRISONER)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MG_PACT_PRISONER)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "mg_pact_prisoner"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('mg_pact_prisoner', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MG_PACT_PRISONER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState6Trans1 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T1", "Dialog")
	_uState6Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(MG_PACT_PRISONER)', 0, 2))
	_uState6Trans1:AddAction (CScriptActionChoice("P502_DLG_MGPACTPRISONER_006PC", "Go back to your master, the other orders are gone now.", 1, 16777215))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MG_PACT_PRISONER)', 1, 4))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MG_PACT_PRISONER)', 1, 4))
	_uState6Trans1 = nil

-- TO STATE: choice
_uState6Trans2 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T2", "Dialog")
	_uState6Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(MG_PACT_PRISONER)', 0, 2))
	_uState6Trans2:AddAction (CScriptActionChoice("P502_DLG_MGPACTPRISONER_014PC", "Wait here.", 2, 16777215))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MG_PACT_PRISONER)', 1, 4))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MG_PACT_PRISONER)', 1, 4))
	_uState6Trans2 = nil

-- TO STATE: choice
_uState6Trans3 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T3", "Dialog")
	_uState6Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(MG_PACT_PRISONER)', 1, 2))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MG_PACT_PRISONER)', 0, 4))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(MG_PACT_PRISONER)', 1, 4))
	_uState6Trans3:AddAction (CScriptActionShowChoices())
	_uState6Trans3 = nil

-- TO STATE: choice
_uState6Trans4 = GdsCreateTransition (_uState1, _uState6, "State_1", "State_6_T4", "Dialog")
	_uState6Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P502_FactionChosen', 1, 2) ))
	_uState6Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P502_PactFactionChoice', 1, 2) ))
	_uState6Trans4:AddAction (CScriptActionSay("mg_pact_prisoner", "P502_DLG_MGPACTPRISONER_003", "Big warrior strong! Me say thaaanks.", 102, 16777215))
	_uState6Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_MGPACTPRISONER_004PC", "Don't mention it, Skerg. How did you get here?", 103, 16777215))
	_uState6Trans4:AddAction (CScriptActionSay("mg_pact_prisoner", "P502_DLG_MGPACTPRISONER_005", "Me building bug farm, suddenly new orders in my head! Come along, broken voice tell me, come along ... Next I remember, wake up here!", 104, 16777215))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'mf_P502_PactFactionChoice', 1, 4))
	_uState6Trans4:AddAction (CScriptActionPlayerGiveItem('pl_Human', 3, 180, 1))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MG_PACT_PRISONER)', 1, 4))
	_uState6Trans4 = nil

-- TO STATE: choice
_uState6Trans5 = GdsCreateTransition (_uState1, _uState6, "State_1", "State_6_T5", "Dialog")
	_uState6Trans5:AddCondition (CScriptConditionValue('', 'mf_P502_PactFactionChoice', 1, 2))
	_uState6Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P502_FactionChosen', 1, 2) ))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MG_PACT_PRISONER)', 1, 4))
	_uState6Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "mg_pact_prisoner", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "mg_pact_prisoner"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState6, _uBeginState, "State_6", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "mg_pact_prisoner"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('mg_pact_prisoner', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MG_PACT_PRISONER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState8Trans1 = GdsCreateTransition (_uState8, _uState8, "State_8", "State_8_T1", "Dialog")
	_uState8Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(MG_PACT_PRISONER)', 0, 2))
	_uState8Trans1:AddAction (CScriptActionChoice("P502_DLG_MGPACTPRISONER_008PC", "I am overjoyed to accept your offer.", 1, 16777215))
	_uState8Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MG_PACT_PRISONER)', 1, 4))
	_uState8Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MG_PACT_PRISONER)', 1, 4))
	_uState8Trans1 = nil

-- TO STATE: choice
_uState8Trans2 = GdsCreateTransition (_uState8, _uState8, "State_8", "State_8_T2", "Dialog")
	_uState8Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(MG_PACT_PRISONER)', 0, 2))
	_uState8Trans2:AddAction (CScriptActionChoice("P502_DLG_MGPACTPRISONER_013PC", "Let me talk to the other prisoners first.", 2, 16777215))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MG_PACT_PRISONER)', 1, 4))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MG_PACT_PRISONER)', 1, 4))
	_uState8Trans2 = nil

-- TO STATE: choice
_uState8Trans3 = GdsCreateTransition (_uState8, _uState8, "State_8", "State_8_T3", "Dialog")
	_uState8Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(MG_PACT_PRISONER)', 1, 2))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MG_PACT_PRISONER)', 0, 4))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(MG_PACT_PRISONER)', 1, 4))
	_uState8Trans3:AddAction (CScriptActionShowChoices())
	_uState8Trans3 = nil

-- TO STATE: choice
_uState8Trans4 = GdsCreateTransition (_uState6, _uState8, "State_6", "State_8_T4", "Dialog")
	_uState8Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "mg_pact_prisoner", 1))
	_uState8Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_MGPACTPRISONER_006PC", "Go back to your master, the other orders are gone now.", 99, 16777215))
	_uState8Trans4:AddAction (CScriptActionSay("mg_pact_prisoner", "P502_DLG_MGPACTPRISONER_007", "Allow me offering for you wonderful construction of Pact village center! Strong Pact soldiers good help in making demons dead. Say yes?", 106, 16777215))
	_uState8Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MG_PACT_PRISONER)', 0, 4))
	_uState8Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MG_PACT_PRISONER)', 0, 4))
	_uState8Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MG_PACT_PRISONER)', 1, 4))
	_uState8Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState8, _uState8, "State_8", "State_8", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "mg_pact_prisoner", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "mg_pact_prisoner"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState8, _uBeginState, "State_8", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "mg_pact_prisoner"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('mg_pact_prisoner', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MG_PACT_PRISONER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState10Trans1 = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10_T1", "Dialog")
	_uState10Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(MG_PACT_PRISONER)', 0, 2))
	_uState10Trans1:AddAction (CScriptActionChoice("P502_DLG_MGPACTPRISONER_009PC", "Yes", 1, 16777215))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MG_PACT_PRISONER)', 1, 4))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MG_PACT_PRISONER)', 1, 4))
	_uState10Trans1 = nil

-- TO STATE: choice
_uState10Trans2 = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10_T2", "Dialog")
	_uState10Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(MG_PACT_PRISONER)', 0, 2))
	_uState10Trans2:AddAction (CScriptActionChoice("P502_DLG_MGPACTPRISONER_011PC", "No, let me talk to the other prisoners first.", 2, 16777215))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MG_PACT_PRISONER)', 1, 4))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MG_PACT_PRISONER)', 1, 4))
	_uState10Trans2 = nil

-- TO STATE: choice
_uState10Trans3 = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10_T3", "Dialog")
	_uState10Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(MG_PACT_PRISONER)', 1, 2))
	_uState10Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MG_PACT_PRISONER)', 0, 4))
	_uState10Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(MG_PACT_PRISONER)', 1, 4))
	_uState10Trans3:AddAction (CScriptActionShowChoices())
	_uState10Trans3 = nil

-- TO STATE: choice
_uState10Trans4 = GdsCreateTransition (_uState8, _uState10, "State_8", "State_10_T4", "Dialog")
	_uState10Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "mg_pact_prisoner", 1))
	_uState10Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_MGPACTPRISONER_008PC", "I am overjoyed to accept your offer.", 99, 16777215))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MG_PACT_PRISONER)', 0, 4))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MG_PACT_PRISONER)', 0, 4))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MG_PACT_PRISONER)', 1, 4))
	_uState10Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "mg_pact_prisoner", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "mg_pact_prisoner"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState10, _uBeginState, "State_10", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "mg_pact_prisoner"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('mg_pact_prisoner', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MG_PACT_PRISONER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState15Trans1 = GdsCreateTransition (_uState1, _uState15, "State_1", "State_15_T1", "Dialog")
	_uState15Trans1:AddCondition (CScriptConditionValue('', 'mf_P502_FactionChosen', 1, 2))
	_uState15Trans1:AddAction (CScriptActionSay("mg_pact_prisoner", "P502_DLG_MGPACTPRISONER_001", "Empress disappear, gone, no trace! Shadow Warrior go away, go looking for Empress. Nameless attack then.", 100, 16777215))
	_uState15Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_MGPACTPRISONER_002PC", "Nightsong is gone, and the Shadow Warrior as well? That is dire news.", 101, 16777215))
	_uState15Trans1:AddAction (CScriptActionDialogEnable("mg_pact_prisoner", 0))
	_uState15Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "mg_pact_prisoner"))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(MG_PACT_PRISONER)', 1, 4))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MG_PACT_PRISONER)', 1, 4))
	_uState15Trans1 = nil

-- TO STATE: endconversation
_uState15Trans2 = GdsCreateTransition (_uState10, _uState15, "State_10", "State_15_T2", "Dialog")
	_uState15Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "mg_pact_prisoner", 1))
	_uState15Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_MGPACTPRISONER_009PC", "Yes", 99, 16777215))
	_uState15Trans2:AddAction (CScriptActionSay("mg_pact_prisoner", "P502_DLG_MGPACTPRISONER_010", "Southeast we meet! There me village center constructing for you!", 109, 16777215))
	_uState15Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MG_PACT_PRISONER)', 0, 4))
	_uState15Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MG_PACT_PRISONER)', 0, 4))
	_uState15Trans2:AddAction (CScriptActionDialogEnable("mg_pact_prisoner", 0))
	_uState15Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "mg_pact_prisoner"))
	_uState15Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(MG_PACT_PRISONER)', 1, 4))
	_uState15Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MG_PACT_PRISONER)', 1, 4))
	_uState15Trans2 = nil

-- TO STATE: endconversation
_uState15Trans3 = GdsCreateTransition (_uState10, _uState15, "State_10", "State_15_T3", "Dialog")
	_uState15Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "mg_pact_prisoner", 2))
	_uState15Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_MGPACTPRISONER_011PC", "No, let me talk to the other prisoners first.", 99, 16777215))
	_uState15Trans3:AddAction (CScriptActionSay("mg_pact_prisoner", "P502_DLG_MGPACTPRISONER_012", "Sure, Skerg here wait!", 111, 16777215))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MG_PACT_PRISONER)', 0, 4))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MG_PACT_PRISONER)', 0, 4))
	_uState15Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "mg_pact_prisoner"))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(MG_PACT_PRISONER)', 1, 4))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MG_PACT_PRISONER)', 1, 4))
	_uState15Trans3 = nil

-- TO STATE: endconversation
_uState15Trans4 = GdsCreateTransition (_uState8, _uState15, "State_8", "State_15_T4", "Dialog")
	_uState15Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "mg_pact_prisoner", 2))
	_uState15Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_MGPACTPRISONER_013PC", "Let me talk to the other prisoners first.", 99, 16777215))
	_uState15Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "mg_pact_prisoner"))
	_uState15Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(MG_PACT_PRISONER)', 1, 4))
	_uState15Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MG_PACT_PRISONER)', 0, 4))
	_uState15Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MG_PACT_PRISONER)', 0, 4))
	_uState15Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MG_PACT_PRISONER)', 1, 4))
	_uState15Trans4 = nil

-- TO STATE: endconversation
_uState15Trans5 = GdsCreateTransition (_uState6, _uState15, "State_6", "State_15_T5", "Dialog")
	_uState15Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "mg_pact_prisoner", 2))
	_uState15Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_MGPACTPRISONER_014PC", "Wait here.", 99, 16777215))
	_uState15Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "mg_pact_prisoner"))
	_uState15Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(MG_PACT_PRISONER)', 1, 4))
	_uState15Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MG_PACT_PRISONER)', 0, 4))
	_uState15Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MG_PACT_PRISONER)', 0, 4))
	_uState15Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MG_PACT_PRISONER)', 1, 4))
	_uState15Trans5 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState15, _uState15, "State_15", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(MG_PACT_PRISONER)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "mg_pact_prisoner"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P502_PactForceDialogOver', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(MG_PACT_PRISONER)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MG_PACT_PRISONER)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState15, _uState15, "State_15", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(MG_PACT_PRISONER)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "mg_pact_prisoner"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P502_FactionChosen', 1, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('pl_Human', 'av_P502_FactionChosen', 4, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(MG_PACT_PRISONER)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MG_PACT_PRISONER)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState15, _uState15, "State_15", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(MG_PACT_PRISONER)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "mg_pact_prisoner"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(MG_PACT_PRISONER)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MG_PACT_PRISONER)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState15, _uState15, "State_15", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(MG_PACT_PRISONER)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "mg_pact_prisoner"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(MG_PACT_PRISONER)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MG_PACT_PRISONER)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState15, _uState15, "State_15", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(MG_PACT_PRISONER)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "mg_pact_prisoner"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(MG_PACT_PRISONER)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MG_PACT_PRISONER)', 1, 4))
	_uEndActions5 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState15, _uBeginState, "State_15", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(MG_PACT_PRISONER)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MG_PACT_PRISONER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('mg_pact_prisoner', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MG_PACT_PRISONER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState6 = nil
_uState8 = nil
_uState10 = nil
_uState15 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("mg_pact_prisoner_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(MG_PACT_PRISONER)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'mg_pact_prisoner'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(MG_PACT_PRISONER)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "mg_pact_prisoner", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'mg_pact_prisoner'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "mg_pact_prisoner", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'mg_pact_prisoner', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "mg_pact_prisoner", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'mg_pact_prisoner'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "mg_pact_prisoner", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'mg_pact_prisoner', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "mg_pact_prisoner", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'mg_pact_prisoner'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "mg_pact_prisoner", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'mg_pact_prisoner', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "mg_pact_prisoner", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'mg_pact_prisoner', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "mg_pact_prisoner", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'mg_pact_prisoner'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "mg_pact_prisoner", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'mg_pact_prisoner', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "mg_pact_prisoner", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'mg_pact_prisoner', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "mg_pact_prisoner", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'mg_pact_prisoner', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "mg_pact_prisoner", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'mg_pact_prisoner', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "mg_pact_prisoner", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'mg_pact_prisoner'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "mg_pact_prisoner", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'mg_pact_prisoner'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "mg_pact_prisoner", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'mg_pact_prisoner', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
