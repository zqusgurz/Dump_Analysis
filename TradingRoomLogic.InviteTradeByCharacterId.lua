return function (self,characterId) 
local targetUser = _UserDictionary:FindUserInMap(characterId)
if (targetUser) then
	self:RequestTrade(_UserService.LocalPlayer, targetUser)
else
	_UtilDlgLogic:Show("같은 맵에 있을 때에만\n교환이 가능합니다.")
end
end