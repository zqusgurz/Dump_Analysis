return function (self,itemId) 
self.Icon.IconRaw = true
self.Icon:SetItem(itemId)
self.ItemName.Text = _StringMan:GetItemName(itemId)
self.ReqLevel.Text = tostring(_ItemInfoMan:GetReqLevel(itemId))
end