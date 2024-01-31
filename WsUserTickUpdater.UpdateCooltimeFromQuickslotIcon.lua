return function (self,skillId,durationMS) 
local statusBar = self.StatusBar
local quickslots = statusBar.QuickslotIcons
local funcKeyMapped = _InputManager.FuncKeyMapped
local skillType = _FuncKeyTypes.Skill
local cd = self.Entity.WsCharacterData
for i=1,#quickslots do
	---@type KeyConfigElementComponent
	local quickSlot = quickslots[i]
	local cooltime = quickSlot.CooltimeDisplayer
	if (isvalid(cooltime)) then
		local key = KeyboardKey.CastFrom(quickSlot.KeyType)
		---@type FuncKey
		local func = funcKeyMapped[key]
		if (func == nil or func.FuncType ~= skillType) then
			continue
		end
		if (skillId ~= func.Id) then
			continue
		end
		local value = 1
		if (durationMS > 0) then
			local levelData = _SkillMan:GetSkillLevelData(skillId, cd:GetSkillLevel(skillId))
			if (levelData == nil) then
				continue
			end
			local totalCooltime = levelData.cooltime * 1000
			if (totalCooltime <= 0) then
				continue
			end
			value = math.min(14 / 15, 1 - (durationMS / totalCooltime))
			cooltime.Entity.Enable = true
			--log(string.format("skill: %d  totalCooltime: %d  durationMS: %d  (value=%.3f)", skillId, totalCooltime, durationMS, value))
		else
			cooltime.Entity.Enable = false
			--log(string.format("skill: %d  value=1", skillId))
		end
		cooltime:SetValue(value)
	end
end
end