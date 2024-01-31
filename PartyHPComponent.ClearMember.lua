return function (self) 
---@type table<Entity>
local members = self.MemberListEntities
for i=1,#members do
	members[i]:Destroy()
end
self.MemberListEntities = {}
self:ResizeControlSize()
end