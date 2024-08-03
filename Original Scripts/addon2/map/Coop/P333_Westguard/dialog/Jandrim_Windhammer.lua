local _uSM = GdsCreateStateMachine ("Jandrim_Windhammer_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState4 = GdsCreateState (_uSM, "State_4")
_uState6 = GdsCreateState (_uSM, "State_6")
_uState9 = GdsCreateState (_uSM, "State_9")
_uState12 = GdsCreateState (_uSM, "State_12")
_uState16 = GdsCreateState (_uSM, "State_16")
_uState17 = GdsCreateState (_uSM, "State_17")
_uState20 = GdsCreateState (_uSM, "State_20")
_uState23 = GdsCreateState (_uSM, "State_23")
_uState26 = GdsCreateState (_uSM, "State_26")
_uState29 = GdsCreateState (_uSM, "State_29")
_uState34 = GdsCreateState (_uSM, "State_34")
_uState37 = GdsCreateState (_uSM, "State_37")
_uState40 = GdsCreateState (_uSM, "State_40")
_uState44 = GdsCreateState (_uSM, "State_44")
_uState45 = GdsCreateState (_uSM, "State_45")
_uState48 = GdsCreateState (_uSM, "State_48")
_uState51 = GdsCreateState (_uSM, "State_51")
_uState54 = GdsCreateState (_uSM, "State_54")
_uState57 = GdsCreateState (_uSM, "State_57")
_uState60 = GdsCreateState (_uSM, "State_60")
_uState62 = GdsCreateState (_uSM, "State_62")
_uState63 = GdsCreateState (_uSM, "State_63")
_uState66 = GdsCreateState (_uSM, "State_66")
_uState70 = GdsCreateState (_uSM, "State_70")
_uState71 = GdsCreateState (_uSM, "State_71")
_uState74 = GdsCreateState (_uSM, "State_74")
_uState77 = GdsCreateState (_uSM, "State_77")
_uState80 = GdsCreateState (_uSM, "State_80")
_uState83 = GdsCreateState (_uSM, "State_83")
_uState88 = GdsCreateState (_uSM, "State_88")
_uState91 = GdsCreateState (_uSM, "State_91")
_uState94 = GdsCreateState (_uSM, "State_94")
_uState98 = GdsCreateState (_uSM, "State_98")
_uState99 = GdsCreateState (_uSM, "State_99")
_uState102 = GdsCreateState (_uSM, "State_102")
_uState105 = GdsCreateState (_uSM, "State_105")
_uState108 = GdsCreateState (_uSM, "State_108")
_uState111 = GdsCreateState (_uSM, "State_111")
_uState114 = GdsCreateState (_uSM, "State_114")
_uState116 = GdsCreateState (_uSM, "State_116")
_uState117 = GdsCreateState (_uSM, "State_117")
_uState120 = GdsCreateState (_uSM, "State_120")
_uState124 = GdsCreateState (_uSM, "State_124")
_uState125 = GdsCreateState (_uSM, "State_125")
_uState128 = GdsCreateState (_uSM, "State_128")
_uState131 = GdsCreateState (_uSM, "State_131")
_uState134 = GdsCreateState (_uSM, "State_134")
_uState137 = GdsCreateState (_uSM, "State_137")
_uState141 = GdsCreateState (_uSM, "State_141")
_uState143 = GdsCreateState (_uSM, "State_143")
_uState144 = GdsCreateState (_uSM, "State_144")
_uState147 = GdsCreateState (_uSM, "State_147")
_uState151 = GdsCreateState (_uSM, "State_151")
_uState152 = GdsCreateState (_uSM, "State_152")
_uState155 = GdsCreateState (_uSM, "State_155")
_uState158 = GdsCreateState (_uSM, "State_158")
_uState161 = GdsCreateState (_uSM, "State_161")
_uState164 = GdsCreateState (_uSM, "State_164")
_uState168 = GdsCreateState (_uSM, "State_168")
_uState170 = GdsCreateState (_uSM, "State_170")
_uState171 = GdsCreateState (_uSM, "State_171")
_uState174 = GdsCreateState (_uSM, "State_174")
_uState178 = GdsCreateState (_uSM, "State_178")
_uState179 = GdsCreateState (_uSM, "State_179")
_uState182 = GdsCreateState (_uSM, "State_182")
_uState185 = GdsCreateState (_uSM, "State_185")
_uState188 = GdsCreateState (_uSM, "State_188")
_uState191 = GdsCreateState (_uSM, "State_191")
_uState195 = GdsCreateState (_uSM, "State_195")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('Jandrim_Windhammer'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(JANDRIM_WINDHAMMER)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(JANDRIM_WINDHAMMER)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('Jandrim_Windhammer', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("Jandrim_Windhammer", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "Jandrim_Windhammer"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(JANDRIM_WINDHAMMER)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("Jandrim_Windhammer")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(JANDRIM_WINDHAMMER)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState4Trans1 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T1", "Dialog")
	_uState4Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 2))
	_uState4Trans1:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1))
	_uState4Trans1:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_002PC", "Meint Ihr die Freihändler?", 1, 16777215))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 1, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState4Trans1 = nil

-- TO STATE: choice
_uState4Trans2 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T2", "Dialog")
	_uState4Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 2))
	_uState4Trans2:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseJandrimsCraft', 99) ))
	_uState4Trans2:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_023PC", "Fertigt Ihr auch Waffen und Rüstungen?", 2, 16777215))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 1, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState4Trans2 = nil

-- TO STATE: choice
_uState4Trans3 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T3", "Dialog")
	_uState4Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 2))
	_uState4Trans3:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopJandrimCollectOreSolved', 1))
	_uState4Trans3:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_029PC", "Ich habe zehn Brocken Iridium und Admantinum.", 3, 16777215))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 1, 4))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState4Trans3 = nil

-- TO STATE: choice
_uState4Trans4 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T4", "Dialog")
	_uState4Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 2))
	_uState4Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 1))
	_uState4Trans4:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_038PC", "Die perfekten Erze, wie gewünscht.", 4, 16777215))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 1, 4))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState4Trans4 = nil

-- TO STATE: choice
_uState4Trans5 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T5", "Dialog")
	_uState4Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 2))
	_uState4Trans5:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1))
	_uState4Trans5:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_091PC", "Nicht Eure Sache, Zwerg.", 5, 16777215))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 1, 4))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState4Trans5 = nil

-- TO STATE: choice
_uState4Trans6 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T6", "Dialog")
	_uState4Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 2))
	_uState4Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 0, 4))
	_uState4Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState4Trans6:AddAction (CScriptActionShowChoices())
	_uState4Trans6 = nil

-- TO STATE: choice
_uState4Trans7 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T7", "Dialog")
	_uState4Trans7:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1))
	_uState4Trans7:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) ))
	_uState4Trans7:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1) ), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState4Trans7:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_001", "Hm, Ihr seid da in ein ganz schönes Schlamassel geraten ...", 100, 16777215))
	_uState4Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState4Trans7 = nil

-- TO STATE: choice
_uState4Trans8 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T8", "Dialog")
	_uState4Trans8:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1) ))
	_uState4Trans8:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) ))
	_uState4Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState4Trans8 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState4, _uBeginState, "State_4", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState6Trans1 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T1", "Dialog")
	_uState6Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 2))
	_uState6Trans1:AddCondition (CScriptConditionValue('pl_Human', 'af_P333_KultInfoChoiceDisabled', 0, 2))
	_uState6Trans1:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_006PC", "Was ist dieser Kult?", 1, 16777215))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 1, 4))
	_uState6Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState6Trans1 = nil

-- TO STATE: choice
_uState6Trans2 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T2", "Dialog")
	_uState6Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 2))
	_uState6Trans2:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_013PC", "Was soll ich tun?", 2, 16777215))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 1, 4))
	_uState6Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState6Trans2 = nil

-- TO STATE: choice
_uState6Trans3 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T3", "Dialog")
	_uState6Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 2))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 0, 4))
	_uState6Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState6Trans3:AddAction (CScriptActionShowChoices())
	_uState6Trans3 = nil

-- TO STATE: choice
_uState6Trans4 = GdsCreateTransition (_uState4, _uState6, "State_4", "State_6_T4", "Dialog")
	_uState6Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 1))
	_uState6Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_002PC", "Meint Ihr die Freihändler?", 99, 16777215))
	_uState6Trans4:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_003", "Allerdings! Halicos spielt falsch, ich sag’s Euch!", 102, 16777215))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState6Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_004PC", "Zumindest mit verdeckten Karten. Was wisst Ihr über die Sache?", 103, 16777215))
	_uState6Trans4:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_005", "Er hat mit dem Kult zu tun gehabt ... dem des roten Gottes.", 104, 16777215))
	_uState6Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState6Trans4 = nil

-- TO STATE: choice
_uState6Trans5 = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6_T5", "Dialog")
	_uState6Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 1))
	_uState6Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_006PC", "Was ist dieser Kult?", 99, 16777215))
	_uState6Trans5:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_007", "Sie glauben, dass sich bald ein neuer Gott über Eo erheben wird.", 106, 16777215))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState6Trans5:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_008", "Er soll aus einem unserer jetzigen Götter entstehen, der dem Wahnsinn verfällt und sich gegen die Regeln Aonirs auflehnt.", 107, 16777215))
	_uState6Trans5:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_009", "Er wird das Volk der Dämonen als sein eigenes erwählen und sie aus den Kavernen unter der Welt an die Oberfläche führen.", 108, 16777215))
	_uState6Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_010PC", "Das wäre ein Gemetzel ohne gleichen!", 109, 16777215))
	_uState6Trans5:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_011", "Allerdings. Deswegen hat dieser Kult einen solchen Zulauf. Sie alle hoffen diesem Blutbad zu entgehen, wenn sie sich jetzt auf die richtige Seite stellen.", 110, 16777215))
	_uState6Trans5:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_012", "Aber ich glaube, da steckt noch mehr dahinter! Der Kult versucht den Lauf der Dinge zu verändern!", 111, 16777215))
	_uState6Trans5:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_KultInfoChoiceDisabled', 1, 4))
	_uState6Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState6Trans5 = nil

-- TO STATE: choice
_uState6Trans6 = GdsCreateTransition (_uState9, _uState6, "State_9", "State_6_T6", "Dialog")
	_uState6Trans6:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1))
	_uState6Trans6:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) ))
	_uState6Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState6Trans6 = nil

-- TO STATE: choice
_uState6Trans7 = GdsCreateTransition (_uState12, _uState6, "State_12", "State_6_T7", "Dialog")
	_uState6Trans7:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1))
	_uState6Trans7:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) ))
	_uState6Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState6Trans7 = nil

-- TO STATE: choice
_uState6Trans8 = GdsCreateTransition (_uState37, _uState6, "State_37", "State_6_T8", "Dialog")
	_uState6Trans8:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1))
	_uState6Trans8:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) ))
	_uState6Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState6Trans8 = nil

-- TO STATE: choice
_uState6Trans9 = GdsCreateTransition (_uState40, _uState6, "State_40", "State_6_T9", "Dialog")
	_uState6Trans9:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1))
	_uState6Trans9:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) ))
	_uState6Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState6Trans9 = nil

-- TO STATE: choice
_uState6Trans10 = GdsCreateTransition (_uState63, _uState6, "State_63", "State_6_T10", "Dialog")
	_uState6Trans10:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1))
	_uState6Trans10:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) ))
	_uState6Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState6Trans10 = nil

-- TO STATE: choice
_uState6Trans11 = GdsCreateTransition (_uState66, _uState6, "State_66", "State_6_T11", "Dialog")
	_uState6Trans11:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1))
	_uState6Trans11:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) ))
	_uState6Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState6Trans11 = nil

-- TO STATE: choice
_uState6Trans12 = GdsCreateTransition (_uState91, _uState6, "State_91", "State_6_T12", "Dialog")
	_uState6Trans12:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1))
	_uState6Trans12:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) ))
	_uState6Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState6Trans12 = nil

-- TO STATE: choice
_uState6Trans13 = GdsCreateTransition (_uState94, _uState6, "State_94", "State_6_T13", "Dialog")
	_uState6Trans13:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1))
	_uState6Trans13:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) ))
	_uState6Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState6Trans13 = nil

-- TO STATE: choice
_uState6Trans14 = GdsCreateTransition (_uState117, _uState6, "State_117", "State_6_T14", "Dialog")
	_uState6Trans14:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1))
	_uState6Trans14:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) ))
	_uState6Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState6Trans14 = nil

-- TO STATE: choice
_uState6Trans15 = GdsCreateTransition (_uState120, _uState6, "State_120", "State_6_T15", "Dialog")
	_uState6Trans15:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1))
	_uState6Trans15:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) ))
	_uState6Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState6Trans15 = nil

-- TO STATE: choice
_uState6Trans16 = GdsCreateTransition (_uState144, _uState6, "State_144", "State_6_T16", "Dialog")
	_uState6Trans16:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1))
	_uState6Trans16:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) ))
	_uState6Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState6Trans16 = nil

-- TO STATE: choice
_uState6Trans17 = GdsCreateTransition (_uState147, _uState6, "State_147", "State_6_T17", "Dialog")
	_uState6Trans17:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1))
	_uState6Trans17:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) ))
	_uState6Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState6Trans17 = nil

-- TO STATE: choice
_uState6Trans18 = GdsCreateTransition (_uState171, _uState6, "State_171", "State_6_T18", "Dialog")
	_uState6Trans18:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1))
	_uState6Trans18:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) ))
	_uState6Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState6Trans18 = nil

-- TO STATE: choice
_uState6Trans19 = GdsCreateTransition (_uState174, _uState6, "State_174", "State_6_T19", "Dialog")
	_uState6Trans19:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1))
	_uState6Trans19:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) ))
	_uState6Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState6Trans19 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState6, _uState6, "State_6", "State_6", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState6, _uBeginState, "State_6", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState9Trans1 = GdsCreateTransition (_uState4, _uState9, "State_4", "State_9_T1", "Dialog")
	_uState9Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 2))
	_uState9Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_023PC", "Fertigt Ihr auch Waffen und Rüstungen?", 99, 16777215))
	_uState9Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_024", "Nein, ausschließlich Gabeln und Löffel ... Schaut mich an, ich bin ein Zwergenschmied, was glaubt Ihr? NATÜRLICH schmiede ich Waffen und Rüstungen!", 123, 16777215))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState9Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_025", "Zumindest wenn Erz da ist!", 124, 16777215))
	_uState9Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_026", "Aber da sich unser Ländchen ja mit Allen anlegen musste, sieht es da finster aus!", 125, 16777215))
	_uState9Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_027", "Also, anstatt mich anzustarren, könnt Ihr Euren drachenblütigen Allerwertesten in die Weltgeschichte hinaus bewegen und mir Iridium und Adamantinum beschaffen!", 126, 16777215))
	_uState9Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_028", "Ich zahle auch, keine Sorge!", 127, 16777215))
	_uState9Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 245, 999))
	_uState9Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 246, 999))
	_uState9Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 1, 0))
	_uState9Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectOre', 1, 0))
	_uState9Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState9Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState9, _uState9, "State_9", "State_9", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState9, _uBeginState, "State_9", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState12Trans1 = GdsCreateTransition (_uState4, _uState12, "State_4", "State_12_T1", "Dialog")
	_uState12Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 3))
	_uState12Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_029PC", "Ich habe zehn Brocken Iridium und Admantinum.", 99, 16777215))
	_uState12Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_030", "Schön für Euch! Wenn Ihr sie mir für dieses Gold hier überlasst, ist's sogar noch schön für mich!", 129, 16777215))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState12Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_031PC", "Nehmt sie, ich kann nichts damit anfangen.", 130, 16777215))
	_uState12Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_032", "Das glaube ich! Menschen, Blechklopfer alle miteinander ...", 131, 16777215))
	_uState12Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_033", "Obwohl ... Ihr scheint ja zu gebrauchen zu sein!", 132, 16777215))
	_uState12Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_034", "Bringt mir weiteres Erz und ich entlohne Euch!", 133, 16777215))
	_uState12Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_035PC", "Wie wäre es diesmal mit einer Kostprobe Eurer Schmiedekunst?", 134, 16777215))
	_uState12Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_036", "Hmm ... Wohl, wohl. Dann bringt mir aber das beste Erz! Das bedeutet ich brauche perfekte Erzbrocken! Perfekt!", 135, 16777215))
	_uState12Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_037", "Dann werde ich Euch ein echtes Stück Zwergenarbeit fertigen!", 136, 16777215))
	_uState12Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 245, 999))
	_uState12Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 246, 999))
	_uState12Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectOreSolved', 2, 0))
	_uState12Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState12Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState12Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOre', 1, 0))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState12Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState12, _uBeginState, "State_12", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState16Trans1 = GdsCreateTransition (_uState16, _uState16, "State_16", "State_16_T1", "Dialog")
	_uState16Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 2))
	_uState16Trans1:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_041PC", "Schmiedet mir ein Langschwert.", 1, 16777215))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 1, 4))
	_uState16Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState16Trans1 = nil

-- TO STATE: choice
_uState16Trans2 = GdsCreateTransition (_uState16, _uState16, "State_16", "State_16_T2", "Dialog")
	_uState16Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 2))
	_uState16Trans2:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_051PC", "Schmiedet mir einen Langdolch.", 2, 16777215))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 1, 4))
	_uState16Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState16Trans2 = nil

-- TO STATE: choice
_uState16Trans3 = GdsCreateTransition (_uState16, _uState16, "State_16", "State_16_T3", "Dialog")
	_uState16Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 2))
	_uState16Trans3:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_061PC", "Schmiedet mir eine Plattenrüstung.", 3, 16777215))
	_uState16Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 1, 4))
	_uState16Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState16Trans3 = nil

-- TO STATE: choice
_uState16Trans4 = GdsCreateTransition (_uState16, _uState16, "State_16", "State_16_T4", "Dialog")
	_uState16Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 2))
	_uState16Trans4:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_071PC", "Fertigt mir einen Zauberstab.", 4, 16777215))
	_uState16Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 1, 4))
	_uState16Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState16Trans4 = nil

-- TO STATE: choice
_uState16Trans5 = GdsCreateTransition (_uState16, _uState16, "State_16", "State_16_T5", "Dialog")
	_uState16Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 2))
	_uState16Trans5:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_081PC", "Schmiedet mir einen Ring.", 5, 16777215))
	_uState16Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 1, 4))
	_uState16Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState16Trans5 = nil

-- TO STATE: choice
_uState16Trans6 = GdsCreateTransition (_uState16, _uState16, "State_16", "State_16_T6", "Dialog")
	_uState16Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 2))
	_uState16Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 0, 4))
	_uState16Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState16Trans6:AddAction (CScriptActionShowChoices())
	_uState16Trans6 = nil

-- TO STATE: choice
_uState16Trans7 = GdsCreateTransition (_uState4, _uState16, "State_4", "State_16_T7", "Dialog")
	_uState16Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4))
	_uState16Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_038PC", "Die perfekten Erze, wie gewünscht.", 99, 16777215))
	_uState16Trans7:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_039", "Ja, da lacht das Zwergenherz!", 138, 16777215))
	_uState16Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState16Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState16Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState16Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState16Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState16Trans7:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_040", "Und wie versprochen, ein Stück soll für Euch sein. Was wollt Ihr haben?", 139, 16777215))
	_uState16Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState16Trans7 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState16, _uState16, "State_16", "State_16", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState16, _uBeginState, "State_16", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState17Trans1 = GdsCreateTransition (_uState16, _uState17, "State_16", "State_17_T1", "Dialog")
	_uState17Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 1))
	_uState17Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_041PC", "Schmiedet mir ein Langschwert.", 99, 16777215))
	_uState17Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 51, 93, 87, 22, 1))
	_uState17Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState17Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState17Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState17Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState17Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState17Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 141, 16777215))
	_uState17Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 142, 16777215))
	_uState17Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 143, 16777215))
	_uState17Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 144, 16777215))
	_uState17Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 145, 16777215))
	_uState17Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 146, 16777215))
	_uState17Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 147, 16777215))
	_uState17Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 148, 16777215))
	_uState17Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 149, 16777215))
	_uState17Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState17Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState17Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState17Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState17Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState17Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState17, _uState17, "State_17", "State_17", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState17, _uBeginState, "State_17", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState20Trans1 = GdsCreateTransition (_uState16, _uState20, "State_16", "State_20_T1", "Dialog")
	_uState20Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 2))
	_uState20Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_051PC", "Schmiedet mir einen Langdolch.", 99, 16777215))
	_uState20Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 51, 108, 83, 22, 1))
	_uState20Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState20Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState20Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState20Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState20Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState20Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 151, 16777215))
	_uState20Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 152, 16777215))
	_uState20Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 153, 16777215))
	_uState20Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 154, 16777215))
	_uState20Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 155, 16777215))
	_uState20Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 156, 16777215))
	_uState20Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 157, 16777215))
	_uState20Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 158, 16777215))
	_uState20Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 159, 16777215))
	_uState20Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState20Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState20Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState20Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState20Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState20Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState20, _uState20, "State_20", "State_20", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState20, _uBeginState, "State_20", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState23Trans1 = GdsCreateTransition (_uState16, _uState23, "State_16", "State_23_T1", "Dialog")
	_uState23Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 3))
	_uState23Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_061PC", "Schmiedet mir eine Plattenrüstung.", 99, 16777215))
	_uState23Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 76, 219, 221, 22, 1))
	_uState23Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState23Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState23Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState23Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState23Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState23Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 161, 16777215))
	_uState23Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 162, 16777215))
	_uState23Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 163, 16777215))
	_uState23Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 164, 16777215))
	_uState23Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 165, 16777215))
	_uState23Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 166, 16777215))
	_uState23Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 167, 16777215))
	_uState23Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 168, 16777215))
	_uState23Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 169, 16777215))
	_uState23Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState23Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState23Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState23Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState23Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState23Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState23, _uState23, "State_23", "State_23", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState23, _uBeginState, "State_23", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState26Trans1 = GdsCreateTransition (_uState16, _uState26, "State_16", "State_26_T1", "Dialog")
	_uState26Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4))
	_uState26Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_071PC", "Fertigt mir einen Zauberstab.", 99, 16777215))
	_uState26Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 32, 176, 130, 22, 1))
	_uState26Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState26Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState26Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState26Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState26Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState26Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 171, 16777215))
	_uState26Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 172, 16777215))
	_uState26Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 173, 16777215))
	_uState26Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 174, 16777215))
	_uState26Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 175, 16777215))
	_uState26Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 176, 16777215))
	_uState26Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 177, 16777215))
	_uState26Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 178, 16777215))
	_uState26Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 179, 16777215))
	_uState26Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState26Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState26Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState26Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState26Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState26Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState26, _uState26, "State_26", "State_26", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState26, _uBeginState, "State_26", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState29Trans1 = GdsCreateTransition (_uState16, _uState29, "State_16", "State_29_T1", "Dialog")
	_uState29Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 5))
	_uState29Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_081PC", "Schmiedet mir einen Ring.", 99, 16777215))
	_uState29Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 59, 289, 270, 22, 1))
	_uState29Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState29Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState29Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState29Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState29Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState29Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 181, 16777215))
	_uState29Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 182, 16777215))
	_uState29Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 183, 16777215))
	_uState29Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 184, 16777215))
	_uState29Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 185, 16777215))
	_uState29Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 186, 16777215))
	_uState29Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 187, 16777215))
	_uState29Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 188, 16777215))
	_uState29Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 189, 16777215))
	_uState29Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState29Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState29Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState29Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState29Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState29Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState29, _uState29, "State_29", "State_29", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState29, _uBeginState, "State_29", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState34Trans1 = GdsCreateTransition (_uState34, _uState34, "State_34", "State_34_T1", "Dialog")
	_uState34Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 2))
	_uState34Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocumentsCollected', 99) ))
	_uState34Trans1:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_093PC", "Noch nicht.", 1, 16777215))
	_uState34Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 1, 4))
	_uState34Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState34Trans1 = nil

-- TO STATE: choice
_uState34Trans2 = GdsCreateTransition (_uState34, _uState34, "State_34", "State_34_T2", "Dialog")
	_uState34Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 2))
	_uState34Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopSpyDocumentsCollected', 1))
	_uState34Trans2:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_094PC", "Ich denke schon, reichen Euch diese Zwölf?", 2, 16777215))
	_uState34Trans2:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 173, 999))
	_uState34Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 1, 4))
	_uState34Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState34Trans2 = nil

-- TO STATE: choice
_uState34Trans3 = GdsCreateTransition (_uState34, _uState34, "State_34", "State_34_T3", "Dialog")
	_uState34Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 2))
	_uState34Trans3:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseJandrimsCraft', 99) ))
	_uState34Trans3:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_023PC", "Fertigt Ihr auch Waffen und Rüstungen?", 3, 16777215))
	_uState34Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 1, 4))
	_uState34Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState34Trans3 = nil

-- TO STATE: choice
_uState34Trans4 = GdsCreateTransition (_uState34, _uState34, "State_34", "State_34_T4", "Dialog")
	_uState34Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 2))
	_uState34Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopJandrimCollectOreSolved', 1))
	_uState34Trans4:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_029PC", "Ich habe zehn Brocken Iridium und Admantinum.", 4, 16777215))
	_uState34Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 1, 4))
	_uState34Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState34Trans4 = nil

-- TO STATE: choice
_uState34Trans5 = GdsCreateTransition (_uState34, _uState34, "State_34", "State_34_T5", "Dialog")
	_uState34Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 2))
	_uState34Trans5:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 1))
	_uState34Trans5:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_038PC", "Die perfekten Erze, wie gewünscht.", 5, 16777215))
	_uState34Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 1, 4))
	_uState34Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState34Trans5 = nil

-- TO STATE: choice
_uState34Trans6 = GdsCreateTransition (_uState34, _uState34, "State_34", "State_34_T6", "Dialog")
	_uState34Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 2))
	_uState34Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 0, 4))
	_uState34Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState34Trans6:AddAction (CScriptActionShowChoices())
	_uState34Trans6 = nil

-- TO STATE: choice
_uState34Trans7 = GdsCreateTransition (_uState1, _uState34, "State_1", "State_34_T7", "Dialog")
	_uState34Trans7:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99))
	_uState34Trans7:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocumentsCollected', 2) ))
	_uState34Trans7:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1) ), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState34Trans7:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState34Trans7:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_092", "Habt Ihr genug Dokumente von den Kitaki-Boten erbeuten können?", 191, 16777215))
	_uState34Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState34Trans7 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState34, _uState34, "State_34", "State_34", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState34, _uBeginState, "State_34", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState37Trans1 = GdsCreateTransition (_uState34, _uState37, "State_34", "State_37_T1", "Dialog")
	_uState37Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 3))
	_uState37Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_023PC", "Fertigt Ihr auch Waffen und Rüstungen?", 99, 16777215))
	_uState37Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_024", "Nein, ausschließlich Gabeln und Löffel ... Schaut mich an, ich bin ein Zwergenschmied, was glaubt Ihr? NATÜRLICH schmiede ich Waffen und Rüstungen!", 203, 16777215))
	_uState37Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState37Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState37Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState37Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState37Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState37Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_025", "Zumindest wenn Erz da ist!", 204, 16777215))
	_uState37Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_026", "Aber da sich unser Ländchen ja mit Allen anlegen musste, sieht es da finster aus!", 205, 16777215))
	_uState37Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_027", "Also, anstatt mich anzustarren, könnt Ihr Euren drachenblütigen Allerwertesten in die Weltgeschichte hinaus bewegen und mir Iridium und Adamantinum beschaffen!", 206, 16777215))
	_uState37Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_028", "Ich zahle auch, keine Sorge!", 207, 16777215))
	_uState37Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 245, 999))
	_uState37Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 246, 999))
	_uState37Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 1, 0))
	_uState37Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectOre', 1, 0))
	_uState37Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState37Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState37, _uState37, "State_37", "State_37", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState37, _uBeginState, "State_37", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState40Trans1 = GdsCreateTransition (_uState34, _uState40, "State_34", "State_40_T1", "Dialog")
	_uState40Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4))
	_uState40Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_029PC", "Ich habe zehn Brocken Iridium und Admantinum.", 99, 16777215))
	_uState40Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_030", "Schön für Euch! Wenn Ihr sie mir für dieses Gold hier überlasst, ist's sogar noch schön für mich!", 209, 16777215))
	_uState40Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState40Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState40Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState40Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState40Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState40Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_031PC", "Nehmt sie, ich kann nichts damit anfangen.", 210, 16777215))
	_uState40Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_032", "Das glaube ich! Menschen, Blechklopfer alle miteinander ...", 211, 16777215))
	_uState40Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_033", "Obwohl ... Ihr scheint ja zu gebrauchen zu sein!", 212, 16777215))
	_uState40Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_034", "Bringt mir weiteres Erz und ich entlohne Euch!", 213, 16777215))
	_uState40Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_035PC", "Wie wäre es diesmal mit einer Kostprobe Eurer Schmiedekunst?", 214, 16777215))
	_uState40Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_036", "Hmm ... Wohl, wohl. Dann bringt mir aber das beste Erz! Das bedeutet ich brauche perfekte Erzbrocken! Perfekt!", 215, 16777215))
	_uState40Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_037", "Dann werde ich Euch ein echtes Stück Zwergenarbeit fertigen!", 216, 16777215))
	_uState40Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 245, 999))
	_uState40Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 246, 999))
	_uState40Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectOreSolved', 2, 0))
	_uState40Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState40Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState40Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOre', 1, 0))
	_uState40Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState40Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState40, _uState40, "State_40", "State_40", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState40, _uBeginState, "State_40", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState44Trans1 = GdsCreateTransition (_uState44, _uState44, "State_44", "State_44_T1", "Dialog")
	_uState44Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 2))
	_uState44Trans1:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_041PC", "Schmiedet mir ein Langschwert.", 1, 16777215))
	_uState44Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 1, 4))
	_uState44Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState44Trans1 = nil

-- TO STATE: choice
_uState44Trans2 = GdsCreateTransition (_uState44, _uState44, "State_44", "State_44_T2", "Dialog")
	_uState44Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 2))
	_uState44Trans2:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_051PC", "Schmiedet mir einen Langdolch.", 2, 16777215))
	_uState44Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 1, 4))
	_uState44Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState44Trans2 = nil

-- TO STATE: choice
_uState44Trans3 = GdsCreateTransition (_uState44, _uState44, "State_44", "State_44_T3", "Dialog")
	_uState44Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 2))
	_uState44Trans3:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_061PC", "Schmiedet mir eine Plattenrüstung.", 3, 16777215))
	_uState44Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 1, 4))
	_uState44Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState44Trans3 = nil

-- TO STATE: choice
_uState44Trans4 = GdsCreateTransition (_uState44, _uState44, "State_44", "State_44_T4", "Dialog")
	_uState44Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 2))
	_uState44Trans4:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_071PC", "Fertigt mir einen Zauberstab.", 4, 16777215))
	_uState44Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 1, 4))
	_uState44Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState44Trans4 = nil

-- TO STATE: choice
_uState44Trans5 = GdsCreateTransition (_uState44, _uState44, "State_44", "State_44_T5", "Dialog")
	_uState44Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 2))
	_uState44Trans5:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_081PC", "Schmiedet mir einen Ring.", 5, 16777215))
	_uState44Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 1, 4))
	_uState44Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState44Trans5 = nil

-- TO STATE: choice
_uState44Trans6 = GdsCreateTransition (_uState44, _uState44, "State_44", "State_44_T6", "Dialog")
	_uState44Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 2))
	_uState44Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 0, 4))
	_uState44Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState44Trans6:AddAction (CScriptActionShowChoices())
	_uState44Trans6 = nil

-- TO STATE: choice
_uState44Trans7 = GdsCreateTransition (_uState34, _uState44, "State_34", "State_44_T7", "Dialog")
	_uState44Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 5))
	_uState44Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_038PC", "Die perfekten Erze, wie gewünscht.", 99, 16777215))
	_uState44Trans7:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_039", "Ja, da lacht das Zwergenherz!", 218, 16777215))
	_uState44Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState44Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState44Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState44Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState44Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState44Trans7:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_040", "Und wie versprochen, ein Stück soll für Euch sein. Was wollt Ihr haben?", 219, 16777215))
	_uState44Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState44Trans7 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState44, _uState44, "State_44", "State_44", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState44, _uBeginState, "State_44", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState45Trans1 = GdsCreateTransition (_uState44, _uState45, "State_44", "State_45_T1", "Dialog")
	_uState45Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 1))
	_uState45Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_041PC", "Schmiedet mir ein Langschwert.", 99, 16777215))
	_uState45Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 51, 93, 87, 22, 1))
	_uState45Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState45Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState45Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState45Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState45Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState45Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 221, 16777215))
	_uState45Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 222, 16777215))
	_uState45Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 223, 16777215))
	_uState45Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 224, 16777215))
	_uState45Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 225, 16777215))
	_uState45Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 226, 16777215))
	_uState45Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 227, 16777215))
	_uState45Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 228, 16777215))
	_uState45Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 229, 16777215))
	_uState45Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState45Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState45Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState45Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState45Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState45Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState45, _uState45, "State_45", "State_45", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState45, _uBeginState, "State_45", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState48Trans1 = GdsCreateTransition (_uState44, _uState48, "State_44", "State_48_T1", "Dialog")
	_uState48Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 2))
	_uState48Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_051PC", "Schmiedet mir einen Langdolch.", 99, 16777215))
	_uState48Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 51, 108, 83, 22, 1))
	_uState48Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState48Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState48Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState48Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState48Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState48Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 231, 16777215))
	_uState48Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 232, 16777215))
	_uState48Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 233, 16777215))
	_uState48Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 234, 16777215))
	_uState48Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 235, 16777215))
	_uState48Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 236, 16777215))
	_uState48Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 237, 16777215))
	_uState48Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 238, 16777215))
	_uState48Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 239, 16777215))
	_uState48Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState48Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState48Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState48Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState48Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState48Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState48, _uState48, "State_48", "State_48", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState48, _uBeginState, "State_48", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState51Trans1 = GdsCreateTransition (_uState44, _uState51, "State_44", "State_51_T1", "Dialog")
	_uState51Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 3))
	_uState51Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_061PC", "Schmiedet mir eine Plattenrüstung.", 99, 16777215))
	_uState51Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 76, 219, 221, 22, 1))
	_uState51Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState51Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState51Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState51Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState51Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState51Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 241, 16777215))
	_uState51Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 242, 16777215))
	_uState51Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 243, 16777215))
	_uState51Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 244, 16777215))
	_uState51Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 245, 16777215))
	_uState51Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 246, 16777215))
	_uState51Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 247, 16777215))
	_uState51Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 248, 16777215))
	_uState51Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 249, 16777215))
	_uState51Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState51Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState51Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState51Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState51Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState51Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState51, _uState51, "State_51", "State_51", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState51, _uBeginState, "State_51", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState54Trans1 = GdsCreateTransition (_uState44, _uState54, "State_44", "State_54_T1", "Dialog")
	_uState54Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4))
	_uState54Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_071PC", "Fertigt mir einen Zauberstab.", 99, 16777215))
	_uState54Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 32, 176, 130, 22, 1))
	_uState54Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState54Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState54Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState54Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState54Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState54Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 251, 16777215))
	_uState54Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 252, 16777215))
	_uState54Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 253, 16777215))
	_uState54Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 254, 16777215))
	_uState54Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 255, 16777215))
	_uState54Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 256, 16777215))
	_uState54Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 257, 16777215))
	_uState54Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 258, 16777215))
	_uState54Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 259, 16777215))
	_uState54Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState54Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState54Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState54Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState54Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState54Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState54, _uState54, "State_54", "State_54", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState54, _uBeginState, "State_54", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState57Trans1 = GdsCreateTransition (_uState44, _uState57, "State_44", "State_57_T1", "Dialog")
	_uState57Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 5))
	_uState57Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_081PC", "Schmiedet mir einen Ring.", 99, 16777215))
	_uState57Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 59, 289, 270, 22, 1))
	_uState57Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState57Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState57Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState57Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState57Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState57Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 261, 16777215))
	_uState57Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 262, 16777215))
	_uState57Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 263, 16777215))
	_uState57Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 264, 16777215))
	_uState57Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 265, 16777215))
	_uState57Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 266, 16777215))
	_uState57Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 267, 16777215))
	_uState57Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 268, 16777215))
	_uState57Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 269, 16777215))
	_uState57Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState57Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState57Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState57Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState57Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState57Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState57, _uState57, "State_57", "State_57", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState57, _uBeginState, "State_57", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState60Trans1 = GdsCreateTransition (_uState1, _uState60, "State_1", "State_60_T1", "Dialog")
	_uState60Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopEvokePriests', 99) ))
	_uState60Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1) ), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState60Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState60Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocumentsCollected', 2) )) ))
	_uState60Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_171", "Ich habe gehört, was der Kult vorhat! Hört zu!", 270, 16777215))
	_uState60Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_172", "Wir müssen die Aufmerksamkeit der Lichtgötter auf das lenken, was hier geschieht!", 271, 16777215))
	_uState60Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_173", "Es ist nicht leicht, die Aufmerksamkeit eines Gottes zu erregen, aber ich besitze etwas, dass die Macht dazu hat: Das Niethalfsherz.", 272, 16777215))
	_uState60Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_174", "Mit seiner Macht könnte ich den Gott Niethalf beschwören! Aber ich kann es nicht alleine!", 273, 16777215))
	_uState60Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_175", "Ich brauche Hilfe von Niethalfspriestern! Sie kennen den Ruf des Weltenschmieds, ich bin nur ein Handwerker!", 274, 16777215))
	_uState60Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_176", "Aber die großen Priester sind alle tot!", 275, 16777215))
	_uState60Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_177", "Ihr müsst sie aus ihren Grabstätten beschwören!", 276, 16777215))
	_uState60Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_178", "Nehmt diese Glyphe, sie ist das Zeichen meiner Familie und wird den Priestern die Rechtschaffenheit unserer Sache zeigen.", 277, 16777215))
	_uState60Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_179", "Ruft acht Priester aus ihren Gräbern, so viele werden für die Beschwörung vonnöten sein!", 278, 16777215))
	_uState60Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_180", "Ihr findet Gräber in Underhall, beim Eisenherzgebirge, im Windflüstertal und in Sommerfall.", 279, 16777215))
	_uState60Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_181", "Aber gebt acht, manche der Priester können durch den Schmerz des Todes verdorben worden sein! Diese werden Euch angreifen!", 280, 16777215))
	_uState60Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopTalkToJandrim', 2, 0))
	_uState60Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseChapter_3', 2, 0))
	_uState60Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseChapter_4', 1, 0))
	_uState60Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopEvokePriests', 1, 0))
	_uState60Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState60Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState60, _uState60, "State_60", "State_60", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState60, _uBeginState, "State_60", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState62Trans1 = GdsCreateTransition (_uState62, _uState62, "State_62", "State_62_T1", "Dialog")
	_uState62Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 2))
	_uState62Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseJandrimsCraft', 99) ))
	_uState62Trans1:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_023PC", "Fertigt Ihr auch Waffen und Rüstungen?", 1, 16777215))
	_uState62Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 1, 4))
	_uState62Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState62Trans1 = nil

-- TO STATE: choice
_uState62Trans2 = GdsCreateTransition (_uState62, _uState62, "State_62", "State_62_T2", "Dialog")
	_uState62Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 2))
	_uState62Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopJandrimCollectOreSolved', 1))
	_uState62Trans2:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_029PC", "Ich habe zehn Brocken Iridium und Admantinum.", 2, 16777215))
	_uState62Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 1, 4))
	_uState62Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState62Trans2 = nil

-- TO STATE: choice
_uState62Trans3 = GdsCreateTransition (_uState62, _uState62, "State_62", "State_62_T3", "Dialog")
	_uState62Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 2))
	_uState62Trans3:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 1))
	_uState62Trans3:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_038PC", "Die perfekten Erze, wie gewünscht.", 3, 16777215))
	_uState62Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 1, 4))
	_uState62Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState62Trans3 = nil

-- TO STATE: choice
_uState62Trans4 = GdsCreateTransition (_uState62, _uState62, "State_62", "State_62_T4", "Dialog")
	_uState62Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 2))
	_uState62Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 0, 4))
	_uState62Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState62Trans4:AddAction (CScriptActionShowChoices())
	_uState62Trans4 = nil

-- TO STATE: choice
_uState62Trans5 = GdsCreateTransition (_uState60, _uState62, "State_60", "State_62_T5", "Dialog")
	_uState62Trans5:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2) ))
	_uState62Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState62Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState62, _uState62, "State_62", "State_62", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState62, _uBeginState, "State_62", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState63Trans1 = GdsCreateTransition (_uState62, _uState63, "State_62", "State_63_T1", "Dialog")
	_uState63Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 1))
	_uState63Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_023PC", "Fertigt Ihr auch Waffen und Rüstungen?", 99, 16777215))
	_uState63Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_024", "Nein, ausschließlich Gabeln und Löffel ... Schaut mich an, ich bin ein Zwergenschmied, was glaubt Ihr? NATÜRLICH schmiede ich Waffen und Rüstungen!", 282, 16777215))
	_uState63Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState63Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState63Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState63Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_025", "Zumindest wenn Erz da ist!", 283, 16777215))
	_uState63Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_026", "Aber da sich unser Ländchen ja mit Allen anlegen musste, sieht es da finster aus!", 284, 16777215))
	_uState63Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_027", "Also, anstatt mich anzustarren, könnt Ihr Euren drachenblütigen Allerwertesten in die Weltgeschichte hinaus bewegen und mir Iridium und Adamantinum beschaffen!", 285, 16777215))
	_uState63Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_028", "Ich zahle auch, keine Sorge!", 286, 16777215))
	_uState63Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 245, 999))
	_uState63Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 246, 999))
	_uState63Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 1, 0))
	_uState63Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectOre', 1, 0))
	_uState63Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState63Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState63, _uState63, "State_63", "State_63", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState63, _uBeginState, "State_63", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState66Trans1 = GdsCreateTransition (_uState62, _uState66, "State_62", "State_66_T1", "Dialog")
	_uState66Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 2))
	_uState66Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_029PC", "Ich habe zehn Brocken Iridium und Admantinum.", 99, 16777215))
	_uState66Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_030", "Schön für Euch! Wenn Ihr sie mir für dieses Gold hier überlasst, ist's sogar noch schön für mich!", 288, 16777215))
	_uState66Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState66Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState66Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState66Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_031PC", "Nehmt sie, ich kann nichts damit anfangen.", 289, 16777215))
	_uState66Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_032", "Das glaube ich! Menschen, Blechklopfer alle miteinander ...", 290, 16777215))
	_uState66Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_033", "Obwohl ... Ihr scheint ja zu gebrauchen zu sein!", 291, 16777215))
	_uState66Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_034", "Bringt mir weiteres Erz und ich entlohne Euch!", 292, 16777215))
	_uState66Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_035PC", "Wie wäre es diesmal mit einer Kostprobe Eurer Schmiedekunst?", 293, 16777215))
	_uState66Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_036", "Hmm ... Wohl, wohl. Dann bringt mir aber das beste Erz! Das bedeutet ich brauche perfekte Erzbrocken! Perfekt!", 294, 16777215))
	_uState66Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_037", "Dann werde ich Euch ein echtes Stück Zwergenarbeit fertigen!", 295, 16777215))
	_uState66Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 245, 999))
	_uState66Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 246, 999))
	_uState66Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectOreSolved', 2, 0))
	_uState66Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState66Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState66Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOre', 1, 0))
	_uState66Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState66Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState66, _uState66, "State_66", "State_66", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState66, _uBeginState, "State_66", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState70Trans1 = GdsCreateTransition (_uState70, _uState70, "State_70", "State_70_T1", "Dialog")
	_uState70Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 2))
	_uState70Trans1:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_041PC", "Schmiedet mir ein Langschwert.", 1, 16777215))
	_uState70Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 1, 4))
	_uState70Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState70Trans1 = nil

-- TO STATE: choice
_uState70Trans2 = GdsCreateTransition (_uState70, _uState70, "State_70", "State_70_T2", "Dialog")
	_uState70Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 2))
	_uState70Trans2:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_051PC", "Schmiedet mir einen Langdolch.", 2, 16777215))
	_uState70Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 1, 4))
	_uState70Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState70Trans2 = nil

-- TO STATE: choice
_uState70Trans3 = GdsCreateTransition (_uState70, _uState70, "State_70", "State_70_T3", "Dialog")
	_uState70Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 2))
	_uState70Trans3:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_061PC", "Schmiedet mir eine Plattenrüstung.", 3, 16777215))
	_uState70Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 1, 4))
	_uState70Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState70Trans3 = nil

-- TO STATE: choice
_uState70Trans4 = GdsCreateTransition (_uState70, _uState70, "State_70", "State_70_T4", "Dialog")
	_uState70Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 2))
	_uState70Trans4:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_071PC", "Fertigt mir einen Zauberstab.", 4, 16777215))
	_uState70Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 1, 4))
	_uState70Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState70Trans4 = nil

-- TO STATE: choice
_uState70Trans5 = GdsCreateTransition (_uState70, _uState70, "State_70", "State_70_T5", "Dialog")
	_uState70Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 2))
	_uState70Trans5:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_081PC", "Schmiedet mir einen Ring.", 5, 16777215))
	_uState70Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 1, 4))
	_uState70Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState70Trans5 = nil

-- TO STATE: choice
_uState70Trans6 = GdsCreateTransition (_uState70, _uState70, "State_70", "State_70_T6", "Dialog")
	_uState70Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 2))
	_uState70Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 0, 4))
	_uState70Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState70Trans6:AddAction (CScriptActionShowChoices())
	_uState70Trans6 = nil

-- TO STATE: choice
_uState70Trans7 = GdsCreateTransition (_uState62, _uState70, "State_62", "State_70_T7", "Dialog")
	_uState70Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 3))
	_uState70Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_038PC", "Die perfekten Erze, wie gewünscht.", 99, 16777215))
	_uState70Trans7:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_039", "Ja, da lacht das Zwergenherz!", 297, 16777215))
	_uState70Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState70Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState70Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState70Trans7:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_040", "Und wie versprochen, ein Stück soll für Euch sein. Was wollt Ihr haben?", 298, 16777215))
	_uState70Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState70Trans7 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState70, _uState70, "State_70", "State_70", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState70, _uBeginState, "State_70", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState71Trans1 = GdsCreateTransition (_uState70, _uState71, "State_70", "State_71_T1", "Dialog")
	_uState71Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 1))
	_uState71Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_041PC", "Schmiedet mir ein Langschwert.", 99, 16777215))
	_uState71Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 51, 93, 87, 22, 1))
	_uState71Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState71Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState71Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState71Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState71Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState71Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 300, 16777215))
	_uState71Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 301, 16777215))
	_uState71Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 302, 16777215))
	_uState71Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 303, 16777215))
	_uState71Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 304, 16777215))
	_uState71Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 305, 16777215))
	_uState71Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 306, 16777215))
	_uState71Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 307, 16777215))
	_uState71Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 308, 16777215))
	_uState71Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState71Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState71Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState71Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState71Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState71Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState71, _uState71, "State_71", "State_71", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState71, _uBeginState, "State_71", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState74Trans1 = GdsCreateTransition (_uState70, _uState74, "State_70", "State_74_T1", "Dialog")
	_uState74Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 2))
	_uState74Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_051PC", "Schmiedet mir einen Langdolch.", 99, 16777215))
	_uState74Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 51, 108, 83, 22, 1))
	_uState74Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState74Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState74Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState74Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState74Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState74Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 310, 16777215))
	_uState74Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 311, 16777215))
	_uState74Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 312, 16777215))
	_uState74Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 313, 16777215))
	_uState74Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 314, 16777215))
	_uState74Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 315, 16777215))
	_uState74Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 316, 16777215))
	_uState74Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 317, 16777215))
	_uState74Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 318, 16777215))
	_uState74Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState74Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState74Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState74Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState74Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState74Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState74, _uState74, "State_74", "State_74", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState74, _uBeginState, "State_74", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState77Trans1 = GdsCreateTransition (_uState70, _uState77, "State_70", "State_77_T1", "Dialog")
	_uState77Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 3))
	_uState77Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_061PC", "Schmiedet mir eine Plattenrüstung.", 99, 16777215))
	_uState77Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 76, 219, 221, 22, 1))
	_uState77Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState77Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState77Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState77Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState77Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState77Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 320, 16777215))
	_uState77Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 321, 16777215))
	_uState77Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 322, 16777215))
	_uState77Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 323, 16777215))
	_uState77Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 324, 16777215))
	_uState77Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 325, 16777215))
	_uState77Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 326, 16777215))
	_uState77Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 327, 16777215))
	_uState77Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 328, 16777215))
	_uState77Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState77Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState77Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState77Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState77Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState77Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState77, _uState77, "State_77", "State_77", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState77, _uBeginState, "State_77", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState80Trans1 = GdsCreateTransition (_uState70, _uState80, "State_70", "State_80_T1", "Dialog")
	_uState80Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4))
	_uState80Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_071PC", "Fertigt mir einen Zauberstab.", 99, 16777215))
	_uState80Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 32, 176, 130, 22, 1))
	_uState80Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState80Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState80Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState80Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState80Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState80Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 330, 16777215))
	_uState80Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 331, 16777215))
	_uState80Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 332, 16777215))
	_uState80Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 333, 16777215))
	_uState80Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 334, 16777215))
	_uState80Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 335, 16777215))
	_uState80Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 336, 16777215))
	_uState80Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 337, 16777215))
	_uState80Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 338, 16777215))
	_uState80Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState80Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState80Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState80Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState80Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState80Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState80, _uState80, "State_80", "State_80", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState80, _uBeginState, "State_80", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState83Trans1 = GdsCreateTransition (_uState70, _uState83, "State_70", "State_83_T1", "Dialog")
	_uState83Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 5))
	_uState83Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_081PC", "Schmiedet mir einen Ring.", 99, 16777215))
	_uState83Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 59, 289, 270, 22, 1))
	_uState83Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState83Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState83Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState83Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState83Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState83Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 340, 16777215))
	_uState83Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 341, 16777215))
	_uState83Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 342, 16777215))
	_uState83Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 343, 16777215))
	_uState83Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 344, 16777215))
	_uState83Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 345, 16777215))
	_uState83Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 346, 16777215))
	_uState83Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 347, 16777215))
	_uState83Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 348, 16777215))
	_uState83Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState83Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState83Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState83Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState83Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState83Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState83, _uState83, "State_83", "State_83", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState83, _uBeginState, "State_83", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState88Trans1 = GdsCreateTransition (_uState88, _uState88, "State_88", "State_88_T1", "Dialog")
	_uState88Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 2))
	_uState88Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopEvokePriestsSolved', 99) ))
	_uState88Trans1:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_251PC", "Noch nicht.", 1, 16777215))
	_uState88Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 1, 4))
	_uState88Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState88Trans1 = nil

-- TO STATE: choice
_uState88Trans2 = GdsCreateTransition (_uState88, _uState88, "State_88", "State_88_T2", "Dialog")
	_uState88Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 2))
	_uState88Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopEvokePriestsSolved', 1))
	_uState88Trans2:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_252PC", "Ja, sie werden zur Stelle sein.", 2, 16777215))
	_uState88Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 1, 4))
	_uState88Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState88Trans2 = nil

-- TO STATE: choice
_uState88Trans3 = GdsCreateTransition (_uState88, _uState88, "State_88", "State_88_T3", "Dialog")
	_uState88Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 2))
	_uState88Trans3:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseJandrimsCraft', 99) ))
	_uState88Trans3:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_023PC", "Fertigt Ihr auch Waffen und Rüstungen?", 3, 16777215))
	_uState88Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 1, 4))
	_uState88Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState88Trans3 = nil

-- TO STATE: choice
_uState88Trans4 = GdsCreateTransition (_uState88, _uState88, "State_88", "State_88_T4", "Dialog")
	_uState88Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 2))
	_uState88Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopJandrimCollectOreSolved', 1))
	_uState88Trans4:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_029PC", "Ich habe zehn Brocken Iridium und Admantinum.", 4, 16777215))
	_uState88Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 1, 4))
	_uState88Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState88Trans4 = nil

-- TO STATE: choice
_uState88Trans5 = GdsCreateTransition (_uState88, _uState88, "State_88", "State_88_T5", "Dialog")
	_uState88Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 2))
	_uState88Trans5:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 1))
	_uState88Trans5:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_038PC", "Die perfekten Erze, wie gewünscht.", 5, 16777215))
	_uState88Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 1, 4))
	_uState88Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState88Trans5 = nil

-- TO STATE: choice
_uState88Trans6 = GdsCreateTransition (_uState88, _uState88, "State_88", "State_88_T6", "Dialog")
	_uState88Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 2))
	_uState88Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 0, 4))
	_uState88Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState88Trans6:AddAction (CScriptActionShowChoices())
	_uState88Trans6 = nil

-- TO STATE: choice
_uState88Trans7 = GdsCreateTransition (_uState1, _uState88, "State_1", "State_88_T7", "Dialog")
	_uState88Trans7:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopEvokePriests', 99))
	_uState88Trans7:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopEvokePriestsSolved', 2) ))
	_uState88Trans7:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1) ), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState88Trans7:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState88Trans7:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocumentsCollected', 2) )) ))
	_uState88Trans7:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopEvokePriests', 99) )
	_uState88Trans7:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_250", "Habt Ihr die acht Priester erweckt?", 349, 16777215))
	_uState88Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState88Trans7 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState88, _uState88, "State_88", "State_88", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState88, _uBeginState, "State_88", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState91Trans1 = GdsCreateTransition (_uState88, _uState91, "State_88", "State_91_T1", "Dialog")
	_uState91Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 3))
	_uState91Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_023PC", "Fertigt Ihr auch Waffen und Rüstungen?", 99, 16777215))
	_uState91Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_024", "Nein, ausschließlich Gabeln und Löffel ... Schaut mich an, ich bin ein Zwergenschmied, was glaubt Ihr? NATÜRLICH schmiede ich Waffen und Rüstungen!", 360, 16777215))
	_uState91Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState91Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState91Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState91Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState91Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState91Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_025", "Zumindest wenn Erz da ist!", 361, 16777215))
	_uState91Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_026", "Aber da sich unser Ländchen ja mit Allen anlegen musste, sieht es da finster aus!", 362, 16777215))
	_uState91Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_027", "Also, anstatt mich anzustarren, könnt Ihr Euren drachenblütigen Allerwertesten in die Weltgeschichte hinaus bewegen und mir Iridium und Adamantinum beschaffen!", 363, 16777215))
	_uState91Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_028", "Ich zahle auch, keine Sorge!", 364, 16777215))
	_uState91Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 245, 999))
	_uState91Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 246, 999))
	_uState91Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 1, 0))
	_uState91Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectOre', 1, 0))
	_uState91Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState91Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState91, _uState91, "State_91", "State_91", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState91, _uBeginState, "State_91", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState94Trans1 = GdsCreateTransition (_uState88, _uState94, "State_88", "State_94_T1", "Dialog")
	_uState94Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4))
	_uState94Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_029PC", "Ich habe zehn Brocken Iridium und Admantinum.", 99, 16777215))
	_uState94Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_030", "Schön für Euch! Wenn Ihr sie mir für dieses Gold hier überlasst, ist's sogar noch schön für mich!", 366, 16777215))
	_uState94Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState94Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState94Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState94Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState94Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState94Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_031PC", "Nehmt sie, ich kann nichts damit anfangen.", 367, 16777215))
	_uState94Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_032", "Das glaube ich! Menschen, Blechklopfer alle miteinander ...", 368, 16777215))
	_uState94Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_033", "Obwohl ... Ihr scheint ja zu gebrauchen zu sein!", 369, 16777215))
	_uState94Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_034", "Bringt mir weiteres Erz und ich entlohne Euch!", 370, 16777215))
	_uState94Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_035PC", "Wie wäre es diesmal mit einer Kostprobe Eurer Schmiedekunst?", 371, 16777215))
	_uState94Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_036", "Hmm ... Wohl, wohl. Dann bringt mir aber das beste Erz! Das bedeutet ich brauche perfekte Erzbrocken! Perfekt!", 372, 16777215))
	_uState94Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_037", "Dann werde ich Euch ein echtes Stück Zwergenarbeit fertigen!", 373, 16777215))
	_uState94Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 245, 999))
	_uState94Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 246, 999))
	_uState94Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectOreSolved', 2, 0))
	_uState94Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState94Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState94Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOre', 1, 0))
	_uState94Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState94Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState94, _uState94, "State_94", "State_94", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState94, _uBeginState, "State_94", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState98Trans1 = GdsCreateTransition (_uState98, _uState98, "State_98", "State_98_T1", "Dialog")
	_uState98Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 2))
	_uState98Trans1:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_041PC", "Schmiedet mir ein Langschwert.", 1, 16777215))
	_uState98Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 1, 4))
	_uState98Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState98Trans1 = nil

-- TO STATE: choice
_uState98Trans2 = GdsCreateTransition (_uState98, _uState98, "State_98", "State_98_T2", "Dialog")
	_uState98Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 2))
	_uState98Trans2:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_051PC", "Schmiedet mir einen Langdolch.", 2, 16777215))
	_uState98Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 1, 4))
	_uState98Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState98Trans2 = nil

-- TO STATE: choice
_uState98Trans3 = GdsCreateTransition (_uState98, _uState98, "State_98", "State_98_T3", "Dialog")
	_uState98Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 2))
	_uState98Trans3:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_061PC", "Schmiedet mir eine Plattenrüstung.", 3, 16777215))
	_uState98Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 1, 4))
	_uState98Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState98Trans3 = nil

-- TO STATE: choice
_uState98Trans4 = GdsCreateTransition (_uState98, _uState98, "State_98", "State_98_T4", "Dialog")
	_uState98Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 2))
	_uState98Trans4:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_071PC", "Fertigt mir einen Zauberstab.", 4, 16777215))
	_uState98Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 1, 4))
	_uState98Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState98Trans4 = nil

-- TO STATE: choice
_uState98Trans5 = GdsCreateTransition (_uState98, _uState98, "State_98", "State_98_T5", "Dialog")
	_uState98Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 2))
	_uState98Trans5:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_081PC", "Schmiedet mir einen Ring.", 5, 16777215))
	_uState98Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 1, 4))
	_uState98Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState98Trans5 = nil

-- TO STATE: choice
_uState98Trans6 = GdsCreateTransition (_uState98, _uState98, "State_98", "State_98_T6", "Dialog")
	_uState98Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 2))
	_uState98Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 0, 4))
	_uState98Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState98Trans6:AddAction (CScriptActionShowChoices())
	_uState98Trans6 = nil

-- TO STATE: choice
_uState98Trans7 = GdsCreateTransition (_uState88, _uState98, "State_88", "State_98_T7", "Dialog")
	_uState98Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 5))
	_uState98Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_038PC", "Die perfekten Erze, wie gewünscht.", 99, 16777215))
	_uState98Trans7:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_039", "Ja, da lacht das Zwergenherz!", 375, 16777215))
	_uState98Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState98Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState98Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState98Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState98Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState98Trans7:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_040", "Und wie versprochen, ein Stück soll für Euch sein. Was wollt Ihr haben?", 376, 16777215))
	_uState98Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState98Trans7 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState98, _uState98, "State_98", "State_98", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState98, _uBeginState, "State_98", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState99Trans1 = GdsCreateTransition (_uState98, _uState99, "State_98", "State_99_T1", "Dialog")
	_uState99Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 1))
	_uState99Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_041PC", "Schmiedet mir ein Langschwert.", 99, 16777215))
	_uState99Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 51, 93, 87, 22, 1))
	_uState99Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState99Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState99Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState99Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState99Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState99Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 378, 16777215))
	_uState99Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 379, 16777215))
	_uState99Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 380, 16777215))
	_uState99Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 381, 16777215))
	_uState99Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 382, 16777215))
	_uState99Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 383, 16777215))
	_uState99Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 384, 16777215))
	_uState99Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 385, 16777215))
	_uState99Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 386, 16777215))
	_uState99Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState99Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState99Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState99Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState99Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState99Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState99, _uState99, "State_99", "State_99", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState99, _uBeginState, "State_99", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState102Trans1 = GdsCreateTransition (_uState98, _uState102, "State_98", "State_102_T1", "Dialog")
	_uState102Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 2))
	_uState102Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_051PC", "Schmiedet mir einen Langdolch.", 99, 16777215))
	_uState102Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 51, 108, 83, 22, 1))
	_uState102Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState102Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState102Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState102Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState102Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState102Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 388, 16777215))
	_uState102Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 389, 16777215))
	_uState102Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 390, 16777215))
	_uState102Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 391, 16777215))
	_uState102Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 392, 16777215))
	_uState102Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 393, 16777215))
	_uState102Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 394, 16777215))
	_uState102Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 395, 16777215))
	_uState102Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 396, 16777215))
	_uState102Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState102Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState102Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState102Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState102Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState102Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState102, _uState102, "State_102", "State_102", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState102, _uBeginState, "State_102", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState105Trans1 = GdsCreateTransition (_uState98, _uState105, "State_98", "State_105_T1", "Dialog")
	_uState105Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 3))
	_uState105Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_061PC", "Schmiedet mir eine Plattenrüstung.", 99, 16777215))
	_uState105Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 76, 219, 221, 22, 1))
	_uState105Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState105Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState105Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState105Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState105Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState105Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 398, 16777215))
	_uState105Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 399, 16777215))
	_uState105Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 400, 16777215))
	_uState105Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 401, 16777215))
	_uState105Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 402, 16777215))
	_uState105Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 403, 16777215))
	_uState105Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 404, 16777215))
	_uState105Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 405, 16777215))
	_uState105Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 406, 16777215))
	_uState105Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState105Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState105Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState105Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState105Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState105Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState105, _uState105, "State_105", "State_105", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState105, _uBeginState, "State_105", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState108Trans1 = GdsCreateTransition (_uState98, _uState108, "State_98", "State_108_T1", "Dialog")
	_uState108Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4))
	_uState108Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_071PC", "Fertigt mir einen Zauberstab.", 99, 16777215))
	_uState108Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 32, 176, 130, 22, 1))
	_uState108Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState108Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState108Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState108Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState108Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState108Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 408, 16777215))
	_uState108Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 409, 16777215))
	_uState108Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 410, 16777215))
	_uState108Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 411, 16777215))
	_uState108Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 412, 16777215))
	_uState108Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 413, 16777215))
	_uState108Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 414, 16777215))
	_uState108Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 415, 16777215))
	_uState108Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 416, 16777215))
	_uState108Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState108Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState108Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState108Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState108Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState108Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState108, _uState108, "State_108", "State_108", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState108, _uBeginState, "State_108", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState111Trans1 = GdsCreateTransition (_uState98, _uState111, "State_98", "State_111_T1", "Dialog")
	_uState111Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 5))
	_uState111Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_081PC", "Schmiedet mir einen Ring.", 99, 16777215))
	_uState111Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 59, 289, 270, 22, 1))
	_uState111Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState111Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState111Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState111Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState111Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState111Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 418, 16777215))
	_uState111Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 419, 16777215))
	_uState111Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 420, 16777215))
	_uState111Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 421, 16777215))
	_uState111Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 422, 16777215))
	_uState111Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 423, 16777215))
	_uState111Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 424, 16777215))
	_uState111Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 425, 16777215))
	_uState111Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 426, 16777215))
	_uState111Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState111Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState111Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState111Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState111Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState111Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState111, _uState111, "State_111", "State_111", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState111, _uBeginState, "State_111", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState114Trans1 = GdsCreateTransition (_uState1, _uState114, "State_1", "State_114_T1", "Dialog")
	_uState114Trans1:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalf', 3))
	_uState114Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1) ), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState114Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState114Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocumentsCollected', 2) )) ))
	_uState114Trans1:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopEvokePriests', 99) )
	_uState114Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopEvokePriests', 99), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopEvokePriestsSolved', 2) )) ))
	_uState114Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_328", "Wir haben versagt! Das wir noch Leben ist pures Glück!", 427, 16777215))
	_uState114Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_329", "Aber noch ist es nicht zu spät! Trefft mich bei den Richtsteinen, wir wagen einen neuen Versuch!", 428, 16777215))
	_uState114Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopConjureNiethalf', 1, 1))
	_uState114Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState114Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState114, _uState114, "State_114", "State_114", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState114, _uBeginState, "State_114", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState116Trans1 = GdsCreateTransition (_uState116, _uState116, "State_116", "State_116_T1", "Dialog")
	_uState116Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 2))
	_uState116Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseJandrimsCraft', 99) ))
	_uState116Trans1:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_023PC", "Fertigt Ihr auch Waffen und Rüstungen?", 1, 16777215))
	_uState116Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 1, 4))
	_uState116Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState116Trans1 = nil

-- TO STATE: choice
_uState116Trans2 = GdsCreateTransition (_uState116, _uState116, "State_116", "State_116_T2", "Dialog")
	_uState116Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 2))
	_uState116Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopJandrimCollectOreSolved', 1))
	_uState116Trans2:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_029PC", "Ich habe zehn Brocken Iridium und Admantinum.", 2, 16777215))
	_uState116Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 1, 4))
	_uState116Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState116Trans2 = nil

-- TO STATE: choice
_uState116Trans3 = GdsCreateTransition (_uState116, _uState116, "State_116", "State_116_T3", "Dialog")
	_uState116Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 2))
	_uState116Trans3:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 1))
	_uState116Trans3:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_038PC", "Die perfekten Erze, wie gewünscht.", 3, 16777215))
	_uState116Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 1, 4))
	_uState116Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState116Trans3 = nil

-- TO STATE: choice
_uState116Trans4 = GdsCreateTransition (_uState116, _uState116, "State_116", "State_116_T4", "Dialog")
	_uState116Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 2))
	_uState116Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 0, 4))
	_uState116Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState116Trans4:AddAction (CScriptActionShowChoices())
	_uState116Trans4 = nil

-- TO STATE: choice
_uState116Trans5 = GdsCreateTransition (_uState114, _uState116, "State_114", "State_116_T5", "Dialog")
	_uState116Trans5:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2) ))
	_uState116Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState116Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState116, _uState116, "State_116", "State_116", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState116, _uBeginState, "State_116", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState117Trans1 = GdsCreateTransition (_uState116, _uState117, "State_116", "State_117_T1", "Dialog")
	_uState117Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 1))
	_uState117Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_023PC", "Fertigt Ihr auch Waffen und Rüstungen?", 99, 16777215))
	_uState117Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_024", "Nein, ausschließlich Gabeln und Löffel ... Schaut mich an, ich bin ein Zwergenschmied, was glaubt Ihr? NATÜRLICH schmiede ich Waffen und Rüstungen!", 430, 16777215))
	_uState117Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState117Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState117Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState117Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_025", "Zumindest wenn Erz da ist!", 431, 16777215))
	_uState117Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_026", "Aber da sich unser Ländchen ja mit Allen anlegen musste, sieht es da finster aus!", 432, 16777215))
	_uState117Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_027", "Also, anstatt mich anzustarren, könnt Ihr Euren drachenblütigen Allerwertesten in die Weltgeschichte hinaus bewegen und mir Iridium und Adamantinum beschaffen!", 433, 16777215))
	_uState117Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_028", "Ich zahle auch, keine Sorge!", 434, 16777215))
	_uState117Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 245, 999))
	_uState117Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 246, 999))
	_uState117Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 1, 0))
	_uState117Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectOre', 1, 0))
	_uState117Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState117Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState117, _uState117, "State_117", "State_117", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState117, _uBeginState, "State_117", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState120Trans1 = GdsCreateTransition (_uState116, _uState120, "State_116", "State_120_T1", "Dialog")
	_uState120Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 2))
	_uState120Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_029PC", "Ich habe zehn Brocken Iridium und Admantinum.", 99, 16777215))
	_uState120Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_030", "Schön für Euch! Wenn Ihr sie mir für dieses Gold hier überlasst, ist's sogar noch schön für mich!", 436, 16777215))
	_uState120Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState120Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState120Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState120Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_031PC", "Nehmt sie, ich kann nichts damit anfangen.", 437, 16777215))
	_uState120Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_032", "Das glaube ich! Menschen, Blechklopfer alle miteinander ...", 438, 16777215))
	_uState120Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_033", "Obwohl ... Ihr scheint ja zu gebrauchen zu sein!", 439, 16777215))
	_uState120Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_034", "Bringt mir weiteres Erz und ich entlohne Euch!", 440, 16777215))
	_uState120Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_035PC", "Wie wäre es diesmal mit einer Kostprobe Eurer Schmiedekunst?", 441, 16777215))
	_uState120Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_036", "Hmm ... Wohl, wohl. Dann bringt mir aber das beste Erz! Das bedeutet ich brauche perfekte Erzbrocken! Perfekt!", 442, 16777215))
	_uState120Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_037", "Dann werde ich Euch ein echtes Stück Zwergenarbeit fertigen!", 443, 16777215))
	_uState120Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 245, 999))
	_uState120Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 246, 999))
	_uState120Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectOreSolved', 2, 0))
	_uState120Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState120Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState120Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOre', 1, 0))
	_uState120Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState120Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState120, _uState120, "State_120", "State_120", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState120, _uBeginState, "State_120", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState124Trans1 = GdsCreateTransition (_uState124, _uState124, "State_124", "State_124_T1", "Dialog")
	_uState124Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 2))
	_uState124Trans1:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_041PC", "Schmiedet mir ein Langschwert.", 1, 16777215))
	_uState124Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 1, 4))
	_uState124Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState124Trans1 = nil

-- TO STATE: choice
_uState124Trans2 = GdsCreateTransition (_uState124, _uState124, "State_124", "State_124_T2", "Dialog")
	_uState124Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 2))
	_uState124Trans2:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_051PC", "Schmiedet mir einen Langdolch.", 2, 16777215))
	_uState124Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 1, 4))
	_uState124Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState124Trans2 = nil

-- TO STATE: choice
_uState124Trans3 = GdsCreateTransition (_uState124, _uState124, "State_124", "State_124_T3", "Dialog")
	_uState124Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 2))
	_uState124Trans3:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_061PC", "Schmiedet mir eine Plattenrüstung.", 3, 16777215))
	_uState124Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 1, 4))
	_uState124Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState124Trans3 = nil

-- TO STATE: choice
_uState124Trans4 = GdsCreateTransition (_uState124, _uState124, "State_124", "State_124_T4", "Dialog")
	_uState124Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 2))
	_uState124Trans4:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_071PC", "Fertigt mir einen Zauberstab.", 4, 16777215))
	_uState124Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 1, 4))
	_uState124Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState124Trans4 = nil

-- TO STATE: choice
_uState124Trans5 = GdsCreateTransition (_uState124, _uState124, "State_124", "State_124_T5", "Dialog")
	_uState124Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 2))
	_uState124Trans5:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_081PC", "Schmiedet mir einen Ring.", 5, 16777215))
	_uState124Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 1, 4))
	_uState124Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState124Trans5 = nil

-- TO STATE: choice
_uState124Trans6 = GdsCreateTransition (_uState124, _uState124, "State_124", "State_124_T6", "Dialog")
	_uState124Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 2))
	_uState124Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 0, 4))
	_uState124Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState124Trans6:AddAction (CScriptActionShowChoices())
	_uState124Trans6 = nil

-- TO STATE: choice
_uState124Trans7 = GdsCreateTransition (_uState116, _uState124, "State_116", "State_124_T7", "Dialog")
	_uState124Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 3))
	_uState124Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_038PC", "Die perfekten Erze, wie gewünscht.", 99, 16777215))
	_uState124Trans7:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_039", "Ja, da lacht das Zwergenherz!", 445, 16777215))
	_uState124Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState124Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState124Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState124Trans7:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_040", "Und wie versprochen, ein Stück soll für Euch sein. Was wollt Ihr haben?", 446, 16777215))
	_uState124Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState124Trans7 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState124, _uState124, "State_124", "State_124", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState124, _uBeginState, "State_124", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState125Trans1 = GdsCreateTransition (_uState124, _uState125, "State_124", "State_125_T1", "Dialog")
	_uState125Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 1))
	_uState125Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_041PC", "Schmiedet mir ein Langschwert.", 99, 16777215))
	_uState125Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 51, 93, 87, 22, 1))
	_uState125Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState125Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState125Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState125Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState125Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState125Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 448, 16777215))
	_uState125Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 449, 16777215))
	_uState125Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 450, 16777215))
	_uState125Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 451, 16777215))
	_uState125Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 452, 16777215))
	_uState125Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 453, 16777215))
	_uState125Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 454, 16777215))
	_uState125Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 455, 16777215))
	_uState125Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 456, 16777215))
	_uState125Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState125Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState125Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState125Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState125Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState125Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState125, _uState125, "State_125", "State_125", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState125, _uBeginState, "State_125", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState128Trans1 = GdsCreateTransition (_uState124, _uState128, "State_124", "State_128_T1", "Dialog")
	_uState128Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 2))
	_uState128Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_051PC", "Schmiedet mir einen Langdolch.", 99, 16777215))
	_uState128Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 51, 108, 83, 22, 1))
	_uState128Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState128Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState128Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState128Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState128Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState128Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 458, 16777215))
	_uState128Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 459, 16777215))
	_uState128Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 460, 16777215))
	_uState128Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 461, 16777215))
	_uState128Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 462, 16777215))
	_uState128Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 463, 16777215))
	_uState128Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 464, 16777215))
	_uState128Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 465, 16777215))
	_uState128Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 466, 16777215))
	_uState128Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState128Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState128Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState128Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState128Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState128Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState128, _uState128, "State_128", "State_128", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState128, _uBeginState, "State_128", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState131Trans1 = GdsCreateTransition (_uState124, _uState131, "State_124", "State_131_T1", "Dialog")
	_uState131Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 3))
	_uState131Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_061PC", "Schmiedet mir eine Plattenrüstung.", 99, 16777215))
	_uState131Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 76, 219, 221, 22, 1))
	_uState131Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState131Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState131Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState131Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState131Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState131Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 468, 16777215))
	_uState131Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 469, 16777215))
	_uState131Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 470, 16777215))
	_uState131Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 471, 16777215))
	_uState131Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 472, 16777215))
	_uState131Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 473, 16777215))
	_uState131Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 474, 16777215))
	_uState131Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 475, 16777215))
	_uState131Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 476, 16777215))
	_uState131Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState131Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState131Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState131Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState131Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState131Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState131, _uState131, "State_131", "State_131", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState131, _uBeginState, "State_131", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState134Trans1 = GdsCreateTransition (_uState124, _uState134, "State_124", "State_134_T1", "Dialog")
	_uState134Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4))
	_uState134Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_071PC", "Fertigt mir einen Zauberstab.", 99, 16777215))
	_uState134Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 32, 176, 130, 22, 1))
	_uState134Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState134Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState134Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState134Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState134Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState134Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 478, 16777215))
	_uState134Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 479, 16777215))
	_uState134Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 480, 16777215))
	_uState134Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 481, 16777215))
	_uState134Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 482, 16777215))
	_uState134Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 483, 16777215))
	_uState134Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 484, 16777215))
	_uState134Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 485, 16777215))
	_uState134Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 486, 16777215))
	_uState134Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState134Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState134Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState134Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState134Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState134Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState134, _uState134, "State_134", "State_134", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState134, _uBeginState, "State_134", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState137Trans1 = GdsCreateTransition (_uState124, _uState137, "State_124", "State_137_T1", "Dialog")
	_uState137Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 5))
	_uState137Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_081PC", "Schmiedet mir einen Ring.", 99, 16777215))
	_uState137Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 59, 289, 270, 22, 1))
	_uState137Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState137Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState137Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState137Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState137Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState137Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 488, 16777215))
	_uState137Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 489, 16777215))
	_uState137Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 490, 16777215))
	_uState137Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 491, 16777215))
	_uState137Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 492, 16777215))
	_uState137Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 493, 16777215))
	_uState137Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 494, 16777215))
	_uState137Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 495, 16777215))
	_uState137Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 496, 16777215))
	_uState137Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState137Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState137Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState137Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState137Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState137Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState137, _uState137, "State_137", "State_137", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState137, _uBeginState, "State_137", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState141Trans1 = GdsCreateTransition (_uState1, _uState141, "State_1", "State_141_T1", "Dialog")
	_uState141Trans1:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 1))
	_uState141Trans1:AddCondition (CScriptConditionValue('pl_Human', 'af_P353_ZerboDead', 1, 2))
	_uState141Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1) ), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState141Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState141Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocumentsCollected', 2) )) ))
	_uState141Trans1:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopEvokePriests', 99) )
	_uState141Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopEvokePriests', 99), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopEvokePriestsSolved', 2) )) ))
	_uState141Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalf', 3) ))
	_uState141Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_398", "Was für ein Kampf!", 497, 16777215))
	_uState141Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_399PC", "Haben wir dort das Ende von zwei Göttern gesehen?", 498, 16777215))
	_uState141Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_400", "Nein, Freund. Nicht einmal die Götter untereinander können sich wirklich vernichten. Nur die Körper, welche sie für ihre Erscheinung gewählt haben, sind zerstört.", 499, 16777215))
	_uState141Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_401", "Sie werden beide wieder erwachen.", 500, 16777215))
	_uState141Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_402PC", "Und was wird mit Zerbo sein? Wird er nicht weiter dem Wahnsinn verfallen sein?", 501, 16777215))
	_uState141Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_403", "Wer weiß. Die Sache ist noch nicht ausgestanden, der Prophet ist immer noch frei.", 502, 16777215))
	_uState141Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_404", "Am besten, Ihr sprecht noch einmal mit Halicos, er kennt den Kult am besten. Wenn jemand ihre nächsten Schritte errät, dann er.", 503, 16777215))
	_uState141Trans1:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_HalicosDialogDisabled', 0, 4))
	_uState141Trans1:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_HalicosDialogTypeMainQuest', 1, 4))
	_uState141Trans1:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_HalicosDialogTypeSideQuest', 0, 4))
	_uState141Trans1:AddAction (CScriptActionDialogEnable('Halicos', 1))
	_uState141Trans1:AddAction (CScriptActionSetDialog('Halicos', 2))
	_uState141Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2, 0))
	_uState141Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopTalkToHalicosAgain', 1, 0))
	_uState141Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState141Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState141, _uState141, "State_141", "State_141", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState141, _uBeginState, "State_141", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState143Trans1 = GdsCreateTransition (_uState143, _uState143, "State_143", "State_143_T1", "Dialog")
	_uState143Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 2))
	_uState143Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseJandrimsCraft', 99) ))
	_uState143Trans1:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_023PC", "Fertigt Ihr auch Waffen und Rüstungen?", 1, 16777215))
	_uState143Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 1, 4))
	_uState143Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState143Trans1 = nil

-- TO STATE: choice
_uState143Trans2 = GdsCreateTransition (_uState143, _uState143, "State_143", "State_143_T2", "Dialog")
	_uState143Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 2))
	_uState143Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopJandrimCollectOreSolved', 1))
	_uState143Trans2:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_029PC", "Ich habe zehn Brocken Iridium und Admantinum.", 2, 16777215))
	_uState143Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 1, 4))
	_uState143Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState143Trans2 = nil

-- TO STATE: choice
_uState143Trans3 = GdsCreateTransition (_uState143, _uState143, "State_143", "State_143_T3", "Dialog")
	_uState143Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 2))
	_uState143Trans3:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 1))
	_uState143Trans3:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_038PC", "Die perfekten Erze, wie gewünscht.", 3, 16777215))
	_uState143Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 1, 4))
	_uState143Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState143Trans3 = nil

-- TO STATE: choice
_uState143Trans4 = GdsCreateTransition (_uState143, _uState143, "State_143", "State_143_T4", "Dialog")
	_uState143Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 2))
	_uState143Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 0, 4))
	_uState143Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState143Trans4:AddAction (CScriptActionShowChoices())
	_uState143Trans4 = nil

-- TO STATE: choice
_uState143Trans5 = GdsCreateTransition (_uState141, _uState143, "State_141", "State_143_T5", "Dialog")
	_uState143Trans5:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2) ))
	_uState143Trans5:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_JandrimDialogEnabled', 1, 4))
	_uState143Trans5:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_JandrimDialogTypeMainQuest', 0, 4))
	_uState143Trans5:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_JandrimDialogTypeSideQuest', 1, 4))
	_uState143Trans5:AddAction (CScriptActionSetDialog('Jandrim_Windhammer', 1))
	_uState143Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState143Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState143, _uState143, "State_143", "State_143", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState143, _uBeginState, "State_143", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState144Trans1 = GdsCreateTransition (_uState143, _uState144, "State_143", "State_144_T1", "Dialog")
	_uState144Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 1))
	_uState144Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_023PC", "Fertigt Ihr auch Waffen und Rüstungen?", 99, 16777215))
	_uState144Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_024", "Nein, ausschließlich Gabeln und Löffel ... Schaut mich an, ich bin ein Zwergenschmied, was glaubt Ihr? NATÜRLICH schmiede ich Waffen und Rüstungen!", 505, 16777215))
	_uState144Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState144Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState144Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState144Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_025", "Zumindest wenn Erz da ist!", 506, 16777215))
	_uState144Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_026", "Aber da sich unser Ländchen ja mit Allen anlegen musste, sieht es da finster aus!", 507, 16777215))
	_uState144Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_027", "Also, anstatt mich anzustarren, könnt Ihr Euren drachenblütigen Allerwertesten in die Weltgeschichte hinaus bewegen und mir Iridium und Adamantinum beschaffen!", 508, 16777215))
	_uState144Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_028", "Ich zahle auch, keine Sorge!", 509, 16777215))
	_uState144Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 245, 999))
	_uState144Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 246, 999))
	_uState144Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 1, 0))
	_uState144Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectOre', 1, 0))
	_uState144Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState144Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState144, _uState144, "State_144", "State_144", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState144, _uBeginState, "State_144", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState147Trans1 = GdsCreateTransition (_uState143, _uState147, "State_143", "State_147_T1", "Dialog")
	_uState147Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 2))
	_uState147Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_029PC", "Ich habe zehn Brocken Iridium und Admantinum.", 99, 16777215))
	_uState147Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_030", "Schön für Euch! Wenn Ihr sie mir für dieses Gold hier überlasst, ist's sogar noch schön für mich!", 511, 16777215))
	_uState147Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState147Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState147Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState147Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_031PC", "Nehmt sie, ich kann nichts damit anfangen.", 512, 16777215))
	_uState147Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_032", "Das glaube ich! Menschen, Blechklopfer alle miteinander ...", 513, 16777215))
	_uState147Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_033", "Obwohl ... Ihr scheint ja zu gebrauchen zu sein!", 514, 16777215))
	_uState147Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_034", "Bringt mir weiteres Erz und ich entlohne Euch!", 515, 16777215))
	_uState147Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_035PC", "Wie wäre es diesmal mit einer Kostprobe Eurer Schmiedekunst?", 516, 16777215))
	_uState147Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_036", "Hmm ... Wohl, wohl. Dann bringt mir aber das beste Erz! Das bedeutet ich brauche perfekte Erzbrocken! Perfekt!", 517, 16777215))
	_uState147Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_037", "Dann werde ich Euch ein echtes Stück Zwergenarbeit fertigen!", 518, 16777215))
	_uState147Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 245, 999))
	_uState147Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 246, 999))
	_uState147Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectOreSolved', 2, 0))
	_uState147Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState147Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState147Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOre', 1, 0))
	_uState147Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState147Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState147, _uState147, "State_147", "State_147", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState147, _uBeginState, "State_147", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState151Trans1 = GdsCreateTransition (_uState151, _uState151, "State_151", "State_151_T1", "Dialog")
	_uState151Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 2))
	_uState151Trans1:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_041PC", "Schmiedet mir ein Langschwert.", 1, 16777215))
	_uState151Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 1, 4))
	_uState151Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState151Trans1 = nil

-- TO STATE: choice
_uState151Trans2 = GdsCreateTransition (_uState151, _uState151, "State_151", "State_151_T2", "Dialog")
	_uState151Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 2))
	_uState151Trans2:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_051PC", "Schmiedet mir einen Langdolch.", 2, 16777215))
	_uState151Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 1, 4))
	_uState151Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState151Trans2 = nil

-- TO STATE: choice
_uState151Trans3 = GdsCreateTransition (_uState151, _uState151, "State_151", "State_151_T3", "Dialog")
	_uState151Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 2))
	_uState151Trans3:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_061PC", "Schmiedet mir eine Plattenrüstung.", 3, 16777215))
	_uState151Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 1, 4))
	_uState151Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState151Trans3 = nil

-- TO STATE: choice
_uState151Trans4 = GdsCreateTransition (_uState151, _uState151, "State_151", "State_151_T4", "Dialog")
	_uState151Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 2))
	_uState151Trans4:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_071PC", "Fertigt mir einen Zauberstab.", 4, 16777215))
	_uState151Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 1, 4))
	_uState151Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState151Trans4 = nil

-- TO STATE: choice
_uState151Trans5 = GdsCreateTransition (_uState151, _uState151, "State_151", "State_151_T5", "Dialog")
	_uState151Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 2))
	_uState151Trans5:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_081PC", "Schmiedet mir einen Ring.", 5, 16777215))
	_uState151Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 1, 4))
	_uState151Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState151Trans5 = nil

-- TO STATE: choice
_uState151Trans6 = GdsCreateTransition (_uState151, _uState151, "State_151", "State_151_T6", "Dialog")
	_uState151Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 2))
	_uState151Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 0, 4))
	_uState151Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState151Trans6:AddAction (CScriptActionShowChoices())
	_uState151Trans6 = nil

-- TO STATE: choice
_uState151Trans7 = GdsCreateTransition (_uState143, _uState151, "State_143", "State_151_T7", "Dialog")
	_uState151Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 3))
	_uState151Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_038PC", "Die perfekten Erze, wie gewünscht.", 99, 16777215))
	_uState151Trans7:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_039", "Ja, da lacht das Zwergenherz!", 520, 16777215))
	_uState151Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState151Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState151Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState151Trans7:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_040", "Und wie versprochen, ein Stück soll für Euch sein. Was wollt Ihr haben?", 521, 16777215))
	_uState151Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState151Trans7 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState151, _uState151, "State_151", "State_151", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState151, _uBeginState, "State_151", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState152Trans1 = GdsCreateTransition (_uState151, _uState152, "State_151", "State_152_T1", "Dialog")
	_uState152Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 1))
	_uState152Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_041PC", "Schmiedet mir ein Langschwert.", 99, 16777215))
	_uState152Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 51, 93, 87, 22, 1))
	_uState152Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState152Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState152Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState152Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState152Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState152Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 523, 16777215))
	_uState152Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 524, 16777215))
	_uState152Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 525, 16777215))
	_uState152Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 526, 16777215))
	_uState152Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 527, 16777215))
	_uState152Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 528, 16777215))
	_uState152Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 529, 16777215))
	_uState152Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 530, 16777215))
	_uState152Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 531, 16777215))
	_uState152Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState152Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState152Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState152Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState152Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState152Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState152, _uState152, "State_152", "State_152", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState152, _uBeginState, "State_152", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState155Trans1 = GdsCreateTransition (_uState151, _uState155, "State_151", "State_155_T1", "Dialog")
	_uState155Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 2))
	_uState155Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_051PC", "Schmiedet mir einen Langdolch.", 99, 16777215))
	_uState155Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 51, 108, 83, 22, 1))
	_uState155Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState155Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState155Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState155Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState155Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState155Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 533, 16777215))
	_uState155Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 534, 16777215))
	_uState155Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 535, 16777215))
	_uState155Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 536, 16777215))
	_uState155Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 537, 16777215))
	_uState155Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 538, 16777215))
	_uState155Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 539, 16777215))
	_uState155Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 540, 16777215))
	_uState155Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 541, 16777215))
	_uState155Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState155Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState155Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState155Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState155Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState155Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState155, _uState155, "State_155", "State_155", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState155, _uBeginState, "State_155", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState158Trans1 = GdsCreateTransition (_uState151, _uState158, "State_151", "State_158_T1", "Dialog")
	_uState158Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 3))
	_uState158Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_061PC", "Schmiedet mir eine Plattenrüstung.", 99, 16777215))
	_uState158Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 76, 219, 221, 22, 1))
	_uState158Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState158Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState158Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState158Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState158Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState158Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 543, 16777215))
	_uState158Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 544, 16777215))
	_uState158Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 545, 16777215))
	_uState158Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 546, 16777215))
	_uState158Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 547, 16777215))
	_uState158Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 548, 16777215))
	_uState158Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 549, 16777215))
	_uState158Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 550, 16777215))
	_uState158Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 551, 16777215))
	_uState158Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState158Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState158Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState158Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState158Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState158Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState158, _uState158, "State_158", "State_158", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState158, _uBeginState, "State_158", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState161Trans1 = GdsCreateTransition (_uState151, _uState161, "State_151", "State_161_T1", "Dialog")
	_uState161Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4))
	_uState161Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_071PC", "Fertigt mir einen Zauberstab.", 99, 16777215))
	_uState161Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 32, 176, 130, 22, 1))
	_uState161Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState161Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState161Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState161Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState161Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState161Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 553, 16777215))
	_uState161Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 554, 16777215))
	_uState161Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 555, 16777215))
	_uState161Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 556, 16777215))
	_uState161Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 557, 16777215))
	_uState161Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 558, 16777215))
	_uState161Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 559, 16777215))
	_uState161Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 560, 16777215))
	_uState161Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 561, 16777215))
	_uState161Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState161Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState161Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState161Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState161Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState161Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState161, _uState161, "State_161", "State_161", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState161, _uBeginState, "State_161", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState164Trans1 = GdsCreateTransition (_uState151, _uState164, "State_151", "State_164_T1", "Dialog")
	_uState164Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 5))
	_uState164Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_081PC", "Schmiedet mir einen Ring.", 99, 16777215))
	_uState164Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 59, 289, 270, 22, 1))
	_uState164Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState164Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState164Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState164Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState164Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState164Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 563, 16777215))
	_uState164Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 564, 16777215))
	_uState164Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 565, 16777215))
	_uState164Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 566, 16777215))
	_uState164Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 567, 16777215))
	_uState164Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 568, 16777215))
	_uState164Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 569, 16777215))
	_uState164Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 570, 16777215))
	_uState164Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 571, 16777215))
	_uState164Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState164Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState164Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState164Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState164Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState164Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState164, _uState164, "State_164", "State_164", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState164, _uBeginState, "State_164", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: else
_uState168Trans1 = GdsCreateTransition (_uState1, _uState168, "State_1", "State_168_T1", "Dialog")
	_uState168Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1) ), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState168Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState168Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocumentsCollected', 2) )) ))
	_uState168Trans1:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopEvokePriests', 99) )
	_uState168Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopEvokePriests', 99), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopEvokePriestsSolved', 2) )) ))
	_uState168Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalf', 3) ))
	_uState168Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 1), CScriptConditionValue('pl_Human', 'af_P353_ZerboDead', 1, 2)) ))
	_uState168Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState168Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState168, _uState168, "State_168", "State_168", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState168, _uBeginState, "State_168", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState170Trans1 = GdsCreateTransition (_uState170, _uState170, "State_170", "State_170_T1", "Dialog")
	_uState170Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 2))
	_uState170Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseJandrimsCraft', 99) ))
	_uState170Trans1:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_023PC", "Fertigt Ihr auch Waffen und Rüstungen?", 1, 16777215))
	_uState170Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 1, 4))
	_uState170Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState170Trans1 = nil

-- TO STATE: choice
_uState170Trans2 = GdsCreateTransition (_uState170, _uState170, "State_170", "State_170_T2", "Dialog")
	_uState170Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 2))
	_uState170Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopJandrimCollectOreSolved', 1))
	_uState170Trans2:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_029PC", "Ich habe zehn Brocken Iridium und Admantinum.", 2, 16777215))
	_uState170Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 1, 4))
	_uState170Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState170Trans2 = nil

-- TO STATE: choice
_uState170Trans3 = GdsCreateTransition (_uState170, _uState170, "State_170", "State_170_T3", "Dialog")
	_uState170Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 2))
	_uState170Trans3:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 1))
	_uState170Trans3:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_038PC", "Die perfekten Erze, wie gewünscht.", 3, 16777215))
	_uState170Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 1, 4))
	_uState170Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState170Trans3 = nil

-- TO STATE: choice
_uState170Trans4 = GdsCreateTransition (_uState170, _uState170, "State_170", "State_170_T4", "Dialog")
	_uState170Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 2))
	_uState170Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 0, 4))
	_uState170Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState170Trans4:AddAction (CScriptActionShowChoices())
	_uState170Trans4 = nil

-- TO STATE: choice
_uState170Trans5 = GdsCreateTransition (_uState168, _uState170, "State_168", "State_170_T5", "Dialog")
	_uState170Trans5:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2) ))
	_uState170Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState170Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState170, _uState170, "State_170", "State_170", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState170, _uBeginState, "State_170", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState171Trans1 = GdsCreateTransition (_uState170, _uState171, "State_170", "State_171_T1", "Dialog")
	_uState171Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 1))
	_uState171Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_023PC", "Fertigt Ihr auch Waffen und Rüstungen?", 99, 16777215))
	_uState171Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_024", "Nein, ausschließlich Gabeln und Löffel ... Schaut mich an, ich bin ein Zwergenschmied, was glaubt Ihr? NATÜRLICH schmiede ich Waffen und Rüstungen!", 573, 16777215))
	_uState171Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState171Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState171Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState171Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_025", "Zumindest wenn Erz da ist!", 574, 16777215))
	_uState171Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_026", "Aber da sich unser Ländchen ja mit Allen anlegen musste, sieht es da finster aus!", 575, 16777215))
	_uState171Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_027", "Also, anstatt mich anzustarren, könnt Ihr Euren drachenblütigen Allerwertesten in die Weltgeschichte hinaus bewegen und mir Iridium und Adamantinum beschaffen!", 576, 16777215))
	_uState171Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_028", "Ich zahle auch, keine Sorge!", 577, 16777215))
	_uState171Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 245, 999))
	_uState171Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 246, 999))
	_uState171Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 1, 0))
	_uState171Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectOre', 1, 0))
	_uState171Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState171Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState171, _uState171, "State_171", "State_171", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState171, _uBeginState, "State_171", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState174Trans1 = GdsCreateTransition (_uState170, _uState174, "State_170", "State_174_T1", "Dialog")
	_uState174Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 2))
	_uState174Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_029PC", "Ich habe zehn Brocken Iridium und Admantinum.", 99, 16777215))
	_uState174Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_030", "Schön für Euch! Wenn Ihr sie mir für dieses Gold hier überlasst, ist's sogar noch schön für mich!", 579, 16777215))
	_uState174Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState174Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState174Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState174Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_031PC", "Nehmt sie, ich kann nichts damit anfangen.", 580, 16777215))
	_uState174Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_032", "Das glaube ich! Menschen, Blechklopfer alle miteinander ...", 581, 16777215))
	_uState174Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_033", "Obwohl ... Ihr scheint ja zu gebrauchen zu sein!", 582, 16777215))
	_uState174Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_034", "Bringt mir weiteres Erz und ich entlohne Euch!", 583, 16777215))
	_uState174Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_035PC", "Wie wäre es diesmal mit einer Kostprobe Eurer Schmiedekunst?", 584, 16777215))
	_uState174Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_036", "Hmm ... Wohl, wohl. Dann bringt mir aber das beste Erz! Das bedeutet ich brauche perfekte Erzbrocken! Perfekt!", 585, 16777215))
	_uState174Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_037", "Dann werde ich Euch ein echtes Stück Zwergenarbeit fertigen!", 586, 16777215))
	_uState174Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 245, 999))
	_uState174Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 246, 999))
	_uState174Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectOreSolved', 2, 0))
	_uState174Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState174Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState174Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOre', 1, 0))
	_uState174Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState174Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState174, _uState174, "State_174", "State_174", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState174, _uBeginState, "State_174", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState178Trans1 = GdsCreateTransition (_uState178, _uState178, "State_178", "State_178_T1", "Dialog")
	_uState178Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 2))
	_uState178Trans1:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_041PC", "Schmiedet mir ein Langschwert.", 1, 16777215))
	_uState178Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 1, 4))
	_uState178Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState178Trans1 = nil

-- TO STATE: choice
_uState178Trans2 = GdsCreateTransition (_uState178, _uState178, "State_178", "State_178_T2", "Dialog")
	_uState178Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 2))
	_uState178Trans2:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_051PC", "Schmiedet mir einen Langdolch.", 2, 16777215))
	_uState178Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 1, 4))
	_uState178Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState178Trans2 = nil

-- TO STATE: choice
_uState178Trans3 = GdsCreateTransition (_uState178, _uState178, "State_178", "State_178_T3", "Dialog")
	_uState178Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 2))
	_uState178Trans3:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_061PC", "Schmiedet mir eine Plattenrüstung.", 3, 16777215))
	_uState178Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 1, 4))
	_uState178Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState178Trans3 = nil

-- TO STATE: choice
_uState178Trans4 = GdsCreateTransition (_uState178, _uState178, "State_178", "State_178_T4", "Dialog")
	_uState178Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 2))
	_uState178Trans4:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_071PC", "Fertigt mir einen Zauberstab.", 4, 16777215))
	_uState178Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 1, 4))
	_uState178Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState178Trans4 = nil

-- TO STATE: choice
_uState178Trans5 = GdsCreateTransition (_uState178, _uState178, "State_178", "State_178_T5", "Dialog")
	_uState178Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 2))
	_uState178Trans5:AddAction (CScriptActionChoice("P333_DLG_JANDRIM_081PC", "Schmiedet mir einen Ring.", 5, 16777215))
	_uState178Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 1, 4))
	_uState178Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState178Trans5 = nil

-- TO STATE: choice
_uState178Trans6 = GdsCreateTransition (_uState178, _uState178, "State_178", "State_178_T6", "Dialog")
	_uState178Trans6:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 2))
	_uState178Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 0, 4))
	_uState178Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState178Trans6:AddAction (CScriptActionShowChoices())
	_uState178Trans6 = nil

-- TO STATE: choice
_uState178Trans7 = GdsCreateTransition (_uState170, _uState178, "State_170", "State_178_T7", "Dialog")
	_uState178Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 3))
	_uState178Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_038PC", "Die perfekten Erze, wie gewünscht.", 99, 16777215))
	_uState178Trans7:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_039", "Ja, da lacht das Zwergenherz!", 588, 16777215))
	_uState178Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState178Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState178Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState178Trans7:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_040", "Und wie versprochen, ein Stück soll für Euch sein. Was wollt Ihr haben?", 589, 16777215))
	_uState178Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState178Trans7 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState178, _uState178, "State_178", "State_178", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState178, _uBeginState, "State_178", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState179Trans1 = GdsCreateTransition (_uState178, _uState179, "State_178", "State_179_T1", "Dialog")
	_uState179Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 1))
	_uState179Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_041PC", "Schmiedet mir ein Langschwert.", 99, 16777215))
	_uState179Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 51, 93, 87, 22, 1))
	_uState179Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState179Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState179Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState179Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState179Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState179Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 591, 16777215))
	_uState179Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 592, 16777215))
	_uState179Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 593, 16777215))
	_uState179Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 594, 16777215))
	_uState179Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 595, 16777215))
	_uState179Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 596, 16777215))
	_uState179Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 597, 16777215))
	_uState179Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 598, 16777215))
	_uState179Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 599, 16777215))
	_uState179Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState179Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState179Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState179Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState179Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState179Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState179, _uState179, "State_179", "State_179", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState179, _uBeginState, "State_179", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState182Trans1 = GdsCreateTransition (_uState178, _uState182, "State_178", "State_182_T1", "Dialog")
	_uState182Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 2))
	_uState182Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_051PC", "Schmiedet mir einen Langdolch.", 99, 16777215))
	_uState182Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 51, 108, 83, 22, 1))
	_uState182Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState182Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState182Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState182Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState182Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState182Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 601, 16777215))
	_uState182Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 602, 16777215))
	_uState182Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 603, 16777215))
	_uState182Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 604, 16777215))
	_uState182Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 605, 16777215))
	_uState182Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 606, 16777215))
	_uState182Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 607, 16777215))
	_uState182Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 608, 16777215))
	_uState182Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 609, 16777215))
	_uState182Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState182Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState182Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState182Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState182Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState182Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState182, _uState182, "State_182", "State_182", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState182, _uBeginState, "State_182", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState185Trans1 = GdsCreateTransition (_uState178, _uState185, "State_178", "State_185_T1", "Dialog")
	_uState185Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 3))
	_uState185Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_061PC", "Schmiedet mir eine Plattenrüstung.", 99, 16777215))
	_uState185Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 76, 219, 221, 22, 1))
	_uState185Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState185Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState185Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState185Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState185Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState185Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 611, 16777215))
	_uState185Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 612, 16777215))
	_uState185Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 613, 16777215))
	_uState185Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 614, 16777215))
	_uState185Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 615, 16777215))
	_uState185Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 616, 16777215))
	_uState185Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 617, 16777215))
	_uState185Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 618, 16777215))
	_uState185Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 619, 16777215))
	_uState185Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState185Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState185Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState185Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState185Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState185Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState185, _uState185, "State_185", "State_185", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState185, _uBeginState, "State_185", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState188Trans1 = GdsCreateTransition (_uState178, _uState188, "State_178", "State_188_T1", "Dialog")
	_uState188Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4))
	_uState188Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_071PC", "Fertigt mir einen Zauberstab.", 99, 16777215))
	_uState188Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 32, 176, 130, 22, 1))
	_uState188Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState188Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState188Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState188Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState188Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState188Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 621, 16777215))
	_uState188Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 622, 16777215))
	_uState188Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 623, 16777215))
	_uState188Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 624, 16777215))
	_uState188Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 625, 16777215))
	_uState188Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 626, 16777215))
	_uState188Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 627, 16777215))
	_uState188Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 628, 16777215))
	_uState188Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 629, 16777215))
	_uState188Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState188Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState188Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState188Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState188Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState188Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState188, _uState188, "State_188", "State_188", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState188, _uBeginState, "State_188", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState191Trans1 = GdsCreateTransition (_uState178, _uState191, "State_178", "State_191_T1", "Dialog")
	_uState191Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 5))
	_uState191Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_081PC", "Schmiedet mir einen Ring.", 99, 16777215))
	_uState191Trans1:AddAction (CScriptActionPlayerGiveItemGeneric('pl_Human', 59, 289, 270, 22, 1))
	_uState191Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState191Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState191Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState191Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState191Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState191Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_042", "Wohl, wohl ...", 631, 16777215))
	_uState191Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_043PC", "Und?", 632, 16777215))
	_uState191Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_044", "Was und?", 633, 16777215))
	_uState191Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_045PC", "Ja, wann fertigt Ihr es?", 634, 16777215))
	_uState191Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_046", "Ha! So etwas zu schmieden, also ich meine etwas wirklich Gutes, dauert Monate, Freund!", 635, 16777215))
	_uState191Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_047PC", "Herrje.", 636, 16777215))
	_uState191Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_048", "Aber ...!", 637, 16777215))
	_uState191Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_049", "Ich habe just so ein feines Stück auf Lager!", 638, 16777215))
	_uState191Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_050", "Hier! Passt gut darauf auf! Niethalfs Stärke mit Euch!", 639, 16777215))
	_uState191Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 170, 999))
	_uState191Trans1:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 171, 999))
	_uState191Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopJandrimCollectPerfectOreSolved', 2, 0))
	_uState191Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2, 0))
	_uState191Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState191Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState191, _uState191, "State_191", "State_191", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState191, _uBeginState, "State_191", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState195Trans1 = GdsCreateTransition (_uState6, _uState195, "State_6", "State_195_T1", "Dialog")
	_uState195Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 2))
	_uState195Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_013PC", "Was soll ich tun?", 99, 16777215))
	_uState195Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_014", "Ich wette der Kult steckt hinter all dem! Halicos spielt falsch!", 113, 16777215))
	_uState195Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_015", "Aber wir brauchen Beweise!", 114, 16777215))
	_uState195Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_016", "Ihr müsst die geheimen Boten des Kultes finden! Es sind Kitaki, Mietspione aus Kathai!", 115, 16777215))
	_uState195Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_017", "Die Kitaki sind so gut wie nicht aufzuspüren. Ihr werdet einen Seher brauchen, um sie zu finden!", 116, 16777215))
	_uState195Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_018PC", "Seher?", 117, 16777215))
	_uState195Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_019", "Sehr begabte Fährtenleser der Orks. Sie werden sich Euch allerdings nicht freiwillig anschließen.", 118, 16777215))
	_uState195Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_020", "Sucht in Uram Gor, den Magnetsteinen, am Heulerpass und in der Wüste der tanzenden Sonne nach Kitaki-Boten. Dazu müsst Ihr im jeweiligen Land erst einen Seher finden und bezwingen.", 119, 16777215))
	_uState195Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_021", "Wenn Ihr einen Seher besiegt habt, wird er Euch folgen. Schickt den Seher dann durch das Land. Sobald er einen Kitaki-Boten ausmacht, wird er ihn aus seinem Versteck holen.", 120, 16777215))
	_uState195Trans1:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_022", "Besiegt die Boten und sammelt die Dokumente, die sie bei sich tragen. Wenn Ihr genug von ihnen habt, kehrt zu mir zurück.", 121, 16777215))
	_uState195Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopTalkToAnyone', 2, 0))
	_uState195Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseChapter_2', 2, 0))
	_uState195Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseChapter_3', 1, 0))
	_uState195Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopSpyDocuments', 1, 0))
	_uState195Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans1 = nil

-- TO STATE: endconversation
_uState195Trans2 = GdsCreateTransition (_uState9, _uState195, "State_9", "State_195_T2", "Dialog")
	_uState195Trans2:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState195Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans2 = nil

-- TO STATE: endconversation
_uState195Trans3 = GdsCreateTransition (_uState12, _uState195, "State_12", "State_195_T3", "Dialog")
	_uState195Trans3:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState195Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans3 = nil

-- TO STATE: endconversation
_uState195Trans4 = GdsCreateTransition (_uState17, _uState195, "State_17", "State_195_T4", "Dialog")
	_uState195Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans4 = nil

-- TO STATE: endconversation
_uState195Trans5 = GdsCreateTransition (_uState17, _uState195, "State_17", "State_195_T5", "Dialog")
	_uState195Trans5:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans5 = nil

-- TO STATE: endconversation
_uState195Trans6 = GdsCreateTransition (_uState20, _uState195, "State_20", "State_195_T6", "Dialog")
	_uState195Trans6:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans6 = nil

-- TO STATE: endconversation
_uState195Trans7 = GdsCreateTransition (_uState20, _uState195, "State_20", "State_195_T7", "Dialog")
	_uState195Trans7:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans7:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans7 = nil

-- TO STATE: endconversation
_uState195Trans8 = GdsCreateTransition (_uState23, _uState195, "State_23", "State_195_T8", "Dialog")
	_uState195Trans8:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans8:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans8 = nil

-- TO STATE: endconversation
_uState195Trans9 = GdsCreateTransition (_uState23, _uState195, "State_23", "State_195_T9", "Dialog")
	_uState195Trans9:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans9:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans9 = nil

-- TO STATE: endconversation
_uState195Trans10 = GdsCreateTransition (_uState26, _uState195, "State_26", "State_195_T10", "Dialog")
	_uState195Trans10:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans10:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans10 = nil

-- TO STATE: endconversation
_uState195Trans11 = GdsCreateTransition (_uState26, _uState195, "State_26", "State_195_T11", "Dialog")
	_uState195Trans11:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans11:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans11 = nil

-- TO STATE: endconversation
_uState195Trans12 = GdsCreateTransition (_uState29, _uState195, "State_29", "State_195_T12", "Dialog")
	_uState195Trans12:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans12:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans12 = nil

-- TO STATE: endconversation
_uState195Trans13 = GdsCreateTransition (_uState29, _uState195, "State_29", "State_195_T13", "Dialog")
	_uState195Trans13:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans13:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag13(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans13 = nil

-- TO STATE: endconversation
_uState195Trans14 = GdsCreateTransition (_uState4, _uState195, "State_4", "State_195_T14", "Dialog")
	_uState195Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 5))
	_uState195Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_091PC", "Nicht Eure Sache, Zwerg.", 99, 16777215))
	_uState195Trans14:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag14(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans14 = nil

-- TO STATE: endconversation
_uState195Trans15 = GdsCreateTransition (_uState34, _uState195, "State_34", "State_195_T15", "Dialog")
	_uState195Trans15:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 1))
	_uState195Trans15:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_093PC", "Noch nicht.", 99, 16777215))
	_uState195Trans15:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag15(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans15 = nil

-- TO STATE: endconversation
_uState195Trans16 = GdsCreateTransition (_uState34, _uState195, "State_34", "State_195_T16", "Dialog")
	_uState195Trans16:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 2))
	_uState195Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_094PC", "Ich denke schon, reichen Euch diese Zwölf?", 99, 16777215))
	_uState195Trans16:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_095", "Das sollte genügen, um der Sache auf den Grund zu gehen!", 194, 16777215))
	_uState195Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans16:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_096", "Es ist wahr! Der Kult versucht die Entstehung des wahnsinnigen Gottes zu erwirken!", 195, 16777215))
	_uState195Trans16:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_097", "Deswegen haben sie die Freihändler ermorden lassen! Sie waren die letzten Anhänger des Diebesgottes Zerbo!", 196, 16777215))
	_uState195Trans16:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_098", "Zerbo ist also der Gott, welcher dem Wahnsinn verfallen soll! Und der Kult sorgt dafür, das dies geschieht!", 197, 16777215))
	_uState195Trans16:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_099", "Dieser Prophet ist ihr Anführer! Er hat einen Pakt mit den Dämonen! Und Halicos steckt da mit drin!", 198, 16777215))
	_uState195Trans16:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_100", "Dieser Hund! Er hat die Hand benutzt um dieses Schauspiel zu inszenieren! Sein Schädel wird gleich erfahren, warum man mich Windhammer nennt!", 199, 16777215))
	_uState195Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_101PC", "Wartet! Ich glaube er ist über die Folgen seiner Taten nicht minder verwirrt als wir es waren.", 200, 16777215))
	_uState195Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_102PC", "Ich werde hören, was er zu sagen hat!", 201, 16777215))
	_uState195Trans16:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_HalicosDialogDisabled', 0, 4))
	_uState195Trans16:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_HalicosDialogTypeMainQuest', 1, 4))
	_uState195Trans16:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_HalicosDialogTypeSideQuest', 0, 4))
	_uState195Trans16:AddAction (CScriptActionDialogEnable('Halicos', 1))
	_uState195Trans16:AddAction (CScriptActionSetDialog('Halicos', 2))
	_uState195Trans16:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_JandrimDialogEnabled', 0, 4))
	_uState195Trans16:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_JandrimDialogTypeMainQuest', 0, 4))
	_uState195Trans16:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_JandrimDialogTypeSideQuest', 0, 4))
	_uState195Trans16:AddAction (CScriptActionDialogEnable('Jandrim_Windhammer', 0))
	_uState195Trans16:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopSpyDocumentsCollected', 2, 0))
	_uState195Trans16:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopTalkToHalicos', 1, 0))
	_uState195Trans16:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag16(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans16 = nil

-- TO STATE: endconversation
_uState195Trans17 = GdsCreateTransition (_uState37, _uState195, "State_37", "State_195_T17", "Dialog")
	_uState195Trans17:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState195Trans17:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag17(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans17 = nil

-- TO STATE: endconversation
_uState195Trans18 = GdsCreateTransition (_uState40, _uState195, "State_40", "State_195_T18", "Dialog")
	_uState195Trans18:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState195Trans18:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag18(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans18 = nil

-- TO STATE: endconversation
_uState195Trans19 = GdsCreateTransition (_uState45, _uState195, "State_45", "State_195_T19", "Dialog")
	_uState195Trans19:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans19:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag19(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans19 = nil

-- TO STATE: endconversation
_uState195Trans20 = GdsCreateTransition (_uState45, _uState195, "State_45", "State_195_T20", "Dialog")
	_uState195Trans20:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans20:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag20(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans20 = nil

-- TO STATE: endconversation
_uState195Trans21 = GdsCreateTransition (_uState48, _uState195, "State_48", "State_195_T21", "Dialog")
	_uState195Trans21:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans21:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag21(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans21 = nil

-- TO STATE: endconversation
_uState195Trans22 = GdsCreateTransition (_uState48, _uState195, "State_48", "State_195_T22", "Dialog")
	_uState195Trans22:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans22:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag22(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans22 = nil

-- TO STATE: endconversation
_uState195Trans23 = GdsCreateTransition (_uState51, _uState195, "State_51", "State_195_T23", "Dialog")
	_uState195Trans23:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans23:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag23(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans23 = nil

-- TO STATE: endconversation
_uState195Trans24 = GdsCreateTransition (_uState51, _uState195, "State_51", "State_195_T24", "Dialog")
	_uState195Trans24:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans24:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag24(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans24 = nil

-- TO STATE: endconversation
_uState195Trans25 = GdsCreateTransition (_uState54, _uState195, "State_54", "State_195_T25", "Dialog")
	_uState195Trans25:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans25:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag25(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans25 = nil

-- TO STATE: endconversation
_uState195Trans26 = GdsCreateTransition (_uState54, _uState195, "State_54", "State_195_T26", "Dialog")
	_uState195Trans26:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans26:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag26(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans26 = nil

-- TO STATE: endconversation
_uState195Trans27 = GdsCreateTransition (_uState57, _uState195, "State_57", "State_195_T27", "Dialog")
	_uState195Trans27:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans27:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans27:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag27(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans27:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans27 = nil

-- TO STATE: endconversation
_uState195Trans28 = GdsCreateTransition (_uState57, _uState195, "State_57", "State_195_T28", "Dialog")
	_uState195Trans28:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans28:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans28:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag28(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans28:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans28 = nil

-- TO STATE: endconversation
_uState195Trans29 = GdsCreateTransition (_uState63, _uState195, "State_63", "State_195_T29", "Dialog")
	_uState195Trans29:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState195Trans29:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans29:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag29(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans29:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans29 = nil

-- TO STATE: endconversation
_uState195Trans30 = GdsCreateTransition (_uState66, _uState195, "State_66", "State_195_T30", "Dialog")
	_uState195Trans30:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState195Trans30:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans30:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag30(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans30:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans30 = nil

-- TO STATE: endconversation
_uState195Trans31 = GdsCreateTransition (_uState71, _uState195, "State_71", "State_195_T31", "Dialog")
	_uState195Trans31:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans31:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans31:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag31(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans31:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans31 = nil

-- TO STATE: endconversation
_uState195Trans32 = GdsCreateTransition (_uState71, _uState195, "State_71", "State_195_T32", "Dialog")
	_uState195Trans32:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans32:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans32:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag32(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans32:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans32 = nil

-- TO STATE: endconversation
_uState195Trans33 = GdsCreateTransition (_uState74, _uState195, "State_74", "State_195_T33", "Dialog")
	_uState195Trans33:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans33:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans33:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag33(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans33:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans33 = nil

-- TO STATE: endconversation
_uState195Trans34 = GdsCreateTransition (_uState74, _uState195, "State_74", "State_195_T34", "Dialog")
	_uState195Trans34:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans34:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans34:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag34(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans34:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans34 = nil

-- TO STATE: endconversation
_uState195Trans35 = GdsCreateTransition (_uState77, _uState195, "State_77", "State_195_T35", "Dialog")
	_uState195Trans35:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans35:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans35:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag35(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans35:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans35 = nil

-- TO STATE: endconversation
_uState195Trans36 = GdsCreateTransition (_uState77, _uState195, "State_77", "State_195_T36", "Dialog")
	_uState195Trans36:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans36:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans36:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag36(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans36:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans36 = nil

-- TO STATE: endconversation
_uState195Trans37 = GdsCreateTransition (_uState80, _uState195, "State_80", "State_195_T37", "Dialog")
	_uState195Trans37:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans37:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans37:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag37(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans37:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans37 = nil

-- TO STATE: endconversation
_uState195Trans38 = GdsCreateTransition (_uState80, _uState195, "State_80", "State_195_T38", "Dialog")
	_uState195Trans38:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans38:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans38:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag38(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans38:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans38 = nil

-- TO STATE: endconversation
_uState195Trans39 = GdsCreateTransition (_uState83, _uState195, "State_83", "State_195_T39", "Dialog")
	_uState195Trans39:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans39:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans39:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag39(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans39:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans39 = nil

-- TO STATE: endconversation
_uState195Trans40 = GdsCreateTransition (_uState83, _uState195, "State_83", "State_195_T40", "Dialog")
	_uState195Trans40:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans40:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans40:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag40(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans40:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans40 = nil

-- TO STATE: endconversation
_uState195Trans41 = GdsCreateTransition (_uState60, _uState195, "State_60", "State_195_T41", "Dialog")
	_uState195Trans41:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2) )
	_uState195Trans41:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans41:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag41(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans41:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans41 = nil

-- TO STATE: endconversation
_uState195Trans42 = GdsCreateTransition (_uState88, _uState195, "State_88", "State_195_T42", "Dialog")
	_uState195Trans42:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 1))
	_uState195Trans42:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_251PC", "Noch nicht.", 99, 16777215))
	_uState195Trans42:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans42:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag42(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans42:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans42:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans42:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans42:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans42:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans42:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans42 = nil

-- TO STATE: endconversation
_uState195Trans43 = GdsCreateTransition (_uState88, _uState195, "State_88", "State_195_T43", "Dialog")
	_uState195Trans43:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 2))
	_uState195Trans43:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_252PC", "Ja, sie werden zur Stelle sein.", 99, 16777215))
	_uState195Trans43:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_253", "Ich kann Niethalf zwar beschwören, aber es ist nicht gesagt, dass er uns Glauben schenkt. Götter sind nicht mit einfachen Worten zu beeindrucken!", 352, 16777215))
	_uState195Trans43:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans43:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans43:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans43:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans43:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uState195Trans43:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_254", "Wir sollten ihn an einem Ort beschwören, wo er Beweise sieht!", 353, 16777215))
	_uState195Trans43:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_JANDRIM_255PC", "Die Richtsteine!", 354, 16777215))
	_uState195Trans43:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_256", "Wenn Ayas Hinweise richtig sind, dann ist dies der Ort, an dem die Entscheidung fällt ...", 355, 16777215))
	_uState195Trans43:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_257", "Trefft mich dort, wir müssen gemeinsam das Versteck des Kultes suchen und herausfinden, was dort vor sich geht!", 356, 16777215))
	_uState195Trans43:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_258", "Sollte Aya recht behalten, werde ich die Priester rufen und Niethalf beschwören!", 357, 16777215))
	_uState195Trans43:AddAction (CScriptActionSay("Jandrim_Windhammer", "P333_DLG_JANDRIM_259", "Hoffen wir, dass Niethalf gerechter Hammer dann das Treiben dieses Kultes beendet!", 358, 16777215))
	_uState195Trans43:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopEvokePriestsSolved', 2, 0))
	_uState195Trans43:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopConjureNiethalf', 1, 0))
	_uState195Trans43:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans43:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag43(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans43:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans43 = nil

-- TO STATE: endconversation
_uState195Trans44 = GdsCreateTransition (_uState91, _uState195, "State_91", "State_195_T44", "Dialog")
	_uState195Trans44:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState195Trans44:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans44:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag44(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans44:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans44 = nil

-- TO STATE: endconversation
_uState195Trans45 = GdsCreateTransition (_uState94, _uState195, "State_94", "State_195_T45", "Dialog")
	_uState195Trans45:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState195Trans45:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans45:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag45(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans45:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans45 = nil

-- TO STATE: endconversation
_uState195Trans46 = GdsCreateTransition (_uState99, _uState195, "State_99", "State_195_T46", "Dialog")
	_uState195Trans46:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans46:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans46:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag46(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans46:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans46 = nil

-- TO STATE: endconversation
_uState195Trans47 = GdsCreateTransition (_uState99, _uState195, "State_99", "State_195_T47", "Dialog")
	_uState195Trans47:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans47:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans47:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag47(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans47:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans47 = nil

-- TO STATE: endconversation
_uState195Trans48 = GdsCreateTransition (_uState102, _uState195, "State_102", "State_195_T48", "Dialog")
	_uState195Trans48:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans48:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans48:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag48(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans48:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans48 = nil

-- TO STATE: endconversation
_uState195Trans49 = GdsCreateTransition (_uState102, _uState195, "State_102", "State_195_T49", "Dialog")
	_uState195Trans49:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans49:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans49:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag49(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans49:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans49 = nil

-- TO STATE: endconversation
_uState195Trans50 = GdsCreateTransition (_uState105, _uState195, "State_105", "State_195_T50", "Dialog")
	_uState195Trans50:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans50:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans50:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag50(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans50:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans50 = nil

-- TO STATE: endconversation
_uState195Trans51 = GdsCreateTransition (_uState105, _uState195, "State_105", "State_195_T51", "Dialog")
	_uState195Trans51:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans51:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans51:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag51(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans51:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans51 = nil

-- TO STATE: endconversation
_uState195Trans52 = GdsCreateTransition (_uState108, _uState195, "State_108", "State_195_T52", "Dialog")
	_uState195Trans52:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans52:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans52:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag52(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans52:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans52 = nil

-- TO STATE: endconversation
_uState195Trans53 = GdsCreateTransition (_uState108, _uState195, "State_108", "State_195_T53", "Dialog")
	_uState195Trans53:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans53:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans53:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag53(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans53:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans53 = nil

-- TO STATE: endconversation
_uState195Trans54 = GdsCreateTransition (_uState111, _uState195, "State_111", "State_195_T54", "Dialog")
	_uState195Trans54:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans54:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans54:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag54(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans54:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans54 = nil

-- TO STATE: endconversation
_uState195Trans55 = GdsCreateTransition (_uState111, _uState195, "State_111", "State_195_T55", "Dialog")
	_uState195Trans55:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans55:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans55:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag55(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans55:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans55 = nil

-- TO STATE: endconversation
_uState195Trans56 = GdsCreateTransition (_uState117, _uState195, "State_117", "State_195_T56", "Dialog")
	_uState195Trans56:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState195Trans56:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans56:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag56(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans56:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans56 = nil

-- TO STATE: endconversation
_uState195Trans57 = GdsCreateTransition (_uState120, _uState195, "State_120", "State_195_T57", "Dialog")
	_uState195Trans57:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState195Trans57:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans57:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag57(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans57:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans57 = nil

-- TO STATE: endconversation
_uState195Trans58 = GdsCreateTransition (_uState125, _uState195, "State_125", "State_195_T58", "Dialog")
	_uState195Trans58:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans58:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans58:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag58(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans58:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans58 = nil

-- TO STATE: endconversation
_uState195Trans59 = GdsCreateTransition (_uState125, _uState195, "State_125", "State_195_T59", "Dialog")
	_uState195Trans59:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans59:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans59:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag59(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans59:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans59 = nil

-- TO STATE: endconversation
_uState195Trans60 = GdsCreateTransition (_uState128, _uState195, "State_128", "State_195_T60", "Dialog")
	_uState195Trans60:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans60:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans60:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag60(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans60:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans60 = nil

-- TO STATE: endconversation
_uState195Trans61 = GdsCreateTransition (_uState128, _uState195, "State_128", "State_195_T61", "Dialog")
	_uState195Trans61:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans61:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans61:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag61(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans61:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans61 = nil

-- TO STATE: endconversation
_uState195Trans62 = GdsCreateTransition (_uState131, _uState195, "State_131", "State_195_T62", "Dialog")
	_uState195Trans62:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans62:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans62:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag62(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans62:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans62 = nil

-- TO STATE: endconversation
_uState195Trans63 = GdsCreateTransition (_uState131, _uState195, "State_131", "State_195_T63", "Dialog")
	_uState195Trans63:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans63:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans63:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag63(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans63:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans63 = nil

-- TO STATE: endconversation
_uState195Trans64 = GdsCreateTransition (_uState134, _uState195, "State_134", "State_195_T64", "Dialog")
	_uState195Trans64:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans64:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans64:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag64(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans64:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans64 = nil

-- TO STATE: endconversation
_uState195Trans65 = GdsCreateTransition (_uState134, _uState195, "State_134", "State_195_T65", "Dialog")
	_uState195Trans65:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans65:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans65:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag65(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans65:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans65 = nil

-- TO STATE: endconversation
_uState195Trans66 = GdsCreateTransition (_uState137, _uState195, "State_137", "State_195_T66", "Dialog")
	_uState195Trans66:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans66:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans66:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag66(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans66:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans66 = nil

-- TO STATE: endconversation
_uState195Trans67 = GdsCreateTransition (_uState137, _uState195, "State_137", "State_195_T67", "Dialog")
	_uState195Trans67:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans67:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans67:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag67(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans67:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans67 = nil

-- TO STATE: endconversation
_uState195Trans68 = GdsCreateTransition (_uState114, _uState195, "State_114", "State_195_T68", "Dialog")
	_uState195Trans68:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2) )
	_uState195Trans68:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans68:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag68(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans68:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans68 = nil

-- TO STATE: endconversation
_uState195Trans69 = GdsCreateTransition (_uState144, _uState195, "State_144", "State_195_T69", "Dialog")
	_uState195Trans69:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState195Trans69:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans69:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag69(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans69:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans69 = nil

-- TO STATE: endconversation
_uState195Trans70 = GdsCreateTransition (_uState147, _uState195, "State_147", "State_195_T70", "Dialog")
	_uState195Trans70:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState195Trans70:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans70:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag70(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans70:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans70 = nil

-- TO STATE: endconversation
_uState195Trans71 = GdsCreateTransition (_uState152, _uState195, "State_152", "State_195_T71", "Dialog")
	_uState195Trans71:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans71:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans71:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag71(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans71:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans71 = nil

-- TO STATE: endconversation
_uState195Trans72 = GdsCreateTransition (_uState152, _uState195, "State_152", "State_195_T72", "Dialog")
	_uState195Trans72:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans72:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans72:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag72(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans72:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans72 = nil

-- TO STATE: endconversation
_uState195Trans73 = GdsCreateTransition (_uState155, _uState195, "State_155", "State_195_T73", "Dialog")
	_uState195Trans73:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans73:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans73:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag73(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans73:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans73 = nil

-- TO STATE: endconversation
_uState195Trans74 = GdsCreateTransition (_uState155, _uState195, "State_155", "State_195_T74", "Dialog")
	_uState195Trans74:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans74:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans74:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag74(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans74:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans74 = nil

-- TO STATE: endconversation
_uState195Trans75 = GdsCreateTransition (_uState158, _uState195, "State_158", "State_195_T75", "Dialog")
	_uState195Trans75:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans75:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans75:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag75(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans75:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans75 = nil

-- TO STATE: endconversation
_uState195Trans76 = GdsCreateTransition (_uState158, _uState195, "State_158", "State_195_T76", "Dialog")
	_uState195Trans76:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans76:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans76:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag76(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans76:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans76 = nil

-- TO STATE: endconversation
_uState195Trans77 = GdsCreateTransition (_uState161, _uState195, "State_161", "State_195_T77", "Dialog")
	_uState195Trans77:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans77:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans77:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag77(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans77:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans77 = nil

-- TO STATE: endconversation
_uState195Trans78 = GdsCreateTransition (_uState161, _uState195, "State_161", "State_195_T78", "Dialog")
	_uState195Trans78:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans78:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans78:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag78(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans78:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans78 = nil

-- TO STATE: endconversation
_uState195Trans79 = GdsCreateTransition (_uState164, _uState195, "State_164", "State_195_T79", "Dialog")
	_uState195Trans79:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans79:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans79:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag79(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans79:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans79 = nil

-- TO STATE: endconversation
_uState195Trans80 = GdsCreateTransition (_uState164, _uState195, "State_164", "State_195_T80", "Dialog")
	_uState195Trans80:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans80:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans80:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag80(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans80:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans80 = nil

-- TO STATE: endconversation
_uState195Trans81 = GdsCreateTransition (_uState141, _uState195, "State_141", "State_195_T81", "Dialog")
	_uState195Trans81:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2) )
	_uState195Trans81:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans81:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag81(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans81:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans81 = nil

-- TO STATE: endconversation
_uState195Trans82 = GdsCreateTransition (_uState171, _uState195, "State_171", "State_195_T82", "Dialog")
	_uState195Trans82:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState195Trans82:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans82:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag82(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans82:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans82 = nil

-- TO STATE: endconversation
_uState195Trans83 = GdsCreateTransition (_uState174, _uState195, "State_174", "State_195_T83", "Dialog")
	_uState195Trans83:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopTalkToAnyone', 1), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopSpyDocuments', 99) )) ))
	_uState195Trans83:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans83:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag83(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans83:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans83 = nil

-- TO STATE: endconversation
_uState195Trans84 = GdsCreateTransition (_uState179, _uState195, "State_179", "State_195_T84", "Dialog")
	_uState195Trans84:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans84:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans84:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag84(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans84:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans84 = nil

-- TO STATE: endconversation
_uState195Trans85 = GdsCreateTransition (_uState179, _uState195, "State_179", "State_195_T85", "Dialog")
	_uState195Trans85:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans85:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans85:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag85(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans85:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans85 = nil

-- TO STATE: endconversation
_uState195Trans86 = GdsCreateTransition (_uState182, _uState195, "State_182", "State_195_T86", "Dialog")
	_uState195Trans86:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans86:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans86:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag86(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans86:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans86 = nil

-- TO STATE: endconversation
_uState195Trans87 = GdsCreateTransition (_uState182, _uState195, "State_182", "State_195_T87", "Dialog")
	_uState195Trans87:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans87:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans87:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag87(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans87:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans87 = nil

-- TO STATE: endconversation
_uState195Trans88 = GdsCreateTransition (_uState185, _uState195, "State_185", "State_195_T88", "Dialog")
	_uState195Trans88:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans88:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans88:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag88(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans88:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans88 = nil

-- TO STATE: endconversation
_uState195Trans89 = GdsCreateTransition (_uState185, _uState195, "State_185", "State_195_T89", "Dialog")
	_uState195Trans89:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans89:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans89:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag89(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans89:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans89 = nil

-- TO STATE: endconversation
_uState195Trans90 = GdsCreateTransition (_uState188, _uState195, "State_188", "State_195_T90", "Dialog")
	_uState195Trans90:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans90:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans90:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag90(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans90:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans90 = nil

-- TO STATE: endconversation
_uState195Trans91 = GdsCreateTransition (_uState188, _uState195, "State_188", "State_195_T91", "Dialog")
	_uState195Trans91:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans91:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans91:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag91(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans91:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans91 = nil

-- TO STATE: endconversation
_uState195Trans92 = GdsCreateTransition (_uState191, _uState195, "State_191", "State_195_T92", "Dialog")
	_uState195Trans92:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2))
	_uState195Trans92:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans92:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag92(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans92:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans92 = nil

-- TO STATE: endconversation
_uState195Trans93 = GdsCreateTransition (_uState191, _uState195, "State_191", "State_195_T93", "Dialog")
	_uState195Trans93:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopConjureNiethalfSolved', 2) ))
	_uState195Trans93:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans93:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag93(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans93:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans93 = nil

-- TO STATE: endconversation
_uState195Trans94 = GdsCreateTransition (_uState168, _uState195, "State_168", "State_195_T94", "Dialog")
	_uState195Trans94:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopBaseJandrimsCraft', 2) )
	_uState195Trans94:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Jandrim_Windhammer"))
	_uState195Trans94:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag94(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans94:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(JANDRIM_WINDHAMMER)', 1, 4))
	_uState195Trans94 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions6 = nil

-- TO SELF: EndConversation Actions #7
_uEndActions7 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_7", "Dialog")
	_uEndActions7:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag7(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions7:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions7 = nil

-- TO SELF: EndConversation Actions #8
_uEndActions8 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_8", "Dialog")
	_uEndActions8:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag8(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions8:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions8 = nil

-- TO SELF: EndConversation Actions #9
_uEndActions9 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_9", "Dialog")
	_uEndActions9:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag9(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions9:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions9 = nil

-- TO SELF: EndConversation Actions #10
_uEndActions10 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_10", "Dialog")
	_uEndActions10:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag10(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions10:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions10 = nil

-- TO SELF: EndConversation Actions #11
_uEndActions11 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_11", "Dialog")
	_uEndActions11:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag11(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions11:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions11 = nil

-- TO SELF: EndConversation Actions #12
_uEndActions12 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_12", "Dialog")
	_uEndActions12:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag12(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions12:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions12 = nil

-- TO SELF: EndConversation Actions #13
_uEndActions13 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_13", "Dialog")
	_uEndActions13:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag13(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions13:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag13(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions13 = nil

-- TO SELF: EndConversation Actions #14
_uEndActions14 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_14", "Dialog")
	_uEndActions14:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag14(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions14:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag14(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions14 = nil

-- TO SELF: EndConversation Actions #15
_uEndActions15 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_15", "Dialog")
	_uEndActions15:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag15(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions15:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag15(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions15 = nil

-- TO SELF: EndConversation Actions #16
_uEndActions16 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_16", "Dialog")
	_uEndActions16:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag16(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions16:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions16:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag16(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions16:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions16 = nil

-- TO SELF: EndConversation Actions #17
_uEndActions17 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_17", "Dialog")
	_uEndActions17:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag17(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions17:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions17:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag17(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions17:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions17 = nil

-- TO SELF: EndConversation Actions #18
_uEndActions18 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_18", "Dialog")
	_uEndActions18:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag18(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions18:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions18:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag18(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions18:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions18 = nil

-- TO SELF: EndConversation Actions #19
_uEndActions19 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_19", "Dialog")
	_uEndActions19:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag19(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions19:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions19:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag19(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions19:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions19 = nil

-- TO SELF: EndConversation Actions #20
_uEndActions20 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_20", "Dialog")
	_uEndActions20:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag20(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions20:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions20:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag20(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions20:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions20 = nil

-- TO SELF: EndConversation Actions #21
_uEndActions21 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_21", "Dialog")
	_uEndActions21:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag21(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions21:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag21(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions21 = nil

-- TO SELF: EndConversation Actions #22
_uEndActions22 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_22", "Dialog")
	_uEndActions22:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag22(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions22:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag22(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions22 = nil

-- TO SELF: EndConversation Actions #23
_uEndActions23 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_23", "Dialog")
	_uEndActions23:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag23(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions23:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions23:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag23(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions23:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions23 = nil

-- TO SELF: EndConversation Actions #24
_uEndActions24 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_24", "Dialog")
	_uEndActions24:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag24(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions24:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions24:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag24(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions24:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions24 = nil

-- TO SELF: EndConversation Actions #25
_uEndActions25 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_25", "Dialog")
	_uEndActions25:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag25(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions25:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions25:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag25(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions25:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions25 = nil

-- TO SELF: EndConversation Actions #26
_uEndActions26 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_26", "Dialog")
	_uEndActions26:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag26(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions26:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions26:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag26(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions26:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions26 = nil

-- TO SELF: EndConversation Actions #27
_uEndActions27 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_27", "Dialog")
	_uEndActions27:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag27(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions27:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions27:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag27(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions27:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions27 = nil

-- TO SELF: EndConversation Actions #28
_uEndActions28 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_28", "Dialog")
	_uEndActions28:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag28(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions28:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions28:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag28(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions28:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions28 = nil

-- TO SELF: EndConversation Actions #29
_uEndActions29 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_29", "Dialog")
	_uEndActions29:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag29(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions29:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions29:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag29(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions29:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions29 = nil

-- TO SELF: EndConversation Actions #30
_uEndActions30 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_30", "Dialog")
	_uEndActions30:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag30(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions30:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions30:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag30(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions30:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions30 = nil

-- TO SELF: EndConversation Actions #31
_uEndActions31 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_31", "Dialog")
	_uEndActions31:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag31(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions31:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions31:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag31(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions31:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions31 = nil

-- TO SELF: EndConversation Actions #32
_uEndActions32 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_32", "Dialog")
	_uEndActions32:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag32(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions32:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions32:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag32(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions32:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions32 = nil

-- TO SELF: EndConversation Actions #33
_uEndActions33 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_33", "Dialog")
	_uEndActions33:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag33(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions33:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions33:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag33(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions33:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions33 = nil

-- TO SELF: EndConversation Actions #34
_uEndActions34 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_34", "Dialog")
	_uEndActions34:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag34(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions34:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions34:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag34(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions34:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions34 = nil

-- TO SELF: EndConversation Actions #35
_uEndActions35 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_35", "Dialog")
	_uEndActions35:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag35(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions35:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions35:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag35(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions35:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions35 = nil

-- TO SELF: EndConversation Actions #36
_uEndActions36 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_36", "Dialog")
	_uEndActions36:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag36(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions36:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions36:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag36(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions36:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions36 = nil

-- TO SELF: EndConversation Actions #37
_uEndActions37 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_37", "Dialog")
	_uEndActions37:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag37(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions37:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions37:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag37(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions37:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions37 = nil

-- TO SELF: EndConversation Actions #38
_uEndActions38 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_38", "Dialog")
	_uEndActions38:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag38(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions38:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions38:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag38(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions38:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions38 = nil

-- TO SELF: EndConversation Actions #39
_uEndActions39 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_39", "Dialog")
	_uEndActions39:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag39(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions39:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions39:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag39(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions39:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions39 = nil

-- TO SELF: EndConversation Actions #40
_uEndActions40 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_40", "Dialog")
	_uEndActions40:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag40(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions40:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions40:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag40(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions40:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions40 = nil

-- TO SELF: EndConversation Actions #41
_uEndActions41 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_41", "Dialog")
	_uEndActions41:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag41(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions41:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions41:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag41(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions41:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions41 = nil

-- TO SELF: EndConversation Actions #42
_uEndActions42 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_42", "Dialog")
	_uEndActions42:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag42(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions42:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions42:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag42(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions42:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions42 = nil

-- TO SELF: EndConversation Actions #43
_uEndActions43 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_43", "Dialog")
	_uEndActions43:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag43(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions43:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions43:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag43(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions43:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions43 = nil

-- TO SELF: EndConversation Actions #44
_uEndActions44 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_44", "Dialog")
	_uEndActions44:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag44(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions44:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions44:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag44(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions44:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions44 = nil

-- TO SELF: EndConversation Actions #45
_uEndActions45 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_45", "Dialog")
	_uEndActions45:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag45(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions45:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions45:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag45(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions45:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions45 = nil

-- TO SELF: EndConversation Actions #46
_uEndActions46 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_46", "Dialog")
	_uEndActions46:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag46(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions46:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions46:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag46(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions46:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions46 = nil

-- TO SELF: EndConversation Actions #47
_uEndActions47 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_47", "Dialog")
	_uEndActions47:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag47(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions47:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions47:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag47(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions47:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions47 = nil

-- TO SELF: EndConversation Actions #48
_uEndActions48 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_48", "Dialog")
	_uEndActions48:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag48(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions48:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions48:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag48(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions48:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions48 = nil

-- TO SELF: EndConversation Actions #49
_uEndActions49 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_49", "Dialog")
	_uEndActions49:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag49(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions49:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions49:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag49(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions49:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions49 = nil

-- TO SELF: EndConversation Actions #50
_uEndActions50 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_50", "Dialog")
	_uEndActions50:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag50(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions50:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions50:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag50(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions50:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions50 = nil

-- TO SELF: EndConversation Actions #51
_uEndActions51 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_51", "Dialog")
	_uEndActions51:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag51(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions51:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions51:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag51(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions51:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions51 = nil

-- TO SELF: EndConversation Actions #52
_uEndActions52 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_52", "Dialog")
	_uEndActions52:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag52(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions52:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions52:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag52(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions52:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions52 = nil

-- TO SELF: EndConversation Actions #53
_uEndActions53 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_53", "Dialog")
	_uEndActions53:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag53(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions53:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions53:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag53(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions53:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions53 = nil

-- TO SELF: EndConversation Actions #54
_uEndActions54 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_54", "Dialog")
	_uEndActions54:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag54(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions54:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions54:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag54(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions54:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions54 = nil

-- TO SELF: EndConversation Actions #55
_uEndActions55 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_55", "Dialog")
	_uEndActions55:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag55(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions55:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions55:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag55(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions55:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions55 = nil

-- TO SELF: EndConversation Actions #56
_uEndActions56 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_56", "Dialog")
	_uEndActions56:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag56(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions56:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions56:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag56(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions56:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions56 = nil

-- TO SELF: EndConversation Actions #57
_uEndActions57 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_57", "Dialog")
	_uEndActions57:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag57(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions57:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions57:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag57(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions57:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions57 = nil

-- TO SELF: EndConversation Actions #58
_uEndActions58 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_58", "Dialog")
	_uEndActions58:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag58(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions58:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions58:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag58(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions58:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions58 = nil

-- TO SELF: EndConversation Actions #59
_uEndActions59 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_59", "Dialog")
	_uEndActions59:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag59(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions59:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions59:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag59(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions59:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions59 = nil

-- TO SELF: EndConversation Actions #60
_uEndActions60 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_60", "Dialog")
	_uEndActions60:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag60(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions60:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions60:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag60(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions60:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions60 = nil

-- TO SELF: EndConversation Actions #61
_uEndActions61 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_61", "Dialog")
	_uEndActions61:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag61(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions61:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions61:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag61(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions61:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions61 = nil

-- TO SELF: EndConversation Actions #62
_uEndActions62 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_62", "Dialog")
	_uEndActions62:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag62(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions62:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions62:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag62(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions62:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions62 = nil

-- TO SELF: EndConversation Actions #63
_uEndActions63 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_63", "Dialog")
	_uEndActions63:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag63(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions63:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions63:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag63(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions63:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions63 = nil

-- TO SELF: EndConversation Actions #64
_uEndActions64 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_64", "Dialog")
	_uEndActions64:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag64(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions64:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions64:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag64(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions64:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions64 = nil

-- TO SELF: EndConversation Actions #65
_uEndActions65 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_65", "Dialog")
	_uEndActions65:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag65(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions65:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions65:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag65(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions65:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions65 = nil

-- TO SELF: EndConversation Actions #66
_uEndActions66 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_66", "Dialog")
	_uEndActions66:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag66(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions66:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions66:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag66(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions66:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions66 = nil

-- TO SELF: EndConversation Actions #67
_uEndActions67 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_67", "Dialog")
	_uEndActions67:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag67(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions67:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions67:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag67(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions67:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions67 = nil

-- TO SELF: EndConversation Actions #68
_uEndActions68 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_68", "Dialog")
	_uEndActions68:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag68(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions68:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions68:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag68(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions68:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions68 = nil

-- TO SELF: EndConversation Actions #69
_uEndActions69 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_69", "Dialog")
	_uEndActions69:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag69(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions69:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions69:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag69(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions69:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions69 = nil

-- TO SELF: EndConversation Actions #70
_uEndActions70 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_70", "Dialog")
	_uEndActions70:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag70(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions70:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions70:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag70(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions70:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions70 = nil

-- TO SELF: EndConversation Actions #71
_uEndActions71 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_71", "Dialog")
	_uEndActions71:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag71(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions71:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions71:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag71(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions71:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions71 = nil

-- TO SELF: EndConversation Actions #72
_uEndActions72 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_72", "Dialog")
	_uEndActions72:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag72(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions72:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions72:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag72(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions72:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions72 = nil

-- TO SELF: EndConversation Actions #73
_uEndActions73 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_73", "Dialog")
	_uEndActions73:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag73(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions73:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions73:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag73(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions73:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions73 = nil

-- TO SELF: EndConversation Actions #74
_uEndActions74 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_74", "Dialog")
	_uEndActions74:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag74(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions74:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions74:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag74(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions74:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions74 = nil

-- TO SELF: EndConversation Actions #75
_uEndActions75 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_75", "Dialog")
	_uEndActions75:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag75(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions75:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions75:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag75(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions75:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions75 = nil

-- TO SELF: EndConversation Actions #76
_uEndActions76 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_76", "Dialog")
	_uEndActions76:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag76(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions76:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions76:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag76(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions76:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions76 = nil

-- TO SELF: EndConversation Actions #77
_uEndActions77 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_77", "Dialog")
	_uEndActions77:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag77(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions77:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions77:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag77(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions77:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions77 = nil

-- TO SELF: EndConversation Actions #78
_uEndActions78 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_78", "Dialog")
	_uEndActions78:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag78(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions78:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions78:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag78(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions78:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions78 = nil

-- TO SELF: EndConversation Actions #79
_uEndActions79 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_79", "Dialog")
	_uEndActions79:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag79(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions79:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions79:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag79(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions79:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions79 = nil

-- TO SELF: EndConversation Actions #80
_uEndActions80 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_80", "Dialog")
	_uEndActions80:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag80(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions80:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions80:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag80(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions80:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions80 = nil

-- TO SELF: EndConversation Actions #81
_uEndActions81 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_81", "Dialog")
	_uEndActions81:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag81(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions81:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions81:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag81(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions81:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions81 = nil

-- TO SELF: EndConversation Actions #82
_uEndActions82 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_82", "Dialog")
	_uEndActions82:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag82(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions82:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions82:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag82(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions82:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions82 = nil

-- TO SELF: EndConversation Actions #83
_uEndActions83 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_83", "Dialog")
	_uEndActions83:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag83(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions83:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions83:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag83(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions83:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions83 = nil

-- TO SELF: EndConversation Actions #84
_uEndActions84 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_84", "Dialog")
	_uEndActions84:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag84(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions84:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions84:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag84(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions84:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions84 = nil

-- TO SELF: EndConversation Actions #85
_uEndActions85 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_85", "Dialog")
	_uEndActions85:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag85(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions85:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions85:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag85(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions85:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions85 = nil

-- TO SELF: EndConversation Actions #86
_uEndActions86 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_86", "Dialog")
	_uEndActions86:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag86(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions86:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions86:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag86(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions86:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions86 = nil

-- TO SELF: EndConversation Actions #87
_uEndActions87 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_87", "Dialog")
	_uEndActions87:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag87(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions87:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions87:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag87(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions87:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions87 = nil

-- TO SELF: EndConversation Actions #88
_uEndActions88 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_88", "Dialog")
	_uEndActions88:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag88(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions88:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions88:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag88(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions88:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions88 = nil

-- TO SELF: EndConversation Actions #89
_uEndActions89 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_89", "Dialog")
	_uEndActions89:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag89(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions89:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions89:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag89(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions89:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions89 = nil

-- TO SELF: EndConversation Actions #90
_uEndActions90 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_90", "Dialog")
	_uEndActions90:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag90(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions90:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions90:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag90(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions90:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions90 = nil

-- TO SELF: EndConversation Actions #91
_uEndActions91 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_91", "Dialog")
	_uEndActions91:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag91(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions91:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions91:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag91(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions91:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions91 = nil

-- TO SELF: EndConversation Actions #92
_uEndActions92 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_92", "Dialog")
	_uEndActions92:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag92(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions92:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions92:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag92(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions92:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions92 = nil

-- TO SELF: EndConversation Actions #93
_uEndActions93 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_93", "Dialog")
	_uEndActions93:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag93(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions93:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions93:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag93(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions93:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions93 = nil

-- TO SELF: EndConversation Actions #94
_uEndActions94 = GdsCreateTransition (_uState195, _uState195, "State_195", "EndActions_94", "Dialog")
	_uEndActions94:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag94(JANDRIM_WINDHAMMER)', 1, 2))
	_uEndActions94:AddCondition (CScriptConditionDialogStopped("pl_Human", "Jandrim_Windhammer"))
	_uEndActions94:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag94(JANDRIM_WINDHAMMER)', 0, 4))
	_uEndActions94:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 4))
	_uEndActions94 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState195, _uBeginState, "State_195", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Jandrim_Windhammer', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState4 = nil
_uState6 = nil
_uState9 = nil
_uState12 = nil
_uState16 = nil
_uState17 = nil
_uState20 = nil
_uState23 = nil
_uState26 = nil
_uState29 = nil
_uState34 = nil
_uState37 = nil
_uState40 = nil
_uState44 = nil
_uState45 = nil
_uState48 = nil
_uState51 = nil
_uState54 = nil
_uState57 = nil
_uState60 = nil
_uState62 = nil
_uState63 = nil
_uState66 = nil
_uState70 = nil
_uState71 = nil
_uState74 = nil
_uState77 = nil
_uState80 = nil
_uState83 = nil
_uState88 = nil
_uState91 = nil
_uState94 = nil
_uState98 = nil
_uState99 = nil
_uState102 = nil
_uState105 = nil
_uState108 = nil
_uState111 = nil
_uState114 = nil
_uState116 = nil
_uState117 = nil
_uState120 = nil
_uState124 = nil
_uState125 = nil
_uState128 = nil
_uState131 = nil
_uState134 = nil
_uState137 = nil
_uState141 = nil
_uState143 = nil
_uState144 = nil
_uState147 = nil
_uState151 = nil
_uState152 = nil
_uState155 = nil
_uState158 = nil
_uState161 = nil
_uState164 = nil
_uState168 = nil
_uState170 = nil
_uState171 = nil
_uState174 = nil
_uState178 = nil
_uState179 = nil
_uState182 = nil
_uState185 = nil
_uState188 = nil
_uState191 = nil
_uState195 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("Jandrim_Windhammer_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(JANDRIM_WINDHAMMER)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[137]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[137]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 137))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[190]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[190]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 190))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[130]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[130]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 130))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[131]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[131]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 131))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[132]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[132]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 132))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[133]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[133]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 133))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[134]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[134]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 134))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[135]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[135]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 135))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[136]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[136]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 136))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[138]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[138]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 138))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[139]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[139]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 139))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[140]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[140]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 140))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[150]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[150]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 150))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[160]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[160]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 160))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[170]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[170]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 170))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[180]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[180]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 180))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[141]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[141]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 141))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[142]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[142]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 142))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[143]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[143]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 143))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[144]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[144]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 144))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[145]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[145]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 145))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[146]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[146]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 146))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[147]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[147]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 147))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[148]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[148]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 148))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[149]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[149]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 149))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[151]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[151]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 151))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[152]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[152]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 152))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[153]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[153]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 153))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[154]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[154]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 154))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[155]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[155]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 155))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[156]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[156]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 156))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[157]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[157]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 157))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[158]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[158]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 158))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[159]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[159]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 159))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[161]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[161]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 161))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[162]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[162]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 162))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[163]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[163]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 163))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[164]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[164]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 164))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[165]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[165]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 165))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[166]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[166]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 166))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[167]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[167]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 167))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[168]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[168]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 168))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[169]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[169]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 169))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[171]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[171]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 171))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[172]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[172]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 172))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[173]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[173]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 173))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[174]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[174]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 174))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[175]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[175]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 175))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[176]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[176]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 176))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[177]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[177]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 177))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[178]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[178]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 178))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[179]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[179]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 179))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[181]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[181]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 181))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[182]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[182]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 182))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[183]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[183]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 183))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[184]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[184]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 184))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[185]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[185]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 185))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[186]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[186]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 186))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[187]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[187]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 187))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[188]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[188]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 188))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[189]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[189]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 189))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[191]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[191]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 191))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[192]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[192]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 192))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[193]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[193]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 193))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[202]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[202]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 202))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[208]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[208]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 208))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[217]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[217]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 217))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[194]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[194]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 194))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[195]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[195]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 195))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[196]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[196]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 196))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[197]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[197]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 197))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[198]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[198]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 198))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[199]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[199]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 199))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[200]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[200]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 200))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[201]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[201]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 201))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[203]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[203]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 203))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[204]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[204]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 204))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[205]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[205]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 205))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[206]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[206]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 206))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[207]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[207]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 207))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[209]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[209]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 209))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[210]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[210]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 210))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[211]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[211]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 211))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[212]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[212]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 212))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[213]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[213]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 213))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[214]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[214]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 214))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[215]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[215]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 215))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[216]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[216]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 216))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[218]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[218]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 218))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[219]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[219]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 219))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[220]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[220]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 220))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[230]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[230]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 230))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[240]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[240]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 240))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[250]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[250]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 250))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[260]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[260]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 260))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[221]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[221]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 221))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[222]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[222]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 222))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[223]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[223]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 223))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[224]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[224]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 224))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[225]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[225]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 225))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[226]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[226]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 226))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[227]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[227]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 227))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[228]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[228]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 228))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[229]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[229]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 229))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[231]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[231]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 231))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[232]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[232]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 232))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[233]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[233]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 233))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[234]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[234]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 234))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[235]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[235]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 235))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[236]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[236]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 236))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[237]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[237]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 237))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[238]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[238]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 238))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[239]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[239]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 239))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[241]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[241]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 241))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[242]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[242]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 242))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[243]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[243]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 243))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[244]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[244]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 244))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[245]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[245]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 245))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[246]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[246]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 246))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[247]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[247]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 247))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[248]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[248]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 248))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[249]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[249]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 249))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[251]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[251]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 251))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[252]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[252]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 252))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[253]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[253]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 253))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[254]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[254]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 254))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[255]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[255]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 255))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[256]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[256]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 256))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[257]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[257]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 257))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[258]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[258]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 258))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[259]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[259]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 259))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[261]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[261]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 261))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[262]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[262]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 262))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[263]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[263]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 263))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[264]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[264]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 264))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[265]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[265]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 265))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[266]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[266]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 266))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[267]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[267]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 267))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[268]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[268]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 268))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[269]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[269]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 269))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[270]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[270]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 270))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[271]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[271]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 271))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[272]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[272]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 272))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[273]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[273]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 273))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[274]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[274]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 274))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[275]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[275]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 275))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[276]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[276]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 276))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[277]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[277]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 277))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[278]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[278]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 278))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[279]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[279]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 279))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[280]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[280]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 280))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[281]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[281]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 281))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[287]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[287]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 287))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[296]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[296]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 296))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[282]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[282]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 282))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[283]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[283]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 283))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[284]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[284]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 284))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[285]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[285]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 285))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[286]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[286]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 286))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[288]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[288]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 288))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[289]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[289]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 289))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[290]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[290]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 290))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[291]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[291]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 291))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[292]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[292]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 292))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[293]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[293]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 293))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[294]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[294]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 294))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[295]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[295]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 295))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[297]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[297]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 297))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[298]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[298]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 298))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[299]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[299]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 299))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[309]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[309]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 309))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[319]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[319]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 319))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[329]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[329]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 329))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[339]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[339]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 339))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[300]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[300]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 300))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[301]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[301]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 301))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[302]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[302]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 302))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[303]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[303]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 303))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[304]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[304]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 304))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[305]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[305]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 305))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[306]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[306]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 306))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[307]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[307]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 307))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[308]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[308]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 308))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[310]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[310]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 310))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[311]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[311]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 311))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[312]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[312]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 312))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[313]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[313]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 313))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[314]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[314]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 314))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[315]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[315]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 315))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[316]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[316]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 316))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[317]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[317]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 317))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[318]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[318]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 318))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[320]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[320]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 320))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[321]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[321]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 321))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[322]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[322]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 322))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[323]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[323]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 323))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[324]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[324]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 324))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[325]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[325]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 325))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[326]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[326]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 326))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[327]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[327]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 327))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[328]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[328]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 328))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[330]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[330]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 330))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[331]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[331]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 331))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[332]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[332]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 332))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[333]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[333]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 333))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[334]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[334]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 334))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[335]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[335]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 335))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[336]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[336]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 336))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[337]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[337]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 337))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[338]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[338]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 338))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[340]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[340]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 340))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[341]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[341]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 341))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[342]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[342]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 342))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[343]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[343]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 343))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[344]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[344]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 344))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[345]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[345]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 345))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[346]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[346]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 346))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[347]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[347]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 347))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[348]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[348]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 348))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[349]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[349]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 349))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[350]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[350]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 350))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[351]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[351]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 351))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[359]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[359]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 359))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[365]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[365]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 365))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[374]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[374]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 374))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[352]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[352]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 352))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[353]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[353]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 353))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[354]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[354]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 354))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[355]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[355]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 355))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[356]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[356]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 356))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[357]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[357]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 357))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[358]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[358]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 358))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[360]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[360]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 360))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[361]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[361]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 361))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[362]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[362]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 362))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[363]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[363]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 363))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[364]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[364]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 364))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[366]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[366]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 366))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[367]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[367]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 367))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[368]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[368]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 368))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[369]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[369]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 369))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[370]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[370]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 370))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[371]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[371]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 371))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[372]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[372]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 372))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[373]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[373]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 373))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[375]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[375]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 375))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[376]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[376]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 376))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[377]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[377]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 377))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[387]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[387]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 387))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[397]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[397]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 397))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[407]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[407]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 407))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[417]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[417]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 417))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[378]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[378]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 378))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[379]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[379]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 379))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[380]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[380]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 380))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[381]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[381]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 381))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[382]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[382]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 382))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[383]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[383]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 383))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[384]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[384]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 384))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[385]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[385]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 385))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[386]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[386]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 386))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[388]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[388]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 388))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[389]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[389]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 389))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[390]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[390]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 390))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[391]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[391]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 391))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[392]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[392]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 392))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[393]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[393]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 393))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[394]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[394]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 394))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[395]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[395]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 395))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[396]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[396]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 396))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[398]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[398]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 398))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[399]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[399]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 399))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[400]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[400]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 400))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[401]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[401]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 401))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[402]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[402]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 402))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[403]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[403]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 403))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[404]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[404]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 404))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[405]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[405]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 405))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[406]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[406]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 406))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[408]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[408]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 408))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[409]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[409]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 409))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[410]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[410]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 410))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[411]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[411]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 411))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[412]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[412]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 412))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[413]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[413]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 413))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[414]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[414]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 414))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[415]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[415]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 415))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[416]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[416]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 416))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[418]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[418]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 418))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[419]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[419]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 419))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[420]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[420]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 420))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[421]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[421]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 421))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[422]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[422]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 422))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[423]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[423]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 423))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[424]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[424]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 424))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[425]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[425]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 425))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[426]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[426]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 426))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[427]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[427]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 427))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[428]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[428]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 428))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[429]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[429]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 429))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[435]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[435]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 435))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[444]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[444]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 444))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[430]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[430]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 430))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[431]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[431]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 431))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[432]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[432]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 432))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[433]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[433]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 433))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[434]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[434]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 434))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[436]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[436]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 436))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[437]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[437]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 437))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[438]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[438]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 438))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[439]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[439]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 439))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[440]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[440]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 440))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[441]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[441]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 441))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[442]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[442]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 442))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[443]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[443]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 443))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[445]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[445]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 445))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[446]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[446]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 446))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[447]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[447]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 447))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[457]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[457]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 457))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[467]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[467]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 467))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[477]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[477]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 477))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[487]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[487]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 487))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[448]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[448]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 448))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[449]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[449]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 449))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[450]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[450]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 450))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[451]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[451]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 451))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[452]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[452]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 452))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[453]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[453]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 453))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[454]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[454]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 454))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[455]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[455]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 455))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[456]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[456]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 456))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[458]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[458]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 458))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[459]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[459]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 459))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[460]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[460]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 460))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[461]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[461]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 461))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[462]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[462]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 462))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[463]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[463]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 463))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[464]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[464]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 464))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[465]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[465]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 465))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[466]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[466]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 466))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[468]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[468]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 468))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[469]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[469]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 469))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[470]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[470]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 470))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[471]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[471]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 471))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[472]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[472]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 472))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[473]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[473]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 473))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[474]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[474]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 474))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[475]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[475]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 475))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[476]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[476]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 476))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[478]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[478]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 478))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[479]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[479]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 479))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[480]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[480]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 480))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[481]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[481]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 481))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[482]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[482]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 482))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[483]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[483]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 483))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[484]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[484]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 484))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[485]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[485]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 485))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[486]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[486]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 486))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[488]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[488]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 488))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[489]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[489]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 489))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[490]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[490]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 490))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[491]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[491]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 491))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[492]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[492]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 492))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[493]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[493]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 493))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[494]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[494]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 494))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[495]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[495]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 495))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[496]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[496]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 496))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[497]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[497]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 497))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[498]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[498]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 498))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[499]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[499]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 499))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[500]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[500]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 500))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[501]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[501]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 501))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[502]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[502]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 502))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[503]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[503]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 503))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[504]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[504]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 504))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[510]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[510]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 510))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[519]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[519]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 519))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[505]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[505]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 505))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[506]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[506]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 506))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[507]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[507]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 507))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[508]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[508]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 508))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[509]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[509]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 509))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[511]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[511]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 511))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[512]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[512]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 512))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[513]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[513]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 513))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[514]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[514]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 514))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[515]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[515]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 515))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[516]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[516]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 516))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[517]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[517]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 517))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[518]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[518]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 518))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[520]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[520]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 520))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[521]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[521]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 521))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[522]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[522]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 522))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[532]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[532]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 532))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[542]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[542]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 542))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[552]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[552]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 552))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[562]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[562]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 562))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[523]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[523]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 523))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[524]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[524]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 524))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[525]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[525]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 525))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[526]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[526]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 526))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[527]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[527]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 527))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[528]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[528]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 528))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[529]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[529]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 529))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[530]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[530]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 530))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[531]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[531]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 531))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[533]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[533]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 533))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[534]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[534]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 534))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[535]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[535]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 535))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[536]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[536]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 536))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[537]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[537]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 537))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[538]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[538]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 538))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[539]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[539]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 539))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[540]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[540]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 540))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[541]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[541]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 541))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[543]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[543]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 543))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[544]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[544]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 544))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[545]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[545]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 545))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[546]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[546]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 546))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[547]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[547]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 547))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[548]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[548]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 548))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[549]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[549]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 549))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[550]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[550]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 550))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[551]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[551]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 551))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[553]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[553]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 553))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[554]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[554]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 554))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[555]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[555]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 555))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[556]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[556]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 556))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[557]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[557]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 557))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[558]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[558]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 558))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[559]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[559]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 559))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[560]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[560]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 560))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[561]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[561]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 561))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[563]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[563]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 563))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[564]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[564]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 564))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[565]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[565]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 565))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[566]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[566]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 566))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[567]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[567]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 567))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[568]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[568]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 568))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[569]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[569]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 569))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[570]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[570]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 570))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[571]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[571]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 571))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[572]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[572]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 572))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[578]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[578]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 578))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[587]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[587]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 587))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[573]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[573]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 573))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[574]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[574]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 574))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[575]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[575]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 575))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[576]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[576]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 576))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[577]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[577]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 577))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[579]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[579]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 579))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[580]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[580]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 580))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[581]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[581]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 581))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[582]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[582]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 582))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[583]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[583]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 583))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[584]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[584]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 584))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[585]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[585]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 585))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[586]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[586]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 586))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[588]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[588]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 588))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[589]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[589]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 589))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[590]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[590]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 590))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[600]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[600]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 600))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[610]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[610]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 610))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[620]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[620]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 620))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[630]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[630]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 630))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[591]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[591]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 591))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[592]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[592]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 592))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[593]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[593]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 593))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[594]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[594]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 594))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[595]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[595]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 595))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[596]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[596]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 596))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[597]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[597]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 597))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[598]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[598]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 598))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[599]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[599]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 599))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[601]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[601]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 601))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[602]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[602]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 602))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[603]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[603]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 603))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[604]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[604]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 604))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[605]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[605]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 605))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[606]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[606]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 606))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[607]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[607]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 607))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[608]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[608]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 608))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[609]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[609]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 609))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[611]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[611]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 611))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[612]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[612]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 612))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[613]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[613]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 613))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[614]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[614]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 614))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[615]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[615]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 615))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[616]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[616]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 616))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[617]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[617]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 617))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[618]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[618]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 618))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[619]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[619]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 619))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[621]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[621]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 621))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[622]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[622]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 622))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[623]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[623]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 623))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[624]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[624]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 624))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[625]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[625]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 625))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[626]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[626]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 626))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[627]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[627]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 627))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[628]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[628]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 628))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[629]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[629]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 629))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[631]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[631]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 631))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[632]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[632]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 632))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[633]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[633]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 633))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[634]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[634]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 634))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[635]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[635]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 635))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[636]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[636]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 636))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[637]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[637]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 637))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[638]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[638]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 638))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[639]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[639]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 639))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Jandrim_Windhammer'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Jandrim_Windhammer", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Jandrim_Windhammer', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
