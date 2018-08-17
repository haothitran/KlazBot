local addon, ns = ...
local L = {}
ns.L = L

--------------------------------------------------------------------------------
-- // CORE / LOCALIZATION
--------------------------------------------------------------------------------

setmetatable(L, { __index = function(t, k)
	local v = tostring(k)
	t[k] = v
	return v
end })

--------------------------------------------------------------------------------
-- // ENGLISH
--------------------------------------------------------------------------------

L.MERCHANT_REPAIR = "Repair cost"
L.MERCHANT_GUILD = "Guild repair cost"
L.MERHCANT_BROKE = "Not enough gold to cover repair cost"

local locale = GetLocale()
if locale == "enUS" then return end

--------------------------------------------------------------------------------
-- // FRENCH
--------------------------------------------------------------------------------

-- if locale == "frFR" then
--
-- return end
