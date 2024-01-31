return function (self,keyType,pos) 
local key = KeyboardKey.CastFrom(keyType)
local parent = _EntityService:GetEntityByPath("/ui/ControlWindowGroup/KeyConfig/Keys")
local obj = _SpawnService:SpawnByModelId("model://da77a95f-29b2-4ff7-a0da-f3a30d8fa789", keyType, Vector3.zero, parent)
obj.KeyConfigElementComponent.KeyType = keyType
obj.UITransformComponent.anchoredPosition = Vector2(pos.x, -pos.y) * 2

local keyTypeSprite = obj:GetChildByName("KeyType")
local keyId = self:KeyToIcon(keyType)
--local keys = _ResourceMan:GetObject("UI/UIWindow.img/KeyConfig/key")
local keyRuid = _UidMan:Get(string.format("UI/UIWindow.img/KeyConfig/key/%d", keyId))
local sprite = _ResourceService:LoadSpriteAndWait(keyRuid)
keyTypeSprite.UITransformComponent.RectSize = Vector2(sprite.Width, sprite.Height) * 2
keyTypeSprite.SpriteGUIRendererComponent.ImageRUID = keyRuid
if (key == KeyboardKey.Space) then
	keyTypeSprite.UITransformComponent.anchoredPosition.x = 0
end

obj:GetChildByName("Func").Enable = false
obj:GetChildByName("Item").Enable = false
obj:GetChildByName("Skill").Enable = false
obj:GetChildByName("IconBase").Enable = false
end