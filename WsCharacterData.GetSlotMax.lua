return function (self,itemId) 
if (_Items:IsEquip(itemId)) then
	return 1
end
local item = _ItemInfoMan:GetItem(itemId)
if (item ~= nil and item.i_slotMax > 0) then
	local ret = item.i_slotMax
	if (itemId // 10000 == 207) then
		local jmLv = self:GetSkillLevel(_Skills.ASSASSIN_JAVELIN_MASTERY)
		if (jmLv > 0) then
			local levelData = _SkillMan:GetSkillLevelData(_Skills.ASSASSIN_JAVELIN_MASTERY, jmLv)
			ret += levelData.y
		end
	end
	return ret
end
return 100
end