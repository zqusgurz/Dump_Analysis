return function (self,delta) 
if (self:IsServer()) then
	self:UpdateServer()
else
	local user = self.Owner
	if (user == _UserService.LocalPlayer) then
		local availableInv = 
			user.WsUser:IsAvailableInventoryOperation() and
			user.PlayerTemporaryStat:GetValue(_CTS.DarkSight) == 0 
		self.IsAbleToPick = availableInv
	end
end
end