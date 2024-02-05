return function (self,level) 
self.MiniMapZoomLevel = math.min(2, math.max(0, level))
self:UpdateMiniMap(_UserService.LocalPlayer.CurrentMap)
end