return function (self,TI,pos,isRemained) 
if (self.CurrentSellTab ~= TI) then
	return
end

---@type table<Entity>
local entries = self.SellItemEntries

local found = -1
local resetScroll = false

for i=1,#entries do
	local entryItem = entries[i].NpcShopItemEntryComponent
	if (entries[i].Enable and entryItem.LinkedSellTI == TI and entryItem.LinkedSellPos == pos) then
		if (isRemained) then
			entryItem:Invalidate()
			return
		else
			found = i
			break
		end
	end
end

local sellItems = self:MakeSellItems(TI)
self.SellItems = sellItems
local sellItemsNum = #sellItems

self:EnsureItemEntriesForDemand(entries, self.SellItemSeparators, self.SellItemList, sellItemsNum)
self:ResizeItemListContainer(self.SellItemList, sellItemsNum, resetScroll)
self:DisableUnnecessaryItemEntries(entries, self.SellItemSeparators, sellItemsNum, #entries)

if (found ~= -1) then
	for i=found,sellItemsNum do
		self:SetNpcShopSellItemEntry(entries, sellItems, i)
	end
	for i=1,found-1 do
		entries[i].NpcShopItemEntryComponent.SelectionBackground.Enable = false
	end
else
	for i=1,sellItemsNum do
		self:SetNpcShopSellItemEntry(entries, sellItems, i)
	end
end
if (not isRemained) then
	_ScrollEventHolder:SetScrollbarInteractible(self.SellItemList.Parent, sellItemsNum > 5)
end

self.SelectedSellShopItem = nil
end