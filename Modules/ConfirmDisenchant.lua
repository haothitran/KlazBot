--------------------------------------------------------------------------------
-- // MODULES / CONFIRM DISENCHANT
--------------------------------------------------------------------------------

local f = CreateFrame("Frame")
f:RegisterEvent("CONFIRM_DISENCHANT_ROLL")
f:RegisterEvent("CONFIRM_LOOT_ROLL")
f:RegisterEvent("LOOT_BIND_CONFIRM")
f:SetScript("OnEvent", function(self, event, id)
  for i = 1, STATICPOPUP_NUMDIALOGS do
    local d = _G["StaticPopup"..i]
    if d:IsVisible() and (d.which == "CONFIRM_LOOT_ROLL" or d.which == "LOOT_BIND") then
      StaticPopup_OnClick(d, 1)
    end
  end
end)
