return function (self,layerId,obj,adjustSortingLayer) 
local i = 0
for _,o in ipairs(obj.Children) do
	---@type Entity
	local child = o
	local key = tonumber(child.Name:sub(4, 8))
	child.SpriteRendererComponent.OrderInLayer = -999 + key
	if (adjustSortingLayer) then
    	child.SpriteRendererComponent.SortingLayer = "MapLayer" .. layerId
	end
	i += 1
end
return i
end