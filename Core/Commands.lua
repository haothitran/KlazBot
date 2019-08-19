--------------------------------------------------------------------------------
-- // CORE / COMMANDS
--------------------------------------------------------------------------------

SlashCmdList.RELOADUI = function() ReloadUI() end
SLASH_RELOADUI1 = '/rl'

SlashCmdList.READYCHECK = function() DoReadyCheck() end
SLASH_READY1 = '/rc'
SLASH_READY2 = '/readycheck'

SlashCmdList.LEAVEGROUP = function() LeaveParty() end
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
SLASH_CALENDAR1 = "/cl"
SLASH_CALENDAR2 = "/calendar"

--------------------------------------------------------------------------------
-- // ALIGN
--------------------------------------------------------------------------------

local align
SlashCmdList.KLAZALIGN = function()
  if align then
    align:Hide()
    align = nil
  else
    align = CreateFrame('Frame', nil, UIParent)
    align:SetAllPoints(UIParent)

    local width = GetScreenWidth() / 128
    local height = GetScreenHeight() / 72

    -- vertical lines
    for i = 0, 128 do
      local t = align:CreateTexture(nil, 'BACKGROUND')

      if i == 56 then
        t:SetColorTexture(.098, .58, 1)
      elseif i == 64 then -- center
        t:SetColorTexture(1, 1, 0)
      elseif i == 72 then
        t:SetColorTexture(.098, .58, 1)
      elseif i == 76 then
        t:SetColorTexture(.098, .58, 1)
      else
        t:SetColorTexture(.8, .8, .8, .3)
      end

      t:SetPoint('TOPLEFT', align, 'TOPLEFT', i*width-1, 0)
      t:SetPoint('BOTTOMRIGHT', align, 'BOTTOMLEFT', i*width, 0)
    end

    -- horizontal lines
    for i = 0, 72 do
      local t = align:CreateTexture(nil, 'BACKGROUND')

      if i == 36 then -- center
        t:SetColorTexture(1, 1, 0)
      elseif i == 48 then
        t:SetColorTexture(.098, .58, 1)
      else
        t:SetColorTexture(.8, .8, .8, .3)
      end

      t:SetPoint('TOPLEFT', align, 'TOPLEFT', 0, -i*height)
      t:SetPoint('BOTTOMRIGHT', align, 'TOPRIGHT', 0, -i*height-1)
    end
  end
end
SLASH_KLAZALIGN1 = '/kalign'
SLASH_KLAZALIGN2 = '/klazalign'
