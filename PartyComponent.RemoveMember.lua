return function (self,id) 
self:SelectPartyMember(nil)
_LocalPartyLogic:RemoveMember(id)
local partyMemberCount = _LocalPartyLogic:GetPartyMemberCount()
self.Online:RemoveMember(id, partyMemberCount)
self.Offline:RemoveMember(id, partyMemberCount)
self:UpdatePartyMemberMinimap(id)
self:AdjustPartyListHeight()
self.HpBarEntity.PartyHPComponent:RemoveMember(id)
local user = _UserDictionary:FindUserInMap(id)
if (isvalid(user)) then
	user.WsUser:DestroyEntityHpBar()
end
end