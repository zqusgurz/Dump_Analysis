return function (self,firstPos,enableOnGet) 
-- 글자 렌더링 할 때 오브젝트 풀링을 활용하려고 하는데...
-- 이게 최선인지는 몰?루

if (#self._poolObjects == 0) then
	local index = self._T.Index
	self._T.Index = self._T.Index + 1
	local ret = _SpawnService:SpawnByModelId(self.ModelId, "PoolObj-"..index, firstPos, self.Entity)
	self._T.OrderOffset += 1
	return ret
end
---@type Entity
local entity = table.remove(self._poolObjects, 1)
if (self.AdjustPositionOnPick) then
	entity.TransformComponent.WorldPosition = firstPos:Clone()
end
local ui = entity.UITransformComponent
if (isvalid(ui)) then
	ui.anchoredPosition = Vector2(-10000, -10000)
end
if (enableOnGet) then
	if (self.ManagementAsVisible) then
		entity.Visible = true
	else
		entity.Enable = true
	end
end
self._T.OrderOffset += 1
return entity
end