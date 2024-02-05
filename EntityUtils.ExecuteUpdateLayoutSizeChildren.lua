return function (self,entity) 
local uiComps = entity:GetChildComponentsByTypeName(_Types:Get(UITransformComponent), true)
for _, pp in ipairs(uiComps) do
	_EntityUtils:UpdateLayoutSize(pp.Entity)
end
end