return function (self) 
_EntityService:GetEntityByPath("/ui/UIGroup/Model_EmptyEntity/PartyInfo/PartyInfoPanel/UIEmpty").Enable = false

local text = _EntityService:GetEntityByPath("/ui/UIGroup/Model_EmptyEntity/PartyInfo/PartyUITitle/Search").TextInputComponent.Text
if text == "" then
	for k, v in ipairs(self.parties) do
		v.Enable = true
	end
else
	for k, v in ipairs(self.parties) do
		if string.find(v:GetChildByName("PartyName").TextComponent.Text, text) then
			v.Enable = true
		else
			v.Enable = false
		end
	end
end
end