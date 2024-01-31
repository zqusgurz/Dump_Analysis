return function (self,damage,user,mob) 
if (user.PlayerTemporaryStat:GetValue(_CTS.WeaponCharge) ~= 0) then
	local chargeSkillId = user.PlayerTemporaryStat:GetReason(_CTS.WeaponCharge)
	local chargeElement = _Skills:GetElementFromSkill(chargeSkillId)
	if (chargeElement ~= 0) then
		local chargeSLV = user.WsCharacterData:GetSkillLevel(chargeSkillId)
		if (chargeSLV ~= 0) then
			local levelData = _SkillMan:GetSkillLevelData(chargeSkillId, chargeSLV)
			local mobTemplate = mob.MobComponent:GetTemplate()
			damage *= levelData.damage / 100
			damage = self:GetDamageAdjustedByElemAttr0(damage, mobTemplate.ElemAttr[chargeElement], levelData.z / 100)
		end
	end
end
return damage
end