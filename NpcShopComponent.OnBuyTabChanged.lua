return function (self,event) 
--if (self.CurrentBuyTab == event.TabIndex) then
--    return
--end
self.CurrentBuyTab = event.TabIndex

---@type table<NpcShopItem>
local list = self.StockList
local buyItemsNum = #list
---@type table<Entity>
local entries = self.BuyItemEntries
local separators = self.BuyItemSeparators
self:EnsureItemEntriesForDemand(entries, separators, self.BuyItemList, buyItemsNum)
self:ResizeItemListContainer(self.BuyItemList, buyItemsNum, true)
self:DisableUnnecessaryItemEntries(entries, separators, buyItemsNum, #entries)
for i=1,buyItemsNum do
	entries[i].Enable = true
	if (separators[i]) then
		separators[i].Enable = true	
	end
	local shopItemEntry = entries[i].NpcShopItemEntryComponent
	shopItemEntry:SetNpcShopItem(self, list[i], i)
	shopItemEntry:Invalidate()
	shopItemEntry.SelectionBackground.Enable = false
end
self.SelectedBuyShopItem = nil
--log(string.format("buyItemsNum=%d", buyItemsNum))
_ScrollEventHolder:SetScrollbarInteractible(self.BuyItemList.Parent, buyItemsNum > 5)

-- 별 쓸모가 없는 것 같다
self.BuyItemList.Parent.Enable = false
self.BuyItemList.Parent.Visible = false
self.BuyItemList.Enable = false
self.BuyItemList.Visible = false
_UpdateComponentLogic:InsertUpdateEnable(self.BuyItemList.Parent)
_UpdateComponentLogic:InsertUpdateVisible(self.BuyItemList.Parent)
_UpdateComponentLogic:InsertUpdateEnable(self.BuyItemList)
_UpdateComponentLogic:InsertUpdateVisible(self.BuyItemList)
end