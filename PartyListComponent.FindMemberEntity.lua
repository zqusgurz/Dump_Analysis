return function (self,id) 
---@type table<Entity>
local elements = self.Elements
for i=1,#elements do
	local element = elements[i]
	if (element.PartyMemberElementComponent.CharacterId == id) then
		return element
	end
end
return nil
end