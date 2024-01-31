return function (self,uiEntity,x,y) 
local k = uiEntity.MemoryInitValuesComponent
if (isvalid(k)) then
	local pos = k.OriginAnchoredPosition
	if (x ~= nil) then
		pos.x += x
	end
	if (y ~= nil) then
		pos.y += y
	end
else
	local pos = uiEntity.UITransformComponent.anchoredPosition
	if (x ~= nil) then
		pos.x += x
	end
	if (y ~= nil) then
		pos.y += y
	end
end
self:CheckUIMemory(uiEntity, false, 1)
end