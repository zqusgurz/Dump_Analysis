return function (self) 
local map = self.CurrentMap
if not (isvalid(map)) then
	return
end
-- Map Name
local mapName = _StringMan:GetMapName(map.Name)
local streetName = _StringMan:GetStreetName(map.Name)

self.MiniMapInfo = map.MinimapInfoComponent

if (isvalid(self.StreetName)) then
	self.StreetName.Text = streetName
end
if (isvalid(self.MapName)) then
	self.MapName.Text = mapName
end

local max = math.max
local min = math.min

-- Window Size
local miniMapWidth = 0
-- MaxMap
if (self.ZoomLevel == 2 and isvalid(self.MiniMapInfo)) then
	local mapNameWidth = self.MapName:GetPreferredWidth(mapName) / 2
	local streetNameWidth = self.StreetName:GetPreferredWidth(streetName) / 2
	local textWidth = 6 + 38 + 4 + max(mapNameWidth, streetNameWidth) + 5 + 6
	local originCanvasSize = self.MiniMapInfo.CanvasSize:Clone()
	self.MiniMapCanvasSize = Vector2(min(210, originCanvasSize.x), min(120, originCanvasSize.y))
	miniMapWidth = max(textWidth, 6 + self.MiniMapCanvasSize.x + 6)
	local miniMapHeight = 15 + self.MiniMapCanvasSize.y
	local size = self.MiniMapInfo.CanvasSize
	self.MiniMapCanvas.ImageRUID = self.MiniMapInfo.Canvas
	_EntityUtils:SetRectSizeUIEntitySafelyEx(self.StreetName.Entity, streetNameWidth + 20, nil)
	_EntityUtils:SetRectSizeUIEntitySafelyEx(self.MapName.Entity, mapNameWidth + 20, nil)
	
	local windowWidth = miniMapWidth
	local windowHeight = 72 + miniMapHeight
	
	_EntityUtils:SetRectSizeUIEntitySafelyEx(self.Entity, windowWidth, windowHeight)
	_EntityUtils:SetUIEntitySafelyEx(self.MapRenderTransform.Entity, nil, -72, windowWidth, miniMapHeight)
	_EntityUtils:SetRectSizeUIEntitySafelyEx(self.MiniMapCanvas.Entity.Parent, size.x, size.y)
end
-- MiniMap
if (self.ZoomLevel == 1 and isvalid(self.MiniMapInfo)) then
	local originCanvasSize = self.MiniMapInfo.CanvasSize:Clone()
	self.MiniMapCanvasSize = Vector2(min(210, originCanvasSize.x), min(120, originCanvasSize.y))
	miniMapWidth = 6 + self.MiniMapCanvasSize.x + 6
	local miniMapHeight = 15 + self.MiniMapCanvasSize.y
	local size = self.MiniMapInfo.CanvasSize
	self.MiniMapCanvas.ImageRUID = self.MiniMapInfo.Canvas
	
	local windowWidth = miniMapWidth
	local windowHeight = 29 + miniMapHeight
	
	_EntityUtils:SetRectSizeUIEntitySafelyEx(self.Entity, windowWidth, windowHeight)
	_EntityUtils:SetUIEntitySafelyEx(self.MapRenderTransform.Entity, nil, -29, windowWidth, miniMapHeight)
	_EntityUtils:SetRectSizeUIEntitySafelyEx(self.MiniMapCanvas.Entity.Parent, size.x, size.y)
end
-- Min
if (self.ZoomLevel == 0) then
	local mapNameWidth = self.MapName:GetPreferredWidth(mapName) / 2
	local streetNameWidth = self.StreetName:GetPreferredWidth(streetName) / 2
	local width = 5 + mapNameWidth + 7 + streetNameWidth + 79
	_EntityUtils:SetRectSizeUIEntitySafelyEx(self.Entity, width, nil)
	local streetNameEntity = self.StreetName.Entity
	local mapNameEntity = self.MapName.Entity
	_EntityUtils:SetRectSizeUIEntitySafelyEx(streetNameEntity, streetNameWidth + 20, nil)
	_EntityUtils:SetRectSizeUIEntitySafelyEx(mapNameEntity, mapNameWidth + 20, nil)
	_EntityUtils:SetPositionUIEntitySafelyEx(mapNameEntity, 5 + streetNameWidth + 7, nil)
end

-- Map Mark
if (isvalid(self.MapMark) and isvalid(self.MapNameTransform)) then
	local markName = map.MapInfoComponent.MapMark
	local mark = _UidMan:Get(string.format("Map/MapHelper.img/mark/%s", markName))
	if (not _UtilLogic:IsNilorEmptyString(markName) and markName ~= "None" and mark ~= nil) then
		self.MapMark.Color.a = 1
		self.MapMark.ImageRUID = mark
		_EntityUtils:SetPositionUIEntitySafelyEx(self.MapNameTransform.Entity, 38, nil)
	else
		self.MapMark.Color.a = 0
		_EntityUtils:SetPositionUIEntitySafelyEx(self.MapNameTransform.Entity, 0, nil)
	end
end
end