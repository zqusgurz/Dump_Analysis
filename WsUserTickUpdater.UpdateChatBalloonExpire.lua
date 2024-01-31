return function (self,u) 
if (u.ExpireChatBalloon > 0 and u.ExpireChatBalloon < _UtilLogic.ElapsedSeconds) then
	u.ExpireChatBalloon = 0
	u.Entity.ChatBalloonComponent.Message = ""
end
if (u.ExpirePetChatBalloon > 0 and u.ExpirePetChatBalloon < _UtilLogic.ElapsedSeconds) then
	u.ExpirePetChatBalloon = 0
	local pet = u.Entity.PetOwnerComponent.Pet
	if (isvalid(pet)) then
		pet.ChatBalloonComponent.Message = ""
	end
end
end