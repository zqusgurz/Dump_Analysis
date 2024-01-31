return function (self,damage,playHitSound) 
local localUser = _UserService.LocalPlayer
local mob = self.Entity
local mobPos = mob.TransformComponent.WorldPosition

if (playHitSound) then
	local hitSound = _EffectLogic:GetMobHitSound(damage.SkillId, self:GetLinkOriginTemplateId(), false)
	_SoundService:PlaySoundAtPos(hitSound, mobPos, localUser, 1)
end

-- TODO 데미지 표시 좌표를 몹의 head로 조정하기
localUser.EffectDisplayerComponent:Effect_HP(damage.Damage, mobPos, damage.Critical, damage.AttackIdx, true)
self.RegisteredDamageInfo -= 1
end