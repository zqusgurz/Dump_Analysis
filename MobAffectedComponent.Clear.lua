return function (self) 
---@type table<MobAffectedSkillEntry>
local list = self.CurrentAffectedList
for i=1,#list do
	self:ReleaseEntry(list[i])
end

if (self.RotationNonIconTimer ~= -1) then
	_TimerService:ClearTimer(self.RotationNonIconTimer)
	self.RotationNonIconTimer = -1
end

self.CurrentNonIconIndex = 0
self.CurrentNonIconList = {}
self.CurrentAffectedList = {}
end