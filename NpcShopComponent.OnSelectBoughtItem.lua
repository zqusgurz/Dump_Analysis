return function (self,TI,pos,focus) 
-- log(string.format("SelectBoughtItem TI:%d pos:%d", TI, pos))
---@type table<Entity>
local entries = self.SellItemEntries
for i=1,#entries do
	local entryItem = entries[i].NpcShopItemEntryComponent
	if (entries[i].Enable and entryItem.LinkedSellTI == TI and entryItem.LinkedSellPos == pos) then
		self:SetSelectedShopItem(entryItem, true)
		if (focus) then
			self:FocusToSellItem(i)
		end
		break
	end
end
end