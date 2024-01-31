return function (self,mob) 
local user = self.Entity
local rand = user.CalcDamageComponent:GetRndForMob():Random()
local randMiss = user.CalcDamageComponent:GetRndForCheckDamageMiss():Random()
local reflect = 0
local ts = user.PlayerTemporaryStat

local damage
if (_CalcDamageLogic:CheckPDamageMiss(user, mob, randMiss)) then
	damage = 0
else
	damage = _CalcDamageLogic:PDamageMvP(user, mob, nil, rand)
	reflect = ts:GetValue(_CTS.PowerGuard)
end

local pos = user.TransformComponent.WorldPosition:Clone()
local hitByLeft = mob.TransformComponent.WorldPosition.x < pos.x
self:SetDamaged(damage, hitByLeft, mob, 0, reflect)
end