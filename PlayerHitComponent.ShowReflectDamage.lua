return function (self,mob,damage,attacker) 
---@type DamageInfo
local damageInfo = {}
damageInfo.Damage = damage
damageInfo.Critical = false
damageInfo.AttackIdx = 1
damageInfo.SkillId = 0

local playHitSound = attacker == self.Entity.OwnerId
mob.MobComponent:DoDamageEffect(damageInfo, playHitSound)
end