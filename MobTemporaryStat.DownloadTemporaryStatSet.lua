return function (self,statTable) 
self.__AbstractTemporaryStat__.DownloadTemporaryStatSet(self, statTable)
if (statTable[_MTS.Speed] or statTable[_MTS.Freeze] or statTable[_MTS.Stun] or statTable[_MTS.Web]) then
	self.Entity.MobComponent:SetShoeAttr()
end
self.Entity.MobAffectedComponent:UpdateDelayedAffectedSkillList(statTable.Delay)
end