return function (self) 
local onlineHeight = self.Online:AdjustListHeight()
self.Offline.Entity.UITransformComponent.anchoredPosition.y = -(232 + onlineHeight)
self.Offline:AdjustListHeight()
end