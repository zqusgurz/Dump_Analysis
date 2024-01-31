return function (self) 
local user = _UserService.LocalPlayer
local cd = user.WsCharacterData
local avatarLook = {}
for k,v in pairs(self.CurrentEquippingAvatar) do
	avatarLook[k] = v
end
for k,v in pairs(self.CurrentCartAvatar) do
	avatarLook[k] = v[2]
end
_PlayerCostumeLogic:UpdateCustomCostume(user.OwnerId, false, self.Avatar.CostumeManagerComponent, cd.Gender, cd.Face, cd.Hair, cd.Skin, avatarLook, user.WsUserAvatarLook.MSWAvatarForPart)
end