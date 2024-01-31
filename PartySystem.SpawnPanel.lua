return function (self,data) 
local party = _UtilLogic:StringToTable(data)
if isvalid(party.leaderID) == false or party.partyName == nil or party.partyName == "이름없음(비공개)" then
	return
end
local panel = _SpawnService:SpawnByEntity(_EntityService:GetEntityByPath("/ui/UIGroup/Model_EmptyEntity/PartyInfo/RightPanel/Scroll_Layout/0"), tostring(party.partyID), Vector3.zero)
table.insert(self.parties, panel)
local function handler()
	self._T.clickID = tonumber(panel.Name)
end
panel:ConnectEvent(ButtonClickEvent, handler)
panel:GetChildByName("LeaderName").TextComponent.Text = party.leaderID.PlayerComponent.Nickname
panel:GetChildByName("PartyName").TextComponent.Text = party.partyName
panel:GetChildByName("Category").TextComponent.Text = party.category
panel.PartyPanelText.index = tonumber(party.partyID)
panel.PartyPanelText.chanel = "현재"
end