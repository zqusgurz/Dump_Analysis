return function (self,map) 
--log("OnLoadedMap", map.Name)
local maxMap = self.MaxMap
local minMap = self.MinMap
local min = self.Min
if (isvalid(maxMap)) then
	maxMap.MiniMapComponent:OnLoadedMap(map)
end
if (isvalid(minMap)) then
	minMap.MiniMapComponent:OnLoadedMap(map)
end
if (isvalid(min)) then
	min.MiniMapComponent:OnLoadedMap(map)
end
self:UpdateMiniMap(map)
end