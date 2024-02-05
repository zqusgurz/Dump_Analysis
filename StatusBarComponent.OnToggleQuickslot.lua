return function (self) 
if (not _UserService.LocalPlayer.WsUser:IsAvailableInventoryOperation()) then
	return
end
if (self.IsQuickslotUpper) then
	self.Quickslot.Enable = not self.Quickslot.Enable
end
end