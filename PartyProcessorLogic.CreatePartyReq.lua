return function (self) 
local user = _UserService.LocalPlayer
local u = user.WsUser
if (u.PartyId ~= 0) then
	_ChatMessageLogic:Add(_ChatMessageType.Red, "이미 가입한 파티가 있습니다")
	return
end
self:OnCreatePartyReq(user)
end