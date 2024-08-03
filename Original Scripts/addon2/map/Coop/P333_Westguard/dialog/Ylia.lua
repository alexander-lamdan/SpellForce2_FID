local _uSM = GdsCreateStateMachine ("Ylia_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState2 = GdsCreateState (_uSM, "State_2")
_uState4 = GdsCreateState (_uSM, "State_4")
_uState7 = GdsCreateState (_uSM, "State_7")
_uState10 = GdsCreateState (_uSM, "State_10")
_uState12 = GdsCreateState (_uSM, "State_12")
_uState14 = GdsCreateState (_uSM, "State_14")
_uState19 = GdsCreateState (_uSM, "State_19")
_uState21 = GdsCreateState (_uSM, "State_21")
_uState25 = GdsCreateState (_uSM, "State_25")
_uState27 = GdsCreateState (_uSM, "State_27")
_uState29 = GdsCreateState (_uSM, "State_29")
_uState33 = GdsCreateState (_uSM, "State_33")
_uState35 = GdsCreateState (_uSM, "State_35")
_uState39 = GdsCreateState (_uSM, "State_39")
_uState41 = GdsCreateState (_uSM, "State_41")
_uState45 = GdsCreateState (_uSM, "State_45")
_uState47 = GdsCreateState (_uSM, "State_47")
_uState49 = GdsCreateState (_uSM, "State_49")
_uState53 = GdsCreateState (_uSM, "State_53")
_uState55 = GdsCreateState (_uSM, "State_55")
_uState59 = GdsCreateState (_uSM, "State_59")
_uState61 = GdsCreateState (_uSM, "State_61")
_uState65 = GdsCreateState (_uSM, "State_65")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('Ylia'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(YLIA)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(YLIA)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('Ylia', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("Ylia", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: label
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "Ylia"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(YLIA)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(YLIA)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('Ylia', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("Ylia")
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
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(YLIA)', 0, 4))
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState2, "StateBeginDelay", "State_2_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(YLIA)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: label
_uState2Trans2 = GdsCreateTransition (_uState4, _uState2, "State_4", "State_2_T2", "Dialog")
	_uState2Trans2:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 2))
	_uState2Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_014PC", "Kann die Hand etwas für Euch tun?", 99, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_015", "Die Hand kann etwas für sich tun.", 114, 16777215))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(YLIA)', 0, 4))
	_uState2Trans2:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_016", "In all dem rauen Söldnerhandwerk, geht der Glaube und das Wissen um die Götter verloren.", 115, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_017", "Ich bitte Euch, reist zu den alten Schreinen der Götter uns lauscht den Stimmen dieser Orte.", 116, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_018", "Die Schreine findet Ihr in den Eisfängen, in der Wüste der tanzenden Sonne und im Eisenherzgebirge.", 117, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_019", "Ihr erkennt sie an dem Leuchten, dass sie umgibt. Geht in ihre Nähe und lauscht.", 118, 16777215))
	_uState2Trans2:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_020", "Kehrt zu mir zurück, wenn Ihr verstanden habt, warum ich Euch auf diese Reise geschickt habe.", 119, 16777215))
	_uState2Trans2:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 1, 0))
	_uState2Trans2:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopHolyShrines', 1, 0))
	_uState2Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState2Trans2 = nil

-- TO STATE: label
_uState2Trans3 = GdsCreateTransition (_uState12, _uState2, "State_12", "State_2_T3", "Dialog")
	_uState2Trans3:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 1))
	_uState2Trans3:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_014PC", "Kann die Hand etwas für Euch tun?", 99, 16777215))
	_uState2Trans3:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_015", "Die Hand kann etwas für sich tun.", 129, 16777215))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 4))
	_uState2Trans3:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_016", "In all dem rauen Söldnerhandwerk, geht der Glaube und das Wissen um die Götter verloren.", 130, 16777215))
	_uState2Trans3:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_017", "Ich bitte Euch, reist zu den alten Schreinen der Götter uns lauscht den Stimmen dieser Orte.", 131, 16777215))
	_uState2Trans3:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_018", "Die Schreine findet Ihr in den Eisfängen, in der Wüste der tanzenden Sonne und im Eisenherzgebirge.", 132, 16777215))
	_uState2Trans3:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_019", "Ihr erkennt sie an dem Leuchten, dass sie umgibt. Geht in ihre Nähe und lauscht.", 133, 16777215))
	_uState2Trans3:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_020", "Kehrt zu mir zurück, wenn Ihr verstanden habt, warum ich Euch auf diese Reise geschickt habe.", 134, 16777215))
	_uState2Trans3:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 1, 0))
	_uState2Trans3:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopHolyShrines', 1, 0))
	_uState2Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState2Trans3 = nil

-- TO STATE: label
_uState2Trans4 = GdsCreateTransition (_uState19, _uState2, "State_19", "State_2_T4", "Dialog")
	_uState2Trans4:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 1))
	_uState2Trans4:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_014PC", "Kann die Hand etwas für Euch tun?", 99, 16777215))
	_uState2Trans4:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_015", "Die Hand kann etwas für sich tun.", 142, 16777215))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 4))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 4))
	_uState2Trans4:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_016", "In all dem rauen Söldnerhandwerk, geht der Glaube und das Wissen um die Götter verloren.", 143, 16777215))
	_uState2Trans4:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_017", "Ich bitte Euch, reist zu den alten Schreinen der Götter uns lauscht den Stimmen dieser Orte.", 144, 16777215))
	_uState2Trans4:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_018", "Die Schreine findet Ihr in den Eisfängen, in der Wüste der tanzenden Sonne und im Eisenherzgebirge.", 145, 16777215))
	_uState2Trans4:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_019", "Ihr erkennt sie an dem Leuchten, dass sie umgibt. Geht in ihre Nähe und lauscht.", 146, 16777215))
	_uState2Trans4:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_020", "Kehrt zu mir zurück, wenn Ihr verstanden habt, warum ich Euch auf diese Reise geschickt habe.", 147, 16777215))
	_uState2Trans4:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 1, 0))
	_uState2Trans4:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopHolyShrines', 1, 0))
	_uState2Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState2Trans4 = nil

-- TO STATE: label
_uState2Trans5 = GdsCreateTransition (_uState27, _uState2, "State_27", "State_2_T5", "Dialog")
	_uState2Trans5:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 1))
	_uState2Trans5:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_014PC", "Kann die Hand etwas für Euch tun?", 99, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_015", "Die Hand kann etwas für sich tun.", 164, 16777215))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 4))
	_uState2Trans5:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_016", "In all dem rauen Söldnerhandwerk, geht der Glaube und das Wissen um die Götter verloren.", 165, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_017", "Ich bitte Euch, reist zu den alten Schreinen der Götter uns lauscht den Stimmen dieser Orte.", 166, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_018", "Die Schreine findet Ihr in den Eisfängen, in der Wüste der tanzenden Sonne und im Eisenherzgebirge.", 167, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_019", "Ihr erkennt sie an dem Leuchten, dass sie umgibt. Geht in ihre Nähe und lauscht.", 168, 16777215))
	_uState2Trans5:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_020", "Kehrt zu mir zurück, wenn Ihr verstanden habt, warum ich Euch auf diese Reise geschickt habe.", 169, 16777215))
	_uState2Trans5:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 1, 0))
	_uState2Trans5:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopHolyShrines', 1, 0))
	_uState2Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState2Trans5 = nil

-- TO STATE: label
_uState2Trans6 = GdsCreateTransition (_uState33, _uState2, "State_33", "State_2_T6", "Dialog")
	_uState2Trans6:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 1))
	_uState2Trans6:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_014PC", "Kann die Hand etwas für Euch tun?", 99, 16777215))
	_uState2Trans6:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_015", "Die Hand kann etwas für sich tun.", 177, 16777215))
	_uState2Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 4))
	_uState2Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 4))
	_uState2Trans6:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_016", "In all dem rauen Söldnerhandwerk, geht der Glaube und das Wissen um die Götter verloren.", 178, 16777215))
	_uState2Trans6:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_017", "Ich bitte Euch, reist zu den alten Schreinen der Götter uns lauscht den Stimmen dieser Orte.", 179, 16777215))
	_uState2Trans6:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_018", "Die Schreine findet Ihr in den Eisfängen, in der Wüste der tanzenden Sonne und im Eisenherzgebirge.", 180, 16777215))
	_uState2Trans6:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_019", "Ihr erkennt sie an dem Leuchten, dass sie umgibt. Geht in ihre Nähe und lauscht.", 181, 16777215))
	_uState2Trans6:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_020", "Kehrt zu mir zurück, wenn Ihr verstanden habt, warum ich Euch auf diese Reise geschickt habe.", 182, 16777215))
	_uState2Trans6:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 1, 0))
	_uState2Trans6:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopHolyShrines', 1, 0))
	_uState2Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState2Trans6 = nil

-- TO STATE: label
_uState2Trans7 = GdsCreateTransition (_uState39, _uState2, "State_39", "State_2_T7", "Dialog")
	_uState2Trans7:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 1))
	_uState2Trans7:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_014PC", "Kann die Hand etwas für Euch tun?", 99, 16777215))
	_uState2Trans7:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_015", "Die Hand kann etwas für sich tun.", 190, 16777215))
	_uState2Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 4))
	_uState2Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 4))
	_uState2Trans7:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_016", "In all dem rauen Söldnerhandwerk, geht der Glaube und das Wissen um die Götter verloren.", 191, 16777215))
	_uState2Trans7:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_017", "Ich bitte Euch, reist zu den alten Schreinen der Götter uns lauscht den Stimmen dieser Orte.", 192, 16777215))
	_uState2Trans7:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_018", "Die Schreine findet Ihr in den Eisfängen, in der Wüste der tanzenden Sonne und im Eisenherzgebirge.", 193, 16777215))
	_uState2Trans7:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_019", "Ihr erkennt sie an dem Leuchten, dass sie umgibt. Geht in ihre Nähe und lauscht.", 194, 16777215))
	_uState2Trans7:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_020", "Kehrt zu mir zurück, wenn Ihr verstanden habt, warum ich Euch auf diese Reise geschickt habe.", 195, 16777215))
	_uState2Trans7:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 1, 0))
	_uState2Trans7:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopHolyShrines', 1, 0))
	_uState2Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState2Trans7 = nil

-- TO STATE: label
_uState2Trans8 = GdsCreateTransition (_uState47, _uState2, "State_47", "State_2_T8", "Dialog")
	_uState2Trans8:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 1))
	_uState2Trans8:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_014PC", "Kann die Hand etwas für Euch tun?", 99, 16777215))
	_uState2Trans8:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_015", "Die Hand kann etwas für sich tun.", 204, 16777215))
	_uState2Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 4))
	_uState2Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 4))
	_uState2Trans8:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_016", "In all dem rauen Söldnerhandwerk, geht der Glaube und das Wissen um die Götter verloren.", 205, 16777215))
	_uState2Trans8:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_017", "Ich bitte Euch, reist zu den alten Schreinen der Götter uns lauscht den Stimmen dieser Orte.", 206, 16777215))
	_uState2Trans8:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_018", "Die Schreine findet Ihr in den Eisfängen, in der Wüste der tanzenden Sonne und im Eisenherzgebirge.", 207, 16777215))
	_uState2Trans8:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_019", "Ihr erkennt sie an dem Leuchten, dass sie umgibt. Geht in ihre Nähe und lauscht.", 208, 16777215))
	_uState2Trans8:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_020", "Kehrt zu mir zurück, wenn Ihr verstanden habt, warum ich Euch auf diese Reise geschickt habe.", 209, 16777215))
	_uState2Trans8:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 1, 0))
	_uState2Trans8:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopHolyShrines', 1, 0))
	_uState2Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState2Trans8 = nil

-- TO STATE: label
_uState2Trans9 = GdsCreateTransition (_uState53, _uState2, "State_53", "State_2_T9", "Dialog")
	_uState2Trans9:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 1))
	_uState2Trans9:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_014PC", "Kann die Hand etwas für Euch tun?", 99, 16777215))
	_uState2Trans9:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_015", "Die Hand kann etwas für sich tun.", 217, 16777215))
	_uState2Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 4))
	_uState2Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 4))
	_uState2Trans9:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_016", "In all dem rauen Söldnerhandwerk, geht der Glaube und das Wissen um die Götter verloren.", 218, 16777215))
	_uState2Trans9:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_017", "Ich bitte Euch, reist zu den alten Schreinen der Götter uns lauscht den Stimmen dieser Orte.", 219, 16777215))
	_uState2Trans9:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_018", "Die Schreine findet Ihr in den Eisfängen, in der Wüste der tanzenden Sonne und im Eisenherzgebirge.", 220, 16777215))
	_uState2Trans9:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_019", "Ihr erkennt sie an dem Leuchten, dass sie umgibt. Geht in ihre Nähe und lauscht.", 221, 16777215))
	_uState2Trans9:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_020", "Kehrt zu mir zurück, wenn Ihr verstanden habt, warum ich Euch auf diese Reise geschickt habe.", 222, 16777215))
	_uState2Trans9:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 1, 0))
	_uState2Trans9:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopHolyShrines', 1, 0))
	_uState2Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState2Trans9 = nil

-- TO STATE: label
_uState2Trans10 = GdsCreateTransition (_uState59, _uState2, "State_59", "State_2_T10", "Dialog")
	_uState2Trans10:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 1))
	_uState2Trans10:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_014PC", "Kann die Hand etwas für Euch tun?", 99, 16777215))
	_uState2Trans10:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_015", "Die Hand kann etwas für sich tun.", 230, 16777215))
	_uState2Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 4))
	_uState2Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 4))
	_uState2Trans10:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_016", "In all dem rauen Söldnerhandwerk, geht der Glaube und das Wissen um die Götter verloren.", 231, 16777215))
	_uState2Trans10:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_017", "Ich bitte Euch, reist zu den alten Schreinen der Götter uns lauscht den Stimmen dieser Orte.", 232, 16777215))
	_uState2Trans10:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_018", "Die Schreine findet Ihr in den Eisfängen, in der Wüste der tanzenden Sonne und im Eisenherzgebirge.", 233, 16777215))
	_uState2Trans10:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_019", "Ihr erkennt sie an dem Leuchten, dass sie umgibt. Geht in ihre Nähe und lauscht.", 234, 16777215))
	_uState2Trans10:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_020", "Kehrt zu mir zurück, wenn Ihr verstanden habt, warum ich Euch auf diese Reise geschickt habe.", 235, 16777215))
	_uState2Trans10:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 1, 0))
	_uState2Trans10:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopHolyShrines', 1, 0))
	_uState2Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState2Trans10 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState2, _uState2, "State_2", "State_2", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState2, _uBeginState, "State_2", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Ylia', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(YLIA)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState4Trans1 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T1", "Dialog")
	_uState4Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 2))
	_uState4Trans1:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopTalkToYlia', 1))
	_uState4Trans1:AddAction (CScriptActionChoice("P333_DLG_YLIA_002PC", "Ich suche Euch im Auftrag der Hand des Drachen auf.", 1, 16777215))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 1, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState4Trans1 = nil

-- TO STATE: choice
_uState4Trans2 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T2", "Dialog")
	_uState4Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 2))
	_uState4Trans2:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 99) ))
	_uState4Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopBaseChapter_2', 99))
	_uState4Trans2:AddAction (CScriptActionChoice("P333_DLG_YLIA_014PC", "Kann die Hand etwas für Euch tun?", 2, 16777215))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 1, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState4Trans2 = nil

-- TO STATE: choice
_uState4Trans3 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T3", "Dialog")
	_uState4Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag3(YLIA)', 0, 2))
	_uState4Trans3:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopHolyShrinesVisited', 1))
	_uState4Trans3:AddAction (CScriptActionChoice("P333_DLG_YLIA_021PC", "Ich habe die Schreine aufgesucht.", 3, 16777215))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(YLIA)', 1, 4))
	_uState4Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState4Trans3 = nil

-- TO STATE: choice
_uState4Trans4 = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4_T4", "Dialog")
	_uState4Trans4:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 2))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 0, 4))
	_uState4Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(YLIA)', 1, 4))
	_uState4Trans4:AddAction (CScriptActionShowChoices())
	_uState4Trans4 = nil

-- TO STATE: choice
_uState4Trans5 = GdsCreateTransition (_uState2, _uState4, "State_2", "State_4_T5", "Dialog")
	_uState4Trans5:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopEvilProphet', 99) ))
	_uState4Trans5:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_001", "Elens Segen.", 100, 16777215))
	_uState4Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState4Trans5 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState4, _uState4, "State_4", "State_4", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState4, _uBeginState, "State_4", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Ylia', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(YLIA)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState7Trans1 = GdsCreateTransition (_uState4, _uState7, "State_4", "State_7_T1", "Dialog")
	_uState7Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 3))
	_uState7Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_021PC", "Ich habe die Schreine aufgesucht.", 99, 16777215))
	_uState7Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_022", "Und habt Ihr ihre Botschaft verstanden?", 121, 16777215))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 4))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 4))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(YLIA)', 0, 4))
	_uState7Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_023PC", "Die Götter sind nicht allmächtig, sie brauchen uns, wie wir sie brauchen.", 122, 16777215))
	_uState7Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_024", "Ja, wir haben ihnen ihre Gestalt gegeben und nur unser Glaube gibt ihnen die Kraft, wahre Götter zu sein. Die alten Überlieferungen sind falsch.", 123, 16777215))
	_uState7Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_025", "Deswegen sollten wir die Götter nie verleugnen, oder sie werden zu ziellosen Kräften, von Willkür und Trauer getrieben.", 124, 16777215))
	_uState7Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_026", "Möge das nie geschehen.", 125, 16777215))
	_uState7Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopHolyShrinesVisited', 2, 0))
	_uState7Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 2, 0))
	_uState7Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState7Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState7, _uState7, "State_7", "State_7", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState7, _uBeginState, "State_7", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Ylia', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(YLIA)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState10Trans1 = GdsCreateTransition (_uState2, _uState10, "State_2", "State_10_T1", "Dialog")
	_uState10Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopEvilProphetKilled', 99) ))
	_uState10Trans1:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopEvilProphet', 99) )
	_uState10Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_027", "Vernichtet den Propheten!", 126, 16777215))
	_uState10Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_028", "Je mehr der anderen Inkarnationen Ihr besiegt, um so schwächer wird er!", 127, 16777215))
	_uState10Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState10Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState10, _uState10, "State_10", "State_10", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState10, _uBeginState, "State_10", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Ylia', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(YLIA)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState12Trans1 = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12_T1", "Dialog")
	_uState12Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 2))
	_uState12Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 99) ))
	_uState12Trans1:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopBaseChapter_2', 99))
	_uState12Trans1:AddAction (CScriptActionChoice("P333_DLG_YLIA_014PC", "Kann die Hand etwas für Euch tun?", 1, 16777215))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 1, 4))
	_uState12Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState12Trans1 = nil

-- TO STATE: choice
_uState12Trans2 = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12_T2", "Dialog")
	_uState12Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 2))
	_uState12Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopHolyShrinesVisited', 1))
	_uState12Trans2:AddAction (CScriptActionChoice("P333_DLG_YLIA_021PC", "Ich habe die Schreine aufgesucht.", 2, 16777215))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 1, 4))
	_uState12Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState12Trans2 = nil

-- TO STATE: choice
_uState12Trans3 = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12_T3", "Dialog")
	_uState12Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 2))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 0, 4))
	_uState12Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(YLIA)', 1, 4))
	_uState12Trans3:AddAction (CScriptActionShowChoices())
	_uState12Trans3 = nil

-- TO STATE: choice
_uState12Trans4 = GdsCreateTransition (_uState10, _uState12, "State_10", "State_12_T4", "Dialog")
	_uState12Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 99) ))
	_uState12Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopBaseChapter_2', 99))
	_uState12Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState12Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState12, _uState12, "State_12", "State_12", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState12, _uBeginState, "State_12", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Ylia', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(YLIA)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState14Trans1 = GdsCreateTransition (_uState12, _uState14, "State_12", "State_14_T1", "Dialog")
	_uState14Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 2))
	_uState14Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_021PC", "Ich habe die Schreine aufgesucht.", 99, 16777215))
	_uState14Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_022", "Und habt Ihr ihre Botschaft verstanden?", 136, 16777215))
	_uState14Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 4))
	_uState14Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 4))
	_uState14Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_023PC", "Die Götter sind nicht allmächtig, sie brauchen uns, wie wir sie brauchen.", 137, 16777215))
	_uState14Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_024", "Ja, wir haben ihnen ihre Gestalt gegeben und nur unser Glaube gibt ihnen die Kraft, wahre Götter zu sein. Die alten Überlieferungen sind falsch.", 138, 16777215))
	_uState14Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_025", "Deswegen sollten wir die Götter nie verleugnen, oder sie werden zu ziellosen Kräften, von Willkür und Trauer getrieben.", 139, 16777215))
	_uState14Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_026", "Möge das nie geschehen.", 140, 16777215))
	_uState14Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopHolyShrinesVisited', 2, 0))
	_uState14Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 2, 0))
	_uState14Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState14Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState14, _uState14, "State_14", "State_14", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState14, _uBeginState, "State_14", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Ylia', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(YLIA)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState19Trans1 = GdsCreateTransition (_uState19, _uState19, "State_19", "State_19_T1", "Dialog")
	_uState19Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 2))
	_uState19Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 99) ))
	_uState19Trans1:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopBaseChapter_2', 99))
	_uState19Trans1:AddAction (CScriptActionChoice("P333_DLG_YLIA_014PC", "Kann die Hand etwas für Euch tun?", 1, 16777215))
	_uState19Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 1, 4))
	_uState19Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState19Trans1 = nil

-- TO STATE: choice
_uState19Trans2 = GdsCreateTransition (_uState19, _uState19, "State_19", "State_19_T2", "Dialog")
	_uState19Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 2))
	_uState19Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopHolyShrinesVisited', 1))
	_uState19Trans2:AddAction (CScriptActionChoice("P333_DLG_YLIA_021PC", "Ich habe die Schreine aufgesucht.", 2, 16777215))
	_uState19Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 1, 4))
	_uState19Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState19Trans2 = nil

-- TO STATE: choice
_uState19Trans3 = GdsCreateTransition (_uState19, _uState19, "State_19", "State_19_T3", "Dialog")
	_uState19Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 2))
	_uState19Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 0, 4))
	_uState19Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(YLIA)', 1, 4))
	_uState19Trans3:AddAction (CScriptActionShowChoices())
	_uState19Trans3 = nil

-- TO STATE: choice
_uState19Trans4 = GdsCreateTransition (_uState10, _uState19, "State_10", "State_19_T4", "Dialog")
	_uState19Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopHolyShrinesVisited', 1))
	_uState19Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 99) ), CScriptConditionQuestState('pl_Human', 'CoopBaseChapter_2', 99)) ))
	_uState19Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 1) ))
	_uState19Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState19Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState19, _uState19, "State_19", "State_19", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState19, _uBeginState, "State_19", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Ylia', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(YLIA)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState21Trans1 = GdsCreateTransition (_uState19, _uState21, "State_19", "State_21_T1", "Dialog")
	_uState21Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 2))
	_uState21Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_021PC", "Ich habe die Schreine aufgesucht.", 99, 16777215))
	_uState21Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_022", "Und habt Ihr ihre Botschaft verstanden?", 149, 16777215))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 4))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 4))
	_uState21Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_023PC", "Die Götter sind nicht allmächtig, sie brauchen uns, wie wir sie brauchen.", 150, 16777215))
	_uState21Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_024", "Ja, wir haben ihnen ihre Gestalt gegeben und nur unser Glaube gibt ihnen die Kraft, wahre Götter zu sein. Die alten Überlieferungen sind falsch.", 151, 16777215))
	_uState21Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_025", "Deswegen sollten wir die Götter nie verleugnen, oder sie werden zu ziellosen Kräften, von Willkür und Trauer getrieben.", 152, 16777215))
	_uState21Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_026", "Möge das nie geschehen.", 153, 16777215))
	_uState21Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopHolyShrinesVisited', 2, 0))
	_uState21Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 2, 0))
	_uState21Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState21Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState21, _uState21, "State_21", "State_21", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState21, _uBeginState, "State_21", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Ylia', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(YLIA)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: elseif
_uState25Trans1 = GdsCreateTransition (_uState2, _uState25, "State_2", "State_25_T1", "Dialog")
	_uState25Trans1:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopEvilProphetKilled', 1))
	_uState25Trans1:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopEvilProphet', 99) )
	_uState25Trans1:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopEvilProphetKilled', 99) )
	_uState25Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_055", "Der Prophet ist besiegt! Die Essenz des roten Gottes ist zerstreut!", 154, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_056PC", "Ist er ... zerstört?", 155, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_057", "Nein, es braucht mehr, um einen Gott zu vernichten!", 156, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_058", "Aber er wird lange brauchen, bis er genug Kraft gesammelt hat, sich einen neune Körper zu formen.", 157, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_059", "Der Kult wird sich zerstreuen. Vorerst haben wir Ruhe. Vorerst.", 158, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_060", "Ihr habt wieder einmal das Schicksal der Shaikan erfüllt ...", 159, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_061", "Eo hat Euch viel zu verdanken, ebenso wie dem Seelenträger.", 160, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_062", "Doch Ihr bleibt unerkannt, unbesungen.", 161, 16777215))
	_uState25Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_063", "Aber die Westwehr wird sich an Euch erinnern, Freund.", 162, 16777215))
	_uState25Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopEvilProphetKilled', 2, 0))
	_uState25Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseChapter_6', 2, 0))
	_uState25Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopMainQuests', 2, 0))
	_uState25Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState25Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState25, _uState25, "State_25", "State_25", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState25, _uBeginState, "State_25", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Ylia', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(YLIA)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState27Trans1 = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27_T1", "Dialog")
	_uState27Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 2))
	_uState27Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 99) ))
	_uState27Trans1:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopBaseChapter_2', 99))
	_uState27Trans1:AddAction (CScriptActionChoice("P333_DLG_YLIA_014PC", "Kann die Hand etwas für Euch tun?", 1, 16777215))
	_uState27Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 1, 4))
	_uState27Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState27Trans1 = nil

-- TO STATE: choice
_uState27Trans2 = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27_T2", "Dialog")
	_uState27Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 2))
	_uState27Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopHolyShrinesVisited', 1))
	_uState27Trans2:AddAction (CScriptActionChoice("P333_DLG_YLIA_021PC", "Ich habe die Schreine aufgesucht.", 2, 16777215))
	_uState27Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 1, 4))
	_uState27Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState27Trans2 = nil

-- TO STATE: choice
_uState27Trans3 = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27_T3", "Dialog")
	_uState27Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 2))
	_uState27Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 0, 4))
	_uState27Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(YLIA)', 1, 4))
	_uState27Trans3:AddAction (CScriptActionShowChoices())
	_uState27Trans3 = nil

-- TO STATE: choice
_uState27Trans4 = GdsCreateTransition (_uState25, _uState27, "State_25", "State_27_T4", "Dialog")
	_uState27Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 99) ))
	_uState27Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopBaseChapter_2', 99))
	_uState27Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogEnabled', 1, 4))
	_uState27Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogTypeMainQuest', 0, 4))
	_uState27Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogTypeSideQuest', 1, 4))
	_uState27Trans4:AddAction (CScriptActionSetDialog('Ylia', 1))
	_uState27Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState27Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState27, _uState27, "State_27", "State_27", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState27, _uBeginState, "State_27", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Ylia', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(YLIA)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState29Trans1 = GdsCreateTransition (_uState27, _uState29, "State_27", "State_29_T1", "Dialog")
	_uState29Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 2))
	_uState29Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_021PC", "Ich habe die Schreine aufgesucht.", 99, 16777215))
	_uState29Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_022", "Und habt Ihr ihre Botschaft verstanden?", 171, 16777215))
	_uState29Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 4))
	_uState29Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 4))
	_uState29Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_023PC", "Die Götter sind nicht allmächtig, sie brauchen uns, wie wir sie brauchen.", 172, 16777215))
	_uState29Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_024", "Ja, wir haben ihnen ihre Gestalt gegeben und nur unser Glaube gibt ihnen die Kraft, wahre Götter zu sein. Die alten Überlieferungen sind falsch.", 173, 16777215))
	_uState29Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_025", "Deswegen sollten wir die Götter nie verleugnen, oder sie werden zu ziellosen Kräften, von Willkür und Trauer getrieben.", 174, 16777215))
	_uState29Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_026", "Möge das nie geschehen.", 175, 16777215))
	_uState29Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopHolyShrinesVisited', 2, 0))
	_uState29Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 2, 0))
	_uState29Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState29Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState29, _uState29, "State_29", "State_29", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState29, _uBeginState, "State_29", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Ylia', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(YLIA)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState33Trans1 = GdsCreateTransition (_uState33, _uState33, "State_33", "State_33_T1", "Dialog")
	_uState33Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 2))
	_uState33Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 99) ))
	_uState33Trans1:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopBaseChapter_2', 99))
	_uState33Trans1:AddAction (CScriptActionChoice("P333_DLG_YLIA_014PC", "Kann die Hand etwas für Euch tun?", 1, 16777215))
	_uState33Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 1, 4))
	_uState33Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState33Trans1 = nil

-- TO STATE: choice
_uState33Trans2 = GdsCreateTransition (_uState33, _uState33, "State_33", "State_33_T2", "Dialog")
	_uState33Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 2))
	_uState33Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopHolyShrinesVisited', 1))
	_uState33Trans2:AddAction (CScriptActionChoice("P333_DLG_YLIA_021PC", "Ich habe die Schreine aufgesucht.", 2, 16777215))
	_uState33Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 1, 4))
	_uState33Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState33Trans2 = nil

-- TO STATE: choice
_uState33Trans3 = GdsCreateTransition (_uState33, _uState33, "State_33", "State_33_T3", "Dialog")
	_uState33Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 2))
	_uState33Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 0, 4))
	_uState33Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(YLIA)', 1, 4))
	_uState33Trans3:AddAction (CScriptActionShowChoices())
	_uState33Trans3 = nil

-- TO STATE: choice
_uState33Trans4 = GdsCreateTransition (_uState25, _uState33, "State_25", "State_33_T4", "Dialog")
	_uState33Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 1))
	_uState33Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 99) ), CScriptConditionQuestState('pl_Human', 'CoopBaseChapter_2', 99)) ))
	_uState33Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogEnabled', 1, 4))
	_uState33Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogTypeMainQuest', 0, 4))
	_uState33Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogTypeSideQuest', 1, 4))
	_uState33Trans4:AddAction (CScriptActionSetDialog('Ylia', 1))
	_uState33Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState33Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState33, _uState33, "State_33", "State_33", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState33, _uBeginState, "State_33", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Ylia', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(YLIA)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState35Trans1 = GdsCreateTransition (_uState33, _uState35, "State_33", "State_35_T1", "Dialog")
	_uState35Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 2))
	_uState35Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_021PC", "Ich habe die Schreine aufgesucht.", 99, 16777215))
	_uState35Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_022", "Und habt Ihr ihre Botschaft verstanden?", 184, 16777215))
	_uState35Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 4))
	_uState35Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 4))
	_uState35Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_023PC", "Die Götter sind nicht allmächtig, sie brauchen uns, wie wir sie brauchen.", 185, 16777215))
	_uState35Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_024", "Ja, wir haben ihnen ihre Gestalt gegeben und nur unser Glaube gibt ihnen die Kraft, wahre Götter zu sein. Die alten Überlieferungen sind falsch.", 186, 16777215))
	_uState35Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_025", "Deswegen sollten wir die Götter nie verleugnen, oder sie werden zu ziellosen Kräften, von Willkür und Trauer getrieben.", 187, 16777215))
	_uState35Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_026", "Möge das nie geschehen.", 188, 16777215))
	_uState35Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopHolyShrinesVisited', 2, 0))
	_uState35Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 2, 0))
	_uState35Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState35Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState35, _uState35, "State_35", "State_35", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState35, _uBeginState, "State_35", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Ylia', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(YLIA)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState39Trans1 = GdsCreateTransition (_uState39, _uState39, "State_39", "State_39_T1", "Dialog")
	_uState39Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 2))
	_uState39Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 99) ))
	_uState39Trans1:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopBaseChapter_2', 99))
	_uState39Trans1:AddAction (CScriptActionChoice("P333_DLG_YLIA_014PC", "Kann die Hand etwas für Euch tun?", 1, 16777215))
	_uState39Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 1, 4))
	_uState39Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState39Trans1 = nil

-- TO STATE: choice
_uState39Trans2 = GdsCreateTransition (_uState39, _uState39, "State_39", "State_39_T2", "Dialog")
	_uState39Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 2))
	_uState39Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopHolyShrinesVisited', 1))
	_uState39Trans2:AddAction (CScriptActionChoice("P333_DLG_YLIA_021PC", "Ich habe die Schreine aufgesucht.", 2, 16777215))
	_uState39Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 1, 4))
	_uState39Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState39Trans2 = nil

-- TO STATE: choice
_uState39Trans3 = GdsCreateTransition (_uState39, _uState39, "State_39", "State_39_T3", "Dialog")
	_uState39Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 2))
	_uState39Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 0, 4))
	_uState39Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(YLIA)', 1, 4))
	_uState39Trans3:AddAction (CScriptActionShowChoices())
	_uState39Trans3 = nil

-- TO STATE: choice
_uState39Trans4 = GdsCreateTransition (_uState25, _uState39, "State_25", "State_39_T4", "Dialog")
	_uState39Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopHolyShrinesVisited', 1))
	_uState39Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 99) ), CScriptConditionQuestState('pl_Human', 'CoopBaseChapter_2', 99)) ))
	_uState39Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 1) ))
	_uState39Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogEnabled', 1, 4))
	_uState39Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogTypeMainQuest', 0, 4))
	_uState39Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogTypeSideQuest', 1, 4))
	_uState39Trans4:AddAction (CScriptActionSetDialog('Ylia', 1))
	_uState39Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState39Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState39, _uState39, "State_39", "State_39", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState39, _uBeginState, "State_39", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Ylia', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(YLIA)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState41Trans1 = GdsCreateTransition (_uState39, _uState41, "State_39", "State_41_T1", "Dialog")
	_uState41Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 2))
	_uState41Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_021PC", "Ich habe die Schreine aufgesucht.", 99, 16777215))
	_uState41Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_022", "Und habt Ihr ihre Botschaft verstanden?", 197, 16777215))
	_uState41Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 4))
	_uState41Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 4))
	_uState41Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_023PC", "Die Götter sind nicht allmächtig, sie brauchen uns, wie wir sie brauchen.", 198, 16777215))
	_uState41Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_024", "Ja, wir haben ihnen ihre Gestalt gegeben und nur unser Glaube gibt ihnen die Kraft, wahre Götter zu sein. Die alten Überlieferungen sind falsch.", 199, 16777215))
	_uState41Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_025", "Deswegen sollten wir die Götter nie verleugnen, oder sie werden zu ziellosen Kräften, von Willkür und Trauer getrieben.", 200, 16777215))
	_uState41Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_026", "Möge das nie geschehen.", 201, 16777215))
	_uState41Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopHolyShrinesVisited', 2, 0))
	_uState41Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 2, 0))
	_uState41Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState41Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState41, _uState41, "State_41", "State_41", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState41, _uBeginState, "State_41", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Ylia', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(YLIA)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: else
_uState45Trans1 = GdsCreateTransition (_uState2, _uState45, "State_2", "State_45_T1", "Dialog")
	_uState45Trans1:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopEvilProphet', 99) )
	_uState45Trans1:AddCondition ( CScriptConditionQuestState('pl_Human', 'CoopEvilProphetKilled', 99) )
	_uState45Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopEvilProphetKilled', 1) ))
	_uState45Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_103", "Ich grüße die Hand des Drachen.", 202, 16777215))
	_uState45Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState45Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState45, _uState45, "State_45", "State_45", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState45, _uBeginState, "State_45", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Ylia', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(YLIA)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState47Trans1 = GdsCreateTransition (_uState47, _uState47, "State_47", "State_47_T1", "Dialog")
	_uState47Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 2))
	_uState47Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 99) ))
	_uState47Trans1:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopBaseChapter_2', 99))
	_uState47Trans1:AddAction (CScriptActionChoice("P333_DLG_YLIA_014PC", "Kann die Hand etwas für Euch tun?", 1, 16777215))
	_uState47Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 1, 4))
	_uState47Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState47Trans1 = nil

-- TO STATE: choice
_uState47Trans2 = GdsCreateTransition (_uState47, _uState47, "State_47", "State_47_T2", "Dialog")
	_uState47Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 2))
	_uState47Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopHolyShrinesVisited', 1))
	_uState47Trans2:AddAction (CScriptActionChoice("P333_DLG_YLIA_021PC", "Ich habe die Schreine aufgesucht.", 2, 16777215))
	_uState47Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 1, 4))
	_uState47Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState47Trans2 = nil

-- TO STATE: choice
_uState47Trans3 = GdsCreateTransition (_uState47, _uState47, "State_47", "State_47_T3", "Dialog")
	_uState47Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 2))
	_uState47Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 0, 4))
	_uState47Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(YLIA)', 1, 4))
	_uState47Trans3:AddAction (CScriptActionShowChoices())
	_uState47Trans3 = nil

-- TO STATE: choice
_uState47Trans4 = GdsCreateTransition (_uState45, _uState47, "State_45", "State_47_T4", "Dialog")
	_uState47Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 99) ))
	_uState47Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopBaseChapter_2', 99))
	_uState47Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogEnabled', 1, 4))
	_uState47Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogTypeMainQuest', 0, 4))
	_uState47Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogTypeSideQuest', 1, 4))
	_uState47Trans4:AddAction (CScriptActionSetDialog('Ylia', 1))
	_uState47Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState47Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState47, _uState47, "State_47", "State_47", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState47, _uBeginState, "State_47", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Ylia', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(YLIA)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState49Trans1 = GdsCreateTransition (_uState47, _uState49, "State_47", "State_49_T1", "Dialog")
	_uState49Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 2))
	_uState49Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_021PC", "Ich habe die Schreine aufgesucht.", 99, 16777215))
	_uState49Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_022", "Und habt Ihr ihre Botschaft verstanden?", 211, 16777215))
	_uState49Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 4))
	_uState49Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 4))
	_uState49Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_023PC", "Die Götter sind nicht allmächtig, sie brauchen uns, wie wir sie brauchen.", 212, 16777215))
	_uState49Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_024", "Ja, wir haben ihnen ihre Gestalt gegeben und nur unser Glaube gibt ihnen die Kraft, wahre Götter zu sein. Die alten Überlieferungen sind falsch.", 213, 16777215))
	_uState49Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_025", "Deswegen sollten wir die Götter nie verleugnen, oder sie werden zu ziellosen Kräften, von Willkür und Trauer getrieben.", 214, 16777215))
	_uState49Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_026", "Möge das nie geschehen.", 215, 16777215))
	_uState49Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopHolyShrinesVisited', 2, 0))
	_uState49Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 2, 0))
	_uState49Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState49Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState49, _uState49, "State_49", "State_49", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState49, _uBeginState, "State_49", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Ylia', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(YLIA)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState53Trans1 = GdsCreateTransition (_uState53, _uState53, "State_53", "State_53_T1", "Dialog")
	_uState53Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 2))
	_uState53Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 99) ))
	_uState53Trans1:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopBaseChapter_2', 99))
	_uState53Trans1:AddAction (CScriptActionChoice("P333_DLG_YLIA_014PC", "Kann die Hand etwas für Euch tun?", 1, 16777215))
	_uState53Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 1, 4))
	_uState53Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState53Trans1 = nil

-- TO STATE: choice
_uState53Trans2 = GdsCreateTransition (_uState53, _uState53, "State_53", "State_53_T2", "Dialog")
	_uState53Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 2))
	_uState53Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopHolyShrinesVisited', 1))
	_uState53Trans2:AddAction (CScriptActionChoice("P333_DLG_YLIA_021PC", "Ich habe die Schreine aufgesucht.", 2, 16777215))
	_uState53Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 1, 4))
	_uState53Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState53Trans2 = nil

-- TO STATE: choice
_uState53Trans3 = GdsCreateTransition (_uState53, _uState53, "State_53", "State_53_T3", "Dialog")
	_uState53Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 2))
	_uState53Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 0, 4))
	_uState53Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(YLIA)', 1, 4))
	_uState53Trans3:AddAction (CScriptActionShowChoices())
	_uState53Trans3 = nil

-- TO STATE: choice
_uState53Trans4 = GdsCreateTransition (_uState45, _uState53, "State_45", "State_53_T4", "Dialog")
	_uState53Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 1))
	_uState53Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 99) ), CScriptConditionQuestState('pl_Human', 'CoopBaseChapter_2', 99)) ))
	_uState53Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogEnabled', 1, 4))
	_uState53Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogTypeMainQuest', 0, 4))
	_uState53Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogTypeSideQuest', 1, 4))
	_uState53Trans4:AddAction (CScriptActionSetDialog('Ylia', 1))
	_uState53Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState53Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState53, _uState53, "State_53", "State_53", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState53, _uBeginState, "State_53", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Ylia', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(YLIA)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState55Trans1 = GdsCreateTransition (_uState53, _uState55, "State_53", "State_55_T1", "Dialog")
	_uState55Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 2))
	_uState55Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_021PC", "Ich habe die Schreine aufgesucht.", 99, 16777215))
	_uState55Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_022", "Und habt Ihr ihre Botschaft verstanden?", 224, 16777215))
	_uState55Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 4))
	_uState55Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 4))
	_uState55Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_023PC", "Die Götter sind nicht allmächtig, sie brauchen uns, wie wir sie brauchen.", 225, 16777215))
	_uState55Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_024", "Ja, wir haben ihnen ihre Gestalt gegeben und nur unser Glaube gibt ihnen die Kraft, wahre Götter zu sein. Die alten Überlieferungen sind falsch.", 226, 16777215))
	_uState55Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_025", "Deswegen sollten wir die Götter nie verleugnen, oder sie werden zu ziellosen Kräften, von Willkür und Trauer getrieben.", 227, 16777215))
	_uState55Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_026", "Möge das nie geschehen.", 228, 16777215))
	_uState55Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopHolyShrinesVisited', 2, 0))
	_uState55Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 2, 0))
	_uState55Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState55Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState55, _uState55, "State_55", "State_55", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState55, _uBeginState, "State_55", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Ylia', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(YLIA)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: choice
_uState59Trans1 = GdsCreateTransition (_uState59, _uState59, "State_59", "State_59_T1", "Dialog")
	_uState59Trans1:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 2))
	_uState59Trans1:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 99) ))
	_uState59Trans1:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopBaseChapter_2', 99))
	_uState59Trans1:AddAction (CScriptActionChoice("P333_DLG_YLIA_014PC", "Kann die Hand etwas für Euch tun?", 1, 16777215))
	_uState59Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 1, 4))
	_uState59Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState59Trans1 = nil

-- TO STATE: choice
_uState59Trans2 = GdsCreateTransition (_uState59, _uState59, "State_59", "State_59_T2", "Dialog")
	_uState59Trans2:AddCondition (CScriptConditionValue('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 2))
	_uState59Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopHolyShrinesVisited', 1))
	_uState59Trans2:AddAction (CScriptActionChoice("P333_DLG_YLIA_021PC", "Ich habe die Schreine aufgesucht.", 2, 16777215))
	_uState59Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 1, 4))
	_uState59Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState59Trans2 = nil

-- TO STATE: choice
_uState59Trans3 = GdsCreateTransition (_uState59, _uState59, "State_59", "State_59_T3", "Dialog")
	_uState59Trans3:AddCondition (CScriptConditionValue('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 2))
	_uState59Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 0, 4))
	_uState59Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesCameraFlag(YLIA)', 1, 4))
	_uState59Trans3:AddAction (CScriptActionShowChoices())
	_uState59Trans3 = nil

-- TO STATE: choice
_uState59Trans4 = GdsCreateTransition (_uState45, _uState59, "State_45", "State_59_T4", "Dialog")
	_uState59Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopHolyShrinesVisited', 1))
	_uState59Trans4:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 99) ), CScriptConditionQuestState('pl_Human', 'CoopBaseChapter_2', 99)) ))
	_uState59Trans4:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 1) ))
	_uState59Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogEnabled', 1, 4))
	_uState59Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogTypeMainQuest', 0, 4))
	_uState59Trans4:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogTypeSideQuest', 1, 4))
	_uState59Trans4:AddAction (CScriptActionSetDialog('Ylia', 1))
	_uState59Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState59Trans4 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState59, _uState59, "State_59", "State_59", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState59, _uBeginState, "State_59", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Ylia', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(YLIA)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: showchoice
_uState61Trans1 = GdsCreateTransition (_uState59, _uState61, "State_59", "State_61_T1", "Dialog")
	_uState61Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 2))
	_uState61Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_021PC", "Ich habe die Schreine aufgesucht.", 99, 16777215))
	_uState61Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_022", "Und habt Ihr ihre Botschaft verstanden?", 237, 16777215))
	_uState61Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 4))
	_uState61Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 4))
	_uState61Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_023PC", "Die Götter sind nicht allmächtig, sie brauchen uns, wie wir sie brauchen.", 238, 16777215))
	_uState61Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_024", "Ja, wir haben ihnen ihre Gestalt gegeben und nur unser Glaube gibt ihnen die Kraft, wahre Götter zu sein. Die alten Überlieferungen sind falsch.", 239, 16777215))
	_uState61Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_025", "Deswegen sollten wir die Götter nie verleugnen, oder sie werden zu ziellosen Kräften, von Willkür und Trauer getrieben.", 240, 16777215))
	_uState61Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_026", "Möge das nie geschehen.", 241, 16777215))
	_uState61Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopHolyShrinesVisited', 2, 0))
	_uState61Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 2, 0))
	_uState61Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState61Trans1 = nil

-- TO SELF: User chose 'Abort Dialog' (-1)
_uAbort = GdsCreateTransition (_uState61, _uState61, "State_61", "State_61", "Dialog")
	_uAbort:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 4294967295))
	_uAbort:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uAbort = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState61, _uBeginState, "State_61", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Ylia', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(YLIA)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState65Trans1 = GdsCreateTransition (_uState4, _uState65, "State_4", "State_65_T1", "Dialog")
	_uState65Trans1:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 1))
	_uState65Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_002PC", "Ich suche Euch im Auftrag der Hand des Drachen auf.", 99, 16777215))
	_uState65Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_003", "Ihr kommt, weil etwas sich erhebt ...", 102, 16777215))
	_uState65Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag1(YLIA)', 0, 4))
	_uState65Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag2(YLIA)', 0, 4))
	_uState65Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogChoiceOneTimeFlag3(YLIA)', 0, 4))
	_uState65Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_004PC", "Der rote Gott. Ihr wisst davon?", 103, 16777215))
	_uState65Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_005", "Meine Visionen sind undeutlich. Ich spüre ein neues Wesen in dieser Welt, ein mächtiges Wesen. Aber in meinen Träumen sind da nur Menschen. Fünf Menschen in Masken.", 104, 16777215))
	_uState65Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_006", "Einer von ihnen ist der, welchen Ihr den Propheten nennt.", 105, 16777215))
	_uState65Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P333_DLG_YLIA_007PC", "Sein roter Wein füllt die Kelche der Treuesten ...", 106, 16777215))
	_uState65Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_008", "Er hat sich inkarniert! Noch reicht seine Kraft nicht, um wieder Form anzunehmen. Aber der Zauber des Kults hat ihm ermöglicht sich in den Führern des Kults zu manifestieren!", 107, 16777215))
	_uState65Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_009", "Es sind fünf, aber ich glaube der Prophet alleine trägt die wahre Stärke des Gottes in sich.", 108, 16777215))
	_uState65Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_010", "Es wird schwer für Euch sein, ihn zu besiegen. Aber wenn Ihr eine der anderen Inkarnationen, also einen der vier anderen Führer des Kultes, vernichtet, wird der Prophet schwächer werden.", 109, 16777215))
	_uState65Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_011", "Ihr müsst wissen, wie viele der Inkarnationen Ihr vernichten wollt, bis Ihr dem Propheten gegenüber tretet. Je weniger, umso stärker wird er sein.", 110, 16777215))
	_uState65Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_012", "Die Inkarnationen befinden sich im Kristallwald, der gläsernen Ebene, der versunkenen Stadt und auf dem Neunschattenberg.", 111, 16777215))
	_uState65Trans1:AddAction (CScriptActionSay("Ylia", "P333_DLG_YLIA_013", "Der Prophet selbst ist im Krater des gefallenen Sterns. Er trägt die Essenz des Gottes, wenn er besiegt wird, fallen auch die anderen!", 112, 16777215))
	_uState65Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopTalkToYlia', 2, 0))
	_uState65Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseChapter_5', 2, 0))
	_uState65Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopBaseChapter_6', 1, 0))
	_uState65Trans1:AddAction (CScriptActionSetQuestState('pl_Human', 'CoopEvilProphet', 1, 0))
	_uState65Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uState65Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(YLIA)', 1, 4))
	_uState65Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState65Trans1 = nil

-- TO STATE: endconversation
_uState65Trans2 = GdsCreateTransition (_uState7, _uState65, "State_7", "State_65_T2", "Dialog")
	_uState65Trans2:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopEvilProphetKilled', 2))
	_uState65Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uState65Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(YLIA)', 1, 4))
	_uState65Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState65Trans2 = nil

-- TO STATE: endconversation
_uState65Trans3 = GdsCreateTransition (_uState7, _uState65, "State_7", "State_65_T3", "Dialog")
	_uState65Trans3:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopEvilProphetKilled', 2) ))
	_uState65Trans3:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uState65Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(YLIA)', 1, 4))
	_uState65Trans3:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState65Trans3 = nil

-- TO STATE: endconversation
_uState65Trans4 = GdsCreateTransition (_uState14, _uState65, "State_14", "State_65_T4", "Dialog")
	_uState65Trans4:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopEvilProphetKilled', 2))
	_uState65Trans4:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uState65Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(YLIA)', 1, 4))
	_uState65Trans4:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState65Trans4 = nil

-- TO STATE: endconversation
_uState65Trans5 = GdsCreateTransition (_uState14, _uState65, "State_14", "State_65_T5", "Dialog")
	_uState65Trans5:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopEvilProphetKilled', 2) ))
	_uState65Trans5:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uState65Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(YLIA)', 1, 4))
	_uState65Trans5:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState65Trans5 = nil

-- TO STATE: endconversation
_uState65Trans6 = GdsCreateTransition (_uState10, _uState65, "State_10", "State_65_T6", "Dialog")
	_uState65Trans6:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 1))
	_uState65Trans6:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 99) ), CScriptConditionQuestState('pl_Human', 'CoopBaseChapter_2', 99)) ))
	_uState65Trans6:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uState65Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(YLIA)', 1, 4))
	_uState65Trans6:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState65Trans6 = nil

-- TO STATE: endconversation
_uState65Trans7 = GdsCreateTransition (_uState21, _uState65, "State_21", "State_65_T7", "Dialog")
	_uState65Trans7:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopEvilProphetKilled', 2))
	_uState65Trans7:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uState65Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(YLIA)', 1, 4))
	_uState65Trans7:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState65Trans7 = nil

-- TO STATE: endconversation
_uState65Trans8 = GdsCreateTransition (_uState21, _uState65, "State_21", "State_65_T8", "Dialog")
	_uState65Trans8:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopEvilProphetKilled', 2) ))
	_uState65Trans8:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uState65Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(YLIA)', 1, 4))
	_uState65Trans8:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState65Trans8 = nil

-- TO STATE: endconversation
_uState65Trans9 = GdsCreateTransition (_uState10, _uState65, "State_10", "State_65_T9", "Dialog")
	_uState65Trans9:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 99) ), CScriptConditionQuestState('pl_Human', 'CoopBaseChapter_2', 99)) ))
	_uState65Trans9:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 1) ))
	_uState65Trans9:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopHolyShrinesVisited', 1) ))
	_uState65Trans9:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uState65Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(YLIA)', 1, 4))
	_uState65Trans9:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState65Trans9 = nil

-- TO STATE: endconversation
_uState65Trans10 = GdsCreateTransition (_uState29, _uState65, "State_29", "State_65_T10", "Dialog")
	_uState65Trans10:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopEvilProphetKilled', 2))
	_uState65Trans10:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uState65Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(YLIA)', 1, 4))
	_uState65Trans10:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState65Trans10 = nil

-- TO STATE: endconversation
_uState65Trans11 = GdsCreateTransition (_uState29, _uState65, "State_29", "State_65_T11", "Dialog")
	_uState65Trans11:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopEvilProphetKilled', 2) ))
	_uState65Trans11:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uState65Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(YLIA)', 1, 4))
	_uState65Trans11:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState65Trans11 = nil

-- TO STATE: endconversation
_uState65Trans12 = GdsCreateTransition (_uState35, _uState65, "State_35", "State_65_T12", "Dialog")
	_uState65Trans12:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopEvilProphetKilled', 2))
	_uState65Trans12:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uState65Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(YLIA)', 1, 4))
	_uState65Trans12:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState65Trans12 = nil

-- TO STATE: endconversation
_uState65Trans13 = GdsCreateTransition (_uState35, _uState65, "State_35", "State_65_T13", "Dialog")
	_uState65Trans13:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopEvilProphetKilled', 2) ))
	_uState65Trans13:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uState65Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag13(YLIA)', 1, 4))
	_uState65Trans13:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState65Trans13 = nil

-- TO STATE: endconversation
_uState65Trans14 = GdsCreateTransition (_uState41, _uState65, "State_41", "State_65_T14", "Dialog")
	_uState65Trans14:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopEvilProphetKilled', 2))
	_uState65Trans14:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uState65Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag14(YLIA)', 1, 4))
	_uState65Trans14:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState65Trans14 = nil

-- TO STATE: endconversation
_uState65Trans15 = GdsCreateTransition (_uState41, _uState65, "State_41", "State_65_T15", "Dialog")
	_uState65Trans15:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopEvilProphetKilled', 2) ))
	_uState65Trans15:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uState65Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag15(YLIA)', 1, 4))
	_uState65Trans15:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState65Trans15 = nil

-- TO STATE: endconversation
_uState65Trans16 = GdsCreateTransition (_uState25, _uState65, "State_25", "State_65_T16", "Dialog")
	_uState65Trans16:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 99) ), CScriptConditionQuestState('pl_Human', 'CoopBaseChapter_2', 99)) ))
	_uState65Trans16:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 1) ))
	_uState65Trans16:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopHolyShrinesVisited', 1) ))
	_uState65Trans16:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogEnabled', 0, 4))
	_uState65Trans16:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogTypeMainQuest', 0, 4))
	_uState65Trans16:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogTypeSideQuest', 0, 4))
	_uState65Trans16:AddAction (CScriptActionDialogEnable('Ylia', 0))
	_uState65Trans16:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uState65Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag16(YLIA)', 1, 4))
	_uState65Trans16:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState65Trans16 = nil

-- TO STATE: endconversation
_uState65Trans17 = GdsCreateTransition (_uState49, _uState65, "State_49", "State_65_T17", "Dialog")
	_uState65Trans17:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopEvilProphetKilled', 2))
	_uState65Trans17:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uState65Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag17(YLIA)', 1, 4))
	_uState65Trans17:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState65Trans17 = nil

-- TO STATE: endconversation
_uState65Trans18 = GdsCreateTransition (_uState49, _uState65, "State_49", "State_65_T18", "Dialog")
	_uState65Trans18:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopEvilProphetKilled', 2) ))
	_uState65Trans18:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uState65Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag18(YLIA)', 1, 4))
	_uState65Trans18:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState65Trans18 = nil

-- TO STATE: endconversation
_uState65Trans19 = GdsCreateTransition (_uState55, _uState65, "State_55", "State_65_T19", "Dialog")
	_uState65Trans19:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopEvilProphetKilled', 2))
	_uState65Trans19:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uState65Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag19(YLIA)', 1, 4))
	_uState65Trans19:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState65Trans19 = nil

-- TO STATE: endconversation
_uState65Trans20 = GdsCreateTransition (_uState55, _uState65, "State_55", "State_65_T20", "Dialog")
	_uState65Trans20:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopEvilProphetKilled', 2) ))
	_uState65Trans20:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uState65Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag20(YLIA)', 1, 4))
	_uState65Trans20:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState65Trans20 = nil

-- TO STATE: endconversation
_uState65Trans21 = GdsCreateTransition (_uState61, _uState65, "State_61", "State_65_T21", "Dialog")
	_uState65Trans21:AddCondition (CScriptConditionQuestState('pl_Human', 'CoopEvilProphetKilled', 2))
	_uState65Trans21:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uState65Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag21(YLIA)', 1, 4))
	_uState65Trans21:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState65Trans21 = nil

-- TO STATE: endconversation
_uState65Trans22 = GdsCreateTransition (_uState61, _uState65, "State_61", "State_65_T22", "Dialog")
	_uState65Trans22:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopEvilProphetKilled', 2) ))
	_uState65Trans22:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uState65Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag22(YLIA)', 1, 4))
	_uState65Trans22:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState65Trans22 = nil

-- TO STATE: endconversation
_uState65Trans23 = GdsCreateTransition (_uState45, _uState65, "State_45", "State_65_T23", "Dialog")
	_uState65Trans23:AddCondition (GdsNegateCondition( CScriptConditionAND(GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 99) ), CScriptConditionQuestState('pl_Human', 'CoopBaseChapter_2', 99)) ))
	_uState65Trans23:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopBaseLoreOfTheGods', 1) ))
	_uState65Trans23:AddCondition (GdsNegateCondition( CScriptConditionQuestState('pl_Human', 'CoopHolyShrinesVisited', 1) ))
	_uState65Trans23:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogEnabled', 0, 4))
	_uState65Trans23:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogTypeMainQuest', 0, 4))
	_uState65Trans23:AddAction (CScriptActionValueModify('pl_Human', 'af_P333_YliaDialogTypeSideQuest', 0, 4))
	_uState65Trans23:AddAction (CScriptActionDialogEnable('Ylia', 0))
	_uState65Trans23:AddAction (CScriptActionDialogRequestEnd("pl_Human", "Ylia"))
	_uState65Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag23(YLIA)', 1, 4))
	_uState65Trans23:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(YLIA)', 1, 4))
	_uState65Trans23 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState65, _uState65, "State_65", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(YLIA)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(YLIA)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(YLIA)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState65, _uState65, "State_65", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(YLIA)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(YLIA)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(YLIA)', 1, 4))
	_uEndActions2 = nil

-- TO SELF: EndConversation Actions #3
_uEndActions3 = GdsCreateTransition (_uState65, _uState65, "State_65", "EndActions_3", "Dialog")
	_uEndActions3:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag3(YLIA)', 1, 2))
	_uEndActions3:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag3(YLIA)', 0, 4))
	_uEndActions3:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(YLIA)', 1, 4))
	_uEndActions3 = nil

-- TO SELF: EndConversation Actions #4
_uEndActions4 = GdsCreateTransition (_uState65, _uState65, "State_65", "EndActions_4", "Dialog")
	_uEndActions4:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag4(YLIA)', 1, 2))
	_uEndActions4:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag4(YLIA)', 0, 4))
	_uEndActions4:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(YLIA)', 1, 4))
	_uEndActions4 = nil

-- TO SELF: EndConversation Actions #5
_uEndActions5 = GdsCreateTransition (_uState65, _uState65, "State_65", "EndActions_5", "Dialog")
	_uEndActions5:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag5(YLIA)', 1, 2))
	_uEndActions5:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag5(YLIA)', 0, 4))
	_uEndActions5:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(YLIA)', 1, 4))
	_uEndActions5 = nil

-- TO SELF: EndConversation Actions #6
_uEndActions6 = GdsCreateTransition (_uState65, _uState65, "State_65", "EndActions_6", "Dialog")
	_uEndActions6:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag6(YLIA)', 1, 2))
	_uEndActions6:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag6(YLIA)', 0, 4))
	_uEndActions6:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(YLIA)', 1, 4))
	_uEndActions6 = nil

-- TO SELF: EndConversation Actions #7
_uEndActions7 = GdsCreateTransition (_uState65, _uState65, "State_65", "EndActions_7", "Dialog")
	_uEndActions7:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag7(YLIA)', 1, 2))
	_uEndActions7:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag7(YLIA)', 0, 4))
	_uEndActions7:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(YLIA)', 1, 4))
	_uEndActions7 = nil

-- TO SELF: EndConversation Actions #8
_uEndActions8 = GdsCreateTransition (_uState65, _uState65, "State_65", "EndActions_8", "Dialog")
	_uEndActions8:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag8(YLIA)', 1, 2))
	_uEndActions8:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag8(YLIA)', 0, 4))
	_uEndActions8:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(YLIA)', 1, 4))
	_uEndActions8 = nil

-- TO SELF: EndConversation Actions #9
_uEndActions9 = GdsCreateTransition (_uState65, _uState65, "State_65", "EndActions_9", "Dialog")
	_uEndActions9:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag9(YLIA)', 1, 2))
	_uEndActions9:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag9(YLIA)', 0, 4))
	_uEndActions9:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(YLIA)', 1, 4))
	_uEndActions9 = nil

-- TO SELF: EndConversation Actions #10
_uEndActions10 = GdsCreateTransition (_uState65, _uState65, "State_65", "EndActions_10", "Dialog")
	_uEndActions10:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag10(YLIA)', 1, 2))
	_uEndActions10:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag10(YLIA)', 0, 4))
	_uEndActions10:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(YLIA)', 1, 4))
	_uEndActions10 = nil

-- TO SELF: EndConversation Actions #11
_uEndActions11 = GdsCreateTransition (_uState65, _uState65, "State_65", "EndActions_11", "Dialog")
	_uEndActions11:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag11(YLIA)', 1, 2))
	_uEndActions11:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag11(YLIA)', 0, 4))
	_uEndActions11:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(YLIA)', 1, 4))
	_uEndActions11 = nil

-- TO SELF: EndConversation Actions #12
_uEndActions12 = GdsCreateTransition (_uState65, _uState65, "State_65", "EndActions_12", "Dialog")
	_uEndActions12:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag12(YLIA)', 1, 2))
	_uEndActions12:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag12(YLIA)', 0, 4))
	_uEndActions12:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(YLIA)', 1, 4))
	_uEndActions12 = nil

-- TO SELF: EndConversation Actions #13
_uEndActions13 = GdsCreateTransition (_uState65, _uState65, "State_65", "EndActions_13", "Dialog")
	_uEndActions13:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag13(YLIA)', 1, 2))
	_uEndActions13:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag13(YLIA)', 0, 4))
	_uEndActions13:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(YLIA)', 1, 4))
	_uEndActions13 = nil

-- TO SELF: EndConversation Actions #14
_uEndActions14 = GdsCreateTransition (_uState65, _uState65, "State_65", "EndActions_14", "Dialog")
	_uEndActions14:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag14(YLIA)', 1, 2))
	_uEndActions14:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag14(YLIA)', 0, 4))
	_uEndActions14:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(YLIA)', 1, 4))
	_uEndActions14 = nil

-- TO SELF: EndConversation Actions #15
_uEndActions15 = GdsCreateTransition (_uState65, _uState65, "State_65", "EndActions_15", "Dialog")
	_uEndActions15:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag15(YLIA)', 1, 2))
	_uEndActions15:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag15(YLIA)', 0, 4))
	_uEndActions15:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(YLIA)', 1, 4))
	_uEndActions15 = nil

-- TO SELF: EndConversation Actions #16
_uEndActions16 = GdsCreateTransition (_uState65, _uState65, "State_65", "EndActions_16", "Dialog")
	_uEndActions16:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag16(YLIA)', 1, 2))
	_uEndActions16:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uEndActions16:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag16(YLIA)', 0, 4))
	_uEndActions16:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(YLIA)', 1, 4))
	_uEndActions16 = nil

-- TO SELF: EndConversation Actions #17
_uEndActions17 = GdsCreateTransition (_uState65, _uState65, "State_65", "EndActions_17", "Dialog")
	_uEndActions17:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag17(YLIA)', 1, 2))
	_uEndActions17:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uEndActions17:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag17(YLIA)', 0, 4))
	_uEndActions17:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(YLIA)', 1, 4))
	_uEndActions17 = nil

-- TO SELF: EndConversation Actions #18
_uEndActions18 = GdsCreateTransition (_uState65, _uState65, "State_65", "EndActions_18", "Dialog")
	_uEndActions18:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag18(YLIA)', 1, 2))
	_uEndActions18:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uEndActions18:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag18(YLIA)', 0, 4))
	_uEndActions18:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(YLIA)', 1, 4))
	_uEndActions18 = nil

-- TO SELF: EndConversation Actions #19
_uEndActions19 = GdsCreateTransition (_uState65, _uState65, "State_65", "EndActions_19", "Dialog")
	_uEndActions19:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag19(YLIA)', 1, 2))
	_uEndActions19:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uEndActions19:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag19(YLIA)', 0, 4))
	_uEndActions19:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(YLIA)', 1, 4))
	_uEndActions19 = nil

-- TO SELF: EndConversation Actions #20
_uEndActions20 = GdsCreateTransition (_uState65, _uState65, "State_65", "EndActions_20", "Dialog")
	_uEndActions20:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag20(YLIA)', 1, 2))
	_uEndActions20:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uEndActions20:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag20(YLIA)', 0, 4))
	_uEndActions20:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(YLIA)', 1, 4))
	_uEndActions20 = nil

-- TO SELF: EndConversation Actions #21
_uEndActions21 = GdsCreateTransition (_uState65, _uState65, "State_65", "EndActions_21", "Dialog")
	_uEndActions21:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag21(YLIA)', 1, 2))
	_uEndActions21:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag21(YLIA)', 0, 4))
	_uEndActions21:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(YLIA)', 1, 4))
	_uEndActions21 = nil

-- TO SELF: EndConversation Actions #22
_uEndActions22 = GdsCreateTransition (_uState65, _uState65, "State_65", "EndActions_22", "Dialog")
	_uEndActions22:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag22(YLIA)', 1, 2))
	_uEndActions22:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag22(YLIA)', 0, 4))
	_uEndActions22:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(YLIA)', 1, 4))
	_uEndActions22 = nil

-- TO SELF: EndConversation Actions #23
_uEndActions23 = GdsCreateTransition (_uState65, _uState65, "State_65", "EndActions_23", "Dialog")
	_uEndActions23:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag23(YLIA)', 1, 2))
	_uEndActions23:AddCondition (CScriptConditionDialogStopped("pl_Human", "Ylia"))
	_uEndActions23:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag23(YLIA)', 0, 4))
	_uEndActions23:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(YLIA)', 1, 4))
	_uEndActions23 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState65, _uBeginState, "State_65", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(YLIA)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(YLIA)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('Ylia', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(YLIA)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState2 = nil
_uState4 = nil
_uState7 = nil
_uState10 = nil
_uState12 = nil
_uState14 = nil
_uState19 = nil
_uState21 = nil
_uState25 = nil
_uState27 = nil
_uState29 = nil
_uState33 = nil
_uState35 = nil
_uState39 = nil
_uState41 = nil
_uState45 = nil
_uState47 = nil
_uState49 = nil
_uState53 = nil
_uState55 = nil
_uState59 = nil
_uState61 = nil
_uState65 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("Ylia_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(YLIA)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_BeginDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(YLIA)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[124]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[124]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 124))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[125]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[125]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 125))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[126]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[126]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 126))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[127]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[127]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 127))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[128]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[128]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 128))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[135]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[135]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 135))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[129]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[129]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 129))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[130]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[130]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 130))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[131]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[131]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 131))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[132]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[132]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 132))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[133]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[133]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 133))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[134]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[134]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 134))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[136]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[136]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 136))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[137]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[137]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 137))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[138]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[138]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 138))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[139]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[139]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 139))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[140]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[140]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 140))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[141]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[141]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 141))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[148]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[148]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 148))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[142]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[142]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 142))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[143]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[143]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 143))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[144]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[144]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 144))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[145]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[145]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 145))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[146]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[146]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 146))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[147]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[147]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 147))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[149]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[149]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 149))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[150]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[150]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 150))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[151]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[151]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 151))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[152]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[152]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 152))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[153]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[153]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 153))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[154]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[154]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 154))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[155]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[155]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 155))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[156]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[156]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 156))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[157]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[157]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 157))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[158]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[158]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 158))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[159]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[159]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 159))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[160]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[160]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 160))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[161]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[161]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 161))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[162]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[162]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 162))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[163]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[163]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 163))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[170]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[170]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 170))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[164]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[164]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 164))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[165]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[165]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 165))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[166]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[166]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 166))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[167]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[167]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 167))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[168]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[168]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 168))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[169]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[169]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 169))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[171]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[171]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 171))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[172]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[172]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 172))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[173]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[173]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 173))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[174]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[174]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 174))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[175]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[175]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 175))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[176]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[176]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 176))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[183]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[183]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 183))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[177]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[177]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 177))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[178]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[178]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 178))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[179]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[179]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 179))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[180]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[180]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 180))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[181]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[181]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 181))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[182]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[182]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 182))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[184]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[184]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 184))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[185]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[185]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 185))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[186]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[186]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 186))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[187]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[187]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 187))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[188]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[188]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 188))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[189]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[189]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 189))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[196]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[196]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 196))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[190]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[190]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 190))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[191]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[191]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 191))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[192]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[192]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 192))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[193]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[193]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 193))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[194]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[194]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 194))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[195]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[195]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 195))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[197]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[197]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 197))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[198]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[198]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 198))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[199]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[199]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 199))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[200]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[200]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 200))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[201]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[201]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 201))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[202]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[202]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 202))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[203]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[203]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 203))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[210]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[210]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 210))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[204]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[204]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 204))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[205]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[205]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 205))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[206]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[206]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 206))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[207]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[207]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 207))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[208]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[208]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 208))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[209]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[209]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 209))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[211]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[211]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 211))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[212]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[212]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 212))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[213]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[213]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 213))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[214]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[214]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 214))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[215]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[215]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 215))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[216]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[216]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 216))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[223]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[223]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 223))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[217]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[217]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 217))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[218]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[218]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 218))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[219]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[219]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 219))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[220]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[220]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 220))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[221]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[221]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 221))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[222]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[222]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 222))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[224]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[224]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 224))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[225]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[225]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 225))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[226]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[226]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 226))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[227]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[227]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 227))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[228]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[228]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 228))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[229]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[229]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 229))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[236]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[236]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 236))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[230]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[230]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 230))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[231]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[231]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 231))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[232]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[232]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 232))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[233]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[233]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 233))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[234]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[234]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 234))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[235]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[235]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 235))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[237]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[237]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 237))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[238]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[238]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 238))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[239]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[239]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 239))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[240]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[240]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 240))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[241]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[241]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 241))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_NpcDialog.tak', 'pl_HumanAvatar', 'Ylia'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "Ylia", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('base/script/DialogCameraTakes/default_AvatarDialog.tak', 'Ylia', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
