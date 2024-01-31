return function (self) 
local width = 300
---@type table<Entity>
local members = self.MemberListEntities
if (#members == 0) then
	self.Entity.Enable = false
	return
end
for i=1,#members do
	local member = members[i]
	local hpElement = member.PartyHPMemberElementComponent
	local elementWidth = 8 + hpElement.Name.Entity.UITransformComponent.RectSize.x + 42 + 138 + 12
	if (width < elementWidth) then
		width = elementWidth
	end
	member.UITransformComponent.anchoredPosition = Vector2(0, (i-1) * -36)
end
local height = 4 + (36 * #members) + 4
self.Entity.UITransformComponent.RectSize = Vector2(width, height)
end