return function (self,member) 
local partyMember = _UtilLogic:StringToTable(member)

local category = _EntityService:GetEntityByPath("/ui/UIGroup/Model_EmptyEntity/PartyInfo/Category")
local defaultParty = _EntityService:GetEntityByPath("/ui/DefaultGroup/PartyDefault")
if partyMember[1] == _UserService.LocalPlayer then
	defaultParty:GetChildByName("Button2").Enable = true
	defaultParty:GetChildByName("Button3").Enable = true
	defaultParty:GetChildByName("Button4").Enable = true
else
	defaultParty:GetChildByName("Button2").Enable = false
	defaultParty:GetChildByName("Button3").Enable = false
	defaultParty:GetChildByName("Button4").Enable = false
end
for i = 1, 6 do
	local panel = self.memberPanel:GetChildByName("PartyMemberPanel"):GetChildByName("member"..tostring(i))
	if partyMember[i] ~= nil then
		panel.Enable = true
        panel.TextComponent.Text = partyMember[i].PlayerComponent.Nickname
	else
		panel.Enable = false
	end
end
end