return function (self,path) 
local entity = _EntityService:GetEntityByPath("/ui/TempUIGroup/ScreenEffect_Wrong")
local com = entity.SpriteGUIRendererComponent
com.Enable = false
com.ImageRUID = _UidMan:GetAnimation(path)
com.EndFrameIndex ^= 1
com.Enable = true
entity.Enable = true
end