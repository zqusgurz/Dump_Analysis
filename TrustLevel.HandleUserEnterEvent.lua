return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: UserService
-- Space: Server
---------------------------------------------------------

-- Parameters
local UserId = event.UserId
---------------------------------------------------------
local trust = _UserService.Users[UserId].UserAccountTrustLevel
	
if trust == AccountTrustLevel.Level0 and _CalcLogic.Ser == 1 then
	_UIToast:ShowMessage("넥슨 계정 인증을 완료해주세요.", UserId)
	_UserService:KickUser(UserId, KickReason.RuleViolation)
end
end