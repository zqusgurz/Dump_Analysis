return function (self) 
---@type Party
local party = _LocalPartyLogic.LocalParty
self:ClearEntityHpBar()
local partyMemberCount = _LocalPartyLogic:GetPartyMemberCount()
-- log("party member count: ", partyMemberCount)
self:UpdateClearMemberMinimap(self.Online)
self:UpdateClearMemberMinimap(self.Offline)
self.Online:ClearMember(partyMemberCount)
self.Offline:ClearMember(partyMemberCount)
self.HpBarEntity.PartyHPComponent:ClearMember()
local onlineMembers, offlineMembers = 0, 0
if (party ~= nil) then
	for i=1,_PartyLogic.MaxPartyMember do
		---@type PartyMember
		local mem = party.Member[i]
		if (mem) then
			-- log("Adding party member: ", i)
			if (mem.Map == _PartyMemberMap.Offline) then
				self.Offline:AddMember(mem, partyMemberCount)
				offlineMembers += 1
			else
				self.Online:AddMember(mem, partyMemberCount)
				self:UpdatePartyMemberMinimap(mem.Id)
				onlineMembers += 1
			end
			self.HpBarEntity.PartyHPComponent:AddMember(mem)
		end
	end
end
if (onlineMembers == 0) then
	self.Online:MakeEmptyElement()
end
if (offlineMembers == 0) then
	self.Offline:MakeEmptyElement()
end
self:SelectPartyMember(nil)
self:UpdateButton()
self:AdjustPartyListHeight()
if (party ~= nil) then
	self.HpBarEntity.PartyHPComponent:Show()
else
	self.HpBarEntity.Enable = false
end
end