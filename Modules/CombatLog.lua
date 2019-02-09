local addon, ns = ...
local C = ns.C
if C.CombatLog ~= true then return end

--------------------------------------------------------------------------------
-- // MODULES / COMBAT LOG
--------------------------------------------------------------------------------

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function()
	local _, instanceType = IsInInstance()
	if instanceType == "raid" and IsInRaid(LE_PARTY_CATEGORY_HOME) then
		if not LoggingCombat() then
			LoggingCombat(1)
			print("|cff1994ff"..COMBATLOGENABLED.."|r")
		end
	else
		if LoggingCombat() then
			LoggingCombat(0)
			print("|cff1994ff"..COMBATLOGDISABLED.."|r")
		end
	end
end)
