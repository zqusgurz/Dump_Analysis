return function (self,item) 
self.ItemId = item.ItemId
local flag = _ItemIconFlag:MakeIconFlag(item)
_TooltipItemIconLogic:DrawItem(item.ItemId, flag, self.Icon, self.CashIcon, self.IconRaw, self.ItemScale, self.AssetType)
end