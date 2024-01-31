return function (self,effectObj,pos,orderOffset) 
-- 사용법은 DamageTestComponent 참조

self.Entity.TransformComponent.WorldPosition = pos

local size = _WzUtils:GetSize(effectObj)
local position = pos:Clone()
local digit = self:MakeDigit(position, effectObj, 0, orderOffset)
self:BeginTween({digit}, pos)
end