return function (self,damage,evadeEffect,templateId,attackIndex,left,fromUserId) 
if (fromUserId == _UserService.LocalPlayer.OwnerId) then
	return
end

-- 여기?
self:PlayHitEffect(templateId, attackIndex, left)

local pos = self.Entity.TransformComponent.WorldPosition:Clone()
self.Entity.EffectDisplayerComponent:Effect_HP(damage, pos, false, 1, false)
end