return function (self) 
local nonIconList = self.CurrentNonIconList
local index = self.CurrentNonIconIndex
if (#nonIconList > 2) then
	---@type MobAffectedSkillEntry
	local before = nonIconList[index]
	if (before and before.Entity) then
		before.Entity.Enable = false
	end
end

if (index + 1 > #nonIconList) then
	self.CurrentNonIconIndex = 1
else
	self.CurrentNonIconIndex = index + 1
end

---@type MobAffectedSkillEntry
local entry = nonIconList[self.CurrentNonIconIndex]
if (entry) then
	local entity = entry.Entity
	if (entity) then
		entity.Enable = true
	end
end
end