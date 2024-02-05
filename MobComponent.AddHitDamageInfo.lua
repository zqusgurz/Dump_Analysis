return function (self,hit,_damages,damagePerMob) 
---@type table<DamageInfo>
local damages = _damages
local totalDamage = 0
for i=1,damagePerMob do
	local damage = damages[i]
	damage.DamagePos = self.Entity.TransformComponent.WorldPosition:Clone()
	totalDamage += damage.Damage
	self.RegisteredDamageInfo += 1
	_TimerService:SetTimerOnce(function()
		self:DoDamageEffect(damage, true)
	end, damage.Delay)
end
if (totalDamage > 0) then
	self.RegisteredHitEffect += 1
	local hitDelay = hit.Delay
	if (hit.SkillId > 0) then
		local skill = _SkillMan:GetSkill(hit.SkillId)
		if (skill) then
			hitDelay -= skill.HitAfter
		end
	end
	_TimerService:SetTimerOnce(function()
		self:DoHitEffect(hit)
	end, hitDelay)
end
end