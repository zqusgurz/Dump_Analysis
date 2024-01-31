return function (self,product) 
self.Icon.IconType = _ItemIconElementType.WorldCoinShop
self.Icon:SetItem(product.ItemId)
self.Icon:SetItemNo(product.Number)
self.ItemName.Text = _StringMan:GetItemName(product.ItemId)
self.ItemPrice.Text = string.format("%s MaplePoint", _NumberUtils:Format(product.Price))
end