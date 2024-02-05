return function (self,product) 
self.ItemIcon.AssetType = _ItemAssetType.WorldCoinShopProduct
self.ItemIcon.IconType = _ItemIconElementType.WorldCoinShop
self.ItemIcon:SetItem(product.ItemId)
if (_Items:IsTreatSingly(product.ItemId)) then
	self.ItemIcon:SetItemNo(-1)
else
	self.ItemIcon:SetItemNo(product.Number)
end
self.ItemIcon:SetSlotDisabled(false)
self.ItemName.Text = _StringMan:GetItemName(product.ItemId)
-- WorldCoin
self.CurrencyIcon.SpriteGUIRendererComponent.ImageRUID = "a8f3146382c07494d8dbce9b93c1a5c3"
self.ItemPrice.Text = _NumberUtils:Format(product.Price)
self.Product = product
local purchasable = _WorldCoinShopLogic:IsPurchasableTo(product, _UserService.LocalPlayer)
self.BtBuy.FunctionButtonComponent:SetInteractible(purchasable)
self.BtGift.FunctionButtonComponent:SetInteractible(false)
end