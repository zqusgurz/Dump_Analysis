return function (self,pos,payload) 
---@type PartyMember
local mem = payload
local localUser = _UserService.LocalPlayer.WsUser
if (localUser.CharacterId == mem.Id) then
	_ChatMessageLogic:Add(_ChatMessageType.Red, "파티에 가입되었습니다.")
else
	if (_LocalPartyLogic.LocalParty) then
		_AppService:Get().ControlWindowMan.UserList.UserListComponent.Party:AddMember(pos, mem)	
	end
	_ChatMessageLogic:Add(_ChatMessageType.Red, string.format("'%s'님이 파티에 가입하셨습니다", mem.CharacterName))
end
end