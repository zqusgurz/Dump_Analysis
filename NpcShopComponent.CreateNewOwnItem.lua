return function (self,TI,pos) 
if (self.CurrentSellTab ~= TI) then
	self.SellTab.TabsComponent:OnSelectedTab(TI)
	self:OnSellTabChanged(ChangeTabEvent(TI))
end
---@type table<Entity>
local entries = self.SellItemEntries
for i=1,#entries do
	local entryItem = entries[i].NpcShopItemEntryComponent
	if (entries[i].Enable and entryItem.LinkedSellTI == TI and entryItem.LinkedSellPos == pos) then
		return
	end
end

---@type ItemSlotBase
local tt = _UserService.LocalPlayer.WsCharacterData:GetItem(TI, pos)
if (not self:IsSellableItem(tt)) then
	return
end

local sellItems = self.SellItems
local sellItemsNum = #sellItems
sellItems[sellItemsNum + 1] = {TI=TI, Pos=pos, ItemId=tt.ItemId}
sellItemsNum += 1

self:EnsureItemEntriesForDemand(entries, self.SellItemSeparators, self.SellItemList, sellItemsNum)
self:ResizeItemListContainer(self.SellItemList, sellItemsNum, false)
self:DisableUnnecessaryItemEntries(entries, self.SellItemSeparators, sellItemsNum, #entries)
self:SetNpcShopSellItemEntry(entries, sellItems, sellItemsNum)
end