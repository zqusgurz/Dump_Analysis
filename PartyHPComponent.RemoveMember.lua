return function (self,id) 
---@type table<Entity>
local members = self.MemberListEntities
for i=1,#members do
	local member = members[i]
	local hpElement = member.PartyHPMemberElementComponent
	if (hpElement.CharacterId == id) then
		table.remove(members, i)
		member:Destroy()
		break
	end
end
self:ResizeControlSize()
end