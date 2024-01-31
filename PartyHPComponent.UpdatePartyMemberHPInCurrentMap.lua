return function (self) 
---@type table<Entity>
local members = self.MemberListEntities
for i=1,#members do
	local member = members[i]
	local hpElement = member.PartyHPMemberElementComponent
	local user = _UserDictionary:FindUserInMap(hpElement.CharacterId)
	self:UpdatePartyMemberHP(hpElement.CharacterId, user)
	if (isvalid(user)) then
		user.WsUser:UpdateEntityHpBar()
	end
end
end