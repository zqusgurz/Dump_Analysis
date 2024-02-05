return function (self,id,totalMembers) 
---@type table<Entity>
local elements = self.Elements
for i=1,#elements do
	local element = elements[i]
	if (element.PartyMemberElementComponent.CharacterId == id) then
		element:Destroy()
		table.remove(self.Elements, i)
		self.MemberNumText.Text = string.format("%d/%d", #elements, totalMembers)
		break
	end
end
if (#elements == 0) then
	if (not isvalid(self.EmptyElement)) then
		self:MakeEmptyElement()
	end
end
log("Removed member: ", id)
end