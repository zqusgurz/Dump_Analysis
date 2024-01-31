return function (self,blockedUsers) 
for _,tab in pairs(blockedUsers) do
	local user = _UserDictionary:FindUserInMap(tab.UserId)
	if (user) then
		user.WsUserAvatarLook:UpdateMSWAvatarOnOff()
	end
end
end