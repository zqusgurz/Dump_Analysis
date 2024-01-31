return function (self,data,index) 
local party = _UtilLogic:StringToTable(data)
local panel = _SpawnService:SpawnByEntity(_EntityService:GetEntityByPath("/ui/UIGroup/Model_EmptyEntity/PartyInfo/RightPanel/Scroll_Layout/0_0"), "0_"..tostring(party.partyID), Vector3.zero)

panel:GetChildByName("LeaderName").TextComponent.Text = party.leaderID
panel:GetChildByName("PartyName").TextComponent.Text = party.partyName
panel:GetChildByName("Category").TextComponent.Text = party.partyID.." 채널"
table.insert(self.parties, panel)
panel.PartyPanelText.index = index
panel.PartyPanelText.chanel = tostring(party.partyID)
end