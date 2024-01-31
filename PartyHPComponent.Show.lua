return function (self) 
local hp = self.Entity
if (not hp.Enable) then
	_ControlWindowLogic:EnsureWindowIsInScreen(hp)
end
---@type table<Entity>
local members = self.MemberListEntities
self:UpdatePartyMemberHPInCurrentMap()
self:ResizeControlSize()
hp.Enable = true
end