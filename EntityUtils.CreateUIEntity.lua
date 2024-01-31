return function (self,imageRUID,pos,entityName,parent) 
local uiScale = 2

local obj = _SpawnService:SpawnByModelId("model://uisprite", entityName, Vector3.zero, parent)
obj.UITransformComponent.AlignmentOption = AlignmentType.BottomLeft
obj.UITransformComponent.AnchorsMin = Vector2.zero
obj.UITransformComponent.AnchorsMax = Vector2.zero
obj.UITransformComponent.OffsetMin = pos
obj.UITransformComponent.Pivot = Vector2.zero
if (imageRUID ~= nil) then
	---@type Sprite
	local sprite = _ResourcePreloadService:GetSprite(imageRUID)
	obj.SpriteGUIRendererComponent.ImageRUID = imageRUID
	obj.UITransformComponent.OffsetMax = pos + Vector2(sprite.Width, sprite.Height) * uiScale
end
return obj
end