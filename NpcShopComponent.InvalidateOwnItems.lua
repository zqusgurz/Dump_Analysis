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
		entryItem:Invalidate()
		break
	end
end
end