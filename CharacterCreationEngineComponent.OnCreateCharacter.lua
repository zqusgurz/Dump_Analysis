return function (self) 
local name = _UtilLogic:Replace(self.NameText.Text, "\n", "")
local len = _Slangs:GetStringByteLength(name)
if (len < 4 or len > 12) then
	self.LoginEngine:OnCheckLoginResult(_LoginError.UnavailableName)
	return
end
if (not _Slangs:IsAllowedCharacterName(name, _UserService.LocalPlayer.WsUser.AdminLevel)) then
	self.LoginEngine:OnCheckLoginResult(_LoginError.UnavailableName)
	return
end
self:SetDisabled(true)
self:RequestCreateCharacter(name, self.Face, self.Hair, 0, self.Top, self.Pants, self.Shoes, self.Weapon, self.Gender)
end