return function (self,user,attackType,attacks,mobCount,skillId,skillLevel,action) 
local ac = user.CharacterActionComponent

---@type table<HitEffectInfo>
local hitEffects = {}

local effectType = 0
if (attackType == _AttackType.Melee) then
	effectType = ac.CurrentWeaponType
elseif (attackType == _AttackType.Shoot) then
	effectType = _WeaponType.OneHandedMace
end

local index = 1

for i=1,mobCount do
	---@type AttackInfo
	local a = attacks[i]
	local delay = a.DelayBase
	local left = user.WsUserController:IsFacingLeft()
	---@type HitEffectInfo
	local hitEffect = {}
	hitEffect.Delay = delay
	hitEffect.SkillId = skillId
	hitEffect.SkillLevel = skillLevel
	hitEffect.Left = left
	hitEffect.Sfx = false
	hitEffect.HitOffset = a.HitOffset
	hitEffect.AttackMobIndex = i
	hitEffect.WeaponType = effectType
	hitEffect.PlayerAction = action
	hitEffects[index] = hitEffect
	index += 1
end

return hitEffects
end