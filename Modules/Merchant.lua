local addon, ns = ...
local C = ns.C
local L = ns.L

--------------------------------------------------------------------------------
-- // MODULES / MERCHANT
--------------------------------------------------------------------------------

local sell_greys = C.Merchant.SellJunk
local repair = C.Merchant.Repair
local guild_funds = C.Merchant.GuildFunds

local f = CreateFrame('Frame')
f:RegisterEvent('MERCHANT_SHOW')
f:SetScript('OnEvent', function()
  -- sell junk items when visting a vendor
  if sell_greys == true then
    local bag, slot
    for bag = 0, 4 do
      for slot = 0, GetContainerNumSlots(bag) do
        local link = GetContainerItemLink(bag, slot)
        if link and (select(3, GetItemInfo(link))==0) then
          UseContainerItem(bag, slot)
        end
      end
    end
  end

  -- repair gear when visiting a vendor
  if repair and CanMerchantRepair() then
    local cost = GetRepairAllCost()
    if cost > 0 then
      -- using guild funds
      if guild_funds == true and GetGuildBankWithdrawMoney() >= cost then
        RepairAllItems(1)
        print(format('|cff1994ff'..L.MERCHANT_GUILD..': %.1fg|r', cost * 0.0001))
        PlaySound(SOUNDKIT.ITEM_REPAIR)
      -- using personal funds
      elseif GetMoney() > cost then
        RepairAllItems()
        print(format('|cff1994ff'..L.MERCHANT_REPAIR..': %.1fg|r', cost * 0.0001))
        PlaySound(SOUNDKIT.ITEM_REPAIR)
      -- no money
      else
        print('|cff1994ff'..L.MERCHANT_BROKE..'.|r')
      end
    end
  end
end)
