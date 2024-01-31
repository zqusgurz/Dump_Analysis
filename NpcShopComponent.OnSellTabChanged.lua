return function (self,event) 
--if (self.CurrentSellTab == event.TabIndex) then
--    return
--end
self.CurrentSellTab = event.TabIndex

local TI = event.TabIndex
local sellItems = self:MakeSellItems(TI)
self.SellItems = sellItems
local sellItemsNum = #sellItems 

---@type table<Entity>
local entries = self.SellItemEntries
local separators = self.SellItemSeparators
self:EnsureItemEntriesForDemand(entries, separators, self.SellItemList, sellItemsNum)
self:ResizeItemListContainer(self.SellItemList, sellItemsNum, true)
self:DisableUnnecessaryItemEntries(entries, separators, sellItemsNum, #entries)
for i=1,sellItemsNum do
	if (separators[i]) then
		separators[i].Enable = true	
	end
	self:SetNpcShopSellItemEntry(entries, sellItems, i)
end
self.SelectedSellShopItem = nil
--log(string.format("sellItemsNum=%d  TI=%d", sellItemsNum, TI))
_ScrollEventHolder:SetScrollbarInteractible(self.SellItemList.Parent, sellItemsNum > 5)

-- 별 쓸모가 없는 것 같다
self.SellItemList.Parent.Enable = false
self.SellItemList.Parent.Visible = false
self.SellItemList.Enable = false
self.SellItemList.Visible = false
_UpdateComponentLogic:InsertUpdateEnable(self.SellItemList.Parent)
_UpdateComponentLogic:InsertUpdateVisible(self.SellItemList.Parent)
_UpdateComponentLogic:InsertUpdateEnable(self.SellItemList)
_UpdateComponentLogic:InsertUpdateVisible(self.SellItemList)
end