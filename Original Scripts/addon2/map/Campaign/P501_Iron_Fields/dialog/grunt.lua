local _uSM = GdsCreateStateMachine ("grunt_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState2 = GdsCreateState (_uSM, "State_2")
_uState5 = GdsCreateState (_uSM, "State_5")
_uState16 = GdsCreateState (_uSM, "State_16")
_uState19 = GdsCreateState (_uSM, "State_19")
_uState27 = GdsCreateState (_uSM, "State_27")
_uState35 = GdsCreateState (_uSM, "State_35")
_uState37 = GdsCreateState (_uSM, "State_37")
_uState39 = GdsCreateState (_uSM, "State_39")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('grunt'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(GRUNT)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(GRUNT)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('grunt', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "grunt"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GRUNT)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(GRUNT)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('grunt', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("grunt")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GRUNT)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GRUNT)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GRUNT)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(GRUNT)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(GRUNT)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(GRUNT)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "grunt"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('grunt', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GRUNT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: if
_uState2Trans1 = GdsCreateTransition (_uState1, _uState2, "State_1", "State_2_T1", "Dialog")
	_uState2Trans1:AddCondition (CScriptConditionQuestState('pl_Human', 'IF_FLINK', 1))
	_uState2Trans1:AddCondition (CScriptConditionValue('', 'mf_P501_TitanCapTalkFinished', 0, 2))
	_uState2Trans1:AddAction (CScriptActionSay("grunt", "P501_DLG_GRUNT_001", "Hallo, Shaikan!", 100, 16777215))
	_uState2Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_GRUNT_002PC", "Master smith, I have here a document, telling me, that one can forge a titancap out of these ingredients: Wolvesleather, tooth of an ogre, arcane connector, fairy stool.", 101, 16777215))
	_uState2Trans1:AddAction (CScriptActionSay("grunt", "P501_DLG_GRUNT_003", "Show me that, kid. Pause Hm, yeah, should be possible, although its very strange ingredients", 102, 16777215))
	_uState2Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState2Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "grunt"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState2, _uBeginState, "State_2", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "grunt"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('grunt', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GRUNT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState5Trans1 = GdsCreateTransition (_uState1, _uState5, "State_1", "State_5_T1", "Dialog")
	_uState5Trans1:AddCondition (CScriptConditionValue('', 'mf_P501_FlinkDealDone', 1, 2))
	_uState5Trans1:AddCondition (CScriptConditionValue('', 'mf_P501_TitanCapTalkQuestDone', 0, 2))
	_uState5Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IF_FLINK', 1), CScriptConditionValue('', 'mf_P501_TitanCapTalkFinished', 0, 2)) ))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState5Trans1 = nil

-- TO STATE: elseif
_uState5Trans2 = GdsCreateTransition (_uState2, _uState5, "State_2", "State_5_T2", "Dialog")
	_uState5Trans2:AddCondition (CScriptConditionValue('', 'mf_P501_FlinkDealDone', 1, 2))
	_uState5Trans2:AddCondition (CScriptConditionValue('', 'mf_P501_TitanCapTalkQuestDone', 0, 2))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState5Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "grunt"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState5, _uBeginState, "State_5", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "grunt"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('grunt', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GRUNT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState16Trans1 = GdsCreateTransition (_uState1, _uState16, "State_1", "State_16_T1", "Dialog")
	_uState16Trans1:AddCondition (CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption1Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption2Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption3Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption4Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption5Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption6Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption7Chosen', 0, 2), CScriptConditionValue('', 'mf_P501_GruntOption8Chosen', 0, 2)))))))))
	_uState16Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IF_FLINK', 1), CScriptConditionValue('', 'mf_P501_TitanCapTalkFinished', 0, 2)) ))
	_uState16Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P501_FlinkDealDone', 1, 2), CScriptConditionValue('', 'mf_P501_TitanCapTalkQuestDone', 0, 2)) ))
	_uState16Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_FirstTimeTalked', 0, 2) ))
	_uState16Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients1', 1, 2) ))
	_uState16Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients2', 1, 2) ))
	_uState16Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients3', 1, 2) ))
	_uState16Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients4', 1, 2) ))
	_uState16Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients5', 1, 2) ))
	_uState16Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients6', 1, 2) ))
	_uState16Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients7', 1, 2) ))
	_uState16Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients8', 1, 2) ))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState16Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState16, _uState16, "State_16", "State_16", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "grunt"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState16, _uBeginState, "State_16", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "grunt"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('grunt', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GRUNT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState19Trans1 = GdsCreateTransition (_uState19, _uState19, "State_19", "State_19_T1", "Dialog")
	_uState19Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(GRUNT)', 0, 2))
	_uState19Trans1:AddCondition (CScriptConditionValue('', 'mf_P501_GruntOption1Chosen', 0, 2))
	_uState19Trans1:AddAction (CScriptActionChoice("P501_DLG_GRUNT_016PC", "A bow.", 1, 16777215))
	_uState19Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GRUNT)', 1, 4))
	_uState19Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState19Trans1 = nil

-- TO STATE: choice
_uState19Trans2 = GdsCreateTransition (_uState19, _uState19, "State_19", "State_19_T2", "Dialog")
	_uState19Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(GRUNT)', 0, 2))
	_uState19Trans2:AddCondition (CScriptConditionValue('', 'mf_P501_GruntOption2Chosen', 0, 2))
	_uState19Trans2:AddAction (CScriptActionChoice("P501_DLG_GRUNT_018PC", "A twohanded sword.", 2, 16777215))
	_uState19Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GRUNT)', 1, 4))
	_uState19Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState19Trans2 = nil

-- TO STATE: choice
_uState19Trans3 = GdsCreateTransition (_uState19, _uState19, "State_19", "State_19_T3", "Dialog")
	_uState19Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(GRUNT)', 0, 2))
	_uState19Trans3:AddCondition (CScriptConditionValue('', 'mf_P501_GruntOption3Chosen', 0, 2))
	_uState19Trans3:AddAction (CScriptActionChoice("P501_DLG_GRUNT_020PC", "A set of dual wield daggers.", 3, 16777215))
	_uState19Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GRUNT)', 1, 4))
	_uState19Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState19Trans3 = nil

-- TO STATE: choice
_uState19Trans4 = GdsCreateTransition (_uState19, _uState19, "State_19", "State_19_T4", "Dialog")
	_uState19Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(GRUNT)', 0, 2))
	_uState19Trans4:AddCondition (CScriptConditionValue('', 'mf_P501_GruntOption4Chosen', 0, 2))
	_uState19Trans4:AddAction (CScriptActionChoice("P501_DLG_GRUNT_022PC", "A sword and shield for a heavy fighter.", 4, 16777215))
	_uState19Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(GRUNT)', 1, 4))
	_uState19Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState19Trans4 = nil

-- TO STATE: choice
_uState19Trans5 = GdsCreateTransition (_uState19, _uState19, "State_19", "State_19_T5", "Dialog")
	_uState19Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(GRUNT)', 0, 2))
	_uState19Trans5:AddCondition (CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption5Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption6Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption7Chosen', 0, 2), CScriptConditionValue('', 'mf_P501_GruntOption8Chosen', 0, 2)))))
	_uState19Trans5:AddAction (CScriptActionChoice("P501_DLG_GRUNT_024PC", "More...", 5, 16777215))
	_uState19Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(GRUNT)', 1, 4))
	_uState19Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState19Trans5 = nil

-- TO STATE: choice
_uState19Trans6 = GdsCreateTransition (_uState19, _uState19, "State_19", "State_19_T6", "Dialog")
	_uState19Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 2))
	_uState19Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 0, 4))
	_uState19Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(GRUNT)', 1, 4))
	_uState19Trans6:AddAction (CScriptActionShowChoices())
	_uState19Trans6 = nil

-- TO STATE: choice
_uState19Trans7 = GdsCreateTransition (_uState16, _uState19, "State_16", "State_19_T7", "Dialog")
	_uState19Trans7:AddCondition (CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption1Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption2Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption3Chosen', 0, 2), CScriptConditionValue('', 'mf_P501_GruntOption4Chosen', 0, 2)))))
	_uState19Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState19Trans7 = nil

-- TO STATE: choice
_uState19Trans8 = GdsCreateTransition (_uState1, _uState19, "State_1", "State_19_T8", "Dialog")
	_uState19Trans8:AddCondition (CScriptConditionValue('', 'mf_P501_FirstTimeTalked', 0, 2))
	_uState19Trans8:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IF_FLINK', 1), CScriptConditionValue('', 'mf_P501_TitanCapTalkFinished', 0, 2)) ))
	_uState19Trans8:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P501_FlinkDealDone', 1, 2), CScriptConditionValue('', 'mf_P501_TitanCapTalkQuestDone', 0, 2)) ))
	_uState19Trans8:AddAction (CScriptActionSay("grunt", "P501_DLG_GRUNT_007", "Hello Shaikan!", 106, 16777215))
	_uState19Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_GRUNT_008PC", "A dwarf in Iron Fields?", 107, 16777215))
	_uState19Trans8:AddAction (CScriptActionSay("grunt", "P501_DLG_GRUNT_009", "Don't you make fun of me, lad! I was here with a delivery of moonsilver when the portal to Norimar failed. So I had the choice - stay here or travel on through the only active portal to the Needle.", 108, 16777215))
	_uState19Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_GRUNT_010PC", "Why didn't you go?", 109, 16777215))
	_uState19Trans8:AddAction (CScriptActionSay("grunt", "P501_DLG_GRUNT_011", "Hah! And then be stuck with the Orcs? No lad, I'd rather walk barefoot through the icewaste of Shalibar than having to eat Orc-grub for months on end!", 110, 16777215))
	_uState19Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_GRUNT_012PC", "And it doesn't hurt that your making a fortune making the Realms's smiths look bad?", 111, 16777215))
	_uState19Trans8:AddAction (CScriptActionSay("grunt", "P501_DLG_GRUNT_013", "You betcha! But its getting boring to always forge the same swords and armor for the Realm's soldiers. There's no challenge in it.", 112, 16777215))
	_uState19Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_GRUNT_014PC", "Well if you're looking for a challenge, I'd be happy to collect the ingredients you need... In exchange for the items of course.", 113, 16777215))
	_uState19Trans8:AddAction (CScriptActionSay("grunt", "P501_DLG_GRUNT_015", "You're tough lad, but I am bored.  I've got a few ideas you might be interested in. Just tell me what you want to try and I'll tell you the necessary ingredients.", 114, 16777215))
	_uState19Trans8:AddAction (CScriptActionValueModify('', 'mf_P501_FirstTimeTalked', 1, 4))
	_uState19Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState19Trans8 = nil

-- TO STATE: choice
_uState19Trans9 = GdsCreateTransition (_uState27, _uState19, "State_27", "State_19_T9", "Dialog")
	_uState19Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 1))
	_uState19Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_GRUNT_025PC", "Previous...", 99, 16777215))
	_uState19Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GRUNT)', 0, 4))
	_uState19Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GRUNT)', 0, 4))
	_uState19Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GRUNT)', 0, 4))
	_uState19Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(GRUNT)', 0, 4))
	_uState19Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(GRUNT)', 0, 4))
	_uState19Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState19Trans9 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState19, _uState19, "State_19", "State_19", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "grunt"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState19, _uBeginState, "State_19", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "grunt"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('grunt', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GRUNT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState27Trans1 = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27_T1", "Dialog")
	_uState27Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(GRUNT)', 0, 2))
	_uState27Trans1:AddCondition (CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption1Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption2Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption3Chosen', 0, 2), CScriptConditionValue('', 'mf_P501_GruntOption4Chosen', 0, 2)))))
	_uState27Trans1:AddAction (CScriptActionChoice("P501_DLG_GRUNT_025PC", "Previous...", 1, 16777215))
	_uState27Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GRUNT)', 1, 4))
	_uState27Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState27Trans1 = nil

-- TO STATE: choice
_uState27Trans2 = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27_T2", "Dialog")
	_uState27Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(GRUNT)', 0, 2))
	_uState27Trans2:AddCondition (CScriptConditionValue('', 'mf_P501_GruntOption5Chosen', 0, 2))
	_uState27Trans2:AddAction (CScriptActionChoice("P501_DLG_GRUNT_026PC", "A warhammer.", 2, 16777215))
	_uState27Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GRUNT)', 1, 4))
	_uState27Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState27Trans2 = nil

-- TO STATE: choice
_uState27Trans3 = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27_T3", "Dialog")
	_uState27Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(GRUNT)', 0, 2))
	_uState27Trans3:AddCondition (CScriptConditionValue('', 'mf_P501_GruntOption6Chosen', 0, 2))
	_uState27Trans3:AddAction (CScriptActionChoice("P501_DLG_GRUNT_028PC", "A magic staff for bloodtransformation and dark mages.", 3, 16777215))
	_uState27Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GRUNT)', 1, 4))
	_uState27Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState27Trans3 = nil

-- TO STATE: choice
_uState27Trans4 = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27_T4", "Dialog")
	_uState27Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(GRUNT)', 0, 2))
	_uState27Trans4:AddCondition (CScriptConditionValue('', 'mf_P501_GruntOption7Chosen', 0, 2))
	_uState27Trans4:AddAction (CScriptActionChoice("P501_DLG_GRUNT_030PC", "A magic staff for bloodconjuration and mental mages.", 4, 16777215))
	_uState27Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(GRUNT)', 1, 4))
	_uState27Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState27Trans4 = nil

-- TO STATE: choice
_uState27Trans5 = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27_T5", "Dialog")
	_uState27Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(GRUNT)', 0, 2))
	_uState27Trans5:AddCondition (CScriptConditionValue('', 'mf_P501_GruntOption8Chosen', 0, 2))
	_uState27Trans5:AddAction (CScriptActionChoice("P501_DLG_GRUNT_032PC", "A crossbow.", 5, 16777215))
	_uState27Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(GRUNT)', 1, 4))
	_uState27Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState27Trans5 = nil

-- TO STATE: choice
_uState27Trans6 = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27_T6", "Dialog")
	_uState27Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 2))
	_uState27Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 0, 4))
	_uState27Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(GRUNT)', 1, 4))
	_uState27Trans6:AddAction (CScriptActionShowChoices())
	_uState27Trans6 = nil

-- TO STATE: choice
_uState27Trans7 = GdsCreateTransition (_uState16, _uState27, "State_16", "State_27_T7", "Dialog")
	_uState27Trans7:AddCondition (CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption5Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption6Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption7Chosen', 0, 2), CScriptConditionValue('', 'mf_P501_GruntOption8Chosen', 0, 2)))))
	_uState27Trans7:AddCondition (GdsNegateCondition( CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption1Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption2Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption3Chosen', 0, 2), CScriptConditionValue('', 'mf_P501_GruntOption4Chosen', 0, 2)))) ))
	_uState27Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState27Trans7 = nil

-- TO STATE: choice
_uState27Trans8 = GdsCreateTransition (_uState19, _uState27, "State_19", "State_27_T8", "Dialog")
	_uState27Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 5))
	_uState27Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_GRUNT_024PC", "More...", 99, 16777215))
	_uState27Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GRUNT)', 0, 4))
	_uState27Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GRUNT)', 0, 4))
	_uState27Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GRUNT)', 0, 4))
	_uState27Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(GRUNT)', 0, 4))
	_uState27Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(GRUNT)', 0, 4))
	_uState27Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState27Trans8 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "grunt"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState27, _uBeginState, "State_27", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "grunt"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('grunt', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GRUNT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState35Trans1 = GdsCreateTransition (_uState1, _uState35, "State_1", "State_35_T1", "Dialog")
	_uState35Trans1:AddCondition (CScriptConditionValue('', 'mf_P501_MakeItems', 1, 2))
	_uState35Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IF_FLINK', 1), CScriptConditionValue('', 'mf_P501_TitanCapTalkFinished', 0, 2)) ))
	_uState35Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P501_FlinkDealDone', 1, 2), CScriptConditionValue('', 'mf_P501_TitanCapTalkQuestDone', 0, 2)) ))
	_uState35Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_FirstTimeTalked', 0, 2) ))
	_uState35Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients1', 1, 2) ))
	_uState35Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients2', 1, 2) ))
	_uState35Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients3', 1, 2) ))
	_uState35Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients4', 1, 2) ))
	_uState35Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients5', 1, 2) ))
	_uState35Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients6', 1, 2) ))
	_uState35Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients7', 1, 2) ))
	_uState35Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients8', 1, 2) ))
	_uState35Trans1:AddCondition (GdsNegateCondition( CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption1Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption2Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption3Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption4Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption5Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption6Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption7Chosen', 0, 2), CScriptConditionValue('', 'mf_P501_GruntOption8Chosen', 0, 2)))))))) ))
	_uState35Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P501_SmithGiveItem1', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P501_SmithGiveItem2', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P501_SmithGiveItem3', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P501_SmithGiveItem4', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P501_SmithGiveItem5', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P501_SmithGiveItem6', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P501_SmithGiveItem7', 1, 2), CScriptConditionValue('', 'mf_P501_SmithGiveItem8', 1, 2)))))))) ))
	_uState35Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState35Trans1 = nil

-- TO STATE: elseif
_uState35Trans2 = GdsCreateTransition (_uState1, _uState35, "State_1", "State_35_T2", "Dialog")
	_uState35Trans2:AddCondition (CScriptConditionValue('', 'mf_P501_HasIngredients1', 1, 2))
	_uState35Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IF_FLINK', 1), CScriptConditionValue('', 'mf_P501_TitanCapTalkFinished', 0, 2)) ))
	_uState35Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P501_FlinkDealDone', 1, 2), CScriptConditionValue('', 'mf_P501_TitanCapTalkQuestDone', 0, 2)) ))
	_uState35Trans2:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_FirstTimeTalked', 0, 2) ))
	_uState35Trans2:AddAction (CScriptActionValueModify('', 'mf_P501_SmithGiveItem1', 1, 4))
	_uState35Trans2:AddAction (CScriptActionValueModify('', 'mf_P501_HasIngredients1', 0, 4))
	_uState35Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState35Trans2 = nil

-- TO STATE: elseif
_uState35Trans3 = GdsCreateTransition (_uState1, _uState35, "State_1", "State_35_T3", "Dialog")
	_uState35Trans3:AddCondition (CScriptConditionValue('', 'mf_P501_HasIngredients2', 1, 2))
	_uState35Trans3:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IF_FLINK', 1), CScriptConditionValue('', 'mf_P501_TitanCapTalkFinished', 0, 2)) ))
	_uState35Trans3:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P501_FlinkDealDone', 1, 2), CScriptConditionValue('', 'mf_P501_TitanCapTalkQuestDone', 0, 2)) ))
	_uState35Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_FirstTimeTalked', 0, 2) ))
	_uState35Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients1', 1, 2) ))
	_uState35Trans3:AddAction (CScriptActionValueModify('', 'mf_P501_SmithGiveItem2', 1, 4))
	_uState35Trans3:AddAction (CScriptActionValueModify('', 'mf_P501_HasIngredients2', 0, 4))
	_uState35Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState35Trans3 = nil

-- TO STATE: elseif
_uState35Trans4 = GdsCreateTransition (_uState1, _uState35, "State_1", "State_35_T4", "Dialog")
	_uState35Trans4:AddCondition (CScriptConditionValue('', 'mf_P501_HasIngredients3', 1, 2))
	_uState35Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IF_FLINK', 1), CScriptConditionValue('', 'mf_P501_TitanCapTalkFinished', 0, 2)) ))
	_uState35Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P501_FlinkDealDone', 1, 2), CScriptConditionValue('', 'mf_P501_TitanCapTalkQuestDone', 0, 2)) ))
	_uState35Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_FirstTimeTalked', 0, 2) ))
	_uState35Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients1', 1, 2) ))
	_uState35Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients2', 1, 2) ))
	_uState35Trans4:AddAction (CScriptActionValueModify('', 'mf_P501_SmithGiveItem3', 1, 4))
	_uState35Trans4:AddAction (CScriptActionValueModify('', 'mf_P501_HasIngredients3', 0, 4))
	_uState35Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState35Trans4 = nil

-- TO STATE: elseif
_uState35Trans5 = GdsCreateTransition (_uState1, _uState35, "State_1", "State_35_T5", "Dialog")
	_uState35Trans5:AddCondition (CScriptConditionValue('', 'mf_P501_HasIngredients4', 1, 2))
	_uState35Trans5:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IF_FLINK', 1), CScriptConditionValue('', 'mf_P501_TitanCapTalkFinished', 0, 2)) ))
	_uState35Trans5:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P501_FlinkDealDone', 1, 2), CScriptConditionValue('', 'mf_P501_TitanCapTalkQuestDone', 0, 2)) ))
	_uState35Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_FirstTimeTalked', 0, 2) ))
	_uState35Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients1', 1, 2) ))
	_uState35Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients2', 1, 2) ))
	_uState35Trans5:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients3', 1, 2) ))
	_uState35Trans5:AddAction (CScriptActionValueModify('', 'mf_P501_SmithGiveItem4', 1, 4))
	_uState35Trans5:AddAction (CScriptActionValueModify('', 'mf_P501_HasIngredients4', 0, 4))
	_uState35Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState35Trans5 = nil

-- TO STATE: elseif
_uState35Trans6 = GdsCreateTransition (_uState1, _uState35, "State_1", "State_35_T6", "Dialog")
	_uState35Trans6:AddCondition (CScriptConditionValue('', 'mf_P501_HasIngredients5', 1, 2))
	_uState35Trans6:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IF_FLINK', 1), CScriptConditionValue('', 'mf_P501_TitanCapTalkFinished', 0, 2)) ))
	_uState35Trans6:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P501_FlinkDealDone', 1, 2), CScriptConditionValue('', 'mf_P501_TitanCapTalkQuestDone', 0, 2)) ))
	_uState35Trans6:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_FirstTimeTalked', 0, 2) ))
	_uState35Trans6:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients1', 1, 2) ))
	_uState35Trans6:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients2', 1, 2) ))
	_uState35Trans6:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients3', 1, 2) ))
	_uState35Trans6:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients4', 1, 2) ))
	_uState35Trans6:AddAction (CScriptActionValueModify('', 'mf_P501_SmithGiveItem5', 1, 4))
	_uState35Trans6:AddAction (CScriptActionValueModify('', 'mf_P501_HasIngredients5', 0, 4))
	_uState35Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState35Trans6 = nil

-- TO STATE: elseif
_uState35Trans7 = GdsCreateTransition (_uState1, _uState35, "State_1", "State_35_T7", "Dialog")
	_uState35Trans7:AddCondition (CScriptConditionValue('', 'mf_P501_HasIngredients6', 1, 2))
	_uState35Trans7:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IF_FLINK', 1), CScriptConditionValue('', 'mf_P501_TitanCapTalkFinished', 0, 2)) ))
	_uState35Trans7:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P501_FlinkDealDone', 1, 2), CScriptConditionValue('', 'mf_P501_TitanCapTalkQuestDone', 0, 2)) ))
	_uState35Trans7:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_FirstTimeTalked', 0, 2) ))
	_uState35Trans7:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients1', 1, 2) ))
	_uState35Trans7:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients2', 1, 2) ))
	_uState35Trans7:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients3', 1, 2) ))
	_uState35Trans7:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients4', 1, 2) ))
	_uState35Trans7:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients5', 1, 2) ))
	_uState35Trans7:AddAction (CScriptActionValueModify('', 'mf_P501_SmithGiveItem6', 1, 4))
	_uState35Trans7:AddAction (CScriptActionValueModify('', 'mf_P501_HasIngredients6', 0, 4))
	_uState35Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState35Trans7 = nil

-- TO STATE: elseif
_uState35Trans8 = GdsCreateTransition (_uState1, _uState35, "State_1", "State_35_T8", "Dialog")
	_uState35Trans8:AddCondition (CScriptConditionValue('', 'mf_P501_HasIngredients7', 1, 2))
	_uState35Trans8:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IF_FLINK', 1), CScriptConditionValue('', 'mf_P501_TitanCapTalkFinished', 0, 2)) ))
	_uState35Trans8:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P501_FlinkDealDone', 1, 2), CScriptConditionValue('', 'mf_P501_TitanCapTalkQuestDone', 0, 2)) ))
	_uState35Trans8:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_FirstTimeTalked', 0, 2) ))
	_uState35Trans8:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients1', 1, 2) ))
	_uState35Trans8:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients2', 1, 2) ))
	_uState35Trans8:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients3', 1, 2) ))
	_uState35Trans8:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients4', 1, 2) ))
	_uState35Trans8:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients5', 1, 2) ))
	_uState35Trans8:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients6', 1, 2) ))
	_uState35Trans8:AddAction (CScriptActionValueModify('', 'mf_P501_SmithGiveItem7', 1, 4))
	_uState35Trans8:AddAction (CScriptActionValueModify('', 'mf_P501_HasIngredients7', 0, 4))
	_uState35Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState35Trans8 = nil

-- TO STATE: elseif
_uState35Trans9 = GdsCreateTransition (_uState1, _uState35, "State_1", "State_35_T9", "Dialog")
	_uState35Trans9:AddCondition (CScriptConditionValue('', 'mf_P501_HasIngredients8', 1, 2))
	_uState35Trans9:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IF_FLINK', 1), CScriptConditionValue('', 'mf_P501_TitanCapTalkFinished', 0, 2)) ))
	_uState35Trans9:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P501_FlinkDealDone', 1, 2), CScriptConditionValue('', 'mf_P501_TitanCapTalkQuestDone', 0, 2)) ))
	_uState35Trans9:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_FirstTimeTalked', 0, 2) ))
	_uState35Trans9:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients1', 1, 2) ))
	_uState35Trans9:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients2', 1, 2) ))
	_uState35Trans9:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients3', 1, 2) ))
	_uState35Trans9:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients4', 1, 2) ))
	_uState35Trans9:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients5', 1, 2) ))
	_uState35Trans9:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients6', 1, 2) ))
	_uState35Trans9:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients7', 1, 2) ))
	_uState35Trans9:AddAction (CScriptActionValueModify('', 'mf_P501_SmithGiveItem8', 1, 4))
	_uState35Trans9:AddAction (CScriptActionValueModify('', 'mf_P501_HasIngredients8', 0, 4))
	_uState35Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState35Trans9 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState35, _uState35, "State_35", "State_35", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "grunt"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState35, _uBeginState, "State_35", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "grunt"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('grunt', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GRUNT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: else
_uState37Trans1 = GdsCreateTransition (_uState1, _uState37, "State_1", "State_37_T1", "Dialog")
	_uState37Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IF_FLINK', 1), CScriptConditionValue('', 'mf_P501_TitanCapTalkFinished', 0, 2)) ))
	_uState37Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P501_FlinkDealDone', 1, 2), CScriptConditionValue('', 'mf_P501_TitanCapTalkQuestDone', 0, 2)) ))
	_uState37Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_FirstTimeTalked', 0, 2) ))
	_uState37Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients1', 1, 2) ))
	_uState37Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients2', 1, 2) ))
	_uState37Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients3', 1, 2) ))
	_uState37Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients4', 1, 2) ))
	_uState37Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients5', 1, 2) ))
	_uState37Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients6', 1, 2) ))
	_uState37Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients7', 1, 2) ))
	_uState37Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients8', 1, 2) ))
	_uState37Trans1:AddCondition (GdsNegateCondition( CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption1Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption2Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption3Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption4Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption5Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption6Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption7Chosen', 0, 2), CScriptConditionValue('', 'mf_P501_GruntOption8Chosen', 0, 2)))))))) ))
	_uState37Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P501_SmithGiveItem1', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P501_SmithGiveItem2', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P501_SmithGiveItem3', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P501_SmithGiveItem4', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P501_SmithGiveItem5', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P501_SmithGiveItem6', 1, 2), CScriptConditionAND(CScriptConditionValue('', 'mf_P501_SmithGiveItem7', 1, 2), CScriptConditionValue('', 'mf_P501_SmithGiveItem8', 1, 2)))))))) ))
	_uState37Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_MakeItems', 1, 2) ))
	_uState37Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState37Trans1 = nil

-- TO STATE: else
_uState37Trans2 = GdsCreateTransition (_uState2, _uState37, "State_2", "State_37_T2", "Dialog")
	_uState37Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P501_FlinkDealDone', 1, 2), CScriptConditionValue('', 'mf_P501_TitanCapTalkQuestDone', 0, 2)) ))
	_uState37Trans2:AddAction (CScriptActionValueModify('', 'mf_P501_TitanCapTalkFinished', 1, 4))
	_uState37Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState37Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState37, _uState37, "State_37", "State_37", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "grunt"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState37, _uBeginState, "State_37", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "grunt"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('grunt', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GRUNT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState39Trans1 = GdsCreateTransition (_uState5, _uState39, "State_5", "State_39_T1", "Dialog")
	_uState39Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_GRUNT_004PC", "Here are the ingredients.", 103, 16777215))
	_uState39Trans1:AddAction (CScriptActionSay("grunt", "P501_DLG_GRUNT_005", "And here is your 'mighty' Titancap.", 104, 16777215))
	_uState39Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_GRUNT_006PC", "FLINK!!!", 105, 16777215))
	_uState39Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "grunt"))
	_uState39Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(GRUNT)', 1, 4))
	_uState39Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState39Trans1 = nil

-- TO STATE: endconversation
_uState39Trans2 = GdsCreateTransition (_uState19, _uState39, "State_19", "State_39_T2", "Dialog")
	_uState39Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 1))
	_uState39Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_GRUNT_016PC", "A bow.", 99, 16777215))
	_uState39Trans2:AddAction (CScriptActionSay("grunt", "P501_DLG_GRUNT_017", "In this bow the fire of passion is burning, that's where it got its name. For this weapon I need the following ingredients: A bar of pure moonsilver, sinew from a drakeling and a fire ruby. Come back when you have all the ingredients.", 116, 16777215))
	_uState39Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GRUNT)', 0, 4))
	_uState39Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GRUNT)', 0, 4))
	_uState39Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GRUNT)', 0, 4))
	_uState39Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(GRUNT)', 0, 4))
	_uState39Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(GRUNT)', 0, 4))
	_uState39Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "grunt"))
	_uState39Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(GRUNT)', 1, 4))
	_uState39Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState39Trans2 = nil

-- TO STATE: endconversation
_uState39Trans3 = GdsCreateTransition (_uState19, _uState39, "State_19", "State_39_T3", "Dialog")
	_uState39Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 2))
	_uState39Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_GRUNT_018PC", "A twohanded sword.", 99, 16777215))
	_uState39Trans3:AddAction (CScriptActionSay("grunt", "P501_DLG_GRUNT_019", "Ah, a formidable blade, I call it Retribution. It will cut through your enemies like no weapon you have used before. For this weapon I need: Iridiumore, Holy water and the blood of a dead innocent.  Come back when you have all the ingredients.", 118, 16777215))
	_uState39Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GRUNT)', 0, 4))
	_uState39Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GRUNT)', 0, 4))
	_uState39Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GRUNT)', 0, 4))
	_uState39Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(GRUNT)', 0, 4))
	_uState39Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(GRUNT)', 0, 4))
	_uState39Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "grunt"))
	_uState39Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(GRUNT)', 1, 4))
	_uState39Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState39Trans3 = nil

-- TO STATE: endconversation
_uState39Trans4 = GdsCreateTransition (_uState19, _uState39, "State_19", "State_39_T4", "Dialog")
	_uState39Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 3))
	_uState39Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_GRUNT_020PC", "A set of dual wield daggers.", 99, 16777215))
	_uState39Trans4:AddAction (CScriptActionSay("grunt", "P501_DLG_GRUNT_021", "Ah, Mercy and Peace. Deadly daggers when used alone but even more so, when used together. For this set I need: two magnetstones, the poison of a spider and a poisonous mushroom. Come back when you have all the ingredients.", 120, 16777215))
	_uState39Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GRUNT)', 0, 4))
	_uState39Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GRUNT)', 0, 4))
	_uState39Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GRUNT)', 0, 4))
	_uState39Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(GRUNT)', 0, 4))
	_uState39Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(GRUNT)', 0, 4))
	_uState39Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "grunt"))
	_uState39Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(GRUNT)', 1, 4))
	_uState39Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState39Trans4 = nil

-- TO STATE: endconversation
_uState39Trans5 = GdsCreateTransition (_uState19, _uState39, "State_19", "State_39_T5", "Dialog")
	_uState39Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 4))
	_uState39Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_GRUNT_022PC", "A sword and shield for a heavy fighter.", 99, 16777215))
	_uState39Trans5:AddAction (CScriptActionSay("grunt", "P501_DLG_GRUNT_023", "This is my favourite, a set called the Rage of the Hallits! I learned about it from my  good friend Skarvig in Windholme. You'll need the following materials: a bar of adamantinum - preferrably from Stoneblade mountain, a bar of Iron - preferrably from the mines near Windholme. The essence of an undead, the essence of an ice elemental and something very rare - araifrost. Come back when you have all the ingredients.", 122, 16777215))
	_uState39Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GRUNT)', 0, 4))
	_uState39Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GRUNT)', 0, 4))
	_uState39Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GRUNT)', 0, 4))
	_uState39Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(GRUNT)', 0, 4))
	_uState39Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(GRUNT)', 0, 4))
	_uState39Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "grunt"))
	_uState39Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(GRUNT)', 1, 4))
	_uState39Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState39Trans5 = nil

-- TO STATE: endconversation
_uState39Trans6 = GdsCreateTransition (_uState27, _uState39, "State_27", "State_39_T6", "Dialog")
	_uState39Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 2))
	_uState39Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_GRUNT_026PC", "A warhammer.", 99, 16777215))
	_uState39Trans6:AddAction (CScriptActionSay("grunt", "P501_DLG_GRUNT_027", "This warhammer will crush your enemies and their buildings like a veritable earthquake. To forge it I need: The essence of an earth elemental, a haft of Vulcan steel and the remains of a destroyed building. Come back when you have all the ingredients.", 126, 16777215))
	_uState39Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GRUNT)', 0, 4))
	_uState39Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GRUNT)', 0, 4))
	_uState39Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GRUNT)', 0, 4))
	_uState39Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(GRUNT)', 0, 4))
	_uState39Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(GRUNT)', 0, 4))
	_uState39Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "grunt"))
	_uState39Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(GRUNT)', 1, 4))
	_uState39Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState39Trans6 = nil

-- TO STATE: endconversation
_uState39Trans7 = GdsCreateTransition (_uState27, _uState39, "State_27", "State_39_T7", "Dialog")
	_uState39Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 3))
	_uState39Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_GRUNT_028PC", "A magic staff for bloodtransformation and dark mages.", 99, 16777215))
	_uState39Trans7:AddAction (CScriptActionSay("grunt", "P501_DLG_GRUNT_029", "A mage staff called Dragonscurse, and that it will surely be. Bring me: the skull of a dragon and a vial of your Shaikan blood and I can forge it for you. Come back when you have all the ingredients.", 128, 16777215))
	_uState39Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GRUNT)', 0, 4))
	_uState39Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GRUNT)', 0, 4))
	_uState39Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GRUNT)', 0, 4))
	_uState39Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(GRUNT)', 0, 4))
	_uState39Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(GRUNT)', 0, 4))
	_uState39Trans7:AddAction (CScriptActionDialogRequestEnd("pl_Human", "grunt"))
	_uState39Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(GRUNT)', 1, 4))
	_uState39Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState39Trans7 = nil

-- TO STATE: endconversation
_uState39Trans8 = GdsCreateTransition (_uState27, _uState39, "State_27", "State_39_T8", "Dialog")
	_uState39Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 4))
	_uState39Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_GRUNT_030PC", "A magic staff for bloodconjuration and mental mages.", 99, 16777215))
	_uState39Trans8:AddAction (CScriptActionSay("grunt", "P501_DLG_GRUNT_031", "Another mage staff called Morpheus. It will surely get those enemies off your back for a while. I need the following materials: a human skull, transparent wood and sand from a region called The Crater. Come back when you have all the ingredients.", 130, 16777215))
	_uState39Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GRUNT)', 0, 4))
	_uState39Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GRUNT)', 0, 4))
	_uState39Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GRUNT)', 0, 4))
	_uState39Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(GRUNT)', 0, 4))
	_uState39Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(GRUNT)', 0, 4))
	_uState39Trans8:AddAction (CScriptActionDialogRequestEnd("pl_Human", "grunt"))
	_uState39Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(GRUNT)', 1, 4))
	_uState39Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState39Trans8 = nil

-- TO STATE: endconversation
_uState39Trans9 = GdsCreateTransition (_uState27, _uState39, "State_27", "State_39_T9", "Dialog")
	_uState39Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 5))
	_uState39Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_GRUNT_032PC", "A crossbow.", 99, 16777215))
	_uState39Trans9:AddAction (CScriptActionSay("grunt", "P501_DLG_GRUNT_033", "A crossbow - the wrath of the witchking. The witchking is a dark legend among our people - you'll need his soulstone for this weapon. Also you'll need: silver spidersilk and the wood of a treant. Come back when you have all the ingredients.", 132, 16777215))
	_uState39Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(GRUNT)', 0, 4))
	_uState39Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(GRUNT)', 0, 4))
	_uState39Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(GRUNT)', 0, 4))
	_uState39Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(GRUNT)', 0, 4))
	_uState39Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(GRUNT)', 0, 4))
	_uState39Trans9:AddAction (CScriptActionDialogRequestEnd("pl_Human", "grunt"))
	_uState39Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(GRUNT)', 1, 4))
	_uState39Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState39Trans9 = nil

-- TO STATE: endconversation
_uState39Trans10 = GdsCreateTransition (_uState16, _uState39, "State_16", "State_39_T10", "Dialog")
	_uState39Trans10:AddCondition (GdsNegateCondition( CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption1Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption2Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption3Chosen', 0, 2), CScriptConditionValue('', 'mf_P501_GruntOption4Chosen', 0, 2)))) ))
	_uState39Trans10:AddCondition (GdsNegateCondition( CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption5Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption6Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption7Chosen', 0, 2), CScriptConditionValue('', 'mf_P501_GruntOption8Chosen', 0, 2)))) ))
	_uState39Trans10:AddAction (CScriptActionDialogRequestEnd("pl_Human", "grunt"))
	_uState39Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(GRUNT)', 1, 4))
	_uState39Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState39Trans10 = nil

-- TO STATE: endconversation
_uState39Trans11 = GdsCreateTransition (_uState1, _uState39, "State_1", "State_39_T11", "Dialog")
	_uState39Trans11:AddCondition (CScriptConditionValue('', 'mf_P501_SmithGiveItem1', 1, 2))
	_uState39Trans11:AddCondition (CScriptConditionValue('', 'mf_P501_SmithGiveItem2', 1, 2))
	_uState39Trans11:AddCondition (CScriptConditionValue('', 'mf_P501_SmithGiveItem3', 1, 2))
	_uState39Trans11:AddCondition (CScriptConditionValue('', 'mf_P501_SmithGiveItem4', 1, 2))
	_uState39Trans11:AddCondition (CScriptConditionValue('', 'mf_P501_SmithGiveItem5', 1, 2))
	_uState39Trans11:AddCondition (CScriptConditionValue('', 'mf_P501_SmithGiveItem6', 1, 2))
	_uState39Trans11:AddCondition (CScriptConditionValue('', 'mf_P501_SmithGiveItem7', 1, 2))
	_uState39Trans11:AddCondition (CScriptConditionValue('', 'mf_P501_SmithGiveItem8', 1, 2))
	_uState39Trans11:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'IF_FLINK', 1), CScriptConditionValue('', 'mf_P501_TitanCapTalkFinished', 0, 2)) ))
	_uState39Trans11:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionValue('', 'mf_P501_FlinkDealDone', 1, 2), CScriptConditionValue('', 'mf_P501_TitanCapTalkQuestDone', 0, 2)) ))
	_uState39Trans11:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_FirstTimeTalked', 0, 2) ))
	_uState39Trans11:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients1', 1, 2) ))
	_uState39Trans11:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients2', 1, 2) ))
	_uState39Trans11:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients3', 1, 2) ))
	_uState39Trans11:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients4', 1, 2) ))
	_uState39Trans11:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients5', 1, 2) ))
	_uState39Trans11:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients6', 1, 2) ))
	_uState39Trans11:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients7', 1, 2) ))
	_uState39Trans11:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_HasIngredients8', 1, 2) ))
	_uState39Trans11:AddCondition (GdsNegateCondition( CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption1Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption2Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption3Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption4Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption5Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption6Chosen', 0, 2), CScriptConditionOR(CScriptConditionValue('', 'mf_P501_GruntOption7Chosen', 0, 2), CScriptConditionValue('', 'mf_P501_GruntOption8Chosen', 0, 2)))))))) ))
	_uState39Trans11:AddAction (CScriptActionSay("grunt", "P501_DLG_GRUNT_034", "By Aonir!  I have made everything I can for you!", 133, 16777215))
	_uState39Trans11:AddAction (CScriptActionDialogEnable("grunt", 0))
	_uState39Trans11:AddAction (CScriptActionDialogRequestEnd("pl_Human", "grunt"))
	_uState39Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(GRUNT)', 1, 4))
	_uState39Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState39Trans11 = nil

-- TO STATE: endconversation
_uState39Trans12 = GdsCreateTransition (_uState35, _uState39, "State_35", "State_39_T12", "Dialog")
	_uState39Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_GRUNT_035PC", "I have all the ingredients.", 134, 16777215))
	_uState39Trans12:AddAction (CScriptActionSay("grunt", "P501_DLG_GRUNT_036", "Very good lad, very good. This makes my heart light. Here you have your masterpiece.", 135, 16777215))
	_uState39Trans12:AddAction (CScriptActionDialogRequestEnd("pl_Human", "grunt"))
	_uState39Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(GRUNT)', 1, 4))
	_uState39Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState39Trans12 = nil

-- TO STATE: endconversation
_uState39Trans13 = GdsCreateTransition (_uState37, _uState39, "State_37", "State_39_T13", "Dialog")
	_uState39Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_GRUNT_037PC", "Thank you, I'll come back when I have them together.", 136, 16777215))
	_uState39Trans13:AddAction (CScriptActionDialogRequestEnd("pl_Human", "grunt"))
	_uState39Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag13(GRUNT)', 1, 4))
	_uState39Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(GRUNT)', 1, 4))
	_uState39Trans13 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState39, _uState39, "State_39", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(GRUNT)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "grunt"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P501_TitanCapTalkQuestDone', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(GRUNT)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GRUNT)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState39, _uState39, "State_39", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(GRUNT)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "grunt"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P501_GruntOption1Chosen', 1, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(GRUNT)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GRUNT)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState39, _uState39, "State_39", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(GRUNT)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "grunt"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'mf_P501_GruntOption2Chosen', 1, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(GRUNT)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GRUNT)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState39, _uState39, "State_39", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(GRUNT)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "grunt"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'mf_P501_GruntOption3Chosen', 1, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(GRUNT)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GRUNT)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState39, _uState39, "State_39", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(GRUNT)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "grunt"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'mf_P501_GruntOption4Chosen', 1, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(GRUNT)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GRUNT)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState39, _uState39, "State_39", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(GRUNT)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "grunt"))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'mf_P501_GruntOption5Chosen', 1, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(GRUNT)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GRUNT)', 1, 4))
	_uEndActions6 = nil

-- TO SELF: EndConversation Actions #7
_uEndActions7 = GdsCreateTransition (_uState39, _uState39, "State_39", "EndActions_7", "Dialog")
	_uEndActions7:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag7(GRUNT)', 1, 2))
	_uEndActions7:AddCondition (CScriptConditionDialogStopped("pl_Human", "grunt"))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'mf_P501_GruntOption6Chosen', 1, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(GRUNT)', 0, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GRUNT)', 1, 4))
	_uEndActions7 = nil

-- TO SELF: EndConversation Actions #8
_uEndActions8 = GdsCreateTransition (_uState39, _uState39, "State_39", "EndActions_8", "Dialog")
	_uEndActions8:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag8(GRUNT)', 1, 2))
	_uEndActions8:AddCondition (CScriptConditionDialogStopped("pl_Human", "grunt"))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'mf_P501_GruntOption7Chosen', 1, 4))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(GRUNT)', 0, 4))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GRUNT)', 1, 4))
	_uEndActions8 = nil

-- TO SELF: EndConversation Actions #9
_uEndActions9 = GdsCreateTransition (_uState39, _uState39, "State_39", "EndActions_9", "Dialog")
	_uEndActions9:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag9(GRUNT)', 1, 2))
	_uEndActions9:AddCondition (CScriptConditionDialogStopped("pl_Human", "grunt"))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'mf_P501_GruntOption8Chosen', 1, 4))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(GRUNT)', 0, 4))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GRUNT)', 1, 4))
	_uEndActions9 = nil

-- TO SELF: EndConversation Actions #10
_uEndActions10 = GdsCreateTransition (_uState39, _uState39, "State_39", "EndActions_10", "Dialog")
	_uEndActions10:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag10(GRUNT)', 1, 2))
	_uEndActions10:AddCondition (CScriptConditionDialogStopped("pl_Human", "grunt"))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(GRUNT)', 0, 4))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GRUNT)', 1, 4))
	_uEndActions10 = nil

-- TO SELF: EndConversation Actions #11
_uEndActions11 = GdsCreateTransition (_uState39, _uState39, "State_39", "EndActions_11", "Dialog")
	_uEndActions11:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag11(GRUNT)', 1, 2))
	_uEndActions11:AddCondition (CScriptConditionDialogStopped("pl_Human", "grunt"))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'mf_P501_AllQuestDone', 1, 4))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(GRUNT)', 0, 4))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GRUNT)', 1, 4))
	_uEndActions11 = nil

-- TO SELF: EndConversation Actions #12
_uEndActions12 = GdsCreateTransition (_uState39, _uState39, "State_39", "EndActions_12", "Dialog")
	_uEndActions12:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag12(GRUNT)', 1, 2))
	_uEndActions12:AddCondition (CScriptConditionDialogStopped("pl_Human", "grunt"))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(GRUNT)', 0, 4))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GRUNT)', 1, 4))
	_uEndActions12 = nil

-- TO SELF: EndConversation Actions #13
_uEndActions13 = GdsCreateTransition (_uState39, _uState39, "State_39", "EndActions_13", "Dialog")
	_uEndActions13:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag13(GRUNT)', 1, 2))
	_uEndActions13:AddCondition (CScriptConditionDialogStopped("pl_Human", "grunt"))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag13(GRUNT)', 0, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GRUNT)', 1, 4))
	_uEndActions13 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState39, _uBeginState, "State_39", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(GRUNT)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(GRUNT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('grunt', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(GRUNT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState2 = nil
_uState5 = nil
_uState16 = nil
_uState19 = nil
_uState27 = nil
_uState35 = nil
_uState37 = nil
_uState39 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("grunt_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(GRUNT)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'grunt'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(GRUNT)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'grunt'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'grunt', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'grunt'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'grunt', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'grunt'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'grunt', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'grunt'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'grunt', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'grunt'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'grunt', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'grunt'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'grunt', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'grunt'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'grunt', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'grunt'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'grunt', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'grunt', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'grunt', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'grunt', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'grunt', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'grunt'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'grunt'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'grunt'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'grunt'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'grunt', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'grunt', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'grunt', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'grunt', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[131]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[131]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 131))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'grunt', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'grunt'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'grunt'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[130]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[130]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 130))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'grunt'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[132]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[132]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 132))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'grunt'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[133]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[133]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 133))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'grunt'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[134]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[134]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 134))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'grunt', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[135]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[135]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 135))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'grunt'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[136]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[136]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 136))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'grunt', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "grunt", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'grunt', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
