return function (self,target) 
local targetPos = target.TransformComponent.WorldPosition:ToVector2()
local targetState = target.StateComponent.CurrentStateName
local bc, bs = self:GetBodyRect(targetState == "PRONE" or targetState == "PRONESTAB")
return BoxShape(targetPos + bc, bs, 0)
end