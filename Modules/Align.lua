--------------------------------------------------------------------------------
-- // MODULES / ALIGN
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
SLASH_KLAZALIGN1 = '/klazalign'
SLASH_KLAZALIGN2 = '/kalign'
