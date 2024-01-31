return function (self,member,totalMembers) 
if (isvalid(self.EmptyElement)) then
	self.EmptyElement:Destroy()
	self.EmptyElement = nil
end

---@type table<Entity>
local elements = self.Elements
for i=1,#elements do
	local element = elements[i]
	if (element.PartyMemberElementComponent.CharacterId == member.Id) then
		-- log("Already registered: ", i)
		return
	end
end

local newMember = _SpawnService:SpawnByModelId("model://9a0ff8b2-cb5e-4b70-ab36-ef4df657ca01", "PartyMember", Vector3.zero, self.MemberElements)
local elem = newMember.PartyMemberElementComponent
self:UpdateMember(elem, member)
elem:SetSelected(false)
elem:SetEnableInteractive()
table.insert(self.Elements, newMember)
self.MemberNumText.Text = string.format("%d/%d", #elements, totalMembers)
-- log("Added member: ", member.CharacterName)
end