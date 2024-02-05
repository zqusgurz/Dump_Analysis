return function (self,b) 
self.Entity.SpriteRendererComponent.FlipX = not b
if (self:IsServer()) then
	local affectedComponent = self.Entity.MobAffectedComponent
	if (isvalid(affectedComponent)) then
		affectedComponent:UpdateHeadPositionFlipX()
	end
end
self:UpdateTriggerBoxByState(self.Entity.StateComponent.CurrentStateName)
end