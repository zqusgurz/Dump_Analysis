return function (self,entity) 
local childs = entity.Children
for i=#childs,1,-1 do
	local child = childs[i]
	if (isvalid(child)) then
		_EntityService:Destroy(child)
	end
end
end