local addon, ns = ...
local C = {}
ns.C = C

--------------------------------------------------------------------------------
-- // CORE / CONFIG
--------------------------------------------------------------------------------

C.CombatLog = true

C.Merchant = {
  ['SellJunk'] = true,      -- auto sell grey items at vendors
  ['Repair'] = true,        -- if possible, auto repair items at vendor
  ['GuildFunds'] = false,   -- first use guild funds to repair before personal
}
