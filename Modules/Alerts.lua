--------------------------------------------------------------------------------
-- // MODULES / ALERTS
--------------------------------------------------------------------------------

-- stop queue pings when raid leader/assist
QueueStatusMinimapButton.EyeHighlightAnim:SetScript('OnLoop', nil)

-- force ready check sound
hooksecurefunc('ShowReadyCheck', function(self, initiator)
  if initiator ~= 'player' then
    PlaySound(SOUNDKIT.READY_CHECK, 'Master')
  end
end)

-- force other warning sounds
local warn = CreateFrame('Frame')
warn:RegisterEvent('UPDATE_BATTLEFIELD_STATUS')
warn:RegisterEvent('PET_BATTLE_QUEUE_PROPOSE_MATCH')
warn:RegisterEvent('LFG_PROPOSAL_SHOW')
warn:RegisterEvent('RESURRECT_REQUEST')
warn:SetScript('OnEvent', function(self, event)
  if event == 'UPDATE_BATTLEFIELD_STATUS' then
    for i = 1, GetMaxBattlefieldID() do
      local status = GetBattlefieldStatus(i)
      if status == 'confirm' then
        PlaySound(SOUNDKIT.PVP_THROUGH_QUEUE, 'Master')
        break
      end
      i = i + 1
    end
  elseif event == 'PET_BATTLE_QUEUE_PROPOSE_MATCH' then
    PlaySound(SOUNDKIT.PVP_THROUGH_QUEUE, 'Master')
  elseif event == 'LFG_PROPOSAL_SHOW' then
    PlaySound(SOUNDKIT.READY_CHECK, 'Master')
  elseif event == 'RESURRECT_REQUEST' then
    PlaySound(37, 'Master')
  end
end)
