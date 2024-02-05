return function (self,mapId) 
local candidates = {}
for key,mapInfoTable in pairs(self.MapIdToSpot) do
	if (not mapInfoTable[mapId]) then
		continue
	end
	---@type WorldMapInfo
	local worldMapData = self.WorldMapInfo[key]
	if (worldMapData.ParentMap) then
		candidates[worldMapData.ParentMap] = -1
	end
	if (not candidates[key]) then
		candidates[key] = worldMapData
	end
end
---@type WorldMapInfo
local leafWorldMap = nil
for key,value in pairs(candidates) do
	if (value == -1) then
		continue
	end
	if (leafWorldMap == nil) then
		log("Found leaf worldmap Key: ", key)
		leafWorldMap = value
	else
		log_error(string.format("Error! current key: %s / before key: %s", key, leafWorldMap.Key))
	end
end
return leafWorldMap
end