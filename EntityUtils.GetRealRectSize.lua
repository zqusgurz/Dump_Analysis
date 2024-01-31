return function (self,entity) 
local mm = entity.MemoryInitValuesComponent
if (isvalid(mm)) then
	return mm.OriginRectSize
else
	local uit = entity.UITransformComponent
	return uit.RectSize
end
end