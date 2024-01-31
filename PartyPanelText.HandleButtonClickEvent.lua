return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: ButtonComponent
-- Space: Client
---------------------------------------------------------

-- Parameters
local Entity = event.Entity
---------------------------------------------------------
local partySystem = _EntityService:GetEntityByPath("/common").PartySystem
partySystem:RightPanelServer(self.index, self.Entity:GetChildByName("PartyName").TextComponent.Text, _UserService.LocalPlayer.PlayerComponent.UserId, self.chanel)
partySystem.voidClickParty = self.Entity
end