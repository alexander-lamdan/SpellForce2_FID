local _uSM = GdsCreateStateMachine ("VerwalterUtrecht_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState5 = GdsCreateState (_uSM, "State_5")
_uState9 = GdsCreateState (_uSM, "State_9")
_uState13 = GdsCreateState (_uSM, "State_13")
_uState16 = GdsCreateState (_uSM, "State_16")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('VerwalterUtrecht'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(VERWALTERUTRECHT)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(VERWALTERUTRECHT)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('VerwalterUtrecht', 1))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "VerwalterUtrecht"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(VERWALTERUTRECHT)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(VERWALTERUTRECHT)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('VerwalterUtrecht', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("VerwalterUtrecht")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(VERWALTERUTRECHT)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(VERWALTERUTRECHT)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(VERWALTERUTRECHT)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(VERWALTERUTRECHT)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(VERWALTERUTRECHT)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(VERWALTERUTRECHT)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(VERWALTERUTRECHT)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(VERWALTERUTRECHT)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "VerwalterUtrecht"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('VerwalterUtrecht', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(VERWALTERUTRECHT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState5Trans1 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T1", "Dialog")
	_uState5Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(VERWALTERUTRECHT)', 0, 2))
	_uState5Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMissingJandra', 99) ))
	_uState5Trans1:AddAction (CScriptActionChoice("P333_DLG_UTRECHT_005PC", "Habt Ihr Arbeit?", 1, 16777215))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(VERWALTERUTRECHT)', 1, 4))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(VERWALTERUTRECHT)', 1, 4))
	_uState5Trans1 = nil

-- TO STATE: choice
_uState5Trans2 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T2", "Dialog")
	_uState5Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(VERWALTERUTRECHT)', 0, 2))
	_uState5Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopMissingJandraFound', 1))
	_uState5Trans2:AddAction (CScriptActionChoice("P333_DLG_UTRECHT_011PC", "Ja. Aber sie war nicht erfreut von Euch zu hören.", 2, 16777215))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(VERWALTERUTRECHT)', 1, 4))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(VERWALTERUTRECHT)', 1, 4))
	_uState5Trans2 = nil

-- TO STATE: choice
_uState5Trans3 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T3", "Dialog")
	_uState5Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(VERWALTERUTRECHT)', 0, 2))
	_uState5Trans3:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopMissingJandraFound', 2))
	_uState5Trans3:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopWifeIris', 99) ))
	_uState5Trans3:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopTalkToMersadion', 99) ))
	_uState5Trans3:AddAction (CScriptActionChoice("P333_DLG_UTRECHT_017PC", "Jandra sagte, Ihr solltet Euch um Eure Frau kümmern!", 3, 16777215))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(VERWALTERUTRECHT)', 1, 4))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(VERWALTERUTRECHT)', 1, 4))
	_uState5Trans3 = nil

-- TO STATE: choice
_uState5Trans4 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T4", "Dialog")
	_uState5Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(VERWALTERUTRECHT)', 0, 2))
	_uState5Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopWifeIrisRescued', 1))
	_uState5Trans4:AddAction (CScriptActionChoice("P333_DLG_UTRECHT_024PC", "Wie geht es Iris?", 4, 16777215))
	_uState5Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(VERWALTERUTRECHT)', 1, 4))
	_uState5Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(VERWALTERUTRECHT)', 1, 4))
	_uState5Trans4 = nil

-- TO STATE: choice
_uState5Trans5 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T5", "Dialog")
	_uState5Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(VERWALTERUTRECHT)', 0, 2))
	_uState5Trans5:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopHonorMarksCollectedEnough', 2))
	_uState5Trans5:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseResources', 99) ))
	_uState5Trans5:AddAction (CScriptActionChoice("P333_DLG_UTRECHT_027PC", "Sonst steht es gut auf der Westwehr?", 5, 16777215))
	_uState5Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(VERWALTERUTRECHT)', 1, 4))
	_uState5Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(VERWALTERUTRECHT)', 1, 4))
	_uState5Trans5 = nil

-- TO STATE: choice
_uState5Trans6 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T6", "Dialog")
	_uState5Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(VERWALTERUTRECHT)', 0, 2))
	_uState5Trans6:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopResourcesGatheredEnough', 1))
	_uState5Trans6:AddAction (CScriptActionChoice("P333_DLG_UTRECHT_037PC", "Hat Valmy Euch die Waren geliefert?", 6, 16777215))
	_uState5Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(VERWALTERUTRECHT)', 1, 4))
	_uState5Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(VERWALTERUTRECHT)', 1, 4))
	_uState5Trans6 = nil

-- TO STATE: choice
_uState5Trans7 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T7", "Dialog")
	_uState5Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(VERWALTERUTRECHT)', 1, 2))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(VERWALTERUTRECHT)', 0, 4))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(VERWALTERUTRECHT)', 1, 4))
	_uState5Trans7:AddAction (CScriptActionShowChoices())
	_uState5Trans7 = nil

-- TO STATE: choice
_uState5Trans8 = GdsCreateTransition (_uState1, _uState5, "State_1", "State_5_T8", "Dialog")
	_uState5Trans8:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'af_P333_TalkedToUtrecht', 0, 2) ))
	_uState5Trans8:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopMissingJandra', 99), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMissingJandraFound', 2) )) ))
	_uState5Trans8:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_004", "Grüße, Bürger.", 103, 16777215))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(VERWALTERUTRECHT)', 1, 4))
	_uState5Trans8 = nil

-- TO STATE: choice
_uState5Trans9 = GdsCreateTransition (_uState1, _uState5, "State_1", "State_5_T9", "Dialog")
	_uState5Trans9:AddCondition (CScriptConditionValue('pl_Human', 'af_P333_TalkedToUtrecht', 0, 2))
	_uState5Trans9:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_001", "Ah, ich sehe wir haben neue Leute!", 100, 16777215))
	_uState5Trans9:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_002", "Ich bin Utrecht, der Verwalter der Westwehr bis ihre Durchlaucht wieder zurückkehrt.", 101, 16777215))
	_uState5Trans9:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_TalkedToUtrecht', 1, 4))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(VERWALTERUTRECHT)', 1, 4))
	_uState5Trans9 = nil

-- TO STATE: choice
_uState5Trans10 = GdsCreateTransition (_uState1, _uState5, "State_1", "State_5_T10", "Dialog")
	_uState5Trans10:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopMissingJandra', 99))
	_uState5Trans10:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMissingJandraFound', 2) ))
	_uState5Trans10:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'af_P333_TalkedToUtrecht', 0, 2) ))
	_uState5Trans10:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_003", "Und, habt Ihr die B ... Meine Schwester gefunden?", 102, 16777215))
	_uState5Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(VERWALTERUTRECHT)', 1, 4))
	_uState5Trans10 = nil

-- TO STATE: choice
_uState5Trans11 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T11", "Dialog")
	_uState5Trans11:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 2))
	_uState5Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_UTRECHT_011PC", "Ja. Aber sie war nicht erfreut von Euch zu hören.", 99, 16777215))
	_uState5Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_UTRECHT_012PC", "Sie hat mir diese Brosche für Euch gegeben. Auf die hattet ihr es wohl abgesehen.", 111, 16777215))
	_uState5Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(VERWALTERUTRECHT)', 0, 4))
	_uState5Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(VERWALTERUTRECHT)', 0, 4))
	_uState5Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(VERWALTERUTRECHT)', 0, 4))
	_uState5Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(VERWALTERUTRECHT)', 0, 4))
	_uState5Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(VERWALTERUTRECHT)', 0, 4))
	_uState5Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(VERWALTERUTRECHT)', 0, 4))
	_uState5Trans11:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_013", "Die Brosche! Ah, wunderbar!", 112, 16777215))
	_uState5Trans11:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_014", "Und sie wollte nicht wieder heimkehren?", 113, 16777215))
	_uState5Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_UTRECHT_015PC", "Sie hat versucht vor Euch Ruhe zu haben, Utrecht.", 114, 16777215))
	_uState5Trans11:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_016", "Halte ja nicht viel von Gefühlsduselei, aber das schmerzt mich doch. Nun gut, hier, Euer Lohn!", 115, 16777215))
	_uState5Trans11:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopMissingJandraFound', 2, 0))
	_uState5Trans11:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 266, 999))
	_uState5Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(VERWALTERUTRECHT)', 1, 4))
	_uState5Trans11 = nil

-- TO STATE: choice
_uState5Trans12 = GdsCreateTransition (_uState9, _uState5, "State_9", "State_5_T12", "Dialog")
	_uState5Trans12:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopBaseUtrechtsFamily', 2), CScriptConditionQuestState('pl_Human', 'CoopBaseResources', 2)) ))
	_uState5Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(VERWALTERUTRECHT)', 1, 4))
	_uState5Trans12 = nil

-- TO STATE: choice
_uState5Trans13 = GdsCreateTransition (_uState13, _uState5, "State_13", "State_5_T13", "Dialog")
	_uState5Trans13:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopBaseUtrechtsFamily', 2), CScriptConditionQuestState('pl_Human', 'CoopBaseResources', 2)) ))
	_uState5Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(VERWALTERUTRECHT)', 1, 4))
	_uState5Trans13 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "VerwalterUtrecht"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState5, _uBeginState, "State_5", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "VerwalterUtrecht"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('VerwalterUtrecht', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(VERWALTERUTRECHT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState9Trans1 = GdsCreateTransition (_uState5, _uState9, "State_5", "State_9_T1", "Dialog")
	_uState9Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 4))
	_uState9Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_UTRECHT_024PC", "Wie geht es Iris?", 99, 16777215))
	_uState9Trans1:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_025", "Gut, vielen Dank für Eure Hilfe!", 124, 16777215))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(VERWALTERUTRECHT)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(VERWALTERUTRECHT)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(VERWALTERUTRECHT)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(VERWALTERUTRECHT)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(VERWALTERUTRECHT)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(VERWALTERUTRECHT)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_026", "Sie hat mich ... gebeten, Euch eine Entlohnung auszuzahlen.", 125, 16777215))
	_uState9Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopWifeIrisRescued', 2, 0))
	_uState9Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseUtrechtsFamily', 2, 0))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(VERWALTERUTRECHT)', 1, 4))
	_uState9Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "VerwalterUtrecht"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState9, _uBeginState, "State_9", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "VerwalterUtrecht"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('VerwalterUtrecht', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(VERWALTERUTRECHT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState13Trans1 = GdsCreateTransition (_uState5, _uState13, "State_5", "State_13_T1", "Dialog")
	_uState13Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 6))
	_uState13Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_UTRECHT_037PC", "Hat Valmy Euch die Waren geliefert?", 99, 16777215))
	_uState13Trans1:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_038", "Allerdings! Was das angeht, ist sie verlässlich!", 137, 16777215))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(VERWALTERUTRECHT)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(VERWALTERUTRECHT)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(VERWALTERUTRECHT)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(VERWALTERUTRECHT)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(VERWALTERUTRECHT)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(VERWALTERUTRECHT)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_039", "Ich schätze, ich bin Euch eine Entlohnung schuldig! Hier!", 138, 16777215))
	_uState13Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopResourcesGatheredEnough', 2, 0))
	_uState13Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseResources', 2, 0))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(VERWALTERUTRECHT)', 1, 4))
	_uState13Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState13, _uState13, "State_13", "State_13", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "VerwalterUtrecht"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState13, _uBeginState, "State_13", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "VerwalterUtrecht"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('VerwalterUtrecht', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(VERWALTERUTRECHT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState16Trans1 = GdsCreateTransition (_uState5, _uState16, "State_5", "State_16_T1", "Dialog")
	_uState16Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 1))
	_uState16Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_UTRECHT_005PC", "Habt Ihr Arbeit?", 99, 16777215))
	_uState16Trans1:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_006", "Nicht auf den Mund gefallen, was?", 105, 16777215))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(VERWALTERUTRECHT)', 0, 4))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(VERWALTERUTRECHT)', 0, 4))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(VERWALTERUTRECHT)', 0, 4))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(VERWALTERUTRECHT)', 0, 4))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(VERWALTERUTRECHT)', 0, 4))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(VERWALTERUTRECHT)', 0, 4))
	_uState16Trans1:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_007", "Es gibt immer viel zu tun in der Westwehr, aber ich hätte da noch eine etwas ... Persönliche Sache, bei der Ihr mir vielleicht helfen könntet.", 106, 16777215))
	_uState16Trans1:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_008", "Meine Schwester Jandra, eine äußerst unvorsichtige Person, hat sich auf ihren Reisen ein wenig weit vorgewagt.", 107, 16777215))
	_uState16Trans1:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_009", "Sie wollte Elfenruinen in Dun Mora studieren, aber sie ist von ihrem Ausflug nicht zurückgekehrt.", 108, 16777215))
	_uState16Trans1:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_010", "Schaut doch bitte nach ihr, falls Ihr in der Gegend seid.", 109, 16777215))
	_uState16Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseUtrechtsFamily', 1, 0))
	_uState16Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopMissingJandra', 1, 0))
	_uState16Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "VerwalterUtrecht"))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(VERWALTERUTRECHT)', 1, 4))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(VERWALTERUTRECHT)', 1, 4))
	_uState16Trans1 = nil

-- TO STATE: endconversation
_uState16Trans2 = GdsCreateTransition (_uState5, _uState16, "State_5", "State_16_T2", "Dialog")
	_uState16Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 3))
	_uState16Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_UTRECHT_017PC", "Jandra sagte, Ihr solltet Euch um Eure Frau kümmern!", 99, 16777215))
	_uState16Trans2:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_018", "Iris? Was ist mit Ihr?", 117, 16777215))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(VERWALTERUTRECHT)', 0, 4))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(VERWALTERUTRECHT)', 0, 4))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(VERWALTERUTRECHT)', 0, 4))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(VERWALTERUTRECHT)', 0, 4))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(VERWALTERUTRECHT)', 0, 4))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(VERWALTERUTRECHT)', 0, 4))
	_uState16Trans2:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_019", "Oje, es wird Ihr doch nichts geschehen sein? Sie ... Ist weggelaufen, wisst Ihr?", 118, 16777215))
	_uState16Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_UTRECHT_020PC", "Lasst mich raten, mit Eurem Silberbesteck?", 119, 16777215))
	_uState16Trans2:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_021", "Nein, nein. Es geht wirklich nur um sie! Ich hatte nur so wenig Zeit, mich darum zu kümmern ...", 120, 16777215))
	_uState16Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_UTRECHT_022PC", "Ihr müsst etwas an Euch ändern, Utrecht.", 121, 16777215))
	_uState16Trans2:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_023", "Werdet Ihr mir trotzdem helfen? Ich weiß nicht, wo Iris hingelaufen ist, aber dieser Mersadion, unser Feuermagier, er hat Ihr wohl bei der Flucht geholfen. Sprecht mit ihm!", 122, 16777215))
	_uState16Trans2:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopTalkToMersadion', 1, 0))
	_uState16Trans2:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_MersadionDialogEnabled', 1, 4))
	_uState16Trans2:AddAction (CScriptActionDialogEnable('Odin', 1))
	_uState16Trans2:AddAction (CScriptActionSetDialog('Odin', 1))
	_uState16Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "VerwalterUtrecht"))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(VERWALTERUTRECHT)', 1, 4))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(VERWALTERUTRECHT)', 1, 4))
	_uState16Trans2 = nil

-- TO STATE: endconversation
_uState16Trans3 = GdsCreateTransition (_uState9, _uState16, "State_9", "State_16_T3", "Dialog")
	_uState16Trans3:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopBaseUtrechtsFamily', 2))
	_uState16Trans3:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopBaseResources', 2))
	_uState16Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "VerwalterUtrecht"))
	_uState16Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(VERWALTERUTRECHT)', 1, 4))
	_uState16Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(VERWALTERUTRECHT)', 1, 4))
	_uState16Trans3 = nil

-- TO STATE: endconversation
_uState16Trans4 = GdsCreateTransition (_uState5, _uState16, "State_5", "State_16_T4", "Dialog")
	_uState16Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 5))
	_uState16Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_UTRECHT_027PC", "Sonst steht es gut auf der Westwehr?", 99, 16777215))
	_uState16Trans4:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_028", "Gut? Es stand nie gut, nur kurzzeitig als ihre Durchlaucht noch da war. Seitdem wird es jeden Tag schwererer noch genug Nahrung und Materialen aufzutreiben!", 127, 16777215))
	_uState16Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(VERWALTERUTRECHT)', 0, 4))
	_uState16Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(VERWALTERUTRECHT)', 0, 4))
	_uState16Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(VERWALTERUTRECHT)', 0, 4))
	_uState16Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(VERWALTERUTRECHT)', 0, 4))
	_uState16Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(VERWALTERUTRECHT)', 0, 4))
	_uState16Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(VERWALTERUTRECHT)', 0, 4))
	_uState16Trans4:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_029", "Mit all dem Krieg drum herum und den Shaikan, die uns hier die Harre vom Kopf fressen! Entschuldigung.", 128, 16777215))
	_uState16Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_UTRECHT_030PC", "Was braucht Ihr?", 129, 16777215))
	_uState16Trans4:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_031", "Silber, Stein, Lenya! Was man so braucht um so ein Land am Leben zu erhalten.", 130, 16777215))
	_uState16Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_UTRECHT_032PC", "Wie könnte ich Euch Rohstoffe zukommen lassen?", 131, 16777215))
	_uState16Trans4:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_033", "Oh, das ist einfach. Es gibt einige Länder zu denen wir gute Portalverbindungen haben. Gillyshire, den Heulerpass und Sommerfall.", 132, 16777215))
	_uState16Trans4:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_034", "Dort wird Euch unsere Proviantmeisterin Valmy mit ihren Packpferden erwarten. Wenn Ihr bereit seid, gebt Ihr Rohstoffe, am besten je 500 Stück Silber, Stein und Lenya.", 133, 16777215))
	_uState16Trans4:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_035", "Sie kann immer 5000 Stück laden, bis ihre Packpferde beladen sind. Danach müsst Ihr in ein anderes Land.", 134, 16777215))
	_uState16Trans4:AddAction (CScriptActionSay("VerwalterUtrecht", "P333_DLG_UTRECHT_036", "Sammelt so für die Westwehr 10.000 Stück Silber, Stein und Lenya und ich werde Euch fürstlich belohnen!", 135, 16777215))
	_uState16Trans4:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseResources', 1, 0))
	_uState16Trans4:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopResources', 1, 0))
	_uState16Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "VerwalterUtrecht"))
	_uState16Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(VERWALTERUTRECHT)', 1, 4))
	_uState16Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(VERWALTERUTRECHT)', 1, 4))
	_uState16Trans4 = nil

-- TO STATE: endconversation
_uState16Trans5 = GdsCreateTransition (_uState13, _uState16, "State_13", "State_16_T5", "Dialog")
	_uState16Trans5:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopBaseUtrechtsFamily', 2))
	_uState16Trans5:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopBaseResources', 2))
	_uState16Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "VerwalterUtrecht"))
	_uState16Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(VERWALTERUTRECHT)', 1, 4))
	_uState16Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(VERWALTERUTRECHT)', 1, 4))
	_uState16Trans5 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState16, _uState16, "State_16", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(VERWALTERUTRECHT)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "VerwalterUtrecht"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(VERWALTERUTRECHT)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(VERWALTERUTRECHT)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState16, _uState16, "State_16", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(VERWALTERUTRECHT)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "VerwalterUtrecht"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(VERWALTERUTRECHT)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(VERWALTERUTRECHT)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState16, _uState16, "State_16", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(VERWALTERUTRECHT)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "VerwalterUtrecht"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(VERWALTERUTRECHT)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(VERWALTERUTRECHT)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState16, _uState16, "State_16", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(VERWALTERUTRECHT)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "VerwalterUtrecht"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(VERWALTERUTRECHT)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(VERWALTERUTRECHT)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState16, _uState16, "State_16", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(VERWALTERUTRECHT)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "VerwalterUtrecht"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(VERWALTERUTRECHT)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(VERWALTERUTRECHT)', 1, 4))
	_uEndActions5 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState16, _uBeginState, "State_16", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(VERWALTERUTRECHT)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(VERWALTERUTRECHT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('VerwalterUtrecht', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(VERWALTERUTRECHT)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState5 = nil
_uState9 = nil
_uState13 = nil
_uState16 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("VerwalterUtrecht_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(VERWALTERUTRECHT)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(VERWALTERUTRECHT)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'VerwalterUtrecht', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'VerwalterUtrecht', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'VerwalterUtrecht', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'VerwalterUtrecht', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'VerwalterUtrecht', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[136]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[136]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 136))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'VerwalterUtrecht', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'VerwalterUtrecht', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'VerwalterUtrecht', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'VerwalterUtrecht', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'VerwalterUtrecht', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'VerwalterUtrecht', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[130]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[130]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 130))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[131]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[131]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 131))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'VerwalterUtrecht', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[132]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[132]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 132))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[133]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[133]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 133))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[134]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[134]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 134))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[135]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[135]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 135))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[137]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[137]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 137))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[138]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[138]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 138))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'VerwalterUtrecht'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "VerwalterUtrecht", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'VerwalterUtrecht', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
