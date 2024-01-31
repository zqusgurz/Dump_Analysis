return function (self,name) 
local entity = _EntityService:GetEntityByTag(name)
if (not isvalid(entity)) then
	return
end
local com = entity.SpriteRendererComponent
com.Enable = false
com.EndFrameIndex ^= 1
com.Enable = true
entity.Enable = true
end