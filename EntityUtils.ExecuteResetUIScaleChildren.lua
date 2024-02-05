return function (self,entity) 
local uiComps = entity:GetChildComponentsByTypeName(_Types:Get(MemoryInitValuesComponent), true)
for _, pp in ipairs(uiComps) do
	_EntityUtils:ResetUIScaleMemory(pp.Entity)
end
end