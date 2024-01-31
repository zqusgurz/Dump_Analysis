return function (self,damage,skillId,skillLevel,mob,defaultAdjust) 
local mobTemplate = mob.MobComponent:GetTemplate()

if (skillId ~= 0 and skillLevel ~= 0) then
	if (skillId == _Skills.MAGE_FP_MAGIC_COMPOSITION) then
		local a = self:GetDamageAdjustedByElemAttr0(damage / 2, mobTemplate.ElemAttr[_ElementType.Fire], 1)
		local b = self:GetDamageAdjustedByElemAttr0(damage / 2, mobTemplate.ElemAttr[_ElementType.Poison], 1)
		damage = a + b
	elseif (skillId == _Skills.MAGE_IL_MAGIC_COMPOSITION) then
		local a = self:GetDamageAdjustedByElemAttr0(damage / 2, mobTemplate.ElemAttr[_ElementType.Ice], 1)
		local b = self:GetDamageAdjustedByElemAttr0(damage / 2, mobTemplate.ElemAttr[_ElementType.Light], 1)
		damage = a + b
	else
		local adjust = defaultAdjust
		local skillInfo = _SkillMan:GetSkill(skillId)
		local levelData = skillInfo:GetLevelData(skillLevel)
		if (skillId == _Skills.RANGER_FIRE_SHOT or skillId == _Skills.SNIPER_ICE_SHOT) then
			adjust = levelData.x / 100
		end
		if (skillInfo.ElemAttr ~= -1) then
			damage = self:GetDamageAdjustedByElemAttr0(damage, mobTemplate.ElemAttr[skillInfo.ElemAttr], adjust)
		end
	end
end
return damage
end