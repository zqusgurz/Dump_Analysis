return function (self) 
---@type table<Entity>
local elements = self.Elements
for i=1,#elements do
	local element = elements[i]
	local pmem = element.PartyMemberElementComponent
	pmem:UpdateFontColor()
end
end