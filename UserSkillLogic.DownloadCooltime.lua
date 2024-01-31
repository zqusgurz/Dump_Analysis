return function (self,cd,skillId,time) 
if (time == 0) then
	cd.SkillCooltime[skillId] = nil
else
	cd.SkillCooltime[skillId] = time	
end
cd.Entity.WsUserTickUpdater:UpdateCooltimeFromQuickslotIcon(skillId, time)
end