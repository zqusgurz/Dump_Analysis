return function (self) 
local localPlayer = _UserService.LocalPlayer
local userId = self.Entity.OwnerId
if (localPlayer.OwnerId == userId) then
	return false
end
return localPlayer.PlayerOptionComponent:IsBlockedMSWAvatarToMe(userId)
end