return function (self,died) 
local user = self.Entity
local userId = user.OwnerId
if (died) then
	local pos = user.TransformComponent.WorldPosition:Clone()
	pos.y += 0.01
	local fh = user.CurrentMap.FootholdComponent:Raycast(pos:ToVector2(), Vector2.down, 100)
	if (fh ~= nil) then
		pos.y = fh:GetYByX(pos.x)
	end
	
	if (userId == _UserService.LocalPlayer.OwnerId) then
		user.PlayerControllerComponent.FixedLookAt = user.PlayerControllerComponent.LookDirectionX
		self:SetMovementEnable(false)
		pos.y += 0.2
		user.TransformComponent.WorldPosition = pos
	end
	
	user.EffectDisplayerComponent:PlayEffect_Died(pos)
else
	if (userId == _UserService.LocalPlayer.OwnerId) then
		user.PlayerControllerComponent.FixedLookAt = 0
		self:SetMovementEnable(true)
	end
	user.EffectDisplayerComponent:HideEffect(false, "Tomb")
end
end