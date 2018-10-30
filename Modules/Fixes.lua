--------------------------------------------------------------------------------
-- // MODULES / FIXES
--------------------------------------------------------------------------------

-- escape-proof
StaticPopupDialogs.RESURRECT.hideOnEscape = nil
StaticPopupDialogs.AREA_SPIRIT_HEAL.hideOnEscape = nil
StaticPopupDialogs.PARTY_INVITE.hideOnEscape = nil
StaticPopupDialogs.CONFIRM_SUMMON.hideOnEscape = nil

-- use the enter key to purchase items with currencies
StaticPopupDialogs.CONFIRM_PURCHASE_TOKEN_ITEM.enterClicksFirstButton = true

-- change deletion prompt for protected items to yes/no dialog
StaticPopupDialogs["DELETE_GOOD_ITEM"] = StaticPopupDialogs["DELETE_ITEM"]

-- fix SearchLFGLeave() taint
local leaveTaint = CreateFrame("Frame")
leaveTaint:SetScript("OnUpdate", function(self, elapsed)
	if LFRBrowseFrame.timeToClear then
		LFRBrowseFrame.timeToClear = nil
	end
end)
