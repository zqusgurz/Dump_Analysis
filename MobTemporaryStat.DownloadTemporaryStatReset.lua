return function (self,stats) 
self.__AbstractTemporaryStat__.DownloadTemporaryStatReset(self, stats)
local hasImmovableStat = false
for i=1,#stats do
	if (stats[i] == _MTS.Speed or stats[i] == _MTS.Freeze or stats[i] == _MTS.Stun or stats[i] == _MTS.Web) then
		self.Entity.MobComponent:SetShoeAttr()
	end
end
self.Entity.MobAffectedComponent:UpdateDelayedAffectedSkillList(0)
end