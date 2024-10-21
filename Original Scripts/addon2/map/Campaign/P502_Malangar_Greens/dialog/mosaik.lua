local _uSM = GdsCreateStateMachine ("mosaik_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState6 = GdsCreateState (_uSM, "State_6")
_uState12 = GdsCreateState (_uSM, "State_12")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(MOSAIK)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(MOSAIK)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('mosaik', 1))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("mosaik", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "mosaik"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MOSAIK)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(MOSAIK)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('mosaik', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("mosaik")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MOSAIK)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MOSAIK)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MOSAIK)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MOSAIK)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(MOSAIK)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MOSAIK)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "mosaik"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('mosaik', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MOSAIK)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState6Trans1 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T1", "Dialog")
	_uState6Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(MOSAIK)', 0, 2))
	_uState6Trans1:AddCondition (CScriptConditionValue('pl_Human', 'av_P502_MosaicOfDeath', 0, 2))
	_uState6Trans1:AddAction (CScriptActionChoice("P502_DLG_MOSAIK_007PC", "(Insert first section.)", 1, 16777215))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MOSAIK)', 1, 4))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MOSAIK)', 1, 4))
	_uState6Trans1 = nil

-- TO STATE: choice
_uState6Trans2 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T2", "Dialog")
	_uState6Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(MOSAIK)', 0, 2))
	_uState6Trans2:AddCondition (CScriptConditionValue('pl_Human', 'av_P502_MosaicOfDeath', 1, 2))
	_uState6Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 93, 1, 1, 1))
	_uState6Trans2:AddAction (CScriptActionChoice("P502_DLG_MOSAIK_009PC", "(Insert second section.)", 2, 16777215))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MOSAIK)', 1, 4))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MOSAIK)', 1, 4))
	_uState6Trans2 = nil

-- TO STATE: choice
_uState6Trans3 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T3", "Dialog")
	_uState6Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(MOSAIK)', 0, 2))
	_uState6Trans3:AddCondition (CScriptConditionValue('pl_Human', 'av_P502_MosaicOfDeath', 2, 2))
	_uState6Trans3:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 94, 1, 1, 1))
	_uState6Trans3:AddAction (CScriptActionChoice("P502_DLG_MOSAIK_011PC", "(Insert third section.)", 3, 16777215))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MOSAIK)', 1, 4))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MOSAIK)', 1, 4))
	_uState6Trans3 = nil

-- TO STATE: choice
_uState6Trans4 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T4", "Dialog")
	_uState6Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(MOSAIK)', 0, 2))
	_uState6Trans4:AddCondition (CScriptConditionValue('pl_Human', 'av_P502_MosaicOfDeath', 3, 2))
	_uState6Trans4:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 95, 1, 1, 1))
	_uState6Trans4:AddAction (CScriptActionChoice("P502_DLG_MOSAIK_013PC", "(Insert last section.)", 4, 16777215))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MOSAIK)', 1, 4))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MOSAIK)', 1, 4))
	_uState6Trans4 = nil

-- TO STATE: choice
_uState6Trans5 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T5", "Dialog")
	_uState6Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(MOSAIK)', 1, 2))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MOSAIK)', 0, 4))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(MOSAIK)', 1, 4))
	_uState6Trans5:AddAction (CScriptActionShowChoices())
	_uState6Trans5 = nil

-- TO STATE: choice
_uState6Trans6 = GdsCreateTransition (_uState1, _uState6, "State_1", "State_6_T6", "Dialog")
	_uState6Trans6:AddCondition (CScriptConditionValue('pl_Human', 'av_P502_MosaicOfDeath', 3, 2))
	_uState6Trans6:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'av_P502_MosaicOfDeath', 0, 2) ))
	_uState6Trans6:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'av_P502_MosaicOfDeath', 1, 2) ))
	_uState6Trans6:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'av_P502_MosaicOfDeath', 2, 2) ))
	_uState6Trans6:AddAction (CScriptActionSay("mosaik", "P502_DLG_MOSAIK_006", "(Three sections of the mosaic have already been inserted.)", 105, 16777215))
	_uState6Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MOSAIK)', 1, 4))
	_uState6Trans6 = nil

-- TO STATE: choice
_uState6Trans7 = GdsCreateTransition (_uState1, _uState6, "State_1", "State_6_T7", "Dialog")
	_uState6Trans7:AddCondition (CScriptConditionValue('pl_Human', 'av_P502_MosaicOfDeath', 0, 2))
	_uState6Trans7:AddAction (CScriptActionSay("mosaik", "P502_DLG_MOSAIK_001", "(An aura of death lies over this place. Whispering voices coming from a strange stone building seem to urge, ask, implore you, as if masses of tormented souls were begging for their freedom.)", 100, 16777215))
	_uState6Trans7:AddAction (CScriptActionSay("mosaik", "P502_DLG_MOSAIK_002", "(A mosaic seems to have covered the floor of this building once.)", 101, 16777215))
	_uState6Trans7:AddAction (CScriptActionSay("mosaik", "P502_DLG_MOSAIK_003", "(It seems to have been shattered by a heavy blow. A part of it lies slightly apart. The other parts cannot be seen.)", 102, 16777215))
	_uState6Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MOSAIK)', 1, 4))
	_uState6Trans7 = nil

-- TO STATE: choice
_uState6Trans8 = GdsCreateTransition (_uState1, _uState6, "State_1", "State_6_T8", "Dialog")
	_uState6Trans8:AddCondition (CScriptConditionValue('pl_Human', 'av_P502_MosaicOfDeath', 1, 2))
	_uState6Trans8:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'av_P502_MosaicOfDeath', 0, 2) ))
	_uState6Trans8:AddAction (CScriptActionSay("mosaik", "P502_DLG_MOSAIK_004", "(One section of the mosaic has already been inserted.)", 103, 16777215))
	_uState6Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MOSAIK)', 1, 4))
	_uState6Trans8 = nil

-- TO STATE: choice
_uState6Trans9 = GdsCreateTransition (_uState1, _uState6, "State_1", "State_6_T9", "Dialog")
	_uState6Trans9:AddCondition (CScriptConditionValue('pl_Human', 'av_P502_MosaicOfDeath', 2, 2))
	_uState6Trans9:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'av_P502_MosaicOfDeath', 0, 2) ))
	_uState6Trans9:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'av_P502_MosaicOfDeath', 1, 2) ))
	_uState6Trans9:AddAction (CScriptActionSay("mosaik", "P502_DLG_MOSAIK_005", "(Two sections of the mosaic have already been inserted.)", 104, 16777215))
	_uState6Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MOSAIK)', 1, 4))
	_uState6Trans9 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "mosaik", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "mosaik"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState6, _uBeginState, "State_6", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "mosaik"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('mosaik', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MOSAIK)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState12Trans1 = GdsCreateTransition (_uState6, _uState12, "State_6", "State_12_T1", "Dialog")
	_uState12Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "mosaik", 1))
	_uState12Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_MOSAIK_007PC", "(Insert first section.)", 99, 16777215))
	_uState12Trans1:AddAction (CScriptActionSay("mosaik", "P502_DLG_MOSAIK_008", "(The voices are getting louder and they are whispering all at the same time. You seem to have freed some imprisoned souls!)", 107, 16777215))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MOSAIK)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MOSAIK)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MOSAIK)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MOSAIK)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('pl_Human', 'av_P502_MosaicOfDeath', 1, 4))
	_uState12Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "mosaik"))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(MOSAIK)', 1, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MOSAIK)', 1, 4))
	_uState12Trans1 = nil

-- TO STATE: endconversation
_uState12Trans2 = GdsCreateTransition (_uState6, _uState12, "State_6", "State_12_T2", "Dialog")
	_uState12Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "mosaik", 2))
	_uState12Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_MOSAIK_009PC", "(Insert second section.)", 99, 16777215))
	_uState12Trans2:AddAction (CScriptActionSay("mosaik", "P502_DLG_MOSAIK_010", "(The voices from underground are getting louder.)", 109, 16777215))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MOSAIK)', 0, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MOSAIK)', 0, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MOSAIK)', 0, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MOSAIK)', 0, 4))
	_uState12Trans2:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 93, 1))
	_uState12Trans2:AddAction (CScriptActionValueModify('pl_Human', 'av_P502_MosaicOfDeath', 2, 4))
	_uState12Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "mosaik"))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(MOSAIK)', 1, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MOSAIK)', 1, 4))
	_uState12Trans2 = nil

-- TO STATE: endconversation
_uState12Trans3 = GdsCreateTransition (_uState6, _uState12, "State_6", "State_12_T3", "Dialog")
	_uState12Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "mosaik", 3))
	_uState12Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_MOSAIK_011PC", "(Insert third section.)", 99, 16777215))
	_uState12Trans3:AddAction (CScriptActionSay("mosaik", "P502_DLG_MOSAIK_012", "(The air starts vibrating.)", 111, 16777215))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MOSAIK)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MOSAIK)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MOSAIK)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MOSAIK)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 94, 1))
	_uState12Trans3:AddAction (CScriptActionValueModify('pl_Human', 'av_P502_MosaicOfDeath', 3, 4))
	_uState12Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "mosaik"))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(MOSAIK)', 1, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MOSAIK)', 1, 4))
	_uState12Trans3 = nil

-- TO STATE: endconversation
_uState12Trans4 = GdsCreateTransition (_uState6, _uState12, "State_6", "State_12_T4", "Dialog")
	_uState12Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "mosaik", 4))
	_uState12Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_MOSAIK_013PC", "(Insert last section.)", 99, 16777215))
	_uState12Trans4:AddAction (CScriptActionSay("mosaik", "P502_DLG_MOSAIK_014", "(The mosaic is complete again! The earth is trembling and the air smells foul...)", 113, 16777215))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MOSAIK)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MOSAIK)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MOSAIK)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MOSAIK)', 0, 4))
	_uState12Trans4:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 95, 1))
	_uState12Trans4:AddAction (CScriptActionValueModify('pl_Human', 'av_P502_MosaicOfDeath', 4, 4))
	_uState12Trans4:AddAction (CScriptActionDialogEnable("mosaik", 0))
	_uState12Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "mosaik"))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(MOSAIK)', 1, 4))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MOSAIK)', 1, 4))
	_uState12Trans4 = nil

-- TO STATE: endconversation
_uState12Trans5 = GdsCreateTransition (_uState1, _uState12, "State_1", "State_12_T5", "Dialog")
	_uState12Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'av_P502_MosaicOfDeath', 0, 2) ))
	_uState12Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'av_P502_MosaicOfDeath', 1, 2) ))
	_uState12Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'av_P502_MosaicOfDeath', 2, 2) ))
	_uState12Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'av_P502_MosaicOfDeath', 3, 2) ))
	_uState12Trans5:AddAction (CScriptActionSay("mosaik", "P502_DLG_MOSAIK_015", "[If you can read this, please report Holger & Steffen. Thanks!]", 114, 16777215))
	_uState12Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "mosaik"))
	_uState12Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(MOSAIK)', 1, 4))
	_uState12Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MOSAIK)', 1, 4))
	_uState12Trans5 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(MOSAIK)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "mosaik"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(MOSAIK)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MOSAIK)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(MOSAIK)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "mosaik"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(MOSAIK)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MOSAIK)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(MOSAIK)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "mosaik"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(MOSAIK)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MOSAIK)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(MOSAIK)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "mosaik"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(MOSAIK)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MOSAIK)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState12, _uState12, "State_12", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(MOSAIK)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "mosaik"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(MOSAIK)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MOSAIK)', 1, 4))
	_uEndActions5 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState12, _uBeginState, "State_12", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(MOSAIK)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MOSAIK)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('mosaik', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MOSAIK)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState6 = nil
_uState12 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("mosaik_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(MOSAIK)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'mosaik'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(MOSAIK)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())

