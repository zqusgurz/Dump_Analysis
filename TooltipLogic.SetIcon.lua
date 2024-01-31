return function (self,iconEntity,ruid,size,scale,offset) 
iconEntity.SpriteGUIRendererComponent.ImageRUID = ruid
iconEntity.SpriteGUIRendererComponent.LocalScale = Vector2.one * scale * 2
iconEntity.SpriteGUIRendererComponent.PreserveSprite = PreserveSpriteType.NativeSize
iconEntity.UITransformComponent.RectSize = size * 2 * scale

local pos = offset * 2
_EntityUtils:SetPositionUIEntitySafelyEx(iconEntity, pos.x, pos.y)
end