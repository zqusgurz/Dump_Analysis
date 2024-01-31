return function (self,applyUserID) 
local panel = _EntityService:GetEntityByPath("/ui/UIGroup/WhiteUI/PartyApplyPopup")
panel:GetChildByName("UIText").TextComponent.Text = applyUserID.PlayerComponent.Nickname.." 님이\n당신파티에 가입 신청을 했습니다.\n수락하시겠습니까?"
panel.Enable = true
_SoundService:PlaySound("50caeaa1f21f4f3ab3f70e9222eaca47", 1)
end