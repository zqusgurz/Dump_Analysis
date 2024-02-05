return function (self) 
local worldMapWin = self.WorldMap.WorldMapComponent
if (worldMapWin:IsVisible()) then
	worldMapWin:SetVisible(false, true)
else
	local mapId = tonumber(_UserService.LocalPlayer.CurrentMapName:sub(2))
	if (mapId == nil) then
		_UtilDlgLogic:Show("현재 월드맵 보기가\n지원되지 않는 곳에 있습니다")
		return
	end
	local leafWorldMap = _WorldMapLogic:FindLeafWorldMap(mapId)
	if (leafWorldMap == nil) then
		_UtilDlgLogic:Show("현재 월드맵 보기가\n지원되지 않는 곳에 있습니다.")
		return
	end
	worldMapWin:ChangeWorldMap(leafWorldMap.Key, false)
	worldMapWin:SetVisible(true, true)
end
end