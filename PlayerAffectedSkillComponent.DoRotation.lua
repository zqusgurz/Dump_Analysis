return function (self) 
local list = self.AffectedList
if (#list == 0) then
	return
end
local index = (self.CurrentRotationIndex % (#list)) + 1
for i=1,#list do
	---@type PlayerAffectedSkillEntry
	local entry = list[i]
	if (index == i) then
		self:EnsureMakeHeadGroup()
		local ret = nil
		if (entry.Pos == 0) then
			ret = self.Entity.EffectDisplayerComponent:PlayEffect(entry.Uol, self.BodyGroup, Vector3.zero, true, true, nil)
		elseif (entry.Pos == 1) then
			ret = self.Entity.EffectDisplayerComponent:PlayEffect(entry.Uol, self.HeadGroup, Vector3.zero, true, true, nil)
		elseif (entry.Pos == 2) then
			ret = self.Entity.EffectDisplayerComponent:PlayEffect(entry.Uol, self.CenterGroup, Vector3.zero, true, true, nil)
		end
		if (ret) then
			if (type(ret) == "number") then
				entry.EffectSN = ret
			else
				entry.EffectEntity = ret
			end
		end
	else
		self:ReleaseEntry(entry)
	end
end
self.CurrentRotationIndex += 1
end