return function (self,input) 
local children = self.ItemsRoot.Children
for i=#children,1,-1 do
	children[i]:Destroy()
end
---@type table<integer>
local count = 0
local items = input
for i=1,#items do
	local product = _WorldCoinShopLogic.Products[items[i]]
	if (not product) then
		continue
	end
	local model = _SpawnService:SpawnByModelId("model://a0edb721-7581-4532-9aef-072eff915700", "Item", Vector3.zero, self.ItemsRoot)
	model.UITransformComponent.anchoredPosition = Vector2(0, -80 * count)
	model.ConfirmBuyItemEntryComponent:SetProduct(product)
	count += 1
end
local height = 40 + 120 + 86 + 80 * count
self.Entity.UITransformComponent.RectSize = Vector2(572, height)
end