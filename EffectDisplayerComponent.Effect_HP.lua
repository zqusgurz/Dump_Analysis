return function (self,damage,pos,critical,attackIdx,userToMob) 
local dmgEff = _UserService.LocalPlayer.EffectDisplayerComponent.DamageEffect

local obj = dmgEff.ChildObjectPoolComponent:Get(pos)
local orderOffset = dmgEff.ChildObjectPoolComponent:GetOrderOffset() * 10
local damagePos = pos:Clone()
if (userToMob) then
	damagePos.y += 0.47
else
	damagePos.y += 0.7
end
damagePos.y += ((attackIdx - 1) * 0.3) + 0.15

local effect = self:GetProperDamageEffect(damage, critical, userToMob)
damage = math.abs(damage)
if (damage == 0) then
    obj.DamageEffectComponent:ShowWord(effect, damagePos, orderOffset)
else
--	log(damage, userToMob)
    obj.DamageEffectComponent:Show(effect, damage, damagePos, critical, orderOffset)
end
end