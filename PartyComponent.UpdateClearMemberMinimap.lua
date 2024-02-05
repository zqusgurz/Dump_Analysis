return function (self,list) 
---@type table<Entity>
local elements = list.Elements
for i=1,#elements do
	local element = elements[i]
	self:UpdatePartyMemberMinimap(element.PartyMemberElementComponent.CharacterId)
end
end