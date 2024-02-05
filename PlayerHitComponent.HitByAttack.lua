return function (self,mob,attackIndex,info) 
local user = _UserService.LocalPlayer
if (self.HitTime > _UtilLogic.ServerElapsedSeconds) then
	return
end
if (user.WsUser:IsDied()) then
	return
end
if (user.CalcDamageComponent.Syncing > 0) then
	return
end
local userPos = user.TransformComponent.WorldPosition
local mobPos = mob.TransformComponent.WorldPosition
local hitByLeft = mobPos.x < userPos.x
local randMiss = user.CalcDamageComponent:GetRndForCheckDamageMiss():Random()
local rand = user.CalcDamageComponent:GetRndForMob():Random()
local damage
if (info.MagicAttack) then
	if (_CalcDamageLogic:CheckMDamageMiss(user, mob, randMiss)) then
		damage = 0
	else
		damage = _CalcDamageLogic:MDamageMvP(user, mob, info, rand)
	end
else
	if (_CalcDamageLogic:CheckPDamageMiss(user, mob, randMiss)) then
		damage = 0
	else
		damage = _CalcDamageLogic:PDamageMvP(user, mob, info, rand)
	end
end
self:SetDamaged(damage, hitByLeft, mob, attackIndex, 0)
end