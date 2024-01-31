return function (self,entity,remember,invalidateFlag) 
local uiComps = entity:GetChildComponentsByTypeName(_Types:Get(UITransformComponent), true)
for _, pp in ipairs(uiComps) do
	_EntityUtils:CheckUIMemory(pp.Entity, remember, invalidateFlag)
end
end