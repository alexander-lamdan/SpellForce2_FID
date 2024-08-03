local _uSM = GdsCreateStateMachine ("Halicos_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState2 = GdsCreateState (_uSM, "State_2")
_uState5 = GdsCreateState (_uSM, "State_5")
_uState11 = GdsCreateState (_uSM, "State_11")
_uState15 = GdsCreateState (_uSM, "State_15")
_uState19 = GdsCreateState (_uSM, "State_19")
_uState25 = GdsCreateState (_uSM, "State_25")
_uState30 = GdsCreateState (_uSM, "State_30")
_uState33 = GdsCreateState (_uSM, "State_33")
_uState37 = GdsCreateState (_uSM, "State_37")
_uState41 = GdsCreateState (_uSM, "State_41")
_uState45 = GdsCreateState (_uSM, "State_45")
_uState47 = GdsCreateState (_uSM, "State_47")
_uState51 = GdsCreateState (_uSM, "State_51")
_uState54 = GdsCreateState (_uSM, "State_54")
_uState56 = GdsCreateState (_uSM, "State_56")
_uState58 = GdsCreateState (_uSM, "State_58")
_uState62 = GdsCreateState (_uSM, "State_62")
_uState64 = GdsCreateState (_uSM, "State_64")
_uState68 = GdsCreateState (_uSM, "State_68")
_uState70 = GdsCreateState (_uSM, "State_70")
_uState74 = GdsCreateState (_uSM, "State_74")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('Halicos'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(HALICOS)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(HALICOS)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('Halicos', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: label
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "Halicos"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HALICOS)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(HALICOS)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('Halicos', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("Halicos")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(HALICOS)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(HALICOS)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState2, "StateBeginDelay", "State_2_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(HALICOS)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: label
_uState2Trans2 = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2_T2", "Dialog")
	_uState2Trans2:AddCondition (CScriptConditionValue('pl_Human', 'af_P333_AvatarGreetedByHalios', 0, 2))
	_uState2Trans2:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_001", "Neuankömmlinge, was?", 100, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_002", "Na dann, willkommen auf der Westwehr, dem neuen Heim der Shaikan und der Hand des Drachen!", 101, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_003", "Die Sache ist ganz einfach: Als Shaikan könnt Ihr hier jederzeit Unterschlupf finden.", 102, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_004", "Aber wir würden es begrüßen, wenn Ihr der Hand des Drachen beitretet, unserem Söldnerheer. Mit dem verdienen wir das Gold für unser Leben hier.", 103, 16777215))
	_uState2Trans2:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_AvatarGreetedByHalios', 1, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState2Trans2 = nil

-- TO STATE: label
_uState2Trans3 = GdsCreateTransition (_uState37, _uState2, "State_37", "State_2_T3", "Dialog")
	_uState2Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 3))
	_uState2Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_111PC", "Was ist mit den andern Aufgaben der Hand?", 99, 16777215))
	_uState2Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_112PC", "Ist die Hand nun aufgelöst, da wir nur noch den roten Gott bekämpfen?", 211, 16777215))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(HALICOS)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(HALICOS)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_113", "Ich hoffe nicht! Aber es bleibt wenig Zeit für andere Aufträge.", 212, 16777215))
	_uState2Trans3:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_114", "Wenn Ihr tatsächlich noch Zeit und Kraft findet, an Arbeit soll es nicht mangeln!", 213, 16777215))
	_uState2Trans3:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_115", "Wir wurden gebeten, die Grenze am Nadelberg mit zu sichern. Die Hohenmark ist durch den Fluch in Siebenburg betäubt!", 214, 16777215))
	_uState2Trans3:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_116", "Ihr müsst an alle markierten Positionen am Nadelberg Verteidigungstürme bauen!! Keiner von ihnen darf zerstört werden, bis Ihr alle gebaut habt!", 215, 16777215))
	_uState2Trans3:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_117", "Sobald alle stehen, ist der Auftrag erfüllt! Kommt dann hierher zurück!", 216, 16777215))
	_uState2Trans3:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseWatchtowers', 1, 0))
	_uState2Trans3:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopNeedleWatchTowers', 1, 0))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState2Trans3 = nil

-- TO STATE: label
_uState2Trans4 = GdsCreateTransition (_uState47, _uState2, "State_47", "State_2_T4", "Dialog")
	_uState2Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseWatchtowers', 2) ))
	_uState2Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_HalicosDialogDisabled', 0, 4))
	_uState2Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_HalicosDialogTypeMainQuest', 0, 4))
	_uState2Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_HalicosDialogTypeSideQuest', 1, 4))
	_uState2Trans4:AddAction (CScriptActionSetDialog('Halicos', 1))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState2Trans4 = nil

-- TO STATE: label
_uState2Trans5 = GdsCreateTransition (_uState45, _uState2, "State_45", "State_2_T5", "Dialog")
	_uState2Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 3))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_111PC", "Was ist mit den andern Aufgaben der Hand?", 99, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_112PC", "Ist die Hand nun aufgelöst, da wir nur noch den roten Gott bekämpfen?", 231, 16777215))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(HALICOS)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(HALICOS)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_113", "Ich hoffe nicht! Aber es bleibt wenig Zeit für andere Aufträge.", 232, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_114", "Wenn Ihr tatsächlich noch Zeit und Kraft findet, an Arbeit soll es nicht mangeln!", 233, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_115", "Wir wurden gebeten, die Grenze am Nadelberg mit zu sichern. Die Hohenmark ist durch den Fluch in Siebenburg betäubt!", 234, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_116", "Ihr müsst an alle markierten Positionen am Nadelberg Verteidigungstürme bauen!! Keiner von ihnen darf zerstört werden, bis Ihr alle gebaut habt!", 235, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_117", "Sobald alle stehen, ist der Auftrag erfüllt! Kommt dann hierher zurück!", 236, 16777215))
	_uState2Trans5:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseWatchtowers', 1, 0))
	_uState2Trans5:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopNeedleWatchTowers', 1, 0))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState2Trans5 = nil

-- TO STATE: label
_uState2Trans6 = GdsCreateTransition (_uState56, _uState2, "State_56", "State_2_T6", "Dialog")
	_uState2Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 1))
	_uState2Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_111PC", "Was ist mit den andern Aufgaben der Hand?", 99, 16777215))
	_uState2Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_112PC", "Ist die Hand nun aufgelöst, da wir nur noch den roten Gott bekämpfen?", 241, 16777215))
	_uState2Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState2Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState2Trans6:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_113", "Ich hoffe nicht! Aber es bleibt wenig Zeit für andere Aufträge.", 242, 16777215))
	_uState2Trans6:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_114", "Wenn Ihr tatsächlich noch Zeit und Kraft findet, an Arbeit soll es nicht mangeln!", 243, 16777215))
	_uState2Trans6:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_115", "Wir wurden gebeten, die Grenze am Nadelberg mit zu sichern. Die Hohenmark ist durch den Fluch in Siebenburg betäubt!", 244, 16777215))
	_uState2Trans6:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_116", "Ihr müsst an alle markierten Positionen am Nadelberg Verteidigungstürme bauen!! Keiner von ihnen darf zerstört werden, bis Ihr alle gebaut habt!", 245, 16777215))
	_uState2Trans6:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_117", "Sobald alle stehen, ist der Auftrag erfüllt! Kommt dann hierher zurück!", 246, 16777215))
	_uState2Trans6:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseWatchtowers', 1, 0))
	_uState2Trans6:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopNeedleWatchTowers', 1, 0))
	_uState2Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState2Trans6 = nil

-- TO STATE: label
_uState2Trans7 = GdsCreateTransition (_uState62, _uState2, "State_62", "State_2_T7", "Dialog")
	_uState2Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 1))
	_uState2Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_111PC", "Was ist mit den andern Aufgaben der Hand?", 99, 16777215))
	_uState2Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_112PC", "Ist die Hand nun aufgelöst, da wir nur noch den roten Gott bekämpfen?", 251, 16777215))
	_uState2Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState2Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState2Trans7:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_113", "Ich hoffe nicht! Aber es bleibt wenig Zeit für andere Aufträge.", 252, 16777215))
	_uState2Trans7:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_114", "Wenn Ihr tatsächlich noch Zeit und Kraft findet, an Arbeit soll es nicht mangeln!", 253, 16777215))
	_uState2Trans7:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_115", "Wir wurden gebeten, die Grenze am Nadelberg mit zu sichern. Die Hohenmark ist durch den Fluch in Siebenburg betäubt!", 254, 16777215))
	_uState2Trans7:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_116", "Ihr müsst an alle markierten Positionen am Nadelberg Verteidigungstürme bauen!! Keiner von ihnen darf zerstört werden, bis Ihr alle gebaut habt!", 255, 16777215))
	_uState2Trans7:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_117", "Sobald alle stehen, ist der Auftrag erfüllt! Kommt dann hierher zurück!", 256, 16777215))
	_uState2Trans7:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseWatchtowers', 1, 0))
	_uState2Trans7:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopNeedleWatchTowers', 1, 0))
	_uState2Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState2Trans7 = nil

-- TO STATE: label
_uState2Trans8 = GdsCreateTransition (_uState68, _uState2, "State_68", "State_2_T8", "Dialog")
	_uState2Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 1))
	_uState2Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_111PC", "Was ist mit den andern Aufgaben der Hand?", 99, 16777215))
	_uState2Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_112PC", "Ist die Hand nun aufgelöst, da wir nur noch den roten Gott bekämpfen?", 261, 16777215))
	_uState2Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState2Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState2Trans8:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_113", "Ich hoffe nicht! Aber es bleibt wenig Zeit für andere Aufträge.", 262, 16777215))
	_uState2Trans8:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_114", "Wenn Ihr tatsächlich noch Zeit und Kraft findet, an Arbeit soll es nicht mangeln!", 263, 16777215))
	_uState2Trans8:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_115", "Wir wurden gebeten, die Grenze am Nadelberg mit zu sichern. Die Hohenmark ist durch den Fluch in Siebenburg betäubt!", 264, 16777215))
	_uState2Trans8:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_116", "Ihr müsst an alle markierten Positionen am Nadelberg Verteidigungstürme bauen!! Keiner von ihnen darf zerstört werden, bis Ihr alle gebaut habt!", 265, 16777215))
	_uState2Trans8:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_117", "Sobald alle stehen, ist der Auftrag erfüllt! Kommt dann hierher zurück!", 266, 16777215))
	_uState2Trans8:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseWatchtowers', 1, 0))
	_uState2Trans8:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopNeedleWatchTowers', 1, 0))
	_uState2Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState2Trans8 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState2, _uBeginState, "State_2", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Halicos', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HALICOS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState5Trans1 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T1", "Dialog")
	_uState5Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 2))
	_uState5Trans1:AddCondition (CScriptConditionValue('pl_Human', 'af_P333_InfoHandOfDragonTold', 0, 2))
	_uState5Trans1:AddAction (CScriptActionChoice("P333_DLG_HALICOS_006PC", "Was sind die Aufgaben der Hand des Drachen?", 1, 16777215))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 1, 4))
	_uState5Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState5Trans1 = nil

-- TO STATE: choice
_uState5Trans2 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T2", "Dialog")
	_uState5Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 2))
	_uState5Trans2:AddCondition (CScriptConditionValue('pl_Human', 'af_P333_InfoWestguardTold', 0, 2))
	_uState5Trans2:AddAction (CScriptActionChoice("P333_DLG_HALICOS_011PC", "Was ist diese Westwehr?", 2, 16777215))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 1, 4))
	_uState5Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState5Trans2 = nil

-- TO STATE: choice
_uState5Trans3 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T3", "Dialog")
	_uState5Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(HALICOS)', 0, 2))
	_uState5Trans3:AddAction (CScriptActionChoice("P333_DLG_HALICOS_017PC", "Ich bin bereit der Hand des Drachen beizutreten!", 3, 16777215))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(HALICOS)', 1, 4))
	_uState5Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState5Trans3 = nil

-- TO STATE: choice
_uState5Trans4 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T4", "Dialog")
	_uState5Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(HALICOS)', 0, 2))
	_uState5Trans4:AddAction (CScriptActionChoice("P333_DLG_HALICOS_026PC", "Ich schaue mich noch einmal um.", 4, 16777215))
	_uState5Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(HALICOS)', 1, 4))
	_uState5Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState5Trans4 = nil

-- TO STATE: choice
_uState5Trans5 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T5", "Dialog")
	_uState5Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 2))
	_uState5Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 0, 4))
	_uState5Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(HALICOS)', 1, 4))
	_uState5Trans5:AddAction (CScriptActionShowChoices())
	_uState5Trans5 = nil

-- TO STATE: choice
_uState5Trans6 = GdsCreateTransition (_uState2, _uState5, "State_2", "State_5_T6", "Dialog")
	_uState5Trans6:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99) ))
	_uState5Trans6:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'af_P333_AvatarGreetedByHalios', 0, 2) ))
	_uState5Trans6:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_005", "Wie sieht es aus? Wollt Ihr nur herumsitzen, oder seid Ihr bereit mit der Hand des Drachen für die Zukunft der Shaikan zu kämpfen?", 104, 16777215))
	_uState5Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState5Trans6 = nil

-- TO STATE: choice
_uState5Trans7 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T7", "Dialog")
	_uState5Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 1))
	_uState5Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_006PC", "Was sind die Aufgaben der Hand des Drachen?", 99, 16777215))
	_uState5Trans7:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_007", "Wir sind eine freie Truppe und verdingen uns für gutes Gold oder helfen auch mal, wenn jemand in Not ist.", 106, 16777215))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(HALICOS)', 0, 4))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(HALICOS)', 0, 4))
	_uState5Trans7:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_008", "Der Seelenträger hat uns ins Leben gerufen. Er glaubt, dass die Shaikan sich zu ihrem Erbe bekennen müssen. Euer Blut ist keines, dass in Frieden leben kann.", 107, 16777215))
	_uState5Trans7:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_009", "Also setzen wir die Fähigkeiten der Shaikan zu ihrem eigenen Vorteil ein.", 108, 16777215))
	_uState5Trans7:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_010", "Wir kämpfen, wir retten, wir lösen Probleme ... all dass was ihr Shaikan am besten könnt.", 109, 16777215))
	_uState5Trans7:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_InfoHandOfDragonTold', 1, 4))
	_uState5Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState5Trans7 = nil

-- TO STATE: choice
_uState5Trans8 = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5_T8", "Dialog")
	_uState5Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 2))
	_uState5Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_011PC", "Was ist diese Westwehr?", 99, 16777215))
	_uState5Trans8:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_012", "Der Seelenträger erhielt die Westwehr als Lehen von König Ulf.", 111, 16777215))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(HALICOS)', 0, 4))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(HALICOS)', 0, 4))
	_uState5Trans8:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_013", "Nach dem Bruch mit der Hohenmark rief die Westwehr ihre Unabhängigkeit aus.", 112, 16777215))
	_uState5Trans8:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_014", "Wir sind jetzt ein neutrales Land, offen für Jeden und arm wie die Tempelmäuse!", 113, 16777215))
	_uState5Trans8:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_015", "Da die Hohenmark immer noch Shaikur besetzt hält, hat der Seelenträger beschlossen, die Westwehr zum neuen Heim für die Shaikan zu machen.", 114, 16777215))
	_uState5Trans8:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_016", "Und jetzt kommen sie herbei, Tag für Tag mehr. Ich wusste nicht, dass es noch so viele von euch in der Welt gibt.", 115, 16777215))
	_uState5Trans8:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_InfoWestguardTold', 1, 4))
	_uState5Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState5Trans8 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState5, _uState5, "State_5", "State_5", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState5, _uBeginState, "State_5", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Halicos', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HALICOS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState11Trans1 = GdsCreateTransition (_uState11, _uState11, "State_11", "State_11_T1", "Dialog")
	_uState11Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 2))
	_uState11Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopHonorMarksCollectedEnough', 99) ))
	_uState11Trans1:AddAction (CScriptActionChoice("P333_DLG_HALICOS_029PC", "Noch nicht.", 1, 16777215))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 1, 4))
	_uState11Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState11Trans1 = nil

-- TO STATE: choice
_uState11Trans2 = GdsCreateTransition (_uState11, _uState11, "State_11", "State_11_T2", "Dialog")
	_uState11Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 2))
	_uState11Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopHonorMarksCollectedEnough', 1))
	_uState11Trans2:AddAction (CScriptActionChoice("P333_DLG_HALICOS_030PC", "Hier sind sie!", 2, 16777215))
	_uState11Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 1, 4))
	_uState11Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState11Trans2 = nil

-- TO STATE: choice
_uState11Trans3 = GdsCreateTransition (_uState11, _uState11, "State_11", "State_11_T3", "Dialog")
	_uState11Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 2))
	_uState11Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 0, 4))
	_uState11Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(HALICOS)', 1, 4))
	_uState11Trans3:AddAction (CScriptActionShowChoices())
	_uState11Trans3 = nil

-- TO STATE: choice
_uState11Trans4 = GdsCreateTransition (_uState2, _uState11, "State_2", "State_11_T4", "Dialog")
	_uState11Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopHonorMarksCollectedEnough', 2) ))
	_uState11Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99))
	_uState11Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'af_P333_AvatarGreetedByHalios', 0, 2) ))
	_uState11Trans4:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99) )
	_uState11Trans4:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_028", "Habt Ihr die vier Ehrenmarken?", 127, 16777215))
	_uState11Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState11Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState11, _uState11, "State_11", "State_11", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState11, _uBeginState, "State_11", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Halicos', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HALICOS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState15Trans1 = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15_T1", "Dialog")
	_uState15Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 2))
	_uState15Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProphetLiberated', 99) ))
	_uState15Trans1:AddAction (CScriptActionChoice("P333_DLG_HALICOS_038PC", "Noch nicht.", 1, 16777215))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 1, 4))
	_uState15Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState15Trans1 = nil

-- TO STATE: choice
_uState15Trans2 = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15_T2", "Dialog")
	_uState15Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 2))
	_uState15Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopProphetLiberated', 1))
	_uState15Trans2:AddAction (CScriptActionChoice("P333_DLG_HALICOS_039PC", "Ja! Seltsamer Kauz.", 2, 16777215))
	_uState15Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 1, 4))
	_uState15Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState15Trans2 = nil

-- TO STATE: choice
_uState15Trans3 = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15_T3", "Dialog")
	_uState15Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 2))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 0, 4))
	_uState15Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(HALICOS)', 1, 4))
	_uState15Trans3:AddAction (CScriptActionShowChoices())
	_uState15Trans3 = nil

-- TO STATE: choice
_uState15Trans4 = GdsCreateTransition (_uState2, _uState15, "State_2", "State_15_T4", "Dialog")
	_uState15Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProphetLiberated', 2) ))
	_uState15Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopProphet', 99))
	_uState15Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'af_P333_AvatarGreetedByHalios', 0, 2) ))
	_uState15Trans4:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99) )
	_uState15Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopHonorMarksCollectedEnough', 2) ), CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99)) ))
	_uState15Trans4:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_037", "Habt Ihr ihn befreit?", 136, 16777215))
	_uState15Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState15Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState15, _uState15, "State_15", "State_15", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState15, _uBeginState, "State_15", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Halicos', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HALICOS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState19Trans1 = GdsCreateTransition (_uState19, _uState19, "State_19", "State_19_T1", "Dialog")
	_uState19Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 2))
	_uState19Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopFreeMerchantsLiberatedEnough', 99) ))
	_uState19Trans1:AddAction (CScriptActionChoice("P333_DLG_HALICOS_050PC", "Nein, noch nicht alle.", 1, 16777215))
	_uState19Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 1, 4))
	_uState19Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState19Trans1 = nil

-- TO STATE: choice
_uState19Trans2 = GdsCreateTransition (_uState19, _uState19, "State_19", "State_19_T2", "Dialog")
	_uState19Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 2))
	_uState19Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopFreeMerchantsLiberatedEnough', 1))
	_uState19Trans2:AddAction (CScriptActionChoice("P333_DLG_HALICOS_052PC", "Ja, sie sind in Sicherheit.", 2, 16777215))
	_uState19Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 1, 4))
	_uState19Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState19Trans2 = nil

-- TO STATE: choice
_uState19Trans3 = GdsCreateTransition (_uState19, _uState19, "State_19", "State_19_T3", "Dialog")
	_uState19Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 2))
	_uState19Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 0, 4))
	_uState19Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(HALICOS)', 1, 4))
	_uState19Trans3:AddAction (CScriptActionShowChoices())
	_uState19Trans3 = nil

-- TO STATE: choice
_uState19Trans4 = GdsCreateTransition (_uState2, _uState19, "State_2", "State_19_T4", "Dialog")
	_uState19Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopFreeMerchantsLiberatedEnough', 2) ))
	_uState19Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopFreeMerchants', 99))
	_uState19Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'af_P333_AvatarGreetedByHalios', 0, 2) ))
	_uState19Trans4:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99) )
	_uState19Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopHonorMarksCollectedEnough', 2) ), CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99)) ))
	_uState19Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProphetLiberated', 2) ), CScriptConditionQuestState('pl_Human', 'CoopProphet', 99)) ))
	_uState19Trans4:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_049", "Habt Ihr 20 der Freihändler retten können?", 148, 16777215))
	_uState19Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState19Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState19, _uState19, "State_19", "State_19", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState19, _uBeginState, "State_19", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Halicos', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HALICOS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState25Trans1 = GdsCreateTransition (_uState25, _uState25, "State_25", "State_25_T1", "Dialog")
	_uState25Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 2))
	_uState25Trans1:AddAction (CScriptActionChoice("P333_DLG_HALICOS_068PC", "Weil ihr selbst nicht mehr wisst, wo Ihr steht, Veräter?", 1, 16777215))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 1, 4))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState25Trans1 = nil

-- TO STATE: choice
_uState25Trans2 = GdsCreateTransition (_uState25, _uState25, "State_25", "State_25_T2", "Dialog")
	_uState25Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 2))
	_uState25Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 0, 4))
	_uState25Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(HALICOS)', 1, 4))
	_uState25Trans2:AddAction (CScriptActionShowChoices())
	_uState25Trans2 = nil

-- TO STATE: choice
_uState25Trans3 = GdsCreateTransition (_uState2, _uState25, "State_2", "State_25_T3", "Dialog")
	_uState25Trans3:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopLiberateAya', 99) ))
	_uState25Trans3:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopTalkToHalicos', 1))
	_uState25Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'af_P333_AvatarGreetedByHalios', 0, 2) ))
	_uState25Trans3:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99) )
	_uState25Trans3:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopHonorMarksCollectedEnough', 2) ), CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99)) ))
	_uState25Trans3:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProphetLiberated', 2) ), CScriptConditionQuestState('pl_Human', 'CoopProphet', 99)) ))
	_uState25Trans3:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopFreeMerchantsLiberatedEnough', 2) ), CScriptConditionQuestState('pl_Human', 'CoopFreeMerchants', 99)) ))
	_uState25Trans3:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProtectMerchants', 1) ))
	_uState25Trans3:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProtectMerchantsSolved', 1) ))
	_uState25Trans3:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_067", "Ich ... habe keinen Auftrag für Euch ...", 166, 16777215))
	_uState25Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState25Trans3 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState25, _uState25, "State_25", "State_25", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState25, _uBeginState, "State_25", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Halicos', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HALICOS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState30Trans1 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T1", "Dialog")
	_uState30Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 2))
	_uState30Trans1:AddAction (CScriptActionChoice("P333_DLG_HALICOS_080PC", "Was wird der Kult als nächstes tun?", 1, 16777215))
	_uState30Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 1, 4))
	_uState30Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState30Trans1 = nil

-- TO STATE: choice
_uState30Trans2 = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30_T2", "Dialog")
	_uState30Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 2))
	_uState30Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 0, 4))
	_uState30Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(HALICOS)', 1, 4))
	_uState30Trans2:AddAction (CScriptActionShowChoices())
	_uState30Trans2 = nil

-- TO STATE: choice
_uState30Trans3 = GdsCreateTransition (_uState2, _uState30, "State_2", "State_30_T3", "Dialog")
	_uState30Trans3:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopLiberateAyaSolved', 2))
	_uState30Trans3:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMarketplaceGoldenFields', 99) ))
	_uState30Trans3:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'af_P333_AvatarGreetedByHalios', 0, 2) ))
	_uState30Trans3:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99) )
	_uState30Trans3:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopHonorMarksCollectedEnough', 2) ), CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99)) ))
	_uState30Trans3:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProphetLiberated', 2) ), CScriptConditionQuestState('pl_Human', 'CoopProphet', 99)) ))
	_uState30Trans3:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopFreeMerchantsLiberatedEnough', 2) ), CScriptConditionQuestState('pl_Human', 'CoopFreeMerchants', 99)) ))
	_uState30Trans3:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProtectMerchants', 1) ))
	_uState30Trans3:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProtectMerchantsSolved', 1) ))
	_uState30Trans3:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopLiberateAya', 99) ), CScriptConditionQuestState('pl_Human', 'CoopTalkToHalicos', 1)) ))
	_uState30Trans3:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopLiberateAya', 1) ))
	_uState30Trans3:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopLiberateAyaSolved', 1) ))
	_uState30Trans3:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_079", "Danke, dass Ihr Aya gerettet habt. Sie wird es nie sagen, aber seid Euch auch ihres Dankes gewiss.", 178, 16777215))
	_uState30Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState30Trans3 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState30, _uState30, "State_30", "State_30", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState30, _uBeginState, "State_30", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Halicos', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HALICOS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState33Trans1 = GdsCreateTransition (_uState33, _uState33, "State_33", "State_33_T1", "Dialog")
	_uState33Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 2))
	_uState33Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMarketplaceGoldenFieldsReached', 99) ))
	_uState33Trans1:AddAction (CScriptActionChoice("P333_DLG_HALICOS_088PC", "Noch weiß ich nicht, was dort vorgeht!", 1, 16777215))
	_uState33Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 1, 4))
	_uState33Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState33Trans1 = nil

-- TO STATE: choice
_uState33Trans2 = GdsCreateTransition (_uState33, _uState33, "State_33", "State_33_T2", "Dialog")
	_uState33Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 2))
	_uState33Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopMarketplaceGoldenFieldsReached', 1))
	_uState33Trans2:AddAction (CScriptActionChoice("P333_DLG_HALICOS_090PC", "Ja, es gibt einiges zu berichten!", 2, 16777215))
	_uState33Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 1, 4))
	_uState33Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState33Trans2 = nil

-- TO STATE: choice
_uState33Trans3 = GdsCreateTransition (_uState33, _uState33, "State_33", "State_33_T3", "Dialog")
	_uState33Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 2))
	_uState33Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 0, 4))
	_uState33Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(HALICOS)', 1, 4))
	_uState33Trans3:AddAction (CScriptActionShowChoices())
	_uState33Trans3 = nil

-- TO STATE: choice
_uState33Trans4 = GdsCreateTransition (_uState2, _uState33, "State_2", "State_33_T4", "Dialog")
	_uState33Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopMarketplaceGoldenFields', 99))
	_uState33Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMarketplaceGoldenFieldsReached', 2) ))
	_uState33Trans4:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'af_P333_AvatarGreetedByHalios', 0, 2) ))
	_uState33Trans4:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99) )
	_uState33Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopHonorMarksCollectedEnough', 2) ), CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99)) ))
	_uState33Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProphetLiberated', 2) ), CScriptConditionQuestState('pl_Human', 'CoopProphet', 99)) ))
	_uState33Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopFreeMerchantsLiberatedEnough', 2) ), CScriptConditionQuestState('pl_Human', 'CoopFreeMerchants', 99)) ))
	_uState33Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProtectMerchants', 1) ))
	_uState33Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProtectMerchantsSolved', 1) ))
	_uState33Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopLiberateAya', 99) ), CScriptConditionQuestState('pl_Human', 'CoopTalkToHalicos', 1)) ))
	_uState33Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopLiberateAya', 1) ))
	_uState33Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopLiberateAyaSolved', 1) ))
	_uState33Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopLiberateAyaSolved', 2), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMarketplaceGoldenFields', 99) )) ))
	_uState33Trans4:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_087", "Habt Ihr Siebenburg ausgespäht?", 186, 16777215))
	_uState33Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState33Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState33, _uState33, "State_33", "State_33", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState33, _uBeginState, "State_33", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Halicos', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HALICOS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState37Trans1 = GdsCreateTransition (_uState37, _uState37, "State_37", "State_37_T1", "Dialog")
	_uState37Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 2))
	_uState37Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMagicBarrierCrystalsDestroyedEnough', 99) ))
	_uState37Trans1:AddAction (CScriptActionChoice("P333_DLG_HALICOS_103PC", "Noch habe ich nicht alle!", 1, 16777215))
	_uState37Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 1, 4))
	_uState37Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState37Trans1 = nil

-- TO STATE: choice
_uState37Trans2 = GdsCreateTransition (_uState37, _uState37, "State_37", "State_37_T2", "Dialog")
	_uState37Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 2))
	_uState37Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopMagicBarrierCrystalsDestroyedEnough', 1))
	_uState37Trans2:AddAction (CScriptActionChoice("P333_DLG_HALICOS_105PC", "Ja, die Barriere müsste nun gefallen sein!", 2, 16777215))
	_uState37Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 1, 4))
	_uState37Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState37Trans2 = nil

-- TO STATE: choice
_uState37Trans3 = GdsCreateTransition (_uState37, _uState37, "State_37", "State_37_T3", "Dialog")
	_uState37Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(HALICOS)', 0, 2))
	_uState37Trans3:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseWatchtowers', 99) ))
	_uState37Trans3:AddAction (CScriptActionChoice("P333_DLG_HALICOS_111PC", "Was ist mit den andern Aufgaben der Hand?", 3, 16777215))
	_uState37Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(HALICOS)', 1, 4))
	_uState37Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState37Trans3 = nil

-- TO STATE: choice
_uState37Trans4 = GdsCreateTransition (_uState37, _uState37, "State_37", "State_37_T4", "Dialog")
	_uState37Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(HALICOS)', 0, 2))
	_uState37Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopNeedleWatchTowersBuilt', 1))
	_uState37Trans4:AddAction (CScriptActionChoice("P333_DLG_HALICOS_118PC", "Die Türme wurden errichtet!", 4, 16777215))
	_uState37Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(HALICOS)', 1, 4))
	_uState37Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState37Trans4 = nil

-- TO STATE: choice
_uState37Trans5 = GdsCreateTransition (_uState37, _uState37, "State_37", "State_37_T5", "Dialog")
	_uState37Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 2))
	_uState37Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 0, 4))
	_uState37Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(HALICOS)', 1, 4))
	_uState37Trans5:AddAction (CScriptActionShowChoices())
	_uState37Trans5 = nil

-- TO STATE: choice
_uState37Trans6 = GdsCreateTransition (_uState2, _uState37, "State_2", "State_37_T6", "Dialog")
	_uState37Trans6:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopMagicBarrierCrystals', 99))
	_uState37Trans6:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMagicBarrierCrystalsDestroyedEnough', 2) ))
	_uState37Trans6:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'af_P333_AvatarGreetedByHalios', 0, 2) ))
	_uState37Trans6:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99) )
	_uState37Trans6:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopHonorMarksCollectedEnough', 2) ), CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99)) ))
	_uState37Trans6:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProphetLiberated', 2) ), CScriptConditionQuestState('pl_Human', 'CoopProphet', 99)) ))
	_uState37Trans6:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopFreeMerchantsLiberatedEnough', 2) ), CScriptConditionQuestState('pl_Human', 'CoopFreeMerchants', 99)) ))
	_uState37Trans6:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProtectMerchants', 1) ))
	_uState37Trans6:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProtectMerchantsSolved', 1) ))
	_uState37Trans6:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopLiberateAya', 99) ), CScriptConditionQuestState('pl_Human', 'CoopTalkToHalicos', 1)) ))
	_uState37Trans6:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopLiberateAya', 1) ))
	_uState37Trans6:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopLiberateAyaSolved', 1) ))
	_uState37Trans6:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopLiberateAyaSolved', 2), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMarketplaceGoldenFields', 99) )) ))
	_uState37Trans6:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopMarketplaceGoldenFields', 99), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMarketplaceGoldenFieldsReached', 2) )) ))
	_uState37Trans6:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_102", "Habt Ihr drei der Kristalle zerstört?", 201, 16777215))
	_uState37Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState37Trans6 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState37, _uState37, "State_37", "State_37", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState37, _uBeginState, "State_37", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Halicos', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HALICOS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState41Trans1 = GdsCreateTransition (_uState37, _uState41, "State_37", "State_41_T1", "Dialog")
	_uState41Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 4))
	_uState41Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_118PC", "Die Türme wurden errichtet!", 99, 16777215))
	_uState41Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_119PC", "Aber viel sicherer ist die Grenze dadurch nicht geworden!", 218, 16777215))
	_uState41Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState41Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState41Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(HALICOS)', 0, 4))
	_uState41Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(HALICOS)', 0, 4))
	_uState41Trans1:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_120", "Macht Euch keine Sorgen, unser Auftrag ist erfüllt! Hier, Euer Lohn!", 219, 16777215))
	_uState41Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopNeedleWatchTowersBuilt', 2, 0))
	_uState41Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseWatchtowers', 2, 0))
	_uState41Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState41Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState41, _uState41, "State_41", "State_41", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState41, _uBeginState, "State_41", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Halicos', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HALICOS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState45Trans1 = GdsCreateTransition (_uState45, _uState45, "State_45", "State_45_T1", "Dialog")
	_uState45Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 2))
	_uState45Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopGoldenFieldsCurseRemoved', 99) ))
	_uState45Trans1:AddAction (CScriptActionChoice("P333_DLG_HALICOS_122PC", "Nein, ich konnte Fluch nicht bannen.", 1, 16777215))
	_uState45Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 1, 4))
	_uState45Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState45Trans1 = nil

-- TO STATE: choice
_uState45Trans2 = GdsCreateTransition (_uState45, _uState45, "State_45", "State_45_T2", "Dialog")
	_uState45Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 2))
	_uState45Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopGoldenFieldsCurseRemoved', 1))
	_uState45Trans2:AddAction (CScriptActionChoice("P333_DLG_HALICOS_124PC", "Hier ist das Zeichen von König Ulf. Er dankt uns allen.", 2, 16777215))
	_uState45Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 1, 4))
	_uState45Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState45Trans2 = nil

-- TO STATE: choice
_uState45Trans3 = GdsCreateTransition (_uState45, _uState45, "State_45", "State_45_T3", "Dialog")
	_uState45Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(HALICOS)', 0, 2))
	_uState45Trans3:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseWatchtowers', 99) ))
	_uState45Trans3:AddAction (CScriptActionChoice("P333_DLG_HALICOS_111PC", "Was ist mit den andern Aufgaben der Hand?", 3, 16777215))
	_uState45Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(HALICOS)', 1, 4))
	_uState45Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState45Trans3 = nil

-- TO STATE: choice
_uState45Trans4 = GdsCreateTransition (_uState45, _uState45, "State_45", "State_45_T4", "Dialog")
	_uState45Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag4(HALICOS)', 0, 2))
	_uState45Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopNeedleWatchTowersBuilt', 1))
	_uState45Trans4:AddAction (CScriptActionChoice("P333_DLG_HALICOS_118PC", "Die Türme wurden errichtet!", 4, 16777215))
	_uState45Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(HALICOS)', 1, 4))
	_uState45Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState45Trans4 = nil

-- TO STATE: choice
_uState45Trans5 = GdsCreateTransition (_uState45, _uState45, "State_45", "State_45_T5", "Dialog")
	_uState45Trans5:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 2))
	_uState45Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 0, 4))
	_uState45Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(HALICOS)', 1, 4))
	_uState45Trans5:AddAction (CScriptActionShowChoices())
	_uState45Trans5 = nil

-- TO STATE: choice
_uState45Trans6 = GdsCreateTransition (_uState2, _uState45, "State_2", "State_45_T6", "Dialog")
	_uState45Trans6:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopGoldenFieldsCurse', 99))
	_uState45Trans6:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopGoldenFieldsCurseRemoved', 2) ))
	_uState45Trans6:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'af_P333_AvatarGreetedByHalios', 0, 2) ))
	_uState45Trans6:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99) )
	_uState45Trans6:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopHonorMarksCollectedEnough', 2) ), CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99)) ))
	_uState45Trans6:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProphetLiberated', 2) ), CScriptConditionQuestState('pl_Human', 'CoopProphet', 99)) ))
	_uState45Trans6:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopFreeMerchantsLiberatedEnough', 2) ), CScriptConditionQuestState('pl_Human', 'CoopFreeMerchants', 99)) ))
	_uState45Trans6:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProtectMerchants', 1) ))
	_uState45Trans6:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProtectMerchantsSolved', 1) ))
	_uState45Trans6:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopLiberateAya', 99) ), CScriptConditionQuestState('pl_Human', 'CoopTalkToHalicos', 1)) ))
	_uState45Trans6:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopLiberateAya', 1) ))
	_uState45Trans6:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopLiberateAyaSolved', 1) ))
	_uState45Trans6:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopLiberateAyaSolved', 2), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMarketplaceGoldenFields', 99) )) ))
	_uState45Trans6:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopMarketplaceGoldenFields', 99), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMarketplaceGoldenFieldsReached', 2) )) ))
	_uState45Trans6:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopMagicBarrierCrystals', 99), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMagicBarrierCrystalsDestroyedEnough', 2) )) ))
	_uState45Trans6:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_121", "Ist der Fluch von Siebenburg genommen?", 220, 16777215))
	_uState45Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState45Trans6 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState45, _uState45, "State_45", "State_45", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState45, _uBeginState, "State_45", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Halicos', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HALICOS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState47Trans1 = GdsCreateTransition (_uState45, _uState47, "State_45", "State_47_T1", "Dialog")
	_uState47Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 2))
	_uState47Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_124PC", "Hier ist das Zeichen von König Ulf. Er dankt uns allen.", 99, 16777215))
	_uState47Trans1:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_125", "Gute Arbeit! Vielleicht ist Ulf auch jetzt bereit über Frieden mit uns zu reden!", 224, 16777215))
	_uState47Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState47Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState47Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(HALICOS)', 0, 4))
	_uState47Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(HALICOS)', 0, 4))
	_uState47Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_126PC", "Aber bevor der Magier starb, sprach er, dass des Gottes Wein bereits die Kelche der Treuesten füllt.", 225, 16777215))
	_uState47Trans1:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_127", "Hm. Die Kelche der Treuesten ...", 226, 16777215))
	_uState47Trans1:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_128", "Ich habe nicht den leichtesten Schimmer, was er damit meint!", 227, 16777215))
	_uState47Trans1:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_129", "Wenn das eine Art Prophezeiung sein soll, dann berichtet einmal unserer Elfenheilerin davon. Elfen kennen sich mit solcherart Orakelgerede aus.", 228, 16777215))
	_uState47Trans1:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_130", "Es ist Ylia, die einzige Elfe hier, Ihr könnt sie nicht verfehlen.", 229, 16777215))
	_uState47Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopGoldenFieldsCurseRemoved', 2, 0))
	_uState47Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopTalkToYlia', 1, 0))
	_uState47Trans1:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogEnabled', 1, 4))
	_uState47Trans1:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogTypeMainQuest', 1, 4))
	_uState47Trans1:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogTypeSideQuest', 0, 4))
	_uState47Trans1:AddAction (CScriptActionDialogEnable('Ylia', 1))
	_uState47Trans1:AddAction (CScriptActionSetDialog('Ylia', 2))
	_uState47Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState47Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState47, _uState47, "State_47", "State_47", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState47, _uBeginState, "State_47", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Halicos', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HALICOS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState51Trans1 = GdsCreateTransition (_uState45, _uState51, "State_45", "State_51_T1", "Dialog")
	_uState51Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 4))
	_uState51Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_118PC", "Die Türme wurden errichtet!", 99, 16777215))
	_uState51Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_119PC", "Aber viel sicherer ist die Grenze dadurch nicht geworden!", 238, 16777215))
	_uState51Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState51Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState51Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(HALICOS)', 0, 4))
	_uState51Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(HALICOS)', 0, 4))
	_uState51Trans1:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_120", "Macht Euch keine Sorgen, unser Auftrag ist erfüllt! Hier, Euer Lohn!", 239, 16777215))
	_uState51Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopNeedleWatchTowersBuilt', 2, 0))
	_uState51Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseWatchtowers', 2, 0))
	_uState51Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState51Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState51, _uState51, "State_51", "State_51", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState51, _uBeginState, "State_51", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Halicos', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HALICOS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: else
_uState54Trans1 = GdsCreateTransition (_uState2, _uState54, "State_2", "State_54_T1", "Dialog")
	_uState54Trans1:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'af_P333_AvatarGreetedByHalios', 0, 2) ))
	_uState54Trans1:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99) )
	_uState54Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopHonorMarksCollectedEnough', 2) ), CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99)) ))
	_uState54Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProphetLiberated', 2) ), CScriptConditionQuestState('pl_Human', 'CoopProphet', 99)) ))
	_uState54Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopFreeMerchantsLiberatedEnough', 2) ), CScriptConditionQuestState('pl_Human', 'CoopFreeMerchants', 99)) ))
	_uState54Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProtectMerchants', 1) ))
	_uState54Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProtectMerchantsSolved', 1) ))
	_uState54Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopLiberateAya', 99) ), CScriptConditionQuestState('pl_Human', 'CoopTalkToHalicos', 1)) ))
	_uState54Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopLiberateAya', 1) ))
	_uState54Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopLiberateAyaSolved', 1) ))
	_uState54Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopLiberateAyaSolved', 2), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMarketplaceGoldenFields', 99) )) ))
	_uState54Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopMarketplaceGoldenFields', 99), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMarketplaceGoldenFieldsReached', 2) )) ))
	_uState54Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopMagicBarrierCrystals', 99), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopMagicBarrierCrystalsDestroyedEnough', 2) )) ))
	_uState54Trans1:AddCondition (GdsNegateCondition( CScriptConditionAND(CScriptConditionQuestState('pl_Human', 'CoopGoldenFieldsCurse', 99), GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopGoldenFieldsCurseRemoved', 2) )) ))
	_uState54Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState54Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState54, _uState54, "State_54", "State_54", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState54, _uBeginState, "State_54", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Halicos', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HALICOS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState56Trans1 = GdsCreateTransition (_uState56, _uState56, "State_56", "State_56_T1", "Dialog")
	_uState56Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 2))
	_uState56Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseWatchtowers', 99) ))
	_uState56Trans1:AddAction (CScriptActionChoice("P333_DLG_HALICOS_111PC", "Was ist mit den andern Aufgaben der Hand?", 1, 16777215))
	_uState56Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 1, 4))
	_uState56Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState56Trans1 = nil

-- TO STATE: choice
_uState56Trans2 = GdsCreateTransition (_uState56, _uState56, "State_56", "State_56_T2", "Dialog")
	_uState56Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 2))
	_uState56Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopNeedleWatchTowersBuilt', 1))
	_uState56Trans2:AddAction (CScriptActionChoice("P333_DLG_HALICOS_118PC", "Die Türme wurden errichtet!", 2, 16777215))
	_uState56Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 1, 4))
	_uState56Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState56Trans2 = nil

-- TO STATE: choice
_uState56Trans3 = GdsCreateTransition (_uState56, _uState56, "State_56", "State_56_T3", "Dialog")
	_uState56Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 2))
	_uState56Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 0, 4))
	_uState56Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(HALICOS)', 1, 4))
	_uState56Trans3:AddAction (CScriptActionShowChoices())
	_uState56Trans3 = nil

-- TO STATE: choice
_uState56Trans4 = GdsCreateTransition (_uState54, _uState56, "State_54", "State_56_T4", "Dialog")
	_uState56Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseWatchtowers', 99) ))
	_uState56Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_HalicosDialogDisabled', 0, 4))
	_uState56Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_HalicosDialogTypeMainQuest', 0, 4))
	_uState56Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_HalicosDialogTypeSideQuest', 1, 4))
	_uState56Trans4:AddAction (CScriptActionSetDialog('Halicos', 1))
	_uState56Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState56Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState56, _uState56, "State_56", "State_56", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState56, _uBeginState, "State_56", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Halicos', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HALICOS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState58Trans1 = GdsCreateTransition (_uState56, _uState58, "State_56", "State_58_T1", "Dialog")
	_uState58Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 2))
	_uState58Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_118PC", "Die Türme wurden errichtet!", 99, 16777215))
	_uState58Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_119PC", "Aber viel sicherer ist die Grenze dadurch nicht geworden!", 248, 16777215))
	_uState58Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState58Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState58Trans1:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_120", "Macht Euch keine Sorgen, unser Auftrag ist erfüllt! Hier, Euer Lohn!", 249, 16777215))
	_uState58Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopNeedleWatchTowersBuilt', 2, 0))
	_uState58Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseWatchtowers', 2, 0))
	_uState58Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState58Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState58, _uState58, "State_58", "State_58", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState58, _uBeginState, "State_58", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Halicos', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HALICOS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState62Trans1 = GdsCreateTransition (_uState62, _uState62, "State_62", "State_62_T1", "Dialog")
	_uState62Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 2))
	_uState62Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseWatchtowers', 99) ))
	_uState62Trans1:AddAction (CScriptActionChoice("P333_DLG_HALICOS_111PC", "Was ist mit den andern Aufgaben der Hand?", 1, 16777215))
	_uState62Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 1, 4))
	_uState62Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState62Trans1 = nil

-- TO STATE: choice
_uState62Trans2 = GdsCreateTransition (_uState62, _uState62, "State_62", "State_62_T2", "Dialog")
	_uState62Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 2))
	_uState62Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopNeedleWatchTowersBuilt', 1))
	_uState62Trans2:AddAction (CScriptActionChoice("P333_DLG_HALICOS_118PC", "Die Türme wurden errichtet!", 2, 16777215))
	_uState62Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 1, 4))
	_uState62Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState62Trans2 = nil

-- TO STATE: choice
_uState62Trans3 = GdsCreateTransition (_uState62, _uState62, "State_62", "State_62_T3", "Dialog")
	_uState62Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 2))
	_uState62Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 0, 4))
	_uState62Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(HALICOS)', 1, 4))
	_uState62Trans3:AddAction (CScriptActionShowChoices())
	_uState62Trans3 = nil

-- TO STATE: choice
_uState62Trans4 = GdsCreateTransition (_uState54, _uState62, "State_54", "State_62_T4", "Dialog")
	_uState62Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopBaseWatchtowers', 1))
	_uState62Trans4:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopBaseWatchtowers', 99) )
	_uState62Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_HalicosDialogDisabled', 0, 4))
	_uState62Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_HalicosDialogTypeMainQuest', 0, 4))
	_uState62Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_HalicosDialogTypeSideQuest', 1, 4))
	_uState62Trans4:AddAction (CScriptActionSetDialog('Halicos', 1))
	_uState62Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState62Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState62, _uState62, "State_62", "State_62", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState62, _uBeginState, "State_62", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Halicos', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HALICOS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState64Trans1 = GdsCreateTransition (_uState62, _uState64, "State_62", "State_64_T1", "Dialog")
	_uState64Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 2))
	_uState64Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_118PC", "Die Türme wurden errichtet!", 99, 16777215))
	_uState64Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_119PC", "Aber viel sicherer ist die Grenze dadurch nicht geworden!", 258, 16777215))
	_uState64Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState64Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState64Trans1:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_120", "Macht Euch keine Sorgen, unser Auftrag ist erfüllt! Hier, Euer Lohn!", 259, 16777215))
	_uState64Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopNeedleWatchTowersBuilt', 2, 0))
	_uState64Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseWatchtowers', 2, 0))
	_uState64Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState64Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState64, _uState64, "State_64", "State_64", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState64, _uBeginState, "State_64", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Halicos', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HALICOS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState68Trans1 = GdsCreateTransition (_uState68, _uState68, "State_68", "State_68_T1", "Dialog")
	_uState68Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 2))
	_uState68Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseWatchtowers', 99) ))
	_uState68Trans1:AddAction (CScriptActionChoice("P333_DLG_HALICOS_111PC", "Was ist mit den andern Aufgaben der Hand?", 1, 16777215))
	_uState68Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 1, 4))
	_uState68Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState68Trans1 = nil

-- TO STATE: choice
_uState68Trans2 = GdsCreateTransition (_uState68, _uState68, "State_68", "State_68_T2", "Dialog")
	_uState68Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 2))
	_uState68Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopNeedleWatchTowersBuilt', 1))
	_uState68Trans2:AddAction (CScriptActionChoice("P333_DLG_HALICOS_118PC", "Die Türme wurden errichtet!", 2, 16777215))
	_uState68Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 1, 4))
	_uState68Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState68Trans2 = nil

-- TO STATE: choice
_uState68Trans3 = GdsCreateTransition (_uState68, _uState68, "State_68", "State_68_T3", "Dialog")
	_uState68Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 2))
	_uState68Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 0, 4))
	_uState68Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(HALICOS)', 1, 4))
	_uState68Trans3:AddAction (CScriptActionShowChoices())
	_uState68Trans3 = nil

-- TO STATE: choice
_uState68Trans4 = GdsCreateTransition (_uState54, _uState68, "State_54", "State_68_T4", "Dialog")
	_uState68Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopNeedleWatchTowersBuilt', 1))
	_uState68Trans4:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopBaseWatchtowers', 99) )
	_uState68Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseWatchtowers', 1) ))
	_uState68Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_HalicosDialogDisabled', 0, 4))
	_uState68Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_HalicosDialogTypeMainQuest', 0, 4))
	_uState68Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_HalicosDialogTypeSideQuest', 1, 4))
	_uState68Trans4:AddAction (CScriptActionSetDialog('Halicos', 1))
	_uState68Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState68Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState68, _uState68, "State_68", "State_68", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState68, _uBeginState, "State_68", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Halicos', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HALICOS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState70Trans1 = GdsCreateTransition (_uState68, _uState70, "State_68", "State_70_T1", "Dialog")
	_uState70Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 2))
	_uState70Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_118PC", "Die Türme wurden errichtet!", 99, 16777215))
	_uState70Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_119PC", "Aber viel sicherer ist die Grenze dadurch nicht geworden!", 268, 16777215))
	_uState70Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState70Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState70Trans1:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_120", "Macht Euch keine Sorgen, unser Auftrag ist erfüllt! Hier, Euer Lohn!", 269, 16777215))
	_uState70Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopNeedleWatchTowersBuilt', 2, 0))
	_uState70Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseWatchtowers', 2, 0))
	_uState70Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState70Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState70, _uState70, "State_70", "State_70", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState70, _uBeginState, "State_70", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Halicos', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HALICOS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState74Trans1 = GdsCreateTransition (_uState5, _uState74, "State_5", "State_74_T1", "Dialog")
	_uState74Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 3))
	_uState74Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_017PC", "Ich bin bereit der Hand des Drachen beizutreten!", 99, 16777215))
	_uState74Trans1:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_018", "Dann mal zu! Ich habe gleich eine Aufgabe für Euch!", 117, 16777215))
	_uState74Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState74Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState74Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(HALICOS)', 0, 4))
	_uState74Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(HALICOS)', 0, 4))
	_uState74Trans1:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_019", "Um Eure Fähigkeiten zu prüfen, werde ich Euch erst einmal zur Unterstützung unserer Verbündeten einteilen.", 118, 16777215))
	_uState74Trans1:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_020", "Wir wurden angeheuert, bei der Verteidigung einiger Städte zu helfen. Und zwar in Lichtwasser, Norimar, Dun Mora und am Tor der Schwerter.", 119, 16777215))
	_uState74Trans1:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_021", "Wenn ihr an einem dieser Orte eine Stadt gesichert und die Angreifer vertrieben habt, werdet Ihr dort eine Ehrenmarke erhalten.", 120, 16777215))
	_uState74Trans1:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_022", "Ich erwarte nicht, dass Ihr alles schafft. Bringt mir nur vier dieser Ehrenmarken, dann habt Ihr Eure Pflicht erfüllt.", 121, 16777215))
	_uState74Trans1:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_023", "Am besten rekrutiert Ihr Euch ein paar Mitstreiter.", 122, 16777215))
	_uState74Trans1:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_024", "Viele der Shaikan halten sich bei dem Kampfplatz und der Taverne, südlich der Burg, auf. Sprecht mit Ihnen, um zu erfahren, was für Fähigkeiten sie besitzen.", 123, 16777215))
	_uState74Trans1:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_025", "Wählt Euch einige aus und dann macht zu und erledigt Euren Auftrag!", 124, 16777215))
	_uState74Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseChapter_1', 1, 0))
	_uState74Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopHonorMarks', 1, 0))
	_uState74Trans1:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_AnderhallDialogEnabled', 1, 4))
	_uState74Trans1:AddAction (CScriptActionDialogEnable('Anderhall', 1))
	_uState74Trans1:AddAction (CScriptActionSetDialog('Anderhall', 1))
	_uState74Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(HALICOS)', 1, 4))
	_uState74Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans1 = nil

-- TO STATE: endconversation
_uState74Trans2 = GdsCreateTransition (_uState5, _uState74, "State_5", "State_74_T2", "Dialog")
	_uState74Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 4))
	_uState74Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_026PC", "Ich schaue mich noch einmal um.", 99, 16777215))
	_uState74Trans2:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_027", "Aha, na wie Ihr meint. Kommt wieder zu mir, falls Ihr nach Arbeit sucht! Es soll auch Euer Schaden nicht sein!", 126, 16777215))
	_uState74Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState74Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState74Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(HALICOS)', 0, 4))
	_uState74Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(HALICOS)', 0, 4))
	_uState74Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(HALICOS)', 1, 4))
	_uState74Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans2 = nil

-- TO STATE: endconversation
_uState74Trans3 = GdsCreateTransition (_uState11, _uState74, "State_11", "State_74_T3", "Dialog")
	_uState74Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 1))
	_uState74Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_029PC", "Noch nicht.", 99, 16777215))
	_uState74Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(HALICOS)', 1, 4))
	_uState74Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState74Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState74Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans3 = nil

-- TO STATE: endconversation
_uState74Trans4 = GdsCreateTransition (_uState11, _uState74, "State_11", "State_74_T4", "Dialog")
	_uState74Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 2))
	_uState74Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_030PC", "Hier sind sie!", 99, 16777215))
	_uState74Trans4:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_031", "Tatsächlich, gute Arbeit! Ihr seid zu gebrauchen, wie ich sehe!", 130, 16777215))
	_uState74Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState74Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState74Trans4:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_032", "Hmm, ich hätte da einen speziellen Auftrag. Etwas, das schnell und ohne viel Aufsehen erledigt werden muss!", 131, 16777215))
	_uState74Trans4:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_033", "Es ist keine offizielle Mission der Hand, mehr etwas ... Privates.", 132, 16777215))
	_uState74Trans4:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_034", "Ein weiser Mann und Freund der Shaikan wird vom Pakt in Dragh'Lur gefangen gehalten.", 133, 16777215))
	_uState74Trans4:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_035", "Befreit ihn! Es wird nicht leicht, aber Ihr habt das Zeug dazu!", 134, 16777215))
	_uState74Trans4:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_036", "Er wird dort wahrscheinlich auf der Spitze der Festung gefangen gehalten, Ihr müsst also die Festung einnehmen.", 135, 16777215))
	_uState74Trans4:AddAction (CScriptActionPlayerTakeItem('pl_Human', 3, 157, 999))
	_uState74Trans4:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopHonorMarksCollectedEnough', 2, 0))
	_uState74Trans4:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopProphet', 1, 0))
	_uState74Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(HALICOS)', 1, 4))
	_uState74Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans4 = nil

-- TO STATE: endconversation
_uState74Trans5 = GdsCreateTransition (_uState15, _uState74, "State_15", "State_74_T5", "Dialog")
	_uState74Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 1))
	_uState74Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_038PC", "Noch nicht.", 99, 16777215))
	_uState74Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(HALICOS)', 1, 4))
	_uState74Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState74Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState74Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans5 = nil

-- TO STATE: endconversation
_uState74Trans6 = GdsCreateTransition (_uState15, _uState74, "State_15", "State_74_T6", "Dialog")
	_uState74Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 2))
	_uState74Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_039PC", "Ja! Seltsamer Kauz.", 99, 16777215))
	_uState74Trans6:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_040", "Unwichtig. Zu Eurem nächsten Auftrag ...", 139, 16777215))
	_uState74Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState74Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState74Trans6:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_041", "Wir haben aus unseren Quellen erfahren, dass ein Kult versuchen wird, die Freihändler vom Angesicht Eos zu tilgen.", 140, 16777215))
	_uState74Trans6:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_042", "Ich rede hier nicht von ein paar Attentaten, ich rede hier von der völligen Auslöschung dieser ganzen Gruppe! Familien, alles!", 141, 16777215))
	_uState74Trans6:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_043", "Ganz gleich warum dieses Gemetzel stattfindet oder ob uns jemand bezahlt oder nicht, wir müssen die Freihändler schützen!", 142, 16777215))
	_uState74Trans6:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_044", "Aber nicht so lange sie überall in den Landen verteilt sind! Wir müssen sie alle zu einem Ort bringen, an dem wir sie gut verteidigen können!", 143, 16777215))
	_uState74Trans6:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_045", "Ich werde Euch Shal, Gillyshire, die Eisfänge und den Singenden Berg zuweisen.", 144, 16777215))
	_uState74Trans6:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_046", "Wir haben Reisepunkte in diesen Landen errichtet, Ihr erkennt sie an dem Leuchten, das sie umgibt. Sucht die Freihändler in jedem Land und eskortiert sie zu den Reisepunkten.", 145, 16777215))
	_uState74Trans6:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_047", "Denkt daran, dass Ihr die Freihändler schützen müsst, während sie Euch folgen.", 146, 16777215))
	_uState74Trans6:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_048", "Wir haben nicht ewig Zeit. Seht zu, dass Ihr 20 Freihändler rausholt, den Rest werden andere übernehmen!", 147, 16777215))
	_uState74Trans6:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopProphetLiberated', 2, 0))
	_uState74Trans6:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseChapter_1', 2, 0))
	_uState74Trans6:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseChapter_2', 1, 0))
	_uState74Trans6:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopFreeMerchants', 1, 0))
	_uState74Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(HALICOS)', 1, 4))
	_uState74Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans6 = nil

-- TO STATE: endconversation
_uState74Trans7 = GdsCreateTransition (_uState19, _uState74, "State_19", "State_74_T7", "Dialog")
	_uState74Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 1))
	_uState74Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_050PC", "Nein, noch nicht alle.", 99, 16777215))
	_uState74Trans7:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_051", "Dann frisch auf! Uns läuft die Zeit davon!", 150, 16777215))
	_uState74Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState74Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState74Trans7:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(HALICOS)', 1, 4))
	_uState74Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans7 = nil

-- TO STATE: endconversation
_uState74Trans8 = GdsCreateTransition (_uState19, _uState74, "State_19", "State_74_T8", "Dialog")
	_uState74Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 2))
	_uState74Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_052PC", "Ja, sie sind in Sicherheit.", 99, 16777215))
	_uState74Trans8:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_053", "Nicht ganz! Unser Auffanglager wird von Dämonen angegriffen!", 152, 16777215))
	_uState74Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState74Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState74Trans8:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_054", "Ihr müsst so schnell wie möglich zur Verteidigung ausrücken!", 153, 16777215))
	_uState74Trans8:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_055", "Hier, die Rüstmarke für Eure letzte Aufgabe. Tauscht sie beim Rüstmeister ein und dann schnell weiter in die Tuscariwüste!", 154, 16777215))
	_uState74Trans8:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_056", "Übernehmt die Verteidigung der Freihändler dort und findet heraus, was hinter diesen Angriffen steckt!", 155, 16777215))
	_uState74Trans8:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopFreeMerchantsLiberatedEnough', 2, 0))
	_uState74Trans8:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopProtectMerchants', 1, 0))
	_uState74Trans8:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(HALICOS)', 1, 4))
	_uState74Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans8 = nil

-- TO STATE: endconversation
_uState74Trans9 = GdsCreateTransition (_uState2, _uState74, "State_2", "State_74_T9", "Dialog")
	_uState74Trans9:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopProtectMerchants', 1))
	_uState74Trans9:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'af_P333_AvatarGreetedByHalios', 0, 2) ))
	_uState74Trans9:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99) )
	_uState74Trans9:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopHonorMarksCollectedEnough', 2) ), CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99)) ))
	_uState74Trans9:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProphetLiberated', 2) ), CScriptConditionQuestState('pl_Human', 'CoopProphet', 99)) ))
	_uState74Trans9:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopFreeMerchantsLiberatedEnough', 2) ), CScriptConditionQuestState('pl_Human', 'CoopFreeMerchants', 99)) ))
	_uState74Trans9:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_057", "Was macht Ihr hier? Ihr sollt das Auffanglager in Tuscari verteidigen!", 156, 16777215))
	_uState74Trans9:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(HALICOS)', 1, 4))
	_uState74Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans9 = nil

-- TO STATE: endconversation
_uState74Trans10 = GdsCreateTransition (_uState2, _uState74, "State_2", "State_74_T10", "Dialog")
	_uState74Trans10:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopProtectMerchantsSolved', 1))
	_uState74Trans10:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'af_P333_AvatarGreetedByHalios', 0, 2) ))
	_uState74Trans10:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99) )
	_uState74Trans10:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopHonorMarksCollectedEnough', 2) ), CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99)) ))
	_uState74Trans10:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProphetLiberated', 2) ), CScriptConditionQuestState('pl_Human', 'CoopProphet', 99)) ))
	_uState74Trans10:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopFreeMerchantsLiberatedEnough', 2) ), CScriptConditionQuestState('pl_Human', 'CoopFreeMerchants', 99)) ))
	_uState74Trans10:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProtectMerchants', 1) ))
	_uState74Trans10:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_058", "Wie konnte das geschehen ...?", 157, 16777215))
	_uState74Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_059PC", "Euer feiner Freund, den wir aus Dragh'Lur befreit haben, hat uns verraten!", 158, 16777215))
	_uState74Trans10:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_060", "Ich wusste nicht, dass er ...", 159, 16777215))
	_uState74Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_061PC", "Was wird hier gespielt? Wer ist dieser Prophet?", 160, 16777215))
	_uState74Trans10:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_062", "Ich ... wusste nicht ...", 161, 16777215))
	_uState74Trans10:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_063", "Das Geschehen hat eine unerwartete Wendung genommen! Es ist nicht Eure Schuld. Hier, eure Rüstmarke.", 162, 16777215))
	_uState74Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_064PC", "Das ist alles?", 163, 16777215))
	_uState74Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_065PC", "Wie geht es weiter? Was ist das für ein Spielchen, das Ihr treibt?", 164, 16777215))
	_uState74Trans10:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_066", "Es gibt keinen weiteren Auftrag für Euch! Geht! Geht ...", 165, 16777215))
	_uState74Trans10:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopProtectMerchantsSolved', 2, 0))
	_uState74Trans10:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopTalkToAnyone', 1, 0))
	_uState74Trans10:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_JandrimDialogEnabled', 1, 4))
	_uState74Trans10:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_JandrimDialogTypeMainQuest', 1, 4))
	_uState74Trans10:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_JandrimDialogTypeSideQuest', 0, 4))
	_uState74Trans10:AddAction (CScriptActionDialogEnable('Jandrim_Windhammer', 1))
	_uState74Trans10:AddAction (CScriptActionSetDialog('Jandrim_Windhammer', 2))
	_uState74Trans10:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_HalicosDialogDisabled', 1, 4))
	_uState74Trans10:AddAction (CScriptActionDialogEnable('Halicos', 0))
	_uState74Trans10:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(HALICOS)', 1, 4))
	_uState74Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans10 = nil

-- TO STATE: endconversation
_uState74Trans11 = GdsCreateTransition (_uState25, _uState74, "State_25", "State_74_T11", "Dialog")
	_uState74Trans11:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 1))
	_uState74Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_068PC", "Weil ihr selbst nicht mehr wisst, wo Ihr steht, Veräter?", 99, 16777215))
	_uState74Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_069PC", "Ihr habt die Hand den Machenschaften des Kults unterstellt! Ihr habt uns benutzt um die Freihändler zu ermorden!", 168, 16777215))
	_uState74Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState74Trans11:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_070PC", "Wir haben Botschaften des Kults abgefangen, die Euch belasten!", 169, 16777215))
	_uState74Trans11:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_071", "Was sollte ich machen? Sie haben Aya! Sie ist zwar nur eine Barbarin, aber sie trägt mein Kind!", 170, 16777215))
	_uState74Trans11:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_072", "Helft mir sie da rauszuholen! Der Kult hält sie in der alten Vulkanschmiede gefangen!", 171, 16777215))
	_uState74Trans11:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_073", "Ich werde Euch begleiten und die Wächter täuschen! Sobald sie mir die Tore öffnen ...", 172, 16777215))
	_uState74Trans11:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_074", "... müsst Ihr zuschlagen und die Kultisten niedermachen, bevor sie Alarm schlagen können!", 173, 16777215))
	_uState74Trans11:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_075", "Geht zur Vulkanschmiede! Ich werde dort sein!", 174, 16777215))
	_uState74Trans11:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopTalkToHalicos', 2, 0))
	_uState74Trans11:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopLiberateAya', 1, 0))
	_uState74Trans11:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(HALICOS)', 1, 4))
	_uState74Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans11 = nil

-- TO STATE: endconversation
_uState74Trans12 = GdsCreateTransition (_uState2, _uState74, "State_2", "State_74_T12", "Dialog")
	_uState74Trans12:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopLiberateAya', 1))
	_uState74Trans12:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'af_P333_AvatarGreetedByHalios', 0, 2) ))
	_uState74Trans12:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99) )
	_uState74Trans12:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopHonorMarksCollectedEnough', 2) ), CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99)) ))
	_uState74Trans12:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProphetLiberated', 2) ), CScriptConditionQuestState('pl_Human', 'CoopProphet', 99)) ))
	_uState74Trans12:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopFreeMerchantsLiberatedEnough', 2) ), CScriptConditionQuestState('pl_Human', 'CoopFreeMerchants', 99)) ))
	_uState74Trans12:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProtectMerchants', 1) ))
	_uState74Trans12:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProtectMerchantsSolved', 1) ))
	_uState74Trans12:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopLiberateAya', 99) ), CScriptConditionQuestState('pl_Human', 'CoopTalkToHalicos', 1)) ))
	_uState74Trans12:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_076", "Das war knapp! Wir müssen noch einmal zur Vulkanschmiede, ich gebe nicht auf, bis Aya gerettet ist!", 175, 16777215))
	_uState74Trans12:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(HALICOS)', 1, 4))
	_uState74Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans12 = nil

-- TO STATE: endconversation
_uState74Trans13 = GdsCreateTransition (_uState2, _uState74, "State_2", "State_74_T13", "Dialog")
	_uState74Trans13:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopLiberateAyaSolved', 1))
	_uState74Trans13:AddCondition (GdsNegateCondition( CScriptConditionValue('pl_Human', 'af_P333_AvatarGreetedByHalios', 0, 2) ))
	_uState74Trans13:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99) )
	_uState74Trans13:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopHonorMarksCollectedEnough', 2) ), CScriptConditionQuestState('pl_Human', 'CoopHonorMarks', 99)) ))
	_uState74Trans13:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProphetLiberated', 2) ), CScriptConditionQuestState('pl_Human', 'CoopProphet', 99)) ))
	_uState74Trans13:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopFreeMerchantsLiberatedEnough', 2) ), CScriptConditionQuestState('pl_Human', 'CoopFreeMerchants', 99)) ))
	_uState74Trans13:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProtectMerchants', 1) ))
	_uState74Trans13:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopProtectMerchantsSolved', 1) ))
	_uState74Trans13:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopLiberateAya', 99) ), CScriptConditionQuestState('pl_Human', 'CoopTalkToHalicos', 1)) ))
	_uState74Trans13:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopLiberateAya', 1) ))
	_uState74Trans13:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_077", "Ah, da seid Ihr! Ich habe bereits mit Jandrim gesprochen.", 176, 16777215))
	_uState74Trans13:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_078", "Ich denke er hat schon einen Plan, was wir als nächstes tun. Sprecht mit ihm!", 177, 16777215))
	_uState74Trans13:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_JandrimDialogEnabled', 1, 4))
	_uState74Trans13:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_JandrimDialogTypeMainQuest', 1, 4))
	_uState74Trans13:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_JandrimDialogTypeSideQuest', 0, 4))
	_uState74Trans13:AddAction (CScriptActionDialogEnable('Jandrim_Windhammer', 1))
	_uState74Trans13:AddAction (CScriptActionSetDialog('Jandrim_Windhammer', 2))
	_uState74Trans13:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_HalicosDialogDisabled', 1, 4))
	_uState74Trans13:AddAction (CScriptActionDialogEnable('Halicos', 0))
	_uState74Trans13:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopLiberateAyaSolved', 2, 0))
	_uState74Trans13:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopTalkToJandrim', 1, 0))
	_uState74Trans13:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag13(HALICOS)', 1, 4))
	_uState74Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans13 = nil

-- TO STATE: endconversation
_uState74Trans14 = GdsCreateTransition (_uState30, _uState74, "State_30", "State_74_T14", "Dialog")
	_uState74Trans14:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 1))
	_uState74Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_080PC", "Was wird der Kult als nächstes tun?", 99, 16777215))
	_uState74Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_081PC", "Könnten sie versuchen, die Erweckung Zerbos zu beschleunigen?", 180, 16777215))
	_uState74Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState74Trans14:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_082", "Ich erinnere mich, dass der Prophet eine Stadt auswählen wollte, für das Ritual der Erweckung ...", 181, 16777215))
	_uState74Trans14:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_083", "Was er da vorhatte, weiß ich nicht. Nur, dass es eine große Stadt sein sollte ... mit vielen Einwohnern.", 182, 16777215))
	_uState74Trans14:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_084PC", "Siebenburg!", 183, 16777215))
	_uState74Trans14:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_085", "Das liegt nahe. Am besten Ihr schaut Euch dort einmal um.", 184, 16777215))
	_uState74Trans14:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_086", "Ich weiß, wir sind dort nicht eben willkommen, aber vielleicht kommt Ihr ja unbehelligt zum Marktplatz, um einen Rundblick zu nehmen.", 185, 16777215))
	_uState74Trans14:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopTalkToHalicosAgain', 2, 0))
	_uState74Trans14:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseChapter_4', 2, 0))
	_uState74Trans14:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseChapter_5', 1, 0))
	_uState74Trans14:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopMarketplaceGoldenFields', 1, 0))
	_uState74Trans14:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag14(HALICOS)', 1, 4))
	_uState74Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans14 = nil

-- TO STATE: endconversation
_uState74Trans15 = GdsCreateTransition (_uState33, _uState74, "State_33", "State_74_T15", "Dialog")
	_uState74Trans15:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 1))
	_uState74Trans15:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_088PC", "Noch weiß ich nicht, was dort vorgeht!", 99, 16777215))
	_uState74Trans15:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_089", "Dann bringt es in Erfahrung! Versucht bis zum Marktplatz durchzukommen, von da aus habt Ihr einen guten Überblick!", 188, 16777215))
	_uState74Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState74Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState74Trans15:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag15(HALICOS)', 1, 4))
	_uState74Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans15 = nil

-- TO STATE: endconversation
_uState74Trans16 = GdsCreateTransition (_uState33, _uState74, "State_33", "State_74_T16", "Dialog")
	_uState74Trans16:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 2))
	_uState74Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_090PC", "Ja, es gibt einiges zu berichten!", 99, 16777215))
	_uState74Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_091PC", "Ganz Siebenburg ist voller Untoter! Kein Bürger ist mehr zu sehen!", 190, 16777215))
	_uState74Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState74Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState74Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_092PC", "Ein Magier des Kultes webt dort eine Art Beschwörung! Eine magische Barriere schützt ihn!", 191, 16777215))
	_uState74Trans16:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_093", "Jetzt verstehe ich! Das ist die Erweckung! Der Knochenfluch!", 192, 16777215))
	_uState74Trans16:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_094", "Er verwandelt die Bürger von Siebenburg in Untote, während ihre Lebenskraft dem Magier zufließt.", 193, 16777215))
	_uState74Trans16:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_095", "Und ich möchte wetten, der Kult benutzt diese Energie, um die Erweckung des roten Gottes zu beschleunigen!", 194, 16777215))
	_uState74Trans16:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_096", "Wenn wir den Magier erschlagen, endet der Fluch und die Bürger von Siebenburg werden wieder zu Lebenden!", 195, 16777215))
	_uState74Trans16:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_097PC", "Wie kommen wir durch die Barriere?", 196, 16777215))
	_uState74Trans16:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_098", "Ich habe gesehen, wie der Kult diese Barriere vorbereitet hat. Sie besteht aus einem Satz von fünf Kristallen.", 197, 16777215))
	_uState74Trans16:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_099", "Vier Kristalle spenden ihr Kraft und dort wo der fünfte sich befindet entsteht die Barriere!", 198, 16777215))
	_uState74Trans16:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_100", "Wenn Ihr drei der vier Kristalle zerstören könnt, wird die Barriere zusammenbrechen!", 199, 16777215))
	_uState74Trans16:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_101", "Sie sind gut versteckt! Soweit ich weiß gibt es je einen an der Stahlküste, in den Eisenfeldern, am Nadelberg und am Glitzerkamm!", 200, 16777215))
	_uState74Trans16:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopMarketplaceGoldenFieldsReached', 2, 0))
	_uState74Trans16:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopMagicBarrierCrystals', 1, 0))
	_uState74Trans16:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag16(HALICOS)', 1, 4))
	_uState74Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans16 = nil

-- TO STATE: endconversation
_uState74Trans17 = GdsCreateTransition (_uState37, _uState74, "State_37", "State_74_T17", "Dialog")
	_uState74Trans17:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 1))
	_uState74Trans17:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_103PC", "Noch habe ich nicht alle!", 99, 16777215))
	_uState74Trans17:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_104", "Dann frisch auf! Wer weiß, wie viel Zeit uns noch bis zur Erweckung bleibt!", 203, 16777215))
	_uState74Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState74Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState74Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(HALICOS)', 0, 4))
	_uState74Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(HALICOS)', 0, 4))
	_uState74Trans17:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag17(HALICOS)', 1, 4))
	_uState74Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans17 = nil

-- TO STATE: endconversation
_uState74Trans18 = GdsCreateTransition (_uState37, _uState74, "State_37", "State_74_T18", "Dialog")
	_uState74Trans18:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 2))
	_uState74Trans18:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_105PC", "Ja, die Barriere müsste nun gefallen sein!", 99, 16777215))
	_uState74Trans18:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_106", "So einfach ist das nicht! Die Barriere wird einige Zeit brauchen, bis sie ihre Kraft verliert!", 205, 16777215))
	_uState74Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState74Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState74Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(HALICOS)', 0, 4))
	_uState74Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(HALICOS)', 0, 4))
	_uState74Trans18:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_107", "Wenn wir Glück haben ist ihre Kraft erschöpft, bis Ihr Euch zu dem Magier durchgekämpft habt! Dann wird er eine böse Überraschung erleben!", 206, 16777215))
	_uState74Trans18:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_108", "Geht nach Siebenburg und erledigt diesen Magier! Brecht den Fluch!", 207, 16777215))
	_uState74Trans18:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_109", "Und wenn Ihr könnt, bringt mir ein Zeichen, dass es den Leuten dort wieder gut geht!", 208, 16777215))
	_uState74Trans18:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_110", "Es sind zwar keine Freunde, aber ein solches Schicksal wünscht man niemand!", 209, 16777215))
	_uState74Trans18:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopMagicBarrierCrystalsDestroyedEnough', 2, 0))
	_uState74Trans18:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopGoldenFieldsCurse', 1, 0))
	_uState74Trans18:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag18(HALICOS)', 1, 4))
	_uState74Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans18 = nil

-- TO STATE: endconversation
_uState74Trans19 = GdsCreateTransition (_uState41, _uState74, "State_41", "State_74_T19", "Dialog")
	_uState74Trans19:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopGoldenFieldsCurseRemoved', 2))
	_uState74Trans19:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag19(HALICOS)', 1, 4))
	_uState74Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans19 = nil

-- TO STATE: endconversation
_uState74Trans20 = GdsCreateTransition (_uState41, _uState74, "State_41", "State_74_T20", "Dialog")
	_uState74Trans20:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopGoldenFieldsCurseRemoved', 2) ))
	_uState74Trans20:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag20(HALICOS)', 1, 4))
	_uState74Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans20 = nil

-- TO STATE: endconversation
_uState74Trans21 = GdsCreateTransition (_uState45, _uState74, "State_45", "State_74_T21", "Dialog")
	_uState74Trans21:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 1))
	_uState74Trans21:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_HALICOS_122PC", "Nein, ich konnte Fluch nicht bannen.", 99, 16777215))
	_uState74Trans21:AddAction (CScriptActionSay("Halicos", "P333_DLG_HALICOS_123", "Zerstört drei der Kristalle um den Schild des Magiers zu brechen und bringt ihn zur Strecke!", 222, 16777215))
	_uState74Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(HALICOS)', 0, 4))
	_uState74Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(HALICOS)', 0, 4))
	_uState74Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(HALICOS)', 0, 4))
	_uState74Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag4(HALICOS)', 0, 4))
	_uState74Trans21:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag21(HALICOS)', 1, 4))
	_uState74Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans21 = nil

-- TO STATE: endconversation
_uState74Trans22 = GdsCreateTransition (_uState47, _uState74, "State_47", "State_74_T22", "Dialog")
	_uState74Trans22:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopBaseWatchtowers', 2))
	_uState74Trans22:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag22(HALICOS)', 1, 4))
	_uState74Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans22 = nil

-- TO STATE: endconversation
_uState74Trans23 = GdsCreateTransition (_uState51, _uState74, "State_51", "State_74_T23", "Dialog")
	_uState74Trans23:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopGoldenFieldsCurseRemoved', 2))
	_uState74Trans23:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag23(HALICOS)', 1, 4))
	_uState74Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans23 = nil

-- TO STATE: endconversation
_uState74Trans24 = GdsCreateTransition (_uState51, _uState74, "State_51", "State_74_T24", "Dialog")
	_uState74Trans24:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopGoldenFieldsCurseRemoved', 2) ))
	_uState74Trans24:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag24(HALICOS)', 1, 4))
	_uState74Trans24:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans24 = nil

-- TO STATE: endconversation
_uState74Trans25 = GdsCreateTransition (_uState58, _uState74, "State_58", "State_74_T25", "Dialog")
	_uState74Trans25:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopGoldenFieldsCurseRemoved', 2))
	_uState74Trans25:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag25(HALICOS)', 1, 4))
	_uState74Trans25:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans25 = nil

-- TO STATE: endconversation
_uState74Trans26 = GdsCreateTransition (_uState58, _uState74, "State_58", "State_74_T26", "Dialog")
	_uState74Trans26:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopGoldenFieldsCurseRemoved', 2) ))
	_uState74Trans26:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag26(HALICOS)', 1, 4))
	_uState74Trans26:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans26 = nil

-- TO STATE: endconversation
_uState74Trans27 = GdsCreateTransition (_uState64, _uState74, "State_64", "State_74_T27", "Dialog")
	_uState74Trans27:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopGoldenFieldsCurseRemoved', 2))
	_uState74Trans27:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans27:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag27(HALICOS)', 1, 4))
	_uState74Trans27:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans27 = nil

-- TO STATE: endconversation
_uState74Trans28 = GdsCreateTransition (_uState64, _uState74, "State_64", "State_74_T28", "Dialog")
	_uState74Trans28:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopGoldenFieldsCurseRemoved', 2) ))
	_uState74Trans28:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans28:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag28(HALICOS)', 1, 4))
	_uState74Trans28:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans28 = nil

-- TO STATE: endconversation
_uState74Trans29 = GdsCreateTransition (_uState70, _uState74, "State_70", "State_74_T29", "Dialog")
	_uState74Trans29:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopGoldenFieldsCurseRemoved', 2))
	_uState74Trans29:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans29:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag29(HALICOS)', 1, 4))
	_uState74Trans29:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans29 = nil

-- TO STATE: endconversation
_uState74Trans30 = GdsCreateTransition (_uState70, _uState74, "State_70", "State_74_T30", "Dialog")
	_uState74Trans30:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopGoldenFieldsCurseRemoved', 2) ))
	_uState74Trans30:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans30:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag30(HALICOS)', 1, 4))
	_uState74Trans30:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans30 = nil

-- TO STATE: endconversation
_uState74Trans31 = GdsCreateTransition (_uState54, _uState74, "State_54", "State_74_T31", "Dialog")
	_uState74Trans31:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopBaseWatchtowers', 99) )
	_uState74Trans31:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseWatchtowers', 1) ))
	_uState74Trans31:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopNeedleWatchTowersBuilt', 1) ))
	_uState74Trans31:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Halicos"))
	_uState74Trans31:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag31(HALICOS)', 1, 4))
	_uState74Trans31:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(HALICOS)', 1, 4))
	_uState74Trans31 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(HALICOS)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(HALICOS)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(HALICOS)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(HALICOS)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(HALICOS)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(HALICOS)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(HALICOS)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(HALICOS)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(HALICOS)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(HALICOS)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(HALICOS)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(HALICOS)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions6 = nil

-- TO SELF: EndConversation Actions #7
_uEndActions7 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_7", "Dialog")
	_uEndActions7:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag7(HALICOS)', 1, 2))
	_uEndActions7:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(HALICOS)', 0, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions7 = nil

-- TO SELF: EndConversation Actions #8
_uEndActions8 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_8", "Dialog")
	_uEndActions8:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag8(HALICOS)', 1, 2))
	_uEndActions8:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(HALICOS)', 0, 4))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions8 = nil

-- TO SELF: EndConversation Actions #9
_uEndActions9 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_9", "Dialog")
	_uEndActions9:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag9(HALICOS)', 1, 2))
	_uEndActions9:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(HALICOS)', 0, 4))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions9 = nil

-- TO SELF: EndConversation Actions #10
_uEndActions10 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_10", "Dialog")
	_uEndActions10:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag10(HALICOS)', 1, 2))
	_uEndActions10:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(HALICOS)', 0, 4))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions10 = nil

-- TO SELF: EndConversation Actions #11
_uEndActions11 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_11", "Dialog")
	_uEndActions11:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag11(HALICOS)', 1, 2))
	_uEndActions11:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(HALICOS)', 0, 4))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions11 = nil

-- TO SELF: EndConversation Actions #12
_uEndActions12 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_12", "Dialog")
	_uEndActions12:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag12(HALICOS)', 1, 2))
	_uEndActions12:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(HALICOS)', 0, 4))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions12 = nil

-- TO SELF: EndConversation Actions #13
_uEndActions13 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_13", "Dialog")
	_uEndActions13:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag13(HALICOS)', 1, 2))
	_uEndActions13:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag13(HALICOS)', 0, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions13 = nil

-- TO SELF: EndConversation Actions #14
_uEndActions14 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_14", "Dialog")
	_uEndActions14:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag14(HALICOS)', 1, 2))
	_uEndActions14:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag14(HALICOS)', 0, 4))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions14 = nil

-- TO SELF: EndConversation Actions #15
_uEndActions15 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_15", "Dialog")
	_uEndActions15:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag15(HALICOS)', 1, 2))
	_uEndActions15:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag15(HALICOS)', 0, 4))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions15 = nil

-- TO SELF: EndConversation Actions #16
_uEndActions16 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_16", "Dialog")
	_uEndActions16:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag16(HALICOS)', 1, 2))
	_uEndActions16:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions16:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag16(HALICOS)', 0, 4))
	_uEndActions16:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions16 = nil

-- TO SELF: EndConversation Actions #17
_uEndActions17 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_17", "Dialog")
	_uEndActions17:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag17(HALICOS)', 1, 2))
	_uEndActions17:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions17:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag17(HALICOS)', 0, 4))
	_uEndActions17:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions17 = nil

-- TO SELF: EndConversation Actions #18
_uEndActions18 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_18", "Dialog")
	_uEndActions18:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag18(HALICOS)', 1, 2))
	_uEndActions18:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions18:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag18(HALICOS)', 0, 4))
	_uEndActions18:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions18 = nil

-- TO SELF: EndConversation Actions #19
_uEndActions19 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_19", "Dialog")
	_uEndActions19:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag19(HALICOS)', 1, 2))
	_uEndActions19:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions19:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag19(HALICOS)', 0, 4))
	_uEndActions19:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions19 = nil

-- TO SELF: EndConversation Actions #20
_uEndActions20 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_20", "Dialog")
	_uEndActions20:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag20(HALICOS)', 1, 2))
	_uEndActions20:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions20:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag20(HALICOS)', 0, 4))
	_uEndActions20:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions20 = nil

-- TO SELF: EndConversation Actions #21
_uEndActions21 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_21", "Dialog")
	_uEndActions21:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag21(HALICOS)', 1, 2))
	_uEndActions21:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag21(HALICOS)', 0, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions21 = nil

-- TO SELF: EndConversation Actions #22
_uEndActions22 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_22", "Dialog")
	_uEndActions22:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag22(HALICOS)', 1, 2))
	_uEndActions22:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag22(HALICOS)', 0, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions22 = nil

-- TO SELF: EndConversation Actions #23
_uEndActions23 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_23", "Dialog")
	_uEndActions23:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag23(HALICOS)', 1, 2))
	_uEndActions23:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions23:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag23(HALICOS)', 0, 4))
	_uEndActions23:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions23 = nil

-- TO SELF: EndConversation Actions #24
_uEndActions24 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_24", "Dialog")
	_uEndActions24:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag24(HALICOS)', 1, 2))
	_uEndActions24:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions24:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag24(HALICOS)', 0, 4))
	_uEndActions24:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions24 = nil

-- TO SELF: EndConversation Actions #25
_uEndActions25 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_25", "Dialog")
	_uEndActions25:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag25(HALICOS)', 1, 2))
	_uEndActions25:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions25:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag25(HALICOS)', 0, 4))
	_uEndActions25:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions25 = nil

-- TO SELF: EndConversation Actions #26
_uEndActions26 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_26", "Dialog")
	_uEndActions26:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag26(HALICOS)', 1, 2))
	_uEndActions26:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions26:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag26(HALICOS)', 0, 4))
	_uEndActions26:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions26 = nil

-- TO SELF: EndConversation Actions #27
_uEndActions27 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_27", "Dialog")
	_uEndActions27:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag27(HALICOS)', 1, 2))
	_uEndActions27:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions27:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag27(HALICOS)', 0, 4))
	_uEndActions27:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions27 = nil

-- TO SELF: EndConversation Actions #28
_uEndActions28 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_28", "Dialog")
	_uEndActions28:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag28(HALICOS)', 1, 2))
	_uEndActions28:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions28:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag28(HALICOS)', 0, 4))
	_uEndActions28:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions28 = nil

-- TO SELF: EndConversation Actions #29
_uEndActions29 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_29", "Dialog")
	_uEndActions29:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag29(HALICOS)', 1, 2))
	_uEndActions29:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions29:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag29(HALICOS)', 0, 4))
	_uEndActions29:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions29 = nil

-- TO SELF: EndConversation Actions #30
_uEndActions30 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_30", "Dialog")
	_uEndActions30:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag30(HALICOS)', 1, 2))
	_uEndActions30:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions30:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag30(HALICOS)', 0, 4))
	_uEndActions30:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions30 = nil

-- TO SELF: EndConversation Actions #31
_uEndActions31 = GdsCreateTransition (_uState74, _uState74, "State_74", "EndActions_31", "Dialog")
	_uEndActions31:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag31(HALICOS)', 1, 2))
	_uEndActions31:AddCondition (CScriptConditionDialogStopped("pl_Human", "Halicos"))
	_uEndActions31:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag31(HALICOS)', 0, 4))
	_uEndActions31:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 4))
	_uEndActions31 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState74, _uBeginState, "State_74", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(HALICOS)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(HALICOS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Halicos', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(HALICOS)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState2 = nil
_uState5 = nil
_uState11 = nil
_uState15 = nil
_uState19 = nil
_uState25 = nil
_uState30 = nil
_uState33 = nil
_uState37 = nil
_uState41 = nil
_uState45 = nil
_uState47 = nil
_uState51 = nil
_uState54 = nil
_uState56 = nil
_uState58 = nil
_uState62 = nil
_uState64 = nil
_uState68 = nil
_uState70 = nil
_uState74 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("Halicos_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(HALICOS)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(HALICOS)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[130]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[130]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 130))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[131]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[131]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 131))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[132]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[132]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 132))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[133]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[133]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 133))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[134]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[134]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 134))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[135]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[135]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 135))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[136]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[136]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 136))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[137]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[137]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 137))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[138]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[138]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 138))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[139]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[139]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 139))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[140]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[140]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 140))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[141]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[141]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 141))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[142]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[142]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 142))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[143]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[143]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 143))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[144]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[144]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 144))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[145]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[145]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 145))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[146]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[146]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 146))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[147]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[147]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 147))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[148]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[148]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 148))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[149]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[149]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 149))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[151]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[151]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 151))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[150]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[150]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 150))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[152]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[152]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 152))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[153]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[153]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 153))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[154]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[154]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 154))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[155]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[155]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 155))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[156]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[156]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 156))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[157]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[157]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 157))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[158]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[158]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 158))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[159]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[159]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 159))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[160]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[160]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 160))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[161]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[161]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 161))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[162]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[162]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 162))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[163]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[163]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 163))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[164]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[164]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 164))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[165]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[165]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 165))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[166]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[166]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 166))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[167]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[167]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 167))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[168]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[168]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 168))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[169]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[169]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 169))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[170]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[170]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 170))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[171]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[171]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 171))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[172]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[172]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 172))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[173]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[173]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 173))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[174]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[174]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 174))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[175]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[175]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 175))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[176]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[176]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 176))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[177]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[177]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 177))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[178]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[178]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 178))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[179]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[179]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 179))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[180]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[180]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 180))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[181]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[181]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 181))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[182]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[182]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 182))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[183]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[183]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 183))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[184]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[184]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 184))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[185]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[185]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 185))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[186]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[186]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 186))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[187]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[187]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 187))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[189]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[189]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 189))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[188]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[188]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 188))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[190]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[190]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 190))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[191]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[191]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 191))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[192]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[192]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 192))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[193]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[193]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 193))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[194]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[194]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 194))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[195]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[195]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 195))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[196]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[196]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 196))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[197]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[197]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 197))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[198]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[198]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 198))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[199]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[199]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 199))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[200]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[200]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 200))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[201]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[201]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 201))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[202]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[202]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 202))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[204]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[204]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 204))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[210]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[210]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 210))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[217]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[217]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 217))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[203]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[203]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 203))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[205]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[205]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 205))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[206]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[206]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 206))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[207]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[207]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 207))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[208]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[208]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 208))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[209]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[209]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 209))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[211]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[211]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 211))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[212]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[212]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 212))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[213]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[213]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 213))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[214]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[214]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 214))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[215]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[215]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 215))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[216]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[216]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 216))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[218]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[218]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 218))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[219]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[219]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 219))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[220]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[220]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 220))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[221]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[221]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 221))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[223]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[223]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 223))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[230]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[230]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 230))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[237]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[237]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 237))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[222]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[222]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 222))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[224]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[224]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 224))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[225]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[225]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 225))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[226]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[226]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 226))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[227]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[227]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 227))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[228]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[228]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 228))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[229]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[229]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 229))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[231]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[231]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 231))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[232]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[232]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 232))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[233]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[233]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 233))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[234]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[234]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 234))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[235]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[235]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 235))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[236]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[236]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 236))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[238]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[238]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 238))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[239]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[239]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 239))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[240]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[240]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 240))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[247]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[247]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 247))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[241]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[241]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 241))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[242]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[242]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 242))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[243]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[243]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 243))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[244]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[244]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 244))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[245]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[245]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 245))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[246]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[246]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 246))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[248]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[248]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 248))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[249]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[249]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 249))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[250]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[250]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 250))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[257]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[257]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 257))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[251]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[251]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 251))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[252]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[252]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 252))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[253]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[253]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 253))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[254]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[254]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 254))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[255]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[255]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 255))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[256]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[256]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 256))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[258]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[258]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 258))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[259]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[259]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 259))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[260]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[260]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 260))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[267]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[267]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 267))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[261]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[261]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 261))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[262]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[262]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 262))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[263]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[263]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 263))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[264]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[264]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 264))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[265]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[265]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 265))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[266]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[266]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 266))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[268]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[268]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 268))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[269]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[269]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 269))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Halicos'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Halicos", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Halicos', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
