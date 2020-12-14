--------------------------------------------------------------------------------
-- // CORE / COMMANDS
--------------------------------------------------------------------------------

SlashCmdList.RELOADUI = function() ReloadUI() end
SLASH_RELOADUI1 = '/rl'

SlashCmdList.READYCHECK = function() DoReadyCheck() end
SLASH_READY1 = '/rc'
SLASH_READY2 = '/readycheck'

SlashCmdList.LEAVEGROUP = function() C_PartyInfo.LeaveParty() end
SLASH_LEAVEGROUP1 = '/lp'
SLASH_LEAVEGROUP2 = '/leave'

SlashCmdList.TELEPORT = function()
  if IsInInstance() then
    LFGTeleport(true)
  else
    LFGTeleport()
  end
end
SLASH_TELEPORT1 = '/tp'
SLASH_TELEPORT2 = '/teleport'

SlashCmdList.RESETINSTANCES = function() ResetInstances() end
SLASH_RESETINSTANCES1 = '/rd'
SLASH_RESETINSTANCES2 = '/ri'

SlashCmdList.CLEARCHAT = function()
  for i = 1, NUM_CHAT_WINDOWS do
    _G[format('ChatFrame%d', i)]:Clear()
  end
end
SLASH_CLEARCHAT1 = '/clearchat'

SlashCmdList.CALENDAR = function() ToggleCalendar() end
SLASH_CALENDAR1 = '/cl'
SLASH_CALENDAR2 = '/calendar'
