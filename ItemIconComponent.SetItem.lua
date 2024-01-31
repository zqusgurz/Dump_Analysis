return function (self,itemId) 
self.ItemId = itemId
_TooltipItemIconLogic:DrawItem(itemId, 0, self.Icon, self.CashIcon, self.IconRaw, 1, _ItemAssetType.Regular)
end