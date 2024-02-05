return function (self,fromName,job,level,partyId) 
local alarmMan = _AppService:Get().AlarmMan
local localUser = _UserService.LocalPlayer
if (localUser.PlayerOptionComponent:GetNumber("Party", 1) == 0) then
	self:DeclineParty(localUser, partyId, _PartyDeclineReason.Alarm_Reject)
	return
end
if (alarmMan.PartyAlarm.EnabledInHierarchy) then
	self:DeclineParty(localUser, partyId, _PartyDeclineReason.Alarm_AlreadyPopup)
	return
end
alarmMan:ShowPartyInviteAlarm(fromName, job, level, partyId)
end