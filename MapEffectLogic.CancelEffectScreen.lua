return function (self) 
local entity = _EntityService:GetEntityByPath("/ui/TempUIGroup/ScreenEffect_Wrong")
local com = entity.SpriteGUIRendererComponent
com.Enable = false
entity.Enable = false
end