return function (self,openShop) 
---@type table<integer, WorldCoinProduct>
local tabl = self.Products
for _,p in pairs(tabl) do
	p.Purchasable = false
end

local pages = _WorldShopService:GetProductsAndWait(WorldShopProductType.Item, nil)
while true do
	local products = pages:GetCurrentPageDatas()
	for i=1,#products do
		local product = products[i]
		local status = product.Status
		local productId = product.Id
		
		---@type WorldCoinProduct
		local localProduct = self.ProductsByWorldShopKey[productId]
		if (not localProduct) then
			continue
		end
		
		localProduct.Price = product.Price
		localProduct.Currency = 1000
		if (status == WorldShopProductStatus.Ing) then
			localProduct.Purchasable = true
		end
		localProduct.Name = product.Name
	end
	if (pages.IsLastPage) then
		break
	end
	pages:MoveToNextPageAndWait()
end
if (self:IsClient()) then
	if (openShop) then
		local shop = _AppService:Get().ControlWindowMan.WorldCoinShop.WorldCoinShopComponent
		shop:ChangeTab(1)
		shop.LoadingOverlay.Enable = false
		self.LoadingShop = false
	end
end
end