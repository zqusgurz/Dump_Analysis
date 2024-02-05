return function (self,id) 
---@type table<Entity>
local elements = self.Elements
for i=1,#elements do
	local element = elements[i]
	local elementComp = element.PartyMemberElementComponent
	elementComp.LeaderIcon.Enable = elementComp.CharacterId == id
end
end