return function (self,funcType,pos) 
local parent = _EntityService:GetEntityByPath("/ui/ControlWindowGroup/KeyConfig/FuncSystems")
local obj = _SpawnService:SpawnByModelId("model://2bde1394-b500-4c27-bffc-55aafd03015a", "Function-"..funcType, Vector3.zero, parent)
obj.KeyConfigPlaceholderComponent.Function = funcType
obj.UITransformComponent.anchoredPosition = Vector2(pos.x, -pos.y)

local keyTypeSprite = obj:GetChildByName("Func")
local keys = _ResourceMan:GetObject("UI/UIWindow.img/KeyConfig/icon")
keyTypeSprite.UITransformComponent.RectSize = keys:GetVector2D(tostring(funcType), Vector2.zero)
keyTypeSprite.SpriteGUIRendererComponent.ImageRUID = keys:GetString(tostring(funcType), "")

obj:GetChildByName("Func").Enable = true
--obj:GetChildByName("Item").Enable = false
--obj:GetChildByName("Skill").Enable = false
--obj:GetChildByName("IconBase").Enable = false
end