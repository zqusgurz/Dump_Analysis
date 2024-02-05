return function (self,pool,entity,forceRelease) 
if (entity.Enable or forceRelease) then
	if (isvalid(entity.TransformComponent)) then
		entity.TransformComponent.WorldPosition.z = 10000
	elseif (isvalid(entity.UITransformComponent)) then
		entity.UITransformComponent.anchoredPosition = Vector2(-10000,-100000)
	end
	table.insert(pool, entity)
	entity.Enable = false
end
end