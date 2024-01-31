return function (self,statTable) 
self.__AbstractTemporaryStat__.DownloadTemporaryStatSet(self, statTable)
if (self.Entity == _UserService.LocalPlayer) then
	self:UpdateTemporaryStatView(statTable.Key, true)
end
self.Entity.PlayerAffectedSkillComponent:UpdateDelayedAffectedSkillList(statTable, statTable.Delay)
end