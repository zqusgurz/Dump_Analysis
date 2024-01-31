return function (self) 
if (self.Type == "Name") then
	return string.format("%s (%s\\#%s) / CH.%s (%s) / %s", 
		_UserService.LocalPlayer.OwnerId,
		_UserService.LocalPlayer.WsUser.Nickname,
		_UserService.LocalPlayer.WsUser.ProfileCode,
		_DevLogic.ChannelName,
		_WorldInstanceService.WorldInstanceId:sub(1, 6),
		_UserService.LocalPlayer.WsUser.FullName)
elseif (self.Type == "Exp") then
	return string.format("EXP : %d / %d",
		_UserService.LocalPlayer.WsCharacterData.Exp,
		_PlayerStatLogic:GetNextExp(_UserService.LocalPlayer.WsCharacterData.Level))
end
return ""
end