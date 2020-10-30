local charName = UnitName("player")
if charName == "Smashdaddy" then return end

--------------------------------------------------------------------------------
-- // MODULES / RANGE
--------------------------------------------------------------------------------
-- nMainbar

local function ActionBarActionButtonMixinHook_UpdateUsable(self, checksRange, inRange)
  local icon = self.icon
  local normalTexture = self.NormalTexture
  if not normalTexture then
    return
  end

  local isUsable, notEnoughMana = IsUsableAction(self.action)
  if isUsable then
    icon:SetVertexColor(1, 1, 1)
    normalTexture:SetVertexColor(1, 1, 1)
  elseif notEnoughMana then
    icon:SetVertexColor(.2, .2, 1)
    normalTexture:SetVertexColor(.2, .2, 1)
  else
    icon:SetVertexColor(.5, .5, .5)
    normalTexture:SetVertexColor(.5, .5, .5)
  end

  if checksRange and not inRange then
    icon:SetVertexColor(1, 0, 0)
  end
end

hooksecurefunc("ActionButton_UpdateRangeIndicator", function(self, checksRange, inRange)
  local icon = self.icon

  if self.action then
    ActionBarActionButtonMixinHook_UpdateUsable(self, checksRange, inRange)
  end

  -- if self.HotKey:GetText() == RANGE_INDICATOR then
  --   if checksRange then
  --     self.HotKey:Show()
  --     if inRange then
  --       self.HotKey:SetVertexColor(.5, .5, .5, .5)
  --     else
  --       self.HotKey:SetVertexColor(1, .2, .2, .5)
  --     end
  --   else
  --     self.HotKey:Hide()
  --   end
  -- else
  --   if checksRange and not inRange then
  --     self.HotKey:SetVertexColor(1, .2, .2, .5)
  --   else
  --     self.HotKey:SetVertexColor(.5, .5, .5, .5)
  --   end
  -- end
end)
