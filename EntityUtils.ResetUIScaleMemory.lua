return function (self,entity) 
local k = entity.MemoryInitValuesComponent
if (isvalid(k)) then
	k:ResetToRatio(Vector2.one, -1)
end
end