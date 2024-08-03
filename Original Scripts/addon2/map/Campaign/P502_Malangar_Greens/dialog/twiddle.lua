local _uSM = GdsCreateStateMachine ("twiddle_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState4 = GdsCreateState (_uSM, "State_4")
_uState8 = GdsCreateState (_uSM, "State_8")
_uState12 = GdsCreateState (_uSM, "State_12")
_uState16 = GdsCreateState (_uSM, "State_16")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('twiddle'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(TWIDDLE)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(TWIDDLE)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('twiddle', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "twiddle"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(TWIDDLE)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(TWIDDLE)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('twiddle', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("twiddle")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(TWIDDLE)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(TWIDDLE)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(TWIDDLE)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "twiddle"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('twiddle', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(TWIDDLE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState4Trans1 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T1", "Dialog")
	_uState4Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(TWIDDLE)', 0, 2))
	_uState4Trans1:AddCondition (CScriptConditionValue('', 'mf_P502_CompensatorDialogOver', 0, 2))
	_uState4Trans1:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 419, 1, 1, 1))
	_uState4Trans1:AddAction (CScriptActionChoice("P502_DLG_TWIDDLE_018PC", "Here you are, Professor - the Twiddlium Compensator.", 1, 16777215))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(TWIDDLE)', 1, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE)', 1, 4))
	_uState4Trans1 = nil

-- TO STATE: choice
_uState4Trans2 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T2", "Dialog")
	_uState4Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(TWIDDLE)', 0, 2))
	_uState4Trans2:AddCondition (CScriptConditionValue('', 'mf_P502_ArmyDialogOver', 0, 2))
	_uState4Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'MG_FREESLAVES', 2))
	_uState4Trans2:AddAction (CScriptActionChoice("P502_DLG_TWIDDLE_026PC", "Bad news Professor", 2, 16777215))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(TWIDDLE)', 1, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE)', 1, 4))
	_uState4Trans2 = nil

-- TO STATE: choice
_uState4Trans3 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T3", "Dialog")
	_uState4Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(TWIDDLE)', 1, 2))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE)', 0, 4))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(TWIDDLE)', 1, 4))
	_uState4Trans3:AddAction (CScriptActionShowChoices())
	_uState4Trans3 = nil

-- TO STATE: choice
_uState4Trans4 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T4", "Dialog")
	_uState4Trans4:AddCondition (CScriptConditionOR(CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'MG_FREESLAVES', 2), CScriptConditionValue('', 'mf_P502_ArmyDialogOver', 0, 2)), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 419, 1, 1, 1), CScriptConditionValue('', 'mf_P502_CompensatorDialogOver', 0, 2))))
	_uState4Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P502_FirstTimeDialog', 1, 2), CScriptConditionValue('', 'mf_P502_MG2', 0, 2)) ))
	_uState4Trans4:AddAction (CScriptActionSay("twiddle", "P502_DLG_TWIDDLE_017", "Ah, esteemed colleague!", 116, 16777215))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE)', 1, 4))
	_uState4Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "twiddle"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState4, _uBeginState, "State_4", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "twiddle"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('twiddle', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(TWIDDLE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState8Trans1 = GdsCreateTransition (_uState8, _uState8, "State_8", "State_8_T1", "Dialog")
	_uState8Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(TWIDDLE)', 0, 2))
	_uState8Trans1:AddAction (CScriptActionChoice("P502_DLG_TWIDDLE_035PC", "As ready as I'll ever be.", 1, 16777215))
	_uState8Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(TWIDDLE)', 1, 4))
	_uState8Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE)', 1, 4))
	_uState8Trans1 = nil

-- TO STATE: choice
_uState8Trans2 = GdsCreateTransition (_uState8, _uState8, "State_8", "State_8_T2", "Dialog")
	_uState8Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(TWIDDLE)', 0, 2))
	_uState8Trans2:AddAction (CScriptActionChoice("P502_DLG_TWIDDLE_037PC", "I'm afraid there are one or two more things I need to finish.", 2, 16777215))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(TWIDDLE)', 1, 4))
	_uState8Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE)', 1, 4))
	_uState8Trans2 = nil

-- TO STATE: choice
_uState8Trans3 = GdsCreateTransition (_uState8, _uState8, "State_8", "State_8_T3", "Dialog")
	_uState8Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(TWIDDLE)', 1, 2))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE)', 0, 4))
	_uState8Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(TWIDDLE)', 1, 4))
	_uState8Trans3:AddAction (CScriptActionShowChoices())
	_uState8Trans3 = nil

-- TO STATE: choice
_uState8Trans4 = GdsCreateTransition (_uState1, _uState8, "State_1", "State_8_T4", "Dialog")
	_uState8Trans4:AddCondition (CScriptConditionValue('', 'mf_P502_MG2', 1, 2))
	_uState8Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P502_FirstTimeDialog', 1, 2), CScriptConditionValue('', 'mf_P502_MG2', 0, 2)) ))
	_uState8Trans4:AddCondition (GdsNegateCondition( CScriptConditionOR(CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'MG_FREESLAVES', 2), CScriptConditionValue('', 'mf_P502_ArmyDialogOver', 0, 2)), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 419, 1, 1, 1), CScriptConditionValue('', 'mf_P502_CompensatorDialogOver', 0, 2))) ))
	_uState8Trans4:AddAction (CScriptActionSay("twiddle", "P502_DLG_TWIDDLE_032", "Ah, my friend!", 131, 16777215))
	_uState8Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_TWIDDLE_033PC", "Well, Professor - is everything ready?", 132, 16777215))
	_uState8Trans4:AddAction (CScriptActionSay("twiddle", "P502_DLG_TWIDDLE_034", "Indeed it is.  Are you prepared?", 133, 16777215))
	_uState8Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE)', 1, 4))
	_uState8Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState8, _uState8, "State_8", "State_8", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "twiddle"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState8, _uBeginState, "State_8", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "twiddle"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('twiddle', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(TWIDDLE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState12Trans1 = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12_T1", "Dialog")
	_uState12Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(TWIDDLE)', 0, 2))
	_uState12Trans1:AddCondition (CScriptConditionOR(GdsNegateCondition(CScriptConditionPlayerHasItem('pl_Human', 3, 433, 1, 1, 1)), CScriptConditionOR(GdsNegateCondition(CScriptConditionPlayerHasItem('pl_Human', 3, 434, 1, 1, 1)), CScriptConditionOR(GdsNegateCondition(CScriptConditionPlayerHasItem('pl_Human', 3, 435, 1, 1, 1)), CScriptConditionOR(GdsNegateCondition(CScriptConditionPlayerHasItem('pl_Human', 3, 436, 1, 1, 1)), GdsNegateCondition(CScriptConditionPlayerHasItem('pl_Human', 3, 437, 1, 1, 1)))))))
	_uState12Trans1:AddAction (CScriptActionChoice("P502_DLG_TWIDDLE_040PC", " I'm still looking for those pieces!", 1, 16777215))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(TWIDDLE)', 1, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE)', 1, 4))
	_uState12Trans1 = nil

-- TO STATE: choice
_uState12Trans2 = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12_T2", "Dialog")
	_uState12Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(TWIDDLE)', 0, 2))
	_uState12Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 433, 1, 1, 1))
	_uState12Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 434, 1, 1, 1))
	_uState12Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 435, 1, 1, 1))
	_uState12Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 436, 1, 1, 1))
	_uState12Trans2:AddCondition (CScriptConditionPlayerHasItem('pl_Human', 3, 437, 1, 1, 1))
	_uState12Trans2:AddAction (CScriptActionChoice("P502_DLG_TWIDDLE_041PC", "I can hardly believe it but I finally have all the ingredients for the prism of magic.", 2, 16777215))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(TWIDDLE)', 1, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE)', 1, 4))
	_uState12Trans2 = nil

-- TO STATE: choice
_uState12Trans3 = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12_T3", "Dialog")
	_uState12Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(TWIDDLE)', 1, 2))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(TWIDDLE)', 1, 4))
	_uState12Trans3:AddAction (CScriptActionShowChoices())
	_uState12Trans3 = nil

-- TO STATE: choice
_uState12Trans4 = GdsCreateTransition (_uState1, _uState12, "State_1", "State_12_T4", "Dialog")
	_uState12Trans4:AddCondition (CScriptConditionValue('', 'mf_P502_PrismPieceDelivery', 0, 2))
	_uState12Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P502_FirstTimeDialog', 1, 2), CScriptConditionValue('', 'mf_P502_MG2', 0, 2)) ))
	_uState12Trans4:AddCondition (GdsNegateCondition( CScriptConditionOR(CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'MG_FREESLAVES', 2), CScriptConditionValue('', 'mf_P502_ArmyDialogOver', 0, 2)), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 419, 1, 1, 1), CScriptConditionValue('', 'mf_P502_CompensatorDialogOver', 0, 2))) ))
	_uState12Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P502_MG2', 1, 2) ))
	_uState12Trans4:AddAction (CScriptActionSay("twiddle", "P502_DLG_TWIDDLE_039", "Ah! Comrade!", 138, 16777215))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE)', 1, 4))
	_uState12Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "twiddle"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState12, _uBeginState, "State_12", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "twiddle"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('twiddle', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(TWIDDLE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState16Trans1 = GdsCreateTransition (_uState1, _uState16, "State_1", "State_16_T1", "Dialog")
	_uState16Trans1:AddCondition (CScriptConditionValue('', 'mf_P502_FirstTimeDialog', 1, 2))
	_uState16Trans1:AddCondition (CScriptConditionValue('', 'mf_P502_MG2', 0, 2))
	_uState16Trans1:AddAction (CScriptActionSay("twiddle", "P502_DLG_TWIDDLE_001", "Ah, my valued colleague!", 100, 16777215))
	_uState16Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_TWIDDLE_002PC", "Yes Professor?", 101, 16777215))
	_uState16Trans1:AddAction (CScriptActionSay("twiddle", "P502_DLG_TWIDDLE_003", "I'll need to check the equipment to make sure it's all there and in one piece after this long journey.", 102, 16777215))
	_uState16Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_TWIDDLE_004PC", "And then?", 103, 16777215))
	_uState16Trans1:AddAction (CScriptActionSay("twiddle", "P502_DLG_TWIDDLE_005", "Then, erm, then we'll need to, ahem, look for several additional components.", 104, 16777215))
	_uState16Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_TWIDDLE_006PC", "What components?", 105, 16777215))
	_uState16Trans1:AddAction (CScriptActionSay("twiddle", "P502_DLG_TWIDDLE_007", "We're still missing a Twiddlium Compensator and the Adamantium Collectors.", 106, 16777215))
	_uState16Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_TWIDDLE_008PC", "Let me guess, they're not available with the local merchant?", 107, 16777215))
	_uState16Trans1:AddAction (CScriptActionSay("twiddle", "P502_DLG_TWIDDLE_009", "Well, not quite ... my dwarven friends promised to have the Adamantium Collectors delivered to the mines nearby. The Twiddlium Compensator however...", 108, 16777215))
	_uState16Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_TWIDDLE_010PC", "Yes?", 109, 16777215))
	_uState16Trans1:AddAction (CScriptActionSay("twiddle", "P502_DLG_TWIDDLE_011", "Funny story really...  My old nemesis Doctor Mauser, who was constantly trying to steal my inventions, stole the Twiddlium Compensator years ago.  Luckily, he's dead now... of course he hid the equipment in question.  According to rumour, he hid the artifact here in Malangar Green, in the Necropolis... ", 110, 16777215))
	_uState16Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_TWIDDLE_012PC", "And I suppose it's destiny again, having this Compensator hidden right here in Malangar Greens?", 111, 16777215))
	_uState16Trans1:AddAction (CScriptActionSay("twiddle", "P502_DLG_TWIDDLE_013", "You think?  Perhaps more of a lucky coincidence.", 112, 16777215))
	_uState16Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_TWIDDLE_014PC", "So off we go to this Necropolis!", 113, 16777215))
	_uState16Trans1:AddAction (CScriptActionSay("twiddle", "P502_DLG_TWIDDLE_015", "Wait - I'd like to give you a piece of advice: Mauser was adept at creating the most devious traps. Be very careful!", 114, 16777215))
	_uState16Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_TWIDDLE_016PC", "Thank you Professor  I'll keep that in mind.", 115, 16777215))
	_uState16Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "twiddle"))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(TWIDDLE)', 1, 4))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE)', 1, 4))
	_uState16Trans1 = nil

-- TO STATE: endconversation
_uState16Trans2 = GdsCreateTransition (_uState4, _uState16, "State_4", "State_16_T2", "Dialog")
	_uState16Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 1))
	_uState16Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_TWIDDLE_018PC", "Here you are, Professor - the Twiddlium Compensator.", 99, 16777215))
	_uState16Trans2:AddAction (CScriptActionSay("twiddle", "P502_DLG_TWIDDLE_019", "Phenomenal! Then there are just two more things we need to finish the machine.", 118, 16777215))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(TWIDDLE)', 0, 4))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(TWIDDLE)', 0, 4))
	_uState16Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_TWIDDLE_020PC", "Two? I thought ...", 119, 16777215))
	_uState16Trans2:AddAction (CScriptActionSay("twiddle", "P502_DLG_TWIDDLE_021", "Yes yes, I know that I said 2 before you recovered my Compensator, but that was before I discovered that this moon silver gear had been damaged... must have happened during the escape from Dun Mora. Without this gear, the two geodes will not be able to harmonize correctly.", 120, 16777215))
	_uState16Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_TWIDDLE_022PC", "Can't we just repair it?", 121, 16777215))
	_uState16Trans2:AddAction (CScriptActionSay("twiddle", "P502_DLG_TWIDDLE_023", "No, my friend, that was the finest dwarven smithing. We'd need a Dwarven smith, and a very good one at that, to re-forge the two twisted pieces into one.", 122, 16777215))
	_uState16Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_TWIDDLE_024PC", "How are we supposed to find a good dwarven smith here?", 123, 16777215))
	_uState16Trans2:AddAction (CScriptActionSay("twiddle", "P502_DLG_TWIDDLE_025", "There are Dwarven mines to the South. You might be able to find a smith or two there... or three.", 124, 16777215))
	_uState16Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "twiddle"))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(TWIDDLE)', 1, 4))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE)', 1, 4))
	_uState16Trans2 = nil

-- TO STATE: endconversation
_uState16Trans3 = GdsCreateTransition (_uState4, _uState16, "State_4", "State_16_T3", "Dialog")
	_uState16Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 2))
	_uState16Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_TWIDDLE_026PC", "Bad news Professor", 99, 16777215))
	_uState16Trans3:AddAction (CScriptActionSay("twiddle", "P502_DLG_TWIDDLE_045", "What bad news?", 126, 16777215))
	_uState16Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(TWIDDLE)', 0, 4))
	_uState16Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(TWIDDLE)', 0, 4))
	_uState16Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_TWIDDLE_027PC", "On our way back, we found a large army of Nameless. The invaders are building a huge camp in the Southwest. It's only a matter of time until they find the Elves.", 127, 16777215))
	_uState16Trans3:AddAction (CScriptActionSay("twiddle", "P502_DLG_TWIDDLE_028", "Fire and Brimstone! That means our Adamantium Collectors may have never been delivered here!", 128, 16777215))
	_uState16Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_TWIDDLE_031PC", "I'll assemble the army as long the Elves can defend you and themselves.", 129, 16777215))
	_uState16Trans3:AddAction (CScriptActionSay("twiddle", "P502_DLG_TWIDDLE_030", "I'm sure they'll be able to after Io's speech. Good luck to you, Shaikan.", 130, 16777215))
	_uState16Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "twiddle"))
	_uState16Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(TWIDDLE)', 1, 4))
	_uState16Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE)', 1, 4))
	_uState16Trans3 = nil

-- TO STATE: endconversation
_uState16Trans4 = GdsCreateTransition (_uState8, _uState16, "State_8", "State_16_T4", "Dialog")
	_uState16Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 1))
	_uState16Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_TWIDDLE_035PC", "As ready as I'll ever be.", 99, 16777215))
	_uState16Trans4:AddAction (CScriptActionSay("twiddle", "P502_DLG_TWIDDLE_036", "Then let us begin.", 135, 16777215))
	_uState16Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(TWIDDLE)', 0, 4))
	_uState16Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(TWIDDLE)', 0, 4))
	_uState16Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "twiddle"))
	_uState16Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(TWIDDLE)', 1, 4))
	_uState16Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE)', 1, 4))
	_uState16Trans4 = nil

-- TO STATE: endconversation
_uState16Trans5 = GdsCreateTransition (_uState8, _uState16, "State_8", "State_16_T5", "Dialog")
	_uState16Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 2))
	_uState16Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_TWIDDLE_037PC", "I'm afraid there are one or two more things I need to finish.", 99, 16777215))
	_uState16Trans5:AddAction (CScriptActionSay("twiddle", "P502_DLG_TWIDDLE_038", "Please be quick, our time is short.", 137, 16777215))
	_uState16Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(TWIDDLE)', 0, 4))
	_uState16Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(TWIDDLE)', 0, 4))
	_uState16Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "twiddle"))
	_uState16Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(TWIDDLE)', 1, 4))
	_uState16Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE)', 1, 4))
	_uState16Trans5 = nil

-- TO STATE: endconversation
_uState16Trans6 = GdsCreateTransition (_uState12, _uState16, "State_12", "State_16_T6", "Dialog")
	_uState16Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 1))
	_uState16Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_TWIDDLE_040PC", " I'm still looking for those pieces!", 99, 16777215))
	_uState16Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "twiddle"))
	_uState16Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(TWIDDLE)', 1, 4))
	_uState16Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(TWIDDLE)', 0, 4))
	_uState16Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(TWIDDLE)', 0, 4))
	_uState16Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE)', 1, 4))
	_uState16Trans6 = nil

-- TO STATE: endconversation
_uState16Trans7 = GdsCreateTransition (_uState12, _uState16, "State_12", "State_16_T7", "Dialog")
	_uState16Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 2))
	_uState16Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_TWIDDLE_041PC", "I can hardly believe it but I finally have all the ingredients for the prism of magic.", 99, 16777215))
	_uState16Trans7:AddAction (CScriptActionSay("twiddle", "P502_DLG_TWIDDLE_042", "Congratulations my friend - you can do great things.", 141, 16777215))
	_uState16Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(TWIDDLE)', 0, 4))
	_uState16Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(TWIDDLE)', 0, 4))
	_uState16Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P502_DLG_TWIDDLE_043PC", "So you can make the artifact now?", 142, 16777215))
	_uState16Trans7:AddAction (CScriptActionSay("twiddle", "P502_DLG_TWIDDLE_044", "Already on it, comrade! There you go - the Prism of Magic. It is a powerful artifact. Feel the magic emanating from it.", 143, 16777215))
	_uState16Trans7:AddAction (CScriptActionDialogEnable("twiddle", 0))
	_uState16Trans7:AddAction (CScriptActionDialogRequestEnd("pl_Human", "twiddle"))
	_uState16Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(TWIDDLE)', 1, 4))
	_uState16Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE)', 1, 4))
	_uState16Trans7 = nil

-- TO STATE: endconversation
_uState16Trans8 = GdsCreateTransition (_uState1, _uState16, "State_1", "State_16_T8", "Dialog")
	_uState16Trans8:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P502_FirstTimeDialog', 1, 2), CScriptConditionValue('', 'mf_P502_MG2', 0, 2)) ))
	_uState16Trans8:AddCondition (GdsNegateCondition( CScriptConditionOR(CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'MG_FREESLAVES', 2), CScriptConditionValue('', 'mf_P502_ArmyDialogOver', 0, 2)), CScriptConditionAND(CScriptConditionPlayerHasItem('pl_Human', 3, 419, 1, 1, 1), CScriptConditionValue('', 'mf_P502_CompensatorDialogOver', 0, 2))) ))
	_uState16Trans8:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P502_MG2', 1, 2) ))
	_uState16Trans8:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P502_PrismPieceDelivery', 0, 2) ))
	_uState16Trans8:AddAction (CScriptActionDialogEnable("twiddle", 0))
	_uState16Trans8:AddAction (CScriptActionDialogRequestEnd("pl_Human", "twiddle"))
	_uState16Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(TWIDDLE)', 1, 4))
	_uState16Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(TWIDDLE)', 1, 4))
	_uState16Trans8 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState16, _uState16, "State_16", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(TWIDDLE)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "twiddle"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P502_TwiddleDialogOver', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P502_FirstTimeDialog', 0, 4))
	_uEndActions1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 418, 1))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(TWIDDLE)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(TWIDDLE)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState16, _uState16, "State_16", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(TWIDDLE)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "twiddle"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P502_CompensatorDialogOver', 1, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(TWIDDLE)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(TWIDDLE)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState16, _uState16, "State_16", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(TWIDDLE)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "twiddle"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P502_ArmyDialogOver', 1, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(TWIDDLE)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(TWIDDLE)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState16, _uState16, "State_16", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(TWIDDLE)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "twiddle"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_P502_MG2DialogOver', 1, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(TWIDDLE)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(TWIDDLE)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState16, _uState16, "State_16", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(TWIDDLE)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "twiddle"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(TWIDDLE)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(TWIDDLE)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState16, _uState16, "State_16", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(TWIDDLE)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "twiddle"))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(TWIDDLE)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(TWIDDLE)', 1, 4))
	_uEndActions6 = nil

-- TO SELF: EndConversation Actions #7
_uEndActions7 = GdsCreateTransition (_uState16, _uState16, "State_16", "EndActions_7", "Dialog")
	_uEndActions7:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag7(TWIDDLE)', 1, 2))
	_uEndActions7:AddCondition (CScriptConditionDialogStopped("pl_Human", "twiddle"))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'mf_P502_PrismPieceDelivery', 1, 4))
	_uEndActions7:AddAction (CScriptActionPlayerGiveItem('pl_Human', 1, 1265, 1))
	_uEndActions7:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 434, 1))
	_uEndActions7:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 435, 1))
	_uEndActions7:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 436, 1))
	_uEndActions7:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 437, 1))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(TWIDDLE)', 0, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(TWIDDLE)', 1, 4))
	_uEndActions7 = nil

-- TO SELF: EndConversation Actions #8
_uEndActions8 = GdsCreateTransition (_uState16, _uState16, "State_16", "EndActions_8", "Dialog")
	_uEndActions8:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag8(TWIDDLE)', 1, 2))
	_uEndActions8:AddCondition (CScriptConditionDialogStopped("pl_Human", "twiddle"))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(TWIDDLE)', 0, 4))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(TWIDDLE)', 1, 4))
	_uEndActions8 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState16, _uBeginState, "State_16", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(TWIDDLE)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(TWIDDLE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('twiddle', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(TWIDDLE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState4 = nil
_uState8 = nil
_uState12 = nil
_uState16 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("twiddle_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(TWIDDLE)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'twiddle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(TWIDDLE)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[130]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[130]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 130))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[131]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[131]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 131))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[132]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[132]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 132))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[133]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[133]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 133))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[134]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[134]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 134))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[136]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[136]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 136))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[135]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[135]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 135))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[137]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[137]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 137))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[138]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[138]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 138))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[139]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[139]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 139))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[140]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[140]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 140))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[141]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[141]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 141))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[142]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[142]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 142))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[143]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[143]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 143))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'twiddle'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "twiddle", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'twiddle', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
