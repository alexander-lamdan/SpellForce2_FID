local _uSM = GdsCreateStateMachine ("symon_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState4 = GdsCreateState (_uSM, "State_4")
_uState9 = GdsCreateState (_uSM, "State_9")
_uState11 = GdsCreateState (_uSM, "State_11")
_uState16 = GdsCreateState (_uSM, "State_16")
_uState19 = GdsCreateState (_uSM, "State_19")
_uState21 = GdsCreateState (_uSM, "State_21")
_uState25 = GdsCreateState (_uSM, "State_25")
_uState27 = GdsCreateState (_uSM, "State_27")
_uState28 = GdsCreateState (_uSM, "State_28")
_uState30 = GdsCreateState (_uSM, "State_30")
_uState35 = GdsCreateState (_uSM, "State_35")
_uState39 = GdsCreateState (_uSM, "State_39")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('symon'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(SYMON)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(SYMON)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('symon', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("symon", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "symon"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SYMON)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(SYMON)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('symon', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("symon")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SYMON)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SYMON)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(SYMON)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "symon"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('symon', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SYMON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState4Trans1 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T1", "Dialog")
	_uState4Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 0, 2))
	_uState4Trans1:AddAction (CScriptActionChoice("P501_DLG_SYMON_006PC", "Because she loves you and doesn't want to see any harm come to you.", 1, 16777215))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 1, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState4Trans1 = nil

-- TO STATE: choice
_uState4Trans2 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T2", "Dialog")
	_uState4Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 0, 2))
	_uState4Trans2:AddAction (CScriptActionChoice("P501_DLG_SYMON_008PC", "Because you are the only one standing between her and a big inheritance?", 2, 16777215))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 1, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState4Trans2 = nil

-- TO STATE: choice
_uState4Trans3 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T3", "Dialog")
	_uState4Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(SYMON)', 0, 2))
	_uState4Trans3:AddAction (CScriptActionChoice("P501_DLG_SYMON_010PC", "You're obviously the only one standing between her and world domination.", 3, 16777215))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SYMON)', 1, 4))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState4Trans3 = nil

-- TO STATE: choice
_uState4Trans4 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T4", "Dialog")
	_uState4Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(SYMON)', 0, 2))
	_uState4Trans4:AddAction (CScriptActionChoice("P501_DLG_SYMON_012PC", "Because she is grumpy old lady, who won't let you have any fun...", 4, 16777215))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SYMON)', 1, 4))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState4Trans4 = nil

-- TO STATE: choice
_uState4Trans5 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T5", "Dialog")
	_uState4Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 2))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 0, 4))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(SYMON)', 1, 4))
	_uState4Trans5:AddAction (CScriptActionShowChoices())
	_uState4Trans5 = nil

-- TO STATE: choice
_uState4Trans6 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T6", "Dialog")
	_uState4Trans6:AddCondition (CScriptConditionValue('', 'mf_P501_StartWithSymon', 1, 2))
	_uState4Trans6:AddAction (CScriptActionSay("symon", "P501_DLG_SYMON_001", "Man - did you see that? That was really neat.  My name is Symon by the way.", 100, 16777215))
	_uState4Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_002PC", "Yes, I know.", 101, 16777215))
	_uState4Trans6:AddAction (CScriptActionSay("symon", "P501_DLG_SYMON_003", "Oh no, you weren't sent by my aunt Ella were you?", 102, 16777215))
	_uState4Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_004PC", "Indeed I was.  So why don't we get going?  I've still got to think of a way to keep you from running away again.", 103, 16777215))
	_uState4Trans6:AddAction (CScriptActionSay("symon", "P501_DLG_SYMON_005", "You sound like those other four idiots.  One of them wanted to cut off my legs, another wanted to hit me over the head with his club, the third one wanted to sell me into orcish slavery and the fourth one wanted to bury me alive. None of them asked why my aunt is trying so hard to keep me safe.", 104, 16777215))
	_uState4Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState4Trans6 = nil

-- TO STATE: choice
_uState4Trans7 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T7", "Dialog")
	_uState4Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 1))
	_uState4Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_006PC", "Because she loves you and doesn't want to see any harm come to you.", 99, 16777215))
	_uState4Trans7:AddAction (CScriptActionSay("symon", "P501_DLG_SYMON_007", "Nothing could be farther from the truth...", 106, 16777215))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 0, 4))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 0, 4))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SYMON)', 0, 4))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SYMON)', 0, 4))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState4Trans7 = nil

-- TO STATE: choice
_uState4Trans8 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T8", "Dialog")
	_uState4Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 3))
	_uState4Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_010PC", "You're obviously the only one standing between her and world domination.", 99, 16777215))
	_uState4Trans8:AddAction (CScriptActionSay("symon", "P501_DLG_SYMON_011", "What?", 110, 16777215))
	_uState4Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 0, 4))
	_uState4Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 0, 4))
	_uState4Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SYMON)', 0, 4))
	_uState4Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SYMON)', 0, 4))
	_uState4Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState4Trans8 = nil

-- TO STATE: choice
_uState4Trans9 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T9", "Dialog")
	_uState4Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 4))
	_uState4Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_012PC", "Because she is grumpy old lady, who won't let you have any fun...", 99, 16777215))
	_uState4Trans9:AddAction (CScriptActionSay("symon", "P501_DLG_SYMON_013", "Sometimes yes, but that's not it.", 112, 16777215))
	_uState4Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 0, 4))
	_uState4Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 0, 4))
	_uState4Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SYMON)', 0, 4))
	_uState4Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SYMON)', 0, 4))
	_uState4Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState4Trans9 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "symon"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState4, _uBeginState, "State_4", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "symon"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('symon', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SYMON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState9Trans1 = GdsCreateTransition (_uState1, _uState9, "State_1", "State_9_T1", "Dialog")
	_uState9Trans1:AddCondition (CScriptConditionValue('', 'mf_P501_IntroOverWithSymon', 1, 2))
	_uState9Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_StartWithSymon', 1, 2) ))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState9Trans1 = nil

-- TO STATE: elseif
_uState9Trans2 = GdsCreateTransition (_uState4, _uState9, "State_4", "State_9_T2", "Dialog")
	_uState9Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 2))
	_uState9Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_008PC", "Because you are the only one standing between her and a big inheritance?", 99, 16777215))
	_uState9Trans2:AddAction (CScriptActionSay("symon", "P501_DLG_SYMON_009", "Your obviously smarter than the other four.", 108, 16777215))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 0, 4))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 0, 4))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SYMON)', 0, 4))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(SYMON)', 0, 4))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'mf_P501_IntroOverWithSymon', 1, 4))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'mf_P501_StartWithSymon', 0, 4))
	_uState9Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState9Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "symon"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState9, _uBeginState, "State_9", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "symon"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('symon', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SYMON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState11Trans1 = GdsCreateTransition (_uState11, _uState11, "State_11", "State_11_T1", "Dialog")
	_uState11Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 0, 2))
	_uState11Trans1:AddAction (CScriptActionChoice("P501_DLG_SYMON_016PC", "I don't know...  I kind of liked the idea with the orcs.", 1, 16777215))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 1, 4))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState11Trans1 = nil

-- TO STATE: choice
_uState11Trans2 = GdsCreateTransition (_uState11, _uState11, "State_11", "State_11_T2", "Dialog")
	_uState11Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 0, 2))
	_uState11Trans2:AddAction (CScriptActionChoice("P501_DLG_SYMON_019PC", "That thing with the club sounded quite reasonable", 2, 16777215))
	_uState11Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 1, 4))
	_uState11Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState11Trans2 = nil

-- TO STATE: choice
_uState11Trans3 = GdsCreateTransition (_uState11, _uState11, "State_11", "State_11_T3", "Dialog")
	_uState11Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(SYMON)', 0, 2))
	_uState11Trans3:AddAction (CScriptActionChoice("P501_DLG_SYMON_022PC", "Your aunt must answer for her actions.", 3, 16777215))
	_uState11Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SYMON)', 1, 4))
	_uState11Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState11Trans3 = nil

-- TO STATE: choice
_uState11Trans4 = GdsCreateTransition (_uState11, _uState11, "State_11", "State_11_T4", "Dialog")
	_uState11Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 2))
	_uState11Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 0, 4))
	_uState11Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(SYMON)', 1, 4))
	_uState11Trans4:AddAction (CScriptActionShowChoices())
	_uState11Trans4 = nil

-- TO STATE: choice
_uState11Trans5 = GdsCreateTransition (_uState9, _uState11, "State_9", "State_11_T5", "Dialog")
	_uState11Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_014PC", "OK, so you are heir to a fortune that she is trying to get her hands on.", 113, 16777215))
	_uState11Trans5:AddAction (CScriptActionSay("symon", "P501_DLG_SYMON_015", "Exactly...  So what do we do now?", 114, 16777215))
	_uState11Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState11Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState11, _uState11, "State_11", "State_11", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "symon"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState11, _uBeginState, "State_11", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "symon"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('symon', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SYMON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState16Trans1 = GdsCreateTransition (_uState16, _uState16, "State_16", "State_16_T1", "Dialog")
	_uState16Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 0, 2))
	_uState16Trans1:AddAction (CScriptActionChoice("P501_DLG_SYMON_025PC", "So be it.", 1, 16777215))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 1, 4))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState16Trans1 = nil

-- TO STATE: choice
_uState16Trans2 = GdsCreateTransition (_uState16, _uState16, "State_16", "State_16_T2", "Dialog")
	_uState16Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 0, 2))
	_uState16Trans2:AddAction (CScriptActionChoice("P501_DLG_SYMON_026PC", "Strange that you put it that way. I have the feeling that your destiny lies elsewhere. I will speak to your aunt.", 2, 16777215))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 1, 4))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState16Trans2 = nil

-- TO STATE: choice
_uState16Trans3 = GdsCreateTransition (_uState16, _uState16, "State_16", "State_16_T3", "Dialog")
	_uState16Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 2))
	_uState16Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 0, 4))
	_uState16Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(SYMON)', 1, 4))
	_uState16Trans3:AddAction (CScriptActionShowChoices())
	_uState16Trans3 = nil

-- TO STATE: choice
_uState16Trans4 = GdsCreateTransition (_uState1, _uState16, "State_1", "State_16_T4", "Dialog")
	_uState16Trans4:AddCondition (CScriptConditionValue('', 'mf_P501_SymonDefeated', 1, 2))
	_uState16Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_StartWithSymon', 1, 2) ))
	_uState16Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_IntroOverWithSymon', 1, 2) ))
	_uState16Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_023PC", "Now is when you should get down on your knees and beg for mercy.", 122, 16777215))
	_uState16Trans4:AddAction (CScriptActionSay("symon", "P501_DLG_SYMON_024", "What for? I can't change my destiny. If this is the way it's got to be, then so be it.", 123, 16777215))
	_uState16Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState16Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState16, _uState16, "State_16", "State_16", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "symon"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState16, _uBeginState, "State_16", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "symon"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('symon', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SYMON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState19Trans1 = GdsCreateTransition (_uState1, _uState19, "State_1", "State_19_T1", "Dialog")
	_uState19Trans1:AddCondition (CScriptConditionValue('', 'mf_P501_AcceptToElle', 1, 2))
	_uState19Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_StartWithSymon', 1, 2) ))
	_uState19Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_IntroOverWithSymon', 1, 2) ))
	_uState19Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_SymonDefeated', 1, 2) ))
	_uState19Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState19Trans1 = nil

-- TO STATE: elseif
_uState19Trans2 = GdsCreateTransition (_uState11, _uState19, "State_11", "State_19_T2", "Dialog")
	_uState19Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 2))
	_uState19Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_019PC", "That thing with the club sounded quite reasonable", 99, 16777215))
	_uState19Trans2:AddAction (CScriptActionSay("symon", "P501_DLG_SYMON_020", "Go ahead, Shaikan. Kill me!", 119, 16777215))
	_uState19Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 0, 4))
	_uState19Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 0, 4))
	_uState19Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SYMON)', 0, 4))
	_uState19Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_021PC", "What? No, it was a joke.  I'm going to have a long talk with your aunt!", 120, 16777215))
	_uState19Trans2:AddAction (CScriptActionValueModify('', 'mf_P501_AcceptToElle', 1, 4))
	_uState19Trans2:AddAction (CScriptActionValueModify('', 'mf_P501_IntroOverWithSymon', 0, 4))
	_uState19Trans2:AddAction (CScriptActionValueModify('', 'mf_P501_SymonDefeated', 0, 4))
	_uState19Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState19Trans2 = nil

-- TO STATE: elseif
_uState19Trans3 = GdsCreateTransition (_uState11, _uState19, "State_11", "State_19_T3", "Dialog")
	_uState19Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 3))
	_uState19Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_022PC", "Your aunt must answer for her actions.", 99, 16777215))
	_uState19Trans3:AddAction (CScriptActionValueModify('', 'mf_P501_AcceptToElle', 1, 4))
	_uState19Trans3:AddAction (CScriptActionValueModify('', 'mf_P501_IntroOverWithSymon', 0, 4))
	_uState19Trans3:AddAction (CScriptActionValueModify('', 'mf_P501_SymonDefeated', 0, 4))
	_uState19Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 0, 4))
	_uState19Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 0, 4))
	_uState19Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SYMON)', 0, 4))
	_uState19Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState19Trans3 = nil

-- TO STATE: elseif
_uState19Trans4 = GdsCreateTransition (_uState16, _uState19, "State_16", "State_19_T4", "Dialog")
	_uState19Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 2))
	_uState19Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_026PC", "Strange that you put it that way. I have the feeling that your destiny lies elsewhere. I will speak to your aunt.", 99, 16777215))
	_uState19Trans4:AddAction (CScriptActionValueModify('', 'mf_P501_AcceptToElle', 1, 4))
	_uState19Trans4:AddAction (CScriptActionValueModify('', 'mf_P501_IntroOverWithSymon', 0, 4))
	_uState19Trans4:AddAction (CScriptActionValueModify('', 'mf_P501_SymonDefeated', 0, 4))
	_uState19Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 0, 4))
	_uState19Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 0, 4))
	_uState19Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState19Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState19, _uState19, "State_19", "State_19", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "symon"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState19, _uBeginState, "State_19", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "symon"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('symon', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SYMON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState21Trans1 = GdsCreateTransition (_uState1, _uState21, "State_1", "State_21_T1", "Dialog")
	_uState21Trans1:AddCondition (CScriptConditionValue('', 'mf_P501_AcceptedToTeachElle', 1, 2))
	_uState21Trans1:AddCondition (CScriptConditionValue('', 'mf_P501_BackToElleKillHer', 1, 2))
	_uState21Trans1:AddCondition (CScriptConditionValue('', 'mf_P501_BackToElleKilledElle', 1, 2))
	_uState21Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_StartWithSymon', 1, 2) ))
	_uState21Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_IntroOverWithSymon', 1, 2) ))
	_uState21Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_SymonDefeated', 1, 2) ))
	_uState21Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_AcceptToElle', 1, 2) ))
	_uState21Trans1:AddAction (CScriptActionSay("symon", "P501_DLG_SYMON_038", "Hurrah! The old witch is gone!", 137, 16777215))
	_uState21Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_039PC", "It's true, but she had many powerful friends.  You'll need to be careful in the future.", 138, 16777215))
	_uState21Trans1:AddAction (CScriptActionSay("symon", "P501_DLG_SYMON_040", "No need. The treasure has only brought pain and sorrow.  I want to be a soldier instead! I think I'll join Commander Garrett's troops.", 139, 16777215))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState21Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState21, _uState21, "State_21", "State_21", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "symon"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState21, _uBeginState, "State_21", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "symon"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('symon', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SYMON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: label
_uState25Trans1 = GdsCreateTransition (_uState1, _uState25, "State_1", "State_25_T1", "Dialog")
	_uState25Trans1:AddCondition (CScriptConditionValue('', 'mf_P501_ChestDealWithSymon', 1, 2))
	_uState25Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IF_AUNTELLE', 2) ))
	_uState25Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_StartWithSymon', 1, 2) ))
	_uState25Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_IntroOverWithSymon', 1, 2) ))
	_uState25Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_SymonDefeated', 1, 2) ))
	_uState25Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_AcceptToElle', 1, 2) ))
	_uState25Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P501_AcceptedToTeachElle', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P501_BackToElleKillHer', 1, 2), CScriptConditionValue('', 'mf_P501_BackToElleKilledElle', 1, 2))) ))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState25Trans1 = nil

-- TO STATE: label
_uState25Trans2 = GdsCreateTransition (_uState21, _uState25, "State_21", "State_25_T2", "Dialog")
	_uState25Trans2:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IF_AUNTELLE', 2) ))
	_uState25Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_041PC", "So you won't need your father's treasure chest anymore then, will you?", 140, 16777215))
	_uState25Trans2:AddAction (CScriptActionSay("symon", "P501_DLG_SYMON_042", "Who is the rascal now? Still, you've got the ring and my thanks.  Your welcome to the chest.", 141, 16777215))
	_uState25Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_043PC", " ...And the combination your rascalness!", 142, 16777215))
	_uState25Trans2:AddAction (CScriptActionSay("symon", "P501_DLG_SYMON_044", "Oh, yes... Of course... I fear that all of this has spoilt my memory though. I can't quite remember the combination. Was it two times to the right and one time to the left. Or was it Two times to the left and then right?", 143, 16777215))
	_uState25Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_045PC", "What do you want?", 144, 16777215))
	_uState25Trans2:AddAction (CScriptActionSay("symon", "P501_DLG_SYMON_046", "Well, a soldier does need a suit of armor and a sword. Its quite expensive...", 145, 16777215))
	_uState25Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_047PC", "and you don't have any money of course...", 146, 16777215))
	_uState25Trans2:AddAction (CScriptActionSay("symon", "P501_DLG_SYMON_048", "I'm leaving you all my worldly possessions... That should be worth 100 Gold at least.", 147, 16777215))
	_uState25Trans2:AddAction (CScriptActionValueModify('', 'mf_P501_ChestDealWithSymon', 1, 4))
	_uState25Trans2:AddAction (CScriptActionValueModify('', 'mf_P501_BackToElleKilledElle', 0, 4))
	_uState25Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState25Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState25, _uState25, "State_25", "State_25", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "symon"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState25, _uBeginState, "State_25", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "symon"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('symon', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SYMON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState27Trans1 = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27_T1", "Dialog")
	_uState27Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 0, 2))
	_uState27Trans1:AddAction (CScriptActionChoice("P501_DLG_SYMON_049PC", "Why you little... All right Symon. Here, your 100 Gold.", 1, 16777215))
	_uState27Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 1, 4))
	_uState27Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState27Trans1 = nil

-- TO STATE: choice
_uState27Trans2 = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27_T2", "Dialog")
	_uState27Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 0, 2))
	_uState27Trans2:AddAction (CScriptActionChoice("P501_DLG_SYMON_054PC", "The chest could be empty for all I know.  No thanks.", 2, 16777215))
	_uState27Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 1, 4))
	_uState27Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState27Trans2 = nil

-- TO STATE: choice
_uState27Trans3 = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27_T3", "Dialog")
	_uState27Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 2))
	_uState27Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 0, 4))
	_uState27Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(SYMON)', 1, 4))
	_uState27Trans3:AddAction (CScriptActionShowChoices())
	_uState27Trans3 = nil

-- TO STATE: choice
_uState27Trans4 = GdsCreateTransition (_uState25, _uState27, "State_25", "State_27_T4", "Dialog")
	_uState27Trans4:AddCondition (CScriptConditionPlayerHasMoney('pl_Human', 100))
	_uState27Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState27Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "symon"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState27, _uBeginState, "State_27", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "symon"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('symon', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SYMON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState28Trans1 = GdsCreateTransition (_uState27, _uState28, "State_27", "State_28_T1", "Dialog")
	_uState28Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 1))
	_uState28Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_049PC", "Why you little... All right Symon. Here, your 100 Gold.", 99, 16777215))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 0, 4))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 0, 4))
	_uState28Trans1:AddAction (CScriptActionDialogEnable("symon", 0))
	_uState28Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "symon"))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(SYMON)', 1, 4))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState28Trans1 = nil

-- TO STATE: showchoice
_uState28Trans2 = GdsCreateTransition (_uState30, _uState28, "State_30", "State_28_T2", "Dialog")
	_uState28Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 1))
	_uState28Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_051PC", "Can you repeat that please?", 99, 16777215))
	_uState28Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 0, 4))
	_uState28Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 0, 4))
	_uState28Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState28Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState28, _uState28, "State_28", "State_28", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "symon"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState28, _uBeginState, "State_28", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "symon"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('symon', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SYMON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState30Trans1 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T1", "Dialog")
	_uState30Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 0, 2))
	_uState30Trans1:AddAction (CScriptActionChoice("P501_DLG_SYMON_051PC", "Can you repeat that please?", 1, 16777215))
	_uState30Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 1, 4))
	_uState30Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState30Trans1 = nil

-- TO STATE: choice
_uState30Trans2 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T2", "Dialog")
	_uState30Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 0, 2))
	_uState30Trans2:AddAction (CScriptActionChoice("P501_DLG_SYMON_052PC", "Good luck to you Symon - You will surely make the youngest Lieutenant in Commander Garrett's troop!", 2, 16777215))
	_uState30Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 1, 4))
	_uState30Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState30Trans2 = nil

-- TO STATE: choice
_uState30Trans3 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T3", "Dialog")
	_uState30Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 2))
	_uState30Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 0, 4))
	_uState30Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(SYMON)', 1, 4))
	_uState30Trans3:AddAction (CScriptActionShowChoices())
	_uState30Trans3 = nil

-- TO STATE: choice
_uState30Trans4 = GdsCreateTransition (_uState28, _uState30, "State_28", "State_30_T4", "Dialog")
	_uState30Trans4:AddAction (CScriptActionSay("symon", "P501_DLG_SYMON_050", "Like magic my memory has returned. First turn the ring two times to the right, then once to the left, two times to the right and then two times to the left again.", 149, 16777215))
	_uState30Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState30Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "symon"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState30, _uBeginState, "State_30", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "symon"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('symon', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SYMON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState35Trans1 = GdsCreateTransition (_uState35, _uState35, "State_35", "State_35_T1", "Dialog")
	_uState35Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 0, 2))
	_uState35Trans1:AddAction (CScriptActionChoice("P501_DLG_SYMON_055PC", "Why you little ... All right Symon, wait here one moment, I'll have to fetch some more gold.", 1, 16777215))
	_uState35Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 1, 4))
	_uState35Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState35Trans1 = nil

-- TO STATE: choice
_uState35Trans2 = GdsCreateTransition (_uState35, _uState35, "State_35", "State_35_T2", "Dialog")
	_uState35Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 0, 2))
	_uState35Trans2:AddAction (CScriptActionChoice("P501_DLG_SYMON_056PC", "The chest could be empty for all I know. No thanks.", 2, 16777215))
	_uState35Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 1, 4))
	_uState35Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState35Trans2 = nil

-- TO STATE: choice
_uState35Trans3 = GdsCreateTransition (_uState35, _uState35, "State_35", "State_35_T3", "Dialog")
	_uState35Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 2))
	_uState35Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 0, 4))
	_uState35Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(SYMON)', 1, 4))
	_uState35Trans3:AddAction (CScriptActionShowChoices())
	_uState35Trans3 = nil

-- TO STATE: choice
_uState35Trans4 = GdsCreateTransition (_uState25, _uState35, "State_25", "State_35_T4", "Dialog")
	_uState35Trans4:AddCondition (GdsNegateCondition( CScriptConditionPlayerHasMoney('pl_Human', 100) ))
	_uState35Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState35Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState35, _uState35, "State_35", "State_35", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "symon"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState35, _uBeginState, "State_35", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "symon"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('symon', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SYMON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState39Trans1 = GdsCreateTransition (_uState11, _uState39, "State_11", "State_39_T1", "Dialog")
	_uState39Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 1))
	_uState39Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_016PC", "I don't know...  I kind of liked the idea with the orcs.", 99, 16777215))
	_uState39Trans1:AddAction (CScriptActionSay("symon", "P501_DLG_SYMON_017", "I'd rather die than be an orc's slave.", 116, 16777215))
	_uState39Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 0, 4))
	_uState39Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 0, 4))
	_uState39Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(SYMON)', 0, 4))
	_uState39Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_018PC", "If you insist.", 117, 16777215))
	_uState39Trans1:AddAction (CScriptActionValueModify('', 'mf_P501_StartFightWithSymon', 1, 4))
	_uState39Trans1:AddAction (CScriptActionValueModify('', 'mf_P501_IntroOverWithSymon', 0, 4))
	_uState39Trans1:AddAction (CScriptActionDialogEnable("symon", 0))
	_uState39Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "symon"))
	_uState39Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(SYMON)', 1, 4))
	_uState39Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState39Trans1 = nil

-- TO STATE: endconversation
_uState39Trans2 = GdsCreateTransition (_uState16, _uState39, "State_16", "State_39_T2", "Dialog")
	_uState39Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 1))
	_uState39Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_025PC", "So be it.", 99, 16777215))
	_uState39Trans2:AddAction (CScriptActionValueModify('', 'mf_P501_KillSymon', 1, 4))
	_uState39Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 0, 4))
	_uState39Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 0, 4))
	_uState39Trans2:AddAction (CScriptActionDialogEnable("symon", 0))
	_uState39Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "symon"))
	_uState39Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(SYMON)', 1, 4))
	_uState39Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState39Trans2 = nil

-- TO STATE: endconversation
_uState39Trans3 = GdsCreateTransition (_uState19, _uState39, "State_19", "State_39_T3", "Dialog")
	_uState39Trans3:AddAction (CScriptActionSay("symon", "P501_DLG_SYMON_027", "You would really do that for me?", 126, 16777215))
	_uState39Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_028PC", "It's the right thing to do Symon.", 127, 16777215))
	_uState39Trans3:AddAction (CScriptActionSay("symon", "P501_DLG_SYMON_029", "Then take my signet ring. I hate the thing anyway. Before he died, father told me that it had something to do with a family treasure. But I think that was probably nonsense.", 128, 16777215))
	_uState39Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_030PC", "Somehow I don't think you're telling me the whole truth...", 129, 16777215))
	_uState39Trans3:AddAction (CScriptActionSay("symon", "P501_DLG_SYMON_031", "Hmm.... cleverer than I thought.  The ring opens the treasure chest hidden behind our house in town. Aunt Ella has been looking for this ring since my father died, but I've hid it well.  You could use this ring to lure her to our house to open the chest. Then you can punish her like she deserves.", 130, 16777215))
	_uState39Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_032PC", "I said I wanted to talk to her...", 131, 16777215))
	_uState39Trans3:AddAction (CScriptActionSay("symon", "P501_DLG_SYMON_033", "And she said, that you should make sure I wouldn't run away again...", 132, 16777215))
	_uState39Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_034PC", "What a rascal!  Perhaps I should reconsider your aunt's request.", 133, 16777215))
	_uState39Trans3:AddAction (CScriptActionSay("symon", "P501_DLG_SYMON_035", "I suppose that you could...  But then who would tell you how to use the ring to open the chest?", 134, 16777215))
	_uState39Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_036PC", "I bow before your cleverness. After I've dealt with your aunt we'll meet behind your house in town.", 135, 16777215))
	_uState39Trans3:AddAction (CScriptActionSay("symon", "P501_DLG_SYMON_037", "Deal, but be careful, aunt Ella has something mean up her sleeve.", 136, 16777215))
	_uState39Trans3:AddAction (CScriptActionDialogEnable("symon", 0))
	_uState39Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "symon"))
	_uState39Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(SYMON)', 1, 4))
	_uState39Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState39Trans3 = nil

-- TO STATE: endconversation
_uState39Trans4 = GdsCreateTransition (_uState21, _uState39, "State_21", "State_39_T4", "Dialog")
	_uState39Trans4:AddCondition ( CScriptConditionQuestState('pl_Human', 'IF_AUNTELLE', 2) )
	_uState39Trans4:AddAction (CScriptActionDialogEnable("symon", 0))
	_uState39Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "symon"))
	_uState39Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(SYMON)', 1, 4))
	_uState39Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState39Trans4 = nil

-- TO STATE: endconversation
_uState39Trans5 = GdsCreateTransition (_uState30, _uState39, "State_30", "State_39_T5", "Dialog")
	_uState39Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 2))
	_uState39Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_052PC", "Good luck to you Symon - You will surely make the youngest Lieutenant in Commander Garrett's troop!", 99, 16777215))
	_uState39Trans5:AddAction (CScriptActionSay("symon", "P501_DLG_SYMON_053", "Lieutenant? Nothing below General!", 152, 16777215))
	_uState39Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 0, 4))
	_uState39Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 0, 4))
	_uState39Trans5:AddAction (CScriptActionDialogEnable("symon", 0))
	_uState39Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "symon"))
	_uState39Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(SYMON)', 1, 4))
	_uState39Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState39Trans5 = nil

-- TO STATE: endconversation
_uState39Trans6 = GdsCreateTransition (_uState27, _uState39, "State_27", "State_39_T6", "Dialog")
	_uState39Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 2))
	_uState39Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_054PC", "The chest could be empty for all I know.  No thanks.", 99, 16777215))
	_uState39Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "symon"))
	_uState39Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(SYMON)', 1, 4))
	_uState39Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 0, 4))
	_uState39Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 0, 4))
	_uState39Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState39Trans6 = nil

-- TO STATE: endconversation
_uState39Trans7 = GdsCreateTransition (_uState35, _uState39, "State_35", "State_39_T7", "Dialog")
	_uState39Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 1))
	_uState39Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_055PC", "Why you little ... All right Symon, wait here one moment, I'll have to fetch some more gold.", 99, 16777215))
	_uState39Trans7:AddAction (CScriptActionDialogRequestEnd("pl_Human", "symon"))
	_uState39Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(SYMON)', 1, 4))
	_uState39Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 0, 4))
	_uState39Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 0, 4))
	_uState39Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState39Trans7 = nil

-- TO STATE: endconversation
_uState39Trans8 = GdsCreateTransition (_uState35, _uState39, "State_35", "State_39_T8", "Dialog")
	_uState39Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 2))
	_uState39Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_SYMON_056PC", "The chest could be empty for all I know. No thanks.", 99, 16777215))
	_uState39Trans8:AddAction (CScriptActionDialogRequestEnd("pl_Human", "symon"))
	_uState39Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(SYMON)', 1, 4))
	_uState39Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(SYMON)', 0, 4))
	_uState39Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(SYMON)', 0, 4))
	_uState39Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState39Trans8 = nil

-- TO STATE: endconversation
_uState39Trans9 = GdsCreateTransition (_uState1, _uState39, "State_1", "State_39_T9", "Dialog")
	_uState39Trans9:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_StartWithSymon', 1, 2) ))
	_uState39Trans9:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_IntroOverWithSymon', 1, 2) ))
	_uState39Trans9:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_SymonDefeated', 1, 2) ))
	_uState39Trans9:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_AcceptToElle', 1, 2) ))
	_uState39Trans9:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P501_AcceptedToTeachElle', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P501_BackToElleKillHer', 1, 2), CScriptConditionValue('', 'mf_P501_BackToElleKilledElle', 1, 2))) ))
	_uState39Trans9:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P501_ChestDealWithSymon', 1, 2), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'IF_AUNTELLE', 2) )) ))
	_uState39Trans9:AddAction (CScriptActionDialogEnable("symon", 0))
	_uState39Trans9:AddAction (CScriptActionDialogRequestEnd("pl_Human", "symon"))
	_uState39Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(SYMON)', 1, 4))
	_uState39Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(SYMON)', 1, 4))
	_uState39Trans9 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState39, _uState39, "State_39", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(SYMON)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "symon"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(SYMON)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SYMON)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState39, _uState39, "State_39", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(SYMON)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "symon"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(SYMON)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SYMON)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState39, _uState39, "State_39", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(SYMON)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "symon"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P501_AcceptedToTeachElle', 1, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P501_AcceptToElle', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(SYMON)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SYMON)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState39, _uState39, "State_39", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(SYMON)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "symon"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(SYMON)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SYMON)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState39, _uState39, "State_39", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(SYMON)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "symon"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(SYMON)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SYMON)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState39, _uState39, "State_39", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(SYMON)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "symon"))
	_uEndActions6:AddAction (CScriptActionPlayerSubMoney('pl_Human', 100))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(SYMON)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SYMON)', 1, 4))
	_uEndActions6 = nil

-- TO SELF: EndConversation Actions #7
_uEndActions7 = GdsCreateTransition (_uState39, _uState39, "State_39", "EndActions_7", "Dialog")
	_uEndActions7:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag7(SYMON)', 1, 2))
	_uEndActions7:AddCondition (CScriptConditionDialogStopped("pl_Human", "symon"))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(SYMON)', 0, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SYMON)', 1, 4))
	_uEndActions7 = nil

-- TO SELF: EndConversation Actions #8
_uEndActions8 = GdsCreateTransition (_uState39, _uState39, "State_39", "EndActions_8", "Dialog")
	_uEndActions8:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag8(SYMON)', 1, 2))
	_uEndActions8:AddCondition (CScriptConditionDialogStopped("pl_Human", "symon"))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(SYMON)', 0, 4))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SYMON)', 1, 4))
	_uEndActions8 = nil

-- TO SELF: EndConversation Actions #9
_uEndActions9 = GdsCreateTransition (_uState39, _uState39, "State_39", "EndActions_9", "Dialog")
	_uEndActions9:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag9(SYMON)', 1, 2))
	_uEndActions9:AddCondition (CScriptConditionDialogStopped("pl_Human", "symon"))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(SYMON)', 0, 4))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SYMON)', 1, 4))
	_uEndActions9 = nil

-- TO SELF: EndConversation Actions #10
_uEndActions10 = GdsCreateTransition (_uState39, _uState39, "State_39", "EndActions_10", "Dialog")
	_uEndActions10:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag10(SYMON)', 1, 2))
	_uEndActions10:AddCondition (CScriptConditionDialogStopped("pl_Human", "symon"))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(SYMON)', 0, 4))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SYMON)', 1, 4))
	_uEndActions10 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState39, _uBeginState, "State_39", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(SYMON)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(SYMON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('symon', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(SYMON)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState4 = nil
_uState9 = nil
_uState11 = nil
_uState16 = nil
_uState19 = nil
_uState21 = nil
_uState25 = nil
_uState27 = nil
_uState28 = nil
_uState30 = nil
_uState35 = nil
_uState39 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("symon_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(SYMON)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(SYMON)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[130]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[130]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 130))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[131]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[131]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 131))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[132]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[132]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 132))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[133]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[133]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 133))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[134]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[134]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 134))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[135]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[135]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 135))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[136]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[136]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 136))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[137]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[137]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 137))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[138]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[138]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 138))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[139]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[139]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 139))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[140]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[140]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 140))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[141]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[141]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 141))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[142]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[142]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 142))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[143]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[143]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 143))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[144]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[144]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 144))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[145]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[145]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 145))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[146]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[146]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 146))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[147]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[147]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 147))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[148]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[148]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 148))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[153]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[153]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 153))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[149]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[149]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 149))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[150]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[150]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 150))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[151]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[151]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 151))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[152]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[152]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 152))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'symon'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[154]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[154]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 154))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[155]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[155]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 155))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "symon", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'symon', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
