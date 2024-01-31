return function (self,entity,x,y) 
if (isvalid(entity.MemoryInitValuesComponent)) then
	if (x ~= nil) then
		entity.MemoryInitValuesComponent.OriginOffsetMin.x = x
	end
	if (y ~= nil) then
		entity.MemoryInitValuesComponent.OriginOffsetMin.y = y
	end
else
	if (x ~= nil) then
		entity.UITransformComponent.OffsetMin.x = x
	end
	if (y ~= nil) then
		entity.UITransformComponent.OffsetMin.y = y		
	end
end
self:CheckUIMemory(entity, false, -1)
end