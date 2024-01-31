return function (self,info) 
self.LinkTarget = info.LinkTarget
self.Entity.SpriteGUIRendererComponent.ImageRUID = info.LinkImg
self.Entity.SpriteGUIRendererComponent.Color.a = 0
local origin = info.LinkImgOrigin
local size = info.LinkImgSize
_EntityUtils:SetUIEntitySafelyEx(self.Entity, -origin.x, origin.y, size.x, size.y)
end