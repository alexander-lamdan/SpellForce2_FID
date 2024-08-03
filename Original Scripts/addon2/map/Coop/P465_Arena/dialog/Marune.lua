local _uSM = GdsCreateStateMachine ("marune_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState3 = GdsCreateState (_uSM, "State_3")
_uState4 = GdsCreateState (_uSM, "State_4")
_uState6 = GdsCreateState (_uSM, "State_6")
_uState7 = GdsCreateState (_uSM, "State_7")
_uState23 = GdsCreateState (_uSM, "State_23")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('marune'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(MARUNE)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(MARUNE)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('marune', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "marune"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MARUNE)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(MARUNE)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('marune', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("marune")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MARUNE)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MARUNE)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MARUNE)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MARUNE)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MARUNE)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MARUNE)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MARUNE)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MARUNE)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MARUNE)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MARUNE)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag11(MARUNE)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag12(MARUNE)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag13(MARUNE)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(MARUNE)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "marune"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('marune', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MARUNE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState3Trans1 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T1", "Dialog")
	_uState3Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(MARUNE)', 0, 2))
	_uState3Trans1:AddCondition (CScriptConditionValue('pl_Human', 'av_P465_ArenaState', 0, 2))
	_uState3Trans1:AddAction (CScriptActionChoice("P465_DLG_MARUNE_011PC", "Fangen wir an!", 1, 16777215))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MARUNE)', 1, 4))
	_uState3Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState3Trans1 = nil

-- TO STATE: choice
_uState3Trans2 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T2", "Dialog")
	_uState3Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(MARUNE)', 0, 2))
	_uState3Trans2:AddCondition (CScriptConditionValue('pl_Human', 'av_P465_ArenaState', 0, 2))
	_uState3Trans2:AddAction (CScriptActionChoice("P465_DLG_MARUNE_020PC", "Ihr seid ja verrückt!", 2, 16777215))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MARUNE)', 1, 4))
	_uState3Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState3Trans2 = nil

-- TO STATE: choice
_uState3Trans3 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T3", "Dialog")
	_uState3Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(MARUNE)', 0, 2))
	_uState3Trans3:AddCondition (CScriptConditionValue('pl_Human', 'av_P465_ArenaState', 1, 2))
	_uState3Trans3:AddAction (CScriptActionChoice("P465_DLG_MARUNE_022PC", "Beginnt mit dem ersten Akt!", 3, 16777215))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MARUNE)', 1, 4))
	_uState3Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState3Trans3 = nil

-- TO STATE: choice
_uState3Trans4 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T4", "Dialog")
	_uState3Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(MARUNE)', 0, 2))
	_uState3Trans4:AddCondition (CScriptConditionValue('pl_Human', 'av_P465_ArenaState', 2, 2))
	_uState3Trans4:AddAction (CScriptActionChoice("P465_DLG_MARUNE_030PC", "Beginnt mit dem zweiten Akt!", 4, 16777215))
	_uState3Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MARUNE)', 1, 4))
	_uState3Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState3Trans4 = nil

-- TO STATE: choice
_uState3Trans5 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T5", "Dialog")
	_uState3Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(MARUNE)', 0, 2))
	_uState3Trans5:AddCondition (CScriptConditionValue('pl_Human', 'av_P465_ArenaState', 3, 2))
	_uState3Trans5:AddAction (CScriptActionChoice("P465_DLG_MARUNE_035PC", "Beginnt mit dem dritten Akt!", 5, 16777215))
	_uState3Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MARUNE)', 1, 4))
	_uState3Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState3Trans5 = nil

-- TO STATE: choice
_uState3Trans6 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T6", "Dialog")
	_uState3Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(MARUNE)', 0, 2))
	_uState3Trans6:AddCondition (CScriptConditionValue('pl_Human', 'av_P465_ArenaState', 4, 2))
	_uState3Trans6:AddAction (CScriptActionChoice("P465_DLG_MARUNE_039PC", "Beginnt mit dem vierten Akt!", 6, 16777215))
	_uState3Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MARUNE)', 1, 4))
	_uState3Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState3Trans6 = nil

-- TO STATE: choice
_uState3Trans7 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T7", "Dialog")
	_uState3Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(MARUNE)', 0, 2))
	_uState3Trans7:AddCondition (CScriptConditionValue('pl_Human', 'av_P465_ArenaState', 5, 2))
	_uState3Trans7:AddAction (CScriptActionChoice("P465_DLG_MARUNE_044PC", "Beginnt mit dem fünften Akt!", 7, 16777215))
	_uState3Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MARUNE)', 1, 4))
	_uState3Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState3Trans7 = nil

-- TO STATE: choice
_uState3Trans8 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T8", "Dialog")
	_uState3Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag8(MARUNE)', 0, 2))
	_uState3Trans8:AddCondition (CScriptConditionValue('pl_Human', 'av_P465_ArenaState', 6, 2))
	_uState3Trans8:AddAction (CScriptActionChoice("P465_DLG_MARUNE_048PC", "Beginnt mit dem sechsten Akt!", 8, 16777215))
	_uState3Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MARUNE)', 1, 4))
	_uState3Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState3Trans8 = nil

-- TO STATE: choice
_uState3Trans9 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T9", "Dialog")
	_uState3Trans9:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag9(MARUNE)', 0, 2))
	_uState3Trans9:AddCondition (CScriptConditionValue('pl_Human', 'av_P465_ArenaState', 7, 2))
	_uState3Trans9:AddAction (CScriptActionChoice("P465_DLG_MARUNE_053PC", "Beginnt mit dem siebten Akt!", 9, 16777215))
	_uState3Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MARUNE)', 1, 4))
	_uState3Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState3Trans9 = nil

-- TO STATE: choice
_uState3Trans10 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T10", "Dialog")
	_uState3Trans10:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag10(MARUNE)', 0, 2))
	_uState3Trans10:AddCondition (CScriptConditionValue('pl_Human', 'av_P465_ArenaState', 8, 2))
	_uState3Trans10:AddAction (CScriptActionChoice("P465_DLG_MARUNE_058PC", "Beginnt mit dem achten Akt!", 10, 16777215))
	_uState3Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MARUNE)', 1, 4))
	_uState3Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState3Trans10 = nil

-- TO STATE: choice
_uState3Trans11 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T11", "Dialog")
	_uState3Trans11:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag11(MARUNE)', 0, 2))
	_uState3Trans11:AddCondition (CScriptConditionValue('pl_Human', 'av_P465_ArenaState', 9, 2))
	_uState3Trans11:AddAction (CScriptActionChoice("P465_DLG_MARUNE_062PC", "Beginnt mit dem neunten Akt!", 11, 16777215))
	_uState3Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag11(MARUNE)', 1, 4))
	_uState3Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState3Trans11 = nil

-- TO STATE: choice
_uState3Trans12 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T12", "Dialog")
	_uState3Trans12:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag12(MARUNE)', 0, 2))
	_uState3Trans12:AddCondition (CScriptConditionValue('pl_Human', 'av_P465_ArenaState', 10, 2))
	_uState3Trans12:AddAction (CScriptActionChoice("P465_DLG_MARUNE_066PC", "Beginnt mit dem zehnten Akt!", 12, 16777215))
	_uState3Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag12(MARUNE)', 1, 4))
	_uState3Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState3Trans12 = nil

-- TO STATE: choice
_uState3Trans13 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T13", "Dialog")
	_uState3Trans13:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag13(MARUNE)', 0, 2))
	_uState3Trans13:AddCondition (CScriptConditionValue('pl_Human', 'av_P465_ArenaState', 11, 2))
	_uState3Trans13:AddAction (CScriptActionChoice("P465_DLG_MARUNE_071PC", "Ist die es vorbei?", 13, 16777215))
	_uState3Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag13(MARUNE)', 1, 4))
	_uState3Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState3Trans13 = nil

-- TO STATE: choice
_uState3Trans14 = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3_T14", "Dialog")
	_uState3Trans14:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 2))
	_uState3Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 0, 4))
	_uState3Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(MARUNE)', 1, 4))
	_uState3Trans14:AddAction (CScriptActionShowChoices())
	_uState3Trans14 = nil

-- TO STATE: choice
_uState3Trans15 = GdsCreateTransition (_uState1, _uState3, "State_1", "State_3_T15", "Dialog")
	_uState3Trans15:AddCondition (CScriptConditionValue('pl_Human', 'af_P465_KnowsPlayer', 0, 2))
	_uState3Trans15:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_001", "Willkommen! Willkommen in dieser … ehemals vortrefflichen Arena!", 100, 16777215))
	_uState3Trans15:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_002", "Ich bin Marune, der Lichtweber. Ich bin nicht das, was Ihr glaubt und erst recht nicht das, was Ihr seht, aber das Wort Barde beschreibt mich wohl am treffendsten!", 101, 16777215))
	_uState3Trans15:AddAction (CScriptActionSay("pl_HumanAvatar", "P465_DLG_MARUNE_003PC", "Um sich ein paar Münzen zu verdienen, ist dieser Ort etwas abgelegen, Barde.", 102, 16777215))
	_uState3Trans15:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_004", "Ja, wie es scheint, habe ich mich etwas in der Zeit vertan. Aber nun seid Ihr ja da und …tadaa …ich habe Publikum!", 103, 16777215))
	_uState3Trans15:AddAction (CScriptActionSay("pl_HumanAvatar", "P465_DLG_MARUNE_005PC", "Wird das eine Sage aus alter Zeit für ein paar Kupfer?", 104, 16777215))
	_uState3Trans15:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_006", "Nicht doch! Die Vergangenheit ist langweilig, da gibt es ja nur eine. Damit sollen sich gewöhnliche Spielmänner befassen! Mein Metier ist eher die Zukunft!", 105, 16777215))
	_uState3Trans15:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_007", "Ich gebe Euch die einmalige Möglichkeit, heute etwas zu erleben, was sich vielleicht einmal in der Zukunft dieser Welt ereignen wird! Ein Drama in zehn Akten! Der Krieg der Götter!", 106, 16777215))
	_uState3Trans15:AddAction (CScriptActionSay("pl_HumanAvatar", "P465_DLG_MARUNE_008PC", "Was soll es mich kosten?", 107, 16777215))
	_uState3Trans15:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_009", "Nun … Euer Leben, vielleicht. Ihr sollt ja nicht nur zuhören und Zaunköniglebern knabbern, nein, nein! Ihr werdet kämpfen! Kämpfen gegen die Götter und ihre Heerscharen!", 108, 16777215))
	_uState3Trans15:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_010", "Ich sehe schon, ich muss Euch locken … Ihr werdet hier nicht nur Kämpfe erleben, wie noch niemand zuvor, Ihr werdet auch Beute erlangen, wie sie diese Welt noch nicht gesehen hat! Nun?", 109, 16777215))
	_uState3Trans15:AddAction (CScriptActionValueModify('pl_Human', 'af_P465_KnowsPlayer', 1, 4))
	_uState3Trans15:AddAction (CScriptActionDialogEnable('Siebenstern', 1))
	_uState3Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState3Trans15 = nil

-- TO STATE: choice
_uState3Trans16 = GdsCreateTransition (_uState7, _uState3, "State_7", "State_3_T16", "Dialog")
	_uState3Trans16:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P465_NeverTrue', 1, 2) ))
	_uState3Trans16:AddAction (CScriptActionValueModify('pl_Human', 'av_P465_ArenaState', 1, 4))
	_uState3Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState3Trans16 = nil

-- TO STATE: choice
_uState3Trans17 = GdsCreateTransition (_uState1, _uState3, "State_1", "State_3_T17", "Dialog")
	_uState3Trans17:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'af_P465_KnowsPlayer', 0, 2) ))
	_uState3Trans17:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_082", "Die Zukunft wartet.", 181, 16777215))
	_uState3Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState3Trans17 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState3, _uState3, "State_3", "State_3", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "marune"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState3, _uBeginState, "State_3", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "marune"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('marune', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MARUNE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState4Trans1 = GdsCreateTransition (_uState3, _uState4, "State_3", "State_4_T1", "Dialog")
	_uState4Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 1))
	_uState4Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P465_DLG_MARUNE_011PC", "Fangen wir an!", 99, 16777215))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MARUNE)', 0, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MARUNE)', 0, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MARUNE)', 0, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MARUNE)', 0, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MARUNE)', 0, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MARUNE)', 0, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MARUNE)', 0, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MARUNE)', 0, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MARUNE)', 0, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MARUNE)', 0, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag11(MARUNE)', 0, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag12(MARUNE)', 0, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag13(MARUNE)', 0, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState4Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "marune"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState4, _uBeginState, "State_4", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "marune"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('marune', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MARUNE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: else
_uState6Trans1 = GdsCreateTransition (_uState4, _uState6, "State_4", "State_6_T1", "Dialog")
	_uState6Trans1:AddCondition ( CScriptConditionTutorialAvatarHasMinLevel('pl_Human', 30) )
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState6Trans1 = nil

-- TO STATE: else
_uState6Trans2 = GdsCreateTransition (_uState4, _uState6, "State_4", "State_6_T2", "Dialog")
	_uState6Trans2:AddCondition (GdsNegateCondition( CScriptConditionTutorialAvatarHasMinLevel('pl_Human', 30) ))
	_uState6Trans2:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_012", "Ihr seht mir reichlich unerfahren aus! Das wird sehr schmerzhaft für Euch!", 111, 16777215))
	_uState6Trans2:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_013", "Nur als Warnung! Ihr solltet vielleicht erst noch etwas …üben.", 112, 16777215))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState6Trans2 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "marune"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState6, _uBeginState, "State_6", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "marune"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('marune', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MARUNE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: label
_uState7Trans1 = GdsCreateTransition (_uState6, _uState7, "State_6", "State_7_T1", "Dialog")
	_uState7Trans1:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_014", "Sodann, zum Ablauf!", 113, 16777215))
	_uState7Trans1:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_015", "Ich rufe einen Akt aus, dann verlasse ich die Arena und Ihr habt einige Atemzüge Zeit Euch vorzubereiten. Dann werden die Gegner erscheinen!", 114, 16777215))
	_uState7Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P465_DLG_MARUNE_016PC", "Werde ich wirklich gegen Götter kämpfen?", 115, 16777215))
	_uState7Trans1:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_017", "Nun, nicht ganz, um sie zu erschaffen reicht meine Kraft nicht aus. Aber ich kann ihre Avatare abbilden, ihre weltlichen Formen. Und die werden Euch genug zusetzen, glaubt es mir!", 116, 16777215))
	_uState7Trans1:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_018", "Solltet Ihr die Arena aus irgendeinem Grund verlassen müssen, könnt Ihr den letzen Akt bei mir noch einmal einfordern.", 117, 16777215))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState7Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "marune"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState7, _uBeginState, "State_7", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "marune"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('marune', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MARUNE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState23Trans1 = GdsCreateTransition (_uState7, _uState23, "State_7", "State_23_T1", "Dialog")
	_uState23Trans1:AddCondition (CScriptConditionValue('', 'mf_P465_NeverTrue', 1, 2))
	_uState23Trans1:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_019", "Als Verlassen der Arena gilt auch, wenn Ihr durch den Eingang hinauslauft. Solltet Ihr also um euer armseliges Leben zittern, ist das Euer Fluchtweg!", 118, 16777215))
	_uState23Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "marune"))
	_uState23Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(MARUNE)', 1, 4))
	_uState23Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState23Trans1 = nil

-- TO STATE: endconversation
_uState23Trans2 = GdsCreateTransition (_uState3, _uState23, "State_3", "State_23_T2", "Dialog")
	_uState23Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 2))
	_uState23Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P465_DLG_MARUNE_020PC", "Ihr seid ja verrückt!", 99, 16777215))
	_uState23Trans2:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_021", "Ihr seid doch viel zu neugierig, Ihr kommt schon wieder!", 120, 16777215))
	_uState23Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MARUNE)', 0, 4))
	_uState23Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MARUNE)', 0, 4))
	_uState23Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MARUNE)', 0, 4))
	_uState23Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MARUNE)', 0, 4))
	_uState23Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MARUNE)', 0, 4))
	_uState23Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MARUNE)', 0, 4))
	_uState23Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MARUNE)', 0, 4))
	_uState23Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MARUNE)', 0, 4))
	_uState23Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MARUNE)', 0, 4))
	_uState23Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MARUNE)', 0, 4))
	_uState23Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag11(MARUNE)', 0, 4))
	_uState23Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag12(MARUNE)', 0, 4))
	_uState23Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag13(MARUNE)', 0, 4))
	_uState23Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "marune"))
	_uState23Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(MARUNE)', 1, 4))
	_uState23Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState23Trans2 = nil

-- TO STATE: endconversation
_uState23Trans3 = GdsCreateTransition (_uState3, _uState23, "State_3", "State_23_T3", "Dialog")
	_uState23Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 3))
	_uState23Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P465_DLG_MARUNE_022PC", "Beginnt mit dem ersten Akt!", 99, 16777215))
	_uState23Trans3:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_023", "Wohlan denn! Ruhe bitte! Prolog …", 122, 16777215))
	_uState23Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MARUNE)', 0, 4))
	_uState23Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MARUNE)', 0, 4))
	_uState23Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MARUNE)', 0, 4))
	_uState23Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MARUNE)', 0, 4))
	_uState23Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MARUNE)', 0, 4))
	_uState23Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MARUNE)', 0, 4))
	_uState23Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MARUNE)', 0, 4))
	_uState23Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MARUNE)', 0, 4))
	_uState23Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MARUNE)', 0, 4))
	_uState23Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MARUNE)', 0, 4))
	_uState23Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag11(MARUNE)', 0, 4))
	_uState23Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag12(MARUNE)', 0, 4))
	_uState23Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag13(MARUNE)', 0, 4))
	_uState23Trans3:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_024", "Was geschah? Der rote Gott erwacht von neuem! Gestärkt durch die Kraft des Abgrunds befreit er die dunklen Götter aus ihrer Verbannung!", 123, 16777215))
	_uState23Trans3:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_025", "Die Lichtgötter sind zur Stelle, doch haben die Dunklen viel Kraft gesammelt! So beginnt der Krieg der Götter!", 124, 16777215))
	_uState23Trans3:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_026", "Die Welt erbebt als die Götter aufeinanderprallen! Und in ihrem wilden Toben kocht der Himmel, Tod und Verderben regnen auf die Völker, deren verzweifelte Rufe nicht mehr das Gehör der rasenden Götter finden!", 125, 16777215))
	_uState23Trans3:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_027", "Als die Völker in Angst gelähmt dem Leiden preisgegeben sind,  schleicht sich der dunkle Halbgott Belial auf die Welt hinab!", 126, 16777215))
	_uState23Trans3:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_028", "Zu schwach, um im Kampf gegen die Götter mit zu streiten, sucht er sich die Sterblichen, um mit ihnen sein Spiel zu treiben!", 127, 16777215))
	_uState23Trans3:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_029", "Erster Akt! Der Halbgott Belial und seine Horden branden wie eine schwarze Woge heran! Siegt, und Ihr erfahrt mehr!", 128, 16777215))
	_uState23Trans3:AddAction (CScriptActionValueModify('', 'mf_P465_ArenaFightRunning', 1, 4))
	_uState23Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "marune"))
	_uState23Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(MARUNE)', 1, 4))
	_uState23Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState23Trans3 = nil

-- TO STATE: endconversation
_uState23Trans4 = GdsCreateTransition (_uState3, _uState23, "State_3", "State_23_T4", "Dialog")
	_uState23Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 4))
	_uState23Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P465_DLG_MARUNE_030PC", "Beginnt mit dem zweiten Akt!", 99, 16777215))
	_uState23Trans4:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_031", "Aus den Himmeln herab nun, rauschen die Götter in Flammen! Blind für die Verwüstung, welche sie unter den Völkern anrichten, kämpfen sie nun auch in den Ebenen, auf den Bergen und über der kochenden See!", 130, 16777215))
	_uState23Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MARUNE)', 0, 4))
	_uState23Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MARUNE)', 0, 4))
	_uState23Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MARUNE)', 0, 4))
	_uState23Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MARUNE)', 0, 4))
	_uState23Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MARUNE)', 0, 4))
	_uState23Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MARUNE)', 0, 4))
	_uState23Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MARUNE)', 0, 4))
	_uState23Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MARUNE)', 0, 4))
	_uState23Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MARUNE)', 0, 4))
	_uState23Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MARUNE)', 0, 4))
	_uState23Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag11(MARUNE)', 0, 4))
	_uState23Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag12(MARUNE)', 0, 4))
	_uState23Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag13(MARUNE)', 0, 4))
	_uState23Trans4:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_032", "Sie sind wie von Sinnen! Wer wird sie aufhalten? Die Völker müssen gegen ihre eigenen Götter kämpfen!", 131, 16777215))
	_uState23Trans4:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_033", "Shanna ist keine Kriegerin! Ihr könnt sie überlisten und sie nach einem Kampf mit Nor geschwächt auf dem Schlachtfeld umzingeln!", 132, 16777215))
	_uState23Trans4:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_034", "Zweiter Akt! Besiegt die Göttin Shanna und Ihre Verbündeten! Nur dann geht die Saga weiter!", 133, 16777215))
	_uState23Trans4:AddAction (CScriptActionValueModify('', 'mf_P465_ArenaFightRunning', 1, 4))
	_uState23Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "marune"))
	_uState23Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(MARUNE)', 1, 4))
	_uState23Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState23Trans4 = nil

-- TO STATE: endconversation
_uState23Trans5 = GdsCreateTransition (_uState3, _uState23, "State_3", "State_23_T5", "Dialog")
	_uState23Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 5))
	_uState23Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P465_DLG_MARUNE_035PC", "Beginnt mit dem dritten Akt!", 99, 16777215))
	_uState23Trans5:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_036", "Nun ist der Krieg auf seinem Höhepunkt! Durch den Sieg über Shanna haben die Völker die Macht und das Vertrauen, gegen die anderen Götter anzutreten!", 135, 16777215))
	_uState23Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MARUNE)', 0, 4))
	_uState23Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MARUNE)', 0, 4))
	_uState23Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MARUNE)', 0, 4))
	_uState23Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MARUNE)', 0, 4))
	_uState23Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MARUNE)', 0, 4))
	_uState23Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MARUNE)', 0, 4))
	_uState23Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MARUNE)', 0, 4))
	_uState23Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MARUNE)', 0, 4))
	_uState23Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MARUNE)', 0, 4))
	_uState23Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MARUNE)', 0, 4))
	_uState23Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag11(MARUNE)', 0, 4))
	_uState23Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag12(MARUNE)', 0, 4))
	_uState23Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag13(MARUNE)', 0, 4))
	_uState23Trans5:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_037", "Ereon, Gott des Wissens, zweifelnd und schwach, soll Euer nächstes Opfer sein!", 136, 16777215))
	_uState23Trans5:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_038", "Dritter Akt! Die Schlacht gegen Ereon! Kämpft!", 137, 16777215))
	_uState23Trans5:AddAction (CScriptActionValueModify('', 'mf_P465_ArenaFightRunning', 1, 4))
	_uState23Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "marune"))
	_uState23Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(MARUNE)', 1, 4))
	_uState23Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState23Trans5 = nil

-- TO STATE: endconversation
_uState23Trans6 = GdsCreateTransition (_uState3, _uState23, "State_3", "State_23_T6", "Dialog")
	_uState23Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 6))
	_uState23Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P465_DLG_MARUNE_039PC", "Beginnt mit dem vierten Akt!", 99, 16777215))
	_uState23Trans6:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_040", "Durch den Tod seines Bruders aus der Kriegsraserei erwacht, wendet Hirin seinen hasserfüllten Blick zu den Völkern!", 139, 16777215))
	_uState23Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MARUNE)', 0, 4))
	_uState23Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MARUNE)', 0, 4))
	_uState23Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MARUNE)', 0, 4))
	_uState23Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MARUNE)', 0, 4))
	_uState23Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MARUNE)', 0, 4))
	_uState23Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MARUNE)', 0, 4))
	_uState23Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MARUNE)', 0, 4))
	_uState23Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MARUNE)', 0, 4))
	_uState23Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MARUNE)', 0, 4))
	_uState23Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MARUNE)', 0, 4))
	_uState23Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag11(MARUNE)', 0, 4))
	_uState23Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag12(MARUNE)', 0, 4))
	_uState23Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag13(MARUNE)', 0, 4))
	_uState23Trans6:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_041", "Die Kontinente erbeben bis in die tiefsten Kavernen und höchsten Berge, als der schwarze Reiter herandonnert, die Hufe seiner Mähre glühend von Funken des Zorns!", 140, 16777215))
	_uState23Trans6:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_042", "Mit grausamem Schlag fährt er unter die Heere der Völker und droht sie zu zertrümmern!", 141, 16777215))
	_uState23Trans6:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_043", "Vierter Akt! Tretet Hirin dem Boten und Totengott entgegen! Bezwingt ihn und seine Diener der Ordnung!", 142, 16777215))
	_uState23Trans6:AddAction (CScriptActionValueModify('', 'mf_P465_ArenaFightRunning', 1, 4))
	_uState23Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "marune"))
	_uState23Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(MARUNE)', 1, 4))
	_uState23Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState23Trans6 = nil

-- TO STATE: endconversation
_uState23Trans7 = GdsCreateTransition (_uState3, _uState23, "State_3", "State_23_T7", "Dialog")
	_uState23Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 7))
	_uState23Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P465_DLG_MARUNE_044PC", "Beginnt mit dem fünften Akt!", 99, 16777215))
	_uState23Trans7:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_045", "Nun geht es Schlag auf Schlag! Die Götter sind sich der Bedrohung bewusst!", 144, 16777215))
	_uState23Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MARUNE)', 0, 4))
	_uState23Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MARUNE)', 0, 4))
	_uState23Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MARUNE)', 0, 4))
	_uState23Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MARUNE)', 0, 4))
	_uState23Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MARUNE)', 0, 4))
	_uState23Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MARUNE)', 0, 4))
	_uState23Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MARUNE)', 0, 4))
	_uState23Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MARUNE)', 0, 4))
	_uState23Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MARUNE)', 0, 4))
	_uState23Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MARUNE)', 0, 4))
	_uState23Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag11(MARUNE)', 0, 4))
	_uState23Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag12(MARUNE)', 0, 4))
	_uState23Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag13(MARUNE)', 0, 4))
	_uState23Trans7:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_046", "Schon wirft sich Elen Euch entgegen! Mit der Macht der Natur sucht sie Rache für Ihre toten Geschwister!", 145, 16777215))
	_uState23Trans7:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_047", "Fünfter Akt! Der Sieg über die Natur! Vernichtet Elen!", 146, 16777215))
	_uState23Trans7:AddAction (CScriptActionValueModify('', 'mf_P465_ArenaFightRunning', 1, 4))
	_uState23Trans7:AddAction (CScriptActionDialogRequestEnd("pl_Human", "marune"))
	_uState23Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(MARUNE)', 1, 4))
	_uState23Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState23Trans7 = nil

-- TO STATE: endconversation
_uState23Trans8 = GdsCreateTransition (_uState3, _uState23, "State_3", "State_23_T8", "Dialog")
	_uState23Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 8))
	_uState23Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P465_DLG_MARUNE_048PC", "Beginnt mit dem sechsten Akt!", 99, 16777215))
	_uState23Trans8:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_049", "Nun, mein Freund, wird es schwer!", 148, 16777215))
	_uState23Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MARUNE)', 0, 4))
	_uState23Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MARUNE)', 0, 4))
	_uState23Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MARUNE)', 0, 4))
	_uState23Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MARUNE)', 0, 4))
	_uState23Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MARUNE)', 0, 4))
	_uState23Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MARUNE)', 0, 4))
	_uState23Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MARUNE)', 0, 4))
	_uState23Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MARUNE)', 0, 4))
	_uState23Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MARUNE)', 0, 4))
	_uState23Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MARUNE)', 0, 4))
	_uState23Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag11(MARUNE)', 0, 4))
	_uState23Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag12(MARUNE)', 0, 4))
	_uState23Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag13(MARUNE)', 0, 4))
	_uState23Trans8:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_050", "Derjenige, der einst Zerbo war und nun der rote Gott, wähnt in Euch einen Verbündeten!", 149, 16777215))
	_uState23Trans8:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_051", "Doch, oh je, wie liegt er fehl! Schon tosen die Ströme der Heere herbei um im Mahlstrom der Schlacht zu Asche zu werden!", 150, 16777215))
	_uState23Trans8:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_052", "Sechster Akt! Der Kampf gegen den roten Gott! Vernichtet ihn!", 151, 16777215))
	_uState23Trans8:AddAction (CScriptActionValueModify('', 'mf_P465_ArenaFightRunning', 1, 4))
	_uState23Trans8:AddAction (CScriptActionDialogRequestEnd("pl_Human", "marune"))
	_uState23Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(MARUNE)', 1, 4))
	_uState23Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState23Trans8 = nil

-- TO STATE: endconversation
_uState23Trans9 = GdsCreateTransition (_uState3, _uState23, "State_3", "State_23_T9", "Dialog")
	_uState23Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 9))
	_uState23Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P465_DLG_MARUNE_053PC", "Beginnt mit dem siebten Akt!", 99, 16777215))
	_uState23Trans9:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_054", "Man sollte annehmen, nun, da der Quell des Chaos vernichtet ist, wird es ruhig.", 153, 16777215))
	_uState23Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MARUNE)', 0, 4))
	_uState23Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MARUNE)', 0, 4))
	_uState23Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MARUNE)', 0, 4))
	_uState23Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MARUNE)', 0, 4))
	_uState23Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MARUNE)', 0, 4))
	_uState23Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MARUNE)', 0, 4))
	_uState23Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MARUNE)', 0, 4))
	_uState23Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MARUNE)', 0, 4))
	_uState23Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MARUNE)', 0, 4))
	_uState23Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MARUNE)', 0, 4))
	_uState23Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag11(MARUNE)', 0, 4))
	_uState23Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag12(MARUNE)', 0, 4))
	_uState23Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag13(MARUNE)', 0, 4))
	_uState23Trans9:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_055", "Doch die dunklen Götter haben erst mit ihrem Feldzug begonnen!", 154, 16777215))
	_uState23Trans9:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_056", "Und Eure Kämpfer erzittern, als Euer nächster Gegner bekannt wird! Zarach, der Bluttrinker, Erschaffer der dunklen Völker!", 155, 16777215))
	_uState23Trans9:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_057", "Siebter Akt! Stellt Euch Zarach und dem Zorn der dunklen Völker!", 156, 16777215))
	_uState23Trans9:AddAction (CScriptActionValueModify('', 'mf_P465_ArenaFightRunning', 1, 4))
	_uState23Trans9:AddAction (CScriptActionDialogRequestEnd("pl_Human", "marune"))
	_uState23Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(MARUNE)', 1, 4))
	_uState23Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState23Trans9 = nil

-- TO STATE: endconversation
_uState23Trans10 = GdsCreateTransition (_uState3, _uState23, "State_3", "State_23_T10", "Dialog")
	_uState23Trans10:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 10))
	_uState23Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P465_DLG_MARUNE_058PC", "Beginnt mit dem achten Akt!", 99, 16777215))
	_uState23Trans10:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_059", "Wird Nor seinen Bruder rächten? Nein, zuerst erwartet Euch ein anderer Gegner!", 158, 16777215))
	_uState23Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MARUNE)', 0, 4))
	_uState23Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MARUNE)', 0, 4))
	_uState23Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MARUNE)', 0, 4))
	_uState23Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MARUNE)', 0, 4))
	_uState23Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MARUNE)', 0, 4))
	_uState23Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MARUNE)', 0, 4))
	_uState23Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MARUNE)', 0, 4))
	_uState23Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MARUNE)', 0, 4))
	_uState23Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MARUNE)', 0, 4))
	_uState23Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MARUNE)', 0, 4))
	_uState23Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag11(MARUNE)', 0, 4))
	_uState23Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag12(MARUNE)', 0, 4))
	_uState23Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag13(MARUNE)', 0, 4))
	_uState23Trans10:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_060", "Niethalf! Herr der Weltenesse und Gott des Krieges! Was hat diesen Fels der Treue nur so verdorben!", 159, 16777215))
	_uState23Trans10:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_061", "Achter Akt! Meistert die Kraft des Kriegsgottes!", 160, 16777215))
	_uState23Trans10:AddAction (CScriptActionValueModify('', 'mf_P465_ArenaFightRunning', 1, 4))
	_uState23Trans10:AddAction (CScriptActionDialogRequestEnd("pl_Human", "marune"))
	_uState23Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(MARUNE)', 1, 4))
	_uState23Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState23Trans10 = nil

-- TO STATE: endconversation
_uState23Trans11 = GdsCreateTransition (_uState3, _uState23, "State_3", "State_23_T11", "Dialog")
	_uState23Trans11:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 11))
	_uState23Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P465_DLG_MARUNE_062PC", "Beginnt mit dem neunten Akt!", 99, 16777215))
	_uState23Trans11:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_063", "Leer ist es geworden, auf dem Schlachtfeld! Wer bleibt noch übrig!", 162, 16777215))
	_uState23Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MARUNE)', 0, 4))
	_uState23Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MARUNE)', 0, 4))
	_uState23Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MARUNE)', 0, 4))
	_uState23Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MARUNE)', 0, 4))
	_uState23Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MARUNE)', 0, 4))
	_uState23Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MARUNE)', 0, 4))
	_uState23Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MARUNE)', 0, 4))
	_uState23Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MARUNE)', 0, 4))
	_uState23Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MARUNE)', 0, 4))
	_uState23Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MARUNE)', 0, 4))
	_uState23Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag11(MARUNE)', 0, 4))
	_uState23Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag12(MARUNE)', 0, 4))
	_uState23Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag13(MARUNE)', 0, 4))
	_uState23Trans11:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_064", "Tiara! Älteste der Wächter, Herrin der Sonnenscheibe! Wie das Ende der Welt fährt die flammende Tänzerin in eure Reihen!", 163, 16777215))
	_uState23Trans11:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_065", "Neunter Akt! Löscht Tiaras Flamme!", 164, 16777215))
	_uState23Trans11:AddAction (CScriptActionValueModify('', 'mf_P465_ArenaFightRunning', 1, 4))
	_uState23Trans11:AddAction (CScriptActionDialogRequestEnd("pl_Human", "marune"))
	_uState23Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(MARUNE)', 1, 4))
	_uState23Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState23Trans11 = nil

-- TO STATE: endconversation
_uState23Trans12 = GdsCreateTransition (_uState3, _uState23, "State_3", "State_23_T12", "Dialog")
	_uState23Trans12:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 12))
	_uState23Trans12:AddAction (CScriptActionSay("pl_HumanAvatar", "P465_DLG_MARUNE_066PC", "Beginnt mit dem zehnten Akt!", 99, 16777215))
	_uState23Trans12:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_067", "Dunkel ist es geworden auf Eo. Still tritt Euch nun der letzte der Götter gegenüber.", 166, 16777215))
	_uState23Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MARUNE)', 0, 4))
	_uState23Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MARUNE)', 0, 4))
	_uState23Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MARUNE)', 0, 4))
	_uState23Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MARUNE)', 0, 4))
	_uState23Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MARUNE)', 0, 4))
	_uState23Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MARUNE)', 0, 4))
	_uState23Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MARUNE)', 0, 4))
	_uState23Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MARUNE)', 0, 4))
	_uState23Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MARUNE)', 0, 4))
	_uState23Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MARUNE)', 0, 4))
	_uState23Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag11(MARUNE)', 0, 4))
	_uState23Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag12(MARUNE)', 0, 4))
	_uState23Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag13(MARUNE)', 0, 4))
	_uState23Trans12:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_068", "Nor! Gott der Nacht, welcher den Glauben zu den Völkern brachte und der sich verschmäht und vergessen zu seiner dunklen Form wandelte!", 167, 16777215))
	_uState23Trans12:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_069", "Er ist der Letzte und Mächtigste. Unbesiegbar scheint er nun in der ewigen Finsternis!", 168, 16777215))
	_uState23Trans12:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_070", "Zehnter Akt! Der Kampf in der endlosen Nacht!", 169, 16777215))
	_uState23Trans12:AddAction (CScriptActionValueModify('', 'mf_P465_ArenaFightRunning', 1, 4))
	_uState23Trans12:AddAction (CScriptActionDialogRequestEnd("pl_Human", "marune"))
	_uState23Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(MARUNE)', 1, 4))
	_uState23Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState23Trans12 = nil

-- TO STATE: endconversation
_uState23Trans13 = GdsCreateTransition (_uState3, _uState23, "State_3", "State_23_T13", "Dialog")
	_uState23Trans13:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 13))
	_uState23Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P465_DLG_MARUNE_071PC", "Ist die es vorbei?", 99, 16777215))
	_uState23Trans13:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_072", "Meine Erzählung ja, die Geschichte niemals. Doch Ihr habt gekämpft wie ein Gott, Eo muss die Zukunft nicht fürchten!", 171, 16777215))
	_uState23Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(MARUNE)', 0, 4))
	_uState23Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(MARUNE)', 0, 4))
	_uState23Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(MARUNE)', 0, 4))
	_uState23Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(MARUNE)', 0, 4))
	_uState23Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(MARUNE)', 0, 4))
	_uState23Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(MARUNE)', 0, 4))
	_uState23Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(MARUNE)', 0, 4))
	_uState23Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag8(MARUNE)', 0, 4))
	_uState23Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag9(MARUNE)', 0, 4))
	_uState23Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag10(MARUNE)', 0, 4))
	_uState23Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag11(MARUNE)', 0, 4))
	_uState23Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag12(MARUNE)', 0, 4))
	_uState23Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag13(MARUNE)', 0, 4))
	_uState23Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P465_DLG_MARUNE_073PC", "Und das alles wird wirklich geschehen?", 172, 16777215))
	_uState23Trans13:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_074", "Wird oder wird nicht. Es ist nur einer der vielen Wege, den die Zeit gehen kann.", 173, 16777215))
	_uState23Trans13:AddAction (CScriptActionSay("pl_HumanAvatar", "P465_DLG_MARUNE_075PC", "Was wird danach sein? Finsternis?", 174, 16777215))
	_uState23Trans13:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_076", "Was wird sein? Eine gute Frage, aber vielleicht fragt Ihr Euch besser: fehlt da nicht noch jemand?", 175, 16777215))
	_uState23Trans13:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_077", "Wo ist denn Aonir, der Sternenwanderer, der Gottvater?", 176, 16777215))
	_uState23Trans13:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_078", "Vielleicht war das ja Eure Rolle in der Geschichte? Die Inkarnation Aonirs, erwachend aus ihrem Schlaf?", 177, 16777215))
	_uState23Trans13:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_079", "Was werdet Ihr tun? Werdet Ihr Eo im Zorn zerschmettern, oder hebt Ihr die Kontinente wieder aus der See und schenkt Eo einen Neuanfang?", 178, 16777215))
	_uState23Trans13:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_080", "Aber das soll eine andere Geschichte sein. Und wenn Euch gefallen hat, was Ihr hier heute gesehen, dann werft einmal einem Spielmann eine Münze in seine Schale!", 179, 16777215))
	_uState23Trans13:AddAction (CScriptActionSay("marune", "P465_DLG_MARUNE_081", "Denn wer weiß, was so ein kleines Geldstück alles im Lauf der Zeit bewirken kann!", 180, 16777215))
	_uState23Trans13:AddAction (CScriptActionValueModify('pl_Human', 'av_P465_ArenaState', 12, 4))
	_uState23Trans13:AddAction (CScriptActionDialogEnable('Marune', 0))
	_uState23Trans13:AddAction (CScriptActionDialogRequestEnd("pl_Human", "marune"))
	_uState23Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag13(MARUNE)', 1, 4))
	_uState23Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(MARUNE)', 1, 4))
	_uState23Trans13 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState23, _uState23, "State_23", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(MARUNE)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "marune"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(MARUNE)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MARUNE)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState23, _uState23, "State_23", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(MARUNE)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "marune"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(MARUNE)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MARUNE)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState23, _uState23, "State_23", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(MARUNE)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "marune"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(MARUNE)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MARUNE)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState23, _uState23, "State_23", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(MARUNE)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "marune"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(MARUNE)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MARUNE)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState23, _uState23, "State_23", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(MARUNE)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "marune"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(MARUNE)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MARUNE)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState23, _uState23, "State_23", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(MARUNE)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "marune"))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(MARUNE)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MARUNE)', 1, 4))
	_uEndActions6 = nil

-- TO SELF: EndConversation Actions #7
_uEndActions7 = GdsCreateTransition (_uState23, _uState23, "State_23", "EndActions_7", "Dialog")
	_uEndActions7:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag7(MARUNE)', 1, 2))
	_uEndActions7:AddCondition (CScriptConditionDialogStopped("pl_Human", "marune"))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(MARUNE)', 0, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MARUNE)', 1, 4))
	_uEndActions7 = nil

-- TO SELF: EndConversation Actions #8
_uEndActions8 = GdsCreateTransition (_uState23, _uState23, "State_23", "EndActions_8", "Dialog")
	_uEndActions8:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag8(MARUNE)', 1, 2))
	_uEndActions8:AddCondition (CScriptConditionDialogStopped("pl_Human", "marune"))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(MARUNE)', 0, 4))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MARUNE)', 1, 4))
	_uEndActions8 = nil

-- TO SELF: EndConversation Actions #9
_uEndActions9 = GdsCreateTransition (_uState23, _uState23, "State_23", "EndActions_9", "Dialog")
	_uEndActions9:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag9(MARUNE)', 1, 2))
	_uEndActions9:AddCondition (CScriptConditionDialogStopped("pl_Human", "marune"))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(MARUNE)', 0, 4))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MARUNE)', 1, 4))
	_uEndActions9 = nil

-- TO SELF: EndConversation Actions #10
_uEndActions10 = GdsCreateTransition (_uState23, _uState23, "State_23", "EndActions_10", "Dialog")
	_uEndActions10:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag10(MARUNE)', 1, 2))
	_uEndActions10:AddCondition (CScriptConditionDialogStopped("pl_Human", "marune"))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(MARUNE)', 0, 4))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MARUNE)', 1, 4))
	_uEndActions10 = nil

-- TO SELF: EndConversation Actions #11
_uEndActions11 = GdsCreateTransition (_uState23, _uState23, "State_23", "EndActions_11", "Dialog")
	_uEndActions11:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag11(MARUNE)', 1, 2))
	_uEndActions11:AddCondition (CScriptConditionDialogStopped("pl_Human", "marune"))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(MARUNE)', 0, 4))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MARUNE)', 1, 4))
	_uEndActions11 = nil

-- TO SELF: EndConversation Actions #12
_uEndActions12 = GdsCreateTransition (_uState23, _uState23, "State_23", "EndActions_12", "Dialog")
	_uEndActions12:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag12(MARUNE)', 1, 2))
	_uEndActions12:AddCondition (CScriptConditionDialogStopped("pl_Human", "marune"))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(MARUNE)', 0, 4))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MARUNE)', 1, 4))
	_uEndActions12 = nil

-- TO SELF: EndConversation Actions #13
_uEndActions13 = GdsCreateTransition (_uState23, _uState23, "State_23", "EndActions_13", "Dialog")
	_uEndActions13:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag13(MARUNE)', 1, 2))
	_uEndActions13:AddCondition (CScriptConditionDialogStopped("pl_Human", "marune"))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag13(MARUNE)', 0, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MARUNE)', 1, 4))
	_uEndActions13 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState23, _uBeginState, "State_23", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(MARUNE)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(MARUNE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('marune', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(MARUNE)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState3 = nil
_uState4 = nil
_uState6 = nil
_uState7 = nil
_uState23 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("marune_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(MARUNE)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(MARUNE)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'marune', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'marune', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'marune', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'marune', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'marune', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'marune', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'marune', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[134]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[134]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 134))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'marune', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[138]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[138]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 138))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'marune', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[143]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[143]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 143))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'marune', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[147]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[147]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 147))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'marune', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[152]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[152]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 152))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'marune', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[157]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[157]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 157))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'marune', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[161]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[161]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 161))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'marune', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[165]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[165]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 165))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'marune', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[170]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[170]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 170))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'marune', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'marune', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[130]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[130]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 130))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[131]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[131]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 131))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[132]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[132]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 132))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[133]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[133]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 133))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[135]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[135]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 135))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[136]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[136]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 136))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[137]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[137]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 137))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[139]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[139]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 139))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[140]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[140]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 140))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[141]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[141]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 141))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[142]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[142]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 142))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[144]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[144]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 144))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[145]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[145]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 145))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[146]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[146]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 146))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[148]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[148]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 148))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[149]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[149]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 149))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[150]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[150]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 150))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[151]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[151]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 151))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[153]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[153]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 153))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[154]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[154]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 154))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[155]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[155]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 155))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[156]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[156]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 156))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[158]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[158]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 158))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[159]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[159]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 159))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[160]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[160]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 160))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[162]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[162]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 162))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[163]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[163]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 163))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[164]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[164]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 164))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[166]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[166]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 166))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[167]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[167]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 167))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[168]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[168]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 168))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[169]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[169]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 169))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[171]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[171]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 171))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[172]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[172]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 172))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'marune', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[173]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[173]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 173))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[174]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[174]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 174))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'marune', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[175]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[175]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 175))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[176]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[176]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 176))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[177]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[177]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 177))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[178]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[178]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 178))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[179]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[179]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 179))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[180]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[180]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 180))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[181]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[181]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 181))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'marune'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "marune", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'marune', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
