return function (self,partyData) 
local party = _UtilLogic:StringToTable(partyData)
local senderID = party.senderID
local partyID = party.partyID
if self.partyID ~= 0 then
	return
end
--파티 ui에 표시하기
self.invitePopup.Enable = true
self.invitePopup:GetChildByName("UIText").TextComponent.Text = senderID.PlayerComponent.Nickname.." 님으로 부터 초대가 왔습니다.\n수락하시겠습니까?"
_SoundService:PlaySound("50caeaa1f21f4f3ab3f70e9222eaca47", 1)
end