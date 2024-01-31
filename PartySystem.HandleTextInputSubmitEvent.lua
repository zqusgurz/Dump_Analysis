return function (self,event) 
--------------- Native Event Sender Info ----------------
-- Sender: TextInputComponent
-- Space: Client
---------------------------------------------------------

-- Parameters
local Text = event.Text
---------------------------------------------------------
self:FindUserByNickname(Text, _UserService.LocalPlayer.CurrentMap.Name, _UserService.LocalPlayer, self.partyID)
local inviteMessage = _EntityService:GetEntityByPath("/ui/UIGroup/Model_EmptyEntity/InviteMessage")
inviteMessage.Enable = false
end