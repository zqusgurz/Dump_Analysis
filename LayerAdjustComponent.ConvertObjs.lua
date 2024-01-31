return function (self,layerId,obj,adjustSortingLayer) 
local i = 0
for _,o in ipairs(obj.Children) do
	---@type Entity
	local child = o
	local key = tonumber(child.Name:sub(1, 4))
	child.SpriteRendererComponent.OrderInLayer = -1999 + key
	i += 1
end
return i

end