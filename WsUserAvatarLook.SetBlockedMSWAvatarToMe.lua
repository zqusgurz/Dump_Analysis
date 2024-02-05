return function (self,enabled) 
local localPlayer = _UserService.LocalPlayer
local userId = self.Entity.OwnerId
if (localPlayer.OwnerId == userId) then
	return -- 나는 왜
end
local h, user = _UserService.Users:TryGetValue(userId)
if (h) then
	local beforeOptionsString = localPlayer.PlayerOptionComponent:GetString("BlockAvatar", "{}")
	local beforeOptions = _HttpService:JSONDecode(beforeOptionsString)
	if (enabled) then
		beforeOptions[userId] = {UserId=userId, ProfileCode=user.ProfileCode, Nickname=user.Nickname}
	else
		beforeOptions[userId] = nil
	end
	localPlayer.PlayerOptionComponent:SetString("BlockAvatar", _HttpService:JSONEncode(beforeOptions))
	self:UpdateMSWAvatarOnOff()
	self:UpdateUserInfoWindowAvatar()
end
end