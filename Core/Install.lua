local addon, ns = ...
local L = ns.L

--------------------------------------------------------------------------------
-- // CORE / INSTALL
--------------------------------------------------------------------------------

local function KlazInstall()

  -- settings
  local position = {'BOTTOMLEFT', UIParent, 'BOTTOMLEFT', 20, 20}
  local height = 200
  local width = 400
  local fontSize = 13

  -- settings for seperate whisper
  local seperateDrama = true
  local positionDrama = {'BOTTOMLEFT', UIParent, 'BOTTOMLEFT', 20, 280}
  local heightDrama = 120

  -- set cvars
  -- controls
  SetCVar('autoLootDefault', 1)
  SetCVar('lootUnderMouse', 1)
  -- combat
  SetCVar('showTargetOfTarget', 1)
  -- display
  SetCVar('statusText', 1)
  SetCVar('statusTextDisplay', 'BOTH')
  SetCVar('rotateMinimap', 0)
  SetCVar('showTutorials', 0)
  -- social
  SetCVar('profanityFilter', 0)
  SetCVar('showToastOnline', 0)
  SetCVar('showToastOffline', 0)
  SetCVar('showToastBroadcast', 0)
  SetCVar('showToastWindow', 0)
  -- action bars
  SetCVar('lockActionBars', 1)
  SetCVar('alwaysShowActionBars', 1)
  SetCVar('countdownForCooldowns', 1)
  -- names
  SetCVar('nameplateShowAll', 1)
  -- camera
  SetCVar('cameraDistanceMaxZoomFactor', 2.6)
  SetCVar('screenshotQuality', 10)
  -- raid profiles
  SetCVar('useCompactPartyFrames', 1)
  -- system
  SetCVar('advancedCombatLogging', 1)
  SetCVar('Sound_EnableSoundWhenGameIsInBG', 1)
  SetCVar('Sound_EnableErrorSpeech', 0)

  -- set chat
  -- close all custom chat frames
  for i = 3, NUM_CHAT_WINDOWS do
    FCF_Close(_G['ChatFrame'..i])
  end

  -- create new custom chat frames
  -- general
  FCF_SetLocked(ChatFrame1, 1)
  -- log
  FCF_DockFrame(ChatFrame2)
  FCF_SetLocked(ChatFrame2, 1)
  FCF_SetWindowName(ChatFrame2, L.CHAT_TAB_LOG)
  -- raid
  FCF_OpenNewWindow(L.CHAT_TAB_RAID)
  FCF_SetLocked(ChatFrame3, 1)
  FCF_DockFrame(ChatFrame3)
  -- guild
  FCF_OpenNewWindow(L.CHAT_TAB_GUILD)
  FCF_SetLocked(ChatFrame4, 1)
  FCF_DockFrame(ChatFrame4)
  -- drama
  FCF_OpenNewWindow(L.CHAT_TAB_DRAMA)
  if seperateDrama == true then
    FCF_UnDockFrame(ChatFrame5)
    ChatFrame5:Show()
  else
    FCF_SetLocked(ChatFrame5, 1)
    FCF_DockFrame(ChatFrame5)
  end

  -- channels for general
  ChatFrame_RemoveAllMessageGroups(ChatFrame1)
  ChatFrame_AddChannel(ChatFrame1, TRADE)
  ChatFrame_AddChannel(ChatFrame1, GENERAL)
  ChatFrame_AddMessageGroup(ChatFrame1, 'SAY')
  ChatFrame_AddMessageGroup(ChatFrame1, 'EMOTE')
  ChatFrame_AddMessageGroup(ChatFrame1, 'YELL')
  ChatFrame_AddMessageGroup(ChatFrame1, 'GUILD')
  ChatFrame_AddMessageGroup(ChatFrame1, 'GUILD_ACHIEVEMENT')
  ChatFrame_AddMessageGroup(ChatFrame1, 'MONSTER_SAY')
  ChatFrame_AddMessageGroup(ChatFrame1, 'MONSTER_EMOTE')
  ChatFrame_AddMessageGroup(ChatFrame1, 'MONSTER_YELL')
  ChatFrame_AddMessageGroup(ChatFrame1, 'MONSTER_WHISPER')
  ChatFrame_AddMessageGroup(ChatFrame1, 'MONSTER_BOSS_EMOTE')
  ChatFrame_AddMessageGroup(ChatFrame1, 'MONSTER_BOSS_WHISPER')
  ChatFrame_AddMessageGroup(ChatFrame1, 'PARTY')
  ChatFrame_AddMessageGroup(ChatFrame1, 'PARTY_LEADER')
  ChatFrame_AddMessageGroup(ChatFrame1, 'RAID')
  ChatFrame_AddMessageGroup(ChatFrame1, 'RAID_LEADER')
  ChatFrame_AddMessageGroup(ChatFrame1, 'RAID_WARNING')
  ChatFrame_AddMessageGroup(ChatFrame1, 'INSTANCE_CHAT')
  ChatFrame_AddMessageGroup(ChatFrame1, 'INSTANCE_CHAT_LEADER')
  ChatFrame_AddMessageGroup(ChatFrame1, 'BG_HORDE')
  ChatFrame_AddMessageGroup(ChatFrame1, 'BG_ALLIANCE')
  ChatFrame_AddMessageGroup(ChatFrame1, 'BG_NEUTRAL')
  ChatFrame_AddMessageGroup(ChatFrame1, 'SYSTEM')
  ChatFrame_AddMessageGroup(ChatFrame1, 'ERRORS')
  ChatFrame_AddMessageGroup(ChatFrame1, 'AFK')
  ChatFrame_AddMessageGroup(ChatFrame1, 'DND')
  ChatFrame_AddMessageGroup(ChatFrame1, 'IGNORED')
  ChatFrame_AddMessageGroup(ChatFrame1, 'ACHIEVEMENT')
  ChatFrame_AddMessageGroup(ChatFrame1, 'COMBAT_XP_GAIN')
  ChatFrame_AddMessageGroup(ChatFrame1, 'COMBAT_HONOR_GAIN')
  ChatFrame_AddMessageGroup(ChatFrame1, 'COMBAT_FACTION_CHANGE')
  ChatFrame_AddMessageGroup(ChatFrame1, 'LOOT')
  ChatFrame_AddMessageGroup(ChatFrame1, 'MONEY')

  if seperateDrama ~= true then
    ChatFrame_AddMessageGroup(ChatFrame1, 'OFFICER')
    ChatFrame_AddMessageGroup(ChatFrame1, 'WHISPER')
    ChatFrame_AddMessageGroup(ChatFrame1, 'BN_WHISPER')
    ChatFrame_AddMessageGroup(ChatFrame1, 'BN_CONVERSATION')
    ChatFrame_AddMessageGroup(ChatFrame1, 'CHANNEL4')
    ChatFrame_AddMessageGroup(ChatFrame1, 'CHANNEL5')
    ChatFrame_AddMessageGroup(ChatFrame1, 'CHANNEL6')
  end

  -- channels for raid
  ChatFrame_RemoveAllMessageGroups(ChatFrame3)
  ChatFrame_AddMessageGroup(ChatFrame3, 'SAY')
  ChatFrame_AddMessageGroup(ChatFrame3, 'EMOTE')
  ChatFrame_AddMessageGroup(ChatFrame3, 'INSTANCE_CHAT')
  ChatFrame_AddMessageGroup(ChatFrame3, 'INSTANCE_CHAT_LEADER')
  ChatFrame_AddMessageGroup(ChatFrame3, 'PARTY')
  ChatFrame_AddMessageGroup(ChatFrame3, 'PARTY_LEADER')
  ChatFrame_AddMessageGroup(ChatFrame3, 'RAID')
  ChatFrame_AddMessageGroup(ChatFrame3, 'RAID_LEADER')
  ChatFrame_AddMessageGroup(ChatFrame3, 'RAID_WARNING')
  ChatFrame_AddMessageGroup(ChatFrame3, 'BATTLEGROUND')
  ChatFrame_AddMessageGroup(ChatFrame3, 'BATTLEGROUND_LEADER')
  ChatFrame_AddMessageGroup(ChatFrame3, 'BG_HORDE')
  ChatFrame_AddMessageGroup(ChatFrame3, 'BG_ALLIANCE')
  ChatFrame_AddMessageGroup(ChatFrame3, 'BG_NEUTRAL')

  -- channels for guild
  ChatFrame_RemoveAllMessageGroups(ChatFrame4)
  ChatFrame_AddMessageGroup(ChatFrame4, 'GUILD')
  ChatFrame_AddMessageGroup(ChatFrame4, 'GUILD_ACHIEVEMENT')

  -- channels for drama
  ChatFrame_RemoveAllMessageGroups(ChatFrame5)
  ChatFrame_AddMessageGroup(ChatFrame5, 'OFFICER')
  ChatFrame_AddMessageGroup(ChatFrame5, 'WHISPER')
  ChatFrame_AddMessageGroup(ChatFrame5, 'BN_WHISPER')
  ChatFrame_AddMessageGroup(ChatFrame5, 'BN_CONVERSATION')
  ChatFrame_AddMessageGroup(ChatFrame3, 'CHANNEL4')
  ChatFrame_AddMessageGroup(ChatFrame5, 'CHANNEL5')
  ChatFrame_AddMessageGroup(ChatFrame5, 'CHANNEL6')

  -- enable class colour names
  ToggleChatColorNamesByClassGroup(true, 'SAY')
  ToggleChatColorNamesByClassGroup(true, 'EMOTE')
  ToggleChatColorNamesByClassGroup(true, 'YELL')
  ToggleChatColorNamesByClassGroup(true, 'GUILD')
  ToggleChatColorNamesByClassGroup(true, 'OFFICER')
  ToggleChatColorNamesByClassGroup(true, 'GUILD_ACHIEVEMENT')
  ToggleChatColorNamesByClassGroup(true, 'ACHIEVEMENT')
  ToggleChatColorNamesByClassGroup(true, 'WHISPER')
  ToggleChatColorNamesByClassGroup(true, 'PARTY')
  ToggleChatColorNamesByClassGroup(true, 'PARTY_LEADER')
  ToggleChatColorNamesByClassGroup(true, 'INSTANCE_CHAT')
  ToggleChatColorNamesByClassGroup(true, 'INSTANCE_CHAT_LEADER')
  ToggleChatColorNamesByClassGroup(true, 'RAID')
  ToggleChatColorNamesByClassGroup(true, 'RAID_LEADER')
  ToggleChatColorNamesByClassGroup(true, 'RAID_WARNING')
  ToggleChatColorNamesByClassGroup(true, 'BATTLEGROUND')
  ToggleChatColorNamesByClassGroup(true, 'BATTLEGROUND_LEADER')
  ToggleChatColorNamesByClassGroup(true, 'CHANNEL1')
  ToggleChatColorNamesByClassGroup(true, 'CHANNEL2')
  ToggleChatColorNamesByClassGroup(true, 'CHANNEL3')
  ToggleChatColorNamesByClassGroup(true, 'CHANNEL4')
  ToggleChatColorNamesByClassGroup(true, 'CHANNEL5')
  ToggleChatColorNamesByClassGroup(true, 'CHANNEL6')

  -- change channel colours
  ChangeChatColor('OFFICER',              225/255, 200/255, 0/255)    -- yellow
  ChangeChatColor('INSTANCE_CHAT',        200/255, 120/255, 180/255)  -- purple
  ChangeChatColor('INSTANCE_CHAT_LEADER', 200/255, 120/255, 180/255)  -- purple
  ChangeChatColor('RAID',                 200/255, 120/255, 180/255)  -- purple
  ChangeChatColor('RAID_LEADER',          200/255, 120/255, 180/255)  -- purple
  ChangeChatColor('CHANNEL4',             255/255, 0/255,   142/255)  -- pink
  ChangeChatColor('CHANNEL5',             100/255, 220/255, 180/255)  -- green
  ChangeChatColor('CHANNEL6',             0/255,   175/255, 255/255)  -- blue

  -- set position and size for chat frames
  for i = 1, NUM_CHAT_WINDOWS do
    local cf = _G['ChatFrame'..i]
    local cfID = cf:GetID()

    -- general, log, guild, raid
    if cfID == 1 then
      cf:ClearAllPoints()
      cf:SetPoint(unpack(position))
      cf:SetSize(width, height)
    -- drama
    elseif cfID == 5 and seperateDrama == true then
      if (not cf.isDocked) then
        cf:ClearAllPoints()
        cf:SetPoint(unpack(positionDrama))
        cf:SetSize(width, heightDrama)
      end
    end

    FCF_SetChatWindowFontSize(nil, cf, fontSize)
    FCF_SavePositionAndDimensions(cf)

    if (not cf.isLocked) then FCF_SetLocked(cf, 1) end
  end

  -- return to general
  FCF_SelectDockFrame(_G['ChatFrame1'])

  ReloadUI()
end

StaticPopupDialogs.KLAZINSTALL = {
  text = L.KLAZ_INSTALL,
  button1 = ACCEPT,
  button2 = CANCEL,
  OnAccept = KlazInstall,
  OnCancel = function() end,
  timeout = 0,
  whileDead = 1,
  hideOnEscape = false,
  preferredIndex = 5,
}

SlashCmdList.KLAZINSTALL = function() StaticPopup_Show('KLAZINSTALL') end
SLASH_KLAZINSTALL1 = '/kinstall'
SLASH_KLAZINSTALL2 = '/klazinstall'
