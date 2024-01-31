return function (self,event) 
local user = self.Entity
if (user.OwnerId ~= _UserService.LocalPlayer.OwnerId) then
	return
end
if (self.HitTime > _UtilLogic.ServerElapsedSeconds) then
	return
end
if (user.WsUser:IsDied()) then
	return
end
if (user.CalcDamageComponent.Syncing > 0) then
	return
end
local bodyAttack = event.TriggerBodyEntity
local hh = bodyAttack.TriggerComponent
if (not isvalid(hh)) then
	return
end
if (hh.CollisionGroup == CollisionGroups.MapleMobBodyAttack) then
	local mob = bodyAttack.Parent
	local bodyAttackTrigger = mob.MobComponent.BodyAttack
	if (isvalid(bodyAttackTrigger) and bodyAttackTrigger.Enable) then
		if (user.PlayerTemporaryStat:GetValue(_CTS.DarkSight) == 0) then
			self:OnBodyAttackedByMob(mob)	
		end
		return
	end
elseif (hh.CollisionGroup == CollisionGroups.MobBall) then
	local hit = bodyAttack.MobBallComponent.Hit
	if (hit) then
		hit()
	end
end
end