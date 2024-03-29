return function (self,live,regionType) 
local time = os.clock()
local ds = _DataService:GetTable("WorldCoinShop")
local rows = ds:GetAllRow()
self.IndexedProductTabs = {
	[1] = {},
	[2] = {},
	[3] = {},
	[4] = {},
	[5] = {},
}
for i=1,#rows do
	local row = rows[i]
	local productId = tonumber(row:GetItem("ProductId"))
	local itemId = tonumber(row:GetItem("ItemId"))
	local number = tonumber(row:GetItem("Number"))
	local period = tonumber(row:GetItem("Period"))
	---@type WorldCoinProduct
	local product = {}
	product.ItemId = itemId
	product.Number = number
	product.ProductId = productId
	product.Period = period
	if (_DevLogic.IsDevMode) then
		product.WorldCoinProductId = row:GetItem("WorldCoinDevProductId")
		log("dev product id ", product.WorldCoinProductId)
	else
		if (regionType == "TestVic") then
			product.WorldCoinProductId = row:GetItem("WorldCoinTestVicProductId")
		elseif (regionType == "TestFM") then
			product.WorldCoinProductId = row:GetItem("WorldCoinTestFMProductId")
		elseif (regionType == "TestOrb") then
			product.WorldCoinProductId = row:GetItem("WorldCoinTestOrbProductId")
		elseif (regionType == "LiveVic") then
			product.WorldCoinProductId = row:GetItem("WorldCoinLiveVicProductId")
		elseif (regionType == "LiveFM") then
			product.WorldCoinProductId = row:GetItem("WorldCoinLiveFMProductId")
		elseif (regionType == "LiveOrb") then
			product.WorldCoinProductId = row:GetItem("WorldCoinLiveOrbProductId")
		else
			log_error("[FATAL] undefined region type!")
			product.WorldCoinProductId = ""
		end
		log("release product id ", product.WorldCoinProductId)
	end
	if (not _UtilLogic:IsNilorEmptyString(product.WorldCoinProductId)) then
		self.ProductsByWorldShopKey[product.WorldCoinProductId] = product
	end
	product.Purchasable = false
	local category = product.ProductId // 10000000
	local tabs = self.IndexedProductTabs[category]
	tabs[#tabs + 1] = product
	self.Products[productId] = product
end
self:UpdateProducts(false)
log(string.format("Loaded %d products (%.2f secs)", #rows, os.clock() - time))
end