local _uSM = GdsCreateStateMachine ("Odin_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState6 = GdsCreateState (_uSM, "State_6")
_uState7 = GdsCreateState (_uSM, "State_7")
_uState15 = GdsCreateState (_uSM, "State_15")
_uState19 = GdsCreateState (_uSM, "State_19")
_uState22 = GdsCreateState (_uSM, "State_22")
_uState25 = GdsCreateState (_uSM, "State_25")
_uState28 = GdsCreateState (_uSM, "State_28")
_uState31 = GdsCreateState (_uSM, "State_31")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('Odin'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(ODIN)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(ODIN)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('Odin', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("Odin", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "Odin"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(ODIN)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(ODIN)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('Odin', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("Odin")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(ODIN)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(ODIN)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(ODIN)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(ODIN)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(ODIN)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(ODIN)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(ODIN)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(ODIN)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Odin"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Odin', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(ODIN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState6Trans1 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T1", "Dialog")
	_uState6Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(ODIN)', 0, 2))
	_uState6Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopWifeIris', 99) ))
	_uState6Trans1:AddAction (CScriptActionChoice("P333_DLG_ODIN_006PC", "Ich suche Utrechts Frau, Iris.", 1, 16777215))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(ODIN)', 1, 4))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState6Trans1 = nil

-- TO STATE: choice
_uState6Trans2 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T2", "Dialog")
	_uState6Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(ODIN)', 0, 2))
	_uState6Trans2:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseDragonLanguage', 99) ))
	_uState6Trans2:AddAction (CScriptActionChoice("P333_DLG_ODIN_012PC", "Was für eine Sprache habt Ihr gemurmelt?", 2, 16777215))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(ODIN)', 1, 4))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState6Trans2 = nil

-- TO STATE: choice
_uState6Trans3 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T3", "Dialog")
	_uState6Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(ODIN)', 0, 2))
	_uState6Trans3:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopDragonRunesFound', 1))
	_uState6Trans3:AddAction (CScriptActionChoice("P333_DLG_ODIN_017PC", "Ich habe drei Runen, hier.", 3, 16777215))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(ODIN)', 1, 4))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState6Trans3 = nil

-- TO STATE: choice
_uState6Trans4 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T4", "Dialog")
	_uState6Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(ODIN)', 0, 2))
	_uState6Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopDragonRunesFound', 2))
	_uState6Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMoreDragonRunes', 99) ))
	_uState6Trans4:AddAction (CScriptActionChoice("P333_DLG_ODIN_019PC", "Braucht Ihr noch mehr Drachenrunen?", 4, 16777215))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(ODIN)', 1, 4))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState6Trans4 = nil

-- TO STATE: choice
_uState6Trans5 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T5", "Dialog")
	_uState6Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(ODIN)', 0, 2))
	_uState6Trans5:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopMoreDragonRunesFound', 1))
	_uState6Trans5:AddAction (CScriptActionChoice("P333_DLG_ODIN_021PC", "Ich habe weitere drei Drachenrunen!", 5, 16777215))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(ODIN)', 1, 4))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState6Trans5 = nil

-- TO STATE: choice
_uState6Trans6 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T6", "Dialog")
	_uState6Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag6(ODIN)', 0, 2))
	_uState6Trans6:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopDragonHunterFound', 1))
	_uState6Trans6:AddAction (CScriptActionChoice("P333_DLG_ODIN_029PC", "Eine riesige Echse und diese Rune!", 6, 16777215))
	_uState6Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(ODIN)', 1, 4))
	_uState6Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState6Trans6 = nil

-- TO STATE: choice
_uState6Trans7 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T7", "Dialog")
	_uState6Trans7:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag7(ODIN)', 0, 2))
	_uState6Trans7:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopShalagathKilled', 1))
	_uState6Trans7:AddAction (CScriptActionChoice("P333_DLG_ODIN_042PC", "Ja, und er hat sein Leben ausgehaucht!", 7, 16777215))
	_uState6Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(ODIN)', 1, 4))
	_uState6Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState6Trans7 = nil

-- TO STATE: choice
_uState6Trans8 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T8", "Dialog")
	_uState6Trans8:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 2))
	_uState6Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 0, 4))
	_uState6Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(ODIN)', 1, 4))
	_uState6Trans8:AddAction (CScriptActionShowChoices())
	_uState6Trans8 = nil

-- TO STATE: choice
_uState6Trans9 = GdsCreateTransition (_uState1, _uState6, "State_1", "State_6_T9", "Dialog")
	_uState6Trans9:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopBaseDragonLanguage', 99) )
	_uState6Trans9:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopBaseDragonLanguage', 1), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopDragonHunter', 99) )) ))
	_uState6Trans9:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopDragonHunter', 99), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopDragonHunterFound', 2) )) ))
	_uState6Trans9:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_005", "Habt Ihr Shalagath gefunden?", 104, 16777215))
	_uState6Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState6Trans9 = nil

-- TO STATE: choice
_uState6Trans10 = GdsCreateTransition (_uState1, _uState6, "State_1", "State_6_T10", "Dialog")
	_uState6Trans10:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseDragonLanguage', 99) ))
	_uState6Trans10:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_001", "Shht, nicht stören! Drak Tsuul ... Zuhuuul ... huuhuul ... Ach verdammt!", 100, 16777215))
	_uState6Trans10:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_002", "Ihr habt gerade Jahre der Forschung zunichte gemacht? Was habt Ihr zu Eurer Verteidigung vorzutragen?", 101, 16777215))
	_uState6Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState6Trans10 = nil

-- TO STATE: choice
_uState6Trans11 = GdsCreateTransition (_uState1, _uState6, "State_1", "State_6_T11", "Dialog")
	_uState6Trans11:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopBaseDragonLanguage', 1))
	_uState6Trans11:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopDragonHunter', 99) ))
	_uState6Trans11:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopBaseDragonLanguage', 99) )
	_uState6Trans11:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_003", "Ihr habt nicht vielleicht drei Drachenrunen gefunden, oder?", 102, 16777215))
	_uState6Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState6Trans11 = nil

-- TO STATE: choice
_uState6Trans12 = GdsCreateTransition (_uState1, _uState6, "State_1", "State_6_T12", "Dialog")
	_uState6Trans12:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopDragonHunter', 99))
	_uState6Trans12:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopDragonHunterFound', 2) ))
	_uState6Trans12:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopBaseDragonLanguage', 99) )
	_uState6Trans12:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopBaseDragonLanguage', 1), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopDragonHunter', 99) )) ))
	_uState6Trans12:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_004", "Und, habt Ihr etwas am Glitzerkamm gefunden?", 103, 16777215))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState6Trans12 = nil

-- TO STATE: choice
_uState6Trans13 = GdsCreateTransition (_uState7, _uState6, "State_7", "State_6_T13", "Dialog")
	_uState6Trans13:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseDragonLanguage', 99) ))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState6Trans13 = nil

-- TO STATE: choice
_uState6Trans14 = GdsCreateTransition (_uState7, _uState6, "State_7", "State_6_T14", "Dialog")
	_uState6Trans14:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopDragonRunesFound', 1))
	_uState6Trans14:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopBaseDragonLanguage', 99) )
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState6Trans14 = nil

-- TO STATE: choice
_uState6Trans15 = GdsCreateTransition (_uState7, _uState6, "State_7", "State_6_T15", "Dialog")
	_uState6Trans15:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopDragonRunesFound', 2))
	_uState6Trans15:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMoreDragonRunes', 99) ))
	_uState6Trans15:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopBaseDragonLanguage', 99) )
	_uState6Trans15:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopDragonRunesFound', 1) ))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState6Trans15 = nil

-- TO STATE: choice
_uState6Trans16 = GdsCreateTransition (_uState7, _uState6, "State_7", "State_6_T16", "Dialog")
	_uState6Trans16:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopMoreDragonRunesFound', 1))
	_uState6Trans16:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopBaseDragonLanguage', 99) )
	_uState6Trans16:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopDragonRunesFound', 1) ))
	_uState6Trans16:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopDragonRunesFound', 2), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMoreDragonRunes', 99) )) ))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState6Trans16 = nil

-- TO STATE: choice
_uState6Trans17 = GdsCreateTransition (_uState7, _uState6, "State_7", "State_6_T17", "Dialog")
	_uState6Trans17:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopDragonHunterFound', 1))
	_uState6Trans17:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopBaseDragonLanguage', 99) )
	_uState6Trans17:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopDragonRunesFound', 1) ))
	_uState6Trans17:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopDragonRunesFound', 2), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMoreDragonRunes', 99) )) ))
	_uState6Trans17:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMoreDragonRunesFound', 1) ))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState6Trans17 = nil

-- TO STATE: choice
_uState6Trans18 = GdsCreateTransition (_uState7, _uState6, "State_7", "State_6_T18", "Dialog")
	_uState6Trans18:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopShalagathKilled', 1))
	_uState6Trans18:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopBaseDragonLanguage', 99) )
	_uState6Trans18:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopDragonRunesFound', 1) ))
	_uState6Trans18:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopDragonRunesFound', 2), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMoreDragonRunes', 99) )) ))
	_uState6Trans18:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMoreDragonRunesFound', 1) ))
	_uState6Trans18:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopDragonHunterFound', 1) ))
	_uState6Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState6Trans18 = nil

-- TO STATE: choice
_uState6Trans19 = GdsCreateTransition (_uState15, _uState6, "State_15", "State_6_T19", "Dialog")
	_uState6Trans19:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopWifeIris', 99) ))
	_uState6Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState6Trans19 = nil

-- TO STATE: choice
_uState6Trans20 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T20", "Dialog")
	_uState6Trans20:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 3))
	_uState6Trans20:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_ODIN_017PC", "Ich habe drei Runen, hier.", 99, 16777215))
	_uState6Trans20:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_018", "Ahh! Jetzt wird vieles klar! Hier, das soll Euch entlohnen!", 117, 16777215))
	_uState6Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(ODIN)', 0, 4))
	_uState6Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(ODIN)', 0, 4))
	_uState6Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(ODIN)', 0, 4))
	_uState6Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(ODIN)', 0, 4))
	_uState6Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(ODIN)', 0, 4))
	_uState6Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(ODIN)', 0, 4))
	_uState6Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(ODIN)', 0, 4))
	_uState6Trans20:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 169, 999))
	_uState6Trans20:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopDragonRunesFound', 2, 0))
	_uState6Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState6Trans20 = nil

-- TO STATE: choice
_uState6Trans21 = GdsCreateTransition (_uState19, _uState6, "State_19", "State_6_T21", "Dialog")
	_uState6Trans21:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopWifeIris', 99) ))
	_uState6Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState6Trans21 = nil

-- TO STATE: choice
_uState6Trans22 = GdsCreateTransition (_uState22, _uState6, "State_22", "State_6_T22", "Dialog")
	_uState6Trans22:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopWifeIris', 99) ))
	_uState6Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState6Trans22 = nil

-- TO STATE: choice
_uState6Trans23 = GdsCreateTransition (_uState25, _uState6, "State_25", "State_6_T23", "Dialog")
	_uState6Trans23:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopWifeIris', 99) ))
	_uState6Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState6Trans23 = nil

-- TO STATE: choice
_uState6Trans24 = GdsCreateTransition (_uState28, _uState6, "State_28", "State_6_T24", "Dialog")
	_uState6Trans24:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopWifeIris', 99) ))
	_uState6Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState6Trans24 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Odin"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState6, _uBeginState, "State_6", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Odin"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Odin', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(ODIN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState7Trans1 = GdsCreateTransition (_uState6, _uState7, "State_6", "State_7_T1", "Dialog")
	_uState7Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 1))
	_uState7Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_ODIN_006PC", "Ich suche Utrechts Frau, Iris.", 99, 16777215))
	_uState7Trans1:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_007", "Meine Lippen sind versiegelt! Sie will diesen Sklaventreiber nie wieder sehen!", 106, 16777215))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(ODIN)', 0, 4))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(ODIN)', 0, 4))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(ODIN)', 0, 4))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(ODIN)', 0, 4))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(ODIN)', 0, 4))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(ODIN)', 0, 4))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(ODIN)', 0, 4))
	_uState7Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_ODIN_008PC", "Sie ist in Gefahr!", 107, 16777215))
	_uState7Trans1:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_009", "Netter Versuch! Und ich bin der Kaiser von Xu! Los verschwindet!", 108, 16777215))
	_uState7Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_ODIN_010PC", "Jandra hat uns gewarnt!", 109, 16777215))
	_uState7Trans1:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_011", "Hm ... Also ich sollte sie nach Sommerfall bringen, sie kennt dort wohl jemand. Ein alter Freund.", 110, 16777215))
	_uState7Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopTalkToMersadion', 2, 0))
	_uState7Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopWifeIris', 1, 0))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState7Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Odin"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState7, _uBeginState, "State_7", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Odin"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Odin', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(ODIN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState15Trans1 = GdsCreateTransition (_uState6, _uState15, "State_6", "State_15_T1", "Dialog")
	_uState15Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 2))
	_uState15Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_ODIN_012PC", "Was für eine Sprache habt Ihr gemurmelt?", 99, 16777215))
	_uState15Trans1:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_013", "Drachensprache, mein Freund! Die Former haben sie damals erforscht und das Geheimnis des Allfeuers, der größten magischen Kraft, erlernt!", 112, 16777215))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(ODIN)', 0, 4))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(ODIN)', 0, 4))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(ODIN)', 0, 4))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(ODIN)', 0, 4))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(ODIN)', 0, 4))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(ODIN)', 0, 4))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(ODIN)', 0, 4))
	_uState15Trans1:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_014", "Ich bin schon glücklich, wenn ich den einen oder anderen Feuerzauber damit wirken kann ... aber bisher habe ich nicht mehr als ein paar Worte erlernen können!", 113, 16777215))
	_uState15Trans1:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_015", "Es gibt noch so viel davon zu finden, draußen in der Welt!", 114, 16777215))
	_uState15Trans1:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_016", "Am singenden Berg, in Shal, in Uram Gor! Überall dort gibt es Drachenrunen! Wenn ich sie nur alle hätte!", 115, 16777215))
	_uState15Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 169, 999))
	_uState15Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseDragonLanguage', 1, 0))
	_uState15Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopDragonRunes', 1, 0))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState15Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Odin"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState15, _uBeginState, "State_15", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Odin"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Odin', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(ODIN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState19Trans1 = GdsCreateTransition (_uState6, _uState19, "State_6", "State_19_T1", "Dialog")
	_uState19Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 4))
	_uState19Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_ODIN_019PC", "Braucht Ihr noch mehr Drachenrunen?", 99, 16777215))
	_uState19Trans1:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_020", "So viele ich bekommen kann! Nur herbei damit! Ich glaube in Underhall, im Windflüstertal und im Eisenherzgebirge gibt es noch welche!", 119, 16777215))
	_uState19Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(ODIN)', 0, 4))
	_uState19Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(ODIN)', 0, 4))
	_uState19Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(ODIN)', 0, 4))
	_uState19Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(ODIN)', 0, 4))
	_uState19Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(ODIN)', 0, 4))
	_uState19Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(ODIN)', 0, 4))
	_uState19Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(ODIN)', 0, 4))
	_uState19Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopMoreDragonRunes', 1, 0))
	_uState19Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState19Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState19, _uState19, "State_19", "State_19", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Odin"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState19, _uBeginState, "State_19", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Odin"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Odin', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(ODIN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState22Trans1 = GdsCreateTransition (_uState6, _uState22, "State_6", "State_22_T1", "Dialog")
	_uState22Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 5))
	_uState22Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_ODIN_021PC", "Ich habe weitere drei Drachenrunen!", 99, 16777215))
	_uState22Trans1:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_022", "Wundervoll! So langsam beginne ich diesen Text zu verstehen ...", 121, 16777215))
	_uState22Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(ODIN)', 0, 4))
	_uState22Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(ODIN)', 0, 4))
	_uState22Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(ODIN)', 0, 4))
	_uState22Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(ODIN)', 0, 4))
	_uState22Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(ODIN)', 0, 4))
	_uState22Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(ODIN)', 0, 4))
	_uState22Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(ODIN)', 0, 4))
	_uState22Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_ODIN_023PC", "Welchen Text?", 122, 16777215))
	_uState22Trans1:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_024", "Es ist eine Abschrift von einer Runenschnitzerei aus den Windwallbergen. Sie bedeckt dort die gesamte Flanke des Berges Regan Gor!", 123, 16777215))
	_uState22Trans1:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_025", "Niemand weiß, wer diese Schrift erstellt hat. Es scheint mir aber kein Drache zu sein, sondern jemand, der Drachen gejagt hat!", 124, 16777215))
	_uState22Trans1:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_026", "Ein grausames, großes Geschöpf, das die Drachen ihres Blutes wegen erlegt hat!", 125, 16777215))
	_uState22Trans1:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_027", "Hier wird ein Hort nahe der Glitzerkamm erwähnt, an dem der Jäger sich mit anderen seiner Art getroffen hat.", 126, 16777215))
	_uState22Trans1:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_028", "Sucht ihn auf! Vielleicht findet Ihr dort weitere Hinweise!", 127, 16777215))
	_uState22Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 169, 999))
	_uState22Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopMoreDragonRunesFound', 2, 0))
	_uState22Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopDragonHunter', 1, 0))
	_uState22Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState22Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState22, _uState22, "State_22", "State_22", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Odin"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState22, _uBeginState, "State_22", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Odin"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Odin', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(ODIN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState25Trans1 = GdsCreateTransition (_uState6, _uState25, "State_6", "State_25_T1", "Dialog")
	_uState25Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 6))
	_uState25Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_ODIN_029PC", "Eine riesige Echse und diese Rune!", 99, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_030", "Hm ... Diese Rune ist anders! Es gibt einen Teil der Abschrift, in dem genau diese Rune mehrfach vorkommt!", 129, 16777215))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(ODIN)', 0, 4))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(ODIN)', 0, 4))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(ODIN)', 0, 4))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(ODIN)', 0, 4))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(ODIN)', 0, 4))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(ODIN)', 0, 4))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(ODIN)', 0, 4))
	_uState25Trans1:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_031", "Jetzt verstehe ich! Was Ihr dort besiegt habt, ist ein Verschlinger! Es sind gefallene Drachen!", 130, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_032", "Hier steht, die Verschlinger wurden geboren, als es einen Krieg unter den Drachen gab. Einige wenige versuchten über alle zu herrschen!", 131, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_033", "Ihr Krieg tobte so stark, dass die Wächter Aonirs Werk in Gefahr sahen und eingriffen.", 132, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_034", "Sie töteten die herrschsüchtigen Drachen nicht, verbannten sie jedoch auf den Boden und nahmen ihrem Blut den Funken der Schöpfung, so dass sie nicht mehr die Macht und Würde ihrer geflügelten Brüder besitzen sollten.", 133, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_035", "Diese wurden die Verschlinger. Statt ein Leben in Demut zu führen, wie es die Götter wollten, sind sie ständig getrieben von dem Hunger nach dem Funken der Schöpfung, der ihnen fehlt und im Blut ihrer Brüder pocht!", 134, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_ODIN_036PC", "Einer von ihnen war es, der Ur getötet hat!", 135, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_037", "Ja! Es heißt, wir Menschen haben die Drachen vertrieben. Aber wer weiß wie viele von diesen Bestien verschlungen wurden.", 136, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_038", "Dieser hier war ein besonders erfolgreicher Jäger! Sein Name ist Shalagath.", 137, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_ODIN_039PC", "Lebt er noch?", 138, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_040", "Schwer zu sagen. Er erwähnt einen Schlafplatz, wo er warten wird, bis die Beute wieder reichhaltiger wird. Der Neunschattenberg.", 139, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_ODIN_041PC", "Sollte er noch leben, wird er das nicht mehr lange tun! Er wird büßen für die Blutsbrüder, die er verschlungen hat!", 140, 16777215))
	_uState25Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopDragonHunterFound', 2, 0))
	_uState25Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseDragonLanguage', 2, 0))
	_uState25Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseDevourers', 1, 0))
	_uState25Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopShalagath', 1, 0))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState25Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState25, _uState25, "State_25", "State_25", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Odin"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState25, _uBeginState, "State_25", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Odin"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Odin', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(ODIN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState28Trans1 = GdsCreateTransition (_uState6, _uState28, "State_6", "State_28_T1", "Dialog")
	_uState28Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 7))
	_uState28Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_ODIN_042PC", "Ja, und er hat sein Leben ausgehaucht!", 99, 16777215))
	_uState28Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_ODIN_043PC", "Meine Brüder sind gerächt!", 142, 16777215))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(ODIN)', 0, 4))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(ODIN)', 0, 4))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(ODIN)', 0, 4))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(ODIN)', 0, 4))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(ODIN)', 0, 4))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag6(ODIN)', 0, 4))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag7(ODIN)', 0, 4))
	_uState28Trans1:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_044", "Schade nur, dass es keine mehr gibt. Drachen sind zwar nicht eben Freunde der Menschen, aber es ist schon bedauerlich, diese majestätischen Geschöpfe ausgelöscht zu wissen.", 143, 16777215))
	_uState28Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_ODIN_045PC", "Ich weiß nicht. Ich spüre immer noch das Feuer. Vielleicht war Ur nicht der Letzte.", 144, 16777215))
	_uState28Trans1:AddAction (CScriptActionSay("Odin", "P333_DLG_ODIN_046", "Dann viel Glück auf Eurer Suche. Ich werde mich wieder meinen Studien widmen.", 145, 16777215))
	_uState28Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopShalagathKilled', 2, 0))
	_uState28Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseDevourers', 2, 0))
	_uState28Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState28Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState28, _uState28, "State_28", "State_28", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Odin"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState28, _uBeginState, "State_28", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Odin"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Odin', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(ODIN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState31Trans1 = GdsCreateTransition (_uState7, _uState31, "State_7", "State_31_T1", "Dialog")
	_uState31Trans1:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopBaseDragonLanguage', 99) )
	_uState31Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopDragonRunesFound', 1) ))
	_uState31Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopDragonRunesFound', 2), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMoreDragonRunes', 99) )) ))
	_uState31Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMoreDragonRunesFound', 1) ))
	_uState31Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopDragonHunterFound', 1) ))
	_uState31Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopShalagathKilled', 1) ))
	_uState31Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Odin"))
	_uState31Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(ODIN)', 1, 4))
	_uState31Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState31Trans1 = nil

-- TO STATE: endconversation
_uState31Trans2 = GdsCreateTransition (_uState15, _uState31, "State_15", "State_31_T2", "Dialog")
	_uState31Trans2:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopWifeIris', 99) )
	_uState31Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Odin"))
	_uState31Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(ODIN)', 1, 4))
	_uState31Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState31Trans2 = nil

-- TO STATE: endconversation
_uState31Trans3 = GdsCreateTransition (_uState19, _uState31, "State_19", "State_31_T3", "Dialog")
	_uState31Trans3:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopWifeIris', 99) )
	_uState31Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Odin"))
	_uState31Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(ODIN)', 1, 4))
	_uState31Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState31Trans3 = nil

-- TO STATE: endconversation
_uState31Trans4 = GdsCreateTransition (_uState22, _uState31, "State_22", "State_31_T4", "Dialog")
	_uState31Trans4:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopWifeIris', 99) )
	_uState31Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Odin"))
	_uState31Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(ODIN)', 1, 4))
	_uState31Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState31Trans4 = nil

-- TO STATE: endconversation
_uState31Trans5 = GdsCreateTransition (_uState25, _uState31, "State_25", "State_31_T5", "Dialog")
	_uState31Trans5:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopWifeIris', 99) )
	_uState31Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Odin"))
	_uState31Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(ODIN)', 1, 4))
	_uState31Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState31Trans5 = nil

-- TO STATE: endconversation
_uState31Trans6 = GdsCreateTransition (_uState28, _uState31, "State_28", "State_31_T6", "Dialog")
	_uState31Trans6:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopWifeIris', 99) )
	_uState31Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Odin"))
	_uState31Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(ODIN)', 1, 4))
	_uState31Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(ODIN)', 1, 4))
	_uState31Trans6 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState31, _uState31, "State_31", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(ODIN)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "Odin"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(ODIN)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(ODIN)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState31, _uState31, "State_31", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(ODIN)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "Odin"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(ODIN)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(ODIN)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState31, _uState31, "State_31", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(ODIN)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "Odin"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(ODIN)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(ODIN)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState31, _uState31, "State_31", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(ODIN)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "Odin"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(ODIN)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(ODIN)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState31, _uState31, "State_31", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(ODIN)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "Odin"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(ODIN)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(ODIN)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState31, _uState31, "State_31", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(ODIN)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "Odin"))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(ODIN)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(ODIN)', 1, 4))
	_uEndActions6 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState31, _uBeginState, "State_31", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(ODIN)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(ODIN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Odin', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(ODIN)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState6 = nil
_uState7 = nil
_uState15 = nil
_uState19 = nil
_uState22 = nil
_uState25 = nil
_uState28 = nil
_uState31 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("Odin_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(ODIN)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(ODIN)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Odin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Odin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Odin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Odin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Odin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Odin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[141]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[141]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 141))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Odin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Odin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Odin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Odin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[130]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[130]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 130))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[131]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[131]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 131))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[132]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[132]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 132))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[133]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[133]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 133))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[134]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[134]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 134))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[135]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[135]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 135))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Odin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[136]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[136]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 136))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[137]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[137]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 137))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[138]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[138]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 138))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Odin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[139]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[139]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 139))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[140]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[140]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 140))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Odin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[142]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[142]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 142))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Odin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[143]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[143]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 143))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[144]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[144]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 144))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Odin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[145]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[145]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 145))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Odin'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Odin", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Odin', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
