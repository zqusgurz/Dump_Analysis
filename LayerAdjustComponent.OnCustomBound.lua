return function (self,mapId) 
local map = _EntityService:GetEntityByPath(string.format("/maps/%s", mapId))
local mapInfo = map.MapInfoComponent
local mapComp = map.MapComponent

if (mapInfo.VRTop ~= 0 or mapInfo.VRRight ~= 0 or
	mapInfo.VRLeft ~= 0 or mapInfo.VRBottom ~= 0) then
	mapComp.UseCustomBound = true
	mapComp.LeftBottom = Vector2(mapInfo.VRLeft, -mapInfo.VRBottom) / 100
	mapComp.RightTop = Vector2(mapInfo.VRRight, -mapInfo.VRTop) / 100
	_EditorService:Notification(string.format("LB=(%.2f, %.2f) RT=(%.2f, %.2f)", mapComp.LeftBottom.x, mapComp.LeftBottom.y,
			mapComp.RightTop.x, mapComp.RightTop.y))
	_EditorService:SaveMap()
else
	mapComp.UseCustomBound = false
	_EditorService:Notification("할 필요 없는 맵 (VRLimit 값 없음)")
end

end