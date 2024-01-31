return function (self,i) 
---@type table<WorldCoinProduct>
local t = self.ProductTable
for _,product in pairs(t) do
	if (not product.Purchasable) then
		continue
	end
	if (i == 1) then
		return product
	end
	i -= 1
end
return nil
end