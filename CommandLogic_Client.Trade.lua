return function (self,user,argc,args) 
if (argc < 2) then
	return false
end
if (not user.WsUser:IsAvailableInventoryOperation()) then
	return
end
local targetName = args[2]
local target = _UserDictionary:FindUserInMapByName(targetName)
if (target ~= nil and target.CurrentMapName == _UserService.LocalPlayer.CurrentMapName) then
	if (target ~= _UserService.LocalPlayer) then
		_TradingRoomLogic:InviteTradeByCharacterId(target.WsUser.CharacterId)
		return true
	end
end
_ChatMessageLogic:Add(_ChatMessageType.Red, "캐릭터를 찾을 수 없습니다")
return true
end