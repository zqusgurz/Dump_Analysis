return function (self) 
local decomposed = _NumberUtils:DecomposeDigits(self.Value)
local digitCount = #decomposed
local x = 0
for i=1,digitCount do
	---@type Entity
	local entity = self.Entities[i]
	local digit = decomposed[i]
	local width = digit == 1 and 10 or 16
	entity.SpriteGUIRendererComponent.ImageRUID = _UidMan:Get(string.format("UI/Basic.img/ItemNo/%d", digit))
	entity.UITransformComponent.RectSize.x = width * self.Rate
	entity.UITransformComponent.anchoredPosition.x = x * self.Rate
	entity.SpriteGUIRendererComponent.Color.a = 1
	entity.Enable = true
	x += width
end
for i=digitCount+1,4 do
	---@type Entity
	local entity = self.Entities[i]
	entity.SpriteGUIRendererComponent.Color.a = 0
	entity.Enable = false
end
end