return function (self,attackType,attacks,mobCount,damagePerMob,skillId,skillLevel,action,masteryLevel,left,actionDelay,remoteAttackInfo,fromUserId) 
if (fromUserId == _UserService.LocalPlayer.OwnerId) then
	return
end
local user = self.Entity
if (not _EntityUtils:IsSameMapWithMe(self.Entity)) then
	return -- NOTE: useless?
end

---@type RemoteAttackInfo
local remote = remoteAttackInfo

local body = user.AvatarRendererComponent:GetBodyEntity()
local ac = user.CharacterActionComponent
local magic = attackType == _AttackType.Magic

local playRate = (ac:GetWeaponAttackSpeed(magic) + 10) / 16
local damageInfos = _PlayerAttackLogic:MakeDamageInfos(user, attacks, mobCount, skillId, skillLevel, left, false)
local hitEffects = _PlayerAttackLogic:MakeHitEffects(user, attackType, attacks, mobCount, skillId, skillLevel, action)
local actionName = _CharacterAction:GetActionString(action)
local sfx = attackType ~= _AttackType.Magic

if (attackType == _AttackType.Shoot) then
	local ballBullet = _PlayerAttackLogic_Shoot:HasBallBulletSkill(skillId)
	local shootDelay = _PlayerAttackLogic_Shoot:GetShootDelay(skillId, actionDelay)
	local startPos = user.TransformComponent.WorldPosition:ToVector2()
	startPos.y += 0.28
	if (left) then
		startPos.x -= remote.ShootRange
	else
		startPos.x += remote.ShootRange
	end
	user.EffectDisplayerComponent:RegisterBulletEffect(startPos, remote.HitPt, remote.ShootTarget, remote.ShootTargetHitOffset, shootDelay, skillId, skillLevel, remote.BulletItem, left, ballBullet, remote.SoulArrow, remote.BulletSpeed)
elseif (attackType == _AttackType.Magic) then
	if (not _PlayerAttackLogic_Magic:IsRectAttackMagicSkill(skillId)) then
		if (skillId ~= _Skills.ARCHMAGE_IL_CHAIN_LIGHTNING) then
			local startPos = user.TransformComponent.WorldPosition:ToVector2()
			startPos.y += 0.28
			if (left) then
				startPos.x -= 0.5
			else
				startPos.x += 0.5
			end
			user.EffectDisplayerComponent:RegisterBulletEffect(startPos, remote.HitPt, remote.ShootTarget, remote.ShootTargetHitOffset, actionDelay, skillId, skillLevel, 0, left, true, 0, remote.BulletSpeed)
		end
	end
end

_PlayerAttackLogic:ProcessHitDamageInfo(skillId, mobCount, damagePerMob, attacks, damageInfos, hitEffects, false)
if (attackType ~= _AttackType.Magic) then
	ac:RegisterAfterimage(action, masteryLevel, left, actionDelay, sfx)
end

_PlayerAttackLogic:PlayAction(user, body, nil, actionName, ac:GetWeaponAttackSpeed(magic))
end