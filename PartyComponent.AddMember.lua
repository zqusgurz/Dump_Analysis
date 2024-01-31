return function (self,pos,mem) 
_LocalPartyLogic:AddMember(pos, mem)
local partyMemberCount = _LocalPartyLogic:GetPartyMemberCount()
if (mem.Map == _PartyMemberMap.Offline) then
	self.Offline:AddMember(mem, partyMemberCount)
else
	self.Online:AddMember(mem, partyMemberCount)
	self:UpdatePartyMemberMinimap(mem.Id)
end
self:AdjustPartyListHeight()

local user = _UserDictionary:FindUserInMap(mem.Id)
self.HpBarEntity.PartyHPComponent:AddMember(mem)
self.HpBarEntity.PartyHPComponent:UpdatePartyMemberHP(mem.Id, user)
if (isvalid(user)) then
	user.WsUser:UpdateEntityHpBar()
end
end