local _uSM = GdsCreateStateMachine ("Anderhall_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState5 = GdsCreateState (_uSM, "State_5")
_uState13 = GdsCreateState (_uSM, "State_13")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('Anderhall'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(ANDERHALL)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(ANDERHALL)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('Anderhall', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("Anderhall", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "Anderhall"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(ANDERHALL)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(ANDERHALL)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('Anderhall', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("Anderhall")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(ANDERHALL)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(ANDERHALL)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(ANDERHALL)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(ANDERHALL)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(ANDERHALL)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(ANDERHALL)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(ANDERHALL)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(ANDERHALL)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ANDERHALL)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Anderhall"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Anderhall', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(ANDERHALL)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState5Trans1 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T1", "Dialog")
	_uState5Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(ANDERHALL)', 0, 2))
	_uState5Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseTreasureHunt', 99) ))
	_uState5Trans1:AddAction (CScriptActionChoice("P333_DLG_ANDERHALL_007PC", "Habt Ihr noch mehr als Geschwätz auf Lager?", 1, 16777215))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(ANDERHALL)', 1, 4))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ANDERHALL)', 1, 4))
	_uState5Trans1 = nil

-- TO STATE: choice
_uState5Trans2 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T2", "Dialog")
	_uState5Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(ANDERHALL)', 0, 2))
	_uState5Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopGateOfSwordsMapFound', 1))
	_uState5Trans2:AddAction (CScriptActionChoice("P333_DLG_ANDERHALL_014PC", "Ich habe das Kartenteil vom Tor der Schwerter!", 2, 16777215))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(ANDERHALL)', 1, 4))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ANDERHALL)', 1, 4))
	_uState5Trans2 = nil

-- TO STATE: choice
_uState5Trans3 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T3", "Dialog")
	_uState5Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(ANDERHALL)', 0, 2))
	_uState5Trans3:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopTuscariMapFound', 1))
	_uState5Trans3:AddAction (CScriptActionChoice("P333_DLG_ANDERHALL_016PC", "Ich habe das Kartenteil aus Tuscari!", 3, 16777215))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(ANDERHALL)', 1, 4))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ANDERHALL)', 1, 4))
	_uState5Trans3 = nil

-- TO STATE: choice
_uState5Trans4 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T4", "Dialog")
	_uState5Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(ANDERHALL)', 0, 2))
	_uState5Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopMagnetStonesMapFound', 1))
	_uState5Trans4:AddAction (CScriptActionChoice("P333_DLG_ANDERHALL_019PC", "Ich habe das Kartenteil von den Magnetsteinen!", 4, 16777215))
	_uState5Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(ANDERHALL)', 1, 4))
	_uState5Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ANDERHALL)', 1, 4))
	_uState5Trans4 = nil

-- TO STATE: choice
_uState5Trans5 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T5", "Dialog")
	_uState5Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(ANDERHALL)', 0, 2))
	_uState5Trans5:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopUnderhallMapFound', 1))
	_uState5Trans5:AddAction (CScriptActionChoice("P333_DLG_ANDERHALL_021PC", "Ich habe das Kartenteil aus Underhall!", 5, 16777215))
	_uState5Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(ANDERHALL)', 1, 4))
	_uState5Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ANDERHALL)', 1, 4))
	_uState5Trans5 = nil

-- TO STATE: choice
_uState5Trans6 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T6", "Dialog")
	_uState5Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(ANDERHALL)', 0, 2))
	_uState5Trans6:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopGoldenFieldsMapFound', 1))
	_uState5Trans6:AddAction (CScriptActionChoice("P333_DLG_ANDERHALL_024PC", "Ich habe das Kartenteil aus Siebenburg!", 6, 16777215))
	_uState5Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(ANDERHALL)', 1, 4))
	_uState5Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ANDERHALL)', 1, 4))
	_uState5Trans6 = nil

-- TO STATE: choice
_uState5Trans7 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T7", "Dialog")
	_uState5Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(ANDERHALL)', 0, 2))
	_uState5Trans7:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopAnkbrandLightFound', 1))
	_uState5Trans7:AddAction (CScriptActionChoice("P333_DLG_ANDERHALL_029PC", "Ja! Allerdings sieht es nicht ganz nach der Erleuchtung aus.", 7, 16777215))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(ANDERHALL)', 1, 4))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ANDERHALL)', 1, 4))
	_uState5Trans7 = nil

-- TO STATE: choice
_uState5Trans8 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T8", "Dialog")
	_uState5Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(ANDERHALL)', 1, 2))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ANDERHALL)', 0, 4))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(ANDERHALL)', 1, 4))
	_uState5Trans8:AddAction (CScriptActionShowChoices())
	_uState5Trans8 = nil

-- TO STATE: choice
_uState5Trans9 = GdsCreateTransition (_uState1, _uState5, "State_1", "State_5_T9", "Dialog")
	_uState5Trans9:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopBaseTreasureHunt', 99) )
	_uState5Trans9:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopBaseTreasureHunt', 1), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopAnkbrandLight', 99) )) ))
	_uState5Trans9:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_006", "Hab Ihr das Licht?", 105, 16777215))
	_uState5Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ANDERHALL)', 1, 4))
	_uState5Trans9 = nil

-- TO STATE: choice
_uState5Trans10 = GdsCreateTransition (_uState1, _uState5, "State_1", "State_5_T10", "Dialog")
	_uState5Trans10:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseTreasureHunt', 99) ))
	_uState5Trans10:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_001", "Ja nun! Welch geistvolle Gesellschaft steht mir da ins Haus!", 100, 16777215))
	_uState5Trans10:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_002", "Ihr seid doch bestimmt einer dieser Rüpel, die Halicos durch die Weltgeschichte scheucht? Nicht sehr schlau ...", 101, 16777215))
	_uState5Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_ANDERHALL_003PC", "Schlau genug für dich, Schwätzer.", 102, 16777215))
	_uState5Trans10:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_004", "Hohoo! Diese Rhetorik! Ich erbleiche! Ein gutes Buch gegessen vorhin, ja?", 103, 16777215))
	_uState5Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ANDERHALL)', 1, 4))
	_uState5Trans10 = nil

-- TO STATE: choice
_uState5Trans11 = GdsCreateTransition (_uState1, _uState5, "State_1", "State_5_T11", "Dialog")
	_uState5Trans11:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopBaseTreasureHunt', 1))
	_uState5Trans11:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopAnkbrandLight', 99) ))
	_uState5Trans11:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopBaseTreasureHunt', 99) )
	_uState5Trans11:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_005", "Habt Ihr ein Kartenteil?", 104, 16777215))
	_uState5Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ANDERHALL)', 1, 4))
	_uState5Trans11 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Anderhall"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState5, _uBeginState, "State_5", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Anderhall"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Anderhall', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(ANDERHALL)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState13Trans1 = GdsCreateTransition (_uState5, _uState13, "State_5", "State_13_T1", "Dialog")
	_uState13Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 1))
	_uState13Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_ANDERHALL_007PC", "Habt Ihr noch mehr als Geschwätz auf Lager?", 99, 16777215))
	_uState13Trans1:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_008", "Hm, hm. Tja, ich hätte da was ...", 107, 16777215))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(ANDERHALL)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(ANDERHALL)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(ANDERHALL)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(ANDERHALL)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(ANDERHALL)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(ANDERHALL)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(ANDERHALL)', 0, 4))
	_uState13Trans1:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_009", "Ich drücke mich hier nur herum, weil ich die Karte zum Licht von Ankbrand suche.", 108, 16777215))
	_uState13Trans1:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_010", "Ein sagenhaftes Schmuckstück, in dessen Inneren man das wahre Geheimnis des Seins erblickt!", 109, 16777215))
	_uState13Trans1:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_011", "Unendlich wertvoll! Die Karte, die seinen Standort markiert, ist natürlich durch viele Hände gegangen ... Und dabei immer mehr zerstört worden.", 110, 16777215))
	_uState13Trans1:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_012", "Mit anderen Worten, ich möchte, dass Ihr für mich die Karte zusammensucht.", 111, 16777215))
	_uState13Trans1:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_013", "Das erste Stück war im Besitz der Orks am Tor der Schwerter.", 112, 16777215))
	_uState13Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 163, 999))
	_uState13Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 164, 999))
	_uState13Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 165, 999))
	_uState13Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 166, 999))
	_uState13Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 167, 999))
	_uState13Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 168, 999))
	_uState13Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseTreasureHunt', 1, 0))
	_uState13Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopGateOfSwordsMap', 1, 0))
	_uState13Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Anderhall"))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(ANDERHALL)', 1, 4))
	_uState13Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ANDERHALL)', 1, 4))
	_uState13Trans1 = nil

-- TO STATE: endconversation
_uState13Trans2 = GdsCreateTransition (_uState5, _uState13, "State_5", "State_13_T2", "Dialog")
	_uState13Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 2))
	_uState13Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_ANDERHALL_014PC", "Ich habe das Kartenteil vom Tor der Schwerter!", 99, 16777215))
	_uState13Trans2:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_015", "Bravourös! Das nächste wird in der Wüste von Tuscari vermutet!", 114, 16777215))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(ANDERHALL)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(ANDERHALL)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(ANDERHALL)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(ANDERHALL)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(ANDERHALL)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(ANDERHALL)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(ANDERHALL)', 0, 4))
	_uState13Trans2:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 163, 999))
	_uState13Trans2:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 164, 999))
	_uState13Trans2:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 165, 999))
	_uState13Trans2:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 166, 999))
	_uState13Trans2:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 167, 999))
	_uState13Trans2:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 168, 999))
	_uState13Trans2:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopGateOfSwordsMapFound', 2, 0))
	_uState13Trans2:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopTuscariMap', 1, 0))
	_uState13Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Anderhall"))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(ANDERHALL)', 1, 4))
	_uState13Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ANDERHALL)', 1, 4))
	_uState13Trans2 = nil

-- TO STATE: endconversation
_uState13Trans3 = GdsCreateTransition (_uState5, _uState13, "State_5", "State_13_T3", "Dialog")
	_uState13Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 3))
	_uState13Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_ANDERHALL_016PC", "Ich habe das Kartenteil aus Tuscari!", 99, 16777215))
	_uState13Trans3:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_017", "Ihr macht Euch! Ich habe inzwischen weiter nachgeforscht. Ein weitere Kartenteil befand sich im Besitz eines Wahnsinnigen!", 116, 16777215))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(ANDERHALL)', 0, 4))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(ANDERHALL)', 0, 4))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(ANDERHALL)', 0, 4))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(ANDERHALL)', 0, 4))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(ANDERHALL)', 0, 4))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(ANDERHALL)', 0, 4))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(ANDERHALL)', 0, 4))
	_uState13Trans3:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_018", "Er hat sein Leben bei den Magnetsteinen ausgehaucht. Auf der Suche nach Unsterblichkeit, ha!", 117, 16777215))
	_uState13Trans3:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 164, 999))
	_uState13Trans3:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 165, 999))
	_uState13Trans3:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 166, 999))
	_uState13Trans3:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 167, 999))
	_uState13Trans3:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 168, 999))
	_uState13Trans3:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopTuscariMapFound', 2, 0))
	_uState13Trans3:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopMagnetStonesMap', 1, 0))
	_uState13Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Anderhall"))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(ANDERHALL)', 1, 4))
	_uState13Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ANDERHALL)', 1, 4))
	_uState13Trans3 = nil

-- TO STATE: endconversation
_uState13Trans4 = GdsCreateTransition (_uState5, _uState13, "State_5", "State_13_T4", "Dialog")
	_uState13Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 4))
	_uState13Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_ANDERHALL_019PC", "Ich habe das Kartenteil von den Magnetsteinen!", 99, 16777215))
	_uState13Trans4:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_020", "Wundervoll, ich hatte Recht! Dann geht es jetzt weiter nach Underhall! Die Zwerge dort haben ein weiteres Kartenteil gehortet.", 119, 16777215))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(ANDERHALL)', 0, 4))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(ANDERHALL)', 0, 4))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(ANDERHALL)', 0, 4))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(ANDERHALL)', 0, 4))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(ANDERHALL)', 0, 4))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(ANDERHALL)', 0, 4))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(ANDERHALL)', 0, 4))
	_uState13Trans4:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 165, 999))
	_uState13Trans4:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 166, 999))
	_uState13Trans4:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 167, 999))
	_uState13Trans4:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 168, 999))
	_uState13Trans4:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopMagnetStonesMapFound', 2, 0))
	_uState13Trans4:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopUnderhallMap', 1, 0))
	_uState13Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Anderhall"))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(ANDERHALL)', 1, 4))
	_uState13Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ANDERHALL)', 1, 4))
	_uState13Trans4 = nil

-- TO STATE: endconversation
_uState13Trans5 = GdsCreateTransition (_uState5, _uState13, "State_5", "State_13_T5", "Dialog")
	_uState13Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 5))
	_uState13Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_ANDERHALL_021PC", "Ich habe das Kartenteil aus Underhall!", 99, 16777215))
	_uState13Trans5:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_022", "Bald ist sie komplett! Das nächste Teil müsste bei einem Sammler in Siebenburg zu finden sein!", 121, 16777215))
	_uState13Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(ANDERHALL)', 0, 4))
	_uState13Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(ANDERHALL)', 0, 4))
	_uState13Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(ANDERHALL)', 0, 4))
	_uState13Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(ANDERHALL)', 0, 4))
	_uState13Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(ANDERHALL)', 0, 4))
	_uState13Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(ANDERHALL)', 0, 4))
	_uState13Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(ANDERHALL)', 0, 4))
	_uState13Trans5:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_023", "Hoffentlich kommt ihr da heran! Viel Glück!", 122, 16777215))
	_uState13Trans5:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 166, 999))
	_uState13Trans5:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 167, 999))
	_uState13Trans5:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 168, 999))
	_uState13Trans5:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopUnderhallMapFound', 2, 0))
	_uState13Trans5:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopGoldenFieldsMap', 1, 0))
	_uState13Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Anderhall"))
	_uState13Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(ANDERHALL)', 1, 4))
	_uState13Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ANDERHALL)', 1, 4))
	_uState13Trans5 = nil

-- TO STATE: endconversation
_uState13Trans6 = GdsCreateTransition (_uState5, _uState13, "State_5", "State_13_T6", "Dialog")
	_uState13Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 6))
	_uState13Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_ANDERHALL_024PC", "Ich habe das Kartenteil aus Siebenburg!", 99, 16777215))
	_uState13Trans6:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_025", "Großartig. Mit dem Teil der Karte, das ich bereits erworben habe, ist sie komplett!", 124, 16777215))
	_uState13Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(ANDERHALL)', 0, 4))
	_uState13Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(ANDERHALL)', 0, 4))
	_uState13Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(ANDERHALL)', 0, 4))
	_uState13Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(ANDERHALL)', 0, 4))
	_uState13Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(ANDERHALL)', 0, 4))
	_uState13Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(ANDERHALL)', 0, 4))
	_uState13Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(ANDERHALL)', 0, 4))
	_uState13Trans6:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_026", "Ich erkenne ... Das Licht liegt verborgen in einer Ebene aus Glas ... Die gläsernen Ebenen!", 125, 16777215))
	_uState13Trans6:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_027", "Bergt das Licht von Ankbrand aus den gläsernen Ebenen! Die Karte hat einen alten Zauber geweckt!", 126, 16777215))
	_uState13Trans6:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_028", "Ein Licht wird Euch dort den Ort weisen, an dem Ihr suchen müsst.", 127, 16777215))
	_uState13Trans6:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 167, 999))
	_uState13Trans6:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 168, 999))
	_uState13Trans6:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopGoldenFieldsMapFound', 2, 0))
	_uState13Trans6:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopAnkbrandLight', 1, 0))
	_uState13Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Anderhall"))
	_uState13Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(ANDERHALL)', 1, 4))
	_uState13Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ANDERHALL)', 1, 4))
	_uState13Trans6 = nil

-- TO STATE: endconversation
_uState13Trans7 = GdsCreateTransition (_uState5, _uState13, "State_5", "State_13_T7", "Dialog")
	_uState13Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 7))
	_uState13Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_ANDERHALL_029PC", "Ja! Allerdings sieht es nicht ganz nach der Erleuchtung aus.", 99, 16777215))
	_uState13Trans7:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_030", "Ein Spiegel? Es ist ein SPIEGEL?", 129, 16777215))
	_uState13Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(ANDERHALL)', 0, 4))
	_uState13Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(ANDERHALL)', 0, 4))
	_uState13Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(ANDERHALL)', 0, 4))
	_uState13Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(ANDERHALL)', 0, 4))
	_uState13Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(ANDERHALL)', 0, 4))
	_uState13Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(ANDERHALL)', 0, 4))
	_uState13Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(ANDERHALL)', 0, 4))
	_uState13Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_ANDERHALL_031PC", "Das Geheimnis des Seins ist wohl, Euch selbst zu erkennen.", 130, 16777215))
	_uState13Trans7:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_032", "Tand! Verklärter, billiger ... Tand! Ein Symbol, weiter nichts!", 131, 16777215))
	_uState13Trans7:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_033", "Dieser elende McWinter! Ich werde ihn ... Ich werde ... Oh, er wird leiden, ja!", 132, 16777215))
	_uState13Trans7:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_034", "Was schaut Ihr denn so? Ihr wollt doch wohl nicht etwa ...?", 133, 16777215))
	_uState13Trans7:AddAction (CScriptActionSay("Anderhall", "P333_DLG_ANDERHALL_035", "Natürlich wollt Ihr. Ihr seid Viele, ich bin Wenige, und dieser Tag ist sowieso vertan, also was soll's. Hier nehmt Eure Entlohnung! Treibt mich in den Ruin! Bitte sehr!", 134, 16777215))
	_uState13Trans7:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 168, 999))
	_uState13Trans7:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopAnkbrandLightFound', 2, 0))
	_uState13Trans7:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseTreasureHunt', 2, 0))
	_uState13Trans7:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Anderhall"))
	_uState13Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(ANDERHALL)', 1, 4))
	_uState13Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ANDERHALL)', 1, 4))
	_uState13Trans7 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState13, _uState13, "State_13", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(ANDERHALL)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "Anderhall"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(ANDERHALL)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(ANDERHALL)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState13, _uState13, "State_13", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(ANDERHALL)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "Anderhall"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(ANDERHALL)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(ANDERHALL)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState13, _uState13, "State_13", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(ANDERHALL)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "Anderhall"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(ANDERHALL)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(ANDERHALL)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState13, _uState13, "State_13", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(ANDERHALL)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "Anderhall"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(ANDERHALL)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(ANDERHALL)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState13, _uState13, "State_13", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(ANDERHALL)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "Anderhall"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(ANDERHALL)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(ANDERHALL)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState13, _uState13, "State_13", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(ANDERHALL)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "Anderhall"))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(ANDERHALL)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(ANDERHALL)', 1, 4))
	_uEndActions6 = nil

-- TO SELF: EndConversation Actions #7
_uEndActions7 = GdsCreateTransition (_uState13, _uState13, "State_13", "EndActions_7", "Dialog")
	_uEndActions7:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag7(ANDERHALL)', 1, 2))
	_uEndActions7:AddCondition (CScriptConditionDialogStopped("pl_Human", "Anderhall"))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(ANDERHALL)', 0, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(ANDERHALL)', 1, 4))
	_uEndActions7 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState13, _uBeginState, "State_13", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(ANDERHALL)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(ANDERHALL)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Anderhall', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(ANDERHALL)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState5 = nil
_uState13 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("Anderhall_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(ANDERHALL)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(ANDERHALL)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Anderhall', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Anderhall', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Anderhall', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Anderhall', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Anderhall', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Anderhall', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Anderhall', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Anderhall', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[130]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[130]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 130))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Anderhall', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[131]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[131]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 131))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[132]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[132]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 132))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[133]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[133]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 133))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[134]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[134]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 134))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Anderhall'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Anderhall", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Anderhall', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
