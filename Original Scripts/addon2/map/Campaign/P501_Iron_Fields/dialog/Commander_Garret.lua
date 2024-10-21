local _uSM = GdsCreateStateMachine ("commander_garret_Dialog")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uState1 = GdsCreateState (_uSM, "State_1")
_uState4 = GdsCreateState (_uSM, "State_4")

-- DIALOG ONETIME INIT:
_uStateBeginDialogInit = GdsCreateTransition (_uBeginState, _uBeginState, "BeginDialog", "BeginDialog", "DialogInit")
	_uStateBeginDialogInit:AddCondition (CScriptConditionScriptTagAlive('commander_garret'))
	_uStateBeginDialogInit:AddCondition (CScriptConditionValue('', 'GDS_DialogIsInitialized(COMMANDER_GARRET)', 0, 2))
	_uStateBeginDialogInit:AddAction (CScriptActionValueModify('', 'GDS_DialogIsInitialized(COMMANDER_GARRET)', 1, 4))
	_uStateBeginDialogInit:AddAction (CScriptActionSetDialog('commander_garret', 2))
	_uStateBeginDialogInit:AddAction (CScriptActionDialogEnable("commander_garret", 0))
	_uStateBeginDialogInit:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uStateBeginDialogInit = nil

-- TO STATE: begindialog
_uStateBeginDelay = GdsCreateState (_uSM, "State_BeginDelay")
_uStateBeginDelayTrans = GdsCreateTransition (_uBeginState, _uStateBeginDelay, "BeginDialog", "StateBeginDelay", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionDialogStarted("pl_Human", "commander_garret"))
	_uStateBeginDelayTrans:AddAction (CScriptActionCombatTurnOffAll(1))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(COMMANDER_GARRET)', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 1, 4))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampReset('mt_AvatarIsNotTalking'))
	_uStateBeginDelayTrans:AddAction (CScriptActionTimeStampSet('et_DialogBeginCameraTimer(COMMANDER_GARRET)'))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 1))
	_uStateBeginDelayTrans:AddAction (CScriptActionFigureHideWeapons('commander_garret', 1))
	local _uRenderOnly = CScriptActionFigureRenderOnly("pl_HumanAvatar", 0)
		_uRenderOnly:Add("commander_garret")
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
_uStateBeginDelayTrans = GdsCreateTransition (_uStateBeginDelay, _uState1, "StateBeginDelay", "State_1_T1", "Dialog")
	_uStateBeginDelayTrans:AddCondition (CScriptConditionTimeElapsed('et_DialogBeginCameraTimer(COMMANDER_GARRET)', 10))
	_uStateBeginDelayTrans:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(COMMANDER_GARRET)', 1, 4))
	_uStateBeginDelayTrans = nil

-- TO STATE: WaitForBeginDialog (on user request)
_uBackToBegin = GdsCreateTransition (_uState1, _uBeginState, "State_1", "EndDialogOnUserRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionDialogStopped("pl_Human", "commander_garret"))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('commander_garret', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(COMMANDER_GARRET)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- TO STATE: endconversation
_uState4Trans1 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T1", "Dialog")
	_uState4Trans1:AddCondition (CScriptConditionValue('', 'mf_P501_FirstTalk1CompleteGarret', 0, 2))
	_uState4Trans1:AddAction (CScriptActionSay("commander_garret", "P501_DLG_COMMANDERGARRET_001", "Thank you Shaikan", 100, 16777215))
	_uState4Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_COMMANDERGARRET_002PCNEW", "I’m verry sorry Commander, that we could not make it earlier. More souls could have been spared.", 101, 16777215))
--	_uState4Trans1:AddAction (CScriptActionSay("commander_garret", "P501_DLG_COMMANDERGARRET_003", "Nadira? I trust she is well?", 102, 16777215))
--	_uState4Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_COMMANDERGARRET_004PC", "She was concerned, but she'll be fine now that you're safe.", 103, 16777215))
	_uState4Trans1:AddAction (CScriptActionSay("commander_garret", "P501_DLG_COMMANDERGARRET_005", "These monsters won't be stopped that easily.", 104, 16777215))
	_uState4Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_COMMANDERGARRET_006PC", "Hmm... What are these creatures?", 105, 16777215))
	_uState4Trans1:AddAction (CScriptActionSay("commander_garret", "P501_DLG_COMMANDERGARRET_007", "If only we knew! They are strong and fast. I saw one of my men surrender only to be slain without mercy.  We call them the Nameless for want of a better term for the evil bastards.", 106, 16777215))
	_uState4Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_COMMANDERGARRET_008PC", "The Nameless.  It's as agood a name as any.", 107, 16777215))
	_uState4Trans1:AddAction (CScriptActionSay("commander_garret", "P501_DLG_COMMANDERGARRET_009", "Right. A few hours ago a messenger came in wounded from our outpost to the Southeast. He had been mauled in a way I had never seen before so I dismissed the civilians immediatly. Luckily we got the last of them to safety right before the first wave hit us.", 108, 16777215))
	_uState4Trans1:AddAction (CScriptActionSay("commander_garret", "P501_DLG_COMMANDERGARRET_010", "I lost too many good men in that first wave. We had almost no time to regroup before the second wave came. The ones you just helped us dispatch were the third wave and I'd bet my teeth that a fourth wave will be upon shortly.", 109, 16777215))
	_uState4Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_COMMANDERGARRET_011PC", "Then we should stop talking.  How can I help?", 110, 16777215))
	_uState4Trans1:AddAction (CScriptActionSay("commander_garret", "P501_DLG_COMMANDERGARRET_012", "Our scouts report towers blocking our access to the outpost we get our supplies from. You are a Shaikan, maybe you could break through and make it to our outpost. They are off the main road, so there is some hope that they're still alive.", 111, 16777215))
	_uState4Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_COMMANDERGARRET_013PC", "I'm a Shaikan commander, not a god. But I'll see what I can do.", 112, 16777215))
	_uState4Trans1:AddAction (CScriptActionSay("commander_garret", "P501_DLG_COMMANDERGARRET_014", "Aonir's Light be with you!", 113, 16777215))
	_uState4Trans1:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_COMMANDERGARRET_015PC", "And with you Commander.", 114, 16777215))
	_uState4Trans1:AddAction (CScriptActionDialogEnable("commander_garret", 0))
	_uState4Trans1:AddAction (CScriptActionDialogRequestEnd("pl_Human", "commander_garret"))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(COMMANDER_GARRET)', 1, 4))
	_uState4Trans1:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(COMMANDER_GARRET)', 1, 4))
	_uState4Trans1 = nil

-- TO STATE: endconversation
_uState4Trans2 = GdsCreateTransition (_uState1, _uState4, "State_1", "State_4_T2", "Dialog")
	_uState4Trans2:AddCondition (GdsNegateCondition( CScriptConditionValue('', 'mf_P501_FirstTalk1CompleteGarret', 0, 2) ))
	_uState4Trans2:AddAction (CScriptActionSay("commander_garret", "P501_DLG_COMMANDERGARRET_016", "We are in your debt Shaikan.", 115, 16777215))
	_uState4Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_COMMANDERGARRET_017PC", "It was my pleasure Commander, but to be honest I had my own reasons for driving them off.", 116, 16777215))
	_uState4Trans2:AddAction (CScriptActionSay("commander_garret", "P501_DLG_COMMANDERGARRET_018", "I understand... This is of course the native home of the Shaikan...", 117, 16777215))
	_uState4Trans2:AddAction (CScriptActionSay("commander_garret", "P501_DLG_COMMANDERGARRET_019", "Please accept my gratitude as such and let's leave the politics those more inclined.", 118, 16777215))
	_uState4Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_COMMANDERGARRET_020PC", "I couldn't have said it better myself Commander.", 119, 16777215))
	_uState4Trans2:AddAction (CScriptActionSay("commander_garret", "P501_DLG_COMMANDERGARRET_021", "I'd like to give you this armor as sign of my gratitude, if you'll have it. It was a prize of the Convocation Wars.", 120, 16777215))
	_uState4Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_COMMANDERGARRET_022PC", "Thank you.", 121, 16777215))
	_uState4Trans2:AddAction (CScriptActionSay("commander_garret", "P501_DLG_COMMANDERGARRET_023", "Farewell Shaikan, and thank you again.", 122, 16777215))
	_uState4Trans2:AddAction (CScriptActionSay("pl_HumanAvatar", "P501_DLG_COMMANDERGARRET_024PC", "Farwell Commander.  It has been an honour but I must return to my search.", 123, 16777215))
	_uState4Trans2:AddAction (CScriptActionDialogEnable("commander_garret", 0))
	_uState4Trans2:AddAction (CScriptActionDialogRequestEnd("pl_Human", "commander_garret"))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(COMMANDER_GARRET)', 1, 4))
	_uState4Trans2:AddAction (CScriptActionValueModify('', 'GDS_DialogShowChoicesFlag(COMMANDER_GARRET)', 1, 4))
	_uState4Trans2 = nil

-- TO SELF: EndConversation Actions #1
_uEndActions1 = GdsCreateTransition (_uState4, _uState4, "State_4", "EndActions_1", "Dialog")
	_uEndActions1:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag1(COMMANDER_GARRET)', 1, 2))
	_uEndActions1:AddCondition (CScriptConditionDialogStopped("pl_Human", "commander_garret"))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'mf_P501_FirstTalk1CompleteGarret', 1, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag1(COMMANDER_GARRET)', 0, 4))
	_uEndActions1:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(COMMANDER_GARRET)', 1, 4))
	_uEndActions1 = nil

-- TO SELF: EndConversation Actions #2
_uEndActions2 = GdsCreateTransition (_uState4, _uState4, "State_4", "EndActions_2", "Dialog")
	_uEndActions2:AddCondition (CScriptConditionValue('', 'GDS_DialogEndActionFlag2(COMMANDER_GARRET)', 1, 2))
	_uEndActions2:AddCondition (CScriptConditionDialogStopped("pl_Human", "commander_garret"))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'mf_P501_FirstTalk2CompleteGarret', 1, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogEndActionFlag2(COMMANDER_GARRET)', 0, 4))
	_uEndActions2:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(COMMANDER_GARRET)', 1, 4))
	_uEndActions2 = nil

-- TO STATE: WaitForBeginDialog (on script request)
_uBackToBegin = GdsCreateTransition (_uState4, _uBeginState, "State_4", "EndDialogOnScriptRequest", "Dialog")
	_uBackToBegin:AddCondition (CScriptConditionValue('', 'GDS_DialogForceStopDialog(COMMANDER_GARRET)', 1, 2))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_DialogForceStopDialog(COMMANDER_GARRET)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('pl_HumanAvatar', 0))
	_uBackToBegin:AddAction (CScriptActionFigureHideWeapons('commander_garret', 0))
	_uBackToBegin:AddAction (CScriptActionTimeStampSet('mt_AvatarIsNotTalking'))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'GDS_AvatarIsTalking(COMMANDER_GARRET)', 0, 4))
	_uBackToBegin:AddAction (CScriptActionValueModify('', 'mf_AvatarIsTalking', 0, 4))
	_uBackToBegin:AddAction (CScriptActionCameraTrackEnd())
	_uBackToBegin:AddAction (CScriptActionFigureRenderOnlyUnhide())
	_uBackToBegin:AddAction (CScriptActionCombatTurnOffAll(0))
	_uBackToBegin = nil

-- CLEANUP STATE VARS:
_uBeginState = nil
_uState1 = nil
_uState4 = nil


-------------------------------------------------------------------------------------------
-- Dialog Camera Statemachine
-------------------------------------------------------------------------------------------
local _uBeginState
local _uCameraSelectState
local _uTrans
local _uCameraActiveState
local _uCameraSelectState

local _uSM = GdsCreateStateMachine ("commander_garret_Dialog_Camera")

_uBeginState = GdsCreateState (_uSM, "WaitForBeginDialog")
_uCameraSelectState = GdsCreateState (_uSM, "DialogSelectCamera")

_uTrans = GdsCreateTransition(_uBeginState, _uCameraSelectState, "_uBeginState", "_uCameraSelectState", "DialogBegins")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(COMMANDER_GARRET)', 1, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/Garrot_BeginDialog.tak', 'pl_HumanAvatar', 'commander_garret'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

_uTrans = GdsCreateTransition(_uCameraSelectState, _uBeginState, "_uCameraSelectState", "_uBeginState", "DialogEnds")
	_uTrans:AddCondition (CScriptConditionValue('', 'GDS_AvatarIsTalking(COMMANDER_GARRET)', 0, 2))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())


-- Camera State: DialogActiveCamera[100]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[100]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "commander_garret", 100))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/CommanderDialog.tak', 'pl_HumanAvatar', 'commander_garret'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[101]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[101]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "commander_garret", 101))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/Avatart_CommanderDialog.tak', 'commander_garret', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[102]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[102]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "commander_garret", 102))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/CommanderDialog.tak', 'pl_HumanAvatar', 'commander_garret'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[103]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[103]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "commander_garret", 103))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/Avatart_CommanderDialog.tak', 'commander_garret', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[104]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[104]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "commander_garret", 104))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/CommanderDialog.tak', 'pl_HumanAvatar', 'commander_garret'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[105]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[105]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "commander_garret", 105))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/Avatart_CommanderDialog.tak', 'commander_garret', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[106]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[106]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "commander_garret", 106))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/CommanderDialog.tak', 'pl_HumanAvatar', 'commander_garret'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[107]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[107]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "commander_garret", 107))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/Avatart_CommanderDialog.tak', 'commander_garret', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[108]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[108]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "commander_garret", 108))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/CommanderDialog.tak', 'pl_HumanAvatar', 'commander_garret'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[109]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[109]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "commander_garret", 109))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/CommanderDialog.tak', 'pl_HumanAvatar', 'commander_garret'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[110]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[110]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "commander_garret", 110))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/Avatart_CommanderDialog.tak', 'commander_garret', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[111]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[111]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "commander_garret", 111))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/CommanderDialog.tak', 'pl_HumanAvatar', 'commander_garret'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[112]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[112]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "commander_garret", 112))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/Avatart_CommanderDialog.tak', 'commander_garret', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[113]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[113]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "commander_garret", 113))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/CommanderDialog.tak', 'pl_HumanAvatar', 'commander_garret'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[114]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[114]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "commander_garret", 114))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/Avatart_CommanderDialog.tak', 'commander_garret', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[115]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[115]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "commander_garret", 115))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/CommanderDialog.tak', 'pl_HumanAvatar', 'commander_garret'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[116]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[116]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "commander_garret", 116))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/Avatart_CommanderDialog.tak', 'commander_garret', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[117]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[117]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "commander_garret", 117))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/CommanderDialog.tak', 'pl_HumanAvatar', 'commander_garret'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[118]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[118]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "commander_garret", 118))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/CommanderDialog.tak', 'pl_HumanAvatar', 'commander_garret'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[119]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[119]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "commander_garret", 119))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/Avatart_CommanderDialog.tak', 'commander_garret', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[120]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[120]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "commander_garret", 120))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/CommanderDialog.tak', 'pl_HumanAvatar', 'commander_garret'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[121]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[121]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "commander_garret", 121))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/Avatart_CommanderDialog.tak', 'commander_garret', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[122]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[122]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "commander_garret", 122))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/CommanderDialog.tak', 'pl_HumanAvatar', 'commander_garret'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[123]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[123]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "commander_garret", 123))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/Avatart_CommanderDialog.tak', 'commander_garret', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())

-- Camera State: DialogActiveCamera[99]
_uTrans = GdsCreateTransition (_uCameraSelectState, _uCameraSelectState, "DialogSelectCamera", "DialogActiveCamera[99]", "CameraStart")
	_uTrans:AddCondition (CScriptConditionDialogSelected("pl_Human", "commander_garret", 99))
	_uTrans:AddAction (CScriptActionCameraTrackEnd())
	_uTrans:AddAction (CScriptActionAddCameraTake('addon2/script/DialogCameraTakes/Avatart_CommanderDialog.tak', 'commander_garret', 'pl_HumanAvatar'))
	_uTrans:AddAction (CScriptActionCameraTrackBegin())
