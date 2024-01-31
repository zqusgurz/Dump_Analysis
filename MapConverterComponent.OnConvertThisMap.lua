return function (self) 
_EditorService:GetCurrentMap(function(mapName)
	local mapId = tonumber(_UtilLogic:SubString(mapName, 2))
	local path = string.format("Map/Map/Map%d/%09d.img", mapId // 100000000, mapId)
	local obj = _ResourceMan:GetObject(path)
	local map = _EntityService:GetEntityByPath("/maps/" .. mapName)
	self:Convert(obj, map)
end)
end