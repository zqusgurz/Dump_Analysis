return function (self,member) 
local before = self.SelectedPartyMember
if (isvalid(before)) then
	before:SetSelected(false)
end
if (isvalid(member) and not _UtilLogic:IsNilorEmptyString(member.CharacterId)) then
	self.SelectedPartyMember = member
	member:SetSelected(true)
else
	self.SelectedPartyMember = nil
end
self:UpdateButton()
end