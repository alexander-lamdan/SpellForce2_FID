local _uSM = GdsCreateStateMachine ("hirin_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState3 = GdsCreateState (_uSM, "State_3")
_uState10 = GdsCreateState (_uSM, "State_10")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('hirin'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(HIRIN)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(HIRIN)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('hirin', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("hirin", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "hirin"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HIRIN)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(HIRIN)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('hirin', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("hirin")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HIRIN)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HIRIN)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(HIRIN)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HIRIN)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "hirin"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('hirin', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HIRIN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState3Trans1 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T1", "Dialog")
	_uState3Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(HIRIN)', 0, 2))
	_uState3Trans1:AddAction (CScriptActionChoice("P502_DLG_HIRIN_010PC", "I've got enough problems, take it.", 1, 16777215))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HIRIN)', 1, 4))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HIRIN)', 1, 4))
	_uState3Trans1 = nil

-- TO STATE: choice
_uState3Trans2 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T2", "Dialog")
	_uState3Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(HIRIN)', 0, 2))
	_uState3Trans2:AddAction (CScriptActionChoice("P502_DLG_HIRIN_012PC", "I will not be intimidated by you. I thank you for your warning but I will keep the artifact.", 2, 16777215))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HIRIN)', 1, 4))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HIRIN)', 1, 4))
	_uState3Trans2 = nil

-- TO STATE: choice
_uState3Trans3 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T3", "Dialog")
	_uState3Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(HIRIN)', 1, 2))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HIRIN)', 0, 4))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(HIRIN)', 1, 4))
	_uState3Trans3:AddAction (CScriptActionShowChoices())
	_uState3Trans3 = nil

-- TO STATE: choice
_uState3Trans4 = GdsCreateTransition (_uState1, _uState3, "State_1", "State_3_T4", "Dialog")
	_uState3Trans4:AddCondition (CScriptConditionValue('', 'mf_P502_FirstTimeHirin', 1, 2))
	_uState3Trans4:AddAction (CScriptActionSay("hirin", "P502_DLG_HIRIN_001", "Mortal, that artifact is not for you.", 100, 16777215))
	_uState3Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_HIRIN_002PC", "How nice of you to mention that now, after I've collected all the pieces", 101, 16777215))
	_uState3Trans4:AddAction (CScriptActionSay("hirin", "P502_DLG_HIRIN_003", "Give me the Prism of Magic - now!", 102, 16777215))
	_uState3Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_HIRIN_004PC", "Why should I do that?", 103, 16777215))
	_uState3Trans4:AddAction (CScriptActionSay("hirin", "P502_DLG_HIRIN_005", "It has already put enough mortals in danger.", 104, 16777215))
	_uState3Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_HIRIN_006PC", "The Tesites?", 105, 16777215))
	_uState3Trans4:AddAction (CScriptActionSay("hirin", "P502_DLG_HIRIN_007", "And many others who wanted to use the powers for their own good.", 106, 16777215))
	_uState3Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_HIRIN_008PC", "What happened to them?", 107, 16777215))
	_uState3Trans4:AddAction (CScriptActionSay("hirin", "P502_DLG_HIRIN_009", "This is of no moment, Shaikan. Now hand over the artifact!", 108, 16777215))
	_uState3Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HIRIN)', 1, 4))
	_uState3Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "hirin"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState3, _uBeginState, "State_3", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "hirin"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('hirin', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HIRIN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState10Trans1 = GdsCreateTransition (_uState3, _uState10, "State_3", "State_10_T1", "Dialog")
	_uState10Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 1))
	_uState10Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_HIRIN_010PC", "I've got enough problems, take it.", 99, 16777215))
	_uState10Trans1:AddAction (CScriptActionSay("hirin", "P502_DLG_HIRIN_011", "You have made a wise decision, Shaikan. Take this as compensation.", 110, 16777215))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HIRIN)', 0, 4))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HIRIN)', 0, 4))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'mf_P502_GivePrism', 1, 4))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'mf_P502_FirstTimeHirin', 0, 4))
	_uState10Trans1:AddAction (CScriptActionDialogEnable("hirin", 0))
	_uState10Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "hirin"))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(HIRIN)', 1, 4))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HIRIN)', 1, 4))
	_uState10Trans1:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uState10Trans1:AddAction (CScriptActionCombatTurnOffAll(0))
	_uState10Trans1 = nil

-- TO STATE: endconversation
_uState10Trans2 = GdsCreateTransition (_uState3, _uState10, "State_3", "State_10_T2", "Dialog")
	_uState10Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 2))
	_uState10Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_HIRIN_012PC", "I will not be intimidated by you. I thank you for your warning but I will keep the artifact.", 99, 16777215))
	_uState10Trans2:AddAction (CScriptActionSay("hirin", "P502_DLG_HIRIN_013", "You are a fool. I will take it by force if I have to!", 112, 16777215))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HIRIN)', 0, 4))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HIRIN)', 0, 4))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'mf_P502_DenyPrism', 1, 4))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'mf_P502_FirstTimeHirin', 0, 4))
	_uState10Trans2:AddAction (CScriptActionFigureChangeTeam('Hirin', 'tm_Team4'))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'mf_P502_HirinFight', 1, 4))
	_uState10Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "hirin"))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(HIRIN)', 1, 4))
	_uState10Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HIRIN)', 1, 4))
	_uState10Trans2 = nil

-- TO STATE: endconversation
_uState10Trans3 = GdsCreateTransition (_uState1, _uState10, "State_1", "State_10_T3", "Dialog")
	_uState10Trans3:AddCondition (CScriptConditionValue('', 'mf_P502_PlayerDefeated', 1, 2))
	_uState10Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P502_FirstTimeHirin', 1, 2) ))
	_uState10Trans3:AddAction (CScriptActionSay("hirin", "P502_DLG_HIRIN_014", "I have given you back your life - The price is the Prism of Magic", 113, 16777215))
	_uState10Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_HIRIN_015PC", "A small price to pay I guess?", 114, 16777215))
	_uState10Trans3:AddAction (CScriptActionSay("hirin", "P502_DLG_HIRIN_016", "Indeed!", 115, 16777215))
	_uState10Trans3:AddAction (CScriptActionDialogEnable("hirin", 0))
	_uState10Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "hirin"))
	_uState10Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(HIRIN)', 1, 4))
	_uState10Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HIRIN)', 1, 4))
	_uState10Trans3 = nil

-- TO STATE: endconversation
_uState10Trans4 = GdsCreateTransition (_uState1, _uState10, "State_1", "State_10_T4", "Dialog")
	_uState10Trans4:AddCondition (CScriptConditionValue('pl_Human', 'af_P502_PrismOfMagicStarted', 1, 2))
	_uState10Trans4:AddCondition (CScriptConditionValue('', 'mf_P502_PrismofMagicWaveKilled', 1, 2))
	_uState10Trans4:AddCondition (CScriptConditionValue('', 'mf_P502_AllHirinWavesDefeated', 0, 2))
	_uState10Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P502_FirstTimeHirin', 1, 2) ))
	_uState10Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P502_PlayerDefeated', 1, 2) ))
	_uState10Trans4:AddAction (CScriptActionSay("hirin", "P502_DLG_HIRIN_017", "So you have defeated the spirits of the prism.", 116, 16777215))
	_uState10Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_HIRIN_018PC", "As it seems.", 117, 16777215))
	_uState10Trans4:AddAction (CScriptActionSay("hirin", "P502_DLG_HIRIN_019", "Keep the artifact for now, but know that the spirits of the prism will continue to haunt your steps and you will find no rest.", 118, 16777215))
	_uState10Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_HIRIN_020PC", "We will see.", 119, 16777215))
	_uState10Trans4:AddAction (CScriptActionDialogEnable("hirin", 0))
	_uState10Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "hirin"))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(HIRIN)', 1, 4))
	_uState10Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HIRIN)', 1, 4))
	_uState10Trans4 = nil

-- TO STATE: endconversation
_uState10Trans5 = GdsCreateTransition (_uState1, _uState10, "State_1", "State_10_T5", "Dialog")
	_uState10Trans5:AddCondition (CScriptConditionValue('', 'mf_P502_AllHirinWavesDefeated', 1, 2))
	_uState10Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P502_FirstTimeHirin', 1, 2) ))
	_uState10Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P502_PlayerDefeated', 1, 2) ))
	_uState10Trans5:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('pl_Human', 'af_P502_PrismOfMagicStarted', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P502_PrismofMagicWaveKilled', 1, 2), CScriptConditionValue('', 'mf_P502_AllHirinWavesDefeated', 0, 2))) ))
	_uState10Trans5:AddAction (CScriptActionSay("hirin", "P502_DLG_HIRIN_021", "I have misjudged you, mortal.", 120, 16777215))
	_uState10Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_HIRIN_022PC", "Then the Prism is mine?", 121, 16777215))
	_uState10Trans5:AddAction (CScriptActionSay("hirin", "P502_DLG_HIRIN_023", "I will still be watching you and your destiny, Shaikan. But for the moment it is.", 122, 16777215))
	_uState10Trans5:AddAction (CScriptActionDialogEnable("hirin", 0))
	_uState10Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "hirin"))
	_uState10Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(HIRIN)', 1, 4))
	_uState10Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HIRIN)', 1, 4))
	_uState10Trans5 = nil

-- TO STATE: endconversation
_uState10Trans6 = GdsCreateTransition (_uState1, _uState10, "State_1", "State_10_T6", "Dialog")
	_uState10Trans6:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P502_FirstTimeHirin', 1, 2) ))
	_uState10Trans6:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P502_PlayerDefeated', 1, 2) ))
	_uState10Trans6:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('pl_Human', 'af_P502_PrismOfMagicStarted', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P502_PrismofMagicWaveKilled', 1, 2), CScriptConditionValue('', 'mf_P502_AllHirinWavesDefeated', 0, 2))) ))
	_uState10Trans6:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P502_AllHirinWavesDefeated', 1, 2) ))
	_uState10Trans6:AddAction (CScriptActionDialogEnable("hirin", 0))
	_uState10Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "hirin"))
	_uState10Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(HIRIN)', 1, 4))
	_uState10Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HIRIN)', 1, 4))
	_uState10Trans6 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState10, _uState10, "State_10", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(HIRIN)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "hirin"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(HIRIN)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HIRIN)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState10, _uState10, "State_10", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(HIRIN)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "hirin"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(HIRIN)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HIRIN)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState10, _uState10, "State_10", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(HIRIN)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "hirin"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P502_TakePrism', 1, 4))
	_uEndActions3:AddAction (CScriptActionTimeStampReset('at_P502_PrismOfMagicTimer', 'pl_Human'))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(HIRIN)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HIRIN)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState10, _uState10, "State_10", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(HIRIN)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "hirin"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_P502_SpiritsDialogOver', 1, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(HIRIN)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HIRIN)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState10, _uState10, "State_10", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(HIRIN)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "hirin"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'mf_P502_HirinOver', 1, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(HIRIN)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HIRIN)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState10, _uState10, "State_10", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(HIRIN)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "hirin"))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(HIRIN)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HIRIN)', 1, 4))
	_uEndActions6 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState10, _uBeginState, "State_10", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(HIRIN)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HIRIN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('hirin', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HIRIN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState3 = nil
_uState10 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("hirin_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(HIRIN)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'hirin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(HIRIN)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'hirin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'hirin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'hirin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'hirin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'hirin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'hirin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'hirin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'hirin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'hirin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'hirin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'hirin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'hirin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'hirin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'hirin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'hirin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'hirin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'hirin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'hirin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'hirin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'hirin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'hirin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'hirin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'hirin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "hirin", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'hirin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
