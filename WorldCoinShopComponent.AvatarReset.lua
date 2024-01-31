return function (self,takeOff) 
local user = _UserService.LocalPlayer
self.CurrentEquippingAvatar = {}
if (not takeOff) then
	for k,v in pairs(user.WsCharacterData.AvatarLook) do
		self.CurrentEquippingAvatar[k] = v
	end
end
self.CurrentCartAvatar = {}
self:AvatarApply()
end