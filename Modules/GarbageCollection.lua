--------------------------------------------------------------------------------
-- // MODULES / GARBAGE COLLECTION
--------------------------------------------------------------------------------

local eventcount = 0

local garbage = CreateFrame('Frame')
garbage:RegisterAllEvents()
garbage:SetScript('OnEvent', function(self, event)
  eventcount = eventcount + 1

  if event == 'PLAYER_ENTERING_WORLD'
  or (InCombatLockdown() and eventcount > 25000)
  or (not InCombatLockdown() and eventcount > 10000) then
    collectgarbage()
    eventcount = 0
  end
end)
