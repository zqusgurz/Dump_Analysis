return function (self) 
--log(string.format("Try Skill Up %d", self.SkillId))
if (self._T.LastTick ~= nil) then
	if (self._T.LastTick > _UtilLogic.ElapsedSeconds) then
		return
	end
end
self._T.LastTick = _UtilLogic.ElapsedSeconds + 0.5
local cd = _UserService.LocalPlayer.WsCharacterData
if (not _SkillMan:CheckSkillRoot(cd, self.SkillId)) then
	log_warning("failed to check skill root")
	return
end
if (not _SkillMan:CheckSkillLevel(cd, self.SkillId)) then
	log_warning("failed to check skill level")
	return
end
if (not _SkillMan:CheckSkillReq(cd, self.SkillId)) then
	log_warning("failed to check skill req")
	return
end
if (not _Skills:IsVisible(cd, self.SkillId, _SkillMan:GetSkill(self.SkillId))) then
	log_warning("try to up invisible skill")
	return
end
if (not _SkillMan:CheckPreviousSkillPoint(cd, self.SkillId)) then
	log_warning("failed to check previous skill point")
	local jobLevel = _Jobs:GetJobLevel(self.SkillId // 10000)
	if (jobLevel == 2) then
		_UtilDlgLogic:Show("1차 스킬이 부족합니다.")
	elseif (jobLevel == 3) then
		_UtilDlgLogic:Show("1차 또는 2차 스킬이 부족합니다.")
	elseif (jobLevel == 4) then
		_UtilDlgLogic:Show("1차 또는 2차 또는 3차 스킬이 부족합니다.")
	end
	return
end
_UserService.LocalPlayer.WsUser.ExclusiveAction = true
_UserRaiseLogic:TrySkillUp(_UserService.LocalPlayer, self.SkillId)
end