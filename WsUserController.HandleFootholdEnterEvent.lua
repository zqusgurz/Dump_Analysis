return function (self,event) 
local user = self.Entity
if (user.WsUser.Loaded == 0) then
	return
end
_PlayerActiveSkillLogic.FallSkillTick = 0
local Entity = event.Entity
local Foothold = event.Foothold
--log("Foothold enter", Foothold.Id, self.Entity.RigidbodyComponent:IsOnGround())
if (self.FallDownTick > 29.85074626865672) then -- 600000 / fallSpeed(670.0) / tickSpeed(30.0)
	local damage = 36 - 336 // (self.FallDownTick - 18)
	--log(string.format("tick = %d  fallDamage=%d", self.FallDownTick, damage))
	if (damage > 0) then
		local hit = user.PlayerHitComponent
		if (hit.HitTime > _UtilLogic.ServerElapsedSeconds) then
			return
		end
		hit:SetDamaged(damage, user.WsUserController:IsFacingLeft(), nil, 0, 0)
	end
end
self.LastFoothold = Foothold.Id
end