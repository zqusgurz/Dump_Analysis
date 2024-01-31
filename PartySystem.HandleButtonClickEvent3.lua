return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: ButtonComponent
-- Space: Client
---------------------------------------------------------
--맴버 보여주는거 열고 닫고
-- Parameters
local Entity = event.Entity
---------------------------------------------------------
local partyMemberPanel = self.memberPanel:GetChildByName("PartyMemberPanel")
partyMemberPanel.Enable = not partyMemberPanel.Enable
end