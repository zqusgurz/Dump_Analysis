return function (self,shopItemEntry,onlySelect) 
if (shopItemEntry.LinkedNpcShopItem == nil) then
	if (not onlySelect and self.SelectedSellShopItem == shopItemEntry.Entity) then
		if (self:CheckSelectClickedTime()) then
			self:OnTrySelling()
		end
	else
		if (self.SelectedSellShopItem) then
			self.SelectedSellShopItem.NpcShopItemEntryComponent.SelectionBackground.Enable = false
		end
		self.SelectedSellShopItem = shopItemEntry.Entity
	end
else
	if (not onlySelect and self.SelectedBuyShopItem == shopItemEntry.Entity) then
		if (self:CheckSelectClickedTime()) then
			self:OnTryBuying()
		end
	else
		if (self.SelectedBuyShopItem) then
			self.SelectedBuyShopItem.NpcShopItemEntryComponent.SelectionBackground.Enable = false
		end
		self.SelectedBuyShopItem = shopItemEntry.Entity
	end
end
shopItemEntry.SelectionBackground.Enable = true
self.LastSelectedTime = _UtilLogic.ElapsedSeconds
end