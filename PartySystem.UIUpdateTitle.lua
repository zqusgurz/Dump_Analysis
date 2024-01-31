return function (self,partyName,category) 
local default = _EntityService:GetEntityByPath("/ui/DefaultGroup/PartyDefault")
local categoryUI = _EntityService:GetEntityByPath("/ui/UIGroup/Model_EmptyEntity/PartyInfo/Category")
if partyName == nil then
	self.memberPanel.Enable = false
	default.Enable = false
else
	self.memberPanel.Enable = true
	self.memberPanel:GetChildByName("PartyName").TextComponent.Text = partyName
	default.Enable = true
end
end