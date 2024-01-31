return function (self,m,attackIndex,left) 
self:SendMobAttackStepAck(m, attackIndex, 10, os.clock())
local mob = m.MobComponent
if (not isvalid(mob) or mob.DeadType ~= -1) then
	self:SendMobAttackStepAck(m, attackIndex, 11, os.clock())
	return
end
---@type MobTemplate
local template = mob.Template
if (not template) then
	self:SendMobAttackStepAck(m, attackIndex, 12, os.clock())
	return
end
---@type table<MobAttackInfo>
local attacks = template.Attacks
local time = os.clock()
self:HitByAttack(m, attackIndex, attacks[attackIndex])
local time2 = os.clock()
self:SendMobAttackStepAck(m, attackIndex, 13, os.clock())
end