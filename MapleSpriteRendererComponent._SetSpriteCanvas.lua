return function (self,obj,firstChanged) 
---@type AnimationFrameData
local anim =_AnimationMan:GetAnimationFrameData(obj, self.DefaultAnimationDelay)
return self:SetRawAnimation(anim, firstChanged)
end