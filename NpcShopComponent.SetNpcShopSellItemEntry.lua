return function (self,entries,sellItems,i) 
entries[i].Enable = true
---@type NpcShopItemEntryComponent
local shopItemEntry = entries[i].NpcShopItemEntryComponent
local sellItem = sellItems[i]
shopItemEntry:SetNpcShopSellItem(self, sellItem.TI, sellItem.Pos, sellItem.ItemId)
shopItemEntry:Invalidate()
shopItemEntry.SelectionBackground.Enable = false
end