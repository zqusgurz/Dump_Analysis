return function (self,skillId,skillLevel,includeLevelData) 
local skill = _SkillMan:GetSkill(skillId)
if (skill == nil) then
	log_warning(string.format("skill %d is nil", skillId))
	return
end

self.Icon.ImageRUID = skill.Icon
	
-- Skill Name
self.SkillName.Text = _StringMan:GetSkillName(skillId)

-- Measure LevelDesc Size
local levelDescHeight = 0
local levelDescSize = 286 - 8

if (includeLevelData) then
	local currentLevelData = self:GetSkillLevelDesc(skillId, skillLevel)
	local nextLevelData = self:GetSkillLevelDesc(skillId, skillLevel + 1)
	local texts = {}
	if (not _UtilLogic:IsNilorEmptyString(currentLevelData)) then
		table.insert(texts, string.format("[현재레벨 %d]", skillLevel))
		table.insert(texts, currentLevelData)
	end
	if (not _UtilLogic:IsNilorEmptyString(nextLevelData)) then
		table.insert(texts, string.format("[다음레벨 %d]", skillLevel + 1))
		table.insert(texts, nextLevelData)
	end
	
	local levelDesc = table.concat(texts, "\n")
	local textWidth = self.LevelDesc:GetPreferredWidth(levelDesc) / 2
	levelDescSize = math.max(levelDescSize, textWidth)
	levelDescHeight = math.ceil(self.LevelDesc:GetPreferredHeight(levelDesc, levelDescSize * 2) / 2)
	self.LevelDesc.Text = levelDesc
end

-- Measure SkillDesc Size
local desc = _StringMan:GetSkillDesc(skillId)
local cDesc = string.gsub(string.gsub(desc, "#c", ""), "#", "")
local uDesc = string.gsub(string.gsub(desc, "#", "</color>"), "</color>c", "<color=\"#FF9900\">")
local skillDescWidth = levelDescSize - 88
self.SkillDesc.UseNBSP = true
local width = levelDescSize + 8
local descSize = self.SkillDesc:GetPreferredHeight(cDesc, skillDescWidth * 2) / 2
self.SkillDesc.Text = uDesc
local moreNeedHeight = math.max(0, descSize - 80)
local padding = 12
local height = 112 + moreNeedHeight + levelDescHeight + padding

if (includeLevelData) then
	self.LevelDescLine.Enable = true
	self.LevelDesc.Entity.Enable = true
	_EntityUtils:SetUIEntitySafelyEx(self.LevelDescLine, nil, -(112 + moreNeedHeight), levelDescSize, nil)
else
	self.LevelDescLine.Enable = false
	self.LevelDesc.Entity.Enable = false
end

-- Resize Tooltip size
self.Entity.UITransformComponent.anchoredPosition = Vector2(-10000, -10000)
_EntityUtils:SetRectSizeUIEntitySafelyEx(self.Entity, width, height)

if (includeLevelData) then
	_EntityUtils:SetUIEntitySafelyEx(self.LevelDesc.Entity.Parent, 4, 4, width, levelDescHeight)
	_EntityUtils:SetRectSizeUIEntitySafelyEx(self.LevelDesc.Entity, width, levelDescHeight)
end
_EntityUtils:SetUIEntitySafelyEx(self.SkillDesc.Entity.Parent, 88, -31, width, descSize)
_EntityUtils:SetRectSizeUIEntitySafelyEx(self.SkillDesc.Entity, skillDescWidth, descSize) -- 'width' ==> 'levelDescSize - 88'
end