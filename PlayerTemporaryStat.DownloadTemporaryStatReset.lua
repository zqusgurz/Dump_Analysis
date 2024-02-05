return function (self,stats) 
self.__AbstractTemporaryStat__.DownloadTemporaryStatReset(self, stats)
if (self.Entity == _UserService.LocalPlayer) then
	self:UpdateTemporaryStatView(stats, false)
end
local keys = {}
for i=1,#stats do
	keys[stats[i]] = true
end
self.Entity.PlayerAffectedSkillComponent:UpdateDelayedAffectedSkillList(keys, 0)
end