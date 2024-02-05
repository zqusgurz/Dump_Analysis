return function (self) 
local entries = self.SkillEntries
for i=1,15 do
	entries[i] = self:CreateSkillEntry()
end
end