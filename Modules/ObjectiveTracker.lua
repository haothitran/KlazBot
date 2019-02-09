--------------------------------------------------------------------------------
-- // MODULES / OBJECTIVE TRACKER
--------------------------------------------------------------------------------

local otf = _G["ObjectiveTrackerFrame"]

otf.HeaderMenu.Title:SetAlpha(0)

local mb = otf.HeaderMenu.MinimizeButton
mb:EnableMouse(true)
mb:SetNormalTexture([[Interface\AddOns\KlazBot\Media\ObjectiveTrackerArrow]])
mb:SetPushedTexture([[Interface\AddOns\KlazBot\Media\ObjectiveTrackerArrow]])
