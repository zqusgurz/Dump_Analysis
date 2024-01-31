return function (self,worldMap,data) 
self.Path = nil
self.MapLink = nil
self.WorldMap = worldMap
self.Type = data.Type
self.MapId = data.MasterMapId
self.Title = data.Title
self.Desc = data.Desc
if (self.Type == 0) then
	self.Entity.SpriteGUIRendererComponent.ImageRUID = _UidMan:Get("Map/MapHelper.img/worldMap/mapImage/0")
	_EntityUtils:SetUIEntitySafelyEx(self.Entity, data.Spot.x, -data.Spot.y, 20, 20)
elseif (self.Type == 1) then
	self.Entity.SpriteGUIRendererComponent.ImageRUID = _UidMan:Get("Map/MapHelper.img/worldMap/mapImage/1")
	_EntityUtils:SetUIEntitySafelyEx(self.Entity, data.Spot.x, -data.Spot.y, 14, 14)
elseif (self.Type == 2) then
	self.Entity.SpriteGUIRendererComponent.ImageRUID = _UidMan:Get("Map/MapHelper.img/worldMap/mapImage/2")
	_EntityUtils:SetUIEntitySafelyEx(self.Entity, data.Spot.x, -data.Spot.y, 20, 20)
elseif (self.Type == 3) then
	self.Entity.SpriteGUIRendererComponent.ImageRUID = _UidMan:Get("Map/MapHelper.img/worldMap/mapImage/3")
	_EntityUtils:SetUIEntitySafelyEx(self.Entity, data.Spot.x, -data.Spot.y, 13, 13)
end
end