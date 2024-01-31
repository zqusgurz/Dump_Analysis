return function (self,event) 
-- Parameters
local Function = event.Function
local Entity = event.Entity
---------------------------------------------------------
if (Function == "LoginErrorYes") then
	local callback = self.IdentifyPopupCallbackYes
	self.IdentifyPopupCallbackYes = nil
	self.IdentifyPopupCallbackNo = nil
	if (callback) then
		if (callback()) then
			return
		end
	end
	self:OnIdentifyPopupOk()
elseif (Function == "LoginErrorNo") then
	local callback = self.IdentifyPopupCallbackNo
	self.IdentifyPopupCallbackYes = nil
	self.IdentifyPopupCallbackNo = nil
	if (callback) then
		if (callback()) then
			return
		end
	end
	self:OnIdentifyPopupOk()
elseif (Function == "BtIdentify") then
	self:RequestIdentify(_UserService.LocalPlayer, false)
end
end